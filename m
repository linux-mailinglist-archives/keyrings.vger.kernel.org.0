Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE419318C0B
	for <lists+keyrings@lfdr.de>; Thu, 11 Feb 2021 14:31:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231175AbhBKN3J (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 11 Feb 2021 08:29:09 -0500
Received: from mail-wr1-f51.google.com ([209.85.221.51]:42737 "EHLO
        mail-wr1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231640AbhBKNZy (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 11 Feb 2021 08:25:54 -0500
Received: by mail-wr1-f51.google.com with SMTP id r21so4148493wrr.9
        for <keyrings@vger.kernel.org>; Thu, 11 Feb 2021 05:25:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nvpInyEqgX5BZmThyrXzGClxp8zRbcPKvlFOR2GM/aE=;
        b=lcJboaUsJjflpaQCqTYYDOGIP/aVpAkPDDGbYeHe7jo1P/qZBPa2cQ76/nilbI41rh
         QVebrlpDM+ve4Zv276bgIYnCBIXNFA/nr3Ea9oZi1FWptGGkj+bgATLaUwMEqQoEF2wY
         w1dPlUzvn4F2MYRMEjx43shyTbkW6xfHNxDstrQBHjRhWagFFkAYMiuTJNnUpNB9uN9F
         ZOV4NNtE/R3PMMIUJCDf7yhMEW3pY2b4LjaloWEsxL5SCadJk+RsslCQt0pW6XZJGtk7
         4V/ZpA4Qqqp05/mivyTwKqvlKX3o6Z5u8cC5Zvq1tGTqBmGMMckOJls/qEXosXN+KhZG
         38Aw==
X-Gm-Message-State: AOAM533gNGOn+AdRJbRtGyhyrUjxNhaseytQZ67bu93I8Aq/jwRZyqVY
        dRzun9KscvPm4f5V3t46WchjBCTRaRkREcF5
X-Google-Smtp-Source: ABdhPJzaln/eKj5tk0W8tTb2oA0F4OtJTXMiMWQVM/hbwb1nbHJNS9NaADvVplJt87VVmuZXJJI1Ag==
X-Received: by 2002:a5d:6509:: with SMTP id x9mr5775625wru.229.1613049907348;
        Thu, 11 Feb 2021 05:25:07 -0800 (PST)
Received: from localhost.localdomain ([82.213.213.214])
        by smtp.gmail.com with ESMTPSA id n5sm8558489wmq.7.2021.02.11.05.25.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Feb 2021 05:25:06 -0800 (PST)
From:   Andrew Zaborowski <andrew.zaborowski@intel.com>
To:     keyrings@vger.kernel.org
Cc:     David Howells <dhowells@redhat.com>,
        Jarkko Sakkinen <jarkko@kernel.org>
Subject: [PATCH 2/2] keys: X.509 public key issuer lookup without AKID
Date:   Thu, 11 Feb 2021 14:24:29 +0100
Message-Id: <20210211132429.283122-2-andrew.zaborowski@intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210211132429.283122-1-andrew.zaborowski@intel.com>
References: <20210211132429.283122-1-andrew.zaborowski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

There are non-root X.509 v3 certificates in use out there that contain
no Authority Key Identifier extension (RFC5280 section 4.2.1.1).  For
trust verification purposes the kernel asymmetric key type keeps two
struct asymmetric_key_id instances that the key can be looked up by,
and another two to look up the key's issuer.  The x509 public key type
and the PKCS7 type generate them from the SKID and AKID extensions in
the certificate.  In effect current code has no way to look up the
issuer certificate for verification without the AKID.

To remedy this, add a third asymmetric_key_id blob to the arrays in
both asymmetric_key_id's (for certficate subject) and in the
public_keys_signature's auth_ids (for issuer lookup), using just raw
subject and issuer DNs from the certificate.  Adapt
asymmetric_key_ids() and its callers to use the third ID for lookups
when none of the other two are available.  Attempt to keep the logic
intact when they are, to minimise behaviour changes.  Adapt the
restrict functions' NULL-checks to include that ID too.  Do not modify
the lookup logic in pkcs7_verify.c, the AKID extensions are still
required there.

Internally use a new "dn:" prefix to the search specifier string
generated for the key lookup in find_asymmetric_key().  This tells
asymmetric_key_match_preparse to only match the data against the raw
DN in the third ID and shouldn't conflict with search specifiers
already in use.

In effect implement what (2) in the struct asymmetric_key_id comment
(include/keys/asymmetric-type.h) is probably talking about already, so
do not modify that comment.  It is also how "openssl verify" looks up
issuer certificates without the AKID available.  Lookups by the raw
DN are unambiguous only provided that the CAs respect the condition in
RFC5280 4.2.1.1 that the AKID may only be omitted if the CA uses
a single signing key.

The following is an example of two things that this change enables.
A self-signed ceritficate is generated following the example from
https://letsencrypt.org/docs/certificates-for-localhost/, and can be
looked up by an identifier and verified against itself by linking to a
restricted keyring -- both things not possible before due to the missing
AKID extension:

$ openssl req -x509 -out localhost.crt -outform DER -keyout localhost.key \
  -newkey rsa:2048 -nodes -sha256 \
  -subj '/CN=localhost' -extensions EXT -config <( \
   echo -e "[dn]\nCN=localhost\n[req]\ndistinguished_name = dn\n[EXT]\n" \
          "subjectAltName=DNS:localhost\nkeyUsage=digitalSignature\n" \
	  "extendedKeyUsage=serverAuth")
$ keyring=`keyctl newring test @u`
$ trusted=`keyctl padd asymmetric trusted $keyring < localhost.crt`; \
  echo $trusted
39726322
$ keyctl search $keyring asymmetric dn:3112301006035504030c096c6f63616c686f7374
39726322
$ keyctl restrict_keyring $keyring asymmetric key_or_keyring:$trusted
$ keyctl padd asymmetric verified $keyring < localhost.crt

Signed-off-by: Andrew Zaborowski <andrew.zaborowski@intel.com>
---
v2 changes:
 - focus the commit message on the implementation
 - shorten the prefix used in find_asymmetric_key
 - clarify find_asymmetric_key comment
v3 changes:
 - further clarify the commit message

 crypto/asymmetric_keys/asymmetric_type.c  | 57 +++++++++++++++++------
 crypto/asymmetric_keys/pkcs7_trust.c      |  6 +--
 crypto/asymmetric_keys/restrict.c         | 48 +++++++++++--------
 crypto/asymmetric_keys/x509_cert_parser.c | 10 ++++
 crypto/asymmetric_keys/x509_public_key.c  | 10 ++++
 include/crypto/public_key.h               |  2 +-
 include/keys/asymmetric-type.h            |  3 +-
 7 files changed, 99 insertions(+), 37 deletions(-)

diff --git a/crypto/asymmetric_keys/asymmetric_type.c b/crypto/asymmetric_keys/asymmetric_type.c
index 47cc88fa0fa..0be4326bc9c 100644
--- a/crypto/asymmetric_keys/asymmetric_type.c
+++ b/crypto/asymmetric_keys/asymmetric_type.c
@@ -36,16 +36,23 @@ static DECLARE_RWSEM(asymmetric_key_parsers_sem);
  * find_asymmetric_key - Find a key by ID.
  * @keyring: The keys to search.
  * @id_0: The first ID to look for or NULL.
- * @id_1: The second ID to look for or NULL.
- * @partial: Use partial match if true, exact if false.
+ * @id_1: The second ID to look for or NULL, matched together with @id_0
+ * against @keyring keys' id[0] and id[1].
+ * @id_2: The fallback ID to match against @keyring keys' id[2] if both of the
+ * other IDs are NULL.
+ * @partial: Use partial match for @id_0 and @id_1 if true, exact if false.
  *
  * Find a key in the given keyring by identifier.  The preferred identifier is
  * the id_0 and the fallback identifier is the id_1.  If both are given, the
- * lookup is by the former, but the latter must also match.
+ * former is matched (exactly or partially) against either of the sought key's
+ * identifiers and the latter must match the found key's second identifier
+ * exactly.  If both are missing, id_2 must match the sought key's third
+ * identifier exactly.
  */
 struct key *find_asymmetric_key(struct key *keyring,
 				const struct asymmetric_key_id *id_0,
 				const struct asymmetric_key_id *id_1,
+				const struct asymmetric_key_id *id_2,
 				bool partial)
 {
 	struct key *key;
@@ -54,7 +61,7 @@ struct key *find_asymmetric_key(struct key *keyring,
 	char *req, *p;
 	int len;
 
-	if (!id_0 && !id_1) {
+	if (!id_0 && !id_1 && !id_2) {
 		WARN(1, "All ID's are NULL\n");
 		return ERR_PTR(-EINVAL);
 	}
@@ -62,9 +69,12 @@ struct key *find_asymmetric_key(struct key *keyring,
 	if (id_0) {
 		lookup = id_0->data;
 		len = id_0->len;
-	} else {
+	} else if (id_1) {
 		lookup = id_1->data;
 		len = id_1->len;
+	} else {
+		lookup = id_2->data;
+		len = id_2->len;
 	}
 
 	/* Construct an identifier "id:<keyid>". */
@@ -72,7 +82,10 @@ struct key *find_asymmetric_key(struct key *keyring,
 	if (!req)
 		return ERR_PTR(-ENOMEM);
 
-	if (partial) {
+	if (!id_0 && !id_1) {
+		*p++ = 'd';
+		*p++ = 'n';
+	} else if (partial) {
 		*p++ = 'i';
 		*p++ = 'd';
 	} else {
@@ -186,8 +199,8 @@ bool asymmetric_key_id_partial(const struct asymmetric_key_id *kid1,
 EXPORT_SYMBOL_GPL(asymmetric_key_id_partial);
 
 /**
- * asymmetric_match_key_ids - Search asymmetric key IDs
- * @kids: The list of key IDs to check
+ * asymmetric_match_key_ids - Search asymmetric key IDs 1 & 2
+ * @kids: The pair of key IDs to check
  * @match_id: The key ID we're looking for
  * @match: The match function to use
  */
@@ -201,7 +214,7 @@ static bool asymmetric_match_key_ids(
 
 	if (!kids || !match_id)
 		return false;
-	for (i = 0; i < ARRAY_SIZE(kids->id); i++)
+	for (i = 0; i < 2; i++)
 		if (match(kids->id[i], match_id))
 			return true;
 	return false;
@@ -245,7 +258,7 @@ struct asymmetric_key_id *asymmetric_key_hex_to_key_id(const char *id)
 }
 
 /*
- * Match asymmetric keys by an exact match on an ID.
+ * Match asymmetric keys by an exact match on one of the first two IDs.
  */
 static bool asymmetric_key_cmp(const struct key *key,
 			       const struct key_match_data *match_data)
@@ -258,7 +271,7 @@ static bool asymmetric_key_cmp(const struct key *key,
 }
 
 /*
- * Match asymmetric keys by a partial match on an IDs.
+ * Match asymmetric keys by a partial match on one of the first two IDs.
  */
 static bool asymmetric_key_cmp_partial(const struct key *key,
 				       const struct key_match_data *match_data)
@@ -270,6 +283,18 @@ static bool asymmetric_key_cmp_partial(const struct key *key,
 					asymmetric_key_id_partial);
 }
 
+/*
+ * Match asymmetric keys by an exact match on the third IDs.
+ */
+static bool asymmetric_key_cmp_name(const struct key *key,
+				    const struct key_match_data *match_data)
+{
+	const struct asymmetric_key_ids *kids = asymmetric_key_ids(key);
+	const struct asymmetric_key_id *match_id = match_data->preparsed;
+
+	return kids && asymmetric_key_id_same(kids->id[2], match_id);
+}
+
 /*
  * Preparse the match criterion.  If we don't set lookup_type and cmp,
  * the default will be an exact match on the key description.
@@ -277,8 +302,9 @@ static bool asymmetric_key_cmp_partial(const struct key *key,
  * There are some specifiers for matching key IDs rather than by the key
  * description:
  *
- *	"id:<id>" - find a key by partial match on any available ID
- *	"ex:<id>" - find a key by exact match on any available ID
+ *	"id:<id>" - find a key by partial match on one of the first two IDs
+ *	"ex:<id>" - find a key by exact match on one of the first two IDs
+ *	"dn:<id>" - find a key by exact match on the third ID
  *
  * These have to be searched by iteration rather than by direct lookup because
  * the key is hashed according to its description.
@@ -302,6 +328,11 @@ static int asymmetric_key_match_preparse(struct key_match_data *match_data)
 		   spec[1] == 'x' &&
 		   spec[2] == ':') {
 		id = spec + 3;
+	} else if (spec[0] == 'd' &&
+		   spec[1] == 'n' &&
+		   spec[2] == ':') {
+		id = spec + 3;
+		cmp = asymmetric_key_cmp_name;
 	} else {
 		goto default_match;
 	}
diff --git a/crypto/asymmetric_keys/pkcs7_trust.c b/crypto/asymmetric_keys/pkcs7_trust.c
index 61af3c4d82c..998ba0e2ffb 100644
--- a/crypto/asymmetric_keys/pkcs7_trust.c
+++ b/crypto/asymmetric_keys/pkcs7_trust.c
@@ -48,7 +48,7 @@ static int pkcs7_validate_trust_one(struct pkcs7_message *pkcs7,
 		 * keys.
 		 */
 		key = find_asymmetric_key(trust_keyring,
-					  x509->id, x509->skid, false);
+					  x509->id, x509->skid, NULL, false);
 		if (!IS_ERR(key)) {
 			/* One of the X.509 certificates in the PKCS#7 message
 			 * is apparently the same as one we already trust.
@@ -82,7 +82,7 @@ static int pkcs7_validate_trust_one(struct pkcs7_message *pkcs7,
 		key = find_asymmetric_key(trust_keyring,
 					  last->sig->auth_ids[0],
 					  last->sig->auth_ids[1],
-					  false);
+					  NULL, false);
 		if (!IS_ERR(key)) {
 			x509 = last;
 			pr_devel("sinfo %u: Root cert %u signer is key %x\n",
@@ -97,7 +97,7 @@ static int pkcs7_validate_trust_one(struct pkcs7_message *pkcs7,
 	 * the signed info directly.
 	 */
 	key = find_asymmetric_key(trust_keyring,
-				  sinfo->sig->auth_ids[0], NULL, false);
+				  sinfo->sig->auth_ids[0], NULL, NULL, false);
 	if (!IS_ERR(key)) {
 		pr_devel("sinfo %u: Direct signer is key %x\n",
 			 sinfo->index, key_serial(key));
diff --git a/crypto/asymmetric_keys/restrict.c b/crypto/asymmetric_keys/restrict.c
index 77ebebada29..f77875ec942 100644
--- a/crypto/asymmetric_keys/restrict.c
+++ b/crypto/asymmetric_keys/restrict.c
@@ -87,7 +87,7 @@ int restrict_link_by_signature(struct key *dest_keyring,
 	sig = payload->data[asym_auth];
 	if (!sig)
 		return -ENOPKG;
-	if (!sig->auth_ids[0] && !sig->auth_ids[1])
+	if (!sig->auth_ids[0] && !sig->auth_ids[1] && !sig->auth_ids[2])
 		return -ENOKEY;
 
 	if (ca_keyid && !asymmetric_key_id_partial(sig->auth_ids[1], ca_keyid))
@@ -96,7 +96,7 @@ int restrict_link_by_signature(struct key *dest_keyring,
 	/* See if we have a key that signed this one. */
 	key = find_asymmetric_key(trust_keyring,
 				  sig->auth_ids[0], sig->auth_ids[1],
-				  false);
+				  sig->auth_ids[2], false);
 	if (IS_ERR(key))
 		return -ENOKEY;
 
@@ -108,11 +108,11 @@ int restrict_link_by_signature(struct key *dest_keyring,
 	return ret;
 }
 
-static bool match_either_id(const struct asymmetric_key_ids *pair,
+static bool match_either_id(const struct asymmetric_key_id **pair,
 			    const struct asymmetric_key_id *single)
 {
-	return (asymmetric_key_id_same(pair->id[0], single) ||
-		asymmetric_key_id_same(pair->id[1], single));
+	return (asymmetric_key_id_same(pair[0], single) ||
+		asymmetric_key_id_same(pair[1], single));
 }
 
 static int key_or_keyring_common(struct key *dest_keyring,
@@ -140,20 +140,22 @@ static int key_or_keyring_common(struct key *dest_keyring,
 	sig = payload->data[asym_auth];
 	if (!sig)
 		return -ENOPKG;
-	if (!sig->auth_ids[0] && !sig->auth_ids[1])
+	if (!sig->auth_ids[0] && !sig->auth_ids[1] && !sig->auth_ids[2])
 		return -ENOKEY;
 
 	if (trusted) {
 		if (trusted->type == &key_type_keyring) {
 			/* See if we have a key that signed this one. */
 			key = find_asymmetric_key(trusted, sig->auth_ids[0],
-						  sig->auth_ids[1], false);
+						  sig->auth_ids[1],
+						  sig->auth_ids[2], false);
 			if (IS_ERR(key))
 				key = NULL;
 		} else if (trusted->type == &key_type_asymmetric) {
-			const struct asymmetric_key_ids *signer_ids;
+			const struct asymmetric_key_id **signer_ids;
 
-			signer_ids = asymmetric_key_ids(trusted);
+			signer_ids = (const struct asymmetric_key_id **)
+				asymmetric_key_ids(trusted)->id;
 
 			/*
 			 * The auth_ids come from the candidate key (the
@@ -164,22 +166,29 @@ static int key_or_keyring_common(struct key *dest_keyring,
 			 * The signer_ids are identifiers for the
 			 * signing key specified for dest_keyring.
 			 *
-			 * The first auth_id is the preferred id, and
-			 * the second is the fallback. If only one
-			 * auth_id is present, it may match against
-			 * either signer_id. If two auth_ids are
-			 * present, the first auth_id must match one
-			 * signer_id and the second auth_id must match
-			 * the second signer_id.
+			 * The first auth_id is the preferred id, 2nd and
+			 * 3rd are the fallbacks. If excatly one of
+			 * auth_ids[0] and auth_ids[1] is present, it may
+			 * match either signer_ids[0] or signed_ids[1].
+			 * If both are present the first one may match
+			 * either signed_id but the second one must match
+			 * the second signer_id. If neither of them is
+			 * available, auth_ids[2] is matched against
+			 * signer_ids[2] as a fallback.
 			 */
-			if (!sig->auth_ids[0] || !sig->auth_ids[1]) {
+			if (!sig->auth_ids[0] && !sig->auth_ids[1]) {
+				if (asymmetric_key_id_same(signer_ids[2],
+							   sig->auth_ids[2]))
+					key = __key_get(trusted);
+
+			} else if (!sig->auth_ids[0] || !sig->auth_ids[1]) {
 				const struct asymmetric_key_id *auth_id;
 
 				auth_id = sig->auth_ids[0] ?: sig->auth_ids[1];
 				if (match_either_id(signer_ids, auth_id))
 					key = __key_get(trusted);
 
-			} else if (asymmetric_key_id_same(signer_ids->id[1],
+			} else if (asymmetric_key_id_same(signer_ids[1],
 							  sig->auth_ids[1]) &&
 				   match_either_id(signer_ids,
 						   sig->auth_ids[0])) {
@@ -193,7 +202,8 @@ static int key_or_keyring_common(struct key *dest_keyring,
 	if (check_dest && !key) {
 		/* See if the destination has a key that signed this one. */
 		key = find_asymmetric_key(dest_keyring, sig->auth_ids[0],
-					  sig->auth_ids[1], false);
+					  sig->auth_ids[1], sig->auth_ids[2],
+					  false);
 		if (IS_ERR(key))
 			key = NULL;
 	}
diff --git a/crypto/asymmetric_keys/x509_cert_parser.c b/crypto/asymmetric_keys/x509_cert_parser.c
index 52c9b455fc7..59dfffa77cf 100644
--- a/crypto/asymmetric_keys/x509_cert_parser.c
+++ b/crypto/asymmetric_keys/x509_cert_parser.c
@@ -415,8 +415,18 @@ int x509_note_issuer(void *context, size_t hdrlen,
 		     const void *value, size_t vlen)
 {
 	struct x509_parse_context *ctx = context;
+	struct asymmetric_key_id *kid;
+
 	ctx->cert->raw_issuer = value;
 	ctx->cert->raw_issuer_size = vlen;
+
+	if (!ctx->cert->sig->auth_ids[2]) {
+		kid = asymmetric_key_generate_id(value, vlen, "", 0);
+		if (IS_ERR(kid))
+			return PTR_ERR(kid);
+		ctx->cert->sig->auth_ids[2] = kid;
+	}
+
 	return x509_fabricate_name(ctx, hdrlen, tag, &ctx->cert->issuer, vlen);
 }
 
diff --git a/crypto/asymmetric_keys/x509_public_key.c b/crypto/asymmetric_keys/x509_public_key.c
index ae450eb8be1..a95cc351518 100644
--- a/crypto/asymmetric_keys/x509_public_key.c
+++ b/crypto/asymmetric_keys/x509_public_key.c
@@ -221,6 +221,13 @@ static int x509_key_preparse(struct key_preparsed_payload *prep)
 		goto error_free_desc;
 	kids->id[0] = cert->id;
 	kids->id[1] = cert->skid;
+	kids->id[2] = asymmetric_key_generate_id(cert->raw_subject,
+						 cert->raw_subject_size,
+						 "", 0);
+	if (IS_ERR(kids->id[2])) {
+		ret = PTR_ERR(kids->id[2]);
+		goto error_free_kids;
+	}
 
 	/* We're pinning the module by being linked against it */
 	__module_get(public_key_subtype.owner);
@@ -237,8 +244,11 @@ static int x509_key_preparse(struct key_preparsed_payload *prep)
 	cert->skid = NULL;
 	cert->sig = NULL;
 	desc = NULL;
+	kids = NULL;
 	ret = 0;
 
+error_free_kids:
+	kfree(kids);
 error_free_desc:
 	kfree(desc);
 error_free_cert:
diff --git a/include/crypto/public_key.h b/include/crypto/public_key.h
index 948c5203ca9..4819e63a772 100644
--- a/include/crypto/public_key.h
+++ b/include/crypto/public_key.h
@@ -37,7 +37,7 @@ extern void public_key_free(struct public_key *key);
  * Public key cryptography signature data
  */
 struct public_key_signature {
-	struct asymmetric_key_id *auth_ids[2];
+	struct asymmetric_key_id *auth_ids[3];
 	u8 *s;			/* Signature */
 	u32 s_size;		/* Number of bytes in signature */
 	u8 *digest;
diff --git a/include/keys/asymmetric-type.h b/include/keys/asymmetric-type.h
index a29d3ff2e7e..344ab9f178d 100644
--- a/include/keys/asymmetric-type.h
+++ b/include/keys/asymmetric-type.h
@@ -53,7 +53,7 @@ struct asymmetric_key_id {
 };
 
 struct asymmetric_key_ids {
-	void		*id[2];
+	void		*id[3];
 };
 
 extern bool asymmetric_key_id_same(const struct asymmetric_key_id *kid1,
@@ -75,6 +75,7 @@ const struct asymmetric_key_ids *asymmetric_key_ids(const struct key *key)
 extern struct key *find_asymmetric_key(struct key *keyring,
 				       const struct asymmetric_key_id *id_0,
 				       const struct asymmetric_key_id *id_1,
+				       const struct asymmetric_key_id *id_2,
 				       bool partial);
 
 /*
-- 
2.27.0

