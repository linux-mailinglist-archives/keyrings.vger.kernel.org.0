Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 97082211F4F
	for <lists+keyrings@lfdr.de>; Thu,  2 Jul 2020 10:57:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726975AbgGBI5d (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 2 Jul 2020 04:57:33 -0400
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:58139 "EHLO
        wout2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726362AbgGBI5d (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 2 Jul 2020 04:57:33 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.west.internal (Postfix) with ESMTP id 9983BAF4;
        Thu,  2 Jul 2020 04:57:32 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Thu, 02 Jul 2020 04:57:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.fm; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=fm3; bh=IS0yYgsN7rWTAcDYRV/zUGwJtn
        VGzNF2FERcbBeP+YQ=; b=WX3Nroe3mGsepVrAeMt3tns9Oeup6HV1PTDMkfp+uM
        u49L3qozti0HCa0LGDNfH80RekpgbY5s+3xqbO2VpTkEcYc+RshEpn31AZDyeGGe
        3G+x50gvTbA4KXCR8Q56+kibV2ODKYQ1CIkpxuanocVMun3tTWbF4jyznudUlqnQ
        XSTqRgy2vUzrP0qANlHr0FCsrBg1Ttxuw9Tjwo/xzWmcZ7lYy2GlPAv1sFq06Z3Q
        oZFRkA/Tc3DjhF7RrMsdnaiboTksAzwGMo9wYssD5w6WtchORuEQoT38Mkl2SkDL
        YnRQer2TlfCsc4tnGEYIj46abOE5R19j4E7iNf6EuwLA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=IS0yYgsN7rWTAcDYR
        V/zUGwJtnVGzNF2FERcbBeP+YQ=; b=u+o58ODyOzPH3M1ZLGpqc4cXf51cZfPCy
        eLl2y9yC+gY/BJzShtQCodXTAo+8+5DmYQMj5M5rEAGRFxQO3CBmwda1ziIh/3XZ
        JXgDVdEoP3zLFfRwkGL//yAU1dszit7bJ03SxetSuzlU5Mx15rYHV2uPu1O+mIOd
        fVHnNESMtaJgNPLjq39bE96ke3WkwHz39GwuHvH4jFiSg8WEZY6rhfvAspxLZ9gV
        bBCTHJQMJke9DhsVxonvhRUvEkQHMG3ysdv/Iqaxh3vPeq5zFRunBmUjsuFnK2FO
        SVeknGYLGPCDwZ7Nb2xXh3jfZgBoKZ1PVgxHVHX16q+BbUP0q63DA==
X-ME-Sender: <xms:e6H9XninqPWFziDs2Ej_zByzmz4ZBG9zbhLX5u4-NUS8DOU7zHZcSw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrtdeggddthecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvffufffkofgggfestdekredtredttdenucfhrhhomhepvehhrhhishhtohhp
    hhgvucgguhdquehruhhgihgvrhcuoegtvhhusghruhhgihgvrhesfhgrshhtmhgrihhlrd
    hfmheqnecuggftrfgrthhtvghrnhepkeeftdffjeetvdfgleegtdfgvdekfffgffeiieel
    ueelkedugfetgeetieegkedunecukfhppeekiedrvdegjedrudeiuddrvddvieenucevlh
    hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegtvhhusghruhhg
    ihgvrhesfhgrshhtmhgrihhlrdhfmh
X-ME-Proxy: <xmx:e6H9XkA629mOxSdSbet4m5L_sOF--JxSkgH2pEGKXC0DWO_4TW3HvA>
    <xmx:e6H9XnGlDeMkdIiWT8pGbwplWx_aWOtaYv_Za_fZHRKb00MRDDespg>
    <xmx:e6H9XkRjgrY0qc-gIPhPyMxldXss7KNxT2T8DHfRGd-M8fGILUFFnQ>
    <xmx:fKH9XqafJf91DjbY09lPPpmW8wHxBOKT4Nolu3FHv-xOpSiLNUSl2w>
Received: from rakis.home (lfbn-idf2-1-711-226.w86-247.abo.wanadoo.fr [86.247.161.226])
        by mail.messagingengine.com (Postfix) with ESMTPA id 39C30306006E;
        Thu,  2 Jul 2020 04:57:31 -0400 (EDT)
From:   Christophe Vu-Brugier <cvubrugier@fastmail.fm>
To:     keyrings@vger.kernel.org
Cc:     David Howells <dhowells@redhat.com>,
        =?UTF-8?q?Stephan=20M=C3=BCller?= <smueller@chronox.de>,
        Christophe Vu-Brugier <cvubrugier@fastmail.fm>
Subject: [PATCH 0/4] keyutils: fix compilation error with C++
Date:   Thu,  2 Jul 2020 10:57:19 +0200
Message-Id: <20200702085723.7026-1-cvubrugier@fastmail.fm>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

These patches are for the userspace keyutils program and library.

While working on a C++ program that could take advantage of the
keyutils library, I observed that the compilation fails because the
"keyutils.h" header file contains a parameter named "private" which is
a C++ reserved keyword.

* Patch #1 fixes a few typos in the man pages.
* Patch #2 fixes the aforementioned issue.
* Patch #3 helps prevent a similar issue from happening in the future.
* Patch #4 fixes an issue reported by C++ compilers at link time.

With best regards,

Christophe Vu-Brugier (4):
  man: fix typos
  Fix compilation error when keyutils.h is used in C++
  Check that keyutils.h has valid C++ syntax at build time
  Fix error when a C++ program is linked with libkeyutils

 Makefile                  | 16 +++++++++++++++-
 keyutils.c                |  4 ++--
 keyutils.h                | 10 +++++++++-
 man/keyctl.3              |  4 ++--
 man/keyctl_capabilities.3 |  2 +-
 man/keyctl_chown.3        |  2 +-
 man/keyctl_clear.3        |  3 +--
 man/keyctl_link.3         |  3 +--
 man/keyctl_move.3         |  3 +--
 man/keyctl_read.3         |  3 +--
 man/keyctl_revoke.3       |  2 +-
 man/keyctl_set_timeout.3  |  2 +-
 man/keyctl_setperm.3      |  2 +-
 man/keyctl_update.3       |  2 +-
 14 files changed, 38 insertions(+), 20 deletions(-)

-- 
2.27.0

