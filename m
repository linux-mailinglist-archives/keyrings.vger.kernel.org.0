Return-Path: <keyrings+bounces-2208-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BDFD299FB5B
	for <lists+keyrings@lfdr.de>; Wed, 16 Oct 2024 00:23:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ECF081C23ACE
	for <lists+keyrings@lfdr.de>; Tue, 15 Oct 2024 22:23:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4841B1D63FF;
	Tue, 15 Oct 2024 22:22:58 +0000 (UTC)
X-Original-To: keyrings@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2E361B6CEE;
	Tue, 15 Oct 2024 22:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729030978; cv=none; b=Rhq3g33nbK9xaQFp81al25TtbyVJrn+vLeNGHBu7gkYjkw5xrD0rt0+KbXiNjz2fUmImbQkkYXoIZqpzFB5Zl2x14cs1XfUthIm2NDjmiPKDJnBjwsxQ5rkl68Im10PiESS40oJtY8ROU0OMVW5bmgNR0q81rV/bNkXNr1p6XmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729030978; c=relaxed/simple;
	bh=2wRRH19Q5QlS03qKf5gpjKuF/TBv9ogMqqsTV1Sb3DE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PXmWaXpXW1BQOH/nyJJt1AP0aP93yHtov4TbyCRXspUt1ZbZ4ccEP7PW+ujUqnhRszO9VffA0WJNMB3brXIJV+6lbc6kncxHlAoFQk2yT+T7g2Y5r8ixf5yJhy1UMDFqSJnPL3QdWn1YaRQCt+MNnidKR4EyS0H4Tlj90fKLJzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B9B72169C;
	Tue, 15 Oct 2024 15:23:25 -0700 (PDT)
Received: from u200865.usa.arm.com (U203867.austin.arm.com [10.118.30.35])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0FD1A3F71E;
	Tue, 15 Oct 2024 15:22:56 -0700 (PDT)
From: Jeremy Linton <jeremy.linton@arm.com>
To: linux-kernel@vger.kernel.org
Cc: akpm@linux-foundation.org,
	hch@lst.de,
	gregkh@linuxfoundation.org,
	graf@amazon.com,
	lukas@wunner.de,
	wufan@linux.microsoft.com,
	brauner@kernel.org,
	jsperbeck@google.com,
	ardb@kernel.org,
	linux-crypto@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	keyrings@vger.kernel.org,
	Jeremy Linton <jeremy.linton@arm.com>
Subject: [RFC 4/5] sign-file: Add -i option to sign initramfs images
Date: Tue, 15 Oct 2024 17:22:34 -0500
Message-ID: <20241015222235.71040-5-jeremy.linton@arm.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241015222235.71040-1-jeremy.linton@arm.com>
References: <20241015222235.71040-1-jeremy.linton@arm.com>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The initramfs signature is the mod signature with a differing string
to assure that cpio archives with a signed module at the end can never
be confused for a valid signed initramfs.

To support this, add a -i option to sign-file, which replaces the
"Module signature appended" string with "initrd signature appended",
which is the same length.

Signed-off-by: Jeremy Linton <jeremy.linton@arm.com>
---
 scripts/sign-file.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/scripts/sign-file.c b/scripts/sign-file.c
index 7070245edfc1..bbf97a57311a 100644
--- a/scripts/sign-file.c
+++ b/scripts/sign-file.c
@@ -75,6 +75,7 @@ struct module_signature {
 #define PKEY_ID_PKCS7 2
 
 static char magic_number[] = "~Module signature appended~\n";
+static char magic_initrd[] = "~initrd signature appended~\n";
 
 static __attribute__((noreturn))
 void format(void)
@@ -226,6 +227,7 @@ int main(int argc, char **argv)
 	bool save_sig = false, replace_orig;
 	bool sign_only = false;
 	bool raw_sig = false;
+	bool initrd_sig = false;
 	unsigned char buf[4096];
 	unsigned long module_size, sig_size;
 	unsigned int use_signed_attrs;
@@ -253,7 +255,7 @@ int main(int argc, char **argv)
 #endif
 
 	do {
-		opt = getopt(argc, argv, "sdpk");
+		opt = getopt(argc, argv, "sdpki");
 		switch (opt) {
 		case 's': raw_sig = true; break;
 		case 'p': save_sig = true; break;
@@ -261,6 +263,7 @@ int main(int argc, char **argv)
 #ifndef USE_PKCS7
 		case 'k': use_keyid = CMS_USE_KEYID; break;
 #endif
+		case 'i': initrd_sig = true; break;
 		case -1: break;
 		default: format();
 		}
@@ -398,7 +401,11 @@ int main(int argc, char **argv)
 	sig_size = BIO_number_written(bd) - module_size;
 	sig_info.sig_len = htonl(sig_size);
 	ERR(BIO_write(bd, &sig_info, sizeof(sig_info)) < 0, "%s", dest_name);
-	ERR(BIO_write(bd, magic_number, sizeof(magic_number) - 1) < 0, "%s", dest_name);
+	if (initrd_sig)
+		ERR(BIO_write(bd, magic_initrd, sizeof(magic_initrd) - 1) < 0, "%s", dest_name);
+	else
+		ERR(BIO_write(bd, magic_number, sizeof(magic_number) - 1) < 0, "%s", dest_name);
+
 
 	ERR(BIO_free(bd) != 1, "%s", dest_name);
 
-- 
2.46.0


