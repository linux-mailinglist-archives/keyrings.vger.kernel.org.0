Return-Path: <keyrings+bounces-3322-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id ACB83C4EDD0
	for <lists+keyrings@lfdr.de>; Tue, 11 Nov 2025 16:52:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id ED1124ED8D9
	for <lists+keyrings@lfdr.de>; Tue, 11 Nov 2025 15:50:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1724036A038;
	Tue, 11 Nov 2025 15:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="HQJ4mWO5"
X-Original-To: keyrings@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C20B34AAE0
	for <keyrings@vger.kernel.org>; Tue, 11 Nov 2025 15:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762876197; cv=none; b=R2R7Nf1SDd3xKsFAxeGBJm1m5SxH3K8v7j1J+CgSvFU3bE0qmSoEUjz7FirpVx0iPGx1g3ixyTyqQDP+O/BKaLNpHyvv+8Z3jS97mv6bnBbs/CW6VQ1T7Th1FaHa+1n+9z0r2kd4BaREvze/eEAebzXhteddiqRedN7Y2xkIxHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762876197; c=relaxed/simple;
	bh=CqEtGAdcdC9fF+g+1J10KIaSPEMvCZFYGfAXTUffalk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=k72nw5ntkrRoBEB/hsKWSrZ0qFt4nfu6NE25O14Vb3//ZJ4kVvQMGPFM5EbZmFgUksEnB1WalhwVpiW9FUQlWmtflElnvUA0P8LHVH7IqQxBA1PKxXPbg51qH1I3leWHD3rbUS/7gI1PxVELZwxtwPCYrTefje3Cb9z6VQ7HIEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=HQJ4mWO5; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-477619f8ae5so32517785e9.3
        for <keyrings@vger.kernel.org>; Tue, 11 Nov 2025 07:49:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1762876192; x=1763480992; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wBOHrHOppf1AdfPIS3ZyxdiMnLLRYeZxEryWRgXkM8w=;
        b=HQJ4mWO5KdT3b6efSL/NBYrQceKYWI/EPshSUVWwECZYRWgG8FzzN+f9kdyX2g+jgm
         rx9YQqw3hoWIo1qMK/24AX4Mdj+bczviBzsjX6Ab25e5ZpD5u6YLOu0JbP4P7kKpedTX
         cYMD+TOtDTPFbQtIKubJWKaCffKhwNXei+o43rWDPKAh0uXfN0IInzPHUnLmWplAKkxE
         ou8o9gW8NxmT4oACIesT6yC9tgnf2+4i8JZkS4iXjvydKGofPcL7ZIG6hFH6bkYwQZe0
         DubRgJVUXzw+H1P99vDR0Cg0nO8ToN7YgE1nKGnCQ68Lnv8hkpvrolq5BHoRhmmGGzb4
         qI9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762876192; x=1763480992;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wBOHrHOppf1AdfPIS3ZyxdiMnLLRYeZxEryWRgXkM8w=;
        b=jKkGfjqO8tWuEDIzc6hwNXk3aNGAmITSt5+0uTdIJDzxBKj2S7PgPAo6vKcvoGJgas
         i5y+v9Q+hlJmwt4LKM2BplI8tPTL5Zi+5YC3niKNaulPN4oZ3DT/3CVpecJjXZGfnEMo
         wantHtEH8GTXg8Uxgy2IlXVL/F3yK4n1G1EtRyQtjHxFk02MZubvi9mAU/UsZnfWyM5R
         VwCHKmMPuqneSxCW12XT2K8B5DWo2vO+px3ZrsYC4+mDho3jh/J4wP1bcvdJs/DnmfjO
         Nkwq1NxTvkAURc/q57cv5o6z5DtAOobRZ2V//2VsHFaUkG3HQOhkuyD66EyLQFFFcJ3u
         yPkA==
X-Gm-Message-State: AOJu0YxcOLoMT608DGNLYc4vBQZVL3pvdHG7ZNwbeQuAzeKHv3N/Ndpu
	9IE8lSUBwjAPR51ouB1VYlyJOGnQFQMN/WzrAf6yto4achltsy9JbMMFlCIDyjRSudA=
X-Gm-Gg: ASbGnctKPfQRajlGrLnIBlZBdLS3yQY67chuf3Ggna6PfbW5gM1CMpvoJcKKNikOedB
	Y0xzWkxfIuD2alArv8oaiR7o/Q7Wz7MwFjgNYhVRzwVukTcsN1D2e6oAclgYDULFMJiJqFJk5ux
	qjVJTCxMT4RjpRvxQE3rWFahvfgOPggU/fw4ljYsRBLVDmTeSKP40rQkRgjKqTvQYwK12V4FF5V
	l66NMgXXQnTNiqljiKNSOFFGJIC/qfxPmya0cSWgYLRPMIemudW1uqUQw9xTPoIE2roEHrWB82v
	r/t3MRNfwsjSxv79YVXiaXzIO/YUNIkOu37jrOCWWGwSRfNpUYeBslaWdsrsujRXuvZj9v1LtD8
	ku3GUM+D9AaudV5W4H45842SJ5zVFxnRoSXCfZqe9jLz0HFeUWi5z6iajfV3L34zdKhtk/J08Zf
	IyBtIL9bWsvWXJb2q33KBH1QNE6qixk0vy5b4oPYs=
X-Google-Smtp-Source: AGHT+IF3w/+X8esWpOXfnuyljikULLGSD9qW7Bkx3W/HLFcTqZLnglxnZWVL5Dg8R8MNDHTN0J812A==
X-Received: by 2002:a05:600c:3493:b0:475:f16b:bcbf with SMTP id 5b1f17b1804b1-47773237269mr93820995e9.14.1762876192518;
        Tue, 11 Nov 2025 07:49:52 -0800 (PST)
Received: from zovi.suse.cz (nat2.prg.suse.com. [195.250.132.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42abe62b23csm28269916f8f.10.2025.11.11.07.49.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 07:49:52 -0800 (PST)
From: Petr Pavlu <petr.pavlu@suse.com>
To: David Howells <dhowells@redhat.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Daniel Gomez <da.gomez@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Aaron Tomlin <atomlin@atomlin.com>
Cc: keyrings@vger.kernel.org,
	linux-modules@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] module: Remove SHA-1 support for module signing
Date: Tue, 11 Nov 2025 16:48:30 +0100
Message-ID: <20251111154923.978181-1-petr.pavlu@suse.com>
X-Mailer: git-send-email 2.51.1
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

SHA-1 is considered deprecated and insecure due to vulnerabilities that can
lead to hash collisions. Most distributions have already been using SHA-2
for module signing because of this. The default was also changed last year
from SHA-1 to SHA-512 in f3b93547b91a ("module: sign with sha512 instead of
sha1 by default"). This was not reported to cause any issues. Therefore, it
now seems to be a good time to remove SHA-1 support for module signing.

Looking at the configs of several distributions [1], it seems only Android
still uses SHA-1 for module signing.

@Sami, it this correct and is there a specific reason for using SHA-1?

Note: The second patch has a minor conflict with the sign-file update in the
series "lib/crypto: Add ML-DSA signing" [2].

[1] https://oracle.github.io/kconfigs/?config=UTS_RELEASE&config=MODULE_SIG_SHA1&version=be8f5f6abf0b0979be20ee8d9afa2a49a13500b8
[2] https://lore.kernel.org/linux-crypto/61637.1762509938@warthog.procyon.org.uk/

Petr Pavlu (2):
  module: Remove SHA-1 support for module signing
  sign-file: Remove support for signing with PKCS#7

 kernel/module/Kconfig |  5 ----
 scripts/sign-file.c   | 66 ++-----------------------------------------
 2 files changed, 3 insertions(+), 68 deletions(-)


base-commit: 4427259cc7f7571a157fbc9b5011e1ef6fe0a4a8
-- 
2.51.1


