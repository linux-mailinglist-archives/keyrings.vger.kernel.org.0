Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C4164119FA
	for <lists+keyrings@lfdr.de>; Mon, 20 Sep 2021 18:42:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237868AbhITQns (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Mon, 20 Sep 2021 12:43:48 -0400
Received: from mail-wr1-f45.google.com ([209.85.221.45]:41838 "EHLO
        mail-wr1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229561AbhITQnr (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Mon, 20 Sep 2021 12:43:47 -0400
Received: by mail-wr1-f45.google.com with SMTP id w29so31499338wra.8
        for <keyrings@vger.kernel.org>; Mon, 20 Sep 2021 09:42:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3J4Pq6l+VFn9hzEvZ831J9xweg9Mfh4eadTDN2c8QHc=;
        b=CqRMzcIhxj2AxO8OFQbLwdemmJwFzbgJ+T7XXF1qyM/2qbC7RdI6vaBksezb7kM2XL
         H39XOZdX8b2RDL7PtJOB6X2HfYk1SqPf1Vjo1MI4vKWXLO0HM8HRQGSStqu/AiPOetKH
         OcNr1cQXqeHpB6weAzbtUq9ZspVwrv3J+yoAZrjiFnY5cpcnIhF6M8j3qfw+R3jb+ZHn
         ULq1EE1d14jb/SoQTwls7nY8KXVAbPXo90Pa327gF5nfFnqq9OcVtgpRJdfz1UN/H+Z/
         OzcQDuV5zX6XlBFTPZ4ZYh1xQKsUWgAyUMCh6QSGpNblnlfqvWBI8cxTwDY8Utly9OTs
         nWGQ==
X-Gm-Message-State: AOAM5316Urbp5lrkLgk+H07Kwzc3bkG8eeQP1lnW3BKsQ/RFgpGWKB0j
        GBUp8a/NlhWk6tIHW10M1VWJ+tN/uY8gJw==
X-Google-Smtp-Source: ABdhPJxdnVArtggVvyIYt1EN3cosYrVjeJxqYRXPE/aK1iQA0xHRPKbtAFa1HiKzZJab0MDsYzCYzA==
X-Received: by 2002:a5d:6da9:: with SMTP id u9mr29328099wrs.58.1632156139075;
        Mon, 20 Sep 2021 09:42:19 -0700 (PDT)
Received: from iss.Home ([82.213.240.63])
        by smtp.gmail.com with ESMTPSA id l19sm16775165wrc.16.2021.09.20.09.42.18
        for <keyrings@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Sep 2021 09:42:18 -0700 (PDT)
From:   Andrew Zaborowski <andrew.zaborowski@intel.com>
To:     keyrings@vger.kernel.org
Subject: [RESEND][PATCH] keys: X.509 public key issuer lookup without AKID
Date:   Mon, 20 Sep 2021 18:42:14 +0200
Message-Id: <20210920164214.598136-1-andrew.zaborowski@intel.com>
X-Mailer: git-send-email 2.30.2
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
Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>
---
v2 changes:
 - focus the commit message on the implementation
 - shorten the prefix used in find_asymmetric_key
 - clarify find_asymmetric_key comment
v3 changes:
 - further clarify the commit message
v4 changes:
 - rebase

 crypto/asymmetric_keys/asymmetric_type.c  | 57 +++++++++++++++++------
 crypto/asymmetric_keys/pkcs7_trust.c      |  6 +--
 crypto/asymmetric_keys/restrict.c         | 48 +++++++++++--------
 crypto/asymmetric_keys/x509_cert_parser.c | 10 ++++
 crypto/asymmetric_keys/x509_public_key.c  | 10 ++++
 include/crypto/public_key.h               |  2 +-
 include/keys/asymmetric-type.h            |  3 +-
 7 files changed, 99 insertions(+), 37 deletions(-)

diff --git a/crypto/asymmetric_keys/asymmetric_type.c b/crypto/asymmetric_keys/asymmetric_type.c
index ad8af3d70ac..3df31899146 100644
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
@@ -54,14 +61,17 @@ struct key *find_asymmetric_key(struct key *keyring,
 	char *req, *p;
 	int len;
 
-	BUG_ON(!id_0 && !id_1);
+	BUG_ON(!id_0 && !id_1 && !id_2);
 
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
@@ -69,7 +79,10 @@ struct key *find_asymmetric_key(struct key *keyring,
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
@@ -185,8 +198,8 @@ bool asymmetric_key_id_partial(const struct asymmetric_key_id *kid1,
 EXPORT_SYMBOL_GPL(asymmetric_key_id_partial);
 
 /**
- * asymmetric_match_key_ids - Search asymmetric key IDs
- * @kids: The list of key IDs to check
+ * asymmetric_match_key_ids - Search asymmetric key IDs 1 & 2
+ * @kids: The pair of key IDs to check
  * @match_id: The key ID we're looking for
  * @match: The match function to use
  */
@@ -200,7 +213,7 @@ static bool asymmetric_match_key_ids(
 
 	if (!kids || !match_id)
 		return false;
-	for (i = 0; i < ARRAY_SIZE(kids->id); i++)
+	for (i = 0; i < 2; i++)
 		if (match(kids->id[i], match_id))
 			return true;
 	return false;
@@ -244,7 +257,7 @@ struct asymmetric_key_id *asymmetric_key_hex_to_key_id(const char *id)
 }
 
 /*
- * Match asymmetric keys by an exact match on an ID.
+ * Match asymmetric keys by an exact match on one of the first two IDs.
  */
 static bool asymmetric_key_cmp(const struct key *key,
 			       const struct key_match_data *match_data)
@@ -257,7 +270,7 @@ static bool asymmetric_key_cmp(const struct key *key,
 }
 
 /*
- * Match asymmetric keys by a partial match on an IDs.
+ * Match asymmetric keys by a partial match on one of the first two IDs.
  */
 static bool asymmetric_key_cmp_partial(const struct key *key,
 				       const struct key_match_data *match_data)
@@ -269,6 +282,18 @@ static bool asymmetric_key_cmp_partial(const struct key *key,
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
@@ -276,8 +301,9 @@ static bool asymmetric_key_cmp_partial(const struct key *key,
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
@@ -301,6 +327,11 @@ static int asymmetric_key_match_preparse(struct key_match_data *match_data)
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
index b531df2013c..9a87c34ed17 100644
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
index 84cefe3b358..822746836c8 100644
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
index 6d003096b5b..083405eb80c 100644
--- a/crypto/asymmetric_keys/x509_cert_parser.c
+++ b/crypto/asymmetric_keys/x509_cert_parser.c
@@ -441,8 +441,18 @@ int x509_note_issuer(void *context, size_t hdrlen,
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
index 3d45161b271..fe14cae115b 100644
--- a/crypto/asymmetric_keys/x509_public_key.c
+++ b/crypto/asymmetric_keys/x509_public_key.c
@@ -223,6 +223,13 @@ static int x509_key_preparse(struct key_preparsed_payload *prep)
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
@@ -239,8 +246,11 @@ static int x509_key_preparse(struct key_preparsed_payload *prep)
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
index 47accec68cb..c66dc1ad4d6 100644
--- a/include/crypto/public_key.h
+++ b/include/crypto/public_key.h
@@ -36,7 +36,7 @@ extern void public_key_free(struct public_key *key);
  * Public key cryptography signature data
  */
 struct public_key_signature {
-	struct asymmetric_key_id *auth_ids[2];
+	struct asymmetric_key_id *auth_ids[3];
 	u8 *s;			/* Signature */
 	u32 s_size;		/* Number of bytes in signature */
 	u8 *digest;
diff --git a/include/keys/asymmetric-type.h b/include/keys/asymmetric-type.h
index c432fdb8547..6c5d4963e15 100644
--- a/include/keys/asymmetric-type.h
+++ b/include/keys/asymmetric-type.h
@@ -53,7 +53,7 @@ struct asymmetric_key_id {
 };
 
 struct asymmetric_key_ids {
-	void		*id[2];
+	void		*id[3];
 };
 
 extern bool asymmetric_key_id_same(const struct asymmetric_key_id *kid1,
@@ -81,6 +81,7 @@ const struct public_key *asymmetric_key_public_key(const struct key *key)
 extern struct key *find_asymmetric_key(struct key *keyring,
 				       const struct asymmetric_key_id *id_0,
 				       const struct asymmetric_key_id *id_1,
+				       const struct asymmetric_key_id *id_2,
 				       bool partial);
 
 /*
-- 
2.30.2

