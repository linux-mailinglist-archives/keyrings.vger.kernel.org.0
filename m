Return-Path: <keyrings+bounces-3998-lists+keyrings=lfdr.de@vger.kernel.org>
Delivered-To: lists+keyrings@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sBfKNoGJgGnO9wIAu9opvQ
	(envelope-from <keyrings+bounces-3998-lists+keyrings=lfdr.de@vger.kernel.org>)
	for <lists+keyrings@lfdr.de>; Mon, 02 Feb 2026 12:24:49 +0100
X-Original-To: lists+keyrings@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 58A82CB957
	for <lists+keyrings@lfdr.de>; Mon, 02 Feb 2026 12:24:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9380530166E0
	for <lists+keyrings@lfdr.de>; Mon,  2 Feb 2026 11:24:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B59F5361DA6;
	Mon,  2 Feb 2026 11:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ibjKRDg2"
X-Original-To: keyrings@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46E8E34E754
	for <keyrings@vger.kernel.org>; Mon,  2 Feb 2026 11:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770031474; cv=none; b=CwvQrA/0p6YprKkFazXZ3oplwUhLJ+AvHkWNAEPEXFvculTQf9TynsQ9htEfDMcsmLDGfAlfmefReVSzF+bUGGnNblqpTLY8Vfm4ULuIhDWjGDp65YajDUgBOPcXLVm2jpBtbUTGcDA7n30pBLI+/iXTwDLXkWwj0lUeF8N047w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770031474; c=relaxed/simple;
	bh=8L90Oknk2mda/NzkFCqtblC6WbxIv+HHJAS6IWGSZFo=;
	h=From:In-Reply-To:References:To:Cc:Subject:MIME-Version:
	 Content-Type:Date:Message-ID; b=ESO8fiqRpkvukKorakgPpHOER94g21MAwD8KTBGNonGsfGE2n1tG6iCTLblEYTUiWNpCsrcFQZDXD9BRiQYYyZJRYzVjcZoCuBjNKzu2Fo/M329i2/Nyr/kO7jlaV9LEyosaGxkMszNr1Esu152yH8kkR0mlqg1g6Hg4FXOSZwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ibjKRDg2; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1770031472;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UzV2iBNzIU/BRlwmUxdISfa9l6MXfeB2Lfqd/3FlbFY=;
	b=ibjKRDg2b2GjnBg6AIpCRu8URQt4nGIizLbVLlud9mMK7CbZ86V40WpKKk9fq1Os/ZN6dR
	KUXGuw5uT7sy1iPE/DQsQpsGoE1xDCCTEYiDaEfdLMQ9hncFt5UBbeCe92sfEul1oN/zQP
	g8Yh/EmXhXgNTN+9QmbUw5qmNQQaVPg=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-513-48CcvRm8NMidaOZgI21XVg-1; Mon,
 02 Feb 2026 06:24:29 -0500
X-MC-Unique: 48CcvRm8NMidaOZgI21XVg-1
X-Mimecast-MFC-AGG-ID: 48CcvRm8NMidaOZgI21XVg_1770031467
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 47F9A19560B7;
	Mon,  2 Feb 2026 11:24:27 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.44.33.164])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id C2F6619560B2;
	Mon,  2 Feb 2026 11:24:23 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20251111154923.978181-3-petr.pavlu@suse.com>
References: <20251111154923.978181-3-petr.pavlu@suse.com> <20251111154923.978181-1-petr.pavlu@suse.com>
To: Petr Pavlu <petr.pavlu@suse.com>
Cc: dhowells@redhat.com, David Woodhouse <dwmw2@infradead.org>,
    Luis Chamberlain <mcgrof@kernel.org>,
    Daniel Gomez <da.gomez@kernel.org>,
    Sami Tolvanen <samitolvanen@google.com>,
    Aaron Tomlin <atomlin@atomlin.com>, keyrings@vger.kernel.org,
    linux-modules@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] sign-file, pkcs7: Honour the hash parameter to sign-file
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <2403736.1770031462.1@warthog.procyon.org.uk>
Content-Transfer-Encoding: quoted-printable
Date: Mon, 02 Feb 2026 11:24:22 +0000
Message-ID: <2403737.1770031462@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	HAS_ORG_HEADER(0.00)[];
	DKIM_TRACE(0.00)[redhat.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-3998-lists,keyrings=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dhowells@redhat.com,keyrings@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_FIVE(0.00)[6];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[keyrings];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 58A82CB957
X-Rspamd-Action: no action

Here's an alternative patch that will allow PKCS#7 with the hash specified=
 on
the command line, removing the SHA1 restriction.

David
---
sign-file, pkcs7: Honour the hash parameter to sign-file

Currently, the sign-file program rejects anything other than "sha1" as the
hash parameter if it is going to produce a PKCS#7 message-based signature
rather than a CMS message-based signature (though it then ignores this
argument and uses whatever is selected as the default which might not be
SHA1 and may actually reflect whatever is used to sign the X.509
certificate).

Fix sign-file to actually use the specified hash when producing a PKCS#7
message rather than just accepting the default.

Fixes: 283e8ba2dfde ("MODSIGN: Change from CMS to PKCS#7 signing if the op=
enssl is too old")
Signed-off-by: David Howells <dhowells@redhat.com>
cc: Lukas Wunner <lukas@wunner.de>
cc: Ignat Korchagin <ignat@cloudflare.com>
cc: Jarkko Sakkinen <jarkko@kernel.org>
cc: Stephan Mueller <smueller@chronox.de>
cc: Herbert Xu <herbert@gondor.apana.org.au>
cc: Eric Biggers <ebiggers@kernel.org>
cc: keyrings@vger.kernel.org
cc: linux-crypto@vger.kernel.org

diff --git a/scripts/sign-file.c b/scripts/sign-file.c
index 547b97097230..f0b7e5616b9a 100644
--- a/scripts/sign-file.c
+++ b/scripts/sign-file.c
@@ -56,6 +56,7 @@
 	defined(OPENSSL_NO_CMS)
 #define USE_PKCS7
 #endif
+#define USE_PKCS7
 #ifndef USE_PKCS7
 #include <openssl/cms.h>
 #else
@@ -289,14 +290,6 @@ int main(int argc, char **argv)
 		replace_orig =3D true;
 	}
 =

-#ifdef USE_PKCS7
-	if (strcmp(hash_algo, "sha1") !=3D 0) {
-		fprintf(stderr, "sign-file: %s only supports SHA1 signing\n",
-			OPENSSL_VERSION_TEXT);
-		exit(3);
-	}
-#endif
-
 	/* Open the module file */
 	bm =3D BIO_new_file(module_name, "rb");
 	ERR(!bm, "%s", module_name);
@@ -348,10 +341,17 @@ int main(int argc, char **argv)
 		    "CMS_final");
 =

 #else
-		pkcs7 =3D PKCS7_sign(x509, private_key, NULL, bm,
-				   PKCS7_NOCERTS | PKCS7_BINARY |
-				   PKCS7_DETACHED | use_signed_attrs);
+		unsigned int flags =3D
+			PKCS7_NOCERTS |
+			PKCS7_BINARY |
+			PKCS7_DETACHED |
+			use_signed_attrs;
+		pkcs7 =3D PKCS7_sign(NULL, NULL, NULL, bm, flags);
 		ERR(!pkcs7, "PKCS7_sign");
+
+		ERR(!PKCS7_sign_add_signer(pkcs7, x509, private_key, digest_algo, flags=
),
+		    "PKS7_sign_add_signer");
+		ERR(PKCS7_final(pkcs7, bm, flags) !=3D 1, "PKCS7_final");
 #endif
 =

 		if (save_sig) {


