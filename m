Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 07B122583D
	for <lists+keyrings@lfdr.de>; Tue, 21 May 2019 21:27:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727032AbfEUT1k (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 21 May 2019 15:27:40 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.54]:16187 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726771AbfEUT1k (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Tue, 21 May 2019 15:27:40 -0400
X-Greylist: delayed 535 seconds by postgrey-1.27 at vger.kernel.org; Tue, 21 May 2019 15:27:39 EDT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1558466858;
        s=strato-dkim-0002; d=chronox.de;
        h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=kCFO7SFB1HIUkXfd5v11/uS2m0Wg3ahQcV3NTGljcV4=;
        b=OYJjsniPJRzQRSZNZEPCdgFAZPm7TlVxdkx6Qv4s0PA/uuxXcJe+L8NVMMKa0JE28S
        m45OHqwKbTcBeXzZiIqybL7eS193UWwk6GpsuDhm45oCBtWcaQqyfyCvgnRMphIVqsAS
        nrr/rWrmq01UOhCXUk397voNZBQHaXcG/ngx6U2a+MKxkjBcnVSARvg3AH2QA1K823uD
        YpYoSsTSBqmu6/xzVRC/3x6ZQqrMZVVGUOCM+3UmBvUvP2aknj7VmnrtwupR7Z7hzlZ0
        4yqEWuy1dJvgl41m1hcZZzyBraq+d6PXX55FhyzkYl49PrSb+jyihRk0O1uqjpJlDJcz
        tixg==
X-RZG-AUTH: ":P2ERcEykfu11Y98lp/T7+hdri+uKZK8TKWEqNyiHySGSa9k9xmwdNnzGHXPbIvSffTKU"
X-RZG-CLASS-ID: mo00
Received: from positron.chronox.de
        by smtp.strato.de (RZmta 44.18 DYNA|AUTH)
        with ESMTPSA id R0373fv4LJFTCQs
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with 521 ECDH bits, eq. 15360 bits RSA))
        (Client did not present a certificate);
        Tue, 21 May 2019 21:15:29 +0200 (CEST)
From:   Stephan =?ISO-8859-1?Q?M=FCller?= <smueller@chronox.de>
To:     Ondrej Mosnacek <omosnace@redhat.com>
Cc:     linux-crypto@vger.kernel.org,
        Herbert Xu <herbert@gondor.apana.org.au>,
        keyrings@vger.kernel.org, David Howells <dhowells@redhat.com>,
        Milan Broz <gmazyland@gmail.com>,
        Ondrej Kozina <okozina@redhat.com>,
        Daniel Zatovic <dzatovic@redhat.com>
Subject: Re: [PATCH] crypto: af_alg - implement keyring support
Date:   Tue, 21 May 2019 21:15:29 +0200
Message-ID: <8758550.T3OrFO1o5E@positron.chronox.de>
In-Reply-To: <20190521100034.9651-1-omosnace@redhat.com>
References: <20190521100034.9651-1-omosnace@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Am Dienstag, 21. Mai 2019, 12:00:34 CEST schrieb Ondrej Mosnacek:

Hi Ondrej,

> This patch adds new socket options to AF_ALG that allow setting key from
> kernel keyring. For simplicity, each keyring key type (logon, user,
> trusted, encrypted) has its own socket option name and the value is just
> the key description string that identifies the key to be used. The key
> description doesn't need to be NULL-terminated, but bytes after the
> first zero byte are ignored.
>=20
> Note that this patch also adds three socket option names that are
> already defined and used in libkcapi [1], but have never been added to
> the kernel...
>=20
> Tested via libkcapi with keyring patches [2] applied (user and logon key
> types only).
>=20
> [1] https://github.com/smuellerDD/libkcapi
> [2] https://github.com/WOnder93/libkcapi/compare/f283458...1fb501c
>=20
> Signed-off-by: Ondrej Mosnacek <omosnace@redhat.com>

Thank you!

Reviewed-by: Stephan M=FCller <smueller@chronox.de>

If the patch goes in, I will merge the libkcapi patch set and create a new=
=20
release.

Ciao
Stephan


