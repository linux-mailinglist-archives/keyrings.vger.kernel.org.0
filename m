Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F3423211F52
	for <lists+keyrings@lfdr.de>; Thu,  2 Jul 2020 10:57:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728043AbgGBI5f (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 2 Jul 2020 04:57:35 -0400
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:56429 "EHLO
        wout2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726362AbgGBI5f (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 2 Jul 2020 04:57:35 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.west.internal (Postfix) with ESMTP id 4D834B31;
        Thu,  2 Jul 2020 04:57:34 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Thu, 02 Jul 2020 04:57:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.fm; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm3; bh=47rOrkr64p6EL
        fWCyoyqqH7kZXEHBBa+RTVzkNJ7LI8=; b=EDJ86qGeTnSPZWCS3LZyvMJrO4f07
        OetLqAQdRAi6vav7AjYlSX5YzTPdyp8MUQg7OAR4taYfTFwoFZ6tuRfE4pRtLcJX
        nPieMWZykhEFT2cY9WR5Zee/+xdnfLjjeVwEBBRheNMfkBe4S7jYQwKV4Xm1pHWm
        bYNNxw/Jtg81mvo+D1Lw1B5fKq9ic1RXPDSGLtkXehmtFnvYe1eRs9ttZyww3yVs
        zCdxntoY62gGnl+wNSEeB57AKP5GxqI0HhybWW4ViPXU4PJcOcwZ9mr+gPJzJQ32
        oSDUCMDCZOjfihmNfc9oxp8Iel9ctvDI9uORMbFNVkHp/XZWOBuyUg9Wg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; bh=47rOrkr64p6ELfWCyoyqqH7kZXEHBBa+RTVzkNJ7LI8=; b=NL86Av/I
        YSCkBV2iwluI9aNnHGJ+nXTU0mHj4hZsn4IBLQ0FHEUHHvWLu6YqyLRlY5wQn5kK
        yUAyPWyxcGycaKJZm/jzQWHaIOFEkIr2hdAgs62f/EmelXL6zrE8+n5hAXuCx3Z4
        Du2nIBjLlQmBIfanBnTdsEQ+eiUKmrwc2J0MH3ns7GFTvhrkxeJ36wFe3wdeDvl3
        KjzFoh70yrJd6wgpfWQPgnZp3C0J65IKuwlg7fqDx+N86YbxokXALaO51WJHctXD
        qTPGObu7Pmvop3tJFvcGrxW2Iun/egOi1Br4GHgGHb4qFcGx7LIlfpKddZTxWEOP
        I6+7CJ8v6twqOQ==
X-ME-Sender: <xms:faH9XotWGslj29KTqWfpWc6jtgGueMls3lsKkjsXcn1gdGDbH26KRw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrtdeggddthecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepvehhrhhishht
    ohhphhgvucgguhdquehruhhgihgvrhcuoegtvhhusghruhhgihgvrhesfhgrshhtmhgrih
    hlrdhfmheqnecuggftrfgrthhtvghrnhepkeejteetgfeitedvkeduveduuddvvdeuteel
    hfeiveffheduhfevuedtvefgkeffnecukfhppeekiedrvdegjedrudeiuddrvddvieenuc
    evlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegtvhhusghr
    uhhgihgvrhesfhgrshhtmhgrihhlrdhfmh
X-ME-Proxy: <xmx:faH9XlfXEeSnOw7CecXiz2PmX3GQXM7ZikEUp4T3JOQkImjZCq1tNw>
    <xmx:faH9XjwypRCTrIOfjRxOOxXFd_R9YrytO7R9sWm_eB0o14KVjjUWeA>
    <xmx:faH9XrO3qx0bDg-12XAMvp1z4pRN1AUJZjvxuzr0OkgJIlMbMj51kw>
    <xmx:faH9XtHad27kK_14YbKMX9aUrnEkWdEPAu8ck_hyDLPu83XfYoo_xw>
Received: from rakis.home (lfbn-idf2-1-711-226.w86-247.abo.wanadoo.fr [86.247.161.226])
        by mail.messagingengine.com (Postfix) with ESMTPA id 4531F306006C;
        Thu,  2 Jul 2020 04:57:33 -0400 (EDT)
From:   Christophe Vu-Brugier <cvubrugier@fastmail.fm>
To:     keyrings@vger.kernel.org
Cc:     David Howells <dhowells@redhat.com>,
        =?UTF-8?q?Stephan=20M=C3=BCller?= <smueller@chronox.de>,
        Christophe Vu-Brugier <cvubrugier@fastmail.fm>
Subject: [PATCH 3/4] Check that keyutils.h has valid C++ syntax at build time
Date:   Thu,  2 Jul 2020 10:57:22 +0200
Message-Id: <20200702085723.7026-4-cvubrugier@fastmail.fm>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200702085723.7026-1-cvubrugier@fastmail.fm>
References: <20200702085723.7026-1-cvubrugier@fastmail.fm>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Signed-off-by: Christophe Vu-Brugier <cvubrugier@fastmail.fm>
---
 Makefile | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 6f79446..949ad7c 100644
--- a/Makefile
+++ b/Makefile
@@ -1,5 +1,6 @@
 CPPFLAGS	:= -I.
 CFLAGS		:= -g -Wall -Werror
+CXXFLAGS	:= -g -Wall -Werror
 INSTALL		:= install
 DESTDIR		:=
 SPECFILE	:= keyutils.spec
@@ -99,7 +100,7 @@ endif
 # Normal build rule
 #
 ###############################################################################
-all: keyctl request-key key.dns_resolver
+all: keyctl request-key key.dns_resolver cxx
 
 ###############################################################################
 #
@@ -163,6 +164,18 @@ key.dns_resolver: key.dns_resolver.o dns.afsdb.o $(LIB_DEPENDENCY)
 key.dns_resolver.o: key.dns_resolver.c key.dns.h
 dns.afsdb.o: dns.afsdb.c key.dns.h
 
+###############################################################################
+#
+# Check that the header file has valid C++ syntax
+#
+###############################################################################
+cxx.stamp: keyutils.h Makefile
+	$(CXX) $(CPPFLAGS) $(CXXFLAGS) -x c++-header -fsyntax-only $<
+	touch $@
+
+cxx: cxx.stamp
+.PHONY: cxx
+
 ###############################################################################
 #
 # Install everything
@@ -244,6 +257,7 @@ clean:
 	$(RM) keyctl request-key key.dns_resolver
 	$(RM) *.o *.os *~
 	$(RM) debugfiles.list debugsources.list
+	$(RM) cxx.stamp
 
 distclean: clean
 	$(RM) -r rpmbuild $(TARBALL)
-- 
2.27.0

