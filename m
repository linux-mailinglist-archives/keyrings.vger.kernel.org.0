Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 280842A276
	for <lists+keyrings@lfdr.de>; Sat, 25 May 2019 05:10:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726483AbfEYDKc (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Fri, 24 May 2019 23:10:32 -0400
Received: from mail.kernel.org ([198.145.29.99]:54324 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726452AbfEYDKc (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Fri, 24 May 2019 23:10:32 -0400
Received: from sol.localdomain (c-24-5-143-220.hsd1.ca.comcast.net [24.5.143.220])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 23B7D2133D;
        Sat, 25 May 2019 03:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1558753831;
        bh=U2oRTOcpkeVM7qIcjKuc6xKoiUqB+srYHDRhihvQ3B0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=qNHcMjSckav4mHS8pZXNIED0vHg+x3wwyIbWA0r7pFLJ9ysyjHOC+RbncO5dHPLX3
         EXbgROYyBQQFuQowh9qLwWcU2Cc4gHKeNMas23+cxDQrJmJ1A+C3ckQ4LbdOcRKIgD
         4plqUmHAdjCpN+T8oARhjBYO4d1tnGYYnZ6YMBWo=
Date:   Fri, 24 May 2019 20:10:29 -0700
From:   Eric Biggers <ebiggers@kernel.org>
To:     Ondrej Mosnacek <omosnace@redhat.com>
Cc:     linux-crypto@vger.kernel.org,
        Herbert Xu <herbert@gondor.apana.org.au>,
        keyrings@vger.kernel.org, David Howells <dhowells@redhat.com>,
        Stephan Mueller <smueller@chronox.de>,
        Milan Broz <gmazyland@gmail.com>,
        Ondrej Kozina <okozina@redhat.com>,
        Daniel Zatovic <dzatovic@redhat.com>
Subject: Re: [PATCH] crypto: af_alg - implement keyring support
Message-ID: <20190525031028.GA18491@sol.localdomain>
References: <20190521100034.9651-1-omosnace@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190521100034.9651-1-omosnace@redhat.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Tue, May 21, 2019 at 12:00:34PM +0200, Ondrej Mosnacek wrote:
> This patch adds new socket options to AF_ALG that allow setting key from
> kernel keyring. For simplicity, each keyring key type (logon, user,
> trusted, encrypted) has its own socket option name and the value is just
> the key description string that identifies the key to be used. The key
> description doesn't need to be NULL-terminated, but bytes after the
> first zero byte are ignored.
> 
> Note that this patch also adds three socket option names that are
> already defined and used in libkcapi [1], but have never been added to
> the kernel...
> 
> Tested via libkcapi with keyring patches [2] applied (user and logon key
> types only).
> 
> [1] https://github.com/smuellerDD/libkcapi
> [2] https://github.com/WOnder93/libkcapi/compare/f283458...1fb501c
> 
> Signed-off-by: Ondrej Mosnacek <omosnace@redhat.com>

The "interesting" thing about this is that given a key to which you have only
Search permission, you can request plaintext-ciphertext pairs with it using any
algorithm from the kernel's crypto API.  So if there are any really broken
algorithms and they happen to take the correct length key, you can effectively
read the key.  That's true even if you don't have Read permission on the key
and/or the key is of the "logon" type which doesn't have a ->read() method.

Since this is already also true for dm-crypt and maybe some other features in
the kernel, and there will be a new API for fscrypt that doesn't rely on "logon"
keys with Search access thus avoiding this problem and many others
(https://patchwork.kernel.org/cover/10951999/), I don't really care much whether
this patch is applied.  But I wonder whether this is something you've actually
considered, and what security properties you think you are achieving by using
the Linux keyrings.

- Eric
