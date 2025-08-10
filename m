Return-Path: <keyrings+bounces-2957-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C670B1FCC8
	for <lists+keyrings@lfdr.de>; Mon, 11 Aug 2025 00:41:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 326B51648E4
	for <lists+keyrings@lfdr.de>; Sun, 10 Aug 2025 22:41:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0AD919C560;
	Sun, 10 Aug 2025 22:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LEEfyCuf"
X-Original-To: keyrings@vger.kernel.org
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64B271C8621
	for <keyrings@vger.kernel.org>; Sun, 10 Aug 2025 22:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754865663; cv=none; b=TG/AN/dZ9vpU9mDHlWN7JGkVDUzx3IKI1GtAt+PIiiMMLlmlUuicHDCCL4rC8aAJs49h2SixUpgqd8P+UK2rVq0U/vpmYfi84te0XQBazT8lGaI7vAXY/ScME7gSEkKv6BzvKhdopRrZh1nsiTgRZaUuRRsr8hASsFyzTvr6o0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754865663; c=relaxed/simple;
	bh=HyJ50y5CyPHv7VX539+SFGLcEF9vtur9Sk5LrEmPQMQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tz6DJXKOpzdp5WYXpBJgj2GQe5mzSW7zmjeLCPYC3ou7G8Ofv/Ocf+OqefIHeC6ow7iamMXeAapgUFKVX1kArS4O8c1wV9dHT2m5fqA4bZH/xgBV3LuRU7lNA9e2oHHVh4UJSveku95wOlYdcO5+nLz1y3tpBUOj7zgdaHAqxzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LEEfyCuf; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-7e835e02d96so196238385a.2
        for <keyrings@vger.kernel.org>; Sun, 10 Aug 2025 15:41:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754865661; x=1755470461; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MtPFz9ewokOSKhmqI682+ba/HN7qEOMgn38aUsBYbJo=;
        b=LEEfyCufaSpWyl/GObRt6vDZXWOPCTw6rpbwCc/sKctooHmxAyXit4BISBGlSQfag9
         LK6zv0/4H1kFAqxFmcDKoLdjRxKdReSKzn3xiBbRqcOY1ubgQ1S0Hy+Zlk/iyacwTko9
         td3y/EPoMOYTrouy02MnxQTsRLOvGaRnEuYtgNKIpo1KXbuFIzNxIkpxeM4hYgrFezDz
         ZEZIWB6OBhY9c5h691OuARxU1jktBYZ8TJRXIoDkElyp6a4HRlvZSUDA85Or4vKC8cE9
         d8zs2E5BOOuPXTziUc+AzFVZglAj+42d7eIwFetxKx0OpwpQuFP5LUA3o3fVajGwOjb/
         KyZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754865661; x=1755470461;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MtPFz9ewokOSKhmqI682+ba/HN7qEOMgn38aUsBYbJo=;
        b=epw/+rRhPTIpYb51nq1lpSQTYbeX+LzN6Rg80rLlj7FRsRKUPOtcuhnkWspKPs7Ujm
         JqKFu1K4yyk038nbulvp0d2J4MJ1vx6PDiYK+Q6B5HmDJBHq+QRPL9ZJgGW7WXYUAbhd
         qz8K8rAO6C0qi1yu4wisfQB3bnG9K+L7TixzgV/SOMnJ8CpY3kXhgwJw+aj7/JBF1MBe
         +PKoW6bUGmS+4UVVzNWRFFeZVRu5AqTc6Dk01UMyCbrJqnFI7wGkonMR6xgkwKwUEivL
         HDxM1Vz4BPUxSy1dBEZVX7bY5K3xxlPEwgQQXIPin1qMLK1qbSiGjiXANTN+1S6WKrz8
         w0NQ==
X-Gm-Message-State: AOJu0Yw68jYTEZ3DA0wKCv8+x5GMumW13MvBL3ACg2COdKuRptkAyLHK
	Hc6aiWpN05qQVahl/n8UsRwggcKzfasvXqwkcPUqYk0gGddWD76qflxo
X-Gm-Gg: ASbGnct6Q5wII/s4l8J5FvCHGbf0iLXZDgnt0TCPZNQYNVoES2J59cPqY11CxpDVdZL
	D22JltbY1JWiq+ykHpDwotFhh0BMymDZJBBctNvxsTbjaVZ7G3N/Fv4aKDVuxdqiqKNNzCgFTDX
	OWmkI3Wbae3dDid276t32i+5dq772exbtUgtZ2dAAuNiHd80fRtrTgG8YvV3pK/tI4fHXzv5Bw4
	M8iYCafB+IFlMRuR3WbrLtN85X2yF1gkGKveaMTq+eI1O50vbJ4aX1Ly+tpxwa+wF1K/Nv6+Vix
	YUnOvGke5P9Zkzd8ohE3j7+tBCBf7aYtPeKZ7fftKADNgNT9RA4iYupf+fazhDOqoPEjypXi/LV
	+Uw6AB5/mvG29/aI=
X-Google-Smtp-Source: AGHT+IHZ+P4DFOZJuXApHs0FmdFm1cJIqWoaamRmI4QDvkaTumafPIJG1yD8clkIuMIY0uaBvdnjOg==
X-Received: by 2002:a05:620a:bc1:b0:7e8:c4a:812b with SMTP id af79cd13be357-7e82c64938dmr1287405785a.19.1754865661278;
        Sun, 10 Aug 2025 15:41:01 -0700 (PDT)
Received: from localhost ([162.208.5.25])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7e81bc7a1e3sm651604285a.74.2025.08.10.15.40.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Aug 2025 15:41:00 -0700 (PDT)
From: Matt Turner <mattst88@gmail.com>
To: David Howells <dhowells@redhat.com>
Cc: keyrings@vger.kernel.org,
	Matt Turner <mattst88@gmail.com>
Subject: [PATCH] test: Handle EDQUOT in act_keyctl_test_limits
Date: Sun, 10 Aug 2025 18:40:41 -0400
Message-ID: <20250810224041.3025756-1-mattst88@gmail.com>
X-Mailer: git-send-email 2.49.1
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This matches the behavior in `act_keyctl_test_limits2` and avoids a test
failure [1] on some platforms:

```
TEST SIZE 192._._._._._._
197 desc wrong error: Disk quota exceeded
._
198 desc wrong error: Disk quota exceeded
._
199 desc wrong error: Disk quota exceeded
._
200 desc wrong error: Disk quota exceeded
```

[1] https://bugs.gentoo.org/789837#c9

Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 keyctl_testing.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git ./keyctl_testing.c ./keyctl_testing.c
index 3161467..588fa83 100644
--- ./keyctl_testing.c
+++ ./keyctl_testing.c
@@ -126,6 +126,10 @@ static void act_keyctl_test_limits(int argc, char *argv[])
 					fprintf(stderr, "%d desc failed: %m\n", i);
 					nr_fail++;
 				}
+			} else if (errno == EDQUOT) {
+				/* This might happen due to us creating keys
+				 * really fast.
+				 */
 			} else {
 				putchar('\n');
 				fprintf(stderr, "%d desc wrong error: %m\n", i);
-- 
2.49.1


