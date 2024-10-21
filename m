Return-Path: <keyrings+bounces-2246-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 77B2F9A7302
	for <lists+keyrings@lfdr.de>; Mon, 21 Oct 2024 21:12:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A5EB11C21360
	for <lists+keyrings@lfdr.de>; Mon, 21 Oct 2024 19:12:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E48E21F942D;
	Mon, 21 Oct 2024 19:12:25 +0000 (UTC)
X-Original-To: keyrings@vger.kernel.org
Received: from bmailout1.hostsharing.net (bmailout1.hostsharing.net [83.223.95.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB2721F942E;
	Mon, 21 Oct 2024 19:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=83.223.95.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729537945; cv=none; b=awPwmb7vqhXFcIkSbpddd0T45uwHpQkgXRKHVpdR9rmgvxZKkJRHRuA5V115c7LNWl26urnKjfa5BmjAJ0L8wkMFWQPCvt7HT23lFH6HEhWCA2QSef8vcG98ORv0a5RZu1NKPNJbgqKi7MvaOey80vCsJSvLMpPPx3U2fa1q5Ig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729537945; c=relaxed/simple;
	bh=W4CBDWE56GnywA0quzwUSQCIZuWxa/4HKVPPm2BU000=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ervirGIGbaYZp/cCWueytlAWIScmFmH0dIU6P/3oPT+TRvL+tm+DKKMcS5haJDrw2YwR89pJcrAbdmLGRfrliOyPwGpfRbnnQUrI/zP0EoETgpEWAieYCDagX/MCxvkKC9xDeTz6yl8TfA4PAuw7xhhfPd7ovAFfiwJuFo1oYjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de; spf=none smtp.mailfrom=h08.hostsharing.net; arc=none smtp.client-ip=83.223.95.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=h08.hostsharing.net
Received: from h08.hostsharing.net (h08.hostsharing.net [83.223.95.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "*.hostsharing.net", Issuer "RapidSSL TLS RSA CA G1" (verified OK))
	by bmailout1.hostsharing.net (Postfix) with ESMTPS id 74C5330001184;
	Mon, 21 Oct 2024 21:02:57 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id 62E1A244BAF; Mon, 21 Oct 2024 21:02:57 +0200 (CEST)
Date: Mon, 21 Oct 2024 21:02:57 +0200
From: Lukas Wunner <lukas@wunner.de>
To: Klara Modin <klarasmodin@gmail.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Biggers <ebiggers@google.com>,
	Stefan Berger <stefanb@linux.ibm.com>,
	Vitaly Chikunov <vt@altlinux.org>,
	Tadeusz Struk <tstruk@gigaio.com>,
	David Howells <dhowells@redhat.com>,
	Andrew Zaborowski <andrew.zaborowski@intel.com>,
	Saulo Alessandre <saulo.alessandre@tse.jus.br>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Ignat Korchagin <ignat@cloudflare.com>,
	Marek Behun <kabel@kernel.org>,
	Varad Gautam <varadgautam@google.com>,
	Stephan Mueller <smueller@chronox.de>,
	Denis Kenzior <denkenz@gmail.com>, linux-crypto@vger.kernel.org,
	keyrings@vger.kernel.org, Mimi Zohar <zohar@linux.ibm.com>,
	Roberto Sassu <roberto.sassu@huawei.com>,
	Dmitry Kasatkin <dmitry.kasatkin@gmail.com>,
	Eric Snowberg <eric.snowberg@oracle.com>,
	linux-security-module@vger.kernel.org
Subject: Re: [PATCH v2 06/19] crypto: rsassa-pkcs1 - Migrate to sig_alg
 backend
Message-ID: <ZxalYZwH5UiGX5uj@wunner.de>
References: <cover.1725972333.git.lukas@wunner.de>
 <743afd4f298a3fad03e42ab46f913d1f51cb8b7c.1725972335.git.lukas@wunner.de>
 <2ed09a22-86c0-4cf0-8bda-ef804ccb3413@gmail.com>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2ed09a22-86c0-4cf0-8bda-ef804ccb3413@gmail.com>

On Mon, Oct 21, 2024 at 06:08:03PM +0200, Klara Modin wrote:
> On 2024-09-10 16:30, Lukas Wunner wrote:
> > A sig_alg backend has just been introduced with the intent of moving all
> > asymmetric sign/verify algorithms to it one by one.
> > 
> > Migrate the sign/verify operations from rsa-pkcs1pad.c to a separate
> > rsassa-pkcs1.c which uses the new backend.
[...]
> This commit (1e562deacecca1f1bec7d23da526904a1e87525e in next-20241021)
> seems to break connecting to wpa2-enterprise with iwd.

Thanks for the report and sorry for the breakage.

There is one pending fix for an issue I inadvertently introduced
with my sig_alg rework:

https://lore.kernel.org/r/ff7a28cddfc28e7a3fb8292c680510f35ec54391.1728898147.git.lukas@wunner.de/

However it fixes a different commit than the one you found through
bisection, so I suspect it won't fix the problem, though it would
still be good if you could test it.

There is a *second* issue I discovered last week.  I cooked up
a fix this morning, but haven't written a commit message yet.
The patch is included below and it could indeed solve the
problem because it fixes an issue introduced by the commit you
identified as culprit.  So if you could test the patch below as well
I'd be grateful.

I'll now look at the config and dmesg output you've provided.
Just wanted to get this e-mail out the door quickly to point you
to potential fixes.

Thanks!

Lukas

-- >8 --

diff --git a/crypto/asymmetric_keys/public_key.c b/crypto/asymmetric_keys/public_key.c
index c98c158..af19f9c 100644
--- a/crypto/asymmetric_keys/public_key.c
+++ b/crypto/asymmetric_keys/public_key.c
@@ -165,14 +165,22 @@ static int software_key_query(const struct kernel_pkey_params *params,
 {
 	struct crypto_akcipher *tfm;
 	struct public_key *pkey = params->key->payload.data[asym_crypto];
+	const char *hash_algo = params->hash_algo;
 	char alg_name[CRYPTO_MAX_ALG_NAME];
 	struct crypto_sig *sig;
 	u8 *key, *ptr;
 	int ret, len;
 	bool issig;
 
+	/*
+	 * Specifying hash_algo has historically been optional for pkcs1,
+	 * so use an arbitrary algorithm for backward compatibility.
+	 */
+	if (strcmp(params->encoding, "pkcs1") == 0 && !hash_algo)
+		hash_algo = "sha256";
+
 	ret = software_key_determine_akcipher(pkey, params->encoding,
-					      params->hash_algo, alg_name,
+					      hash_algo, alg_name,
 					      &issig, kernel_pkey_sign);
 	if (ret < 0)
 		return ret;

