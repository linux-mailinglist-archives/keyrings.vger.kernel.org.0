Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AEB082919A
	for <lists+keyrings@lfdr.de>; Fri, 24 May 2019 09:20:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388985AbfEXHUZ (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Fri, 24 May 2019 03:20:25 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.54]:10079 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388979AbfEXHUZ (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Fri, 24 May 2019 03:20:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1558682420;
        s=strato-dkim-0002; d=chronox.de;
        h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=pwDJiBeaj+t4RmLWFQQ2ZThZEzCnUpWhfbbPnBxxLRE=;
        b=qCk/j1xzUVorKPPvQeWe/EcJJkbLkrIkV7a5qINiv8+v9/fUE0izVTVFt6Y+lqXC1n
        VXhmOIK/t5BJeMma+eiZu5NwK2uL67ZZu5866HOsGkHlOy3yytnKuS16/FfeZcAJCEJa
        laxScPccz9RFL9iPmn0hJb/XkBx63NWyKm06cxrOiUIskdGX07nf07D4ebRYGaWEkKQN
        zXfIu02mm2pRcP/ViIoJxtxJDyPbTzsqcwgGK9MEvEKpAtAd8J8mQvU+02khu5Nm5AdV
        sFKfkkK/aRG8Eu2kLn2JME2v6LvbUU56Bnotf3OgVgHMPPIya4e5rv5sLE0yh02u+NPi
        /NHQ==
X-RZG-AUTH: ":P2ERcEykfu11Y98lp/T7+hdri+uKZK8TKWEqNyiHySGSa9k9xmwdNnzGHXPbL/Sf94Hg"
X-RZG-CLASS-ID: mo00
Received: from tauon.chronox.de
        by smtp.strato.de (RZmta 44.18 DYNA|AUTH)
        with ESMTPSA id R0373fv4O7JvSyw
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with 521 ECDH bits, eq. 15360 bits RSA))
        (Client did not present a certificate);
        Fri, 24 May 2019 09:19:57 +0200 (CEST)
From:   Stephan Mueller <smueller@chronox.de>
To:     Kalyani Akula <kalyania@xilinx.com>, keyrings@vger.kernel.org
Cc:     "herbert@gondor.apana.org.au" <herbert@gondor.apana.org.au>,
        "davem@davemloft.net" <davem@davemloft.net>,
        "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Sarat Chand Savitala <saratcha@xilinx.com>
Subject: Re: [RFC PATCH 4/5] crypto: Adds user space interface for ALG_SET_KEY_TYPE
Date:   Fri, 24 May 2019 09:19:56 +0200
Message-ID: <2554415.t45IJDmies@tauon.chronox.de>
In-Reply-To: <SN6PR02MB5135CE53C3E3FB34CA5E6BA8AF320@SN6PR02MB5135.namprd02.prod.outlook.com>
References: <1547708541-23730-1-git-send-email-kalyani.akula@xilinx.com> <18759853.IUaQuE38eh@tauon.chronox.de> <SN6PR02MB5135CE53C3E3FB34CA5E6BA8AF320@SN6PR02MB5135.namprd02.prod.outlook.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Am Mittwoch, 8. Mai 2019, 11:31:08 CEST schrieb Kalyani Akula:

Hi Kalyani,

> Hi Stephan,
> 
> Keyrings is in-kernel key-management and retention facility. User can use it
> to manage keys used for applications.
> 
> Xilinx cryptographic hardware has a mechanism to store keys in its internal
> hardware and do not have mechanism to read it back due to security reasons.
> It stores key internally in different forms like simple key, key encrypted
> with unique hardware DNA, key encrypted with hardware family key, key
> stored in eFUSEs/BBRAM etc.
> Based on security level expected, user can select one of the key for AES
> operation. Since AES hardware internally has access to these keys, user do
> not require to provide key to hardware, but need to tell which internal
> hardware key user application like to use for AES operation.
> 
> Basic need is to pass information to AES hardware about which internal
> hardware key to be used for AES operation.
> 
> I agree that from general use case perspective we are not selecting key type
> but selecting internal hardware keys provided by user. How about providing
> option to select custom hardware keys provided by hardware
> (AES_SEL_HW_KEY)?

I am not intimately familiary with the keyring facility. Thus, let us ask the 
experts at the keyring mailing list :-)

> 
> Thanks
> kalyani
> 
> > -----Original Message-----
> > From: Stephan Mueller <smueller@chronox.de>
> > Sent: Thursday, April 25, 2019 12:01 AM
> > To: Kalyani Akula <kalyania@xilinx.com>
> > Cc: herbert@gondor.apana.org.au; davem@davemloft.net; linux-
> > crypto@vger.kernel.org; linux-kernel@vger.kernel.org
> > Subject: Re: [RFC PATCH 4/5] crypto: Adds user space interface for
> > ALG_SET_KEY_TYPE
> > 
> > Am Montag, 22. April 2019, 11:17:55 CEST schrieb Kalyani Akula:
> > 
> > Hi Kalyani,
> > 
> > > > Besides, seem to be more a key handling issue. Wouldn't it make
> > > > sense to rather have such issue solved with key rings than in the
> > > > kernel crypto API?
> > > 
> > > [kalyani] Can you please elaborate on this further ?
> > 
> > The kernel has a keyring support in security/keys which has a user space
> > interface with keyutils. That interface is commonly used for any sort of
> > key manipulation.
> > 
> > Ciao
> > Stephan



Ciao
Stephan


