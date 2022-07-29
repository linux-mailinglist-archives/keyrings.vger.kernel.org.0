Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C3A9F58518E
	for <lists+keyrings@lfdr.de>; Fri, 29 Jul 2022 16:27:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229937AbiG2O1M (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Fri, 29 Jul 2022 10:27:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237094AbiG2O1L (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Fri, 29 Jul 2022 10:27:11 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F80A1EEC1;
        Fri, 29 Jul 2022 07:27:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=M7NmYC/Iylm9myghHwqILim55SAUt9QrM+UZYk0eJlw=; b=yrleStE7avTSrkBuXMbjDBwNhM
        kKQwlcr1BN8AyO8fHSt50dYQ1T8FwwM8eTA0kQxbAAp2Miw+zSoYDPG68ooTKp+XRw7CXLRBGKUt4
        vXD8q6hsgHO+gqTAAQ2Ozvwefry2+yusSUl6sprF1xOASRR9ynxLvbp+SIPrZizo9U0N7JLnpGwro
        2bMqZHZPm6YmgUy71Q7YtAcBgxmmTP7ea0BX9uFegKlOwt/Tt8F3ziZr+kq0NfG1All8UpHHDiEiN
        sccTjdQPonF2bURQ6s+sFvYyQvSINkDolfPuM/83EefObjkjrRsiHh7KsWQS3bd6xgIFBLwWBqYIG
        D4seoiaw==;
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
        id 1oHQxH-005VTi-8U; Fri, 29 Jul 2022 14:27:07 +0000
Date:   Fri, 29 Jul 2022 07:27:07 -0700
From:   Christoph Hellwig <hch@infradead.org>
To:     gjoyce@linux.vnet.ibm.com
Cc:     linux-block@vger.kernel.org, keyrings@vger.kernel.org,
        dhowells@redhat.com, jarkko@kernel.org, jonathan.derrick@linux.dev,
        brking@linux.vnet.ibm.com, gjoyce@ibm.com, nayna@linux.ibm.com
Subject: Re: [PATCH 1/3] block: sed-opal: Implement IOC_OPAL_DISCOVERY
Message-ID: <YuPuOy4l6+cZbBrA@infradead.org>
References: <20220727181422.3504563-1-gjoyce@linux.vnet.ibm.com>
 <20220727181422.3504563-2-gjoyce@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220727181422.3504563-2-gjoyce@linux.vnet.ibm.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>
