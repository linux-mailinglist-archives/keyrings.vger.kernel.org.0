Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 47EE1578C6F
	for <lists+keyrings@lfdr.de>; Mon, 18 Jul 2022 23:07:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231495AbiGRVHM (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Mon, 18 Jul 2022 17:07:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234619AbiGRVHL (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Mon, 18 Jul 2022 17:07:11 -0400
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 085203247E;
        Mon, 18 Jul 2022 14:07:09 -0700 (PDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26IKhb3I026530;
        Mon, 18 Jul 2022 21:07:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=IOJ6yiy8wbfQMdQh+pSvIqB+Ut+Us19cHlLUEiwP+YA=;
 b=qS/hOAY+WRvVlHUQJ1IrWGcb3RHsPOsEcP84pXylK8yPM4Vg1vpgl8EKzlIISYRUP8MS
 +s7oq2RClnPna5Fi8FtSOssyYvwxfHH5Y6Q2zsMmNbqiszNFflmI84JEms5ijZfvQTSu
 Q6yg5QR0al/AZ0tMwHt2I9hgQK5PIqGFKsjSsS/ggDZUDBJnfVU9twD4OahbUYbQPYLP
 FTpBeEB61Ip+Kn5QbaXlNDBRN52YkzkDyRoTGG/eSBYG9qYfMDd6oPy3ViIN7Lkwf+FK
 AdLv9SB3kc7DFXvZnL7WKFYdeqH5+/MUjRnNVrV1cgt8hW3AtJdnNyMX1bNpVfAy8xP9 Ag== 
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hdet7gdcq-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 18 Jul 2022 21:07:04 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
        by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 26IKilLg005942;
        Mon, 18 Jul 2022 21:07:04 GMT
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com [169.55.91.170])
        by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hdet7gdce-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 18 Jul 2022 21:07:03 +0000
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
        by ppma02wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 26IKpkvh021325;
        Mon, 18 Jul 2022 21:02:03 GMT
Received: from b03cxnp07027.gho.boulder.ibm.com (b03cxnp07027.gho.boulder.ibm.com [9.17.130.14])
        by ppma02wdc.us.ibm.com with ESMTP id 3hbmy9782t-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 18 Jul 2022 21:02:03 +0000
Received: from b03ledav006.gho.boulder.ibm.com (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
        by b03cxnp07027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 26IL221R14221596
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 18 Jul 2022 21:02:02 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 1ADBCC605A;
        Mon, 18 Jul 2022 21:02:02 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 42E40C6055;
        Mon, 18 Jul 2022 21:02:01 +0000 (GMT)
Received: from rhel-laptop.ibm.com.com (unknown [9.160.81.14])
        by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
        Mon, 18 Jul 2022 21:02:01 +0000 (GMT)
From:   gjoyce@linux.vnet.ibm.com
To:     linux-block@vger.kernel.org
Cc:     keyrings@vger.kernel.org, dhowells@redhat.com, jarkko@kernel.org,
        jonathan.derrick@linux.dev, brking@linux.vnet.ibm.com,
        greg@gilhooley.com, gjoyce@ibm.com
Subject: [PATCH 3/4] block: sed-opal: keyring support for SED Opal keys
Date:   Mon, 18 Jul 2022 16:01:55 -0500
Message-Id: <20220718210156.1535955-4-gjoyce@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220718210156.1535955-1-gjoyce@linux.vnet.ibm.com>
References: <20220718210156.1535955-1-gjoyce@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: sfVTdL3elfuuWCNZ60idr2xg5ll-AGJc
X-Proofpoint-ORIG-GUID: rnG4yYY252gqc72DVhID0zmgIBnBKxZW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-18_20,2022-07-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 bulkscore=0
 mlxscore=0 malwarescore=0 clxscore=1015 spamscore=0 impostorscore=0
 suspectscore=0 priorityscore=1501 phishscore=0 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207180088
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
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

This allows the use of SED commands in scripts such as
udev scripts so that drives may be automatically unlocked
as they become available.

Signed-off-by: Greg Joyce <gjoyce@linux.vnet.ibm.com>
Reported-by: kernel test robot <lkp@intel.com>
---
 block/Kconfig                 |   1 +
 block/sed-opal.c              | 198 +++++++++++++++++++++++++++++++++-
 include/linux/sed-opal.h      |   3 +
 include/uapi/linux/sed-opal.h |   8 +-
 4 files changed, 206 insertions(+), 4 deletions(-)

diff --git a/block/Kconfig b/block/Kconfig
index 50b17e260fa2..f65169e9356b 100644
--- a/block/Kconfig
+++ b/block/Kconfig
@@ -182,6 +182,7 @@ config BLK_DEBUG_FS_ZONED
 
 config BLK_SED_OPAL
 	bool "Logic for interfacing with Opal enabled SEDs"
+	depends on KEYS
 	help
 	Builds Logic for interfacing with Opal enabled controllers.
 	Enabling this option enables users to setup/unlock/lock
diff --git a/block/sed-opal.c b/block/sed-opal.c
index feba36e54ae0..4cfc3458cba5 100644
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
+			current_cred(),
+			KEY_USR_VIEW | KEY_USR_SEARCH | KEY_USR_WRITE,
+			0,
+			NULL);
+	if (IS_ERR(key))
+		return PTR_ERR(key);
+
+	ret = key_instantiate_and_link(key, key_data, keylen,
+				       sed_opal_keyring, NULL);
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
+			      &key_type_user,
+			      key_name,
+			      true);
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
+					 opal_pw->new_user_pw.opal_key.key,
+					 opal_pw->new_user_pw.opal_key.key_len);
+		if (ret != -EOPNOTSUPP)
+			pr_warn("error updating SED key: %d\n", ret);
+
+		ret = update_sed_opal_key(OPAL_AUTH_KEY,
+					 opal_pw->new_user_pw.opal_key.key,
+					 opal_pw->new_user_pw.opal_key.key_len);
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
+			   GLOBAL_ROOT_UID, GLOBAL_ROOT_GID, current_cred(),
+			   (KEY_POS_ALL & ~KEY_POS_SETATTR) | KEY_USR_VIEW |
+			   KEY_USR_READ | KEY_USR_SEARCH | KEY_USR_WRITE,
+			   KEY_ALLOC_NOT_IN_QUOTA,
+			   NULL, NULL);
+	if (IS_ERR(kr))
+		return PTR_ERR(kr);
+
+	sed_opal_keyring = kr;
+
+	if (arch_read_variable(ARCH_VAR_OPAL_KEY, OPAL_AUTH_KEY, init_sed_key,
+			       &keylen) < 0) {
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
2.27.0

