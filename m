Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C7263F12B9
	for <lists+keyrings@lfdr.de>; Thu, 19 Aug 2021 07:23:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229702AbhHSFYV (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 19 Aug 2021 01:24:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229451AbhHSFYV (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 19 Aug 2021 01:24:21 -0400
Received: from hr2.samba.org (hr2.samba.org [IPv6:2a01:4f8:192:486::2:0])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C4B6C061756;
        Wed, 18 Aug 2021 22:23:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org;
        s=42; h=Date:Cc:To:From:Message-ID;
        bh=FKXJJR+E/d8HbrkHuWmDXOz37OkPecELRHt/LNShliU=; b=huKyadOm7s+DNRYIGOpDDkpH2S
        obnwZPzaIGeW7jkSCpclmxk7tQT/XngBfUbT8+0xZ6HngQFeAUK+D1MMpKnOT9w/e6U4rY9ryFvAP
        lCyyw2cc8ovxUQlT7kszBcF2kwCtdQDGbojJadVLB0Zh9cPv3QvUCutMFgzTkaVFsGKyXN5TAhMGZ
        OFMLsAbrrEcWD4kdO6o01vjDbcUqUhLBK9XX5RHuRxrj++U5g1bg1rLWzYeigxA7g/KgNjaNtWnhf
        Mg4w97sc9fc5ohclNm6OGo1x1/UJt5A+HQwt8n1435WwID8SnS9U7lTlbDpvBm0A36PpXMaqMsKyM
        5lYPN2Yamatzw3/HcbWAE9SztrFLmGFq3IB4tsH8uX9lWsLCrDg2b0vOK4sewKuQCi+Kx55a/7xz2
        rDgu+m7GI41GedbKS+11yCYizWmCF1ct3nALgsPc1Lllf3QU6DbMLpR3TYlpSjCOMDbs0n4563DJi
        M9lPqnFFf3Hl48nfqp4oQYbi;
Received: from [127.0.0.2] (localhost [127.0.0.1])
        by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
        (Exim)
        id 1mGaWi-0020ip-MC; Thu, 19 Aug 2021 05:23:41 +0000
Message-ID: <ba396d64c1ed0336530c465aff55f768fae8d95d.camel@samba.org>
Subject: Re: [PATCH 0/2] crypto: remove MD4 generic shash
From:   Andrew Bartlett <abartlet@samba.org>
To:     Eric Biggers <ebiggers@kernel.org>
Cc:     Jeremy Allison <jra@samba.org>, Steve French <smfrench@gmail.com>,
        linux-cifs <linux-cifs@vger.kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        samba-technical <samba-technical@lists.samba.org>,
        David Howells <dhowells@redhat.com>,
        Steve French <sfrench@samba.org>, keyrings@vger.kernel.org,
        Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
        Ard Biesheuvel <ardb@kernel.org>,
        Denis Kenzior <denkenz@gmail.com>
Date:   Thu, 19 Aug 2021 17:23:30 +1200
In-Reply-To: <YR3pi9HEbhknJdl6@sol.localdomain>
References: <20210818144617.110061-1-ardb@kernel.org>
         <946591db-36aa-23db-a5c4-808546eab762@gmail.com>
         <CAMj1kXEjHojAZ0_DPkogHAbmS6XAOFN3t8-4VB0+zN8ruTPVCg@mail.gmail.com>
         <24606605-71ae-f918-b71a-480be7d68e43@gmail.com>
         <CAH2r5muhHnrAbu-yX3h1VPjW+2CUyUtSCzyoOs7MXw=fE7HA_Q@mail.gmail.com>
         <YR2E2FZNdMj2xl+0@jeremy-acer>
         <d08c99b8550cc48fe04cc9f4cd5eca0532f5733d.camel@samba.org>
         <YR3pi9HEbhknJdl6@sol.localdomain>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Wed, 2021-08-18 at 22:18 -0700, Eric Biggers wrote:

> I'm not sure you understand how embarrassing it is to still be using
> these
> algorithms.  MD4 has been broken for over 25 years, and better
> algorithms have
> been recommended for 29 years.  Similarly MD5 has been broken for 16
> years and
> better algorithms have been recommended for 25 years (though granted,
> HMAC-MD5
> is more secure than plain MD5 when properly used).  Meanwhile SHA-2
> is 20 years
> old and is still considered secure.  So this isn't something that
> changes every
> month -- we're talking about no one bothering to do anything in 30
> years.
> 
> Of course, if cryptography isn't actually applicable to the use case,
> then
> cryptography shouldn't be used at all.

I'm sorry that Samba - or the Kernel, you could implement whatever is
desired between cifs.ko and kcifsd -  hasn't gone it alone to build a
new peer-to-peer mechanism, but absent a Samba-only solution Microsoft
has been asked and has no intention of updating NTLM, so embarrassing
or otherwise this is how it is.

Thankfully only the HMAC-MD5 step in what you mention is
cryptographically significant, the rest are just very lossy compression
algorithms.  

Andrew Bartlett

-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Team Lead, Catalyst IT   https://catalyst.net.nz/services/samba

Samba Development and Support, Catalyst IT - Expert Open Source
Solutions

