Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2C1D272885E
	for <lists+keyrings@lfdr.de>; Thu,  8 Jun 2023 21:27:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229870AbjFHT1A (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 8 Jun 2023 15:27:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229659AbjFHT07 (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 8 Jun 2023 15:26:59 -0400
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 500DD1BF0;
        Thu,  8 Jun 2023 12:26:58 -0700 (PDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 358JPNeb024131;
        Thu, 8 Jun 2023 19:26:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=A0rVInPPpLk3tAjb6K8FJqTqVqkXjAWUqcBagBRWUQo=;
 b=Q6ATu09EsREY8H8YTStCGC6FFqG8n8yzMKOtG1a+FAZnpeX49Xo77Yi46pibYCaETHOh
 WExLCKQ0niFfvHtfha67tEp7GPrp+JijO15qhcLK/sEnMnk8wYmx4tu1f1cEB4yRJpo/
 Bssdy07QsZC5ONFaX5sStSev9jl0Fg96oVxqsKBq25w20FEbhF4bquXzf12gbP6RtlM8
 VVdckcuTXQgIexz5TpD4klhz90snH98cd3XqtU+dOUqkXRrWSqUkV4cj/FhpHf8AENIW
 hRRJCPWT6LgqqMgNdPNIGA8ioAHnp/k7Xm7RfzahJw3De5BViz8Djv7o9vEYyrIRnTzJ 9A== 
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com [169.63.214.131])
        by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3r3n4qr0uv-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 08 Jun 2023 19:26:46 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
        by ppma01dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 358HADpe008966;
        Thu, 8 Jun 2023 19:26:45 GMT
Received: from smtprelay04.wdc07v.mail.ibm.com ([9.208.129.114])
        by ppma01dal.us.ibm.com (PPS) with ESMTPS id 3r2a77frne-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 08 Jun 2023 19:26:45 +0000
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com [10.241.53.105])
        by smtprelay04.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 358JQh7e34210376
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 8 Jun 2023 19:26:44 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id AB97658065;
        Thu,  8 Jun 2023 19:26:43 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 8048858043;
        Thu,  8 Jun 2023 19:26:43 +0000 (GMT)
Received: from rhel-laptop.ibm.com (unknown [9.61.61.30])
        by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
        Thu,  8 Jun 2023 19:26:43 +0000 (GMT)
From:   gjoyce@linux.vnet.ibm.com
To:     linux-block@vger.kernel.org
Cc:     linuxppc-dev@lists.ozlabs.org, jonathan.derrick@linux.dev,
        brking@linux.vnet.ibm.com, msuchanek@suse.de, mpe@ellerman.id.au,
        nayna@linux.ibm.com, axboe@kernel.dk, akpm@linux-foundation.org,
        gjoyce@linux.vnet.ibm.com, keyrings@vger.kernel.org
Subject: [PATCH v5 2/3] block: sed-opal: Implement IOC_OPAL_REVERT_LSP
Date:   Thu,  8 Jun 2023 14:26:41 -0500
Message-Id: <20230608192642.516566-3-gjoyce@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230608192642.516566-1-gjoyce@linux.vnet.ibm.com>
References: <20230608192642.516566-1-gjoyce@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: rexsXRteaJqKJuIChbqx0L80vVnYAQ14
X-Proofpoint-ORIG-GUID: rexsXRteaJqKJuIChbqx0L80vVnYAQ14
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-08_14,2023-06-08_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 malwarescore=0 adultscore=0 mlxlogscore=999 spamscore=0
 bulkscore=0 suspectscore=0 phishscore=0 impostorscore=0 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306080165
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
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
index a4e56845dd82..dec7ce3a3edb 100644
--- a/block/opal_proto.h
+++ b/block/opal_proto.h
@@ -225,6 +225,10 @@ enum opal_parameter {
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
index 67c6c4f2b4b0..e2aed7f4ebdf 100644
--- a/block/sed-opal.c
+++ b/block/sed-opal.c
@@ -1769,6 +1769,26 @@ static int internal_activate_user(struct opal_dev *dev, void *data)
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
@@ -2463,6 +2483,23 @@ static int opal_get_discv(struct opal_dev *dev, struct opal_discovery *discv)
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
@@ -3084,6 +3121,9 @@ int sed_ioctl(struct opal_dev *dev, unsigned int cmd, void __user *arg)
 	case IOC_OPAL_GET_GEOMETRY:
 		ret = opal_get_geometry(dev, arg);
 		break;
+	case IOC_OPAL_REVERT_LSP:
+		ret = opal_revertlsp(dev, p);
+		break;
 	case IOC_OPAL_DISCOVERY:
 		ret = opal_get_discv(dev, p);
 		break;
diff --git a/include/linux/sed-opal.h b/include/linux/sed-opal.h
index ef65f589fbeb..2f189546e133 100644
--- a/include/linux/sed-opal.h
+++ b/include/linux/sed-opal.h
@@ -48,6 +48,7 @@ static inline bool is_sed_ioctl(unsigned int cmd)
 	case IOC_OPAL_GET_LR_STATUS:
 	case IOC_OPAL_GET_GEOMETRY:
 	case IOC_OPAL_DISCOVERY:
+	case IOC_OPAL_REVERT_LSP:
 		return true;
 	}
 	return false;
diff --git a/include/uapi/linux/sed-opal.h b/include/uapi/linux/sed-opal.h
index 7f5732c5bdc5..4e10675751b4 100644
--- a/include/uapi/linux/sed-opal.h
+++ b/include/uapi/linux/sed-opal.h
@@ -56,6 +56,10 @@ struct opal_key {
 	__u8 key[OPAL_KEY_MAX];
 };
 
+enum opal_revert_lsp_opts {
+	OPAL_PRESERVE = 0x01,
+};
+
 struct opal_lr_act {
 	struct opal_key key;
 	__u32 sum;
@@ -178,6 +182,12 @@ struct opal_discovery {
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
@@ -198,5 +208,6 @@ struct opal_discovery {
 #define IOC_OPAL_GET_LR_STATUS      _IOW('p', 237, struct opal_lr_status)
 #define IOC_OPAL_GET_GEOMETRY       _IOR('p', 238, struct opal_geometry)
 #define IOC_OPAL_DISCOVERY          _IOW('p', 239, struct opal_discovery)
+#define IOC_OPAL_REVERT_LSP         _IOW('p', 240, struct opal_revert_lsp)
 
 #endif /* _UAPI_SED_OPAL_H */
-- 
gjoyce@linux.vnet.ibm.com

