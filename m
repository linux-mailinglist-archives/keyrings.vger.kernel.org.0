Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B6026728879
	for <lists+keyrings@lfdr.de>; Thu,  8 Jun 2023 21:29:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229845AbjFHT3k (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 8 Jun 2023 15:29:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235430AbjFHT3g (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 8 Jun 2023 15:29:36 -0400
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F7012D6B;
        Thu,  8 Jun 2023 12:29:33 -0700 (PDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 358JPMDH024051;
        Thu, 8 Jun 2023 19:29:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=d3Q0t3vOd0JeTtWcQ6bFRKuZpMU0wg3lJ7ULat7PT70=;
 b=ivch+4LlrMeebp7q+ZTbpQDSp6G6qws4UK1ndfjV11GrcaBVSzVFc2G1W81ICgINQfdV
 pP1TX7GiVaEOjH07CKtb5SGoXbriIeHd9xH6AI6KGLZRAxXZxcvF+4bDutK0YyA9pibK
 9+4xnkkzy9814pKLrr40MZbm9ODNQcfaEwlttC9hGBAzXUF4Wr+aqtQo80u0QZhbUP5r
 lxXLePaZoOmtKVvi0o/xnhzEa17AI3MtyJaslelgfrpFxSAQTJ3cl3OVc4ohresJ1BKF
 IysG5jpHYb3yqDKc8NE9VPV+Q7Al/Gn3v1810Y5qqmcbsLlhc+mMN+VEHjBPjVdeix+S 4Q== 
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com [169.55.85.253])
        by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3r3n4qr2mx-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 08 Jun 2023 19:29:21 +0000
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
        by ppma01wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 358GowOo004502;
        Thu, 8 Jun 2023 19:29:20 GMT
Received: from smtprelay05.wdc07v.mail.ibm.com ([9.208.129.117])
        by ppma01wdc.us.ibm.com (PPS) with ESMTPS id 3r2a74a7c8-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 08 Jun 2023 19:29:20 +0000
Received: from smtpav04.dal12v.mail.ibm.com (smtpav04.dal12v.mail.ibm.com [10.241.53.103])
        by smtprelay05.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 358JTJfE7406176
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 8 Jun 2023 19:29:19 GMT
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 6D1825805E;
        Thu,  8 Jun 2023 19:29:19 +0000 (GMT)
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 3DB2458062;
        Thu,  8 Jun 2023 19:29:19 +0000 (GMT)
Received: from rhel-laptop.ibm.com (unknown [9.61.61.30])
        by smtpav04.dal12v.mail.ibm.com (Postfix) with ESMTP;
        Thu,  8 Jun 2023 19:29:19 +0000 (GMT)
From:   gjoyce@linux.vnet.ibm.com
To:     linux-block@vger.kernel.org
Cc:     linuxppc-dev@lists.ozlabs.org, jonathan.derrick@linux.dev,
        brking@linux.vnet.ibm.com, msuchanek@suse.de, mpe@ellerman.id.au,
        nayna@linux.ibm.com, axboe@kernel.dk, akpm@linux-foundation.org,
        gjoyce@linux.vnet.ibm.com, keyrings@vger.kernel.org
Subject: [PATCH v7 2/3] block: sed-opal: keystore access for SED Opal keys
Date:   Thu,  8 Jun 2023 14:29:17 -0500
Message-Id: <20230608192918.516911-3-gjoyce@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230608192918.516911-1-gjoyce@linux.vnet.ibm.com>
References: <20230608192918.516911-1-gjoyce@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Y7woHis4gmdli_xlw06R-8P3gxVpGfd8
X-Proofpoint-ORIG-GUID: Y7woHis4gmdli_xlw06R-8P3gxVpGfd8
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

Allow for permanent SED authentication keys by
reading/writing to the SED Opal non-volatile keystore.

Signed-off-by: Greg Joyce <gjoyce@linux.vnet.ibm.com>
Reviewed-by: Jonathan Derrick <jonathan.derrick@linux.dev>
---
 block/sed-opal.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/block/sed-opal.c b/block/sed-opal.c
index 6d7f25d1711b..fa23a6a60485 100644
--- a/block/sed-opal.c
+++ b/block/sed-opal.c
@@ -18,6 +18,7 @@
 #include <linux/uaccess.h>
 #include <uapi/linux/sed-opal.h>
 #include <linux/sed-opal.h>
+#include <linux/sed-opal-key.h>
 #include <linux/string.h>
 #include <linux/kdev_t.h>
 #include <linux/key.h>
@@ -3019,7 +3020,13 @@ static int opal_set_new_pw(struct opal_dev *dev, struct opal_new_pw *opal_pw)
 	if (ret)
 		return ret;
 
-	/* update keyring with new password */
+	/* update keyring and key store with new password */
+	ret = sed_write_key(OPAL_AUTH_KEY,
+			    opal_pw->new_user_pw.opal_key.key,
+			    opal_pw->new_user_pw.opal_key.key_len);
+	if (ret != -EOPNOTSUPP)
+		pr_warn("error updating SED key: %d\n", ret);
+
 	ret = update_sed_opal_key(OPAL_AUTH_KEY,
 				  opal_pw->new_user_pw.opal_key.key,
 				  opal_pw->new_user_pw.opal_key.key_len);
@@ -3292,6 +3299,8 @@ EXPORT_SYMBOL_GPL(sed_ioctl);
 static int __init sed_opal_init(void)
 {
 	struct key *kr;
+	char init_sed_key[OPAL_KEY_MAX];
+	int keylen = OPAL_KEY_MAX - 1;
 
 	kr = keyring_alloc(".sed_opal",
 			   GLOBAL_ROOT_UID, GLOBAL_ROOT_GID, current_cred(),
@@ -3304,6 +3313,11 @@ static int __init sed_opal_init(void)
 
 	sed_opal_keyring = kr;
 
-	return 0;
+	if (sed_read_key(OPAL_AUTH_KEY, init_sed_key, &keylen) < 0) {
+		memset(init_sed_key, '\0', sizeof(init_sed_key));
+		keylen = OPAL_KEY_MAX - 1;
+	}
+
+	return update_sed_opal_key(OPAL_AUTH_KEY, init_sed_key, keylen);
 }
 late_initcall(sed_opal_init);
-- 
gjoyce@linux.vnet.ibm.com

