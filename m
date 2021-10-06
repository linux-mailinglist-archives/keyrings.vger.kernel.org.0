Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E9A4142461B
	for <lists+keyrings@lfdr.de>; Wed,  6 Oct 2021 20:29:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233080AbhJFSbA (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 6 Oct 2021 14:31:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232060AbhJFSbA (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 6 Oct 2021 14:31:00 -0400
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C802BC061746
        for <keyrings@vger.kernel.org>; Wed,  6 Oct 2021 11:29:07 -0700 (PDT)
Received: by mail-pg1-x534.google.com with SMTP id 75so3265390pga.3
        for <keyrings@vger.kernel.org>; Wed, 06 Oct 2021 11:29:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:subject:message-id:mime-version:content-disposition;
        bh=cov6EUA+6jsjUsxu7IMYYwAK5Dd+bREofJWYD87fYaU=;
        b=pqu1hKBKaQx8WPEgpkDw/K9dcpXQwW6yK7ESFqj1NWC1UtO3a98KLsfB/uKnQrspmr
         nthxM4EpGXrh6HoQ2B6kuoHBShF6VPSh9CmtMi0uO2bmHkm+5ByqH1ozVYPymx7X79hO
         OZdrOn1NkJTMrvGdObm++ErrqyhPZzii0518F8MnFAY4lHTrTxQJfuq1a5fXSU8cBzdg
         3iMNL/XDv9d7hXmFomYWf+9fNQQlIMjYUWIN0oyQgEkBG8pAQR9NDqCaFFS0Gbiu6TFH
         cnINzcBQ7UvGBLqMK8cB+FCQOqVB05kuoEhR0RzZKvVjiZJCUfRe/+FKqTCUjmX5DWPm
         bQyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition;
        bh=cov6EUA+6jsjUsxu7IMYYwAK5Dd+bREofJWYD87fYaU=;
        b=DFXZ7N5lB8fxr0MHgX+AyhYHm8Gk9ORfRg9X+pRTPaj/yTiNbq6ztlyb9DK1XuB4nf
         IKvbIY5LVcVdWtDY+1WpMRNNaYZQby04mDwBs5n1dItougPgrJQVGQ+5eDjtem49w46x
         r3Ifst9nnTON8eXjwvTLCX/htBSJCo5IjPxkImOfUFFXZGLnZPpOCgkE2WXYqJmeNRaH
         kzOCHkktW/FTQscj5X8uGP4wCEMFSekRdUzFvU9Xc2cDAeoQNP3a9qz7IBCS7IabrtKY
         eM/7NS5E9le7V+Ns4YIiXJX+ACDcfgF+XoVscuQtGQasGcPz6Ke4lUNtSxRzLKWyQvnp
         JYhg==
X-Gm-Message-State: AOAM531ZladuS3XlVyMbh4SjG6+kkY1ZnP73AnNSfGcU9ft5cLsj7ugi
        2yLBAle2jqrgxLwg82+HnRA=
X-Google-Smtp-Source: ABdhPJyTW3H0jhlXoHZesmHW0021+y9/PDbblAYHaQ1grYg22grCbj7emnDYVMIkH3b/M0cOxvaOkg==
X-Received: by 2002:a63:534f:: with SMTP id t15mr196479pgl.392.1633544947365;
        Wed, 06 Oct 2021 11:29:07 -0700 (PDT)
Received: from devvm312.ftw0.facebook.com ([2620:10d:c090:400::5:3a14])
        by smtp.gmail.com with ESMTPSA id k6sm2647484pfg.18.2021.10.06.11.29.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Oct 2021 11:29:07 -0700 (PDT)
Date:   Wed, 6 Oct 2021 11:29:03 -0700
From:   Sergei Iudin <tsipa740@gmail.com>
To:     dhowells@redhat.com, dwmw2@infradead.org, keyrings@vger.kernel.org,
        kernel-team@fb.com
Subject: [PATCH] MODSIGN: Add option to define PKCS11 module
Message-ID: <YV3q759YUYqbSuiM@devvm312.ftw0.facebook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

In order to use PKCS11 engine user have to specify a PKCS11 module.
There is two approaches:
- [0] Global openssl config
- [1] Programmatic call of ENGINE_ctrl_cmd
the option mention in rfc7512 [2] to pass it as part of URI is not
implemented in openssl([3]).
Changing global openssl config is not always feasible, especially for
cases when system may run multiple not fully isolated builds at a time.
In order to make it possible to define build-wide PKCS11 module use
environment variable `KBUILD_PKCS11_MODULE`.

[0] https://bit.ly/3myVWsE
[1] https://github.com/OpenSC/libp11/blob/master/README.md#engine-controls
[2] https://datatracker.ietf.org/doc/html/rfc7512
[3] https://pastebin.com/SfabcxTN

Signed-off-by: Sergei Iudin <tsipa740@gmail.com>
---
 Documentation/admin-guide/module-signing.rst | 3 ++-
 Documentation/kbuild/kbuild.rst              | 5 +++++
 scripts/sign-file.c                          | 6 ++++++
 3 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/module-signing.rst b/Documentation/admin-guide/module-signing.rst
index 7d7c7c8a545c..e3179fcf78e0 100644
--- a/Documentation/admin-guide/module-signing.rst
+++ b/Documentation/admin-guide/module-signing.rst
@@ -230,7 +230,8 @@ doesn't, you should make sure that hash algorithm is either built into the
 kernel or can be loaded without requiring itself.
 
 If the private key requires a passphrase or PIN, it can be provided in the
-$KBUILD_SIGN_PIN environment variable.
+$KBUILD_SIGN_PIN environment variable. If you want to specify non-default
+PKCS11 module you can define it via $KBUILD_PKCS11_MODULE variable.
 
 
 ============================
diff --git a/Documentation/kbuild/kbuild.rst b/Documentation/kbuild/kbuild.rst
index 2d1fc03d346e..a7ee781b69c2 100644
--- a/Documentation/kbuild/kbuild.rst
+++ b/Documentation/kbuild/kbuild.rst
@@ -223,6 +223,11 @@ KBUILD_SIGN_PIN
 This variable allows a passphrase or PIN to be passed to the sign-file
 utility when signing kernel modules, if the private key requires such.
 
+KBUILD_PKCS11_MODULE
+---------------
+This variable allows to specify PKCS11 module to be passed to the
+sign-file utility when signing kernel modules with PKCS11 engine.
+
 KBUILD_MODPOST_WARN
 -------------------
 KBUILD_MODPOST_WARN can be set to avoid errors in case of undefined
diff --git a/scripts/sign-file.c b/scripts/sign-file.c
index 2dbfc6e630f4..72823800684b 100644
--- a/scripts/sign-file.c
+++ b/scripts/sign-file.c
@@ -112,6 +112,7 @@ static void drain_openssl_errors(void)
 	} while(0)
 
 static const char *key_pass;
+static const char *pkcs11_module;
 
 static int pem_pw_cb(char *buf, int len, int w, void *v)
 {
@@ -150,6 +151,10 @@ static EVP_PKEY *read_private_key(const char *private_key_name)
 		if (key_pass)
 			ERR(!ENGINE_ctrl_cmd_string(e, "PIN", key_pass, 0),
 			    "Set PKCS#11 PIN");
+		if (pkcs11_module)
+			ERR(!ENGINE_ctrl_cmd_string(e, "MODULE_PATH",
+			    pkcs11_module, 0),
+			    "Set PKCS#11 module");
 		private_key = ENGINE_load_private_key(e, private_key_name,
 						      NULL, NULL);
 		ERR(!private_key, "%s", private_key_name);
@@ -234,6 +239,7 @@ int main(int argc, char **argv)
 	ERR_clear_error();
 
 	key_pass = getenv("KBUILD_SIGN_PIN");
+	pkcs11_module = getenv("KBUILD_PKCS11_MODULE");
 
 #ifndef USE_PKCS7
 	use_signed_attrs = CMS_NOATTR;
-- 
2.30.2

