Return-Path: <keyrings+bounces-3123-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 84284BAAAFB
	for <lists+keyrings@lfdr.de>; Tue, 30 Sep 2025 00:29:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 312713C50D3
	for <lists+keyrings@lfdr.de>; Mon, 29 Sep 2025 22:29:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A13B7221275;
	Mon, 29 Sep 2025 22:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arista.com header.i=@arista.com header.b="Zpw2lhzx"
X-Original-To: keyrings@vger.kernel.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73494433AD
	for <keyrings@vger.kernel.org>; Mon, 29 Sep 2025 22:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759184938; cv=none; b=Iw1t5MYP4ey1C7LpyPisln6aMij+gBQuIjmdYT7XDnOxBpT1HoCnGAsyV5mjWXasNj/rykYJHouJ0C1+yL9UcUEKtTt8KlLR+zsARIQ16auXHLMBKJRCSfx5f9sr73SyTFppl1H14uBedLX4igw6qKWbQTB9xhcDG0ms0TAhVwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759184938; c=relaxed/simple;
	bh=dK90VPlOhr5bqMA4TRaGYyTGuVECc6g3haiuK1xgONk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SP0HiGXWqi0OJ38ftB9cWYRTQzeufMZmuHtTJvhazK2XR9PTrzo/YlMPFuGqrK6O2kXCbvpXUuPcXQln1vggY8BjNVpvBVQV4DUMtE6tSb6BqrkW+77NUE938j+MfCM6rhTi3li9WFmlsjhIffo5ufEp94EjPgClqoXeK548+TE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=arista.com; spf=pass smtp.mailfrom=arista.com; dkim=pass (2048-bit key) header.d=arista.com header.i=@arista.com header.b=Zpw2lhzx; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=arista.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arista.com
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-7835321bc98so2301518b3a.2
        for <keyrings@vger.kernel.org>; Mon, 29 Sep 2025 15:28:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arista.com; s=google; t=1759184935; x=1759789735; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xREsacjqu6xDqjsqMjhayVf5+sVvuh3AjVx8GvkxbX0=;
        b=Zpw2lhzxgCpueZumxjZynOHOLqwaH0tOp7jTNNVXLjxMEFnbzfC9/QTsEB95VxveLj
         zwW3AcB3MepTtBmimmWrEhNxqgLgDhBw4viJSkPSzTG0fFFEzts8yHOvDuSlCS74DjDI
         Uxr4cqj5b+wVH44ZgxkEQd5JxI9iBO+Uwm47LTrsa+AvSx0/4bkrMiPxQo/z0V1Mlrdd
         Yr6ZAjio7QIw6CzbAiKvmyeaDVMyMciQ7gJa/pbFTxyis+IEPaz7rXKC8pOCt6ezM/hS
         llFjTx0twVfTWyBk65dX9esUUZk8Kysz/VagL8fj67yAmKerSenjjSbI1fnWbUkCV1MS
         CBww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759184935; x=1759789735;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xREsacjqu6xDqjsqMjhayVf5+sVvuh3AjVx8GvkxbX0=;
        b=COBA2EuPFlHJPVCENQK6vU9W0vI0mzc6ve4xuUjPbFv3SB4RhOYOcyMbEmnaUXGED3
         hJRlNTqr/nTKeFKkRzI0k4srox6pqvvedLPX3EZc3VPJH7INEgkNfIynMSSSTT2wGwJm
         0tDB+gdjZmGb4DCJvejnuRXbllPbT0hy86xnU9L745PL1KPsoWN0Q9Zsn1cghpeL+DYN
         j1s/YgZ2D4YC7KBhc021n1JRx9pxXoTsDVLm/01oQgOgvmD8xq7ovRX+F12ZOhh4+qkQ
         jpV3wV7Osr/gkFnZKcsn6ogn+F2g7tLD7IZR61QrWy6IOEUhFoia2gRQP/ZoUwUrdWUO
         SPJw==
X-Gm-Message-State: AOJu0Yw8vpLCQWgFfCYjI9pw33lTvlJpVPOcpUlIeA8ZVmk6mG0tc/iW
	mc99vtFGJ26FaUXxWEMpXEfxEXojdMk84qW4Y6GLnoTs68iC1v6E2T1fYI3+NUdxILcaNPF734d
	SmoEgAw==
X-Gm-Gg: ASbGncvL6o9RWUuHMN0SSdTdcvtbepT4YBwK5O1f2P22qHewqOKL/qpkBOUX79U2o6z
	Bd3xLelxqafuCMgJnRVMEg9TVMJGb4VWP2/9M0xN0kgrnVCopLTzQv5ViNDsSz2h2BEzmkFqig2
	SE+cz9A9P6ReV0ST9l3MJhkBXeCuVkg8B15kLyc6ckl3rTSDnZ5GehoTxR7FasAb/NRASkiCTMh
	Ot5gSpZEJb1Ez28bEJleTXkTRcPYgdqrnexANzCSY0Q3s2rT5sZmIlzvv4l824oJ2IIvcVFlOut
	OJ/j3XlE9qZInRe3h/VjcbIQJ3YYlfElB5FSJ7cA5O6llkVi6S3QXP/lZHMbrufITmcLmnXf9IQ
	6GrjXoWetwlUanIwUJQ2UcPeeyG1+fsaANDqTV47NGsNzYTMWMf4vOsYrMLjbFaNec5hmSYDSbA
	0=
X-Google-Smtp-Source: AGHT+IGxSwKxc0V9oPeuQKQ+P3I1EIijA2hWzCj+7FOY1vVfafkWTdnL+u5V6EqdN4+gGIiIrVeK4w==
X-Received: by 2002:a05:6a00:3a18:b0:77f:143d:eff2 with SMTP id d2e1a72fcca58-780fcee097emr18020302b3a.28.1759184935386;
        Mon, 29 Sep 2025 15:28:55 -0700 (PDT)
Received: from dannyhu-updateImaSupport.sjc.aristanetworks.com ([74.123.28.18])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-78102c0700dsm11835673b3a.84.2025.09.29.15.28.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Sep 2025 15:28:55 -0700 (PDT)
From: Danny Hu <dannyhu@arista.com>
To: keyrings@vger.kernel.org
Cc: dhowells@redhat.com,
	dwmw2@infradead.org,
	Danny Hu <dannyhu@arista.com>
Subject: [PATCH] sign-file: Add option to include certificate in sign-file tool
Date: Mon, 29 Sep 2025 15:28:52 -0700
Message-ID: <20250929222852.116986-1-dannyhu@arista.com>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The sign-file tool currently generates a signature that does not include
the signing certificate. This requires that the public key used for
verification be loaded directly into the `.ima` keyring.

This approach prevents the use of certificate hierarchies, where a file
is signed by an intermediate key that chains up to a trusted root key in
the keyring.

This patch adds a `-i` flag to the sign-file tool to embed the signing
certificate directly into the signature file. This allows the kernel's
Integrity Measurement Architecture (IMA) to perform a full path
validation on the certificate chain, enabling more flexible and scalable
key management for IMA appraisal.

Signed-off-by: Danny Hu <dannyhu@arista.com>
---
 scripts/sign-file.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/scripts/sign-file.c b/scripts/sign-file.c
index 7070245edfc1..59a76bca6683 100644
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
@@ -228,14 +228,16 @@ int main(int argc, char **argv)
 	bool raw_sig = false;
 	unsigned char buf[4096];
 	unsigned long module_size, sig_size;
-	unsigned int use_signed_attrs;
+	unsigned int use_signed_attrs, include_cert;
 	const EVP_MD *digest_algo;
 	EVP_PKEY *private_key;
 #ifndef USE_PKCS7
 	CMS_ContentInfo *cms = NULL;
 	unsigned int use_keyid = 0;
+	include_cert = CMS_NOCERTS;
 #else
 	PKCS7 *pkcs7 = NULL;
+	include_cert = PKCS7_NOCERTS;
 #endif
 	X509 *x509;
 	BIO *bd, *bm;
@@ -253,11 +255,12 @@ int main(int argc, char **argv)
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


