Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E15BE3AF04
	for <lists+keyrings@lfdr.de>; Mon, 10 Jun 2019 08:35:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387485AbfFJGfK (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Mon, 10 Jun 2019 02:35:10 -0400
Received: from helcar.hmeau.com ([216.24.177.18]:35336 "EHLO deadmen.hmeau.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387464AbfFJGfK (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Mon, 10 Jun 2019 02:35:10 -0400
Received: from gondobar.mordor.me.apana.org.au ([192.168.128.4] helo=gondobar)
        by deadmen.hmeau.com with esmtps (Exim 4.89 #2 (Debian))
        id 1haDta-0001Fq-1k; Mon, 10 Jun 2019 14:35:06 +0800
Received: from herbert by gondobar with local (Exim 4.89)
        (envelope-from <herbert@gondor.apana.org.au>)
        id 1haDtV-00031s-R4; Mon, 10 Jun 2019 14:35:01 +0800
Date:   Mon, 10 Jun 2019 14:35:01 +0800
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
Message-ID: <20190610063501.u3q2k2vgytvknxs3@gondor.apana.org.au>
References: <1547708541-23730-1-git-send-email-kalyani.akula@xilinx.com>
 <18759853.IUaQuE38eh@tauon.chronox.de>
 <SN6PR02MB5135CE53C3E3FB34CA5E6BA8AF320@SN6PR02MB5135.namprd02.prod.outlook.com>
 <2554415.t45IJDmies@tauon.chronox.de>
 <BN7PR02MB5124A7E685AC0F59AFBEFC8DAF130@BN7PR02MB5124.namprd02.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BN7PR02MB5124A7E685AC0F59AFBEFC8DAF130@BN7PR02MB5124.namprd02.prod.outlook.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Mon, Jun 10, 2019 at 05:20:58AM +0000, Kalyani Akula wrote:
> Ping!!

We already have existing drivers supporting hardware keys.  Please
check out how they're handling this.  You can grep for paes under
drivers/crypto.

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
