Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8EE0F3459D1
	for <lists+keyrings@lfdr.de>; Tue, 23 Mar 2021 09:36:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229812AbhCWIfl (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 23 Mar 2021 04:35:41 -0400
Received: from out30-44.freemail.mail.aliyun.com ([115.124.30.44]:37920 "EHLO
        out30-44.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229972AbhCWIfe (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Tue, 23 Mar 2021 04:35:34 -0400
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R161e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e01424;MF=tianjia.zhang@linux.alibaba.com;NM=1;PH=DS;RN=21;SR=0;TI=SMTPD_---0UT38Cws_1616488528;
Received: from localhost(mailfrom:tianjia.zhang@linux.alibaba.com fp:SMTPD_---0UT38Cws_1616488528)
          by smtp.aliyun-inc.com(127.0.0.1);
          Tue, 23 Mar 2021 16:35:29 +0800
From:   Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
To:     David Howells <dhowells@redhat.com>,
        David Woodhouse <dwmw2@infradead.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Valentin Schneider <valentin.schneider@arm.com>,
        Nick Terrell <terrelln@fb.com>, KP Singh <kpsingh@google.com>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Vlastimil Babka <vbabka@suse.cz>, keyrings@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-crypto@vger.kernel.org,
        Jia Zhang <zhang.jia@linux.alibaba.com>
Cc:     Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
Subject: [PATCH] init/Kconfig: Support sign module with SM3 hash algorithm
Date:   Tue, 23 Mar 2021 16:35:28 +0800
Message-Id: <20210323083528.25678-1-tianjia.zhang@linux.alibaba.com>
X-Mailer: git-send-email 2.19.1.3.ge56e4f7
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

The kernel module signature supports the option to use the SM3
secure hash (OSCCA GM/T 0004-2012 SM3).

Signed-off-by: Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
---
 Documentation/admin-guide/module-signing.rst | 5 +++--
 crypto/asymmetric_keys/pkcs7_parser.c        | 7 +++++++
 init/Kconfig                                 | 5 +++++
 3 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/Documentation/admin-guide/module-signing.rst b/Documentation/admin-guide/module-signing.rst
index 7d7c7c8a545c..8d8980808b5b 100644
--- a/Documentation/admin-guide/module-signing.rst
+++ b/Documentation/admin-guide/module-signing.rst
@@ -30,8 +30,8 @@ This facility uses X.509 ITU-T standard certificates to encode the public keys
 involved.  The signatures are not themselves encoded in any industrial standard
 type.  The facility currently only supports the RSA public key encryption
 standard (though it is pluggable and permits others to be used).  The possible
-hash algorithms that can be used are SHA-1, SHA-224, SHA-256, SHA-384, and
-SHA-512 (the algorithm is selected by data in the signature).
+hash algorithms that can be used are SHA-1, SHA-224, SHA-256, SHA-384, SHA-512,
+and SM3 (the algorithm is selected by data in the signature).
 
 
 ==========================
@@ -86,6 +86,7 @@ This has a number of options available:
 	``CONFIG_MODULE_SIG_SHA256``	:menuselection:`Sign modules with SHA-256`
 	``CONFIG_MODULE_SIG_SHA384``	:menuselection:`Sign modules with SHA-384`
 	``CONFIG_MODULE_SIG_SHA512``	:menuselection:`Sign modules with SHA-512`
+	``CONFIG_MODULE_SIG_SM3``	:menuselection:`Sign modules with SM3`
         =============================== ==========================================
 
      The algorithm selected here will also be built into the kernel (rather
diff --git a/crypto/asymmetric_keys/pkcs7_parser.c b/crypto/asymmetric_keys/pkcs7_parser.c
index 967329e0a07b..6cf6c4552c11 100644
--- a/crypto/asymmetric_keys/pkcs7_parser.c
+++ b/crypto/asymmetric_keys/pkcs7_parser.c
@@ -248,6 +248,9 @@ int pkcs7_sig_note_digest_algo(void *context, size_t hdrlen,
 	case OID_sha224:
 		ctx->sinfo->sig->hash_algo = "sha224";
 		break;
+	case OID_sm3:
+		ctx->sinfo->sig->hash_algo = "sm3";
+		break;
 	default:
 		printk("Unsupported digest algo: %u\n", ctx->last_oid);
 		return -ENOPKG;
@@ -269,6 +272,10 @@ int pkcs7_sig_note_pkey_algo(void *context, size_t hdrlen,
 		ctx->sinfo->sig->pkey_algo = "rsa";
 		ctx->sinfo->sig->encoding = "pkcs1";
 		break;
+	case OID_SM2_with_SM3:
+		ctx->sinfo->sig->pkey_algo = "sm2";
+		ctx->sinfo->sig->encoding = "raw";
+		break;
 	default:
 		printk("Unsupported pkey algo: %u\n", ctx->last_oid);
 		return -ENOPKG;
diff --git a/init/Kconfig b/init/Kconfig
index 5f5c776ef192..fed9236078e4 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -2202,6 +2202,10 @@ config MODULE_SIG_SHA512
 	bool "Sign modules with SHA-512"
 	select CRYPTO_SHA512
 
+config MODULE_SIG_SM3
+	bool "Sign modules with SM3"
+	select CRYPTO_SM3
+
 endchoice
 
 config MODULE_SIG_HASH
@@ -2212,6 +2216,7 @@ config MODULE_SIG_HASH
 	default "sha256" if MODULE_SIG_SHA256
 	default "sha384" if MODULE_SIG_SHA384
 	default "sha512" if MODULE_SIG_SHA512
+	default "sm3" if MODULE_SIG_SM3
 
 config MODULE_COMPRESS
 	bool "Compress modules on installation"
-- 
2.19.1.3.ge56e4f7

