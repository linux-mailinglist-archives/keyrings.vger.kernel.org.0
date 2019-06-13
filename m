Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0F3D543EC2
	for <lists+keyrings@lfdr.de>; Thu, 13 Jun 2019 17:53:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731634AbfFMPwp (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 13 Jun 2019 11:52:45 -0400
Received: from hmm.wantstofly.org ([138.201.34.84]:45238 "EHLO
        mail.wantstofly.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731636AbfFMPwn (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 13 Jun 2019 11:52:43 -0400
Received: by mail.wantstofly.org (Postfix, from userid 1000)
        id 6E9D680503; Thu, 13 Jun 2019 18:45:49 +0300 (EEST)
Date:   Thu, 13 Jun 2019 18:45:49 +0300
From:   Lennert Buytenhek <buytenh@wantstofly.org>
To:     David Howells <dhowells@redhat.com>, keyrings@vger.kernel.org
Subject: [PATCH 1/3] Fix 'keyctl pkey_query' argument parsing
Message-ID: <20190613154549.GD9017@wantstofly.org>
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

keyctl's pkey_* operations each have an argument that allows specifying
a key password, but since that feature isn't currently supported, it
is supposed to always be passed in as "0":

	if (strcmp(argv[2], "0") != 0) {
		fprintf(stderr, "Password passing is not yet supported\n");
		exit(2);
	}

However, act_keyctl_pkey_query() has an off-by-one that makes it
start parsing key=value style option pairs at the password argument,
which causes the following error if the password argument is not in
key=value format:

	$ keyctl pkey_query 541826697 0
	Option not in key=val form
	$

And this error if the password argument is in key=value format:

	$ keyctl pkey_query 541826697 a=b
	Password passing is not yet supported
	$

This patch fixes act_keyctl_pkey_query() to start parsing key=value
pairs from the right place in its argument list, which gets it a
little further.

Signed-off-by: Lennert Buytenhek <buytenh@wantstofly.org>
---
 keyctl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/keyctl.c b/keyctl.c
index aeb92e8..5b0aeeb 100644
--- a/keyctl.c
+++ b/keyctl.c
@@ -1900,7 +1900,7 @@ static void act_keyctl_pkey_query(int argc, char *argv[])
 
 	if (argc < 3)
 		format();
-	pkey_parse_info(argv + 2, info);
+	pkey_parse_info(argv + 3, info);
 
 	key = get_key_id(argv[1]);
 	if (strcmp(argv[2], "0") != 0) {
-- 
2.21.0
