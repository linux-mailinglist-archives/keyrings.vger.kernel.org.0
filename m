Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 22F371D21F5
	for <lists+keyrings@lfdr.de>; Thu, 14 May 2020 00:23:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730064AbgEMWXT (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 13 May 2020 18:23:19 -0400
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:53669 "EHLO
        out4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731317AbgEMWXR (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 13 May 2020 18:23:17 -0400
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
        by mailout.nyi.internal (Postfix) with ESMTP id 968C15C019F;
        Wed, 13 May 2020 18:23:16 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute7.internal (MEProxy); Wed, 13 May 2020 18:23:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=benboeckel.net;
         h=from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm1; bh=FZffUgNho0ypD
        oEiIV7h58cJeteCGJ+v1MQuqeoT1Jw=; b=UtGlSivjyRvZivs5D7wpOTuhiuFbR
        4bsPHFW8cHt6U63a6JDsAx7bwwbn1QUXogleYKy0yNdbCLczQnDILmplv1fLpOqW
        vvoF9PXOyNkFoLH4IPQslSLNJIKy7jH2ePgccHs0BjQXQFzG0qNASa3JOXD090Bt
        qr5Nlpkk+U/ylXaSKMkZMgm18iqhRDLQSbnFKs/ZNk6D958WKx6AI69idGUOk6qw
        /+7tmMGg4qi+hIZmAxgUfZ2aJZouVyHqSAPsM03LBNYHF9aQWXPIy0ISPlF2rmSA
        +zIvPlvCB9IrLUYX7eze8WcEM2Tzs0F/wTQ7eJzpYKPeyX+0rUsyBIbBA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm2; bh=FZffUgNho0ypDoEiIV7h58cJeteCGJ+v1MQuqeoT1Jw=; b=oY+5o/UR
        DzwYWs1tt2s/3COnlbGLO2YDfXJlMDQwJ/I3QrBHtGnqn8z/2tLYMQxPXW8QacYF
        LcOujlodZdXm7WX8wl5A6kQqWXTL15fPlNeGY2yJr05oj5XJVSeKAv/sXPcSlMvx
        /60xI1fwmQpMsWGnMC6DZfDhiGlKFxviVzvVJ0X81nRQMMG8DKOYSTWma9n32pwe
        zKFXeC2EcQ0CAwUfWqsZlsWkA0l2GIwZKyjlOm9W2g6bbGHZa76d55fzuKwYKefU
        ZMKJFEALYoJcFpmrp7fyp9h1JggSiojNMGkJYU1E7sWHzzr1ICMDWTgpqqgnV3gU
        xraSRu6xMolQLw==
X-ME-Sender: <xms:VHO8XlQGS5PLcMhNj1R1tBVJB0X1Ls26fZ_C23gXObz1JxNrzp66_w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrleehgddtlecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
    ertddtnecuhfhrohhmpeeuvghnuceuohgvtghkvghluceomhgvsegsvghnsghovggtkhgv
    lhdrnhgvtheqnecuggftrfgrthhtvghrnhepffekheelgfetleeghfehkeefieegffeltd
    ekhfevieefheeltdffheekueehkeehnecukfhppeeiledrvddtgedrudeikedrvdeffeen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmvgessg
    gvnhgsohgvtghkvghlrdhnvght
X-ME-Proxy: <xmx:VHO8XuxFBxQocrbFU3uNaC-TSbds0esokslKvRDR5GCuUJRTCRHGkg>
    <xmx:VHO8Xq0l2yQxyi18fF1j69wYaR7rNq0joICKcWd3byDo5EQBHy4WLg>
    <xmx:VHO8XtDkh5t4srXphnyAOWN6BTmGEgJUOYecWwo0pyxCV-SWloMCyA>
    <xmx:VHO8XkfKPThPG0uEjJFzZk6vckbhL_a3LgT47a-Jqx3flSwZzGxm4Q>
Received: from localhost (cpe-69-204-168-233.nycap.res.rr.com [69.204.168.233])
        by mail.messagingengine.com (Postfix) with ESMTPA id 443E63280064;
        Wed, 13 May 2020 18:23:16 -0400 (EDT)
From:   Ben Boeckel <me@benboeckel.net>
To:     keyrings@vger.kernel.org
Cc:     Ben Boeckel <mathstuf@gmail.com>, dhowells@redhat.com
Subject: [PATCH 1/1] man: clarify that keyctl_set_reqkey_keyring(3) returns the old default
Date:   Wed, 13 May 2020 18:23:06 -0400
Message-Id: <20200513222306.870160-2-list.lkml.keyrings@me.benboeckel.net>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200513222306.870160-1-list.lkml.keyrings@me.benboeckel.net>
References: <20200513222306.870160-1-list.lkml.keyrings@me.benboeckel.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

From: Ben Boeckel <mathstuf@gmail.com>

The prose mentions this, but the return value section gave conflicting
information.

Signed-off-by: Ben Boeckel <mathstuf@gmail.com>
---
 man/keyctl_set_reqkey_keyring.3 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/man/keyctl_set_reqkey_keyring.3 b/man/keyctl_set_reqkey_keyring.3
index 00da586..6e6725e 100644
--- a/man/keyctl_set_reqkey_keyring.3
+++ b/man/keyctl_set_reqkey_keyring.3
@@ -66,8 +66,8 @@ and
 .SH RETURN VALUE
 On success
 .BR keyctl_set_reqkey_keyring ()
-returns
-.BR 0 .
+returns the serial number of the keyring which was the previous default for the
+current thread.
 On error, the value
 .B -1
 will be returned and
-- 
2.25.4

