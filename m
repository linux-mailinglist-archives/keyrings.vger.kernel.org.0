Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2BB88567C04
	for <lists+keyrings@lfdr.de>; Wed,  6 Jul 2022 04:40:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231317AbiGFCj4 (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 5 Jul 2022 22:39:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230398AbiGFCjz (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Tue, 5 Jul 2022 22:39:55 -0400
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DDE31A040;
        Tue,  5 Jul 2022 19:39:54 -0700 (PDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2661jjmo016578;
        Wed, 6 Jul 2022 02:39:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=eX401jgj8Z+tvyXDT4HHnKDckUSn3nVU1+qAKIyjn5E=;
 b=ckW/QTEzBw8l8hiejlKaJgJLV1Svc9UYqXPKtKtbqxv0rfnWI355e9mckLq1sj9UeVgl
 Qj4VgG6HhvwBV6JthHtWwzng6Lxs+xYMNgkWfWUG2RkFQJMudKJLCrKzF5lF8SEd+N7/
 ofhuqrYYRyZw58ACom/24luGJ3xq3sy1GdSqpvxe5O3Zv5EhxCFe9d4VkBMA3LC7rLIm
 w7kc119ApjzfkXiSNAwIaA1Lizzfyhc9TySC8Neo7aG8uNm7Cl8xOgVmUMFeB3BdB/Lr
 Jnt8UMiKB80HdKcrblcHU4gKmaJaSG/ESzYU5JJY1TCtxhs2AAml6M85WkXLiBsWuN3u iQ== 
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3h5111gvt6-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 06 Jul 2022 02:39:43 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
        by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2662cB35008169;
        Wed, 6 Jul 2022 02:39:42 GMT
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com [169.63.214.131])
        by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3h5111gvsr-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 06 Jul 2022 02:39:42 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
        by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2662ZfwL026797;
        Wed, 6 Jul 2022 02:39:41 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com [9.57.198.25])
        by ppma01dal.us.ibm.com with ESMTP id 3h4ud7a8ye-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 06 Jul 2022 02:39:41 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com [9.57.199.110])
        by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2662deva37093778
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 6 Jul 2022 02:39:40 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 6A83CAE062;
        Wed,  6 Jul 2022 02:39:40 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id CEF64AE066;
        Wed,  6 Jul 2022 02:39:39 +0000 (GMT)
Received: from rhel-laptop.ibm.com.com (unknown [9.160.24.101])
        by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
        Wed,  6 Jul 2022 02:39:39 +0000 (GMT)
From:   gjoyce@linux.vnet.ibm.com
To:     keyrings@vger.kernel.org
Cc:     gjoyce@ibm.com, dhowells@redhat.com, jarkko@kernel.org,
        andrzej.jakowski@intel.com, jonathan.derrick@linux.dev,
        drmiller.lnx@gmail.com, linux-block@vger.kernel.org,
        greg@gilhooley.com
Subject: [PATCH 3/4] block: sed-opal: keyring support for SED Opal keys.
Date:   Tue,  5 Jul 2022 21:39:34 -0500
Message-Id: <20220706023935.875994-4-gjoyce@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220706023935.875994-1-gjoyce@linux.vnet.ibm.com>
References: <20220706023935.875994-1-gjoyce@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Qkn4WfdZhtgo3RwVVxTwbLaMzOAmQ4lk
X-Proofpoint-GUID: n4D9cBLlDg3vDlhtiZbUJLjZ4DLAZfIJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-06_02,2022-06-28_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 mlxlogscore=999 clxscore=1015 priorityscore=1501 bulkscore=0
 malwarescore=0 suspectscore=0 mlxscore=0 phishscore=0 lowpriorityscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207060008
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

From: Greg Joyce <gjoyce@linux.vnet.ibm.com>

Extend the SED block driver so it can alternatively
obtain a key from a sed-opal kernel keyring. The SED
ioctls will indicate the source of the key, either
directly in the ioctl data or from the keyring.
---
 block/sed-opal.c              | 198 +++++++++++++++++++++++++++++++++-
 include/linux/sed-opal.h      |   3 +
 include/uapi/linux/sed-opal.h |   8 +-
 3 files changed, 205 insertions(+), 4 deletions(-)

diff --git a/block/sed-opal.c b/block/sed-opal.c
index feba36e54ae0..13c749e7b2fc 100644
--- a/block/sed-opal.c
+++ b/block/sed-opal.c
@@ -20,6 +20,10 @@
 #include <linux/sed-opal.h>
 #include <linux/string.h>
 #include <linux/kdev_t.h>
+#include <linux/key.h>
+#include <linux/key-type.h>
+#include <linux/arch_vars.h>
+#include <keys/user-type.h>
 
 #include "opal_proto.h"
 
@@ -29,6 +33,8 @@
 /* Number of bytes needed by cmd_finalize. */
 #define CMD_FINALIZE_BYTES_NEEDED 7
 
+static struct key *sed_opal_keyring;
+
 struct opal_step {
 	int (*fn)(struct opal_dev *dev, void *data);
 	void *data;
@@ -266,6 +272,107 @@ static void print_buffer(const u8 *ptr, u32 length)
 #endif
 }
 
+/*
+ * Allocate/update a SED Opal key and add it to the SED Opal keyring.
+ */
+static int update_sed_opal_key(const char *desc, u_char *key_data, int keylen)
+{
+	int ret;
+	struct key *key;
+
+	if (!sed_opal_keyring)
+		return -ENOKEY;
+
+	key = key_alloc(&key_type_user, desc, GLOBAL_ROOT_UID, GLOBAL_ROOT_GID,
+				current_cred(),
+				KEY_USR_VIEW | KEY_USR_SEARCH | KEY_USR_WRITE,
+				0,
+				NULL);
+	if (IS_ERR(key))
+		return PTR_ERR(key);
+
+	ret = key_instantiate_and_link(key, key_data, keylen,
+			sed_opal_keyring, NULL);
+	key_put(key);
+
+	return ret;
+}
+
+/*
+ * Read a SED Opal key from the SED Opal keyring.
+ */
+static int read_sed_opal_key(const char *key_name, u_char *buffer, int buflen)
+{
+	int ret;
+	key_ref_t kref;
+	struct key *key;
+
+	if (!sed_opal_keyring)
+		return -ENOKEY;
+
+	kref = keyring_search(make_key_ref(sed_opal_keyring, true),
+		&key_type_user,
+		key_name,
+		true);
+
+	if (IS_ERR(kref)) {
+		ret = PTR_ERR(kref);
+	} else {
+		key = key_ref_to_ptr(kref);
+		down_read(&key->sem);
+		ret = key_validate(key);
+		if (ret == 0) {
+			if (buflen > key->datalen)
+				buflen = key->datalen;
+
+			ret = key->type->read(key, (char *)buffer, buflen);
+		}
+		up_read(&key->sem);
+
+		key_ref_put(kref);
+	}
+
+	return ret;
+}
+
+static int opal_get_key(struct opal_dev *dev, struct opal_key *key)
+{
+	int ret = 0;
+
+	switch (key->key_type) {
+	case OPAL_INCLUDED:
+		/* the key is ready to use */
+		break;
+	case OPAL_KEYRING:
+		/* the key is in the keyring */
+		ret = read_sed_opal_key(OPAL_AUTH_KEY, key->key, OPAL_KEY_MAX);
+		if (ret > 0) {
+			if (ret > 255) {
+				ret = -ENOSPC;
+				goto error;
+			}
+			key->key_len = ret;
+			key->key_type = OPAL_INCLUDED;
+		}
+		break;
+	default:
+		ret = -EINVAL;
+		break;
+	}
+	if (ret < 0)
+		goto error;
+
+	/* must have a PEK by now or it's an error */
+	if (key->key_type != OPAL_INCLUDED || key->key_len == 0) {
+		ret = -EINVAL;
+		goto error;
+	}
+	return 0;
+error:
+	pr_debug("Error getting password: %d\n", ret);
+	return ret;
+}
+
 static bool check_tper(const void *data)
 {
 	const struct d0_tper_features *tper = data;
@@ -2203,6 +2310,9 @@ static int opal_secure_erase_locking_range(struct opal_dev *dev,
 	};
 	int ret;
 
+	ret = opal_get_key(dev, &opal_session->opal_key);
+	if (ret)
+		return ret;
 	mutex_lock(&dev->dev_lock);
 	setup_opal_dev(dev);
 	ret = execute_steps(dev, erase_steps, ARRAY_SIZE(erase_steps));
@@ -2236,6 +2346,9 @@ static int opal_revertlsp(struct opal_dev *dev, struct opal_revert_lsp *rev)
 	};
 	int ret;
 
+	ret = opal_get_key(dev, &rev->key);
+	if (ret)
+		return ret;
 	mutex_lock(&dev->dev_lock);
 	setup_opal_dev(dev);
 	ret = execute_steps(dev, steps, ARRAY_SIZE(steps));
@@ -2254,6 +2367,9 @@ static int opal_erase_locking_range(struct opal_dev *dev,
 	};
 	int ret;
 
+	ret = opal_get_key(dev, &opal_session->opal_key);
+	if (ret)
+		return ret;
 	mutex_lock(&dev->dev_lock);
 	setup_opal_dev(dev);
 	ret = execute_steps(dev, erase_steps, ARRAY_SIZE(erase_steps));
@@ -2282,6 +2398,9 @@ static int opal_enable_disable_shadow_mbr(struct opal_dev *dev,
 	    opal_mbr->enable_disable != OPAL_MBR_DISABLE)
 		return -EINVAL;
 
+	ret = opal_get_key(dev, &opal_mbr->key);
+	if (ret)
+		return ret;
 	mutex_lock(&dev->dev_lock);
 	setup_opal_dev(dev);
 	ret = execute_steps(dev, mbr_steps, ARRAY_SIZE(mbr_steps));
@@ -2307,6 +2426,9 @@ static int opal_set_mbr_done(struct opal_dev *dev,
 	    mbr_done->done_flag != OPAL_MBR_NOT_DONE)
 		return -EINVAL;
 
+	ret = opal_get_key(dev, &mbr_done->key);
+	if (ret)
+		return ret;
 	mutex_lock(&dev->dev_lock);
 	setup_opal_dev(dev);
 	ret = execute_steps(dev, mbr_steps, ARRAY_SIZE(mbr_steps));
@@ -2328,6 +2450,9 @@ static int opal_write_shadow_mbr(struct opal_dev *dev,
 	if (info->size == 0)
 		return 0;
 
+	ret = opal_get_key(dev, &info->key);
+	if (ret)
+		return ret;
 	mutex_lock(&dev->dev_lock);
 	setup_opal_dev(dev);
 	ret = execute_steps(dev, mbr_steps, ARRAY_SIZE(mbr_steps));
@@ -2384,6 +2509,9 @@ static int opal_add_user_to_lr(struct opal_dev *dev,
 		return -EINVAL;
 	}
 
+	ret = opal_get_key(dev, &lk_unlk->session.opal_key);
+	if (ret)
+		return ret;
 	mutex_lock(&dev->dev_lock);
 	setup_opal_dev(dev);
 	ret = execute_steps(dev, steps, ARRAY_SIZE(steps));
@@ -2406,6 +2534,10 @@ static int opal_reverttper(struct opal_dev *dev, struct opal_key *opal, bool psi
 
 	int ret;
 
+	ret = opal_get_key(dev, opal);
+
+	if (ret)
+		return ret;
 	mutex_lock(&dev->dev_lock);
 	setup_opal_dev(dev);
 	if (psid)
@@ -2468,6 +2600,9 @@ static int opal_lock_unlock(struct opal_dev *dev,
 	if (lk_unlk->session.who > OPAL_USER9)
 		return -EINVAL;
 
+	ret = opal_get_key(dev, &lk_unlk->session.opal_key);
+	if (ret)
+		return ret;
 	mutex_lock(&dev->dev_lock);
 	ret = __opal_lock_unlock(dev, lk_unlk);
 	mutex_unlock(&dev->dev_lock);
@@ -2490,6 +2625,9 @@ static int opal_take_ownership(struct opal_dev *dev, struct opal_key *opal)
 	if (!dev)
 		return -ENODEV;
 
+	ret = opal_get_key(dev, opal);
+	if (ret)
+		return ret;
 	mutex_lock(&dev->dev_lock);
 	setup_opal_dev(dev);
 	ret = execute_steps(dev, owner_steps, ARRAY_SIZE(owner_steps));
@@ -2512,6 +2650,9 @@ static int opal_activate_lsp(struct opal_dev *dev,
 	if (!opal_lr_act->num_lrs || opal_lr_act->num_lrs > OPAL_MAX_LRS)
 		return -EINVAL;
 
+	ret = opal_get_key(dev, &opal_lr_act->key);
+	if (ret)
+		return ret;
 	mutex_lock(&dev->dev_lock);
 	setup_opal_dev(dev);
 	ret = execute_steps(dev, active_steps, ARRAY_SIZE(active_steps));
@@ -2530,6 +2671,9 @@ static int opal_setup_locking_range(struct opal_dev *dev,
 	};
 	int ret;
 
+	ret = opal_get_key(dev, &opal_lrs->session.opal_key);
+	if (ret)
+		return ret;
 	mutex_lock(&dev->dev_lock);
 	setup_opal_dev(dev);
 	ret = execute_steps(dev, lr_steps, ARRAY_SIZE(lr_steps));
@@ -2556,6 +2700,19 @@ static int opal_set_new_pw(struct opal_dev *dev, struct opal_new_pw *opal_pw)
 	ret = execute_steps(dev, pw_steps, ARRAY_SIZE(pw_steps));
 	mutex_unlock(&dev->dev_lock);
 
+	if (ret == 0) {
+		/* update keyring and arch var with new password */
+		ret = arch_write_variable(ARCH_VAR_OPAL_KEY, OPAL_AUTH_KEY,
+				opal_pw->new_user_pw.opal_key.key,
+				opal_pw->new_user_pw.opal_key.key_len);
+		if (ret != -EOPNOTSUPP)
+			pr_warn("error updating SED key: %d\n", ret);
+
+		ret = update_sed_opal_key(OPAL_AUTH_KEY,
+				opal_pw->new_user_pw.opal_key.key,
+				opal_pw->new_user_pw.opal_key.key_len);
+	}
+
 	return ret;
 }
 
@@ -2576,6 +2733,9 @@ static int opal_activate_user(struct opal_dev *dev,
 		return -EINVAL;
 	}
 
+	ret = opal_get_key(dev, &opal_session->opal_key);
+	if (ret)
+		return ret;
 	mutex_lock(&dev->dev_lock);
 	setup_opal_dev(dev);
 	ret = execute_steps(dev, act_steps, ARRAY_SIZE(act_steps));
@@ -2662,6 +2822,9 @@ static int opal_generic_read_write_table(struct opal_dev *dev,
 {
 	int ret, bit_set;
 
+	ret = opal_get_key(dev, &rw_tbl->key);
+	if (ret)
+		return ret;
 	mutex_lock(&dev->dev_lock);
 	setup_opal_dev(dev);
 
@@ -2693,9 +2856,9 @@ int sed_ioctl(struct opal_dev *dev, unsigned int cmd, void __user *arg)
 	if (!capable(CAP_SYS_ADMIN))
 		return -EACCES;
 	if (!dev)
-		return -ENOTSUPP;
+		return -EOPNOTSUPP;
 	if (!dev->supported)
-		return -ENOTSUPP;
+		return -EOPNOTSUPP;
 
 	p = memdup_user(arg, _IOC_SIZE(cmd));
 	if (IS_ERR(p))
@@ -2756,7 +2919,6 @@ int sed_ioctl(struct opal_dev *dev, unsigned int cmd, void __user *arg)
 	case IOC_OPAL_DISCOVERY:
 		ret = opal_get_discv(dev, p);
 		break;
-
 	default:
 		break;
 	}
@@ -2765,3 +2927,33 @@ int sed_ioctl(struct opal_dev *dev, unsigned int cmd, void __user *arg)
 	return ret;
 }
 EXPORT_SYMBOL_GPL(sed_ioctl);
+
+static int __init sed_opal_init(void)
+{
+	int ret;
+	struct key *kr;
+	char init_sed_key[OPAL_KEY_MAX];
+	int keylen = OPAL_KEY_MAX;
+
+	kr = keyring_alloc(".sed_opal",
+		GLOBAL_ROOT_UID, GLOBAL_ROOT_GID, current_cred(),
+		(KEY_POS_ALL & ~KEY_POS_SETATTR) | KEY_USR_VIEW |
+		KEY_USR_READ | KEY_USR_SEARCH | KEY_USR_WRITE,
+		KEY_ALLOC_NOT_IN_QUOTA,
+		NULL, NULL);
+	if (IS_ERR(kr))
+		return PTR_ERR(kr);
+
+	sed_opal_keyring = kr;
+
+	if (arch_read_variable(ARCH_VAR_OPAL_KEY, OPAL_AUTH_KEY, init_sed_key,
+				&keylen) < 0) {
+		memset(init_sed_key, '\0', sizeof(init_sed_key));
+		keylen = OPAL_KEY_MAX;
+	}
+
+	ret = update_sed_opal_key(OPAL_AUTH_KEY, init_sed_key, keylen);
+
+	return ret;
+}
+late_initcall(sed_opal_init);
diff --git a/include/linux/sed-opal.h b/include/linux/sed-opal.h
index 3a6082ff97e7..ed21e47bf773 100644
--- a/include/linux/sed-opal.h
+++ b/include/linux/sed-opal.h
@@ -24,6 +24,9 @@ bool opal_unlock_from_suspend(struct opal_dev *dev);
 struct opal_dev *init_opal_dev(void *data, sec_send_recv *send_recv);
 int sed_ioctl(struct opal_dev *dev, unsigned int cmd, void __user *ioctl_ptr);
 
+#define	OPAL_AUTH_KEY           "opal-boot-pin"
+#define	OPAL_AUTH_KEY_PREV      "opal-boot-pin-prev"
+
 static inline bool is_sed_ioctl(unsigned int cmd)
 {
 	switch (cmd) {
diff --git a/include/uapi/linux/sed-opal.h b/include/uapi/linux/sed-opal.h
index afbce867b906..aacaa4c8823f 100644
--- a/include/uapi/linux/sed-opal.h
+++ b/include/uapi/linux/sed-opal.h
@@ -44,10 +44,16 @@ enum opal_lock_state {
 	OPAL_LK = 0x04, /* 0100 */
 };
 
+enum opal_key_type {
+	OPAL_INCLUDED = 0,	/* key[] is the key */
+	OPAL_KEYRING,		/* key is in keyring */
+};
+
 struct opal_key {
 	__u8 lr;
 	__u8 key_len;
-	__u8 __align[6];
+	__u8 key_type;
+	__u8 __align[5];
 	__u8 key[OPAL_KEY_MAX];
 };
 
-- 
gjoyce@linux.vnet.ibm.com

