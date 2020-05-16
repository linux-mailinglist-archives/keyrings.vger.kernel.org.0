Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D93D1D5D2D
	for <lists+keyrings@lfdr.de>; Sat, 16 May 2020 02:23:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726553AbgEPAXm (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Fri, 15 May 2020 20:23:42 -0400
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:38005 "EHLO
        wout5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726247AbgEPAXm (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Fri, 15 May 2020 20:23:42 -0400
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
        by mailout.west.internal (Postfix) with ESMTP id 89C71822;
        Fri, 15 May 2020 20:23:41 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute7.internal (MEProxy); Fri, 15 May 2020 20:23:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=benboeckel.net;
         h=from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm1; bh=+Hqp6PVoo1VZU
        7H18apqZ9Z+2BshIdfb8W1ZX6nurO8=; b=jgtwiUClPog6D8Mo6YiAza8pcnPPd
        N2jXBNnOSZuWBR5mc8rwG3yDC/QYWm3hocqV4ZJyYQ3BggTK4LOTjO8nXnOkp2ib
        IHz6ovosw9hpoKVkbgIkMw4yk6KPpKqaOMULjAH6BeaB5iXZNxBQJA8bqR5J6txB
        yKN6NKA9XTv46cHAhc3C4E/4DdlfP94HhYON+MfnReowlHUVzUZLIILYnaLCotcu
        m/WyMBQsb5KVi+UhQX3HSW8/sKIe4MjDHyUPGcUWZImcW7OUS74pE1pdknpCUzoX
        ACkk5llVx/E0o5DZS3hF0bx6s5jLXkk3F7QQY0X9fwGwyoeG4NLNq4cTA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm2; bh=+Hqp6PVoo1VZU7H18apqZ9Z+2BshIdfb8W1ZX6nurO8=; b=u6l1jEm1
        cXevcCkHF7iFnfqtINdvgckWdArj6IwXTNQQEtJa1DxQ/kYt2NUgjqcStWGwWeZC
        BHzOfp568EqpcTw08OuR4VqA+Zd1t+RSvTBE3R0XCAexGo18qoYQVTiy+sHSb8s1
        4WsZISrLsgcibSmY+ZFxbsrmAP/394FHdApN4DGBtjpYWm6TodhgBFTUb3VUPunj
        PCX5RAfuANoGU5nlm6fJlpZ2jJnAKmQvf+nztXnNDQJLesEPzrP4pxRG1/vwMMcW
        hEmSqNwixpqaGWZmbybzgHoJoZ5ms1+dVg+/rauIjXBO8MQzfP8hUpRtj38fqIVV
        toYisJEeo+QCrA==
X-ME-Sender: <xms:jTK_Xih0QC_prrRFdHtYvI7_wKcOj2WRc8kKc17Esc0AEDKT8IGtNg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrleelgddvlecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
    ertddtnecuhfhrohhmpeeuvghnuceuohgvtghkvghluceomhgvsegsvghnsghovggtkhgv
    lhdrnhgvtheqnecuggftrfgrthhtvghrnhepffekheelgfetleeghfehkeefieegffeltd
    ekhfevieefheeltdffheekueehkeehnecukfhppeeiledrvddtgedrudeikedrvdeffeen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmvgessg
    gvnhgsohgvtghkvghlrdhnvght
X-ME-Proxy: <xmx:jTK_XjCBoxNu5xfCrJCFzmKvgzMAHRdJBmQPPM9mHwhFrvJUPB2TAA>
    <xmx:jTK_XqF5T_JKgimkG0BRoWTFx1Q-1DTgy_Q-xoSInoC48oP8AEu48A>
    <xmx:jTK_XrTbbJbRRtwAtEYEWOwjnHlUH3XvZIUNk4D2rNWMhbXyFz6J5A>
    <xmx:jTK_XguqBAHUKDmOnC18RLU0IJ5feamWZzeY3cBcHgg0Zbm8pvsa0Q>
Received: from localhost (cpe-69-204-168-233.nycap.res.rr.com [69.204.168.233])
        by mail.messagingengine.com (Postfix) with ESMTPA id D0AB73066365;
        Fri, 15 May 2020 20:23:40 -0400 (EDT)
From:   Ben Boeckel <me@benboeckel.net>
To:     keyrings@vger.kernel.org
Cc:     Ben Boeckel <mathstuf@gmail.com>, dhowells@redhat.com
Subject: [PATCH 1/1] man: the info strings are actually space or tab separated
Date:   Fri, 15 May 2020 20:23:34 -0400
Message-Id: <20200516002334.2025760-2-list.lkml.keyrings@me.benboeckel.net>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200516002334.2025760-1-list.lkml.keyrings@me.benboeckel.net>
References: <20200516002334.2025760-1-list.lkml.keyrings@me.benboeckel.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

From: Ben Boeckel <mathstuf@gmail.com>

Signed-off-by: Ben Boeckel <mathstuf@gmail.com>
---
 man/keyctl_pkey_encrypt.3 | 4 ++--
 man/keyctl_pkey_query.3   | 2 +-
 man/keyctl_pkey_sign.3    | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/man/keyctl_pkey_encrypt.3 b/man/keyctl_pkey_encrypt.3
index 44c640e..5a5b71b 100644
--- a/man/keyctl_pkey_encrypt.3
+++ b/man/keyctl_pkey_encrypt.3
@@ -40,8 +40,8 @@ When invoking the function,
 .I key
 indicates the key that will provide the cryptographic material and
 .I info
-points to a comma-separated string of "key[=value]" parameters that indicate
-things like encoding forms and passwords to unlock the key; see
+points to a space- or tab-separated string of "key[=value]" parameters that
+indicate things like encoding forms and passwords to unlock the key; see
 asymmetric-key(7) for more information.
 .PP
 .IR data " and " datalen
diff --git a/man/keyctl_pkey_query.3 b/man/keyctl_pkey_query.3
index dbeb0fd..e70665f 100644
--- a/man/keyctl_pkey_query.3
+++ b/man/keyctl_pkey_query.3
@@ -32,7 +32,7 @@ When invoking the function,
 .I key
 indicates the key to be queried,
 .I info
-points to a comma-separated string of "key[=value]" parameters and
+points to a space- or tab-separated string of "key[=value]" parameters and
 .I result
 points to a buffer in which the result will be placed.
 .PP
diff --git a/man/keyctl_pkey_sign.3 b/man/keyctl_pkey_sign.3
index 2f17e73..4fb6a14 100644
--- a/man/keyctl_pkey_sign.3
+++ b/man/keyctl_pkey_sign.3
@@ -44,8 +44,8 @@ When invoking the function,
 .I key
 indicates the key that will provide the cryptographic material and
 .I info
-points to a comma-separated string of "key[=value]" parameters that indicate
-things like encoding forms and passwords to unlock the key; see
+points to a space- or tab-separated string of "key[=value]" parameters that
+indicate things like encoding forms and passwords to unlock the key; see
 asymmetric-key(7) for more information.
 .PP
 .IR data " and " datalen
-- 
2.25.4

