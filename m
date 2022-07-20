Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5B45F57B218
	for <lists+keyrings@lfdr.de>; Wed, 20 Jul 2022 09:50:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240274AbiGTHuV (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 20 Jul 2022 03:50:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240276AbiGTHuT (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 20 Jul 2022 03:50:19 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5876026AF4;
        Wed, 20 Jul 2022 00:50:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=5DC99KaVMKNvHK8g1E5RGSOPLs84rEGyapt+YMXaaQw=; b=zpOJbOJuS2bNUuK9YB2PVDxCQ0
        wdpsGwiR2nCs169wWm7n+LKiv02YfXq4AbnMtsbJEKBLZuUvyOdy8GSNKIvguExVC8OKTHozf8kxy
        pfZos4WDNLTRLJS6VYQW8OK+6IJcs2OSDh0+Dj41yEbk/Q2+Ni0jHfk3bevAJrljX047qVMHj1Iln
        tdj8KbBZDS1uhh/8YSWen+2ZthpdHLsi1+Ys6cjbacL17HR0IF0CinWUC00WvdS7KHdIaCOd5QLHP
        3+rrsFEDCRZ4Ru1Lr3TZO0lTc6kGPp0yvWuwSbzJQXe5shbsm2LdRcN3RBbRkCkofd4HizvuMZ/is
        lq/NKG+g==;
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
        id 1oE4TK-002BEi-0i; Wed, 20 Jul 2022 07:50:18 +0000
Date:   Wed, 20 Jul 2022 00:50:17 -0700
From:   Christoph Hellwig <hch@infradead.org>
To:     gjoyce@linux.vnet.ibm.com
Cc:     linux-block@vger.kernel.org, keyrings@vger.kernel.org,
        dhowells@redhat.com, jarkko@kernel.org, jonathan.derrick@linux.dev,
        brking@linux.vnet.ibm.com, greg@gilhooley.com, gjoyce@ibm.com
Subject: Re: [PATCH 4/4] arch_vars: create arch specific permanent store
Message-ID: <YtezuVYVQnqX2IsY@infradead.org>
References: <20220718210156.1535955-1-gjoyce@linux.vnet.ibm.com>
 <20220718210156.1535955-5-gjoyce@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220718210156.1535955-5-gjoyce@linux.vnet.ibm.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Mon, Jul 18, 2022 at 04:01:56PM -0500, gjoyce@linux.vnet.ibm.com wrote:
> From: Greg Joyce <gjoyce@linux.vnet.ibm.com>
> 
> Platforms that have a permanent key store may provide unique
> platform dependent functions to read/write variables. The
> default (weak) functions return -EOPNOTSUPP unless overridden
> by architecture/platform versions.

This is still lacking any useful implementation.  It also seems to be
used in patch 3 before it actually is used.

As the functionality seems optional I'd suggest to drop this patch for
now and not call it from patch 3, and do a separate series later that
adds the infrastructure, at leat one useful backend and the caller.
