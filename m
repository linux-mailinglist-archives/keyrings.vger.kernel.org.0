Return-Path: <keyrings+bounces-1671-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E9529260F6
	for <lists+keyrings@lfdr.de>; Wed,  3 Jul 2024 14:54:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 161AE288D5C
	for <lists+keyrings@lfdr.de>; Wed,  3 Jul 2024 12:54:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4825B17838B;
	Wed,  3 Jul 2024 12:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sigma-star.at header.i=@sigma-star.at header.b="ZtnmC/Ab"
X-Original-To: keyrings@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 489D5179970
	for <keyrings@vger.kernel.org>; Wed,  3 Jul 2024 12:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720011246; cv=none; b=bpxEaGFQkEx/KAE0IOTWC5tro50oPqH4oSCU/DvekLP0wQ+V2DUpa8jclMlYAj05mE0cOVkXKMEmWPApLbVGcAfPGEldFG3FVjBsJ8fCOy3EwDpU9pk/ehkoWHRDibMIeRnA19aY/oGii0TyHHc80eaPdtE5shfJ693smueMgUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720011246; c=relaxed/simple;
	bh=icdGIhylB0lXVqhQ0Oq7EE1+CLenXFSI1YMAf1lrq+w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=awB3DKzC0L1/1jHGw2C+OA9fktgqqPNp+H81WKLYd8aGpcICmep4McrFDioz72tmkh6/cxXeliy5IMtx7lPFwtu+++XYa5ETrXuwp5YqJU/z4ihD8cOJDIrW5MW+ps/Hf+/7FmAuBN42jrvYAakTYBzLtNTLpk9ideUMbr8P2Ro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sigma-star.at; spf=pass smtp.mailfrom=sigma-star.at; dkim=pass (2048-bit key) header.d=sigma-star.at header.i=@sigma-star.at header.b=ZtnmC/Ab; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sigma-star.at
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sigma-star.at
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-36794da7c96so296161f8f.0
        for <keyrings@vger.kernel.org>; Wed, 03 Jul 2024 05:54:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sigma-star.at; s=google; t=1720011243; x=1720616043; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Yzx9VHlc/8h9m6p3SRKEm1Y4xLQisswwlqQ+JvkCTDE=;
        b=ZtnmC/AbZzQDFm3e+qe1qL7U9It+RJ0V9zshhUBc9BGDawvbKrGpVuWVLsVFo7WjjF
         is8/hqshXxPt/nHmfx5CBBLHdSWMyX+9krMVsPu+yL76Qwc3+pJa35SpZqWYWw093bdW
         2smyX5BENKzeuRB4hwUG3wGRil1yz6OzPxpasZRFH9k6JL+m5zERzv5+jISBsyBiny/x
         P1l69+zPmXeOfyaa+4qkaa47WEccm038Quq/lLNiIftiACAfCb5/wvdXe2kJiIIBuV3N
         JOXw258OKl2OQtAi3b5NriUN0f3lL8lrwNrCWn1G/2pAN8TZR4RCL3k27IhB1lMTgbwo
         StmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720011243; x=1720616043;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yzx9VHlc/8h9m6p3SRKEm1Y4xLQisswwlqQ+JvkCTDE=;
        b=bRQoB4WX8L2PK1yURCRyvSBZ4FekAzjz3LtcJ1lh6zXJK4nP68E2IY20bjHcNqpvoJ
         ldPlRoqG/O427ak5PaoU8HJMPHBMRFq8NPNdBNhwi3oRYEOzF+/s3BvA3fF5m6hcLLRK
         qJUndY9t+awlHiWpt2KICFPVkeaqGwI/iG23Tkm4+jRTjPoT9fUmGT2tXixWsXxWrCwO
         ZUc6nHl/xIl5En7COdIpI5C7nv2z3L73MrQoMzhQDm0/nA9KJqLMICm6r74wQ/iR6RLn
         sve3QGkST7WiJ22j+r6svs2Mnh1UtQHxeIMJGrYe2UodHcqTzJZigQ0LQBdOnMDR0yWW
         v9Ng==
X-Forwarded-Encrypted: i=1; AJvYcCUjLiW8bhVXXId6M/BmqeWWVSVVOPPxkmA+5UvSShd5vhr+r9UZCO144W4rn2ChURfi0VlXmwsHY2OP8U0aG1KyBKlFAkr0IZM=
X-Gm-Message-State: AOJu0Yy68c1xFU4mdcbo60AiRuhhyM/af0wF0Aba/Hfyy44kqS2iDpU8
	2LLCfrxJTjZcO6MWr4vGI2b6jaPyKRtzwb0WmcyTSfvHoLM/HHWQ/d9iW29dP+I=
X-Google-Smtp-Source: AGHT+IHKkT/F7VYwbLXQnp0PsjNCbmpL2tzMJ16ri/aVmQvC719AC9zQFGR8qEFOdoj3yqk4lIc+HQ==
X-Received: by 2002:a5d:648f:0:b0:366:ee84:6a73 with SMTP id ffacd0b85a97d-36775696c16mr8572598f8f.10.1720011242537;
        Wed, 03 Jul 2024 05:54:02 -0700 (PDT)
Received: from localhost ([82.150.214.1])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3675a0d8daasm15703542f8f.30.2024.07.03.05.54.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jul 2024 05:54:02 -0700 (PDT)
From: David Gstir <david@sigma-star.at>
To: sigma star Kernel Team <upstream+dcp@sigma-star.at>,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	Jarkko Sakkinen <jarkko@kernel.org>,
	Mimi Zohar <zohar@linux.ibm.com>,
	David Howells <dhowells@redhat.com>,
	Paul Moore <paul@paul-moore.com>,
	James Morris <jmorris@namei.org>,
	"Serge E. Hallyn" <serge@hallyn.com>,
	David Oberhollenzer <david.oberhollenzer@sigma-star.at>,
	Richard Weinberger <richard@nod.at>
Cc: linux-integrity@vger.kernel.org,
	keyrings@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	David Gstir <david@sigma-star.at>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH 1/2] KEYS: trusted: fix DCP blob payload length assignment
Date: Wed,  3 Jul 2024 14:53:52 +0200
Message-ID: <20240703125353.46115-1-david@sigma-star.at>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The DCP trusted key type uses the wrong helper function to store
the blob's payload length which can lead to the wrong byte order
being used in case this would ever run on big endian architectures.

Fix by using correct helper function.

Signed-off-by: David Gstir <david@sigma-star.at>
Suggested-by: Richard Weinberger <richard@nod.at>
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202405240610.fj53EK0q-lkp@intel.com/
Fixes: 2e8a0f40a39c ("KEYS: trusted: Introduce NXP DCP-backed trusted keys")
---
 security/keys/trusted-keys/trusted_dcp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/security/keys/trusted-keys/trusted_dcp.c b/security/keys/trusted-keys/trusted_dcp.c
index b5f81a05be36..b0947f072a98 100644
--- a/security/keys/trusted-keys/trusted_dcp.c
+++ b/security/keys/trusted-keys/trusted_dcp.c
@@ -222,7 +222,7 @@ static int trusted_dcp_seal(struct trusted_key_payload *p, char *datablob)
 		return ret;
 	}
 
-	b->payload_len = get_unaligned_le32(&p->key_len);
+	put_unaligned_le32(p->key_len, &b->payload_len);
 	p->blob_len = blen;
 	return 0;
 }
-- 
2.35.3


