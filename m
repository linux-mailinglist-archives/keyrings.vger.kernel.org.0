Return-Path: <keyrings+bounces-275-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 703B7813392
	for <lists+keyrings@lfdr.de>; Thu, 14 Dec 2023 15:51:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2740E1F21441
	for <lists+keyrings@lfdr.de>; Thu, 14 Dec 2023 14:51:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C3985B1EB;
	Thu, 14 Dec 2023 14:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="Q2sX2gV5"
X-Original-To: keyrings@vger.kernel.org
Received: from out203-205-221-149.mail.qq.com (out203-205-221-149.mail.qq.com [203.205.221.149])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28B8310F;
	Thu, 14 Dec 2023 06:51:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1702565473; bh=H3iNTZBNvgXdZhYRXpFWoMYuroegG1F/IhVpJB+1qRc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Q2sX2gV5YWB2z959wk3pba0YdVVSPjDPA7qFSq+NrR11viemrcRn71Xq7nvfEx3nM
	 6cXFJndHqL36YidLQ6Z+Sk6rzJ31MX3RzrNEhYbvARhAKC5lSIVeOjpS8Gwo1nShcF
	 /saDQCwJxxFdR8jtk4oSsRvsDShcxW9x5TNBBiRs=
Received: from pek-lxu-l1.wrs.com ([111.198.225.215])
	by newxmesmtplogicsvrszc5-0.qq.com (NewEsmtp) with SMTP
	id 8568D4F3; Thu, 14 Dec 2023 22:33:22 +0800
X-QQ-mid: xmsmtpt1702564402tglr1se4s
Message-ID: <tencent_B0E34B701B7025C7BAFDBB2833BB9EE41B08@qq.com>
X-QQ-XMAILINFO: OJVlX7oey6I0WONnjsPxacehnbgXyP7N3XwoWA38eqchNHms7zPovzaIUlEICL
	 nbTMJAndYQX48YKUzJ5GGr9kwfkfxcpDAkxdXumrgxUfGWI1uspM2i2/bNX/leV7IiQitlzc5Ayc
	 lTznkyTXIO9mYtGsmgNpzIxla3A63cKnNq+n4GcubkxEAX/j0xY3+a6z197gwLhXo6566ZzH4MgV
	 krSex17eOLX9urtRGs5q4XNBPeBNfr1hltIBjvnczCgzrUhE8m/ABFEbtr2ARoRTLJBZrSd3IirS
	 1omk8a5i0s8F+vxlD73EZV0udH/2oB6uZJuBJ2Drj18HQvkquj5DYx4BD6ampiBrvCmK90Iyh8Ak
	 EgJZOSdu0t9xDMJy2Ba3hnPXdIfBIza/JR11Byu0RUW359CrOaXkf0ZKUJYi7BHH0gnp2dlpojD4
	 4/IvszBm67C/7B8eXVW46eTWy7ogwSC6BgO/DOTA2IbSvHyXciJi3d2UBiL8UCuDIliFielBjdk5
	 i7txg5dYu/fjGOPXFgLPZoVbGF00GDIpkPA4ncX/VeICz0D5KGJ+N0T19xw25awF5sJIgkIoyQ01
	 Ohf79yCIbMVr6KxUlx/guL9MEK2Id5oVIMUDCGelGN399slJELN0lHs9wAkXknBYwXQ92A84VMKN
	 OUq462f9qhmcMH5/cDfyMSLB3sY/Ew/4t6SI4V1bjeRcMH3RcIda1FAX5G43tw/njFwrpgK+mWAC
	 jGrpbt8lntG0syKWB3rF1s9zwEHdCnTCIGyYGQ6byby1cZYQU50IaRuJNTh1z3mpTT5QT/0/qaSL
	 m0ghPS1DpDC7Ca5fsh4NU0CN4I9qUBIU7R+2EvyrFsHaM6Rylu9s9W1dZjgBt97PapLvUU5+rB03
	 2tjr6xDG8PzE96jKcmaBUrd7HURTxKpSktdrz8mYaXbyWa5du6e2AyAZhAZP+tbYQ+xYAqn8VN
X-QQ-XMRINFO: NyFYKkN4Ny6FSmKK/uo/jdU=
From: Edward Adam Davis <eadavis@qq.com>
To: syzbot+94bbb75204a05da3d89f@syzkaller.appspotmail.com
Cc: davem@davemloft.net,
	dhowells@redhat.com,
	edumazet@google.com,
	jarkko@kernel.org,
	jmorris@namei.org,
	keyrings@vger.kernel.org,
	kuba@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	netdev@vger.kernel.org,
	pabeni@redhat.com,
	paul@paul-moore.com,
	serge@hallyn.com,
	syzkaller-bugs@googlegroups.com
Subject: [PATCH next] keys/dns: datalen must greater than sizeof(*v1)
Date: Thu, 14 Dec 2023 22:33:23 +0800
X-OQ-MSGID: <20231214143322.1004059-2-eadavis@qq.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <0000000000009b39bc060c73e209@google.com>
References: <0000000000009b39bc060c73e209@google.com>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: ***

bin will be forcibly converted to "struct dns_server_list_v1_header *", so it 
is necessary to compare datalen with sizeof(*v1).

Fixes: b946001d3bb1 ("keys, dns: Allow key types (eg. DNS) to be reclaimed immediately on expiry")
Reported-and-tested-by: syzbot+94bbb75204a05da3d89f@syzkaller.appspotmail.com
Signed-off-by: Edward Adam Davis <eadavis@qq.com>
---
 net/dns_resolver/dns_key.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/dns_resolver/dns_key.c b/net/dns_resolver/dns_key.c
index 3233f4f25fed..15f19521021c 100644
--- a/net/dns_resolver/dns_key.c
+++ b/net/dns_resolver/dns_key.c
@@ -104,7 +104,7 @@ dns_resolver_preparse(struct key_preparsed_payload *prep)
 
 	if (data[0] == 0) {
 		/* It may be a server list. */
-		if (datalen <= sizeof(*bin))
+		if (datalen <= sizeof(*v1))
 			return -EINVAL;
 
 		bin = (const struct dns_payload_header *)data;


