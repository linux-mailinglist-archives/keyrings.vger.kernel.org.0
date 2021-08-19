Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 712B23F1218
	for <lists+keyrings@lfdr.de>; Thu, 19 Aug 2021 05:49:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235893AbhHSDuF (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 18 Aug 2021 23:50:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235806AbhHSDuE (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 18 Aug 2021 23:50:04 -0400
Received: from hr2.samba.org (hr2.samba.org [IPv6:2a01:4f8:192:486::2:0])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A293DC061764;
        Wed, 18 Aug 2021 20:49:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org;
        s=42; h=Date:Cc:To:From:Message-ID;
        bh=j5tjpwG95NMneNvkZrZuuP58BNA+DYtbNUwlFLXa088=; b=a5x+MjnJdalNxaXTqFlHAcM74Y
        BeWcrdGfHsRK2BUUKzE5rHJUJNzlKIEUi6JpR1OwX5XADMJrfHBHfYwt7Re/tqYH0FKqVYpVdU+J/
        +++gJ81R7ghl1fIv+OsLYX+Fl4Kn0ybRIxSOB4x+PJeQwLN8WDEkd4dNrcLcqH+1bZOWrVZwlKZ2G
        7es3417aDlkCMz6VnUxf4Jiynxo4++wcgU7uTr5RW886HTEx17R3z2u+KvZ8Pj33JWUQtl++HCZGV
        ExraIrEsSgAHL/4ctZpua/e8wm/Xn+jGo/q/VVChYmuZX4mvZOdd5On9g5iDFZWiBJ6jOYN69WZXx
        RVnc+rpcqtVa7YYn53PCk0fC8kc88tzPkukFQjMwwAkzYQ76pCzOuXNGL88TvM+IY4Zu+PwLPSrAM
        jFbrfZruvdtWvv8wp5uU2/61Z3/+r/Jv7u9FCX0AHoA2UBzBvX/ssGUAOdyOEAg7IWIQM3TtIPOTd
        fM423ije1pODh1jMqDy4Ben6;
Received: from [127.0.0.2] (localhost [127.0.0.1])
        by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
        (Exim)
        id 1mGZ3U-0020Ds-IC; Thu, 19 Aug 2021 03:49:25 +0000
Message-ID: <d08c99b8550cc48fe04cc9f4cd5eca0532f5733d.camel@samba.org>
Subject: Re: [PATCH 0/2] crypto: remove MD4 generic shash
From:   Andrew Bartlett <abartlet@samba.org>
To:     Jeremy Allison <jra@samba.org>, Steve French <smfrench@gmail.com>
Cc:     linux-cifs <linux-cifs@vger.kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Eric Biggers <ebiggers@kernel.org>,
        samba-technical <samba-technical@lists.samba.org>,
        David Howells <dhowells@redhat.com>,
        Steve French <sfrench@samba.org>, keyrings@vger.kernel.org,
        Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
        Ard Biesheuvel <ardb@kernel.org>,
        Denis Kenzior <denkenz@gmail.com>
Date:   Thu, 19 Aug 2021 15:49:14 +1200
In-Reply-To: <YR2E2FZNdMj2xl+0@jeremy-acer>
References: <20210818144617.110061-1-ardb@kernel.org>
         <946591db-36aa-23db-a5c4-808546eab762@gmail.com>
         <CAMj1kXEjHojAZ0_DPkogHAbmS6XAOFN3t8-4VB0+zN8ruTPVCg@mail.gmail.com>
         <24606605-71ae-f918-b71a-480be7d68e43@gmail.com>
         <CAH2r5muhHnrAbu-yX3h1VPjW+2CUyUtSCzyoOs7MXw=fE7HA_Q@mail.gmail.com>
         <YR2E2FZNdMj2xl+0@jeremy-acer>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Wed, 2021-08-18 at 15:08 -0700, Jeremy Allison via samba-technical
wrote:
> 
> My 2 cents. Preventing NTLM authentication/signing from working would
> be
> a negative for the Linux kernel client. I don't mind if that code has
> to be isolated inside cifs.ko, but it really needs to keep working,
> at least until we have a pluggable client auth in cifs.ko and Samba
> that allows the single-server (non AD-Domain) case to keep working
> easily.

I would echo that, and also just remind folks that MD4 in NTLMSSP is
used as a compression only, it has no security value.  The security
would be the same if the password was compressed with MD4, SHA1 or
SHA256 - the security comes from the complexity of the password and the
HMAC-MD5 rounds inside NTLMv2.  

I'll also mention the use of MD4, which is used to re-encrypt a short-
term key with the long-term key out of the NTLMv2 scheme.  This
thankfully is an unchecksumed simple RC4 round of one random value with
another, so not subject to known-plaintext attacks here.

I know neither MD4 nor HMAC-MD5 is not flavour of the month any more,
with good reason, but we would not want to go with way of NFSv4 which
is, as I understand it, full Kerberos or bust (so folks choose no
protection).

Andrew Bartlett

-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Team Lead, Catalyst IT   https://catalyst.net.nz/services/samba

Samba Development and Support, Catalyst IT - Expert Open Source
Solutions

