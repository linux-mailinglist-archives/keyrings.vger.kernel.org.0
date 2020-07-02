Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8DBA8211F53
	for <lists+keyrings@lfdr.de>; Thu,  2 Jul 2020 10:57:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726362AbgGBI5g (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 2 Jul 2020 04:57:36 -0400
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:44503 "EHLO
        wout2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727991AbgGBI5f (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 2 Jul 2020 04:57:35 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.west.internal (Postfix) with ESMTP id E52A3A00;
        Thu,  2 Jul 2020 04:57:34 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Thu, 02 Jul 2020 04:57:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.fm; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm3; bh=nGPU66UAkhcTc
        RctQDVtC/KEDsFxt43B2g6dUlMAEyM=; b=k0V8XCvRnlVRw+DDbJIkKxNaQj7dF
        GJ4U8/Uheg7178AC+Vg6A2fP67HQ1KM7Atk9jSmFszHOCC2W62clrznZg2mbB1E8
        4rTiKHgBRJ7zLbDXvUV2lLwuMDBbAwF7KcluNcN8NfPudut+xx9B0z8VZCwF3eHN
        O/jQOXUcodPQGXUz6YnvTePCCS9U0th0SeBvMEwQPBWAAftCJiPWoZXou3xL5hP7
        DPXA/fvIjniNLSbJYrYQ7hfScz8KGKzgbzgvLIdfPWUxq5o0xnRA2RjW8NDJZr9x
        szAMx/cI0HlVZDgM1Wpn0fclHLT+HrkI1pe2DtCipzPN42Zepx3FqbJsw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; bh=nGPU66UAkhcTcRctQDVtC/KEDsFxt43B2g6dUlMAEyM=; b=L65gAjn7
        7XMCfcTDUOo0xxCgvRQV/lB4J15OQWiFYlhEMBvIQgIMIIDYH2UHYA6NNisdR+dE
        2v8oHvrCcuGH+cwOh/508UCkgHZnOv2OAz9WP4Tot9B0yM1BTgLny1JCSEu//5t7
        xvZ7+EyKZOs4zfUsV3AeloxCGFWpMRFmMg56pu9+9y0BwUFLRW5/G87X/9t3QCEu
        abXFUMzS0ueDPQG9pa2r5rkLrOKqcU/pzD2TlI4gkpnPVIXyzQvvMXMSvrVbAh68
        jHw2hW2Wq404hbnXN27pFWzxSK9lg9+Wx48vRsYARnszY/vjpXuEh1y1lmCMzpaz
        +B/Na7BTBHU8LA==
X-ME-Sender: <xms:fqH9XsZ-DrICPvll0COlgDbWWZGtjt0sUL_mS4X134x6QsMdx62OLw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrtdeggddthecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepvehhrhhishht
    ohhphhgvucgguhdquehruhhgihgvrhcuoegtvhhusghruhhgihgvrhesfhgrshhtmhgrih
    hlrdhfmheqnecuggftrfgrthhtvghrnhepkeejteetgfeitedvkeduveduuddvvdeuteel
    hfeiveffheduhfevuedtvefgkeffnecukfhppeekiedrvdegjedrudeiuddrvddvieenuc
    evlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegtvhhusghr
    uhhgihgvrhesfhgrshhtmhgrihhlrdhfmh
X-ME-Proxy: <xmx:fqH9Xnb6j7C4Cliu4kkNsy0lw_2h6KOLvCqEAFA1GSORq6dW8f2lkw>
    <xmx:fqH9Xm8AfLhAJgevt-osJAXgQqbj2iLKQBO6yI-XyPiALIr6Ao1zLw>
    <xmx:fqH9XmpVZ-LkTwuZVEYY7qFeEJmSAs1X5cq0ls4xEGHG6hXfS9cc5Q>
    <xmx:fqH9XmQcmfW61GWXO4HCHFwFBfwmzgDmVND66FHiJlKcRdPUtyPRJg>
Received: from rakis.home (lfbn-idf2-1-711-226.w86-247.abo.wanadoo.fr [86.247.161.226])
        by mail.messagingengine.com (Postfix) with ESMTPA id EAF98306005C;
        Thu,  2 Jul 2020 04:57:33 -0400 (EDT)
From:   Christophe Vu-Brugier <cvubrugier@fastmail.fm>
To:     keyrings@vger.kernel.org
Cc:     David Howells <dhowells@redhat.com>,
        =?UTF-8?q?Stephan=20M=C3=BCller?= <smueller@chronox.de>,
        Christophe Vu-Brugier <cvubrugier@fastmail.fm>
Subject: [PATCH 4/4] Fix error when a C++ program is linked with libkeyutils
Date:   Thu,  2 Jul 2020 10:57:23 +0200
Message-Id: <20200702085723.7026-5-cvubrugier@fastmail.fm>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200702085723.7026-1-cvubrugier@fastmail.fm>
References: <20200702085723.7026-1-cvubrugier@fastmail.fm>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Declare all the functions as extern "C" in keyutils.h to instruct a
C++ compiler that these functions are not mangled.

Signed-off-by: Christophe Vu-Brugier <cvubrugier@fastmail.fm>
---
 keyutils.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/keyutils.h b/keyutils.h
index bdecf15..4ae81d3 100644
--- a/keyutils.h
+++ b/keyutils.h
@@ -15,6 +15,10 @@
 #include <sys/types.h>
 #include <stdint.h>
 
+#ifdef __cplusplus
+extern "C" {
+#endif
+
 extern const char keyutils_version_string[];
 extern const char keyutils_build_string[];
 
@@ -268,4 +272,8 @@ extern int recursive_session_key_scan(recursive_key_scanner_t func, void *data);
 extern key_serial_t find_key_by_type_and_desc(const char *type, const char *desc,
 					      key_serial_t destringid);
 
+#ifdef __cplusplus
+}
+#endif
+
 #endif /* KEYUTILS_H */
-- 
2.27.0

