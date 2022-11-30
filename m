Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 653E063CF58
	for <lists+keyrings@lfdr.de>; Wed, 30 Nov 2022 07:52:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232680AbiK3Gwq (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 30 Nov 2022 01:52:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232172AbiK3Gwp (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 30 Nov 2022 01:52:45 -0500
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C147513F2B;
        Tue, 29 Nov 2022 22:52:41 -0800 (PST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 5040E21B0F;
        Wed, 30 Nov 2022 06:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1669791160; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=mC6CvpZRbEci2f4Q9y/4GrqNIiGdJnU9NzAwYZpRPos=;
        b=k9j4pPTXOuYAKWrUDZPGPOfCBv8gDpInawAZlPC5ozKqIR/FAjc4V0o455102D3NkMl4eR
        pVBd3/ZO0eb3CjervaNmUUV8swz1L7YY1ByV3vlmEnj7QTjnHECNbAL3GFiIaBeqKV08LK
        K3WJoRyTcfCUNeGfWcHhy/b/jmScbtc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1669791160;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=mC6CvpZRbEci2f4Q9y/4GrqNIiGdJnU9NzAwYZpRPos=;
        b=EW9G8jAqEDN6Hkw5u3nLeU2R5L5B6phxvDy8bs9zUSNGrnKovWyxzZFSitYlwNDCyuxy9y
        yEdBoETX8VVnuzBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 13D3C1331F;
        Wed, 30 Nov 2022 06:52:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id OpDrA7j9hmPMEwAAMHmgww
        (envelope-from <hare@suse.de>); Wed, 30 Nov 2022 06:52:40 +0000
Message-ID: <154ff276-7a49-0d1a-f7d5-9ba2f7db7486@suse.de>
Date:   Wed, 30 Nov 2022 07:52:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v3 1/3] block: sed-opal: Implement IOC_OPAL_DISCOVERY
Content-Language: en-US
To:     gjoyce@linux.vnet.ibm.com, linux-block@vger.kernel.org
Cc:     linuxppc-dev@lists.ozlabs.org, jonathan.derrick@linux.dev,
        brking@linux.vnet.ibm.com, msuchanek@suse.de, mpe@ellerman.id.au,
        nayna@linux.ibm.com, axboe@kernel.dk, akpm@linux-foundation.org,
        keyrings@vger.kernel.org
References: <20221129232506.3735672-1-gjoyce@linux.vnet.ibm.com>
 <20221129232506.3735672-2-gjoyce@linux.vnet.ibm.com>
From:   Hannes Reinecke <hare@suse.de>
In-Reply-To: <20221129232506.3735672-2-gjoyce@linux.vnet.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On 11/30/22 00:25, gjoyce@linux.vnet.ibm.com wrote:
> From: Greg Joyce <gjoyce@linux.vnet.ibm.com>
> 
> Add IOC_OPAL_DISCOVERY ioctl to return raw discovery data to a SED Opal
> application. This allows the application to display drive capabilities
> and state.
> 
> Signed-off-by: Greg Joyce <gjoyce@linux.vnet.ibm.com>
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> Reviewed-by: Jonathan Derrick <jonathan.derrick@linux.dev>
> ---
>   block/sed-opal.c              | 38 ++++++++++++++++++++++++++++++++---
>   include/linux/sed-opal.h      |  1 +
>   include/uapi/linux/sed-opal.h |  6 ++++++
>   3 files changed, 42 insertions(+), 3 deletions(-)
> 
Reviewed-by: Hannes Reinecke <hare@suse.de>

Cheers,

Hannes
-- 
Dr. Hannes Reinecke                Kernel Storage Architect
hare@suse.de                              +49 911 74053 688
SUSE Software Solutions GmbH, Maxfeldstr. 5, 90409 Nürnberg
HRB 36809 (AG Nürnberg), Geschäftsführer: Ivo Totev, Andrew
Myers, Andrew McDonald, Martje Boudien Moerman

