Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 253C51C21D6
	for <lists+keyrings@lfdr.de>; Sat,  2 May 2020 02:19:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726565AbgEBATv (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Fri, 1 May 2020 20:19:51 -0400
Received: from mail.zx2c4.com ([192.95.5.64]:52565 "EHLO mail.zx2c4.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726352AbgEBATu (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Fri, 1 May 2020 20:19:50 -0400
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f0e30346;
        Sat, 2 May 2020 00:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=from:to:cc
        :subject:date:message-id:in-reply-to:references:mime-version
        :content-transfer-encoding; s=mail; bh=a5taJd3wJzH3uvEYAW/BZ/Fk/
        Vs=; b=vlww3hexPeMI2AovYIEVfOyk9k9eA3F5aIRWe4ITgbeHINRGkcR+W+mEq
        Vf6/urZp5D4xxLzcBStOqEjCWlfpYqo+fDOZYVvj2KWODN9+olttRBFrBQ4dJi6T
        1eJ6cUn/1zo1lfSBlxdnBljFmZqvurHZx31apZTkDWUH1+grWYO0jnhpYo3D9UUr
        mK4z2cylb295lbA7HPMfrZ6wz6OrRsdod3cN57BM8ya2wGCkiFerfemgAPRxpkmb
        io718U8LAA8HeMiVbZ9l/aHrGkzr3Z5hnGLLtBBHZRo388GxDWUiXm+cnHidH94O
        GtANgeY0qm6HI8fK2HQxV3uR6ziRw==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 9f81296c (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
        Sat, 2 May 2020 00:07:43 +0000 (UTC)
From:   "Jason A. Donenfeld" <Jason@zx2c4.com>
To:     dhowells@redhat.com, keyrings@vger.kernel.org
Cc:     "Jason A. Donenfeld" <Jason@zx2c4.com>,
        Andy Lutomirski <luto@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Eric Biggers <ebiggers@kernel.org>,
        kernel-hardening@lists.openwall.com
Subject: [PATCH v2] security/keys: rewrite big_key crypto to use Zinc
Date:   Fri,  1 May 2020 18:19:42 -0600
Message-Id: <20200502001942.626523-1-Jason@zx2c4.com>
In-Reply-To: <CAHmME9rvp4JrER0RPp=VgYwYL87jntwW8vWNANzubH3Ah_8Oow@mail.gmail.com>
References: <CAHmME9rvp4JrER0RPp=VgYwYL87jntwW8vWNANzubH3Ah_8Oow@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

A while back, I noticed that the crypto and crypto API usage in big_keys
were entirely broken in multiple ways, so I rewrote it. Now, I'm
rewriting it again, but this time using Zinc's ChaCha20Poly1305
function. This makes the file considerably more simple; the diffstat
alone should justify this commit. It also should be faster, since it no
longer requires a mutex around the "aead api object" (nor allocations),
allowing us to encrypt multiple items in parallel. We also benefit from
being able to pass any type of pointer, so we can get rid of the
ridiculously complex custom page allocator that big_key really doesn't
need.

Cc: David Howells <dhowells@redhat.com>
Cc: Andy Lutomirski <luto@kernel.org>
Cc: Greg KH <gregkh@linuxfoundation.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Eric Biggers <ebiggers@kernel.org>
Cc: kernel-hardening@lists.openwall.com
Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
---
Changes v1->v2:
 - [Eric] Return -EBADMSG instead of -EINVAL if the authtag fails.
 - [Eric] Select CONFIG_CRYPTO, since it's required by the LIB selection.
 - [Eric] Zero out buffers that formerly contained either plaintext or
   ciphertext keys.
 - [Jason] If kernel_read() fails, return that error value, instead of
   relying on the subsequent decryption to fail.

Note v1:
 I finally got around to updating this patch from the mailing list posts
 back in 2017-2018, using the library interface that we eventually
 merged in 2019. I haven't retested this for functionality, but nothing
 much has changed, so I suspect things should still be good to go.

 security/keys/Kconfig   |   3 +-
 security/keys/big_key.c | 235 ++++++----------------------------------
 2 files changed, 33 insertions(+), 205 deletions(-)

diff --git a/security/keys/Kconfig b/security/keys/Kconfig
index 47c041563d41..7da6c1b496f9 100644
--- a/security/keys/Kconfig
+++ b/security/keys/Kconfig
@@ -61,8 +61,7 @@ config BIG_KEYS
 	depends on KEYS
 	depends on TMPFS
 	select CRYPTO
-	select CRYPTO_AES
-	select CRYPTO_GCM
+	select CRYPTO_LIB_CHACHA20POLY1305
 	help
 	  This option provides support for holding large keys within the kernel
 	  (for example Kerberos ticket caches).  The data may be stored out to
diff --git a/security/keys/big_key.c b/security/keys/big_key.c
index 82008f900930..3879fe5a5e94 100644
--- a/security/keys/big_key.c
+++ b/security/keys/big_key.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 /* Large capacity key type
  *
- * Copyright (C) 2017 Jason A. Donenfeld <Jason@zx2c4.com>. All Rights Reserved.
+ * Copyright (C) 2017-2020 Jason A. Donenfeld <Jason@zx2c4.com>. All Rights Reserved.
  * Copyright (C) 2013 Red Hat, Inc. All Rights Reserved.
  * Written by David Howells (dhowells@redhat.com)
  */
@@ -12,20 +12,10 @@
 #include <linux/file.h>
 #include <linux/shmem_fs.h>
 #include <linux/err.h>
-#include <linux/scatterlist.h>
 #include <linux/random.h>
-#include <linux/vmalloc.h>
 #include <keys/user-type.h>
 #include <keys/big_key-type.h>
-#include <crypto/aead.h>
-#include <crypto/gcm.h>
-
-struct big_key_buf {
-	unsigned int		nr_pages;
-	void			*virt;
-	struct scatterlist	*sg;
-	struct page		*pages[];
-};
+#include <crypto/chacha20poly1305.h>
 
 /*
  * Layout of key payload words.
@@ -37,14 +27,6 @@ enum {
 	big_key_len,
 };
 
-/*
- * Crypto operation with big_key data
- */
-enum big_key_op {
-	BIG_KEY_ENC,
-	BIG_KEY_DEC,
-};
-
 /*
  * If the data is under this limit, there's no point creating a shm file to
  * hold it as the permanently resident metadata for the shmem fs will be at
@@ -52,16 +34,6 @@ enum big_key_op {
  */
 #define BIG_KEY_FILE_THRESHOLD (sizeof(struct inode) + sizeof(struct dentry))
 
-/*
- * Key size for big_key data encryption
- */
-#define ENC_KEY_SIZE 32
-
-/*
- * Authentication tag length
- */
-#define ENC_AUTHTAG_SIZE 16
-
 /*
  * big_key defined keys take an arbitrary string as the description and an
  * arbitrary blob of data as the payload
@@ -75,136 +47,20 @@ struct key_type key_type_big_key = {
 	.destroy		= big_key_destroy,
 	.describe		= big_key_describe,
 	.read			= big_key_read,
-	/* no ->update(); don't add it without changing big_key_crypt() nonce */
+	/* no ->update(); don't add it without changing chacha20poly1305's nonce */
 };
 
-/*
- * Crypto names for big_key data authenticated encryption
- */
-static const char big_key_alg_name[] = "gcm(aes)";
-#define BIG_KEY_IV_SIZE		GCM_AES_IV_SIZE
-
-/*
- * Crypto algorithms for big_key data authenticated encryption
- */
-static struct crypto_aead *big_key_aead;
-
-/*
- * Since changing the key affects the entire object, we need a mutex.
- */
-static DEFINE_MUTEX(big_key_aead_lock);
-
-/*
- * Encrypt/decrypt big_key data
- */
-static int big_key_crypt(enum big_key_op op, struct big_key_buf *buf, size_t datalen, u8 *key)
-{
-	int ret;
-	struct aead_request *aead_req;
-	/* We always use a zero nonce. The reason we can get away with this is
-	 * because we're using a different randomly generated key for every
-	 * different encryption. Notably, too, key_type_big_key doesn't define
-	 * an .update function, so there's no chance we'll wind up reusing the
-	 * key to encrypt updated data. Simply put: one key, one encryption.
-	 */
-	u8 zero_nonce[BIG_KEY_IV_SIZE];
-
-	aead_req = aead_request_alloc(big_key_aead, GFP_KERNEL);
-	if (!aead_req)
-		return -ENOMEM;
-
-	memset(zero_nonce, 0, sizeof(zero_nonce));
-	aead_request_set_crypt(aead_req, buf->sg, buf->sg, datalen, zero_nonce);
-	aead_request_set_callback(aead_req, CRYPTO_TFM_REQ_MAY_SLEEP, NULL, NULL);
-	aead_request_set_ad(aead_req, 0);
-
-	mutex_lock(&big_key_aead_lock);
-	if (crypto_aead_setkey(big_key_aead, key, ENC_KEY_SIZE)) {
-		ret = -EAGAIN;
-		goto error;
-	}
-	if (op == BIG_KEY_ENC)
-		ret = crypto_aead_encrypt(aead_req);
-	else
-		ret = crypto_aead_decrypt(aead_req);
-error:
-	mutex_unlock(&big_key_aead_lock);
-	aead_request_free(aead_req);
-	return ret;
-}
-
-/*
- * Free up the buffer.
- */
-static void big_key_free_buffer(struct big_key_buf *buf)
-{
-	unsigned int i;
-
-	if (buf->virt) {
-		memset(buf->virt, 0, buf->nr_pages * PAGE_SIZE);
-		vunmap(buf->virt);
-	}
-
-	for (i = 0; i < buf->nr_pages; i++)
-		if (buf->pages[i])
-			__free_page(buf->pages[i]);
-
-	kfree(buf);
-}
-
-/*
- * Allocate a buffer consisting of a set of pages with a virtual mapping
- * applied over them.
- */
-static void *big_key_alloc_buffer(size_t len)
-{
-	struct big_key_buf *buf;
-	unsigned int npg = (len + PAGE_SIZE - 1) >> PAGE_SHIFT;
-	unsigned int i, l;
-
-	buf = kzalloc(sizeof(struct big_key_buf) +
-		      sizeof(struct page) * npg +
-		      sizeof(struct scatterlist) * npg,
-		      GFP_KERNEL);
-	if (!buf)
-		return NULL;
-
-	buf->nr_pages = npg;
-	buf->sg = (void *)(buf->pages + npg);
-	sg_init_table(buf->sg, npg);
-
-	for (i = 0; i < buf->nr_pages; i++) {
-		buf->pages[i] = alloc_page(GFP_KERNEL);
-		if (!buf->pages[i])
-			goto nomem;
-
-		l = min_t(size_t, len, PAGE_SIZE);
-		sg_set_page(&buf->sg[i], buf->pages[i], l, 0);
-		len -= l;
-	}
-
-	buf->virt = vmap(buf->pages, buf->nr_pages, VM_MAP, PAGE_KERNEL);
-	if (!buf->virt)
-		goto nomem;
-
-	return buf;
-
-nomem:
-	big_key_free_buffer(buf);
-	return NULL;
-}
-
 /*
  * Preparse a big key
  */
 int big_key_preparse(struct key_preparsed_payload *prep)
 {
-	struct big_key_buf *buf;
 	struct path *path = (struct path *)&prep->payload.data[big_key_path];
 	struct file *file;
-	u8 *enckey;
+	u8 *buf, *enckey;
 	ssize_t written;
-	size_t datalen = prep->datalen, enclen = datalen + ENC_AUTHTAG_SIZE;
+	size_t datalen = prep->datalen;
+	size_t enclen = datalen + CHACHA20POLY1305_AUTHTAG_SIZE;
 	int ret;
 
 	if (datalen <= 0 || datalen > 1024 * 1024 || !prep->data)
@@ -220,28 +76,28 @@ int big_key_preparse(struct key_preparsed_payload *prep)
 		 * to be swapped out if needed.
 		 *
 		 * File content is stored encrypted with randomly generated key.
+		 * Since the key is random for each file, we can set the nonce
+		 * to zero, provided we never define a ->update() call.
 		 */
 		loff_t pos = 0;
 
-		buf = big_key_alloc_buffer(enclen);
+		buf = kvmalloc(enclen, GFP_KERNEL);
 		if (!buf)
 			return -ENOMEM;
-		memcpy(buf->virt, prep->data, datalen);
 
 		/* generate random key */
-		enckey = kmalloc(ENC_KEY_SIZE, GFP_KERNEL);
+		enckey = kmalloc(CHACHA20POLY1305_KEY_SIZE, GFP_KERNEL);
 		if (!enckey) {
 			ret = -ENOMEM;
 			goto error;
 		}
-		ret = get_random_bytes_wait(enckey, ENC_KEY_SIZE);
+		ret = get_random_bytes_wait(enckey, CHACHA20POLY1305_KEY_SIZE);
 		if (unlikely(ret))
 			goto err_enckey;
 
-		/* encrypt aligned data */
-		ret = big_key_crypt(BIG_KEY_ENC, buf, datalen, enckey);
-		if (ret)
-			goto err_enckey;
+		/* encrypt data */
+		chacha20poly1305_encrypt(buf, prep->data, datalen, NULL, 0,
+					 0, enckey);
 
 		/* save aligned data to file */
 		file = shmem_kernel_file_setup("", enclen, 0);
@@ -250,7 +106,7 @@ int big_key_preparse(struct key_preparsed_payload *prep)
 			goto err_enckey;
 		}
 
-		written = kernel_write(file, buf->virt, enclen, &pos);
+		written = kernel_write(file, buf, enclen, &pos);
 		if (written != enclen) {
 			ret = written;
 			if (written >= 0)
@@ -265,7 +121,8 @@ int big_key_preparse(struct key_preparsed_payload *prep)
 		*path = file->f_path;
 		path_get(path);
 		fput(file);
-		big_key_free_buffer(buf);
+		memzero_explicit(buf, enclen);
+		kvfree(buf);
 	} else {
 		/* Just store the data in a buffer */
 		void *data = kmalloc(datalen, GFP_KERNEL);
@@ -283,7 +140,8 @@ int big_key_preparse(struct key_preparsed_payload *prep)
 err_enckey:
 	kzfree(enckey);
 error:
-	big_key_free_buffer(buf);
+	memzero_explicit(buf, enclen);
+	kvfree(buf);
 	return ret;
 }
 
@@ -361,14 +219,13 @@ long big_key_read(const struct key *key, char *buffer, size_t buflen)
 		return datalen;
 
 	if (datalen > BIG_KEY_FILE_THRESHOLD) {
-		struct big_key_buf *buf;
 		struct path *path = (struct path *)&key->payload.data[big_key_path];
 		struct file *file;
-		u8 *enckey = (u8 *)key->payload.data[big_key_data];
-		size_t enclen = datalen + ENC_AUTHTAG_SIZE;
+		u8 *buf, *enckey = (u8 *)key->payload.data[big_key_data];
+		size_t enclen = datalen + CHACHA20POLY1305_AUTHTAG_SIZE;
 		loff_t pos = 0;
 
-		buf = big_key_alloc_buffer(enclen);
+		buf = kvmalloc(enclen, GFP_KERNEL);
 		if (!buf)
 			return -ENOMEM;
 
@@ -379,25 +236,29 @@ long big_key_read(const struct key *key, char *buffer, size_t buflen)
 		}
 
 		/* read file to kernel and decrypt */
-		ret = kernel_read(file, buf->virt, enclen, &pos);
+		ret = kernel_read(file, buf, enclen, &pos);
 		if (ret >= 0 && ret != enclen) {
 			ret = -EIO;
 			goto err_fput;
+		} else if (ret < 0) {
+			goto err_fput;
 		}
 
-		ret = big_key_crypt(BIG_KEY_DEC, buf, enclen, enckey);
-		if (ret)
+		ret = chacha20poly1305_decrypt(buf, buf, enclen, NULL, 0, 0,
+					       enckey) ? 0 : -EBADMSG;
+		if (unlikely(ret))
 			goto err_fput;
 
 		ret = datalen;
 
 		/* copy out decrypted data */
-		memcpy(buffer, buf->virt, datalen);
+		memcpy(buffer, buf, datalen);
 
 err_fput:
 		fput(file);
 error:
-		big_key_free_buffer(buf);
+		memzero_explicit(buf, enclen);
+		kvfree(buf);
 	} else {
 		ret = datalen;
 		memcpy(buffer, key->payload.data[big_key_data], datalen);
@@ -411,39 +272,7 @@ long big_key_read(const struct key *key, char *buffer, size_t buflen)
  */
 static int __init big_key_init(void)
 {
-	int ret;
-
-	/* init block cipher */
-	big_key_aead = crypto_alloc_aead(big_key_alg_name, 0, CRYPTO_ALG_ASYNC);
-	if (IS_ERR(big_key_aead)) {
-		ret = PTR_ERR(big_key_aead);
-		pr_err("Can't alloc crypto: %d\n", ret);
-		return ret;
-	}
-
-	if (unlikely(crypto_aead_ivsize(big_key_aead) != BIG_KEY_IV_SIZE)) {
-		WARN(1, "big key algorithm changed?");
-		ret = -EINVAL;
-		goto free_aead;
-	}
-
-	ret = crypto_aead_setauthsize(big_key_aead, ENC_AUTHTAG_SIZE);
-	if (ret < 0) {
-		pr_err("Can't set crypto auth tag len: %d\n", ret);
-		goto free_aead;
-	}
-
-	ret = register_key_type(&key_type_big_key);
-	if (ret < 0) {
-		pr_err("Can't register type: %d\n", ret);
-		goto free_aead;
-	}
-
-	return 0;
-
-free_aead:
-	crypto_free_aead(big_key_aead);
-	return ret;
+	return register_key_type(&key_type_big_key);
 }
 
 late_initcall(big_key_init);
-- 
2.26.2

