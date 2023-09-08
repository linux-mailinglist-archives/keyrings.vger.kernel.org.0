Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 884027989FF
	for <lists+keyrings@lfdr.de>; Fri,  8 Sep 2023 17:31:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244614AbjIHPb1 (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Fri, 8 Sep 2023 11:31:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229530AbjIHPb1 (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Fri, 8 Sep 2023 11:31:27 -0400
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F0371BFF;
        Fri,  8 Sep 2023 08:31:23 -0700 (PDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 388FI4BW021979;
        Fri, 8 Sep 2023 15:31:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=d3Q0t3vOd0JeTtWcQ6bFRKuZpMU0wg3lJ7ULat7PT70=;
 b=ptbsr+ho1kDIZi7kPJlQWmDcrICf0sF6ZLyI0c/nZj94lIQixzr19KIvABx2lJT0tlcX
 YF87uphzVBGp07KmDKa3Q2tXH+AM0IcJ+Pa0X5/BYuQXXDd/f9VX3ajZgp6qxNsJnEhP
 RNzQGsp7dRLInb35Az8S8NptqNYiyUK3XhgTkqRqRjk+kfewepcc4KEqcWCAzdFrriN6
 3WOghh05g6GsVWgVTXzsN4l1Gk9H1hiCE+v3Epko08mNp7oPDSxB0GwAUFcsHZG0wIhw
 slCplL8okkR1q0twdRKGvN5YKjj8zJEN9ZqR9oMoWtljUKVy6h+jeL48m/8srtnZNXRu jg== 
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
        by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3t05ryruue-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 08 Sep 2023 15:31:00 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
        by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 388E9Clp006625;
        Fri, 8 Sep 2023 15:30:59 GMT
Received: from smtprelay07.dal12v.mail.ibm.com ([172.16.1.9])
        by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3svgvm4dj1-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 08 Sep 2023 15:30:59 +0000
Received: from smtpav02.wdc07v.mail.ibm.com (smtpav02.wdc07v.mail.ibm.com [10.39.53.229])
        by smtprelay07.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 388FUwb637225212
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 8 Sep 2023 15:30:59 GMT
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id A133558059;
        Fri,  8 Sep 2023 15:30:58 +0000 (GMT)
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 0FBD65805F;
        Fri,  8 Sep 2023 15:30:58 +0000 (GMT)
Received: from rhel-laptop.ibm.com (unknown [9.61.45.202])
        by smtpav02.wdc07v.mail.ibm.com (Postfix) with ESMTP;
        Fri,  8 Sep 2023 15:30:57 +0000 (GMT)
From:   gjoyce@linux.vnet.ibm.com
To:     linux-block@vger.kernel.org, axboe@kernel.dk, jarkko@kernel.org
Cc:     linuxppc-dev@lists.ozlabs.org, jonathan.derrick@linux.dev,
        brking@linux.vnet.ibm.com, msuchanek@suse.de, mpe@ellerman.id.au,
        nayna@linux.ibm.com, akpm@linux-foundation.org,
        gjoyce@linux.vnet.ibm.com, keyrings@vger.kernel.org
Subject: [PATCH v7 2/3 RESEND] block: sed-opal: keystore access for SED Opal keys
Date:   Fri,  8 Sep 2023 10:30:55 -0500
Message-Id: <20230908153056.3503975-3-gjoyce@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20230908153056.3503975-1-gjoyce@linux.vnet.ibm.com>
References: <20230908153056.3503975-1-gjoyce@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: G0OdoezVarvObA9sCIBq7qk7uZoADb0u
X-Proofpoint-GUID: G0OdoezVarvObA9sCIBq7qk7uZoADb0u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-08_12,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 bulkscore=0 adultscore=0 mlxlogscore=999 spamscore=0
 clxscore=1015 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309080139
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
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

