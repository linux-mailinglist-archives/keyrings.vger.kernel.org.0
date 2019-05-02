Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4B5FA1121B
	for <lists+keyrings@lfdr.de>; Thu,  2 May 2019 06:12:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725613AbfEBEMM (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 2 May 2019 00:12:12 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:34175 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725497AbfEBEMM (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 2 May 2019 00:12:12 -0400
Received: by mail-pg1-f195.google.com with SMTP id c13so458789pgt.1;
        Wed, 01 May 2019 21:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=dIv8FRXTY10P9mlrJhJL2tE1BwddhSlT1j6qFQ98cH8=;
        b=laCfQZS847M3G3LHl6IzbEDT6FW2/EkyHMa3qnyIVY299oV0Qxy+YsnZP88AyDsDVg
         V8tqKC/aRCfXvq0SbiXJKlIt+YEed3DHxU8cLyyC/7M/ciodnGosFjjj9C82pJ3ghzag
         HVLGOykeinKcnO1whKsaluLM0rhGf6NZXOzF5ERp2WIVScKL5M3EdMQr2HcdGpagJjns
         KyJMFbUmMzlDG87JXjHVUXFzxdZ/sm9Wp+sXv9fgF4PYHKbwZGyYG2GS37rw2O46g1Hg
         h8P9HZCVlodPL04SJ4XRFmpdP1JPbdolaBxXKKRGnJ4eHJeguBTq/8Oz9l4OxI9xZ6ye
         uNjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=dIv8FRXTY10P9mlrJhJL2tE1BwddhSlT1j6qFQ98cH8=;
        b=Z9IZc65khZYbskL2wUiwQL5SXwfoRIEsn8HhXtNUsdlvytqVkJAgiOarK0qJwjm/dJ
         LflB0VJOEAt9cTDSjBjgiU6U9+x2ZBpQ3c+aPgY8knU1NTRyMXEiVlVeYovOoVlXrkH0
         zM7xA9rXbqUdXvlwTi3ASjxJUzSpIDQYaweihFoRkVlD753ZakU5lhNVmzwyRvhS7MvJ
         9eL115Bn97Ln3yWL5WxAxO4lHAnYMasHrI0bRri4RGOA97g+DaprtIRiy8J8t6i48xVe
         +FBQpUDpe2w94GUT+l1H/5RE+r7L8r4YKzD9SK4+g9DdWDVdWIhZ/UrmY9tSvoR4ANuX
         XZag==
X-Gm-Message-State: APjAAAUeLiMPazznzqRdYxAg83W00eTitlCXBQ6W+eWrWCFOSLMUO/vg
        vOYZCkkWdtdR46KBCC1THTE=
X-Google-Smtp-Source: APXvYqxXQL0RhphtVgXiI4dna9UR9DZXTlG5t0Myw94oESlVS8h3h93XqhCZOibemCYMZaB7BMbqMg==
X-Received: by 2002:a65:43c3:: with SMTP id n3mr1592865pgp.375.1556770331828;
        Wed, 01 May 2019 21:12:11 -0700 (PDT)
Received: from linux-l9pv.suse ([202.47.205.198])
        by smtp.gmail.com with ESMTPSA id y6sm15677373pfm.160.2019.05.01.21.12.08
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Wed, 01 May 2019 21:12:11 -0700 (PDT)
From:   "Lee, Chun-Yi" <joeyli.kernel@gmail.com>
X-Google-Original-From: "Lee, Chun-Yi" <jlee@suse.com>
To:     David Howells <dhowells@redhat.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S . Miller" <davem@davemloft.net>,
        Mimi Zohar <zohar@linux.ibm.com>
Cc:     keyrings@vger.kernel.org, linux-crypto@vger.kernel.org,
        linux-kernel@vger.kernel.org, "Lee, Chun-Yi" <jlee@suse.com>
Subject: [PATCH] X.509: Add messages for obsolete OIDs
Date:   Thu,  2 May 2019 12:12:02 +0800
Message-Id: <20190502041202.30753-1-jlee@suse.com>
X-Mailer: git-send-email 2.12.3
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

We found that the db in Acer machine has self signed certificates
(CN=DisablePW or CN=ABO) that they used obsolete OID 1.3.14.3.2.29
sha1WithRSASignature and 2.5.29.1 subjectKeyIdentifier. Kernel
emits -65 error code when loading those certificates to platform
keyring:

[    1.484388] integrity: Loading X.509 certificate: UEFI:MokListRT
[    1.485557] integrity: Problem loading X.509 certificate -65
[    1.486100] Error adding keys to platform keyring UEFI:MokListRT

Because the -65 error code is not enough for appeasing user when
loading a outdated certificate. This patch add messages against
1.3.14.3.2.29 and 2.5.29.1 OIDs.

Link: https://bugzilla.opensuse.org/show_bug.cgi?id=1129471
Cc: David Howells <dhowells@redhat.com> 
Cc: Herbert Xu <herbert@gondor.apana.org.au> 
Cc: "David S. Miller" <davem@davemloft.net>
Reviewed-by: Mimi Zohar <zohar@linux.ibm.com>
Signed-off-by: "Lee, Chun-Yi" <jlee@suse.com>
---
 crypto/asymmetric_keys/x509_cert_parser.c | 7 +++++++
 include/linux/oid_registry.h              | 2 ++
 2 files changed, 9 insertions(+)

diff --git a/crypto/asymmetric_keys/x509_cert_parser.c b/crypto/asymmetric_keys/x509_cert_parser.c
index 991f4d735a4e..bbd22d5c5b5d 100644
--- a/crypto/asymmetric_keys/x509_cert_parser.c
+++ b/crypto/asymmetric_keys/x509_cert_parser.c
@@ -192,6 +192,8 @@ int x509_note_pkey_algo(void *context, size_t hdrlen,
 	pr_debug("PubKey Algo: %u\n", ctx->last_oid);
 
 	switch (ctx->last_oid) {
+	case OID_sha1WithRSASignature:
+		pr_info("1.3.14.3.2.29 sha1WithRSASignature is obsolete.\n");
 	case OID_md2WithRSAEncryption:
 	case OID_md3WithRSAEncryption:
 	default:
@@ -464,6 +466,11 @@ int x509_process_extension(void *context, size_t hdrlen,
 		return 0;
 	}
 
+	if (ctx->last_oid == OID_subjectKeyIdentifier_obsolete) {
+		pr_info("2.5.29.1 subjectKeyIdentifier OID is obsolete.\n");
+		return -ENOPKG;
+	}
+
 	return 0;
 }
 
diff --git a/include/linux/oid_registry.h b/include/linux/oid_registry.h
index d2fa9ca42e9a..0641d5aa2251 100644
--- a/include/linux/oid_registry.h
+++ b/include/linux/oid_registry.h
@@ -62,6 +62,7 @@ enum OID {
 
 	OID_certAuthInfoAccess,		/* 1.3.6.1.5.5.7.1.1 */
 	OID_sha1,			/* 1.3.14.3.2.26 */
+	OID_sha1WithRSASignature,	/* 1.3.14.3.2.29 */
 	OID_sha256,			/* 2.16.840.1.101.3.4.2.1 */
 	OID_sha384,			/* 2.16.840.1.101.3.4.2.2 */
 	OID_sha512,			/* 2.16.840.1.101.3.4.2.3 */
@@ -83,6 +84,7 @@ enum OID {
 	OID_generationalQualifier,	/* 2.5.4.44 */
 
 	/* Certificate extension IDs */
+	OID_subjectKeyIdentifier_obsolete,	/* 2.5.29.1 */
 	OID_subjectKeyIdentifier,	/* 2.5.29.14 */
 	OID_keyUsage,			/* 2.5.29.15 */
 	OID_subjectAltName,		/* 2.5.29.17 */
-- 
2.16.4

