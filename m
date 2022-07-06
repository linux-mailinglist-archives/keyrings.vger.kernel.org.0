Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D20A95680CA
	for <lists+keyrings@lfdr.de>; Wed,  6 Jul 2022 10:10:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229803AbiGFIKV (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 6 Jul 2022 04:10:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230217AbiGFIKT (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 6 Jul 2022 04:10:19 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90F8F19023;
        Wed,  6 Jul 2022 01:10:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=9r+J923FEPJQv/cH6Mmn6T/7RUewzcFNszEchbSd9Ug=; b=QEZVQzJQmqin0KNOkaOceAd+iH
        3c9esotQ8RlEHEr5XnoKoEViHXEYalLV/CA3panKAGQbtDTanfTjATNRAVwF6WKQigJoSylAFxjPe
        5ndlX7jIqhVn4LFFcAaWFGX6VB6QAwLzMX1jAk1cSue1sMdLTaeBhj+WYHJqMiBMohKdbnlfVeLu3
        +PVV5tb/hHzwj3CLD7gzodG2pPKvG0VniobTAAAqlAgZ4QMlM8G4D5CvKzzP6XUbItAE4UH5UbVyy
        GOEVzytgWGN3gMg5/waemqSmJQr2uGtZMbjeaZR+YtqE+dCPOthF/36F0myGW9LdZcL0gHH+kNJ82
        kGm6CTkg==;
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
        id 1o9070-007I9t-Qf; Wed, 06 Jul 2022 08:10:18 +0000
Date:   Wed, 6 Jul 2022 01:10:18 -0700
From:   Christoph Hellwig <hch@infradead.org>
To:     gjoyce@linux.vnet.ibm.com
Cc:     keyrings@vger.kernel.org, gjoyce@ibm.com, dhowells@redhat.com,
        jarkko@kernel.org, andrzej.jakowski@intel.com,
        jonathan.derrick@linux.dev, drmiller.lnx@gmail.com,
        linux-block@vger.kernel.org, greg@gilhooley.com
Subject: Re: [PATCH 1/4] block: sed-opal: Implement IOC_OPAL_DISCOVERY
Message-ID: <YsVDai/vqMQEeduV@infradead.org>
References: <20220706023935.875994-1-gjoyce@linux.vnet.ibm.com>
 <20220706023935.875994-2-gjoyce@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220706023935.875994-2-gjoyce@linux.vnet.ibm.com>
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

On Tue, Jul 05, 2022 at 09:39:32PM -0500, gjoyce@linux.vnet.ibm.com wrote:
> From: Greg Joyce <gjoyce@linux.vnet.ibm.com>
> 
> When IOC_OPAL_DISCOVERY is called, the opal_discovery structure is
> passed down to the "discovery0" step, instead of NULL for the
> normal cases during all other commands. The processing of the
> received discovery data in opal_discovery0_end() then checks for
> a non-NULL structure pointer, and if found will copy the raw
> discovery data to the provided user buffer. If the user buffer is NULL
> then no data is copied. If the user buffer is too small, then not
> all data is copied. In all cases, the return value is the length
> of the actual data received from the drive.

You don't need to describe what you do, everyone familar with C can
discover that themsevels.  Explain why you do it.
