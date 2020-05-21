Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1862B1DC71B
	for <lists+keyrings@lfdr.de>; Thu, 21 May 2020 08:43:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726892AbgEUGnf (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 21 May 2020 02:43:35 -0400
Received: from smtp25.cstnet.cn ([159.226.251.25]:36040 "EHLO cstnet.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726506AbgEUGnf (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Thu, 21 May 2020 02:43:35 -0400
X-Greylist: delayed 528 seconds by postgrey-1.27 at vger.kernel.org; Thu, 21 May 2020 02:41:29 EDT
Received: from localhost.localdomain (unknown [159.226.5.100])
        by APP-05 (Coremail) with SMTP id zQCowAAniLF8IMZeH_FaAw--.34692S2;
        Thu, 21 May 2020 14:32:29 +0800 (CST)
From:   Xu Wang <vulab@iscas.ac.cn>
To:     dhowells@redhat.com, dwmw2@infradead.org, keyrings@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org
Subject: [PATCH] scrpits: Remove unneeded assignment parentheses
Date:   Thu, 21 May 2020 06:32:26 +0000
Message-Id: <20200521063226.7434-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: zQCowAAniLF8IMZeH_FaAw--.34692S2
X-Coremail-Antispam: 1UD129KBjvdXoW7GF1fAFy5tr4xArW8urW3Wrg_yoWDArcEkr
        Z7KF1kXa4DX3yYyr1xXrs5Arn3Zw45JrWfCw1IgFWUZ3yUCan5X3Z2krn8Zr43ArW8CFWv
        v3s2qrW8KayxWjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUb2kYjsxI4VWkCwAYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I
        6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
        8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0
        cI8IcVCY1x0267AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwV
        C2z280aVCY1x0267AKxVWxJr0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xv
        F2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r
        4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCY02Avz4vE14v_GF1l42xK
        82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGw
        C20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48J
        MIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMI
        IF0xvE42xK8VAvwI8IcIk0rVWrZr1j6s0DMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvE
        x4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU0oE_tUUUUU==
X-Originating-IP: [159.226.5.100]
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiCwEDA1z4jTqeNQAAsy
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Remove unneeded assignment parentheses.

Signed-off-by: Xu Wang <vulab@iscas.ac.cn>
---
 scripts/extract-cert.c | 2 +-
 scripts/sign-file.c    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/extract-cert.c b/scripts/extract-cert.c
index b071bf476fea..8005911926b8 100644
--- a/scripts/extract-cert.c
+++ b/scripts/extract-cert.c
@@ -61,7 +61,7 @@ static void drain_openssl_errors(void)
 
 #define ERR(cond, fmt, ...)				\
 	do {						\
-		bool __cond = (cond);			\
+		bool __cond = cond;			\
 		display_openssl_errors(__LINE__);	\
 		if (__cond) {				\
 			err(1, fmt, ## __VA_ARGS__);	\
diff --git a/scripts/sign-file.c b/scripts/sign-file.c
index fbd34b8e8f57..9ea08b07a0aa 100644
--- a/scripts/sign-file.c
+++ b/scripts/sign-file.c
@@ -104,7 +104,7 @@ static void drain_openssl_errors(void)
 
 #define ERR(cond, fmt, ...)				\
 	do {						\
-		bool __cond = (cond);			\
+		bool __cond = cond;			\
 		display_openssl_errors(__LINE__);	\
 		if (__cond) {				\
 			err(1, fmt, ## __VA_ARGS__);	\
-- 
2.17.1

