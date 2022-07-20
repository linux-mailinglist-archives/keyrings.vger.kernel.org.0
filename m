Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AFD9357B1F7
	for <lists+keyrings@lfdr.de>; Wed, 20 Jul 2022 09:44:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230087AbiGTHoe (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 20 Jul 2022 03:44:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229881AbiGTHoc (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 20 Jul 2022 03:44:32 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20A834C608;
        Wed, 20 Jul 2022 00:44:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=E4Gm7OBSTXq9+gdT/RP7UfqkemKUVyLClu/P/cSYNNk=; b=UjR4K+5NU8wmDpdWeqoWRVsnDH
        H/6bTj6FILnxwRdjRonUpbUPB0NsDNLK1epmuoMjWGPtCUolcNnA1kqfCvkDa+IdL9aof1Soohy+i
        ryLhnFYSKKv3IkkNelRwYuw3yWJ2i4x9VZRKvax08XDY51WDVyz8wOOQ8hwxbl6wgJB+ITq1V2n3H
        eINcBdKFsX/LGEp9KXtA1X5KWRapkzOyO6712BdbgTWvD5dLuhMhM8Xm3QpFMfVv4Rgj8DlKJfr7W
        HXkm9jnUvjPqjXT2MdReXllyjxCVQ0CXElLYaLslhrn3vkqZTXmbrEclE0ps+WNhSupUPF88gzLW0
        o17Nzt3w==;
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
        id 1oE4Nj-00283n-P0; Wed, 20 Jul 2022 07:44:31 +0000
Date:   Wed, 20 Jul 2022 00:44:31 -0700
From:   Christoph Hellwig <hch@infradead.org>
To:     gjoyce@linux.vnet.ibm.com
Cc:     linux-block@vger.kernel.org, keyrings@vger.kernel.org,
        dhowells@redhat.com, jarkko@kernel.org, jonathan.derrick@linux.dev,
        brking@linux.vnet.ibm.com, greg@gilhooley.com, gjoyce@ibm.com
Subject: Re: [PATCH 2/4] block: sed-opal: Implement IOC_OPAL_REVERT_LSP
Message-ID: <YteyX+pvMOBE/jiS@infradead.org>
References: <20220718210156.1535955-1-gjoyce@linux.vnet.ibm.com>
 <20220718210156.1535955-3-gjoyce@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220718210156.1535955-3-gjoyce@linux.vnet.ibm.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Mon, Jul 18, 2022 at 04:01:54PM -0500, gjoyce@linux.vnet.ibm.com wrote:
> From: Greg Joyce <gjoyce@linux.vnet.ibm.com>
> 
> This is used in conjunction with IOC_OPAL_REVERT_TPR to return a drive to
> Original Factory State without erasing the data. If IOC_OPAL_REVERT_LSP
> is called with opal_revert_lsp.options bit OPAL_PRESERVE set prior
> to calling IOC_OPAL_REVERT_TPR, the drive global locking range will not
> be erased.
> 
> Signed-off-by: Greg Joyce <gjoyce@linux.vnet.ibm.com>
> ---
>  block/opal_proto.h            |  4 ++++
>  block/sed-opal.c              | 42 ++++++++++++++++++++++++++++++++++-
>  include/linux/sed-opal.h      |  1 +
>  include/uapi/linux/sed-opal.h |  9 ++++++++
>  4 files changed, 55 insertions(+), 1 deletion(-)
> 
> diff --git a/block/opal_proto.h b/block/opal_proto.h
> index b486b3ec7dc4..6127c08267f8 100644
> --- a/block/opal_proto.h
> +++ b/block/opal_proto.h
> @@ -210,6 +210,10 @@ enum opal_parameter {
>  	OPAL_SUM_SET_LIST = 0x060000,
>  };
>  
> +enum opal_revertlsp {
> +	OPAL_KEEP_GLOBAL_RANGE_KEY = 0x060000,
> +};
> +
>  /* Packets derived from:
>   * TCG_Storage_Architecture_Core_Spec_v2.01_r1.00
>   * Secion: 3.2.3 ComPackets, Packets & Subpackets
> diff --git a/block/sed-opal.c b/block/sed-opal.c
> index 4b9a7ffbf00f..feba36e54ae0 100644
> --- a/block/sed-opal.c
> +++ b/block/sed-opal.c
> @@ -448,7 +448,7 @@ static int opal_discovery0_end(struct opal_dev *dev, void *data)
>  
>  	if (discv_out) {
>  		buf_out = (u8 __user *)(uintptr_t)discv_out->data;
> -		len_out = min(discv_out->size, (u64)hlen);
> +		len_out = min_t(u64, discv_out->size, hlen);

This seems like it should go into the previous patch (or just dropped).

> +
>  struct opal_lr_act {
>  	struct opal_key key;
>  	__u32 sum;
> @@ -137,6 +141,10 @@ struct opal_discovery {
>  	__u64 size;
>  };
>  
> +struct opal_revert_lsp {
> +	struct opal_key key;
> +	__u32 options;

this wants a __u32 __pad at the end to avoid struct padding problems.
