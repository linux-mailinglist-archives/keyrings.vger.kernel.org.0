Return-Path: <keyrings+bounces-2669-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 60549AA598E
	for <lists+keyrings@lfdr.de>; Thu,  1 May 2025 04:01:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A5D6846128F
	for <lists+keyrings@lfdr.de>; Thu,  1 May 2025 02:01:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4B2914F121;
	Thu,  1 May 2025 02:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nigauri-org.20230601.gappssmtp.com header.i=@nigauri-org.20230601.gappssmtp.com header.b="1T3EkSMZ"
X-Original-To: keyrings@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADDF62DC782
	for <keyrings@vger.kernel.org>; Thu,  1 May 2025 02:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746064904; cv=none; b=KLGHf3tP2pLmhk6ROl96rbQy+CTdY6vTFRCTp3l8sWVxVmE661kN+GgSZiq03uZNoiNgratt4EWJqrCzCNa/q5rBYa7rjWhK1WoTpSLOPLe/sMqyzTdU2KV/i5c/a03ENi7D42b62TusTpmTMl1AlvZfkTSu38KNDdUx+r2L+n0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746064904; c=relaxed/simple;
	bh=Q+NJnL+jduQYepLZ5Tk/GObsavVs40GR49mYXlZ6vas=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IzjTrFQC2my9C95JX+T/bmr6IHtnSbHfMJh2H8GPt1XJbbfj4qmERxypZFoHjtBB6f/r4OsZMtNmLD/+9qyoGEm6l3KJWs7ZrtoXpBTERgOsVWROioILXfpJ4toS2OfN2r9oYmYGKMovmbVyG5okmCHRPYhcruUhaRPr67C38as=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nigauri.org; spf=none smtp.mailfrom=nigauri.org; dkim=pass (2048-bit key) header.d=nigauri-org.20230601.gappssmtp.com header.i=@nigauri-org.20230601.gappssmtp.com header.b=1T3EkSMZ; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nigauri.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=nigauri.org
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-224100e9a5cso5883395ad.2
        for <keyrings@vger.kernel.org>; Wed, 30 Apr 2025 19:01:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nigauri-org.20230601.gappssmtp.com; s=20230601; t=1746064902; x=1746669702; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4RdKidupnxmKUtU+QgA6Q2KBy92PpTK2SP/EB0ACgnw=;
        b=1T3EkSMZ4k7YUoXEoBDavXhzryALpowu1HQvPLH0ocTFm02/fDQHqZfZxdnZEYtLux
         wU+2yJ5STqJpY2jD+IkpR4r8bowX+wsy0Kg7OV5KDfnAOFTklnWqY3SWs6oYiJs1674H
         nVaxe21hRf/3WPMbrafDLjvwffX40gQgtec2OY4XyyTdkFmRuC+R7NPx5azQcehDYjBR
         6BQgUbx5LhOI/sxPNdIbg6jr7qx4IUp/BvLARVIslOVF+Dky4AEF5JVJb+xJv47teNoY
         XS5CTPLSxacYdGFWrg/7P7ZSMxYR2GGJSKXJi1r4jLU6LS0lVYimQUWjmW/cW+kCRl//
         kR4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746064902; x=1746669702;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4RdKidupnxmKUtU+QgA6Q2KBy92PpTK2SP/EB0ACgnw=;
        b=QNuAIWwATSnX/iHYr+29NE4uWXvtzx2ijuudL00aa+ka4Wvxm1N4K63iE9gboaFwXn
         SJ/DrqBmldKtVfp60d8uGjKA3XQw7InBS+Hc+9jyW8MtqN9AnYnw28YIc3oegj1W6O2G
         lREaPib6D2wmoEFJms/3LSioMI6GgIv/TNnxZkXbnDg3phLJZcpJgZzb2WrduH/U5RIS
         FE3A+BsJVY5xE6DzCzLEvgsWJd8pC8WTrsLjiBblTxLJbU8i8VNUG5EI1cdoZ0VHDb8V
         H5yl+LwmA3/Viqt+6UuMIXww17c/i5AOIL2CeAYp3y9m3h11GMgAYmzTnST/wZTxZWKH
         q+pA==
X-Gm-Message-State: AOJu0Yy63GU5mYvFJ7EWjxr4p1J0ren63kPaVb4KOyj1EyQa2bocAXpr
	Y0zZSgwxtXWHF786MEiTX0ljltUzhhlY5gkqHtf1GP+dNaVdsrKYl1iTtuoDgrA4nluqPsCjXg=
	=
X-Gm-Gg: ASbGncsp0Bmau9jbsVwUo+uZraANWLj/jeCOFJn0nJ+ZjPZgYpNNzZAf/HZFl/liJEd
	kTO3W+WbKtUopQaAcbc5SruCkynlKFmSPuLmWORoZe1H/J5uNJqazwf0FE8fpX4pO650JLQ2Dyl
	gJxBgWR8SSHUUnhR6fpdEctn5ZfgZ5RngNgWeCJQY6sDtYoAL+8727JGmNuDJUcq9AOZM8jbV1w
	VZh9iNG5BSToFxiJpQSmtNJs67QD0/u7rgCWniH/HjfQVyn10LORqmP3ODDXWlTx5a1VZGsLzMo
	Gjfp0A1kPcvwvc1Ch7QjYf0TNY/ee29BJYvjVGKZ4KcDSFCmcUPIirNyerr/oj8rmtfY8qs7Gw=
	=
X-Google-Smtp-Source: AGHT+IFF1JDoVd9X1MLyQPl9JZM1YVu8tJmNyZpfa/m4sxE6o6GjVsnbi4Q1sS/ZMWs0zV9+OQus2Q==
X-Received: by 2002:a17:902:d484:b0:223:2361:e855 with SMTP id d9443c01a7336-22e0844684amr10260825ad.39.1746064901792;
        Wed, 30 Apr 2025 19:01:41 -0700 (PDT)
Received: from localhost (ae053227.dynamic.ppp.asahi-net.or.jp. [14.3.53.227])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-22db4dbcb26sm129540965ad.68.2025.04.30.19.01.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 19:01:41 -0700 (PDT)
From: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
To: keyrings@vger.kernel.org,
	David Howells <dhowells@redhat.com>
Cc: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
Subject: [PATCH] Add License variable to pkg-config file
Date: Thu,  1 May 2025 11:01:27 +0900
Message-ID: <20250501020127.3935268-1-iwamatsu@nigauri.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The pkg-config file has License variable that allows you to set the license for
the software. This sets 'LGPL-2.1-or-later' as defined in SPDX to License.

Ref: https://github.com/pkgconf/pkgconf/blob/master/man/pc.5#L116
Signed-off-by: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
---
 libkeyutils.pc.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/libkeyutils.pc.in b/libkeyutils.pc.in
index 4c06267..235ee18 100644
--- a/libkeyutils.pc.in
+++ b/libkeyutils.pc.in
@@ -6,3 +6,4 @@ Description: keyutils library
 Version: @VERSION@
 Cflags: -I${includedir}
 Libs: -L${libdir} -lkeyutils
+License: LGPL-2.1-or-later
-- 
2.49.0


