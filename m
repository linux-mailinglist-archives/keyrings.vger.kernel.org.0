Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E74B01D800F
	for <lists+keyrings@lfdr.de>; Mon, 18 May 2020 19:27:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726958AbgERR1P (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Mon, 18 May 2020 13:27:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727942AbgERR1O (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Mon, 18 May 2020 13:27:14 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC70EC061A0C
        for <keyrings@vger.kernel.org>; Mon, 18 May 2020 10:27:13 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id y18so5253201pfl.9
        for <keyrings@vger.kernel.org>; Mon, 18 May 2020 10:27:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VU2Z9jH2tHrmIYCSZ+Qm/Bdg8LSTyT9WNzv/6AK0Y/I=;
        b=NkW7ruD6LOylPL/N24x8fpSfp9iM08MmlXlkq1BAue8ZV8nfEMTiQkaigqcGO47SNV
         GkBputvng6Blh0/hdwvlpxuRHCxqRaSyxIxqC5zgwDZewNAFeEBT6WKi8kgQdAKIQzsi
         NVNZBs7t6xXBztm3AlQlsfKJzfPS+1kWKY4UX1MLD3LWGvE6FkAeq+Ws3KzlKkkdT1gh
         pT9aFU7NFzN+AhJxBH1LqleosvclCaRJcpVifnXMQd7bjy3ZVOTE4KifgSPAU4QrI/lf
         IGrzK5dO9HCHpWBHK0htPFDs47Qxa4OBUUpM0+NQ17+N72CQzGA/ylP0hMjXsxilmIhg
         VhVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VU2Z9jH2tHrmIYCSZ+Qm/Bdg8LSTyT9WNzv/6AK0Y/I=;
        b=HTOyTHYtblkKopmu+WD1Kso6U97RWoadd/NldFwT32pkN6lTtO4J1P8AIdtZ3HbsV9
         OvF+Lw6raMK4pu/RJ8Qk2Q/855e5KP7jK0a91S6W4ylAF/Iv59dsNBol4c29z3y6vEG9
         /vhrQFYK15QKfc8u7r4eVVOKXCPTKoDGbDcb2tzEbZY7EcZyijiQS0U4QkjEDenFJpVM
         4OvNOBjyj9W1JgPFtNFqSJz/aUvfnO/7yVTttUNUnLIhgSrKzDhi3zFBl3DVY1IzihPC
         evxBDC2c+wiI42HHYi4RwGqcN+nZBjf2hFny9SRjO+9UiXq2EOwrlDyw40DOGjCojEpf
         /AnA==
X-Gm-Message-State: AOAM532ewxH9LuLXcd2Sbt7alLU8rjTRdkFhmGMKY0DfNXhKAeWWsVF5
        jxfpTLfJ0R5+wGyjzBUgKLGzd4Zz5WY=
X-Google-Smtp-Source: ABdhPJxTSSbiwkXqmBMzwpJ8hChY2v6VT3wUQQN1HsQi9wBwxf30odHq9JIs0r0Q7lydSFTYPUsIUw==
X-Received: by 2002:a65:4489:: with SMTP id l9mr7811736pgq.223.1589822832809;
        Mon, 18 May 2020 10:27:12 -0700 (PDT)
Received: from host-29.home (50-39-160-111.bvtn.or.frontiernet.net. [50.39.160.111])
        by smtp.gmail.com with ESMTPSA id o14sm4092448pfp.89.2020.05.18.10.27.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2020 10:27:12 -0700 (PDT)
From:   James Prestwood <prestwoj@gmail.com>
To:     keyrings@vger.kernel.org
Cc:     James.Bottomley@HansenPartnership.com
Subject: [PATCH 01/17] tpm-buf: move from static inlines to real functions
Date:   Mon, 18 May 2020 10:26:48 -0700
Message-Id: <20200518172704.29608-2-prestwoj@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200518172704.29608-1-prestwoj@gmail.com>
References: <20200518172704.29608-1-prestwoj@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

From: James Bottomley <James.Bottomley@HansenPartnership.com>

This separates out the old tpm_buf_... handling functions from static
inlines in tpm.h and makes them their own tpm-buf.c file.  This is a
precursor so we can add new functions for other TPM type handling

Signed-off-by: James Bottomley <James.Bottomley@HansenPartnership.com>
---
 drivers/char/tpm/Makefile  |   1 +
 drivers/char/tpm/tpm-buf.c | 118 +++++++++++++++++++++++++++++++++++++
 drivers/char/tpm/tpm.h     |  10 ++++
 include/linux/tpm.h        | 101 ++++++-------------------------
 4 files changed, 146 insertions(+), 84 deletions(-)
 create mode 100644 drivers/char/tpm/tpm-buf.c

diff --git a/drivers/char/tpm/Makefile b/drivers/char/tpm/Makefile
index 9567e5197f74..4d5765c41972 100644
--- a/drivers/char/tpm/Makefile
+++ b/drivers/char/tpm/Makefile
@@ -15,6 +15,7 @@ tpm-y += tpm-sysfs.o
 tpm-y += eventlog/common.o
 tpm-y += eventlog/tpm1.o
 tpm-y += eventlog/tpm2.o
+tpm-y += tpm-buf.o
 
 tpm-$(CONFIG_ACPI) += tpm_ppi.o eventlog/acpi.o
 tpm-$(CONFIG_EFI) += eventlog/efi.o
diff --git a/drivers/char/tpm/tpm-buf.c b/drivers/char/tpm/tpm-buf.c
new file mode 100644
index 000000000000..9fa8a9cb0fdf
--- /dev/null
+++ b/drivers/char/tpm/tpm-buf.c
@@ -0,0 +1,118 @@
+// SPDX-License-Identifier: GPL-2.0
+
+/*
+ * Handing for tpm_buf structures to facilitate the building of commands
+ */
+
+#include "tpm.h"
+
+#include <linux/module.h>
+
+static int __tpm_buf_init(struct tpm_buf *buf)
+{
+	buf->data_page = alloc_page(GFP_HIGHUSER);
+	if (!buf->data_page)
+		return -ENOMEM;
+
+	buf->flags = 0;
+	buf->data = kmap(buf->data_page);
+
+	return 0;
+}
+
+void tpm_buf_reset(struct tpm_buf *buf, u16 tag, u32 ordinal)
+{
+	struct tpm_header *head;
+
+	head = (struct tpm_header *) buf->data;
+
+	head->tag = cpu_to_be16(tag);
+	head->length = cpu_to_be32(sizeof(*head));
+	head->ordinal = cpu_to_be32(ordinal);
+}
+EXPORT_SYMBOL_GPL(tpm_buf_reset);
+
+int tpm_buf_init(struct tpm_buf *buf, u16 tag, u32 ordinal)
+{
+	int rc;
+
+	rc = __tpm_buf_init(buf);
+	if (rc)
+		return rc;
+
+	tpm_buf_reset(buf, tag, ordinal);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(tpm_buf_init);
+
+void tpm_buf_destroy(struct tpm_buf *buf)
+{
+	kunmap(buf->data_page);
+	__free_page(buf->data_page);
+}
+EXPORT_SYMBOL_GPL(tpm_buf_destroy);
+
+u32 tpm_buf_length(struct tpm_buf *buf)
+{
+	struct tpm_header *head = (struct tpm_header *)buf->data;
+	u32 len;
+
+	len = be32_to_cpu(head->length);
+	if (buf->flags & TPM_BUF_2B)
+		len -= sizeof(*head);
+	return len;
+}
+EXPORT_SYMBOL_GPL(tpm_buf_length);
+
+u16 tpm_buf_tag(struct tpm_buf *buf)
+{
+	struct tpm_header *head = (struct tpm_header *)buf->data;
+
+	return be16_to_cpu(head->tag);
+}
+EXPORT_SYMBOL_GPL(tpm_buf_tag);
+
+void tpm_buf_append(struct tpm_buf *buf,
+		    const unsigned char *new_data,
+		    unsigned int new_len)
+{
+	struct tpm_header *head = (struct tpm_header *) buf->data;
+	u32 len = be32_to_cpu(head->length);
+
+	/* Return silently if overflow has already happened. */
+	if (buf->flags & TPM_BUF_OVERFLOW)
+		return;
+
+	if ((len + new_len) > PAGE_SIZE) {
+		WARN(1, "tpm_buf: overflow\n");
+		buf->flags |= TPM_BUF_OVERFLOW;
+		return;
+	}
+
+	memcpy(&buf->data[len], new_data, new_len);
+	head->length = cpu_to_be32(len + new_len);
+}
+EXPORT_SYMBOL_GPL(tpm_buf_append);
+
+void tpm_buf_append_u8(struct tpm_buf *buf, const u8 value)
+{
+	tpm_buf_append(buf, &value, 1);
+}
+EXPORT_SYMBOL_GPL(tpm_buf_append_u8);
+
+void tpm_buf_append_u16(struct tpm_buf *buf, const u16 value)
+{
+	__be16 value2 = cpu_to_be16(value);
+
+	tpm_buf_append(buf, (u8 *) &value2, 2);
+}
+EXPORT_SYMBOL_GPL(tpm_buf_append_u16);
+
+void tpm_buf_append_u32(struct tpm_buf *buf, const u32 value)
+{
+	__be32 value2 = cpu_to_be32(value);
+
+	tpm_buf_append(buf, (u8 *) &value2, 4);
+}
+EXPORT_SYMBOL_GPL(tpm_buf_append_u32);
diff --git a/drivers/char/tpm/tpm.h b/drivers/char/tpm/tpm.h
index 5620747da0cf..379629704522 100644
--- a/drivers/char/tpm/tpm.h
+++ b/drivers/char/tpm/tpm.h
@@ -153,6 +153,16 @@ enum tpm_sub_capabilities {
  * compiler warnings about stack frame size. */
 #define TPM_MAX_RNG_DATA	128
 
+int tpm_buf_init(struct tpm_buf *buf, u16 tag, u32 ordinal);
+void tpm_buf_reset(struct tpm_buf *buf, u16 tag, u32 ordinal);
+void tpm_buf_destroy(struct tpm_buf *buf);
+u32 tpm_buf_length(struct tpm_buf *buf);
+void tpm_buf_append(struct tpm_buf *buf, const unsigned char *new_data,
+		    unsigned int new_len);
+void tpm_buf_append_u8(struct tpm_buf *buf, const u8 value);
+void tpm_buf_append_u16(struct tpm_buf *buf, const u16 value);
+void tpm_buf_append_u32(struct tpm_buf *buf, const u32 value);
+
 extern struct class *tpm_class;
 extern struct class *tpmrm_class;
 extern dev_t tpm_devt;
diff --git a/include/linux/tpm.h b/include/linux/tpm.h
index 03e9b184411b..893aa87ea211 100644
--- a/include/linux/tpm.h
+++ b/include/linux/tpm.h
@@ -289,9 +289,11 @@ struct tpm_header {
 
 enum tpm_buf_flags {
 	TPM_BUF_OVERFLOW	= BIT(0),
+	TPM_BUF_2B		= BIT(1),
 };
 
 struct tpm_buf {
+	struct page *data_page;
 	unsigned int flags;
 	u8 *data;
 };
@@ -309,90 +311,6 @@ struct tpm2_hash {
 	unsigned int tpm_id;
 };
 
-static inline void tpm_buf_reset(struct tpm_buf *buf, u16 tag, u32 ordinal)
-{
-	struct tpm_header *head = (struct tpm_header *)buf->data;
-
-	head->tag = cpu_to_be16(tag);
-	head->length = cpu_to_be32(sizeof(*head));
-	head->ordinal = cpu_to_be32(ordinal);
-}
-
-static inline int tpm_buf_init(struct tpm_buf *buf, u16 tag, u32 ordinal)
-{
-	buf->data = (u8 *)__get_free_page(GFP_KERNEL);
-	if (!buf->data)
-		return -ENOMEM;
-
-	buf->flags = 0;
-	tpm_buf_reset(buf, tag, ordinal);
-	return 0;
-}
-
-static inline void tpm_buf_destroy(struct tpm_buf *buf)
-{
-	free_page((unsigned long)buf->data);
-}
-
-static inline u32 tpm_buf_length(struct tpm_buf *buf)
-{
-	struct tpm_header *head = (struct tpm_header *)buf->data;
-
-	return be32_to_cpu(head->length);
-}
-
-static inline u16 tpm_buf_tag(struct tpm_buf *buf)
-{
-	struct tpm_header *head = (struct tpm_header *)buf->data;
-
-	return be16_to_cpu(head->tag);
-}
-
-static inline void tpm_buf_append(struct tpm_buf *buf,
-				  const unsigned char *new_data,
-				  unsigned int new_len)
-{
-	struct tpm_header *head = (struct tpm_header *)buf->data;
-	u32 len = tpm_buf_length(buf);
-
-	/* Return silently if overflow has already happened. */
-	if (buf->flags & TPM_BUF_OVERFLOW)
-		return;
-
-	if ((len + new_len) > PAGE_SIZE) {
-		WARN(1, "tpm_buf: overflow\n");
-		buf->flags |= TPM_BUF_OVERFLOW;
-		return;
-	}
-
-	memcpy(&buf->data[len], new_data, new_len);
-	head->length = cpu_to_be32(len + new_len);
-}
-
-static inline void tpm_buf_append_u8(struct tpm_buf *buf, const u8 value)
-{
-	tpm_buf_append(buf, &value, 1);
-}
-
-static inline void tpm_buf_append_u16(struct tpm_buf *buf, const u16 value)
-{
-	__be16 value2 = cpu_to_be16(value);
-
-	tpm_buf_append(buf, (u8 *) &value2, 2);
-}
-
-static inline void tpm_buf_append_u32(struct tpm_buf *buf, const u32 value)
-{
-	__be32 value2 = cpu_to_be32(value);
-
-	tpm_buf_append(buf, (u8 *) &value2, 4);
-}
-
-static inline u32 tpm2_rc_value(u32 rc)
-{
-	return (rc & BIT(7)) ? rc & 0xff : rc;
-}
-
 #if defined(CONFIG_TCG_TPM) || defined(CONFIG_TCG_TPM_MODULE)
 
 extern int tpm_is_tpm2(struct tpm_chip *chip);
@@ -404,6 +322,21 @@ extern int tpm_send(struct tpm_chip *chip, void *cmd, size_t buflen);
 extern int tpm_get_random(struct tpm_chip *chip, u8 *data, size_t max);
 extern struct tpm_chip *tpm_default_chip(void);
 void tpm2_flush_context(struct tpm_chip *chip, u32 handle);
+extern int tpm_buf_init(struct tpm_buf *buf, u16 tag, u32 ordinal);
+extern void tpm_buf_reset(struct tpm_buf *buf, u16 tag, u32 ordinal);
+extern void tpm_buf_destroy(struct tpm_buf *buf);
+extern u32 tpm_buf_length(struct tpm_buf *buf);
+extern void tpm_buf_append(struct tpm_buf *buf, const unsigned char *new_data,
+			   unsigned int new_len);
+extern void tpm_buf_append_u8(struct tpm_buf *buf, const u8 value);
+extern void tpm_buf_append_u16(struct tpm_buf *buf, const u16 value);
+extern void tpm_buf_append_u32(struct tpm_buf *buf, const u32 value);
+
+static inline u32 tpm2_rc_value(u32 rc)
+{
+       return (rc & BIT(7)) ? rc & 0xff : rc;
+}
+
 #else
 static inline int tpm_is_tpm2(struct tpm_chip *chip)
 {
-- 
2.21.1

