Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 362047D1CC8
	for <lists+keyrings@lfdr.de>; Sat, 21 Oct 2023 13:23:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229583AbjJULXt (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Sat, 21 Oct 2023 07:23:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229478AbjJULXt (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Sat, 21 Oct 2023 07:23:49 -0400
Received: from bmailout2.hostsharing.net (bmailout2.hostsharing.net [83.223.78.240])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA5CC1A4;
        Sat, 21 Oct 2023 04:23:43 -0700 (PDT)
Received: from h08.hostsharing.net (h08.hostsharing.net [IPv6:2a01:37:1000::53df:5f1c:0])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
         client-signature RSA-PSS (4096 bits) client-digest SHA256)
        (Client CN "*.hostsharing.net", Issuer "RapidSSL Global TLS RSA4096 SHA256 2022 CA1" (verified OK))
        by bmailout2.hostsharing.net (Postfix) with ESMTPS id 71EBC2800B75F;
        Sat, 21 Oct 2023 13:23:41 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
        id 64FAB11768A; Sat, 21 Oct 2023 13:23:41 +0200 (CEST)
Message-Id: <143690ecc1102c0f67fa7faec437ec7b02bb2304.1697885975.git.lukas@wunner.de>
From:   Lukas Wunner <lukas@wunner.de>
Date:   Sat, 21 Oct 2023 13:23:44 +0200
Subject: [PATCH] treewide: Add SPDX identifier to IETF ASN.1 modules
To:     Thomas Gleixner <tglx@linutronix.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-spdx@vger.kernel.org
Cc:     David Howells <dhowells@redhat.com>,
        Tadeusz Struk <tadeusz.struk@linaro.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, keyrings@vger.kernel.org,
        linux-crypto@vger.kernel.org, Hyunchul Lee <hyc.lee@gmail.com>,
        Namjae Jeon <linkinjeon@kernel.org>,
        Steve French <sfrench@samba.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Tom Talpey <tom@talpey.com>, linux-cifs@vger.kernel.org,
        Taehee Yoo <ap420073@gmail.com>,
        Pablo Neira Ayuso <pablo@netfilter.org>,
        Jozsef Kadlecsik <kadlec@netfilter.org>,
        Florian Westphal <fw@strlen.de>, coreteam@netfilter.org,
        netfilter-devel@vger.kernel.org
X-Spam-Status: No, score=0.1 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URI_TRY_3LD autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Per section 4.c. of the IETF Trust Legal Provisions, "Code Components"
in IETF Documents are licensed on the terms of the BSD-3-Clause license:

https://trustee.ietf.org/documents/trust-legal-provisions/tlp-5/

The term "Code Components" specifically includes ASN.1 modules:

https://trustee.ietf.org/documents/trust-legal-provisions/code-components-list-3/

Add an SPDX identifier as well as a copyright notice pursuant to section
6.d. of the Trust Legal Provisions to all ASN.1 modules in the tree
which are derived from IETF Documents.

Section 4.d. of the Trust Legal Provisions requests that each Code
Component identify the RFC from which it is taken, so link that RFC
in every ASN.1 module.

Signed-off-by: Lukas Wunner <lukas@wunner.de>
---
 I'm adding a new IETF ASN.1 module for PCI device authentication, hence
 had to research what the correct license is.  Thought I'd fix this up
 treewide while at it.

 Not included here is fs/smb/client/cifs_spnego_negtokeninit.asn1,
 which is similar to fs/smb/client/ksmbd_spnego_negtokeninit.asn1,
 but contains a Microsoft extension published as Open Specifications
 Documentation.  It's unclear to me what license they use:
 https://learn.microsoft.com/en-us/openspecs/windows_protocols/ms-spng/

 crypto/asymmetric_keys/pkcs7.asn1            | 7 +++++++
 crypto/asymmetric_keys/pkcs8.asn1            | 6 ++++++
 crypto/asymmetric_keys/x509.asn1             | 7 +++++++
 crypto/asymmetric_keys/x509_akid.asn1        | 5 +++++
 crypto/rsaprivkey.asn1                       | 7 +++++++
 crypto/rsapubkey.asn1                        | 7 +++++++
 fs/smb/server/ksmbd_spnego_negtokeninit.asn1 | 8 ++++++++
 fs/smb/server/ksmbd_spnego_negtokentarg.asn1 | 7 +++++++
 net/ipv4/netfilter/nf_nat_snmp_basic.asn1    | 8 ++++++++
 9 files changed, 62 insertions(+)

diff --git a/crypto/asymmetric_keys/pkcs7.asn1 b/crypto/asymmetric_keys/pkcs7.asn1
index 1eca740..28e1f4a 100644
--- a/crypto/asymmetric_keys/pkcs7.asn1
+++ b/crypto/asymmetric_keys/pkcs7.asn1
@@ -1,3 +1,10 @@
+-- SPDX-License-Identifier: BSD-3-Clause
+--
+-- Copyright (C) 2009 IETF Trust and the persons identified as authors
+-- of the code
+--
+-- https://www.rfc-editor.org/rfc/rfc5652#section-3
+
 PKCS7ContentInfo ::= SEQUENCE {
 	contentType	ContentType ({ pkcs7_check_content_type }),
 	content		[0] EXPLICIT SignedData OPTIONAL
diff --git a/crypto/asymmetric_keys/pkcs8.asn1 b/crypto/asymmetric_keys/pkcs8.asn1
index 702c41a..a2a8af2 100644
--- a/crypto/asymmetric_keys/pkcs8.asn1
+++ b/crypto/asymmetric_keys/pkcs8.asn1
@@ -1,3 +1,9 @@
+-- SPDX-License-Identifier: BSD-3-Clause
+--
+-- Copyright (C) 2010 IETF Trust and the persons identified as authors
+-- of the code
+--
+-- https://www.rfc-editor.org/rfc/rfc5958#section-2
 --
 -- This is the unencrypted variant
 --
diff --git a/crypto/asymmetric_keys/x509.asn1 b/crypto/asymmetric_keys/x509.asn1
index 92d59c3..feb9573 100644
--- a/crypto/asymmetric_keys/x509.asn1
+++ b/crypto/asymmetric_keys/x509.asn1
@@ -1,3 +1,10 @@
+-- SPDX-License-Identifier: BSD-3-Clause
+--
+-- Copyright (C) 2008 IETF Trust and the persons identified as authors
+-- of the code
+--
+-- https://www.rfc-editor.org/rfc/rfc5280#section-4
+
 Certificate ::= SEQUENCE {
 	tbsCertificate		TBSCertificate ({ x509_note_tbs_certificate }),
 	signatureAlgorithm	AlgorithmIdentifier,
diff --git a/crypto/asymmetric_keys/x509_akid.asn1 b/crypto/asymmetric_keys/x509_akid.asn1
index 1a33231..164b2ed 100644
--- a/crypto/asymmetric_keys/x509_akid.asn1
+++ b/crypto/asymmetric_keys/x509_akid.asn1
@@ -1,3 +1,8 @@
+-- SPDX-License-Identifier: BSD-3-Clause
+--
+-- Copyright (C) 2008 IETF Trust and the persons identified as authors
+-- of the code
+--
 -- X.509 AuthorityKeyIdentifier
 -- rfc5280 section 4.2.1.1
 
diff --git a/crypto/rsaprivkey.asn1 b/crypto/rsaprivkey.asn1
index 4ce0675..76865124 100644
--- a/crypto/rsaprivkey.asn1
+++ b/crypto/rsaprivkey.asn1
@@ -1,3 +1,10 @@
+-- SPDX-License-Identifier: BSD-3-Clause
+--
+-- Copyright (C) 2016 IETF Trust and the persons identified as authors
+-- of the code
+--
+-- https://www.rfc-editor.org/rfc/rfc8017#appendix-A.1.2
+
 RsaPrivKey ::= SEQUENCE {
 	version		INTEGER,
 	n		INTEGER ({ rsa_get_n }),
diff --git a/crypto/rsapubkey.asn1 b/crypto/rsapubkey.asn1
index 725498e..0d32b1c 100644
--- a/crypto/rsapubkey.asn1
+++ b/crypto/rsapubkey.asn1
@@ -1,3 +1,10 @@
+-- SPDX-License-Identifier: BSD-3-Clause
+--
+-- Copyright (C) 2016 IETF Trust and the persons identified as authors
+-- of the code
+--
+-- https://www.rfc-editor.org/rfc/rfc8017#appendix-A.1.1
+
 RsaPubKey ::= SEQUENCE {
 	n INTEGER ({ rsa_get_n }),
 	e INTEGER ({ rsa_get_e })
diff --git a/fs/smb/server/ksmbd_spnego_negtokeninit.asn1 b/fs/smb/server/ksmbd_spnego_negtokeninit.asn1
index 0065f19..00151380 100644
--- a/fs/smb/server/ksmbd_spnego_negtokeninit.asn1
+++ b/fs/smb/server/ksmbd_spnego_negtokeninit.asn1
@@ -1,3 +1,11 @@
+-- SPDX-License-Identifier: BSD-3-Clause
+--
+-- Copyright (C) 1998, 2000 IETF Trust and the persons identified as authors
+-- of the code
+--
+-- https://www.rfc-editor.org/rfc/rfc2478#section-3.2.1
+-- https://www.rfc-editor.org/rfc/rfc2743#section-3.1
+
 GSSAPI ::=
 	[APPLICATION 0] IMPLICIT SEQUENCE {
 		thisMech
diff --git a/fs/smb/server/ksmbd_spnego_negtokentarg.asn1 b/fs/smb/server/ksmbd_spnego_negtokentarg.asn1
index 1151933..797e485 100644
--- a/fs/smb/server/ksmbd_spnego_negtokentarg.asn1
+++ b/fs/smb/server/ksmbd_spnego_negtokentarg.asn1
@@ -1,3 +1,10 @@
+-- SPDX-License-Identifier: BSD-3-Clause
+--
+-- Copyright (C) 1998 IETF Trust and the persons identified as authors
+-- of the code
+--
+-- https://www.rfc-editor.org/rfc/rfc2478#section-3.2.1
+
 GSSAPI ::=
 	CHOICE {
 		negTokenInit
diff --git a/net/ipv4/netfilter/nf_nat_snmp_basic.asn1 b/net/ipv4/netfilter/nf_nat_snmp_basic.asn1
index 24b7326..dc2cc57 100644
--- a/net/ipv4/netfilter/nf_nat_snmp_basic.asn1
+++ b/net/ipv4/netfilter/nf_nat_snmp_basic.asn1
@@ -1,3 +1,11 @@
+-- SPDX-License-Identifier: BSD-3-Clause
+--
+-- Copyright (C) 1990, 2002 IETF Trust and the persons identified as authors
+-- of the code
+--
+-- https://www.rfc-editor.org/rfc/rfc1157#section-4
+-- https://www.rfc-editor.org/rfc/rfc3416#section-3
+
 Message ::=
 	SEQUENCE {
 		version
-- 
2.40.1

