Return-Path: <keyrings+bounces-2310-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C19E39DA13C
	for <lists+keyrings@lfdr.de>; Wed, 27 Nov 2024 04:52:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6513F168EE8
	for <lists+keyrings@lfdr.de>; Wed, 27 Nov 2024 03:52:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88D92481CD;
	Wed, 27 Nov 2024 03:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wh/sN58+"
X-Original-To: keyrings@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0651753370
	for <keyrings@vger.kernel.org>; Wed, 27 Nov 2024 03:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732679566; cv=none; b=s1mnBUIH9f3N57OmU0ALRynqnL8uj9TqfAQHJVOuPOdYiJR0DwuKCs5rRquA7uZs6l/db8ad3BPiVP0vjbTmwBllFg4u1pH50+751MnwA/AaOJdjZVKA+y2YBsMLvRNWs9kArf5LxN0fCmc9aGMZ89Ys617Uj2eEL0XyvA36TsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732679566; c=relaxed/simple;
	bh=cwliDK2RVeLPqhxyu3LLSVcO+CLom7kqFgHQWPNOsGQ=;
	h=From:To:Cc:Subject:Date:Message-Id; b=K1W8aHrJ5qSfjY96huj4QvjucchQu71+cxWJrg4R2Ljrtocfa1ho7Tc3yMv9EtNRqNzDRNE7bOehc89CkgHiW3KVqXAdUywDZBMg8fifh1pQUDhevQhogwuWAVrFGZ/dGsRzCuDg+pwdP5A4PZDOxYgGgDQPIfQSR0k4pDMywNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wh/sN58+; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2124ccf03edso63504615ad.2
        for <keyrings@vger.kernel.org>; Tue, 26 Nov 2024 19:52:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732679564; x=1733284364; darn=vger.kernel.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XFcXdrCde4+58kpsYNn5Xwqj/183Eoh+SEVMVwV7q7k=;
        b=Wh/sN58+ZuVyzcY/OGhx/KGbNjbHVPJnqI5IXnGr4HsH7uxVhQYGdPibTDMQjZn9Uk
         9+PUQM5Eb2PF9+tefMeNVv+ANL2bG6u2o4zdKc1X3wvYD0MJ10lVOWsmuQt4SjZ0yTp5
         6Q7sPe5Ucos27XFLYbRkbt5sAyYK1drO753UDDz3IH5A45ipisSDriqD/kBd2KHBackz
         Xj8uJ8ST1IOz+YpiFq67ThR0wsqUaKwev4fkV5nM6LWSzm82pkI8Hvx0y1Sb6zn+7G08
         Zn8XT1TgpyM4VABBbmaapKwazDqhxuM5S4PWa3p0AxaP9dOhrU4HtBbR7tPuNyGqXQQg
         A2Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732679564; x=1733284364;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XFcXdrCde4+58kpsYNn5Xwqj/183Eoh+SEVMVwV7q7k=;
        b=JUpmNYsjWYCqByqM5gufUpnVMU50ZZZy7aJWYKnfvEYYmlVC6zR91LqEeTUnaiLNKC
         y7EM7vT0Whk88wz9e//nHqRERKojoHlgEZgsxL3b6jIXvklAbPKmrD27vgTRPh+eA1uS
         YXpJvaqA81Et8mc5OF8QVeUfjxHuDHoaxUQ6W4KWs8Tm5Opxiw13JRPSiFogcWP3eMom
         BgoOhUtzpWdhhIQDbRPHkWTfnvOMKwFqcAY9CPSeHHybnvmxZbWyyW4Xo/XaSKdvHtKX
         nnx7i7jRS8EVUSb385AWDRarlP9iOu2WjK2YlhFe59xxYuNce1XTJGFdGP6lqy3b7fDr
         Z4PQ==
X-Forwarded-Encrypted: i=1; AJvYcCXu0ULhBzk6QwaQYYHzwC4hexTgGp/kY2qkWy0Aazn074x5DqghgfsHHqzWsmvOkpwLkuPIQE0B2g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxfOeg6OuDL5Sy6FzBentwGjfHV5S25XZPcm/TJblm8OP7vili5
	Z3RdDRMqWEvjZsFyP7pmXIY0/hknlL5gnkqfRkpsvrTT6lCjArBh
X-Gm-Gg: ASbGnctZyMest7jHV09H5DsrAX+V3A4JVVkSBs/NZp1novYaIxInly/2XPrXyJ9YSET
	wx9EYPKcNXlZ9NCEIrNnfaHCV91zl8DjMXUTOiS/ONIELScNp79wUio493qWlHAKyi0L0PWg8vd
	vIiONUkWZPu+jrzQYdBEvWpb/ezLhzZ2IK4iokZByLA7bWgvagw+pzf7QvzsrCROHZDpvNeEwOI
	EmgDVwPK1FxGIZLif0Sd1ET3ZUkvvZqzAsr1VQMWnEaAwjZUDjUFIBszzs=
X-Google-Smtp-Source: AGHT+IGiRdAG3m2o2y86wTD3vpHaHSfAz5mz5kttpNItflEDVKbVYTVKa0NUAINCRo0lMAqUmh5o4Q==
X-Received: by 2002:a17:903:32c8:b0:214:ffc6:8904 with SMTP id d9443c01a7336-2150109b97emr24344425ad.22.1732679564210;
        Tue, 26 Nov 2024 19:52:44 -0800 (PST)
Received: from localhost.localdomain ([43.153.70.29])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2129dc126d5sm92897475ad.173.2024.11.26.19.52.43
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 26 Nov 2024 19:52:43 -0800 (PST)
From: mengensun88@gmail.com
X-Google-Original-From: mengensun@tencent.com
To: dhowells@redhat.com
Cc: jarkko@kernel.org,
	jmorris@namei.org,
	keyrings@vger.kernel.org,
	yuehongwu@tencent.com,
	MengEn Sun <mengensun@tencent.com>
Subject: [PATCH] keys: Add cond_resched to key_gc_unused_keys()
Date: Wed, 27 Nov 2024 11:52:41 +0800
Message-Id: <1732679561-22967-1-git-send-email-mengensun@tencent.com>
X-Mailer: git-send-email 1.8.3.1
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>

From: MengEn Sun <mengensun@tencent.com>

When running the follow test:
while :
do
    stress-ng --key=64 --key-ops=1000
done

We used the bcc tools funclatency to measure the execution
latency of key_gc_unused_keys(), and the results are as
follows:

funclatency key_gc_unused_keys.constprop.5 -i 1 -m
msecs               : count
    0 -> 1          : 0
    2 -> 3          : 0
    4 -> 7          : 0
    8 -> 15         : 0
   16 -> 31         : 0
   32 -> 63         : 0
   64 -> 127        : 1

It seems that key_gc_unused_keys() takes a long time to
execute, and there are no scheduling points in this function,
which may harm latency-sensitive services.

Therefore, we have added a scheduling point to this function.

Reviewed-by: YueHong Wu <yuehongwu@tencent.com>
Signed-off-by: MengEn Sun <mengensun@tencent.com>
---
 security/keys/gc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/security/keys/gc.c b/security/keys/gc.c
index 7d687b0..14e4f1c 100644
--- a/security/keys/gc.c
+++ b/security/keys/gc.c
@@ -165,6 +165,7 @@ static noinline void key_gc_unused_keys(struct list_head *keys)
 
 		memzero_explicit(key, sizeof(*key));
 		kmem_cache_free(key_jar, key);
+		cond_resched();
 	}
 }
 
-- 
1.8.3.1


