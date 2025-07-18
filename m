Return-Path: <keyrings+bounces-2926-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DA267B0AC9F
	for <lists+keyrings@lfdr.de>; Sat, 19 Jul 2025 01:46:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1D3A15A50ED
	for <lists+keyrings@lfdr.de>; Fri, 18 Jul 2025 23:46:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DB4A49641;
	Fri, 18 Jul 2025 23:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arista.com header.i=@arista.com header.b="SxbZO/qx"
X-Original-To: keyrings@vger.kernel.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2C5479CD
	for <keyrings@vger.kernel.org>; Fri, 18 Jul 2025 23:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752882376; cv=none; b=trMYtW3sO+THL03Nghfntvak4C0/KnTVk/C2szZG+GilFF8wGOvjRW3VBivsDSh21zbMjTrNBfojAcsQPjmqdqdwfZXmffBdCsDJraLnDZIewT46rFlr+rRCu5yna6vroH+R6Fe5rmFqPxOBs9bgm6FAc18O8CBIIczCJG9xrEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752882376; c=relaxed/simple;
	bh=Onkr0OH2V6F7j2w/NZSWwOradfAwGcHWsUtwhgHm428=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rjz1/aHkUE51qaPsSiTBmwix4GS/mZxqaIHUh9Cm3u3m9oS7xDm3UQLJvXm2fRbmakAf9epN7vZ12hNMvaZxn7o6Dp/TMx2AJclVkFrv0/DWM9jnfnCOQmLuhI/+LXljcAlN9GBvfYBK2ozmLIbvHAAE2zKI+NzwB6nrU6d1exw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=arista.com; spf=pass smtp.mailfrom=arista.com; dkim=pass (2048-bit key) header.d=arista.com header.i=@arista.com header.b=SxbZO/qx; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=arista.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arista.com
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-749068b9b63so1889413b3a.0
        for <keyrings@vger.kernel.org>; Fri, 18 Jul 2025 16:46:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arista.com; s=google; t=1752882374; x=1753487174; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tX9FTXz6v+4nlcFIDHUki4atSIabawXY5iL71TYu2MU=;
        b=SxbZO/qxHWFs1ZHMTIaVW3a+bkaGP7Elf9XvHQMaj6xOmwkDNuKxss3fMMNJIRMEPI
         yVmKrtRylzrFxBD7VGp2wyxHm4B4QD4//LNGY+ckrFZcBHheGZZnNyJu4qesxU8I9vML
         eeic+dcC70JzeBrRm/i+vEtQVkb+5JlMZm1gz5ML13G1sehs8MFluhZ5d++nEAd3ZN9m
         KahylUfPx06gHzS15/OAj9ibmLDtNjX6+d+cNgu19Hg6aQwzTwaAaY16Z6NtQSsREiwW
         6oWj9R1VtOh+a57VjIxC4E+kqSeuRIiuVLE5o3B8n2GO7S9JklcB4/AGyRSr3ZYoi0zm
         Ud6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752882374; x=1753487174;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tX9FTXz6v+4nlcFIDHUki4atSIabawXY5iL71TYu2MU=;
        b=vbQ2O0Z5Y+flHbqgqe/kaUmDC6Y5stffiZRXBYvwGIqdWLE9akKl1nQOzdDlQfmdXD
         +SwqT2BHXsILOrdDKqtOcGinLLpnYHQcg0kMyFM0QspOOCKdd9ujL/Vc1D23HsXAfIP5
         vkqDAkBQPTtvQo2T8nDSzTIUgAcBX2LWdCvhq+93P1Dc9p+ND54N7P4MUMjLp2pnbruW
         8atH8TSFKCRlsUVwGOtsnDTGuxEpr09zboMSPWuDbgF6/xs12JpcDCGz2RXkNx1oPjpB
         A5N/1Xl4P359b+xaQWZnDNJmvHU7evQ0Rc3Di2495BWAI3wzoqOszzFv5/xUHNRIoidx
         9vIQ==
X-Gm-Message-State: AOJu0YzZUsCpCkMAY52x70oCb0dEKVohlf4E67FrsmczeMmCuFZ2Vqwm
	1+XNtqUju7TJ0l9NJODKCI9DbKVkyvS62pW1sNhPfpLTVoTuMPmDqOeM/jmQjdylGl8NCQeiUU8
	QAm2O/H8B
X-Gm-Gg: ASbGncvfG5zPVrd+bp3M5XuJ3inkP0J2quVLYtEh5XZ+JKP8mrUF6mtKMwSH0lihEPA
	bKQCCfmMev/337x1Aw6jJHFvgy22zknJ05mi5lsRV118JezuwCgH3kpLjYaw5UjvgCl3Tv0gaFw
	ZiY32ICjnw3kcYcyATP9qpC5BQyuCEaQHKrawVI3BcI5syE70AJFZHdn4VTfTkfwKE5lFEhmDOG
	I2oejqWQrWwoTQ3iM5KWMxDBBZBrfB9fhlun1uJVrkIpmnPHBeEJxo5PrwXNyg9Kwx/aCkksFYa
	KRqHDWvCxrI/9Pp3SgmZesGT3gAZbN8y3ctjnqiPKrUGJYJkRIRWC8HrYhDEgcPCndQpmsOd/Rm
	SWoCodHfXdVgehytLDHN/rPcPI9f0eFMXzcxYioUlKLvrffAst1It09+zvseOBrtwpnU=
X-Google-Smtp-Source: AGHT+IEHsNj9UHU+PPRo5FPoqnHxisUszzui4y/K88IuEVxDKgyvYEu3CCAHXFa7pCCDtxUmd9avRQ==
X-Received: by 2002:a05:6a00:1410:b0:748:f41d:69d2 with SMTP id d2e1a72fcca58-756e7acfa48mr19536348b3a.4.1752882373563;
        Fri, 18 Jul 2025 16:46:13 -0700 (PDT)
Received: from dannyhu-keyringsMachineTpm.sjc.aristanetworks.com ([74.123.28.15])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-759c84e26fbsm1861635b3a.27.2025.07.18.16.46.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 16:46:13 -0700 (PDT)
From: Danny Hu <dannyhu@arista.com>
To: keyrings@vger.kernel.org
Cc: dhowells@redhat.com,
	dwmw2@infradead.org,
	Danny Hu <dannyhu@arista.com>
Subject: [PATCH 2/2] sign-file: Extend sign-file tool to allow for certificate to be embedded in the signature
Date: Fri, 18 Jul 2025 16:45:41 -0700
Message-ID: <20250718234541.3087-2-dannyhu@arista.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250718234541.3087-1-dannyhu@arista.com>
References: <20250718234541.3087-1-dannyhu@arista.com>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add an optional `-i` flag to the sign-file tool provides the ability to
embed the signing certificate in the signature generated by the
sign-file tool.

This change is crucial for enabling the use of certificate hierarchies
(chain of trust) within the kernel's Integrity Measurement Architecture
(IMA). Critically, IMA can appraise kernel binaries and initrds signed by
the sign-file tool.

Without this change, kernel binaries and initrds are limited to being
signed directly by keys present in the `.ima` keyring. The kernel
already has the facilities to extract and process embedded certificates
so we can leverage this by embedding the signing certificate in appended
signature to provide the kernel the information to perform full path
validation in the certificate hierarchy.

This enhancement improves the flexibility and scalability of IMA
deployments. Organizations can now leverage their existing Public Key
Infrastructure by signing kernel modules, executables, or other measured
files with certificates issued by intermediate CAs within their trusted
hierarchy, rather than requiring direct root CA signing for every single
appraised file.

Signed-off-by: Danny Hu <dannyhu@arista.com>
---
 scripts/sign-file.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/scripts/sign-file.c b/scripts/sign-file.c
index 0fa9b75f1c77..83767dc2a720 100644
--- a/scripts/sign-file.c
+++ b/scripts/sign-file.c
@@ -80,7 +80,7 @@ static __attribute__((noreturn))
 void format(void)
 {
 	fprintf(stderr,
-		"Usage: scripts/sign-file [-dp] <hash algo> <key> <x509> <module> [<dest>]\n");
+		"Usage: scripts/sign-file [-dpi] <hash algo> <key> <x509> <module> [<dest>]\n");
 	fprintf(stderr,
 		"       scripts/sign-file -s <raw sig> <hash algo> <x509> <module> [<dest>]\n");
 	exit(2);
@@ -228,7 +228,7 @@ int main(int argc, char **argv)
 	bool raw_sig = false;
 	unsigned char buf[4096];
 	unsigned long module_size, sig_size;
-	unsigned int use_signed_attrs;
+	unsigned int use_signed_attrs, include_cert;
 	const EVP_MD *digest_algo;
 	EVP_PKEY *private_key = NULL;
 #ifndef USE_PKCS7
@@ -248,16 +248,19 @@ int main(int argc, char **argv)
 
 #ifndef USE_PKCS7
 	use_signed_attrs = CMS_NOATTR;
+	include_cert = CMS_NOCERTS;
 #else
 	use_signed_attrs = PKCS7_NOATTR;
+	include_cert = PKCS7_NOCERTS;
 #endif
 
 	do {
-		opt = getopt(argc, argv, "sdpk");
+		opt = getopt(argc, argv, "sdpki");
 		switch (opt) {
 		case 's': raw_sig = true; break;
 		case 'p': save_sig = true; break;
 		case 'd': sign_only = true; save_sig = true; break;
+		case 'i': include_cert = 0; break;
 #ifndef USE_PKCS7
 		case 'k': use_keyid = CMS_USE_KEYID; break;
 #endif
@@ -317,21 +320,21 @@ int main(int argc, char **argv)
 #ifndef USE_PKCS7
 		/* Load the signature message from the digest buffer. */
 		cms = CMS_sign(NULL, NULL, NULL, NULL,
-			       CMS_NOCERTS | CMS_PARTIAL | CMS_BINARY |
+			       include_cert | CMS_PARTIAL | CMS_BINARY |
 			       CMS_DETACHED | CMS_STREAM);
 		ERR(!cms, "CMS_sign");
 
 		ERR(!CMS_add1_signer(cms, x509, private_key, digest_algo,
-				     CMS_NOCERTS | CMS_BINARY |
+				     include_cert | CMS_BINARY |
 				     CMS_NOSMIMECAP | use_keyid |
 				     use_signed_attrs),
 		    "CMS_add1_signer");
-		ERR(CMS_final(cms, bm, NULL, CMS_NOCERTS | CMS_BINARY) != 1,
+		ERR(CMS_final(cms, bm, NULL, include_cert | CMS_BINARY) != 1,
 		    "CMS_final");
 
 #else
 		pkcs7 = PKCS7_sign(x509, private_key, NULL, bm,
-				   PKCS7_NOCERTS | PKCS7_BINARY |
+				   include_cert | PKCS7_BINARY |
 				   PKCS7_DETACHED | use_signed_attrs);
 		ERR(!pkcs7, "PKCS7_sign");
 #endif
-- 
2.47.0


