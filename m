Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B5DCC7AE99D
	for <lists+keyrings@lfdr.de>; Tue, 26 Sep 2023 11:55:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231843AbjIZJzP (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 26 Sep 2023 05:55:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230037AbjIZJzM (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Tue, 26 Sep 2023 05:55:12 -0400
X-Greylist: delayed 501 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 26 Sep 2023 02:55:05 PDT
Received: from bmailout2.hostsharing.net (bmailout2.hostsharing.net [83.223.78.240])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E486B3;
        Tue, 26 Sep 2023 02:55:05 -0700 (PDT)
Received: from h08.hostsharing.net (h08.hostsharing.net [IPv6:2a01:37:1000::53df:5f1c:0])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
         client-signature RSA-PSS (4096 bits) client-digest SHA256)
        (Client CN "*.hostsharing.net", Issuer "RapidSSL Global TLS RSA4096 SHA256 2022 CA1" (verified OK))
        by bmailout2.hostsharing.net (Postfix) with ESMTPS id 7A6762800BBE7;
        Tue, 26 Sep 2023 11:46:40 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
        id 688211F230; Tue, 26 Sep 2023 11:46:40 +0200 (CEST)
Message-Id: <be8ab09429d55c6cfc52ee0e43bf021ffb384152.1695720715.git.lukas@wunner.de>
From:   Lukas Wunner <lukas@wunner.de>
Date:   Tue, 26 Sep 2023 11:46:41 +0200
Subject: [PATCH] X.509: Add missing IMPLICIT annotations to AKID ASN.1 module
To:     David Howells <dhowells@redhat.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>
Cc:     Vivek Goyal <vgoyal@redhat.com>, keyrings@vger.kernel.org,
        linux-crypto@vger.kernel.org
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

The ASN.1 module in RFC 5280 appendix A.1 uses EXPLICIT TAGS whereas the
one in appendix A.2 uses IMPLICIT TAGS.

The kernel's simplified asn1_compiler.c always uses EXPLICIT TAGS, hence
definitions from appendix A.2 need to be annotated as IMPLICIT for the
compiler to generate RFC-compliant code.

In particular, GeneralName is defined in appendix A.2:

GeneralName ::= CHOICE {
        otherName                       [0] OtherName,
        ...
        dNSName                         [2] IA5String,
        x400Address                     [3] ORAddress,
        directoryName                   [4] Name,
        ...
        }

Because appendix A.2 uses IMPLICIT TAGS, the IA5String tag (0x16) of a
dNSName is not rendered.  Instead, the string directly succeeds the
[2] tag (0x82).

Likewise, the SEQUENCE tag (0x30) of an OtherName is not rendered.
Instead, only the constituents of the SEQUENCE are rendered:  An OID tag
(0x06), a [0] tag (0xa0) and an ANY tag.  That's three consecutive tags
instead of a single encompassing tag.

The situation is different for x400Address and directoryName choices:
They reference ORAddress and Name, which are defined in appendix A.1,
therefore use EXPLICIT TAGS.

The AKID ASN.1 module is missing several IMPLICIT annotations, hence
isn't RFC-compliant.  In the unlikely event that an AKID contains other
elements beside a directoryName, users may see parse errors.

Add the missing annotations but do not tag this commit for stable as I
am not aware of any issue reports.  Fixes are only eligible for stable
if they're "obviously correct" and with ASN.1 there's no such thing.

Signed-off-by: Lukas Wunner <lukas@wunner.de>
---
Found this while bringing up PCI device authentication, which involves
validating the Subject Alternative Name in certificates.

I double-checked all ASN.1 modules in the tree and this seems to be
the only one affected by the issue.

 crypto/asymmetric_keys/x509_akid.asn1 | 24 +++++++++++++++++-------
 1 file changed, 17 insertions(+), 7 deletions(-)

diff --git a/crypto/asymmetric_keys/x509_akid.asn1 b/crypto/asymmetric_keys/x509_akid.asn1
index 1a33231..c7818ff 100644
--- a/crypto/asymmetric_keys/x509_akid.asn1
+++ b/crypto/asymmetric_keys/x509_akid.asn1
@@ -14,15 +14,15 @@ CertificateSerialNumber ::= INTEGER ({ x509_akid_note_serial })
 GeneralNames ::= SEQUENCE OF GeneralName
 
 GeneralName ::= CHOICE {
-	otherName			[0] ANY,
-	rfc822Name			[1] IA5String,
-	dNSName				[2] IA5String,
+	otherName			[0] IMPLICIT OtherName,
+	rfc822Name			[1] IMPLICIT IA5String,
+	dNSName				[2] IMPLICIT IA5String,
 	x400Address			[3] ANY,
 	directoryName			[4] Name ({ x509_akid_note_name }),
-	ediPartyName			[5] ANY,
-	uniformResourceIdentifier	[6] IA5String,
-	iPAddress			[7] OCTET STRING,
-	registeredID			[8] OBJECT IDENTIFIER
+	ediPartyName			[5] IMPLICIT EDIPartyName,
+	uniformResourceIdentifier	[6] IMPLICIT IA5String,
+	iPAddress			[7] IMPLICIT OCTET STRING,
+	registeredID			[8] IMPLICIT OBJECT IDENTIFIER
 	}
 
 Name ::= SEQUENCE OF RelativeDistinguishedName
@@ -33,3 +33,13 @@ AttributeValueAssertion ::= SEQUENCE {
 	attributeType		OBJECT IDENTIFIER ({ x509_note_OID }),
 	attributeValue		ANY ({ x509_extract_name_segment })
 	}
+
+OtherName ::= SEQUENCE {
+	type-id			OBJECT IDENTIFIER,
+	value			[0] ANY
+	}
+
+EDIPartyName ::= SEQUENCE {
+	nameAssigner		[0] ANY OPTIONAL,
+	partyName		[1] ANY
+	}
-- 
2.40.1

