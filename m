Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F0BD024C1A
	for <lists+keyrings@lfdr.de>; Tue, 21 May 2019 12:00:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726242AbfEUKAk (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 21 May 2019 06:00:40 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:51008 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726692AbfEUKAk (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Tue, 21 May 2019 06:00:40 -0400
Received: by mail-wm1-f68.google.com with SMTP id f204so2311007wme.0
        for <keyrings@vger.kernel.org>; Tue, 21 May 2019 03:00:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9mReWh06djC6FdomroWIXMESQipRJrc3j0NlZ5wbC2E=;
        b=RiyZX2rKGDpWHE/iCfVZyJWtCP5KJd6m0kPqWUmASqJXERsyxwKH7++DnA725pLItH
         /2M+8IYIcWavVspim+GS9jfkhtsBH+uVehgNohe1wOd0HXq96dYTE/nBIULhdYhTJo0S
         0AzoEuLUo0ubOel31CZ2HKXpJLH7xJjhYqkVQHOhNhDWMr7Rs9HMx3hakQGadBJck0ZV
         AoYvPiwrsQUxAwLEPbV2dLuUql/nG5HdgV25fg2KtwZbezdgdWvkWftKa/98D2Tc8Flf
         WdvWmLWgFkw59/9TAVU6f9HbdB6g8SyTEFLKqH3/3qu9yc3wIPWMJ7rySkp5ZYcMU2LN
         yGoQ==
X-Gm-Message-State: APjAAAWCupH1kgCB7s6g3eI2GagOYnjf3UfYsNDkmJo0DlTLgg4+ip57
        L15tE+TrCvUlBAchvQWHEOIaHQ==
X-Google-Smtp-Source: APXvYqxi0lAAhYVgEMIv/lzoq7qOqED09DPa7DtUWcJE7Frz+kuK59itTXGrKmUHzzGOEYACoEVuYA==
X-Received: by 2002:a1c:2109:: with SMTP id h9mr2763626wmh.68.1558432837541;
        Tue, 21 May 2019 03:00:37 -0700 (PDT)
Received: from localhost.localdomain.com (nat-pool-brq-t.redhat.com. [213.175.37.10])
        by smtp.gmail.com with ESMTPSA id i25sm2814323wmb.46.2019.05.21.03.00.36
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 May 2019 03:00:36 -0700 (PDT)
From:   Ondrej Mosnacek <omosnace@redhat.com>
To:     linux-crypto@vger.kernel.org,
        Herbert Xu <herbert@gondor.apana.org.au>
Cc:     keyrings@vger.kernel.org, David Howells <dhowells@redhat.com>,
        Stephan Mueller <smueller@chronox.de>,
        Milan Broz <gmazyland@gmail.com>,
        Ondrej Kozina <okozina@redhat.com>,
        Daniel Zatovic <dzatovic@redhat.com>
Subject: [PATCH] crypto: af_alg - implement keyring support
Date:   Tue, 21 May 2019 12:00:34 +0200
Message-Id: <20190521100034.9651-1-omosnace@redhat.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

This patch adds new socket options to AF_ALG that allow setting key from
kernel keyring. For simplicity, each keyring key type (logon, user,
trusted, encrypted) has its own socket option name and the value is just
the key description string that identifies the key to be used. The key
description doesn't need to be NULL-terminated, but bytes after the
first zero byte are ignored.

Note that this patch also adds three socket option names that are
already defined and used in libkcapi [1], but have never been added to
the kernel...

Tested via libkcapi with keyring patches [2] applied (user and logon key
types only).

[1] https://github.com/smuellerDD/libkcapi
[2] https://github.com/WOnder93/libkcapi/compare/f283458...1fb501c

Signed-off-by: Ondrej Mosnacek <omosnace@redhat.com>
---
 crypto/af_alg.c             | 150 +++++++++++++++++++++++++++++++++++-
 include/uapi/linux/if_alg.h |   7 ++
 2 files changed, 156 insertions(+), 1 deletion(-)

diff --git a/crypto/af_alg.c b/crypto/af_alg.c
index edca0998b2a4..fd6699e4dc3d 100644
--- a/crypto/af_alg.c
+++ b/crypto/af_alg.c
@@ -12,11 +12,15 @@
  *
  */
 
-#include <linux/atomic.h>
 #include <crypto/if_alg.h>
+#include <keys/user-type.h>
+#include <keys/trusted-type.h>
+#include <keys/encrypted-type.h>
+#include <linux/atomic.h>
 #include <linux/crypto.h>
 #include <linux/init.h>
 #include <linux/kernel.h>
+#include <linux/key.h>
 #include <linux/list.h>
 #include <linux/module.h>
 #include <linux/net.h>
@@ -230,6 +234,108 @@ out:
 	return err;
 }
 
+#ifdef CONFIG_KEYS
+struct alg_keyring_type {
+	struct key_type *key_type;
+	void (*key_from_payload)(void *payload, void **key, unsigned int *len);
+};
+
+static void alg_key_from_payload_user(void *payload, void **key,
+				      unsigned int *len)
+{
+	struct user_key_payload *ukp = payload;
+
+	*key = ukp->data;
+	*len = ukp->datalen;
+}
+
+static const struct alg_keyring_type alg_keyring_type_logon = {
+	.key_type = &key_type_logon,
+	.key_from_payload = &alg_key_from_payload_user,
+};
+static const struct alg_keyring_type alg_keyring_type_user = {
+	.key_type = &key_type_user,
+	.key_from_payload = &alg_key_from_payload_user,
+};
+
+#if IS_REACHABLE(CONFIG_TRUSTED_KEYS)
+static void alg_key_from_payload_trusted(void *payload, void **key,
+					 unsigned int *len)
+{
+	struct trusted_key_payload *tkp = payload;
+
+	*key = tkp->key;
+	*len = tkp->key_len;
+}
+
+static const struct alg_keyring_type alg_keyring_type_trusted = {
+	.key_type = &key_type_trusted,
+	.key_from_payload = &alg_key_from_payload_trusted,
+};
+#endif
+
+#if IS_REACHABLE(CONFIG_ENCRYPTED_KEYS)
+static void alg_key_from_payload_encrypted(void *payload, void **key,
+					   unsigned int *len)
+{
+	struct encrypted_key_payload *ekp = payload;
+
+	*key = ekp->decrypted_data;
+	*len = ekp->decrypted_datalen;
+}
+
+static const struct alg_keyring_type alg_keyring_type_encrypted = {
+	.key_type = &key_type_encrypted,
+	.key_from_payload = &alg_key_from_payload_encrypted,
+};
+#endif
+
+static int alg_setkey_keyring(struct sock *sk,
+			      const struct alg_keyring_type *type,
+			      char __user *udesc, unsigned int desclen)
+{
+	struct alg_sock *ask = alg_sk(sk);
+	struct key *key;
+	char *desc;
+	void *payload;
+	void *key_data;
+	unsigned int key_len;
+	int err;
+
+	desc = sock_kmalloc(sk, desclen + 1, GFP_KERNEL);
+	if (!desc)
+		return -ENOMEM;
+
+	if (copy_from_user(desc, udesc, desclen)) {
+		sock_kzfree_s(sk, desc, desclen + 1);
+		return -EFAULT;
+	}
+	desc[desclen] = '\0';
+
+	key = request_key(type->key_type, desc, NULL);
+	sock_kzfree_s(sk, desc, desclen + 1);
+	if (IS_ERR(key))
+		return PTR_ERR(key);
+
+	down_read(&key->sem);
+
+	payload = dereference_key_locked(key);
+	if (!payload) {
+		err = -EKEYREVOKED;
+		goto out;
+	}
+
+	type->key_from_payload(payload, &key_data, &key_len);
+
+	err = ask->type->setkey(ask->private, key_data, key_len);
+
+out:
+	up_read(&key->sem);
+	key_put(key);
+	return err;
+}
+#endif /* CONFIG_KEYS */
+
 static int alg_setsockopt(struct socket *sock, int level, int optname,
 			  char __user *optval, unsigned int optlen)
 {
@@ -256,6 +362,48 @@ static int alg_setsockopt(struct socket *sock, int level, int optname,
 			goto unlock;
 
 		err = alg_setkey(sk, optval, optlen);
+#ifdef CONFIG_KEYS
+		break;
+	case ALG_SET_KEY_KEYRING_LOGON:
+		if (sock->state == SS_CONNECTED)
+			goto unlock;
+		if (!type->setkey)
+			goto unlock;
+
+		err = alg_setkey_keyring(sk, &alg_keyring_type_logon,
+					 optval, optlen);
+		break;
+	case ALG_SET_KEY_KEYRING_USER:
+		if (sock->state == SS_CONNECTED)
+			goto unlock;
+		if (!type->setkey)
+			goto unlock;
+
+		err = alg_setkey_keyring(sk, &alg_keyring_type_user,
+					 optval, optlen);
+#if IS_REACHABLE(CONFIG_TRUSTED_KEYS)
+		break;
+	case ALG_SET_KEY_KEYRING_TRUSTED:
+		if (sock->state == SS_CONNECTED)
+			goto unlock;
+		if (!type->setkey)
+			goto unlock;
+
+		err = alg_setkey_keyring(sk, &alg_keyring_type_trusted,
+					 optval, optlen);
+#endif
+#if IS_REACHABLE(CONFIG_ENCRYPTED_KEYS)
+		break;
+	case ALG_SET_KEY_KEYRING_ENCRYPTED:
+		if (sock->state == SS_CONNECTED)
+			goto unlock;
+		if (!type->setkey)
+			goto unlock;
+
+		err = alg_setkey_keyring(sk, &alg_keyring_type_encrypted,
+					 optval, optlen);
+#endif
+#endif /* CONFIG_KEYS */
 		break;
 	case ALG_SET_AEAD_AUTHSIZE:
 		if (sock->state == SS_CONNECTED)
diff --git a/include/uapi/linux/if_alg.h b/include/uapi/linux/if_alg.h
index bc2bcdec377b..f2d777901f00 100644
--- a/include/uapi/linux/if_alg.h
+++ b/include/uapi/linux/if_alg.h
@@ -35,6 +35,13 @@ struct af_alg_iv {
 #define ALG_SET_OP			3
 #define ALG_SET_AEAD_ASSOCLEN		4
 #define ALG_SET_AEAD_AUTHSIZE		5
+#define ALG_SET_PUBKEY			6 /* reserved for future use */
+#define ALG_SET_DH_PARAMETERS		7 /* reserved for future use */
+#define ALG_SET_ECDH_CURVE		8 /* reserved for future use */
+#define ALG_SET_KEY_KEYRING_LOGON	9
+#define ALG_SET_KEY_KEYRING_USER	10
+#define ALG_SET_KEY_KEYRING_TRUSTED	11
+#define ALG_SET_KEY_KEYRING_ENCRYPTED	12
 
 /* Operations */
 #define ALG_OP_DECRYPT			0
-- 
2.20.1

