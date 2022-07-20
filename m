Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C244D57B1F5
	for <lists+keyrings@lfdr.de>; Wed, 20 Jul 2022 09:43:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236883AbiGTHnC (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 20 Jul 2022 03:43:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230197AbiGTHnC (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 20 Jul 2022 03:43:02 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16FB34C608;
        Wed, 20 Jul 2022 00:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=pN+yICyBGoZPPobCkQr09yaYpXxZ/61x86NGwoXu+xM=; b=BhugdPNJJE1Q1h/wIlu16Pjx+z
        Q0gHSFD5cUGQOUXDlVIOCdQ4ld7lgtb84EyEs7mkNmQUbt/y1ibK/SzQMJaOiApEd/Xf+kt7zah//
        2fsSrIFdk+toTX3p67zCZPk9RVA1ZVblKzM5CS4dywxzKaXB6AUZPjoe8PFJwII34ryCid4tIsirA
        63VgzgxNb9nt37RYlvPjueVuomRbl90a/MOFSy0bz/FYyTTUpIX7UiXgkMyKSQlB5bUmrYYuHqzYD
        rFFGgF7iQBc23CQPZQhchsneIdzzhwQnU8nbsDdYiDiyirdU1STnlvRRrHP38p8k7bS+8CH1KU1zj
        fDdzqczg==;
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
        id 1oE4MD-0027Mw-7y; Wed, 20 Jul 2022 07:42:57 +0000
Date:   Wed, 20 Jul 2022 00:42:57 -0700
From:   Christoph Hellwig <hch@infradead.org>
To:     gjoyce@linux.vnet.ibm.com
Cc:     linux-block@vger.kernel.org, keyrings@vger.kernel.org,
        dhowells@redhat.com, jarkko@kernel.org, jonathan.derrick@linux.dev,
        brking@linux.vnet.ibm.com, greg@gilhooley.com, gjoyce@ibm.com
Subject: Re: [PATCH 1/4] block: sed-opal: Implement IOC_OPAL_DISCOVERY
Message-ID: <YteyAb4oO36vFzdn@infradead.org>
References: <20220718210156.1535955-1-gjoyce@linux.vnet.ibm.com>
 <20220718210156.1535955-2-gjoyce@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220718210156.1535955-2-gjoyce@linux.vnet.ibm.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Mon, Jul 18, 2022 at 04:01:53PM -0500, gjoyce@linux.vnet.ibm.com wrote:
> +	if (discv_out) {
> +		buf_out = (u8 __user *)(uintptr_t)discv_out->data;
> +		len_out = min(discv_out->size, (u64)hlen);
> +		if (buf_out && copy_to_user(buf_out, dev->resp, len_out)) {
> +			return -EFAULT;
> +		}

No need for the braces here.

Otherwise looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>
