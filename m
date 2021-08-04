Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EBE503E0399
	for <lists+keyrings@lfdr.de>; Wed,  4 Aug 2021 16:43:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238314AbhHDOn4 (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 4 Aug 2021 10:43:56 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56]:3576 "EHLO
        frasgout.his.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238396AbhHDOn4 (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 4 Aug 2021 10:43:56 -0400
Received: from fraeml709-chm.china.huawei.com (unknown [172.18.147.207])
        by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Gfvcc2mSMz6DKBM;
        Wed,  4 Aug 2021 22:43:28 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml709-chm.china.huawei.com (10.206.15.37) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 4 Aug 2021 16:43:41 +0200
Received: from localhost.localdomain (10.123.41.22) by
 lhreml710-chm.china.huawei.com (10.201.108.61) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 4 Aug 2021 15:43:41 +0100
From:   Jonathan Cameron <Jonathan.Cameron@huawei.com>
To:     <keyrings@vger.kernel.org>
CC:     <linuxarm@huawei.com>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        David Howells <dhowells@redhat.com>
Subject: [PATCH] X.509 asn1-encoder: Add linux/types.h include
Date:   Wed, 4 Aug 2021 22:40:26 +0800
Message-ID: <20210804144026.3473120-1-Jonathan.Cameron@huawei.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.123.41.22]
X-ClientProxiedBy: lhreml754-chm.china.huawei.com (10.201.108.204) To
 lhreml710-chm.china.huawei.com (10.201.108.61)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Needed as this uses size_t and without the include, the ordering
of includes in any file that includes this matters.  If you happen
to prefer alphabetical order that tends to cause problems.

Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: David Howells <dhowells@redhat.com>
---

Hit this whilst testing some additions to the asn1_encoder.

 include/linux/asn1_decoder.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/asn1_decoder.h b/include/linux/asn1_decoder.h
index 83f9c6e1e5e9..b41bce82a191 100644
--- a/include/linux/asn1_decoder.h
+++ b/include/linux/asn1_decoder.h
@@ -9,6 +9,7 @@
 #define _LINUX_ASN1_DECODER_H
 
 #include <linux/asn1.h>
+#include <linux/types.h>
 
 struct asn1_decoder;
 
-- 
2.19.1

