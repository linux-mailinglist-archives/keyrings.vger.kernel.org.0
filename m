Return-Path: <keyrings+bounces-2309-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 68A0B9D83FF
	for <lists+keyrings@lfdr.de>; Mon, 25 Nov 2024 12:03:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 08FA9162034
	for <lists+keyrings@lfdr.de>; Mon, 25 Nov 2024 11:03:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78406192589;
	Mon, 25 Nov 2024 11:03:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=seltendoof.de header.i=@seltendoof.de header.b="VBZtnfWC"
X-Original-To: keyrings@vger.kernel.org
Received: from server02.seltendoof.de (server02.seltendoof.de [168.119.48.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D836E1922D3;
	Mon, 25 Nov 2024 11:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=168.119.48.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732532629; cv=none; b=JhlXhcL47/9LDCGnqWaA+wG4ljYMMhbn9GUbigfuTPTsivxvkwwZc3IFUb1SAGEqb7E0ZWSMTajQXqhTdpiyDGBu8pgp6gAjviuQm5Zz+dSyS7OpEy/PGAUW8eWuL1GJcROHKz5lf4Fxj5z4ljS+y3E2HGgesDX9g9KL9M5VS/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732532629; c=relaxed/simple;
	bh=laoN9e3s8LiX//7tIhCeT6NfA18Knkt9XgZkVKqgquo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=eSrx+VEP3e08iBDpAdClfYnglQWKaVEMa0GYkaeVSPo1/zhZch90g31l+7Gf++QLvAqCKheUJgh/W73BY/S9eCbvS2Y6NOnbuiNAbejSHsf9b39n9L0XjX3hZzZSRLCmNrOc19gJF0KUSB/ds9Z5YoQ5N/OFic4uYuHJ0+v1eGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=seltendoof.de; spf=pass smtp.mailfrom=seltendoof.de; dkim=pass (2048-bit key) header.d=seltendoof.de header.i=@seltendoof.de header.b=VBZtnfWC; arc=none smtp.client-ip=168.119.48.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=seltendoof.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=seltendoof.de
From: =?UTF-8?q?Christian=20G=C3=B6ttsche?= <cgoettsche@seltendoof.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seltendoof.de;
	s=2023072701; t=1732532625;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:  content-transfer-encoding:content-transfer-encoding;
	bh=hNho8neMQagfmCWnDc1kEcgLnWwbDZUmKhUoSuHqEIQ=;
	b=VBZtnfWC3104waWgwMOe17jpzh9Lh/NbBbvbIvUjc1oRD48CBNKmSbh11uKKla1GtLKrSa
	nYwC1jvPxzMA1LroI/JlenR9aDtrjne3BDjQ5kW3yV6vS9xG/Ea2IbVwi07kQ0E2/Td9UI
	eNdbKEW4m9o1n3rXylQBYuTHrHBe3yrv1H4SJI6RuVCjj22ePx5J3CL+hbRnLeyDfLVyfC
	rgDlPgRXCH0+ucRgrliZL+WkzTuQhvnEhI/VjK5iz98piMLMyPrsLYu/TS/uzJvcQTNcxB
	1LoXHUZqAFdv9R7abHKE4nKQM5RYuyYKL41Ri4KKJIk9Afy1T/yqyUWDuKjCgw==
To: 
Cc: =?UTF-8?q?Christian=20G=C3=B6ttsche?= <cgzones@googlemail.com>,
	David Howells <dhowells@redhat.com>,
	Jarkko Sakkinen <jarkko@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Eric Snowberg <eric.snowberg@oracle.com>,
	keyrings@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH] keys: drop shadowing dead prototype
Date: Mon, 25 Nov 2024 12:03:40 +0100
Message-ID: <20241125110342.49015-1-cgoettsche@seltendoof.de>
Reply-To: cgzones@googlemail.com
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam: Yes

From: Christian Göttsche <cgzones@googlemail.com>

The global variable pkcs7 does not exist.
Drop the variable declaration, but keep the struct prototype needed for
is_key_on_revocation_list().

Reported by clang:

    ./include/keys/system_keyring.h:104:67: warning: declaration shadows a variable in the global scope [-Wshadow]
      104 | static inline int is_key_on_revocation_list(struct pkcs7_message *pkcs7)
          |                                                                   ^
    ./include/keys/system_keyring.h:76:30: note: previous declaration is here
       76 | extern struct pkcs7_message *pkcs7;
          |                              ^

Fixes: 56c5812623f9 ("certs: Add EFI_CERT_X509_GUID support for dbx entries")
Signed-off-by: Christian Göttsche <cgzones@googlemail.com>
---
 include/keys/system_keyring.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/keys/system_keyring.h b/include/keys/system_keyring.h
index 8365adf842ef..a6c2897bcc63 100644
--- a/include/keys/system_keyring.h
+++ b/include/keys/system_keyring.h
@@ -73,7 +73,6 @@ static inline void __init set_machine_trusted_keys(struct key *keyring)
 }
 #endif
 
-extern struct pkcs7_message *pkcs7;
 #ifdef CONFIG_SYSTEM_BLACKLIST_KEYRING
 extern int mark_hash_blacklisted(const u8 *hash, size_t hash_len,
 			       enum blacklist_hash_type hash_type);
@@ -93,6 +92,7 @@ static inline int is_binary_blacklisted(const u8 *hash, size_t hash_len)
 }
 #endif
 
+struct pkcs7_message;
 #ifdef CONFIG_SYSTEM_REVOCATION_LIST
 extern int add_key_to_revocation_list(const char *data, size_t size);
 extern int is_key_on_revocation_list(struct pkcs7_message *pkcs7);
-- 
2.45.2


