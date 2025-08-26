Return-Path: <keyrings+bounces-2986-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 370F9B372BD
	for <lists+keyrings@lfdr.de>; Tue, 26 Aug 2025 20:58:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5E2DE7A1CE5
	for <lists+keyrings@lfdr.de>; Tue, 26 Aug 2025 18:57:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 986D92F3603;
	Tue, 26 Aug 2025 18:58:43 +0000 (UTC)
X-Original-To: keyrings@vger.kernel.org
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BDC89476;
	Tue, 26 Aug 2025 18:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756234723; cv=none; b=aBKOfLwc3m7C0ITJ+hVJOsXMOtwiKUxZiqeTul/Gkljld4O4AI5dta4JTtVxikEJhYw/6ANby9iNB/khVAEtlE4T4B70EbDunHP6bY0YnUiD40PZzEKZCAEave0wyYRdR2/Ay27yt8iFYF0A/vk73NKkkOafNPRHj5b4lk/wAUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756234723; c=relaxed/simple;
	bh=5RnesvrqWbneWkaDrRLIKJSGQ+BJxqPzKrfrwi9jjRk=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=DnOadBCiz52VIo2+RGlVL8aq3l3yHlDedHxAR+lQr8FjZ7UFkUW5+MubGg6+vb6wq2rryKaybQFNoJ/lNrDH5dBVuCy53YgHg3ML3YzoLnbEAH9iAvyrQ6Mo9mZ+chw38csPK9bsABzXkRcPQUQUfsGr4zwOOiMzvRRaq3XYw+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kzalloc.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kzalloc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-b49d7a11c0aso557364a12.0;
        Tue, 26 Aug 2025 11:58:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756234721; x=1756839521;
        h=content-transfer-encoding:organization:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+GnJSs7z1NxEWE4UhegoOllTPFbqENM36ABV1n4d6AA=;
        b=XqicINBLgOC0qrQOX2OOo2hRIf/uTmdTua0a93K3aoEAet2GmYFekqMUUQhTxBbwUA
         doFxe2aOimQUjM55WV1mJ5feBTFigY4zOU+EQWJUG6InmrNFczBNNd6H/bGIse28hR4k
         cg9WXqCR268/4aUYEzas9VYWUTfe31l+M/fNl8SF0nRam266FO4dA/AYFcXh7MMZNHlJ
         EEmkYaVT5o+ocLX2Zy4t/UGfMA6wehUtC9hRAy+vw6P+MBsta9s8/brlJiysOdEtZxhT
         RkNIkBjP+rFZ0sxyzJkJxn+kL6zyrUjbwRwKhmb0Y3rEv/J2ZdqIDJ+WyJIec49nWn2o
         tg5w==
X-Forwarded-Encrypted: i=1; AJvYcCU2PgKM1s06A4Le4BeF5yjoJOp98ecEEe5KMIiQFIoCsSidEnPenMRGYBa662B3ZAuRzfivtkyh8g==@vger.kernel.org, AJvYcCX62yKnz4G9HFWrTNgRgpMv9Vrivc7DGidS6fS1NZyDqnFDZghLaTjFdrApn7XVUjC6xi9etavT5sTAggmI@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0AYruFKOAXX+Y/FXsBqwsYzIasGfi14nojiVkq/H0rK9hXvdj
	oDF1HQwyACj4oNl5I+roBL2F2G/xqJxnyVjfLnwlx/NOw261ZX5Ny2DQ
X-Gm-Gg: ASbGncsHWZxO2Ybeja0aG9i51w1ntsurAOQqlAYz3nGJQkjnGxyIBERgTKX/EC3/7Vw
	S7dMKf+p5rDVY3Fr0heoEgfmDn84nsy6ihQdkDp4yz7TsjilOta0PResZSDoDVW7mvchj583skj
	lJ5zMEWDMKmUtHgiedXi9v94NerMBBjGIzi6st3EPEbOLzCnzWaX7PijbFl74pqOTQPUrCLFIYw
	Vdw4tQT/KXoQa6GSWipNubq47ukGnUeaW2FHyTT71iXF2tj6mEDbU9mAQwUnJVFkWzcrb0V91p5
	I5i5PhM3BMUv8PoWgdDn/gsYU6nmy4SlQmURpsCKcxih1DaO9t4ZEiCRZLTqwB8Tc2Ku9P2vvUd
	yceGu715/bcEVG2+XUe7+xvzv8FdZ2QO4uV2VsxbWHf5qTRNj5UlInhIqr2VM8ChaBsnHdbRupR
	5ez+Ki2D6o/fkSvFPcyfzqxLxDgUde
X-Google-Smtp-Source: AGHT+IGlPCWJla+VIK78TyPqI8GO2lbDHDihFAu9ZjqEGJkUg/QO6oHFPtoau7+xY/JgaBWRWmByJA==
X-Received: by 2002:a17:90b:1b44:b0:325:5998:751d with SMTP id 98e67ed59e1d1-3255998780amr8209025a91.5.1756234721220;
        Tue, 26 Aug 2025 11:58:41 -0700 (PDT)
Received: from [192.168.50.136] ([118.32.98.101])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3276b07f38dsm203072a91.19.2025.08.26.11.58.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Aug 2025 11:58:40 -0700 (PDT)
Message-ID: <a40e660e-5a45-420a-8d37-51324242ab9b@kzalloc.com>
Date: Wed, 27 Aug 2025 03:58:35 +0900
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>,
 Daniel Gomez <da.gomez@kernel.org>,
 "Sami Tolvanen <samitolvanen@google.com> David Howells"
 <dhowells@redhat.com>, David Woodhouse <dwmw2@infradead.org>
Cc: linux-modules@vger.kernel.org, keyrings@vger.kernel.org,
 linux-kernel@vger.kernel.org
From: Yunseong Kim <ysk@kzalloc.com>
Subject: [Question] Non-usage of PKEY_ID_PGP and PKEY_ID_X509 in module
 signing
Organization: kzalloc
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

I would like to inquire about the purpose of the PKEY_ID_PGP and
PKEY_ID_X509 identifiers defined in include/linux/module_signature.h.

The enum pkey_id_type is defined as follows:

 enum pkey_id_type {
     PKEY_ID_PGP,        /* OpenPGP generated key ID */
     PKEY_ID_X509,       /* X.509 arbitrary subjectKeyIdentifier */
     PKEY_ID_PKCS7,      /* Signature in PKCS#7 message */
 };

While examining the module signing and verification process, it appears
that the current implementation strictly assumes the use of PKCS#7, making
PKEY_ID_PGP and PKEY_ID_X509 seem unused in this context.

I observed the following:

1. In scripts/sign-file.c, the module_signature structure is explicitly
initialized assuming PKCS#7:

 /* Key identifier type [PKEY_ID_PKCS7] */
 struct module_signature sig_info = { .id_type = PKEY_ID_PKCS7 };

2. In kernel/module_signature.c, the verification function mod_check_sig()
strictly enforces this type and rejects others:

 int mod_check_sig(const struct module_signature *ms, size_t file_len,
           const char *name)
 {
     if (be32_to_cpu(ms->sig_len) >= file_len - sizeof(*ms))
         return -EBADMSG;
 
     if (ms->id_type != PKEY_ID_PKCS7) {
         pr_err("%s: not signed with expected PKCS#7 message\n",
                name);
         return -ENOPKG;
     }
     // ...
 }


3. Furthermore, I noticed that certs/extract-cert.c only defines
   PKEY_ID_PKCS7 locally, seemingly without utilizing the definitions from
   the header for the other types:

#define PKEY_ID_PKCS7 2

Given that the module signature infrastructure seems hardcoded to use
PKCS#7, could anyone clarify if PKEY_ID_PGP and PKEY_ID_X509 are used
elsewhere in the kernel? Are they perhaps placeholders for future
implementations or remnants of past ones?

If they are indeed unused and there are no plans to support them, would
a patch to clean up these unused enum values be welcome? Or is there
another reason for keeping them?

Thank you for your time and clarification.


Best regards,
Yunseong Kim

