Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 78C1A567C08
	for <lists+keyrings@lfdr.de>; Wed,  6 Jul 2022 04:40:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231347AbiGFCj4 (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 5 Jul 2022 22:39:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231296AbiGFCjz (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Tue, 5 Jul 2022 22:39:55 -0400
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0986B19036;
        Tue,  5 Jul 2022 19:39:54 -0700 (PDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2661bpoX020311;
        Wed, 6 Jul 2022 02:39:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=hTsLsaJMr39nJGJiGOXeNBWEo6ZFt0KhvdY2AJSDn5k=;
 b=n4JA1ZrWQRRxe7zXKYCuD20zUSeQjAWOTMn6Jo0A50lzxAFk+IRFhATgISQ2eyiPMfQP
 2iKtGTQTLvm72xGXtXctFhPJklSXvmrUFlNCEKGVnJaQRTKu5UFxEX6fhEH9uyX8UrDB
 TCZf8dNaB973kJk5XUcNOFEp/gdBzMY6wR9xHEwzcZJkDttu8kKLei8Z+Po+RcaVymdz
 MzU2kbk8VbMu5rSbhn4chQK/XY5YnDxESRntaYoASX3opU/IRaVPfH1LKpdynY9TGg6C
 WpeIGuJ8VxYARIRJGro3xXntgRmbnHekyfO45VH6LhjH1Wd+ttNTC8xB7emcgSntNlE4 zQ== 
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3h50ng91vp-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 06 Jul 2022 02:39:41 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
        by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2662YJYd031348;
        Wed, 6 Jul 2022 02:39:41 GMT
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com [169.62.189.11])
        by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3h50ng91vc-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 06 Jul 2022 02:39:40 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
        by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2662aF9U006069;
        Wed, 6 Jul 2022 02:39:40 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com [9.57.198.29])
        by ppma03dal.us.ibm.com with ESMTP id 3h4v5v1y4y-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 06 Jul 2022 02:39:39 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com [9.57.199.110])
        by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2662ddhJ24379800
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 6 Jul 2022 02:39:39 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 0F14CAE064;
        Wed,  6 Jul 2022 02:39:39 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 72691AE062;
        Wed,  6 Jul 2022 02:39:38 +0000 (GMT)
Received: from rhel-laptop.ibm.com.com (unknown [9.160.24.101])
        by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
        Wed,  6 Jul 2022 02:39:38 +0000 (GMT)
From:   gjoyce@linux.vnet.ibm.com
To:     keyrings@vger.kernel.org
Cc:     gjoyce@ibm.com, dhowells@redhat.com, jarkko@kernel.org,
        andrzej.jakowski@intel.com, jonathan.derrick@linux.dev,
        drmiller.lnx@gmail.com, linux-block@vger.kernel.org,
        greg@gilhooley.com
Subject: [PATCH 1/4] block: sed-opal: Implement IOC_OPAL_DISCOVERY
Date:   Tue,  5 Jul 2022 21:39:32 -0500
Message-Id: <20220706023935.875994-2-gjoyce@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220706023935.875994-1-gjoyce@linux.vnet.ibm.com>
References: <20220706023935.875994-1-gjoyce@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: kpmRj8dtqV75W-wO3jd3Sa2d_KBo29rc
X-Proofpoint-ORIG-GUID: 3pJQu3qzXzt9FmnioHgkcLnnEcpoJ99g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-05_20,2022-06-28_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 malwarescore=0
 priorityscore=1501 phishscore=0 clxscore=1015 suspectscore=0 adultscore=0
 mlxscore=0 lowpriorityscore=0 spamscore=0 mlxlogscore=999 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2206140000
 definitions=main-2207060008
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

From: Greg Joyce <gjoyce@linux.vnet.ibm.com>

When IOC_OPAL_DISCOVERY is called, the opal_discovery structure is
passed down to the "discovery0" step, instead of NULL for the
normal cases during all other commands. The processing of the
received discovery data in opal_discovery0_end() then checks for
a non-NULL structure pointer, and if found will copy the raw
discovery data to the provided user buffer. If the user buffer is NULL
then no data is copied. If the user buffer is too small, then not
all data is copied. In all cases, the return value is the length
of the actual data received from the drive.
---
 block/sed-opal.c              | 38 ++++++++++++++++++++++++++++++++---
 include/linux/sed-opal.h      |  1 +
 include/uapi/linux/sed-opal.h |  7 +++++++
 3 files changed, 43 insertions(+), 3 deletions(-)

diff --git a/block/sed-opal.c b/block/sed-opal.c
index 9700197000f2..4b9a7ffbf00f 100644
--- a/block/sed-opal.c
+++ b/block/sed-opal.c
@@ -426,8 +426,11 @@ static int execute_steps(struct opal_dev *dev,
 	return error;
 }
 
-static int opal_discovery0_end(struct opal_dev *dev)
+static int opal_discovery0_end(struct opal_dev *dev, void *data)
 {
+	struct opal_discovery *discv_out = data; /* may be NULL */
+	u8 __user *buf_out;
+	u64 len_out;
 	bool found_com_id = false, supported = true, single_user = false;
 	const struct d0_header *hdr = (struct d0_header *)dev->resp;
 	const u8 *epos = dev->resp, *cpos = dev->resp;
@@ -443,6 +446,15 @@ static int opal_discovery0_end(struct opal_dev *dev)
 		return -EFAULT;
 	}
 
+	if (discv_out) {
+		buf_out = (u8 __user *)(uintptr_t)discv_out->data;
+		len_out = min(discv_out->size, (u64)hlen);
+		if (buf_out && copy_to_user(buf_out, dev->resp, len_out)) {
+			return -EFAULT;
+		}
+		discv_out->size = hlen; /* actual size of data */
+	}
+
 	epos += hlen; /* end of buffer */
 	cpos += sizeof(*hdr); /* current position on buffer */
 
@@ -517,13 +529,13 @@ static int opal_discovery0(struct opal_dev *dev, void *data)
 	if (ret)
 		return ret;
 
-	return opal_discovery0_end(dev);
+	return opal_discovery0_end(dev, data);
 }
 
 static int opal_discovery0_step(struct opal_dev *dev)
 {
 	const struct opal_step discovery0_step = {
-		opal_discovery0,
+		opal_discovery0, NULL
 	};
 
 	return execute_step(dev, &discovery0_step, 0);
@@ -2179,6 +2191,22 @@ static int opal_secure_erase_locking_range(struct opal_dev *dev,
 	return ret;
 }
 
+static int opal_get_discv(struct opal_dev *dev, struct opal_discovery *discv)
+{
+	const struct opal_step discovery0_step = {
+		opal_discovery0, discv
+	};
+	int ret = 0;
+
+	mutex_lock(&dev->dev_lock);
+	setup_opal_dev(dev);
+	ret = execute_step(dev, &discovery0_step, 0);
+	mutex_unlock(&dev->dev_lock);
+	if (ret)
+		return ret;
+	return discv->size; /* modified to actual length of data */
+}
+
 static int opal_erase_locking_range(struct opal_dev *dev,
 				    struct opal_session_info *opal_session)
 {
@@ -2685,6 +2713,10 @@ int sed_ioctl(struct opal_dev *dev, unsigned int cmd, void __user *arg)
 	case IOC_OPAL_GENERIC_TABLE_RW:
 		ret = opal_generic_read_write_table(dev, p);
 		break;
+	case IOC_OPAL_DISCOVERY:
+		ret = opal_get_discv(dev, p);
+		break;
+
 	default:
 		break;
 	}
diff --git a/include/linux/sed-opal.h b/include/linux/sed-opal.h
index 1ac0d712a9c3..9197b7a628f2 100644
--- a/include/linux/sed-opal.h
+++ b/include/linux/sed-opal.h
@@ -43,6 +43,7 @@ static inline bool is_sed_ioctl(unsigned int cmd)
 	case IOC_OPAL_MBR_DONE:
 	case IOC_OPAL_WRITE_SHADOW_MBR:
 	case IOC_OPAL_GENERIC_TABLE_RW:
+	case IOC_OPAL_DISCOVERY:
 		return true;
 	}
 	return false;
diff --git a/include/uapi/linux/sed-opal.h b/include/uapi/linux/sed-opal.h
index 6f5af1a84213..114636c19d31 100644
--- a/include/uapi/linux/sed-opal.h
+++ b/include/uapi/linux/sed-opal.h
@@ -132,6 +132,12 @@ struct opal_read_write_table {
 	__u64 priv;
 };
 
+struct opal_discovery {
+	__u64 data;
+	__u64 size;
+};
+
+
 #define IOC_OPAL_SAVE		    _IOW('p', 220, struct opal_lock_unlock)
 #define IOC_OPAL_LOCK_UNLOCK	    _IOW('p', 221, struct opal_lock_unlock)
 #define IOC_OPAL_TAKE_OWNERSHIP	    _IOW('p', 222, struct opal_key)
@@ -148,5 +154,6 @@ struct opal_read_write_table {
 #define IOC_OPAL_MBR_DONE           _IOW('p', 233, struct opal_mbr_done)
 #define IOC_OPAL_WRITE_SHADOW_MBR   _IOW('p', 234, struct opal_shadow_mbr)
 #define IOC_OPAL_GENERIC_TABLE_RW   _IOW('p', 235, struct opal_read_write_table)
+#define IOC_OPAL_DISCOVERY          _IOW('p', 236, struct opal_discovery)
 
 #endif /* _UAPI_SED_OPAL_H */
-- 
gjoyce@linux.vnet.ibm.com

