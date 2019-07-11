Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 059E0654FB
	for <lists+keyrings@lfdr.de>; Thu, 11 Jul 2019 13:10:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728397AbfGKLKT (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 11 Jul 2019 07:10:19 -0400
Received: from helcar.hmeau.com ([216.24.177.18]:39668 "EHLO deadmen.hmeau.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727865AbfGKLKT (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Thu, 11 Jul 2019 07:10:19 -0400
Received: from gondobar.mordor.me.apana.org.au ([192.168.128.4] helo=gondobar)
        by deadmen.hmeau.com with esmtps (Exim 4.89 #2 (Debian))
        id 1hlWxr-0001EV-Au; Thu, 11 Jul 2019 19:10:15 +0800
Received: from herbert by gondobar with local (Exim 4.89)
        (envelope-from <herbert@gondor.apana.org.au>)
        id 1hlWxn-0006ie-Mw; Thu, 11 Jul 2019 19:10:11 +0800
Date:   Thu, 11 Jul 2019 19:10:11 +0800
From:   Herbert Xu <herbert@gondor.apana.org.au>
To:     Kalyani Akula <kalyania@xilinx.com>
Cc:     Stephan Mueller <smueller@chronox.de>,
        "keyrings@vger.kernel.org" <keyrings@vger.kernel.org>,
        "davem@davemloft.net" <davem@davemloft.net>,
        "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Sarat Chand Savitala <saratcha@xilinx.com>
Subject: Re: [RFC PATCH 4/5] crypto: Adds user space interface for
 ALG_SET_KEY_TYPE
Message-ID: <20190711111011.x3qzukon2zqnsgac@gondor.apana.org.au>
References: <1547708541-23730-1-git-send-email-kalyani.akula@xilinx.com>
 <18759853.IUaQuE38eh@tauon.chronox.de>
 <SN6PR02MB5135CE53C3E3FB34CA5E6BA8AF320@SN6PR02MB5135.namprd02.prod.outlook.com>
 <2554415.t45IJDmies@tauon.chronox.de>
 <BN7PR02MB5124A7E685AC0F59AFBEFC8DAF130@BN7PR02MB5124.namprd02.prod.outlook.com>
 <20190610063501.u3q2k2vgytvknxs3@gondor.apana.org.au>
 <BN7PR02MB5124F4680E424C25D77D178DAFF30@BN7PR02MB5124.namprd02.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BN7PR02MB5124F4680E424C25D77D178DAFF30@BN7PR02MB5124.namprd02.prod.outlook.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Thu, Jul 11, 2019 at 09:25:38AM +0000, Kalyani Akula wrote:
>
> How about using same interface to distinguish between the User supplied key Vs HW key selection based on key_len parameter.

As long as you use the paes name instead of aes you can do whatever
you want with the key encoding.

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
