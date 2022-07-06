Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6A8515680D8
	for <lists+keyrings@lfdr.de>; Wed,  6 Jul 2022 10:12:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230293AbiGFILH (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 6 Jul 2022 04:11:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230355AbiGFILG (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 6 Jul 2022 04:11:06 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DD2A22BCA;
        Wed,  6 Jul 2022 01:11:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=Ueo9aHss8pxOEcowsjGEpgCpwjFxectcGQkPUxmju0k=; b=l1IX8KfjemuImRmcMd9phEAysP
        9fwh7OYl1GcmwCCM2h9/jzNh7pWWSfxyzzaeaQVUq24Pfcsf8IUA8e9SqCcIlnt4Kv9pGI5iOl4jO
        7hwIb0AyDu2guJKXqUP43gY8UAiUlgSrTkRwaI9Gr9DMQ/L5k4WN7eq5bW2UVYvTXjFkXF0SPxf8W
        fkLT59sFyGVQA3mp3PGzs2L1Mbe2DX5koR5yTZZ8jie+17aM9nBQGxz2gfzVHrOh6DH4/vEDSWFAZ
        yX/d6ApSZ29k0UsZh0+Z2n5nZ5FPng81YF0goFfYf7AOEnz3W1QbNZ4XUo/KAXBWSAuhckR82VX7u
        lbX7VV2g==;
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
        id 1o907k-007IRA-Rr; Wed, 06 Jul 2022 08:11:04 +0000
Date:   Wed, 6 Jul 2022 01:11:04 -0700
From:   Christoph Hellwig <hch@infradead.org>
To:     gjoyce@linux.vnet.ibm.com
Cc:     keyrings@vger.kernel.org, gjoyce@ibm.com, dhowells@redhat.com,
        jarkko@kernel.org, andrzej.jakowski@intel.com,
        jonathan.derrick@linux.dev, drmiller.lnx@gmail.com,
        linux-block@vger.kernel.org, greg@gilhooley.com
Subject: Re: [PATCH 4/4] arch_vars: create arch specific permanent store
Message-ID: <YsVDmPyjHLIZm+Qn@infradead.org>
References: <20220706023935.875994-1-gjoyce@linux.vnet.ibm.com>
 <20220706023935.875994-5-gjoyce@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220706023935.875994-5-gjoyce@linux.vnet.ibm.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Tue, Jul 05, 2022 at 09:39:35PM -0500, gjoyce@linux.vnet.ibm.com wrote:
> From: Greg Joyce <gjoyce@linux.vnet.ibm.com>
> 
> Platforms that have a permanent key store may provide unique
> platform dependent functions to read/write variables. The
> default (weak) functions return -EOPNOTSUPP unless overridden
> by architecture/platform versions.

Which is none as of this patch set, as is the number of of users of
this API.  Did this slip in by accident?
