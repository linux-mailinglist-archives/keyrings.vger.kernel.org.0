Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A0627585193
	for <lists+keyrings@lfdr.de>; Fri, 29 Jul 2022 16:28:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237034AbiG2O2Q (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Fri, 29 Jul 2022 10:28:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237013AbiG2O2Q (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Fri, 29 Jul 2022 10:28:16 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE8A81EEC1;
        Fri, 29 Jul 2022 07:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=CdseDq/9q/46zOUaxxNc4hOPDYOn890ymnrMFdoXnoo=; b=cyoq8lIvuLGCdBFRqsC/VBZZGU
        /UGSqNoBY9wsZ+REHl/dC3CZy3HC/UHGEcbUxwsIBaWGsNqyjFW5hdRf38VLir7Wy7Psxbh0bQE4j
        KlFKwJ1A6eVnzYUKy25iaA6phsI28jJAbBGYJuXi+N5TiqHM7QNXypx71Tgz8WKVxbEP9S8Ii/jZl
        0OhIeUiyt5hcVJ63chbopcMNm5V9iVVJOBHv8G1fnoqr0xx9hWXrpfmZGSgUiGWw7LUuUuoxyWto3
        SKJUN+ieciixW8Kj0CrDrMxWbEldOyRSSptHquJiHrGixsqnAvt1+ac+I7I6bjSv3YmcPD3xPXiDB
        vPRI4v8g==;
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
        id 1oHQyM-005VvT-73; Fri, 29 Jul 2022 14:28:14 +0000
Date:   Fri, 29 Jul 2022 07:28:14 -0700
From:   Christoph Hellwig <hch@infradead.org>
To:     gjoyce@linux.vnet.ibm.com
Cc:     linux-block@vger.kernel.org, keyrings@vger.kernel.org,
        dhowells@redhat.com, jarkko@kernel.org, jonathan.derrick@linux.dev,
        brking@linux.vnet.ibm.com, gjoyce@ibm.com, nayna@linux.ibm.com
Subject: Re: [PATCH 3/3] block: sed-opal: keyring support for SED Opal keys
Message-ID: <YuPufn3sh99hd/r3@infradead.org>
References: <20220727181422.3504563-1-gjoyce@linux.vnet.ibm.com>
 <20220727181422.3504563-4-gjoyce@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220727181422.3504563-4-gjoyce@linux.vnet.ibm.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Looks good from the block layer POV, although my understanding of the
keyring is so limited to be useless:

Reviewed-by: Christoph Hellwig <hch@lst.de>
