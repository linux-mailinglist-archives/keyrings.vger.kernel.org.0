Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 100D5211F50
	for <lists+keyrings@lfdr.de>; Thu,  2 Jul 2020 10:57:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726810AbgGBI5e (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 2 Jul 2020 04:57:34 -0400
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:44503 "EHLO
        wout2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726362AbgGBI5e (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 2 Jul 2020 04:57:34 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.west.internal (Postfix) with ESMTP id 9F76FB20;
        Thu,  2 Jul 2020 04:57:33 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Thu, 02 Jul 2020 04:57:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.fm; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm3; bh=Mh41nAClzHVkl
        S4k2i9J+7PH4YVTDDwaaoXIQg8eo7I=; b=Sml+VwRtzOotmhw+nLhRELNKqxfYQ
        iFiOpeR//kJzRHo2BFMSwr+fGcHAnkon+7pUpYxqsYtnDI8zA7H1jtPe8wTnMN3B
        wrW9euy2eLiFF8ttlFz58muv7ocBGHlvx9VkCB9wxzZqbC8d8ajbGQ5usSNOIQOl
        tAUfManjGx6OjazTuCwLZLATm0rvrkkX/+CbBFs4EpXmaEy2bY4ruVukTBH7cVAN
        fqbsik9kFC4hlT4dmRNTjHSc/fwu3mcyk2hYjrcbFjwBfP1RS94sOK0hW11Nv6cr
        5nXGs6p9plNXxP7pIlq+RYsM7jQNJ7f2cnCXfDnfDopluZtkq4DIXHRsg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; bh=Mh41nAClzHVklS4k2i9J+7PH4YVTDDwaaoXIQg8eo7I=; b=Zm0VclJY
        Lphr8u9oG+HPD4NvoNTEfXpQIAQ0XmkeyMx2pA1Ze4SnbpBeULauTbm3Us2Ma2hr
        jH1fuqamdv2fPKa364EPdrw8nXjz0DUNo+dP3Pbl6+BicMEeCI+NfSg3+Nl8rAmj
        CJ+7Oztbn0kWi3wGjbkbIMrgad/cdU/R3lrndnD/el5nJriVWBw2xVLNVYuF32jb
        QU+pNCT4eSrecdjEz8BrAsvNmoFXOut7Q5t60ojeWBPESi92YVLgtbs4RlNLSiFQ
        q6EPYBne2d1D4g3wSNOEj7vvE+c+VidAwkXvIg/WTtBc52klbhgLQtphf+TIpPfZ
        qt77fq1AAxRX4A==
X-ME-Sender: <xms:faH9Xnk0yxlLJqOM3fSAI7_wfXgExEOOKh8otBp_nEERhY8vSdIndQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrtdeggddthecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepvehhrhhishht
    ohhphhgvucgguhdquehruhhgihgvrhcuoegtvhhusghruhhgihgvrhesfhgrshhtmhgrih
    hlrdhfmheqnecuggftrfgrthhtvghrnhepkeejteetgfeitedvkeduveduuddvvdeuteel
    hfeiveffheduhfevuedtvefgkeffnecukfhppeekiedrvdegjedrudeiuddrvddvieenuc
    evlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegtvhhusghr
    uhhgihgvrhesfhgrshhtmhgrihhlrdhfmh
X-ME-Proxy: <xmx:faH9Xq0pLCLyokRuI7Fc1cXNatgE1MCOC8DfgpYcWeZHQdeg8S25oA>
    <xmx:faH9XtqEG6P_mQYMDVg7igSXtnjIeyZ5JAQnZ-AiBf6VAAvks9B5IQ>
    <xmx:faH9XvnY7vVpMpjMYpKTlpO8oHNH3p7KbkjiW70CI2Bom69tRnAyXw>
    <xmx:faH9Xi-j3t8igRPr_D0GZhX7UGZwhH0pRnvQsfl7YCJxJ9eFXclgBw>
Received: from rakis.home (lfbn-idf2-1-711-226.w86-247.abo.wanadoo.fr [86.247.161.226])
        by mail.messagingengine.com (Postfix) with ESMTPA id 931D33060076;
        Thu,  2 Jul 2020 04:57:32 -0400 (EDT)
From:   Christophe Vu-Brugier <cvubrugier@fastmail.fm>
To:     keyrings@vger.kernel.org
Cc:     David Howells <dhowells@redhat.com>,
        =?UTF-8?q?Stephan=20M=C3=BCller?= <smueller@chronox.de>,
        Christophe Vu-Brugier <cvubrugier@fastmail.fm>
Subject: [PATCH 2/4] Fix compilation error when keyutils.h is used in C++
Date:   Thu,  2 Jul 2020 10:57:21 +0200
Message-Id: <20200702085723.7026-3-cvubrugier@fastmail.fm>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200702085723.7026-1-cvubrugier@fastmail.fm>
References: <20200702085723.7026-1-cvubrugier@fastmail.fm>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

The declaration of the keyctl_dh_compute_kdf() function contains a
parameter named "private". Unfortunately, "private" is a C++ reserved
keyword. As a consequence, compiling a C++ program that includes
keyutils.h fails.

This patch renames the "private" variable to "priv" since a similar
parameter is named this way in the nearby keyctl_dh_compute()
function.

Signed-off-by: Christophe Vu-Brugier <cvubrugier@fastmail.fm>
---
 keyutils.c | 4 ++--
 keyutils.h | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/keyutils.c b/keyutils.c
index 9c37256..9877fdb 100644
--- a/keyutils.c
+++ b/keyutils.c
@@ -244,11 +244,11 @@ long keyctl_dh_compute(key_serial_t priv, key_serial_t prime,
 	return keyctl(KEYCTL_DH_COMPUTE, &params, buffer, buflen, 0);
 }
 
-long keyctl_dh_compute_kdf(key_serial_t private, key_serial_t prime,
+long keyctl_dh_compute_kdf(key_serial_t priv, key_serial_t prime,
 			   key_serial_t base, char *hashname, char *otherinfo,
 			   size_t otherinfolen, char *buffer, size_t buflen)
 {
-	struct keyctl_dh_params params = { .priv = private,
+	struct keyctl_dh_params params = { .priv = priv,
 					   .prime = prime,
 					   .base = base };
 	struct keyctl_kdf_params kdfparams = { .hashname = hashname,
diff --git a/keyutils.h b/keyutils.h
index d50119e..bdecf15 100644
--- a/keyutils.h
+++ b/keyutils.h
@@ -220,7 +220,7 @@ extern long keyctl_invalidate(key_serial_t id);
 extern long keyctl_get_persistent(uid_t uid, key_serial_t id);
 extern long keyctl_dh_compute(key_serial_t priv, key_serial_t prime,
 			      key_serial_t base, char *buffer, size_t buflen);
-extern long keyctl_dh_compute_kdf(key_serial_t private, key_serial_t prime,
+extern long keyctl_dh_compute_kdf(key_serial_t priv, key_serial_t prime,
 				  key_serial_t base, char *hashname,
 				  char *otherinfo, size_t otherinfolen,
 				  char *buffer, size_t buflen);
-- 
2.27.0

