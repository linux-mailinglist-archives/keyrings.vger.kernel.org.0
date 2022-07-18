Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ED2D6578C56
	for <lists+keyrings@lfdr.de>; Mon, 18 Jul 2022 23:02:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236186AbiGRVCN (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Mon, 18 Jul 2022 17:02:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236215AbiGRVCM (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Mon, 18 Jul 2022 17:02:12 -0400
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8833D31DF7;
        Mon, 18 Jul 2022 14:02:10 -0700 (PDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26IKpxKH002093;
        Mon, 18 Jul 2022 21:02:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=Ap49PWueJeKVoTv6SZCd/XAs6pldeSZYmwtpVrg6JBw=;
 b=eEKZujSxcJBw+MmbfniGm4SaSQrJtGFpxNERwNkgnNNM8AzvEzoV3rfKZJHPzenvKUL5
 UlWVtgtva3y0be5zSUAXRFWpBgwSpEBaNiOi8eGIPRVswDJGV2Z0tfOnScUR1f7tF/PR
 vaYkIhXvvmAzi4poPxlz7eNxBjK+k/RoupYV3OccAYoN0+mhxNU0C1mjgIkUJCAbAiRD
 POXrBklZ+98bc1toHih/C+l65QKP8uPdHK8K9vLKzASLGhaU+GYe+1aA1gNwGT0OwlLR
 RQzRNSOzSs0UVLREj6kj3sa0FKWv7AjwbRHk/PH0cbZSL6bmXIf6DkKUWKYmqHdDMwTb 8Q== 
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hdexb05ms-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 18 Jul 2022 21:02:03 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
        by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 26IKsE57012616;
        Mon, 18 Jul 2022 21:02:03 GMT
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com [169.63.214.131])
        by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hdexb05ma-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 18 Jul 2022 21:02:03 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
        by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 26IKogWO010875;
        Mon, 18 Jul 2022 21:02:02 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
        by ppma01dal.us.ibm.com with ESMTP id 3hbmy9b0db-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 18 Jul 2022 21:02:02 +0000
Received: from b03ledav006.gho.boulder.ibm.com (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
        by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 26IL21Pc37618004
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 18 Jul 2022 21:02:01 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 123ECC6059;
        Mon, 18 Jul 2022 21:02:01 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 42AF9C6057;
        Mon, 18 Jul 2022 21:02:00 +0000 (GMT)
Received: from rhel-laptop.ibm.com.com (unknown [9.160.81.14])
        by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
        Mon, 18 Jul 2022 21:02:00 +0000 (GMT)
From:   gjoyce@linux.vnet.ibm.com
To:     linux-block@vger.kernel.org
Cc:     keyrings@vger.kernel.org, dhowells@redhat.com, jarkko@kernel.org,
        jonathan.derrick@linux.dev, brking@linux.vnet.ibm.com,
        greg@gilhooley.com, gjoyce@ibm.com
Subject: [PATCH 2/4] block: sed-opal: Implement IOC_OPAL_REVERT_LSP
Date:   Mon, 18 Jul 2022 16:01:54 -0500
Message-Id: <20220718210156.1535955-3-gjoyce@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220718210156.1535955-1-gjoyce@linux.vnet.ibm.com>
References: <20220718210156.1535955-1-gjoyce@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 7KsGiuzBb4JVLInBmpkFHq9dVTb4hUqz
X-Proofpoint-ORIG-GUID: PqlVxp7Pwx9wR1HEuFIwUlciDwQPlaD_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-18_18,2022-07-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 clxscore=1015 mlxscore=0 phishscore=0
 bulkscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207180086
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

From: Greg Joyce <gjoyce@linux.vnet.ibm.com>

This is used in conjunction with IOC_OPAL_REVERT_TPR to return a drive to
Original Factory State without erasing the data. If IOC_OPAL_REVERT_LSP
is called with opal_revert_lsp.options bit OPAL_PRESERVE set prior
to calling IOC_OPAL_REVERT_TPR, the drive global locking range will not
be erased.

Signed-off-by: Greg Joyce <gjoyce@linux.vnet.ibm.com>
---
 block/opal_proto.h            |  4 ++++
 block/sed-opal.c              | 42 ++++++++++++++++++++++++++++++++++-
 include/linux/sed-opal.h      |  1 +
 include/uapi/linux/sed-opal.h |  9 ++++++++
 4 files changed, 55 insertions(+), 1 deletion(-)

diff --git a/block/opal_proto.h b/block/opal_proto.h
index b486b3ec7dc4..6127c08267f8 100644
--- a/block/opal_proto.h
+++ b/block/opal_proto.h
@@ -210,6 +210,10 @@ enum opal_parameter {
 	OPAL_SUM_SET_LIST = 0x060000,
 };
 
+enum opal_revertlsp {
+	OPAL_KEEP_GLOBAL_RANGE_KEY = 0x060000,
+};
+
 /* Packets derived from:
  * TCG_Storage_Architecture_Core_Spec_v2.01_r1.00
  * Secion: 3.2.3 ComPackets, Packets & Subpackets
diff --git a/block/sed-opal.c b/block/sed-opal.c
index 4b9a7ffbf00f..feba36e54ae0 100644
--- a/block/sed-opal.c
+++ b/block/sed-opal.c
@@ -448,7 +448,7 @@ static int opal_discovery0_end(struct opal_dev *dev, void *data)
 
 	if (discv_out) {
 		buf_out = (u8 __user *)(uintptr_t)discv_out->data;
-		len_out = min(discv_out->size, (u64)hlen);
+		len_out = min_t(u64, discv_out->size, hlen);
 		if (buf_out && copy_to_user(buf_out, dev->resp, len_out)) {
 			return -EFAULT;
 		}
@@ -1592,6 +1592,26 @@ static int internal_activate_user(struct opal_dev *dev, void *data)
 	return finalize_and_send(dev, parse_and_check_status);
 }
 
+static int revert_lsp(struct opal_dev *dev, void *data)
+{
+	struct opal_revert_lsp *rev = data;
+	int err;
+
+	err = cmd_start(dev, opaluid[OPAL_THISSP_UID],
+			opalmethod[OPAL_REVERTSP]);
+	add_token_u8(&err, dev, OPAL_STARTNAME);
+	add_token_u64(&err, dev, OPAL_KEEP_GLOBAL_RANGE_KEY);
+	add_token_u8(&err, dev, (rev->options & OPAL_PRESERVE) ?
+			OPAL_TRUE : OPAL_FALSE);
+	add_token_u8(&err, dev, OPAL_ENDNAME);
+	if (err) {
+		pr_debug("Error building REVERT SP command.\n");
+		return err;
+	}
+
+	return finalize_and_send(dev, parse_and_check_status);
+}
+
 static int erase_locking_range(struct opal_dev *dev, void *data)
 {
 	struct opal_session_info *session = data;
@@ -2207,6 +2227,23 @@ static int opal_get_discv(struct opal_dev *dev, struct opal_discovery *discv)
 	return discv->size; /* modified to actual length of data */
 }
 
+static int opal_revertlsp(struct opal_dev *dev, struct opal_revert_lsp *rev)
+{
+	/* controller will terminate session */
+	const struct opal_step steps[] = {
+		{ start_admin1LSP_opal_session, &rev->key },
+		{ revert_lsp, rev }
+	};
+	int ret;
+
+	mutex_lock(&dev->dev_lock);
+	setup_opal_dev(dev);
+	ret = execute_steps(dev, steps, ARRAY_SIZE(steps));
+	mutex_unlock(&dev->dev_lock);
+
+	return ret;
+}
+
 static int opal_erase_locking_range(struct opal_dev *dev,
 				    struct opal_session_info *opal_session)
 {
@@ -2713,6 +2750,9 @@ int sed_ioctl(struct opal_dev *dev, unsigned int cmd, void __user *arg)
 	case IOC_OPAL_GENERIC_TABLE_RW:
 		ret = opal_generic_read_write_table(dev, p);
 		break;
+	case IOC_OPAL_REVERT_LSP:
+		ret = opal_revertlsp(dev, p);
+		break;
 	case IOC_OPAL_DISCOVERY:
 		ret = opal_get_discv(dev, p);
 		break;
diff --git a/include/linux/sed-opal.h b/include/linux/sed-opal.h
index 9197b7a628f2..3a6082ff97e7 100644
--- a/include/linux/sed-opal.h
+++ b/include/linux/sed-opal.h
@@ -43,6 +43,7 @@ static inline bool is_sed_ioctl(unsigned int cmd)
 	case IOC_OPAL_MBR_DONE:
 	case IOC_OPAL_WRITE_SHADOW_MBR:
 	case IOC_OPAL_GENERIC_TABLE_RW:
+	case IOC_OPAL_REVERT_LSP:
 	case IOC_OPAL_DISCOVERY:
 		return true;
 	}
diff --git a/include/uapi/linux/sed-opal.h b/include/uapi/linux/sed-opal.h
index 114636c19d31..afbce867b906 100644
--- a/include/uapi/linux/sed-opal.h
+++ b/include/uapi/linux/sed-opal.h
@@ -51,6 +51,10 @@ struct opal_key {
 	__u8 key[OPAL_KEY_MAX];
 };
 
+enum opal_revert_lsp_opts {
+	OPAL_PRESERVE = 0x01,
+};
+
 struct opal_lr_act {
 	struct opal_key key;
 	__u32 sum;
@@ -137,6 +141,10 @@ struct opal_discovery {
 	__u64 size;
 };
 
+struct opal_revert_lsp {
+	struct opal_key key;
+	__u32 options;
+};
 
 #define IOC_OPAL_SAVE		    _IOW('p', 220, struct opal_lock_unlock)
 #define IOC_OPAL_LOCK_UNLOCK	    _IOW('p', 221, struct opal_lock_unlock)
@@ -155,5 +163,6 @@ struct opal_discovery {
 #define IOC_OPAL_WRITE_SHADOW_MBR   _IOW('p', 234, struct opal_shadow_mbr)
 #define IOC_OPAL_GENERIC_TABLE_RW   _IOW('p', 235, struct opal_read_write_table)
 #define IOC_OPAL_DISCOVERY          _IOW('p', 236, struct opal_discovery)
+#define IOC_OPAL_REVERT_LSP         _IOW('p', 237, struct opal_revert_lsp)
 
 #endif /* _UAPI_SED_OPAL_H */
-- 
2.27.0

