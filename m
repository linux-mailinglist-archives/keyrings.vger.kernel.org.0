Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0BB7763CBC2
	for <lists+keyrings@lfdr.de>; Wed, 30 Nov 2022 00:25:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229497AbiK2XZ3 (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 29 Nov 2022 18:25:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229512AbiK2XZ1 (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Tue, 29 Nov 2022 18:25:27 -0500
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF5DC6E54C;
        Tue, 29 Nov 2022 15:25:26 -0800 (PST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2ATLjLDQ013155;
        Tue, 29 Nov 2022 23:25:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=7K1NmXp5KOWtAAer0JsoJc5GR2SWD5IjzDo/U1f/t/Q=;
 b=dvQZ2vQ+rl7MkIIY1GMbtQ+IzUUffJNstWqTwVex3gwDWBgiZFVRr3DQ5AjQuFEa44DM
 NuPJ56LX2rp3vNskrHUJXNISu+sNn/PxGUN6WdN+y2WSC55i14VGDR/lK2ha9xldxS5B
 veT6WGaCeRQcabiUwit8VQSsCqds0F+F1HXBlNctS8dJN0L6/YzRDUB8agavFFYI6nTS
 n5vkC6Af/vKUJJOGJqXBHXmIdrqcEthYiDS7Beq/Z+TJvHUb/WMXVJlZDijeKPEg08rq
 09/xjWbkmQ8rdGEwQqQUlcdJeurjZqjEDOLXWjKOAW2c+DhIn4LWMiMJVJEyiCM/+Jod cQ== 
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com [169.62.189.11])
        by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3m5ngpjhbx-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 29 Nov 2022 23:25:15 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
        by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2ATNJp6O020612;
        Tue, 29 Nov 2022 23:25:14 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
        by ppma03dal.us.ibm.com with ESMTP id 3m3ae9p2ph-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 29 Nov 2022 23:25:14 +0000
Received: from smtpav03.dal12v.mail.ibm.com ([9.208.128.129])
        by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2ATNPBSO49480146
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 29 Nov 2022 23:25:11 GMT
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 729525805A;
        Tue, 29 Nov 2022 23:25:12 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 53EF458056;
        Tue, 29 Nov 2022 23:25:11 +0000 (GMT)
Received: from rhel-laptop.ibm.com.com (unknown [9.160.99.100])
        by smtpav03.dal12v.mail.ibm.com (Postfix) with ESMTP;
        Tue, 29 Nov 2022 23:25:11 +0000 (GMT)
From:   gjoyce@linux.vnet.ibm.com
To:     linux-block@vger.kernel.org
Cc:     linuxppc-dev@lists.ozlabs.org, jonathan.derrick@linux.dev,
        brking@linux.vnet.ibm.com, msuchanek@suse.de, mpe@ellerman.id.au,
        nayna@linux.ibm.com, axboe@kernel.dk, akpm@linux-foundation.org,
        gjoyce@linux.vnet.ibm.com, keyrings@vger.kernel.org
Subject: [PATCH v3 2/3] block: sed-opal: Implement IOC_OPAL_REVERT_LSP
Date:   Tue, 29 Nov 2022 17:25:05 -0600
Message-Id: <20221129232506.3735672-3-gjoyce@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20221129232506.3735672-1-gjoyce@linux.vnet.ibm.com>
References: <20221129232506.3735672-1-gjoyce@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: xTXBCZ20C_Kr95DuzpT995d0ob1JWQh1
X-Proofpoint-GUID: xTXBCZ20C_Kr95DuzpT995d0ob1JWQh1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-29_13,2022-11-29_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 lowpriorityscore=0 bulkscore=0 malwarescore=0 clxscore=1015 mlxscore=0
 phishscore=0 impostorscore=0 spamscore=0 priorityscore=1501 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211290138
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
Reviewed-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Jonathan Derrick <jonathan.derrick@linux.dev>
---
 block/opal_proto.h            |  4 ++++
 block/sed-opal.c              | 40 +++++++++++++++++++++++++++++++++++
 include/linux/sed-opal.h      |  1 +
 include/uapi/linux/sed-opal.h | 11 ++++++++++
 4 files changed, 56 insertions(+)

diff --git a/block/opal_proto.h b/block/opal_proto.h
index 7152aa1f1a49..c3b5bff0b9e4 100644
--- a/block/opal_proto.h
+++ b/block/opal_proto.h
@@ -215,6 +215,10 @@ enum opal_parameter {
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
index 0e65ac0cd69e..993b2b7cc4c2 100644
--- a/block/sed-opal.c
+++ b/block/sed-opal.c
@@ -1632,6 +1632,26 @@ static int internal_activate_user(struct opal_dev *dev, void *data)
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
@@ -2273,6 +2293,23 @@ static int opal_get_discv(struct opal_dev *dev, struct opal_discovery *discv)
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
@@ -2801,6 +2838,9 @@ int sed_ioctl(struct opal_dev *dev, unsigned int cmd, void __user *arg)
 	case IOC_OPAL_GET_STATUS:
 		ret = opal_get_status(dev, arg);
 		break;
+	case IOC_OPAL_REVERT_LSP:
+		ret = opal_revertlsp(dev, p);
+		break;
 	case IOC_OPAL_DISCOVERY:
 		ret = opal_get_discv(dev, p);
 		break;
diff --git a/include/linux/sed-opal.h b/include/linux/sed-opal.h
index ef62e9292b27..7131d7f0eec2 100644
--- a/include/linux/sed-opal.h
+++ b/include/linux/sed-opal.h
@@ -45,6 +45,7 @@ static inline bool is_sed_ioctl(unsigned int cmd)
 	case IOC_OPAL_GENERIC_TABLE_RW:
 	case IOC_OPAL_GET_STATUS:
 	case IOC_OPAL_DISCOVERY:
+	case IOC_OPAL_REVERT_LSP:
 		return true;
 	}
 	return false;
diff --git a/include/uapi/linux/sed-opal.h b/include/uapi/linux/sed-opal.h
index fb6f7fa1e3fd..fccde168e90c 100644
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
@@ -149,6 +153,12 @@ struct opal_discovery {
 	__u64 size;
 };
 
+struct opal_revert_lsp {
+	struct opal_key key;
+	__u32 options;
+	__u32 __pad;
+};
+
 #define IOC_OPAL_SAVE		    _IOW('p', 220, struct opal_lock_unlock)
 #define IOC_OPAL_LOCK_UNLOCK	    _IOW('p', 221, struct opal_lock_unlock)
 #define IOC_OPAL_TAKE_OWNERSHIP	    _IOW('p', 222, struct opal_key)
@@ -167,5 +177,6 @@ struct opal_discovery {
 #define IOC_OPAL_GENERIC_TABLE_RW   _IOW('p', 235, struct opal_read_write_table)
 #define IOC_OPAL_GET_STATUS         _IOR('p', 236, struct opal_status)
 #define IOC_OPAL_DISCOVERY          _IOW('p', 237, struct opal_discovery)
+#define IOC_OPAL_REVERT_LSP         _IOW('p', 238, struct opal_revert_lsp)
 
 #endif /* _UAPI_SED_OPAL_H */
-- 
gjoyce@linux.vnet.ibm.com

