Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB03D347813
	for <lists+keyrings@lfdr.de>; Wed, 24 Mar 2021 13:16:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233306AbhCXMQM (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 24 Mar 2021 08:16:12 -0400
Received: from out30-54.freemail.mail.aliyun.com ([115.124.30.54]:38952 "EHLO
        out30-54.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233286AbhCXMQK (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 24 Mar 2021 08:16:10 -0400
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R761e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=alimailimapcm10staff010182156082;MF=tianjia.zhang@linux.alibaba.com;NM=1;PH=DS;RN=21;SR=0;TI=SMTPD_---0UTAwqDS_1616588126;
Received: from localhost(mailfrom:tianjia.zhang@linux.alibaba.com fp:SMTPD_---0UTAwqDS_1616588126)
          by smtp.aliyun-inc.com(127.0.0.1);
          Wed, 24 Mar 2021 20:15:26 +0800
From:   Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
To:     David Howells <dhowells@redhat.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        David Woodhouse <dwmw2@infradead.org>,
        Jonathan Corbet <corbet@lwn.net>,
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
Subject: [PATCH v2 2/2] init/Kconfig: support sign module with SM2-with-SM3 algorithm
Date:   Wed, 24 Mar 2021 20:15:25 +0800
Message-Id: <20210324121525.16062-3-tianjia.zhang@linux.alibaba.com>
X-Mailer: git-send-email 2.19.1.3.ge56e4f7
In-Reply-To: <20210324121525.16062-1-tianjia.zhang@linux.alibaba.com>
References: <20210324121525.16062-1-tianjia.zhang@linux.alibaba.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

The kernel module signature supports the option to use the SM3 secure
hash (OSCCA GM/T 0004-2012 SM3). SM2 and SM3 always appear in pairs.
The former is used for signing and the latter is used for hash
calculation.

To sign a kernel module, first, prepare a configuration file
openssl.cnf with the following content:

  [ req ]
  default_bits = 2048
  distinguished_name = req_distinguished_name
  prompt = no
  string_mask = utf8only
  x509_extensions = v3_req

  [ req_distinguished_name ]
  C = CN
  ST = HangZhou
  L = foo
  O = Test
  OU = Test
  CN = Test key
  emailAddress = test@foo.com

  [ v3_req ]
  basicConstraints=critical,CA:FALSE
  keyUsage=digitalSignature
  subjectKeyIdentifier=hash
  authorityKeyIdentifier=keyid:always

Then we can use the following method to sign module with SM2-with-SM3
algorithm combination:

  # generate CA key and self-signed CA certificate
  openssl ecparam -genkey -name SM2 -text -out ca.key
  openssl req -new -x509 -days 3650 -key ca.key \
      -sm3 -sigopt "distid:1234567812345678" \
      -subj "/O=testCA/OU=testCA/CN=testCA/emailAddress=ca@foo.com" \
      -config openssl.cnf -out ca.crt

  # generate SM2 private key and sign request
  openssl ecparam -genkey -name SM2 -text -out private.pem
  openssl req -new -key private.pem -config openssl.cnf \
      -sm3 -sigopt "distid:1234567812345678" -out csr.pem

  # generate SM2-with-SM3 certificate signed by CA
  openssl x509 -req -days 3650 -sm3 -in csr.pem \
      -sigopt "distid:1234567812345678" \
      -vfyopt "distid:1234567812345678" \
      -CA ca.crt -CAkey ca.key -CAcreateserial \
      -extfile openssl.cnf -extensions v3_req \
      -out cert.pem

  # sign module with SM2-with-SM3 algorithm
  sign-file sm3 private.pem cert.pem test.ko test.ko.signed

At this point, we should built the CA certificate into the kernel, and
then we can load the SM2-with-SM3 signed module normally.

Signed-off-by: Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
---
 Documentation/admin-guide/module-signing.rst | 5 +++--
 init/Kconfig                                 | 5 +++++
 2 files changed, 8 insertions(+), 2 deletions(-)

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

