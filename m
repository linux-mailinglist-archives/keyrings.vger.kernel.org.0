Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 74F6D43EBF
	for <lists+keyrings@lfdr.de>; Thu, 13 Jun 2019 17:53:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389638AbfFMPwn (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 13 Jun 2019 11:52:43 -0400
Received: from hmm.wantstofly.org ([138.201.34.84]:45230 "EHLO
        mail.wantstofly.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733003AbfFMPwm (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 13 Jun 2019 11:52:42 -0400
Received: by mail.wantstofly.org (Postfix, from userid 1000)
        id 9AD8380567; Thu, 13 Jun 2019 18:46:39 +0300 (EEST)
Date:   Thu, 13 Jun 2019 18:46:39 +0300
From:   Lennert Buytenhek <buytenh@wantstofly.org>
To:     David Howells <dhowells@redhat.com>, keyrings@vger.kernel.org
Subject: [PATCH 3/3] Make key=value argument list optional for
 pkey_{encrypt,decrypt,sign}
Message-ID: <20190613154639.GF9017@wantstofly.org>
References: <20190613154516.GC9017@wantstofly.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190613154516.GC9017@wantstofly.org>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

keyctl's help message suggests that including a key=value style list
of arguments is optional for the pkey_* operations, and for pkey_query
and pkey_verify it indeed seems to be optional, but the other three
operations require that at least one key=value pair be passed in.

This patch changes the logic to make key=value lists optional for
all pkey_* operations.

Signed-off-by: Lennert Buytenhek <buytenh@wantstofly.org>
---
 keyctl.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/keyctl.c b/keyctl.c
index 5b0aeeb..cf8849e 100644
--- a/keyctl.c
+++ b/keyctl.c
@@ -1935,7 +1935,7 @@ static void act_keyctl_pkey_encrypt(int argc, char *argv[])
 	void *in, *out;
 	char info[4096];
 
-	if (argc < 5)
+	if (argc < 4)
 		format();
 	pkey_parse_info(argv + 4, info);
 
@@ -1975,7 +1975,7 @@ static void act_keyctl_pkey_decrypt(int argc, char *argv[])
 	void *in, *out;
 	char info[4096];
 
-	if (argc < 5)
+	if (argc < 4)
 		format();
 	pkey_parse_info(argv + 4, info);
 
@@ -2015,7 +2015,7 @@ static void act_keyctl_pkey_sign(int argc, char *argv[])
 	void *in, *out;
 	char info[4096];
 
-	if (argc < 5)
+	if (argc < 4)
 		format();
 	pkey_parse_info(argv + 4, info);
 
-- 
2.21.0
