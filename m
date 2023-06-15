Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C529731551
	for <lists+keyrings@lfdr.de>; Thu, 15 Jun 2023 12:29:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240331AbjFOK3T (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 15 Jun 2023 06:29:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241136AbjFOK3M (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 15 Jun 2023 06:29:12 -0400
Received: from 167-179-156-38.a7b39c.syd.nbn.aussiebb.net (167-179-156-38.a7b39c.syd.nbn.aussiebb.net [167.179.156.38])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3A002943;
        Thu, 15 Jun 2023 03:29:08 -0700 (PDT)
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
        by formenos.hmeau.com with smtp (Exim 4.94.2 #2 (Debian))
        id 1q9kDi-003HqK-TQ; Thu, 15 Jun 2023 18:28:51 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Thu, 15 Jun 2023 18:28:50 +0800
From:   "Herbert Xu" <herbert@gondor.apana.org.au>
Date:   Thu, 15 Jun 2023 18:28:50 +0800
Subject: [PATCH 3/5] KEYS: Add forward declaration in asymmetric-parser.h
References: <ZIrnPcPj9Zbq51jK@gondor.apana.org.au>
To:     Linus Torvalds <torvalds@linux-foundation.org>,
        Roberto Sassu <roberto.sassu@huaweicloud.com>,
        David Howells <dhowells@redhat.com>,
        Eric Biggers <ebiggers@kernel.org>,
        Stefan Berger <stefanb@linux.ibm.com>,
        Mimi Zohar <zohar@linux.ibm.com>, dmitry.kasatkin@gmail.com,
        Jarkko Sakkinen <jarkko@kernel.org>,
        Ard Biesheuvel <ardb@kernel.org>, keyrings@vger.kernel.org,
        Linux Crypto Mailing List <linux-crypto@vger.kernel.org>
Message-Id: <E1q9kDi-003HqK-TQ@formenos.hmeau.com>
X-Spam-Status: No, score=2.7 required=5.0 tests=BAYES_00,HELO_DYNAMIC_IPADDR2,
        PDS_RDNS_DYNAMIC_FP,RDNS_DYNAMIC,SPF_HELO_NONE,SPF_PASS,TVD_RCVD_IP,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Add forward declaration for struct key_preparsed_payload so that
this header file is self-contained.

Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>
---

 include/keys/asymmetric-parser.h |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/keys/asymmetric-parser.h b/include/keys/asymmetric-parser.h
index c47dc5405f79..516a3f51179e 100644
--- a/include/keys/asymmetric-parser.h
+++ b/include/keys/asymmetric-parser.h
@@ -10,6 +10,8 @@
 #ifndef _KEYS_ASYMMETRIC_PARSER_H
 #define _KEYS_ASYMMETRIC_PARSER_H
 
+struct key_preparsed_payload;
+
 /*
  * Key data parser.  Called during key instantiation.
  */
