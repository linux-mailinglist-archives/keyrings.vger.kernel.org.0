Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4CB273D6D51
	for <lists+keyrings@lfdr.de>; Tue, 27 Jul 2021 06:25:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234895AbhG0EZF (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 27 Jul 2021 00:25:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229487AbhG0EZE (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Tue, 27 Jul 2021 00:25:04 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA2EAC061757
        for <keyrings@vger.kernel.org>; Mon, 26 Jul 2021 21:25:04 -0700 (PDT)
Received: from gallifrey.ext.pengutronix.de ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[127.0.0.1])
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <a.fatoum@pengutronix.de>)
        id 1m8EeJ-00047E-E9; Tue, 27 Jul 2021 06:24:59 +0200
Subject: Re: [PATCH v2] KEYS: trusted: fix use as module when CONFIG_TCG_TPM=m
To:     Jarkko Sakkinen <jarkko@kernel.org>
Cc:     James Morris <jmorris@namei.org>,
        "Serge E. Hallyn" <serge@hallyn.com>,
        James Bottomley <jejb@linux.ibm.com>,
        Mimi Zohar <zohar@linux.ibm.com>,
        Sumit Garg <sumit.garg@linaro.org>,
        David Howells <dhowells@redhat.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, kernel@pengutronix.de,
        Andreas Rammhold <andreas@rammhold.de>,
        David Gstir <david@sigma-star.at>,
        Richard Weinberger <richard@nod.at>, keyrings@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-security-module@vger.kernel.org,
        linux-integrity@vger.kernel.org
References: <20210721160258.7024-1-a.fatoum@pengutronix.de>
 <20210727030433.3dwod2elwtdkhwsc@kernel.org>
From:   Ahmad Fatoum <a.fatoum@pengutronix.de>
Message-ID: <fe39a449-88df-766b-a13a-290f4847d43e@pengutronix.de>
Date:   Tue, 27 Jul 2021 06:24:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210727030433.3dwod2elwtdkhwsc@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: keyrings@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On 27.07.21 05:04, Jarkko Sakkinen wrote:
>> Reported-by: Andreas Rammhold <andreas@rammhold.de>
>> Fixes: 5d0682be3189 ("KEYS: trusted: Add generic trusted keys framework")
>> Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
> 
> Is it absolutely need to do all this *just* to fix the bug?
> 
> For a pure bug fix the most essential thing is to be able the backport
> it to stable kernels.

Not much happened in-between, so a backport should be trivial.
I can provide these if needed.

> I don't really care at all about extra niceties ("it's now possible
> stuff).
> 
> This looks like a bug fix and improvements bundle into a single patch.

You can replace the #ifdefs with #if IS_REACHABLE in trusted_core.c to fix the
intermediate breakage and then throw that away again to fix the remaining
dependency of trusted keys on TCG_TPM.

If you prefer that, Andreas perhaps could respin his series with
s/IS_ENABLED/IS_REACHABLE/?

Cheers,
Ahmad


> 
> /Jarkko
> 


-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
