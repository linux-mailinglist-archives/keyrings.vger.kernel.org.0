Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 832C56A6D48
	for <lists+keyrings@lfdr.de>; Wed,  1 Mar 2023 14:43:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229537AbjCANnQ (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 1 Mar 2023 08:43:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229496AbjCANnP (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 1 Mar 2023 08:43:15 -0500
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4DC2D526B
        for <keyrings@vger.kernel.org>; Wed,  1 Mar 2023 05:43:11 -0800 (PST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.nyi.internal (Postfix) with ESMTP id D7DC55C011B;
        Wed,  1 Mar 2023 08:43:08 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Wed, 01 Mar 2023 08:43:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alyssa.is; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :message-id:mime-version:reply-to:sender:subject:subject:to:to;
         s=fm3; t=1677678188; x=1677764588; bh=2hzABonYKQR+ZnsUWc7y7/c4P
        wLvo2v5ZBZrVgZfBzk=; b=gzW6BWgINVTY66PRzNdJVTX6jAeiLV+YCJSR1e9gY
        miqKU7BzYVKiXlO1fqwfYdzLWj8EeyMsW55bLsp+n3I69IWhmxNigMCLX7082VPx
        4pOXW5TJjexlfdHpq6mHoRBp4qbDwK48ghnmpMmqBB67rYRY/ytliNAuT8fZLp7A
        cEXqbqufb67/1RugeSkhwMATCu3nJlzpKThEigdaUOhhU4h1HD1lrrifvmb3Iu1n
        SaOxsI7pnJEejs9rnlmMz1wjpjS9PvB/QMOLhPB/oOROWNK+x0DB4KTRuUlrkVVI
        q6Rudlrz2sSYXZmseZ3jyXw2s6HLgqIVsWnHBJYNurQ9g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:message-id
        :mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
        1677678188; x=1677764588; bh=2hzABonYKQR+ZnsUWc7y7/c4PwLvo2v5ZBZ
        rVgZfBzk=; b=r3p+bFSHlKP6CmBEGfU37HUTftl0kRRJGESCX9PYI9s6hjAOJfE
        lx0S5OU10IBHX67DAyUkser6tjghPbH7+uIfAEXD2w9Jwr8Yyvb+2BMHYI4suhyv
        0JvyVGzxJ26wyOFGbWjX2KvQx2x16Odd6HgucYCQhy3N431/1nJ57lD0F6gpM+kt
        cHTXYAfTv3GKH6MHRjxfCidMnprKm838u40SyjbStYoaM4bnXXUGA7tudgBfOYKk
        JLAL0RyNx7jn6HXxHRCs0U2tw3e8lnSAoZHfrlTT471lPdm8TZMvy1kleiif4tif
        /IPkjmOS1WCjw6LFx+H7LbpkRIqz57cF+iw==
X-ME-Sender: <xms:bFb_Y1-PeilOgzQUunRlGD7IlHWeKZh-K1XhH6IPg9Q78fElV6lh_g>
    <xme:bFb_Y5uBiJvOTPHxd8JYQVTQZr0OsqKNoJ-sTvdfigXKSiUlwcCYvXMgs3S5l7HcF
    NvawarmgjquWG_8Yw>
X-ME-Received: <xmr:bFb_YzDJ1LlIOmSqVGE3aX95DIZxWuGuzS5PtU4AQE2YrbNSJg4gV68fXOfir0ZeSj28cgi2ZBEEzyI9UIuFo3dr5V2lve331A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudelhedggeekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgggfestdekredtredttdenucfhrhhomheptehlhihsshgr
    ucftohhsshcuoehhihesrghlhihsshgrrdhisheqnecuggftrfgrthhtvghrnhepheekgf
    dtveettdekuddugeeugfdujeehuefgleegtedthfffudfhheduhfduuefhnecuvehluhhs
    thgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhephhhisegrlhihshhsrg
    drihhs
X-ME-Proxy: <xmx:bFb_Y5c1fql-O5-yCHzm_k8j1IDy2R1K9AKsx1HL69Jz4oTJqVKFdw>
    <xmx:bFb_Y6M_WiSV2s6JNZ9F1oPGXKh6d9FqpEgorTmYVYKeBwORNj5GNQ>
    <xmx:bFb_Y7kmxBQRPpxoj1SO5qOneyA4eRJ5-zax-7ZfL_23SDZmPWGj2A>
    <xmx:bFb_Y0XcnymyCUng5V-_qgkFUxIABk-LXGwbqF35FjhriNQTn2vOlQ>
Feedback-ID: i12284293:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 1 Mar 2023 08:43:07 -0500 (EST)
Received: by x220.qyliss.net (Postfix, from userid 1000)
        id 002757B0; Wed,  1 Mar 2023 13:43:02 +0000 (UTC)
From:   Alyssa Ross <hi@alyssa.is>
To:     David Howells <dhowells@redhat.com>
Cc:     keyrings@vger.kernel.org, Alyssa Ross <hi@alyssa.is>
Subject: [PATCH keyutils] Fix format specifier for pointer subtraction
Date:   Wed,  1 Mar 2023 13:42:50 +0000
Message-Id: <20230301134250.301819-1-hi@alyssa.is>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Resolves the following compiler error:

keyctl_watch.c: In function 'consumer':
keyctl_watch.c:177:61: error: format '%zx' expects argument of type 'size_t', but argument 3 has type 'int' [-Werror=format=]
  177 |                                 fprintf(stderr, "NOTIFY[%03zx]: ty=%06x sy=%02x i=%08x\n",
      |                                                         ~~~~^
      |                                                             |
      |                                                             long unsigned int
      |                                                         %03x
  178 |                                         p - buffer, n.n.type, n.n.subtype, n.n.info);
      |                                         ~~~~~~~~~~
      |                                           |
      |                                           int

Signed-off-by: Alyssa Ross <hi@alyssa.is>
---
 keyctl_watch.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/keyctl_watch.c b/keyctl_watch.c
index a70a19a..1436c08 100644
--- a/keyctl_watch.c
+++ b/keyctl_watch.c
@@ -179,7 +179,7 @@ int consumer(FILE *log, FILE *gc, int fd)
 			memcpy(&n, p, largest);
 
 			if (debug)
-				fprintf(stderr, "NOTIFY[%03zx]: ty=%06x sy=%02x i=%08x\n",
+				fprintf(stderr, "NOTIFY[%03tx]: ty=%06x sy=%02x i=%08x\n",
 					p - buffer, n.n.type, n.n.subtype, n.n.info);
 
 			len = n.n.info & WATCH_INFO_LENGTH;
-- 
2.37.1

