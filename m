Return-Path: <keyrings+bounces-72-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BE677E5151
	for <lists+keyrings@lfdr.de>; Wed,  8 Nov 2023 08:47:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6FC70B20C26
	for <lists+keyrings@lfdr.de>; Wed,  8 Nov 2023 07:47:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D23CFD300;
	Wed,  8 Nov 2023 07:46:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: keyrings@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83FB6D2EF
	for <keyrings@vger.kernel.org>; Wed,  8 Nov 2023 07:46:57 +0000 (UTC)
X-Greylist: delayed 571 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 07 Nov 2023 23:46:55 PST
Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8BE6113;
	Tue,  7 Nov 2023 23:46:55 -0800 (PST)
Received: from localhost (unknown [124.16.138.129])
	by APP-03 (Coremail) with SMTP id rQCowAB3fDyfOktlDpduAw--.10026S2;
	Wed, 08 Nov 2023 15:37:03 +0800 (CST)
From: Chen Ni <nichen@iscas.ac.cn>
To: zohar@linux.ibm.com,
	dhowells@redhat.com,
	jarkko@kernel.org,
	paul@paul-moore.com,
	jmorris@namei.org,
	serge@hallyn.com,
	sumit.garg@linaro.org,
	yaelt@google.com
Cc: linux-integrity@vger.kernel.org,
	keyrings@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen Ni <nichen@iscas.ac.cn>
Subject: [PATCH] KEYS: encrypted: Add check for strsep
Date: Wed,  8 Nov 2023 07:36:27 +0000
Message-Id: <20231108073627.1063464-1-nichen@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowAB3fDyfOktlDpduAw--.10026S2
X-Coremail-Antispam: 1UD129KBjvdXoW7XF1DKw4UJw1kCrW8uF15urg_yoW3KFX_Cr
	yUAF1rJ3yDZF18WrWUX3y8Aw1Svr95J348ur9rKF1vy34Fqw40qFy7JFs7AFZ5Cry0qF1j
	krs8try8A3ZrWjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbVxFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j
	6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
	n2kIc2xKxwCY02Avz4vE14v_GF4l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr
	0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY
	17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcV
	C0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY
	6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa
	73UjIFyTuYvjfUYMKZDUUUU
X-Originating-IP: [124.16.138.129]
X-CM-SenderInfo: xqlfxv3q6l2u1dvotugofq/

Add check for strsep() in order to transfer the error.

Fixes: cd3bc044af48 ("KEYS: encrypted: Instantiate key with user-provided decrypted data")
Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
---
 security/keys/encrypted-keys/encrypted.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/security/keys/encrypted-keys/encrypted.c b/security/keys/encrypted-keys/encrypted.c
index 8af2136069d2..76f55dd13cb8 100644
--- a/security/keys/encrypted-keys/encrypted.c
+++ b/security/keys/encrypted-keys/encrypted.c
@@ -237,6 +237,10 @@ static int datablob_parse(char *datablob, const char **format,
 			break;
 		}
 		*decrypted_data = strsep(&datablob, " \t");
+		if (!*decrypted_data) {
+			pr_info("encrypted_key: decrypted_data is missing\n");
+			break;
+		}
 		ret = 0;
 		break;
 	case Opt_load:
-- 
2.25.1


