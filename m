Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E0CAC222671
	for <lists+keyrings@lfdr.de>; Thu, 16 Jul 2020 17:07:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728725AbgGPPFr (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 16 Jul 2020 11:05:47 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.54]:24810 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725867AbgGPPFq (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 16 Jul 2020 11:05:46 -0400
X-Greylist: delayed 355 seconds by postgrey-1.27 at vger.kernel.org; Thu, 16 Jul 2020 11:05:45 EDT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1594911944;
        s=strato-dkim-0002; d=chronox.de;
        h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=I4bz/d39nrkge0/YctC5G7TOJ13psUte3WekMTxW9Dg=;
        b=nVZTQpqHHc/ngeCjmT7GdvI00Kop+eqw74WMM5qZOWvHXYmFadOa36w9AD9zHsqp3Y
        UoihF63eKM/BgUJWbbrNLE7Vn2DUEc34Qhd8sHN+rVyjcDNDD1ExIjwRfN8dmJcEbpiQ
        Mpdof3QKRoczKpJql6EqoKScehop1Il0y2kRThIKjBkez+UpgldTsusGInv+PP6BL1o3
        KQUGbdkpSf3dAHg+HbJroTYB+AXcCvmdbU/khI0GRSdNhm5hN4fcvgXmRxMnhz/qxg9d
        Ns3VpsGb0QXBMDb/l4lALUEQZ4lu8J4iK6fe0MSBoDfoNtrzufXK2cdf2aX+oUaBmkGO
        0kyw==
X-RZG-AUTH: ":P2ERcEykfu11Y98lp/T7+hdri+uKZK8TKWEqNyiHySGSa9k9x2wdNs6neUFoh7cs0E0="
X-RZG-CLASS-ID: mo00
Received: from tauon.chronox.de
        by smtp.strato.de (RZmta 46.10.5 AUTH)
        with ESMTPSA id y0546bw6GExc97z
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Thu, 16 Jul 2020 16:59:38 +0200 (CEST)
From:   Stephan Mueller <smueller@chronox.de>
To:     Elena Petrova <lenaptr@google.com>, herbert@gondor.apana.org.au
Cc:     "open list:HARDWARE RANDOM NUMBER GENERATOR CORE" 
        <linux-crypto@vger.kernel.org>, Eric Biggers <ebiggers@kernel.org>,
        Ard Biesheuvel <ardb@kernel.org>,
        "keyrings@vger.kernel.org" <keyrings@vger.kernel.org>
Subject: Re: [PATCH 0/1] crypto: af_alg - add extra parameters for DRBG interface
Date:   Thu, 16 Jul 2020 16:59:37 +0200
Message-ID: <4708215.a9HWlOh95j@tauon.chronox.de>
In-Reply-To: <5740551.2l3rmUXbR5@tauon.chronox.de>
References: <20200713164857.1031117-1-lenaptr@google.com> <CABvBcwaB3RLuRWEzSoeADc4Jg28fK6mqwevaywLsZhvFgBi+BA@mail.gmail.com> <5740551.2l3rmUXbR5@tauon.chronox.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Am Donnerstag, 16. Juli 2020, 16:49:52 CEST schrieb Stephan Mueller:

Hi Herbert,

(resent, adding Herbert to the list and fix the keyrings address)

> Am Donnerstag, 16. Juli 2020, 16:41:26 CEST schrieb Elena Petrova:
> 
> Hi Herbert,
> 
> > > > > With these issues, I would assume you are better off creating your
> > > > > own
> > > > > kernel module just like I did that externalizes the crypto API to
> > > > > user
> > > > > space but is only available on your test kernel and will not affect
> > > > > all
> > > > > other users.
> > > > 
> > > > I considered publishing my kernel driver on GitHub, but there appears
> > > > to
> > > > be
> > > > a sufficiently large number of users to justify having this
> > > > functionality
> > > > upstream.
> > > 
> > > So, I should then dust off my AF_ALG KPP and AF_ALG akcipher patches
> > > then?
> > > 
> > > :-D
> > 
> > Sure :)
> 
> Long time ago when I released the patches now found in [1] and [2] they
> where rejected as it was said, the official route to access the RSA/ECDSA
> and the DH/ECDH ciphers is through the keyring.
> 
> Obviously this interface of the keyring is not suitable for testing these
> algorithms. Considering the request that the kernel crypto API ciphers
> should be testable with arbitrary test vectors, would the dusted-off
> patches for AF_ALG KPP and akcipher be accepted?
> 
> Ciao
> Stephan
> 
> [1]
> https://github.com/smuellerDD/libkcapi/tree/master/kernel-patches/4.15-rc3/
> asym
> 
> [2]
> https://github.com/smuellerDD/libkcapi/tree/master/kernel-patches/4.15-rc3/
> kpp


Ciao
Stephan


