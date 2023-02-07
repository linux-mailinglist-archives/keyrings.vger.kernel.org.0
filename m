Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1CF2468E3B8
	for <lists+keyrings@lfdr.de>; Tue,  7 Feb 2023 23:56:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229953AbjBGW4B (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 7 Feb 2023 17:56:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230020AbjBGW4B (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Tue, 7 Feb 2023 17:56:01 -0500
X-Greylist: delayed 2401 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 07 Feb 2023 14:55:44 PST
Received: from 8.mo552.mail-out.ovh.net (8.mo552.mail-out.ovh.net [46.105.37.156])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F8623FF0D
        for <keyrings@vger.kernel.org>; Tue,  7 Feb 2023 14:55:43 -0800 (PST)
Received: from mxplan6.mail.ovh.net (unknown [10.109.143.167])
        by mo552.mail-out.ovh.net (Postfix) with ESMTPS id CF16E2AD17;
        Tue,  7 Feb 2023 21:40:08 +0000 (UTC)
Received: from jwilk.net (37.59.142.98) by DAG4EX1.mxp6.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.17; Tue, 7 Feb
 2023 22:40:07 +0100
Authentication-Results: garm.ovh; auth=pass (GARM-98R0027e1dff29-49c4-4d74-ac55-70a6cb208233,
                    4730C7FD3C8BF8B026F70320F7F88D0531F9AA9D) smtp.auth=jwilk@jwilk.net
X-OVh-ClientIp: 5.172.255.80
From:   Jakub Wilk <jwilk@jwilk.net>
To:     Michael Kerrisk <mtk.manpages@gmail.com>,
        Alejandro Colomar <alx.manpages@gmail.com>
CC:     <linux-man@vger.kernel.org>, <keyrings@vger.kernel.org>,
        David Howells <dhowells@redhat.com>,
        Helge Kreutzmann <debian@helgefjell.de>
Subject: [PATCH] persistent-keyring.7: wfix
Date:   Tue, 7 Feb 2023 22:40:04 +0100
Message-ID: <20230207214004.6013-1-jwilk@jwilk.net>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [37.59.142.98]
X-ClientProxiedBy: DAG8EX2.mxp6.local (172.16.2.72) To DAG4EX1.mxp6.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 59318cd8-1317-487a-8ddd-7574c6e79045
X-Ovh-Tracer-Id: 14211108627914348393
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrudegkedgudegkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffoggfgtghisehtkeertdertddtnecuhfhrohhmpeflrghkuhgsucghihhlkhcuoehjfihilhhksehjfihilhhkrdhnvghtqeenucggtffrrghtthgvrhhnpeefhfetfffhffehtedufedvfeehfffgudeljeehieetiefhfeffjeevleejveehieenucfkphepuddvjedrtddrtddruddpfeejrdehledrudegvddrleeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeojhifihhlkhesjhifihhlkhdrnhgvtheqpdhnsggprhgtphhtthhopedupdhrtghpthhtohepmhhtkhdrmhgrnhhprghgvghssehgmhgrihhlrdgtohhmpdgrlhigrdhmrghnphgrghgvshesghhmrghilhdrtghomhdplhhinhhugidqmhgrnhesvhhgvghrrdhkvghrnhgvlhdrohhrghdpkhgvhihrihhnghhssehvghgvrhdrkhgvrhhnvghlrdhorhhgpdguhhhofigvlhhlshesrhgvughhrghtrdgtohhmpdguvggsihgrnheshhgvlhhgvghfjhgvlhhlrdguvgdpoffvtefjohhsthepmhhoheehvddpmhhouggvpehsmhhtphhouhht
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Reported-by: Helge Kreutzmann <debian@helgefjell.de>
Signed-off-by: Jakub Wilk <jwilk@jwilk.net>
---

I have no idea what I'm doing, but the original text was confusing,
and changing "key" to "keyring" seems consistent with other
documentation (keyrings.7, keyctl_get_persistent.3).

 man7/persistent-keyring.7 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/man7/persistent-keyring.7 b/man7/persistent-keyring.7
index 2a7fe49c2..bf3e33ef5 100644
--- a/man7/persistent-keyring.7
+++ b/man7/persistent-keyring.7
@@ -33,7 +33,7 @@ operation, it will be automatically created.
 Each time the
 .BR keyctl_get_persistent (3)
 operation is performed,
-the persistent key's expiration timer is reset to the value in:
+the persistent keyring's expiration timer is reset to the value in:
 .PP
 .in +4n
 .EX
@@ -44,7 +44,7 @@ the persistent key's expiration timer is reset to the value in:
 Should the timeout be reached,
 the persistent keyring will be removed and
 everything it pins can then be garbage collected.
-The key will then be re-created on a subsequent call to
+The keyring will then be re-created on a subsequent call to
 .BR keyctl_get_persistent (3).
 .PP
 The persistent keyring is not directly searched by
-- 
2.39.1

