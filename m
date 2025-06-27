Return-Path: <keyrings+bounces-2865-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0659FAEB985
	for <lists+keyrings@lfdr.de>; Fri, 27 Jun 2025 16:12:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5F1EA5652CF
	for <lists+keyrings@lfdr.de>; Fri, 27 Jun 2025 14:12:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0E092E06DD;
	Fri, 27 Jun 2025 14:12:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mPGjOoYm"
X-Original-To: keyrings@vger.kernel.org
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5523A4C8E;
	Fri, 27 Jun 2025 14:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751033538; cv=none; b=mjU5oKbvBgBVQKGmB8h+/WxAnFCVA+SASekxOiSFpzBRE/SYYsQeemHkTEKWlnZD2883h9OH8cxH42UX+Az5Tv+j+u+fi6R56HkSwaV0REUcS+KhKVAMvgmNK3Gis0aC1zgv552UgHJXp5sp9ScSTFvuMfhS11/iwIl3Wd6m3OU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751033538; c=relaxed/simple;
	bh=hVxsob2gMzK+yoGT2YTNMVPDuNbFcM9jirOwFff9BWY=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=rp72CX6Yc3jjC3Ats8Dk5lbiREM1DNWEJwgVHgjduPp56VdB0420sa9mltowvS+rB23X+qdSMjCpaxICFp5cueJqKJcJtBUeiwFoIcmsN1cmVUAuFDQ0+R8ESV0jk2nxez7nLRk9THOkm6O4GlDzV7lu2nIOl7DqbJUsqRRn2UU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mPGjOoYm; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-7d3f192a64eso199491985a.2;
        Fri, 27 Jun 2025 07:12:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751033536; x=1751638336; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=N383MBQJeLK+4T/1dattnFOwTJK4B0ZF2Q3FHLC9rnI=;
        b=mPGjOoYmym24QSLggjMzruxmj/IyvddDRo1CQr5GfjSg/CzGYX0uAXldLWQUe5lSET
         MdQfj0q0OYPUbFcJGydNSbuStgsHPbO3q5bZJzpz8tJEbyJtQ9rWOp/V20XILIYqpOd2
         iujtpGnYFqRRosorM6qP+epssp0cUWL7k7+8TyvfUZSxzjz9yp3FpeuJkt45y9mmqoXi
         MkZUsnddDcr5XqUPjUK3/TgIDOgwZua+LNydN2DAAoo0DR8u5lJxX84QEBhK4Iv2F1dy
         Aji59D+PRIZvUR7EBz7kZYm3L4JO94fitK2P9RTr1AFzto85Nv1+01ihZB5KyFeIXawV
         Z88Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751033536; x=1751638336;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=N383MBQJeLK+4T/1dattnFOwTJK4B0ZF2Q3FHLC9rnI=;
        b=GbE76RGNHVOKRePZ+eM+s8rqOW4pE32FPuu9FkWGiTVOsgwyVC9a+Y+cIhuLyHCDVi
         h21muVKVEetUwrcVaaBdIQvEr/34SPDKD3q7epTdnecrr048yFbXvo193hmd1xkXPQT9
         rpSANvGeWGtjPEn34IYDvMTCyQcmVzlXYpx/gDddkQe5Hl+048rbp96bKKSzJdccsQ+c
         Fy3KkgQAsZSECAfmBgr4D5yGz3kCnqVBBEk/nz37JOpEwPbd8vReMyDm7niuG7hJ7eGs
         8MYytFnwXd4zxGVCrOJO8aDtj996czWrhPWnCbZDIzr4Z0Ri7YF4a9IqLbPYTT3HDyiT
         edvQ==
X-Forwarded-Encrypted: i=1; AJvYcCV/ZrEvITq/oX6FHMB9PhFSk0wXrW1z3vJPIXGK/JGILTitHeQFKfgt7/Vn6jGdj06Wbvhe05YLwq9cnAco@vger.kernel.org, AJvYcCXtIcRc0AaYq6+nIDPB5VhHFUKKOocBIL0J4vnLEW9UgWmIobFueIsRp4BGt2pTLhTrN/6Ctq34Yw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxJx0z2bsAPjtDXXdzxOA8yLRngA6d6wDL1Zgc81zAD5XkCsa2T
	iqKu0B7rR4EpAP4bcoGxua++59EATJR9yG5KY4rb1gj+FNVvERJ2OzBt6hT6Zrut2hWZctToCIp
	q8rvWMa2eDaQ6Sj9dBUmSXSkGMG7CJNM=
X-Gm-Gg: ASbGnctqIR26KRRaPjMQLSlrY6F9v78otnCwAyxVY4/x4xbT1Tuc3QdhW4yWZHUaoKJ
	APdNQVaMt5GoMegNqvJ18Ypchv/b1yrOirJMjatLCJurxlxfxgpdTtkAEFfgFqp3sp69b8Hf3TL
	8/gS6hQHl0rzMfkP1qmzAQurGU+0bNLKqQIhnBBhK+N8RHzZOesCPL5HjhPoaocv7SyMFkU+5uB
	/nD
X-Google-Smtp-Source: AGHT+IGCshPgaxEYsmETIaKF+DIOhmRobs4aM3xROcJI8wsF0mS20ESHDA8BhIyLKEBvDSxZeaqOD+gAJSRl1sdvNMg=
X-Received: by 2002:a05:620a:1710:b0:7d4:29a5:8143 with SMTP id
 af79cd13be357-7d443920a06mr539226085a.6.1751033536067; Fri, 27 Jun 2025
 07:12:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: ritu pal <ritupal888@gmail.com>
Date: Fri, 27 Jun 2025 19:42:03 +0530
X-Gm-Features: Ac12FXwl8FSUxystsBE8Cczyv48plmtJeMuC6TbzwCD4uh8t1JhyYcPzuBfN224
Message-ID: <CAEy91+b+GN1CoX7Y7RVHq2sxjU=OrrPqmbsFuVW3da4YNTH+XQ@mail.gmail.com>
Subject: [PATCH] certs/blacklist: add error logging for hash blacklisting failures
To: David Howells <dhowells@redhat.com>, David Woodhouse <dwmw2@infradead.org>, keyrings@vger.kernel.org, 
	linux-kernel@vger.kernel.org, ritu pal <ritupal888@gmail.com>
Content-Type: text/plain; charset="UTF-8"

[PATCH] certs/blacklist: add error logging for hash blacklisting failures

Previously, errors returned by mark_hash_blacklisted() could be
silently ignored by callers,
such as uefi_blacklist_x509_tbs() and uefi_blacklist_binary(),
which do not check or log the return value.
This can make it difficult to detect and diagnose failures to add
hashes to the system blacklist.

This change adds a pr_err() message in mark_hash_blacklisted() to log
any failure to blacklist a hash,
including the error code. This ensures that all blacklisting failures
are visible in the kernel log,
improving debuggability and system integrity monitoring, even if the
upper layers do not handle the error.

No functional changes are made to the blacklisting logic.

Signed-off-by: Ritu Pal  <ritupal888@gmail.com>
---
 certs/blacklist.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/certs/blacklist.c b/certs/blacklist.c
index 675dd7a8f07a..0f5ff29ccb3d 100644
--- a/certs/blacklist.c
+++ b/certs/blacklist.c
@@ -208,8 +208,10 @@ int mark_hash_blacklisted(const u8 *hash, size_t hash_len,
  int err;

  buffer = get_raw_hash(hash, hash_len, hash_type);
- if (IS_ERR(buffer))
+ if (IS_ERR(buffer)) {
+ pr_err("Failed to blacklist hash: %pe\n", buffer);
  return PTR_ERR(buffer);
+ }
  err = mark_raw_hash_blacklisted(buffer);
  kfree(buffer);
  return err;
@@ -229,8 +231,10 @@ int is_hash_blacklisted(const u8 *hash, size_t hash_len,
  int ret = 0;

  buffer = get_raw_hash(hash, hash_len, hash_type);
- if (IS_ERR(buffer))
+ if (IS_ERR(buffer)) {
+ pr_err("Failed to blacklist hash: %pe\n", buffer);
  return PTR_ERR(buffer);
+ }
  kref = keyring_search(make_key_ref(blacklist_keyring, true),
        &key_type_blacklist, buffer, false);
  if (!IS_ERR(kref)) {
--

