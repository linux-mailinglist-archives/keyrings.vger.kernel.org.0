Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 39AB14B9B0
	for <lists+keyrings@lfdr.de>; Wed, 19 Jun 2019 15:20:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730440AbfFSNUQ (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 19 Jun 2019 09:20:16 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37198 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726330AbfFSNUP (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Wed, 19 Jun 2019 09:20:15 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 020AC19CF7B;
        Wed, 19 Jun 2019 13:20:15 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-120-57.rdu2.redhat.com [10.10.120.57])
        by smtp.corp.redhat.com (Postfix) with ESMTP id BA78E1001DD1;
        Wed, 19 Jun 2019 13:20:13 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
Subject: [PATCH 10/10] keys: Add capability-checking keyctl function [ver #3]
From:   David Howells <dhowells@redhat.com>
To:     keyrings@vger.kernel.org, ebiggers@kernel.org
Cc:     dhowells@redhat.com, linux-security-module@vger.kernel.org,
        linux-kernel@vger.kernel.org
Date:   Wed, 19 Jun 2019 14:20:12 +0100
Message-ID: <156095041274.9363.11713800194055313640.stgit@warthog.procyon.org.uk>
In-Reply-To: <156095032052.9363.8954337545422131435.stgit@warthog.procyon.org.uk>
References: <156095032052.9363.8954337545422131435.stgit@warthog.procyon.org.uk>
User-Agent: StGit/unknown-version
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.29]); Wed, 19 Jun 2019 13:20:15 +0000 (UTC)
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Add a keyctl function that requests a set of capability bits to find out
what features are supported.

Signed-off-by: David Howells <dhowells@redhat.com>
---

 include/uapi/linux/keyctl.h |   14 ++++++++++++++
 security/keys/compat.c      |    3 +++
 security/keys/internal.h    |    2 ++
 security/keys/keyctl.c      |   35 +++++++++++++++++++++++++++++++++++
 4 files changed, 54 insertions(+)

diff --git a/include/uapi/linux/keyctl.h b/include/uapi/linux/keyctl.h
index fd9fb11b312b..551b5814f53e 100644
--- a/include/uapi/linux/keyctl.h
+++ b/include/uapi/linux/keyctl.h
@@ -68,6 +68,7 @@
 #define KEYCTL_PKEY_VERIFY		28	/* Verify a public key signature */
 #define KEYCTL_RESTRICT_KEYRING		29	/* Restrict keys allowed to link to a keyring */
 #define KEYCTL_MOVE			30	/* Move keys between keyrings */
+#define KEYCTL_CAPABILITIES		31	/* Find capabilities of keyrings subsystem */
 
 /* keyctl structures */
 struct keyctl_dh_params {
@@ -115,4 +116,17 @@ struct keyctl_pkey_params {
 
 #define KEYCTL_MOVE_EXCL	0x00000001 /* Do not displace from the to-keyring */
 
+/*
+ * Capabilities flags.  The capabilities list is an array of 8-bit integers;
+ * each integer can carry up to 8 flags.
+ */
+#define KEYCTL_CAPS0_CAPABILITIES	0x01 /* KEYCTL_CAPABILITIES supported */
+#define KEYCTL_CAPS0_PERSISTENT_KEYRINGS 0x02 /* Persistent keyrings enabled */
+#define KEYCTL_CAPS0_DIFFIE_HELLMAN	0x04 /* Diffie-Hellman computation enabled */
+#define KEYCTL_CAPS0_PUBLIC_KEY		0x08 /* Public key ops enabled */
+#define KEYCTL_CAPS0_BIG_KEY		0x10 /* big_key-type enabled */
+#define KEYCTL_CAPS0_INVALIDATE		0x20 /* KEYCTL_INVALIDATE supported */
+#define KEYCTL_CAPS0_RESTRICT_KEYRING	0x40 /* KEYCTL_RESTRICT_KEYRING supported */
+#define KEYCTL_CAPS0_MOVE		0x80 /* KEYCTL_MOVE supported */
+
 #endif /*  _LINUX_KEYCTL_H */
diff --git a/security/keys/compat.c b/security/keys/compat.c
index b326bc4f84d7..a53e30da20c5 100644
--- a/security/keys/compat.c
+++ b/security/keys/compat.c
@@ -162,6 +162,9 @@ COMPAT_SYSCALL_DEFINE5(keyctl, u32, option,
 	case KEYCTL_MOVE:
 		return keyctl_keyring_move(arg2, arg3, arg4, arg5);
 
+	case KEYCTL_CAPABILITIES:
+		return keyctl_capabilities(compat_ptr(arg2), arg3);
+
 	default:
 		return -EOPNOTSUPP;
 	}
diff --git a/security/keys/internal.h b/security/keys/internal.h
index b54a58c025ae..d04bff631227 100644
--- a/security/keys/internal.h
+++ b/security/keys/internal.h
@@ -329,6 +329,8 @@ static inline long keyctl_pkey_e_d_s(int op,
 }
 #endif
 
+extern long keyctl_capabilities(unsigned char __user *_buffer, size_t buflen);
+
 /*
  * Debugging key validation
  */
diff --git a/security/keys/keyctl.c b/security/keys/keyctl.c
index bbfe7d92d41c..9f418e66f067 100644
--- a/security/keys/keyctl.c
+++ b/security/keys/keyctl.c
@@ -30,6 +30,18 @@
 
 #define KEY_MAX_DESC_SIZE 4096
 
+static const unsigned char keyrings_capabilities[1] = {
+	[0] = (KEYCTL_CAPS0_CAPABILITIES |
+	       (IS_ENABLED(CONFIG_PERSISTENT_KEYRINGS)	? KEYCTL_CAPS0_PERSISTENT_KEYRINGS : 0) |
+	       (IS_ENABLED(CONFIG_KEY_DH_OPERATIONS)	? KEYCTL_CAPS0_DIFFIE_HELLMAN : 0) |
+	       (IS_ENABLED(CONFIG_ASYMMETRIC_KEY_TYPE)	? KEYCTL_CAPS0_PUBLIC_KEY : 0) |
+	       (IS_ENABLED(CONFIG_BIG_KEYS)		? KEYCTL_CAPS0_BIG_KEY : 0) |
+	       KEYCTL_CAPS0_INVALIDATE |
+	       KEYCTL_CAPS0_RESTRICT_KEYRING |
+	       KEYCTL_CAPS0_MOVE
+	       ),
+};
+
 static int key_get_type_from_user(char *type,
 				  const char __user *_type,
 				  unsigned len)
@@ -1678,6 +1690,26 @@ long keyctl_restrict_keyring(key_serial_t id, const char __user *_type,
 	return ret;
 }
 
+/*
+ * Get keyrings subsystem capabilities.
+ */
+long keyctl_capabilities(unsigned char __user *_buffer, size_t buflen)
+{
+	size_t size = buflen;
+
+	if (size > 0) {
+		if (size > sizeof(keyrings_capabilities))
+			size = sizeof(keyrings_capabilities);
+		if (copy_to_user(_buffer, keyrings_capabilities, size) != 0)
+			return -EFAULT;
+		if (size < buflen &&
+		    clear_user(_buffer + size, buflen - size) != 0)
+			return -EFAULT;
+	}
+
+	return sizeof(keyrings_capabilities);
+}
+
 /*
  * The key control system call
  */
@@ -1824,6 +1856,9 @@ SYSCALL_DEFINE5(keyctl, int, option, unsigned long, arg2, unsigned long, arg3,
 					   (key_serial_t)arg4,
 					   (unsigned int)arg5);
 
+	case KEYCTL_CAPABILITIES:
+		return keyctl_capabilities((unsigned char __user *)arg2, (size_t)arg3);
+
 	default:
 		return -EOPNOTSUPP;
 	}

