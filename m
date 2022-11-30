Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F0C6663CF5D
	for <lists+keyrings@lfdr.de>; Wed, 30 Nov 2022 07:53:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233603AbiK3Gxd (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 30 Nov 2022 01:53:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233400AbiK3Gx2 (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 30 Nov 2022 01:53:28 -0500
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8637B5476B;
        Tue, 29 Nov 2022 22:53:23 -0800 (PST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id E198D1F385;
        Wed, 30 Nov 2022 06:53:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1669791201; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=vvftt51twH86fnW0jc/rPeciIz6LKLwz2+uUGGsMPII=;
        b=zNXKV10ii+I7q9VtB1Aaf4rfDBuDN8ulmyuXNvmcXdhgKwnvdMoejAuRaWr25ed63E22CN
        4TmozRwSoweicvAaUFhrCW03GBZPAao9bm9KUvDPiqB/XCBICf5xThvz6FaaiRfz6Lsajs
        ZHjfl7+QhlMBrJFWc0ug9sqnO3PxD9c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1669791201;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=vvftt51twH86fnW0jc/rPeciIz6LKLwz2+uUGGsMPII=;
        b=vpK4CshT9qKhgZZlwS9vBEx1r98BZ+zWBlR9JWdsivWKXzXRtaN5I+U7LNUxu+tm8l14DI
        1HpIMY9FKkRk1wCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id AC0E11331F;
        Wed, 30 Nov 2022 06:53:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id y32BKOH9hmMWFAAAMHmgww
        (envelope-from <hare@suse.de>); Wed, 30 Nov 2022 06:53:21 +0000
Message-ID: <eb60a60f-c46a-6023-9a68-3d37f83fb9f7@suse.de>
Date:   Wed, 30 Nov 2022 07:53:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v3 2/3] block: sed-opal: Implement IOC_OPAL_REVERT_LSP
Content-Language: en-US
To:     gjoyce@linux.vnet.ibm.com, linux-block@vger.kernel.org
Cc:     linuxppc-dev@lists.ozlabs.org, jonathan.derrick@linux.dev,
        brking@linux.vnet.ibm.com, msuchanek@suse.de, mpe@ellerman.id.au,
        nayna@linux.ibm.com, axboe@kernel.dk, akpm@linux-foundation.org,
        keyrings@vger.kernel.org
References: <20221129232506.3735672-1-gjoyce@linux.vnet.ibm.com>
 <20221129232506.3735672-3-gjoyce@linux.vnet.ibm.com>
From:   Hannes Reinecke <hare@suse.de>
In-Reply-To: <20221129232506.3735672-3-gjoyce@linux.vnet.ibm.com>
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
> This is used in conjunction with IOC_OPAL_REVERT_TPR to return a drive to
> Original Factory State without erasing the data. If IOC_OPAL_REVERT_LSP
> is called with opal_revert_lsp.options bit OPAL_PRESERVE set prior
> to calling IOC_OPAL_REVERT_TPR, the drive global locking range will not
> be erased.
> 
> Signed-off-by: Greg Joyce <gjoyce@linux.vnet.ibm.com>
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> Reviewed-by: Jonathan Derrick <jonathan.derrick@linux.dev>
> ---
>   block/opal_proto.h            |  4 ++++
>   block/sed-opal.c              | 40 +++++++++++++++++++++++++++++++++++
>   include/linux/sed-opal.h      |  1 +
>   include/uapi/linux/sed-opal.h | 11 ++++++++++
>   4 files changed, 56 insertions(+)
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

