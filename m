Return-Path: <keyrings+bounces-274-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 11B35813374
	for <lists+keyrings@lfdr.de>; Thu, 14 Dec 2023 15:46:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C157E282D9B
	for <lists+keyrings@lfdr.de>; Thu, 14 Dec 2023 14:46:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 659A75AB94;
	Thu, 14 Dec 2023 14:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="pUES0AW/"
X-Original-To: keyrings@vger.kernel.org
X-Greylist: delayed 766 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 14 Dec 2023 06:46:15 PST
Received: from out203-205-221-221.mail.qq.com (out203-205-221-221.mail.qq.com [203.205.221.221])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C19D091;
	Thu, 14 Dec 2023 06:46:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1702565173; bh=VE5SKV+YEGhdG5E1RcdtzyBnDjYuoMTeuwkSmuF5ydU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=pUES0AW/5OzIKFraiHMfvYNZ2f58AGsx5c0L2r0x2zousrnXlIttsZdnGgAzTXuvA
	 eZYJI68oF+trd2mhr6yRvJHzorciRqUaCJw7zRueUNuff3q9MnpyYZxEmEBeQ6wb8u
	 nRdJSch2hJObTUR9GEyC6Hs6BHT7DJL//8Ry/5Qo=
Received: from pek-lxu-l1.wrs.com ([111.198.225.215])
	by newxmesmtplogicsvrsza7-0.qq.com (NewEsmtp) with SMTP
	id B893E434; Thu, 14 Dec 2023 22:46:09 +0800
X-QQ-mid: xmsmtpt1702565169tsuw2xoe6
Message-ID: <tencent_7D663C8936BA96F837124A4474AF76ED6709@qq.com>
X-QQ-XMAILINFO: NQR8mRxMnur97/kSRBOOAScZjvVIdlpvzlfcnilx+42vvuHEZO+csE2VrKDNHZ
	 0jhTcEmd0p4wwmnwUb8yylTMgphW1w+OlyvAETyOnF/3cIzq+6RoTYZ41/c3AHZcNHXF7VWuWV2H
	 +uWlORPNgMuDUnbU7uPXGgoYOsyzwICpgEpzEP0gEQEIYuCSlGBsjKEkY4Y9LRzWSLoMgAmLCuu+
	 6p3ZT2KmFMw68gkhEY1o4Mag7iTW+oXLT8I2GUXwr76FrYeoqMeFLWTqKYWwa3t4v9BLAck/jIOn
	 UvAFVsumz1xLvXm1nw8o8ool5JU7FUsCcX7nSyYV2cNFcesVGH7/IdRF23+rUgEyfOwNgY40cDDL
	 SY+AwpqkUeX3QzlPQ3ZZsjI+dKjcZoW/crC8kZpgUnDBP/14aezYmCMZAsHbKX72uK+n9FU3wZ5H
	 3PrZhijYZOEuTsivRkPr4XQaFATEgcJ0oaAtWgCmIw9+Vxr0PCIYnnqm9SxocdGFoz+pKKD9YrPh
	 AXxmxhiyg7edN8bDgmIwk0iZDtL9y6qrj8zb3HRLflMttK6HQKHqHAaPFCky/sk2ZxeYSftLul8F
	 Gc0CtKm75n4b2NhNeHCB3K8821GPzMKuff/veyFUjYzEDUdo+Yfxghg0b6mUr3NdxbnRtm/wtjA0
	 Yxgs6TIa09/iDI79YsxibvcmSUDKODH7Ps/N7VeqHAYQR8CqNeNCXxF1bvL3TY51MXL89BS3jYxh
	 5ytCVM0wYLa7Qx3ivjCHGAU5GgRaZldOGhzdtAjsN/unJt/AG1OrboZuGqe2R5H84IE93UuH5+Ec
	 jPX4LOLGBN3V34xCMRHa6pgAIPTHrePboTyV+zwSIUzAJnTJOOD/ggollbxyGDNcL4AxXp196kjX
	 m+rnfGJq2+xWjBPGa2KJ/LyZCs1iaUXxD1KQNLNTjF5LEZaWncEDCW2tcQzBEMVefLRClLnt74PU
	 59iIa4nRQMgR32uDlTazYgqQY29HTSpRtyfMa4oJqdbqxmlYVveNPjCuV6XtMjsA7nfIUPXzRjJc
	 adi+3fGyUhxqJzI/t7RKAPOz2wLs8=
X-QQ-XMRINFO: Mp0Kj//9VHAxr69bL5MkOOs=
From: Edward Adam Davis <eadavis@qq.com>
To: eadavis@qq.com
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
	syzbot+94bbb75204a05da3d89f@syzkaller.appspotmail.com,
	syzkaller-bugs@googlegroups.com
Subject: [PATCH V2 next] keys/dns: fix slab-out-of-bounds in dns_resolver_preparse 
Date: Thu, 14 Dec 2023 22:46:10 +0800
X-OQ-MSGID: <20231214144609.1016162-2-eadavis@qq.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <tencent_B0E34B701B7025C7BAFDBB2833BB9EE41B08@qq.com>
References: <tencent_B0E34B701B7025C7BAFDBB2833BB9EE41B08@qq.com>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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
-- 
2.43.0


