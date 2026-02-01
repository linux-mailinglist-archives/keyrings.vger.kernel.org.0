Return-Path: <keyrings+bounces-3982-lists+keyrings=lfdr.de@vger.kernel.org>
Delivered-To: lists+keyrings@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EHedMK7OfmmAewIAu9opvQ
	(envelope-from <keyrings+bounces-3982-lists+keyrings=lfdr.de@vger.kernel.org>)
	for <lists+keyrings@lfdr.de>; Sun, 01 Feb 2026 04:55:26 +0100
X-Original-To: lists+keyrings@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 31CFAC4E0A
	for <lists+keyrings@lfdr.de>; Sun, 01 Feb 2026 04:55:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 612DE301649B
	for <lists+keyrings@lfdr.de>; Sun,  1 Feb 2026 03:55:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D14682C3252;
	Sun,  1 Feb 2026 03:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b="ukImCiPm"
X-Original-To: keyrings@vger.kernel.org
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com [67.231.145.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CFC013FEE
	for <keyrings@vger.kernel.org>; Sun,  1 Feb 2026 03:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.145.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769918122; cv=none; b=HTcOzKUZ61XoqH2bra0OuSz625g4vuA108ef7/rW7Ghe/LlqV3jRBIXeaKxyxLHJCVxPy/Y70j9OjgAlKH4cUZ0cSUgCnX91ZVQAOmqUGIkYBWLCMKvdG1Xl+ulgH0JempjKyzrpdVvZvGRHZbztTgXDb/J5m+4OUp95v8DiCwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769918122; c=relaxed/simple;
	bh=uBUXd7dYrPocVm6WvMDYdUkgoR2vf922tUEchxcUplk=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=I6Q/5KZ5CimhI4VjiNKC1YJ9i6raGTrXNzPEI+9v1GuVFK8EDwkvj8U7RY9cI27HE1WwZcV0eqquezjhFKYZF5F+mbMK1vl91h8BlOe0kNjYf+VMOIFVn8umhBHEamtHSrLrzTSZFtCZgwaGBO7yDN1xyyGOr1KLEqfazkc3INg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com; spf=pass smtp.mailfrom=meta.com; dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b=ukImCiPm; arc=none smtp.client-ip=67.231.145.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Received: from pps.filterd (m0044012.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60VNRaWt1351968
	for <keyrings@vger.kernel.org>; Sat, 31 Jan 2026 19:55:20 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=s2048-2025-q2; bh=uiZDsa/PELTpsTHnve
	H4WfK3/ySBJZX627YFriPyBbQ=; b=ukImCiPmSrhkGdzRQy6PnkN8ZmjNAgsFz7
	cli0dwObuCqKzCPQ5ZaqIkMbm8r7TxZQzFmddLACXSgVdV60ejNv1kbErjbjC5HV
	RwuvWexPh8daR2JAidhr76Bz68/QRt8Mf1mrUxxugMJwZeUSrjOWKmJlHy5rA2Gg
	wX01KP+3R8r+9HzGY67fZV1abejZtIoFtyr4JW6sm/pFC/8mjNqAYQWXTy+vRnGg
	hR09b26s3AlU5Mu5g/abm98YQMU6hwWPyrWQoy26nb5t/9yXkGq114PvoFt8F3t/
	Fkdbp2egLx5/L2WzAb9/6w9cn/XY+LaOx6BVBlcyAvDKsV61SLvg==
Received: from mail.thefacebook.com ([163.114.134.16])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4c1ga1dk1x-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <keyrings@vger.kernel.org>; Sat, 31 Jan 2026 19:55:19 -0800 (PST)
Received: from twshared13080.31.frc3.facebook.com (2620:10d:c085:108::4) by
 mail.thefacebook.com (2620:10d:c08b:78::2ac9) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.35; Sun, 1 Feb 2026 03:55:18 +0000
Received: by devbig010.atn3.facebook.com (Postfix, from userid 224791)
	id DE78677F296; Sat, 31 Jan 2026 19:55:03 -0800 (PST)
From: Daniel Hodges <hodgesd@meta.com>
To: David Howells <dhowells@redhat.com>, Lukas Wunner <lukas@wunner.de>,
        Ignat
 Korchagin <ignat@cloudflare.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S . Miller" <davem@davemloft.net>
CC: <keyrings@vger.kernel.org>, <linux-crypto@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Daniel Hodges <hodgesd@meta.com>
Subject: [PATCH] crypto: pkcs7 - use constant-time digest comparison
Date: Sat, 31 Jan 2026 19:55:03 -0800
Message-ID: <20260201035503.3945067-1-hodgesd@meta.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-FB-Internal: Safe
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAxMDAzMiBTYWx0ZWRfX47nE5DJFxwM8
 UmqUBq9Xd/k4b+ws8v+1nXwKUfpPgkN/eslpn0jYun9poHBUe+cUpBq7qKVsumi3tYYjQfZ3QPm
 pDWQSXUj8ML04jHDFGZkDgXhqBW3dNFEjKxNWf2OAO1iAJmOhu9Nxzk6Um/H1f1KjXqwliVfCAP
 iK4Iy9rvPY7gb5cPJY8LcxXeDfAX5eabBNtwl6CZktMgthEHexZkODLc4INVgut/XjnLj3LbykV
 +O5D/NzYsTocDp9g60QAjPDM98MlrX+iuqb1bI1vPMkHwAaUIc3eWEfpxDKYTIhlzQ33/fXcbGj
 b5XL+VizGKJspazyP37DPOZtjFQ9YmtDTExi/DLHEQH5MMpRoUUsXHyJ+E8dHKTpJ3Fhz8dd0oP
 ew9dugmRzJbVGjwqH+kOoOMODR1YxrHH8sMMdm80Qsaaa+ZKT8oi3x+5++ZDY+8jWQ5sCs7gJil
 P2nvIjKZW1fCxEHOjEg==
X-Proofpoint-ORIG-GUID: WnandX4JinHDaw1yBh27gIYjVKf6sR_c
X-Authority-Analysis: v=2.4 cv=TembdBQh c=1 sm=1 tr=0 ts=697ecea7 cx=c_pps
 a=CB4LiSf2rd0gKozIdrpkBw==:117 a=CB4LiSf2rd0gKozIdrpkBw==:17
 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VabnemYjAAAA:8 a=20KFwNOVAAAA:8
 a=ucDApK5nfv-_8VxgTh4A:9 a=gKebqoRLp9LExxC7YDUY:22
X-Proofpoint-GUID: WnandX4JinHDaw1yBh27gIYjVKf6sR_c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-01_01,2026-01-30_04,2025-10-01_01
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[meta.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[meta.com:s=s2048-2025-q2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-3982-lists,keyrings=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[meta.com:email,meta.com:dkim,meta.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hodgesd@meta.com,keyrings@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[meta.com:+];
	TAGGED_RCPT(0.00)[keyrings];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 31CFAC4E0A
X-Rspamd-Action: no action

Replace memcmp() with crypto_memneq() when comparing message digests
during PKCS#7 signature verification.

memcmp() is not constant-time and returns early on the first byte
mismatch. This creates a timing side-channel that could allow an
attacker to forge valid signatures by measuring verification time
and recovering the expected digest value byte-by-byte.

crypto_memneq() performs a constant-time comparison, eliminating
the timing oracle.

This affects all users of PKCS#7 signature verification including:
 - Kernel module signature verification (CONFIG_MODULE_SIG)
 - Firmware signature verification
 - Kexec image signature verification
 - IMA appraisal

Fixes: 9f0d33146e2a ("PKCS#7: Digest the data in a signed-data message")
Signed-off-by: Daniel Hodges <hodgesd@meta.com>
---
 crypto/asymmetric_keys/pkcs7_verify.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/crypto/asymmetric_keys/pkcs7_verify.c b/crypto/asymmetric_ke=
ys/pkcs7_verify.c
index 6d6475e3a9bf..c69cd240bd7e 100644
--- a/crypto/asymmetric_keys/pkcs7_verify.c
+++ b/crypto/asymmetric_keys/pkcs7_verify.c
@@ -4,20 +4,21 @@
  * Copyright (C) 2012 Red Hat, Inc. All Rights Reserved.
  * Written by David Howells (dhowells@redhat.com)
  */
=20
 #define pr_fmt(fmt) "PKCS7: "fmt
 #include <linux/kernel.h>
 #include <linux/export.h>
 #include <linux/slab.h>
 #include <linux/err.h>
 #include <linux/asn1.h>
+#include <crypto/utils.h>
 #include <crypto/hash.h>
 #include <crypto/hash_info.h>
 #include <crypto/public_key.h>
 #include "pkcs7_parser.h"
=20
 /*
  * Digest the relevant parts of the PKCS#7 data
  */
 static int pkcs7_digest(struct pkcs7_message *pkcs7,
 			struct pkcs7_signed_info *sinfo)
@@ -78,22 +79,22 @@ static int pkcs7_digest(struct pkcs7_message *pkcs7,
 			goto error;
 		}
=20
 		if (sinfo->msgdigest_len !=3D sig->digest_size) {
 			pr_warn("Sig %u: Invalid digest size (%u)\n",
 				sinfo->index, sinfo->msgdigest_len);
 			ret =3D -EBADMSG;
 			goto error;
 		}
=20
-		if (memcmp(sig->digest, sinfo->msgdigest,
-			   sinfo->msgdigest_len) !=3D 0) {
+		if (crypto_memneq(sig->digest, sinfo->msgdigest,
+				  sinfo->msgdigest_len)) {
 			pr_warn("Sig %u: Message digest doesn't match\n",
 				sinfo->index);
 			ret =3D -EKEYREJECTED;
 			goto error;
 		}
=20
 		/* We then calculate anew, using the authenticated attributes
 		 * as the contents of the digest instead.  Note that we need to
 		 * convert the attributes from a CONT.0 into a SET before we
 		 * hash it.
--=20
2.47.3


