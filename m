Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 495F222A06C
	for <lists+keyrings@lfdr.de>; Wed, 22 Jul 2020 22:02:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726535AbgGVUCd (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 22 Jul 2020 16:02:33 -0400
Received: from smtprelay0037.hostedemail.com ([216.40.44.37]:40610 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726462AbgGVUCd (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 22 Jul 2020 16:02:33 -0400
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay02.hostedemail.com (Postfix) with ESMTP id B60D41842C03F;
        Wed, 22 Jul 2020 20:02:30 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2,0,0,,d41d8cd98f00b204,joe@perches.com,,RULES_HIT:41:355:379:599:800:960:968:973:988:989:1260:1277:1311:1313:1314:1345:1359:1434:1437:1515:1516:1518:1534:1540:1593:1594:1711:1730:1747:1777:1792:2194:2199:2393:2559:2562:2828:2894:3138:3139:3140:3141:3142:3352:3622:3865:3866:3867:3868:3870:3871:4321:5007:7576:9108:10004:10400:10848:11026:11232:11658:11914:12043:12048:12296:12297:12438:12740:12760:12895:13069:13311:13357:13439:14181:14659:14721:21080:21451:21627:30012:30054:30075:30080:30091,0,RBL:none,CacheIP:none,Bayesian:0.5,0.5,0.5,Netcheck:none,DomainCache:0,MSF:not bulk,SPF:,MSBL:0,DNSBL:none,Custom_rules:0:0:0,LFtime:1,LUA_SUMMARY:none
X-HE-Tag: force93_1a17f4e26f38
X-Filterd-Recvd-Size: 1832
Received: from XPS-9350.home (unknown [47.151.133.149])
        (Authenticated sender: joe@perches.com)
        by omf16.hostedemail.com (Postfix) with ESMTPA;
        Wed, 22 Jul 2020 20:02:28 +0000 (UTC)
Message-ID: <2bdd6b8ec731d180023d593b679afc66def19b4f.camel@perches.com>
Subject: Re: [PATCH v2] KEYS: remove redundant memset
From:   Joe Perches <joe@perches.com>
To:     trix@redhat.com, dhowells@redhat.com,
        jarkko.sakkinen@linux.intel.com, jmorris@namei.org,
        serge@hallyn.com, denkenz@gmail.com, marcel@holtmann.org
Cc:     keyrings@vger.kernel.org, linux-security-module@vger.kernel.org,
        linux-kernel@vger.kernel.org
Date:   Wed, 22 Jul 2020 13:02:27 -0700
In-Reply-To: <20200722134610.31947-1-trix@redhat.com>
References: <20200722134610.31947-1-trix@redhat.com>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.36.3-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Wed, 2020-07-22 at 06:46 -0700, trix@redhat.com wrote:
> From: Tom Rix <trix@redhat.com>
> 
> Reviewing use of memset in keyctrl_pkey.c
> 
> keyctl_pkey_params_get prologue code to set params up
> 
> 	memset(params, 0, sizeof(*params));
> 	params->encoding = "raw";
> 
> keyctl_pkey_query has the same prologue
> and calls keyctl_pkey_params_get.
> 
> So remove the prologue.
> 
> Fixes: 00d60fd3b932 ("KEYS: Provide keyctls to drive the new key type ops for asymmetric keys [ver #2]")

At best, this is a micro optimization.

How is this appropriate for a Fixes: line?

> diff --git a/security/keys/keyctl_pkey.c b/security/keys/keyctl_pkey.c
[]
> @@ -166,8 +166,6 @@ long keyctl_pkey_query(key_serial_t id,
>  	struct kernel_pkey_query res;
>  	long ret;
>  
> -	memset(&params, 0, sizeof(params));
> -
>  	ret = keyctl_pkey_params_get(id, _info, &params);
>  	if (ret < 0)
>  		goto error;

