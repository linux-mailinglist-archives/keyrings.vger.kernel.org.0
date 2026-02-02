Return-Path: <keyrings+bounces-4000-lists+keyrings=lfdr.de@vger.kernel.org>
Delivered-To: lists+keyrings@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WDUdMh6PgGkl+wIAu9opvQ
	(envelope-from <keyrings+bounces-4000-lists+keyrings=lfdr.de@vger.kernel.org>)
	for <lists+keyrings@lfdr.de>; Mon, 02 Feb 2026 12:48:46 +0100
X-Original-To: lists+keyrings@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B9BECBE81
	for <lists+keyrings@lfdr.de>; Mon, 02 Feb 2026 12:48:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D82A030162AF
	for <lists+keyrings@lfdr.de>; Mon,  2 Feb 2026 11:48:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5DFC361677;
	Mon,  2 Feb 2026 11:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gIzy1OIU"
X-Original-To: keyrings@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49A4D35BDBF
	for <keyrings@vger.kernel.org>; Mon,  2 Feb 2026 11:48:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770032923; cv=none; b=DWI1QlqJu7Poj1nTj+eeTByFStgHhdI5OYG3DG53hSQu3mK2raJQvr+kkIC9inJAe2+ZtAnIQEq5sG4rJTaJmtnTAHx4hDgfGNFgwLYlje9/05LBHRD+kOJ03efzeTn2ndzqe+DR+8q5RsBOM3fr7PPy0RRKTMPNrRSM1c/N78o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770032923; c=relaxed/simple;
	bh=y0M27HId7NanN+KU4bmQbyiW7t9DmGAMrikFMXLb2jE=;
	h=From:In-Reply-To:References:To:Cc:Subject:MIME-Version:
	 Content-Type:Date:Message-ID; b=reOViZwABAt2rFDDLoIAxk5P5YDzdhXKKCnROpbFhgS5km7WZunSQPXCme27u9m3LAWXt3nKElD2UFepsO9brIk2gOxA+FBxEcUwEoOU2hHaM8IXyQNe/bdD6Pxa9HvE8RO91nBqhndJXQoxmQqonkUU3ZAoZIDS8PGVAr/r0sM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gIzy1OIU; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1770032921;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=48ZJbU9M0XqFSl5lmSxIUBwR/U0Gi0NzVcwFc4/F/LI=;
	b=gIzy1OIU3KEO5MXqKK/iCsfs/+WqNRK/SEwqg+NyLWrdQFXeTc8HQn8kPFsyLsXD2Zo/SP
	s+MxNo8YSkKlDweGs2TywTwGWJsSMQyRF4FnjnFzJNc07oGO2osyEK4ha7rZsBrGLvrGbq
	qPBcpIr70ABtt5C8r5YPIpgFgsjgF5Q=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-104-w39nM4vVP1ChqFApyokLrQ-1; Mon,
 02 Feb 2026 06:48:36 -0500
X-MC-Unique: w39nM4vVP1ChqFApyokLrQ-1
X-Mimecast-MFC-AGG-ID: w39nM4vVP1ChqFApyokLrQ_1770032914
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 08FED19560B7;
	Mon,  2 Feb 2026 11:48:33 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.44.33.164])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 932151800109;
	Mon,  2 Feb 2026 11:48:27 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <SN6PR02MB4157EE01F25375784EB7C507D49DA@SN6PR02MB4157.namprd02.prod.outlook.com>
References: <SN6PR02MB4157EE01F25375784EB7C507D49DA@SN6PR02MB4157.namprd02.prod.outlook.com> <SN6PR02MB415708C0A6E2EB1B5C7BBFB0D49CA@SN6PR02MB4157.namprd02.prod.outlook.com> <20260126142931.1940586-1-dhowells@redhat.com> <20260126142931.1940586-7-dhowells@redhat.com> <2315764.1769964282@warthog.procyon.org.uk>
To: Michael Kelley <mhklinux@outlook.com>
Cc: dhowells@redhat.com, Sami Tolvanen <samitolvanen@google.com>,
    Lukas Wunner <lukas@wunner.de>,
    Ignat Korchagin <ignat@cloudflare.com>,
    Jarkko Sakkinen <jarkko@kernel.org>,
    Herbert Xu <herbert@gondor.apana.org.au>,
    Eric Biggers <ebiggers@kernel.org>,
    Luis Chamberlain <mcgrof@kernel.org>,
    Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@kernel.org>,
    "Jason A . Donenfeld" <Jason@zx2c4.com>,
    Ard Biesheuvel <ardb@kernel.org>,
    Stephan Mueller <smueller@chronox.de>,
    "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
    "keyrings@vger.kernel.org" <keyrings@vger.kernel.org>,
    "linux-modules@vger.kernel.org" <linux-modules@vger.kernel.org>,
    "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v15 6/7] modsign: Enable ML-DSA module signing
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <2416272.1770032906.1@warthog.procyon.org.uk>
Content-Transfer-Encoding: quoted-printable
Date: Mon, 02 Feb 2026 11:48:26 +0000
Message-ID: <2416273.1770032906@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-4000-lists,keyrings=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_TO(0.00)[outlook.com];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	DKIM_TRACE(0.00)[redhat.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dhowells@redhat.com,keyrings@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[keyrings];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,outlook.com:email]
X-Rspamd-Queue-Id: 8B9BECBE81
X-Rspamd-Action: no action

Michael Kelley <mhklinux@outlook.com> wrote:

> Pardon my ignorance of the signing details, but I don't see an indicatio=
n
> of having selected PKCS#7 with SHA1 in my .config. What am I looking for=
?

Actually, if you have openssl >=3D 1.0.0 then it sign-file will be built t=
o use
CMS rather than PKCS#7, and will use the configured hash algo, so you can
ignore this.

> The symbols CMS_NO_SIGNING_TIME,

I can probably just not add that.

> EVP_PKEY_is_a()

I guess I can probably make this contingent on >=3D 3.0.0.

> and OPENSSL_VERSION_MAJOR don't exist in the include/openssl/* files for
> that old version.

I should probably use OPENSSL_VERSION_NUMBER instead - though we already u=
se
it for selecting #includes (I guess #if doesn't complain).

Do the attached changes work for you?

David
---
diff --git a/scripts/sign-file.c b/scripts/sign-file.c
index 547b97097230..78276b15ab23 100644
--- a/scripts/sign-file.c
+++ b/scripts/sign-file.c
@@ -27,7 +27,7 @@
 #include <openssl/evp.h>
 #include <openssl/pem.h>
 #include <openssl/err.h>
-#if OPENSSL_VERSION_MAJOR >=3D 3
+#if OPENSSL_VERSION_NUMBER >=3D 0x30000000L
 # define USE_PKCS11_PROVIDER
 # include <openssl/provider.h>
 # include <openssl/store.h>
@@ -323,18 +323,21 @@ int main(int argc, char **argv)
 			CMS_DETACHED |
 			CMS_STREAM  |
 			CMS_NOSMIMECAP |
+#ifdef CMS_NO_SIGNING_TIME
 			CMS_NO_SIGNING_TIME |
+#endif
 			use_keyid;
 =

-		if ((EVP_PKEY_is_a(private_key, "ML-DSA-44") ||
-		     EVP_PKEY_is_a(private_key, "ML-DSA-65") ||
-		     EVP_PKEY_is_a(private_key, "ML-DSA-87")) &&
-		    OPENSSL_VERSION_MAJOR < 4) {
+#if OPENSSL_VERSION_NUMBER >=3D 0x30000000L && OPENSSL_VERSION_NUMBER < 0=
x40000000L
+		if (EVP_PKEY_is_a(private_key, "ML-DSA-44") ||
+		    EVP_PKEY_is_a(private_key, "ML-DSA-65") ||
+		    EVP_PKEY_is_a(private_key, "ML-DSA-87")) {
 			 /* ML-DSA + CMS_NOATTR is not supported in openssl-3.5
 			  * and before.
 			  */
 			use_signed_attrs =3D 0;
 		}
+#endif
 =

 		flags |=3D use_signed_attrs;
 =


