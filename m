Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62B15211F51
	for <lists+keyrings@lfdr.de>; Thu,  2 Jul 2020 10:57:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727943AbgGBI5e (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 2 Jul 2020 04:57:34 -0400
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:59289 "EHLO
        wout2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726810AbgGBI5d (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 2 Jul 2020 04:57:33 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.west.internal (Postfix) with ESMTP id EFB43B07;
        Thu,  2 Jul 2020 04:57:32 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Thu, 02 Jul 2020 04:57:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.fm; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm3; bh=+YsZcxp1ZA3rS
        j+KzNAvYd6Z7hnmqDO2gpNUhusH8P0=; b=I7PeIG6teugzQDBAT1BPN8XDmccDz
        ttHVyWfjyjdPlOuxAt5oGHnYwgoo1Dlv7MYrvfOXmQqRuhsptef+fEFTNF9Njxm3
        /3C+y5vGPoGLwIK5KUDl/AHU+Y/cMWQCVA2MRfCaGQ6vrpsEji9I2NWmtIl/Yy0o
        1tuX/WRumR0uFmVS9TNbplCDtvfZiiJvIQl8/3ZzfZWyG4D+ybez1BYPwgriG7DY
        mup+QVSWibjCsc1dYuOtgcCCJDtz6xDTdMNxoSkXTdl2QIyObhauUjcfCUpurTur
        LiCTVr/ejSW8+Ayc2G9WGoIY9GeBVO5mkoyQ4GtW4ZIVFq70RyF1HeYoA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; bh=+YsZcxp1ZA3rSj+KzNAvYd6Z7hnmqDO2gpNUhusH8P0=; b=OCwgZu/L
        wsTLPropSgnetjkH5QgxkjgoeuAY7fsRcV/cz/BZ/7R7PiLivHSCoDKQRYgiVKWV
        RKjCc2KGCjY+Wh34cS1S6nkDfdkWoL0mz4u60VpINTRaI5SF0epuZLrT/3ipOPp2
        p9GODkxcbbwAl1rs9mwL/e0UXeqNEV9rREH/GIlGjYWDZHhvNGA+OD+WbnglU3Nx
        i/Ln7SJrdG9JBg4kZa079vbjE70Nsl2WBXSvWt2QWkkGF5WitD/PrVreveDcW+ol
        OpYOMRRsTsTMZKwFF+0GQku44aZpxghh3J913dvn5mYqV+9iLTWBE1I+zaj9mPLz
        fyZBiFHQJlmHzQ==
X-ME-Sender: <xms:fKH9XkVSdVgS3ewS7O2sS-Dry3vRzf8jWBXKmRG9wtmDHBzFoeh4cw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrtdeggddthecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepvehhrhhishht
    ohhphhgvucgguhdquehruhhgihgvrhcuoegtvhhusghruhhgihgvrhesfhgrshhtmhgrih
    hlrdhfmheqnecuggftrfgrthhtvghrnhepkeejteetgfeitedvkeduveduuddvvdeuteel
    hfeiveffheduhfevuedtvefgkeffnecukfhppeekiedrvdegjedrudeiuddrvddvieenuc
    evlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegtvhhusghr
    uhhgihgvrhesfhgrshhtmhgrihhlrdhfmh
X-ME-Proxy: <xmx:fKH9XokhcAdGBhTtwQGJmFHwX1ny7cmqsL-d_165gT_qoIAGnuKNAA>
    <xmx:fKH9Xoa1i5jIaEjbLRuZrS7utKpnaRCVYuT_VkY0n23Dq-i7vgy9Jw>
    <xmx:fKH9XjUa_khU8QXCO3yNPNsSMHpO3K6sjUgx38fhzwsNL_vmt4iXzA>
    <xmx:fKH9Xlu9aw4hawNzQ_pJWelinozLavD8FJXcdI79NiZpYN7e_AHgNQ>
Received: from rakis.home (lfbn-idf2-1-711-226.w86-247.abo.wanadoo.fr [86.247.161.226])
        by mail.messagingengine.com (Postfix) with ESMTPA id E1377306005C;
        Thu,  2 Jul 2020 04:57:31 -0400 (EDT)
From:   Christophe Vu-Brugier <cvubrugier@fastmail.fm>
To:     keyrings@vger.kernel.org
Cc:     David Howells <dhowells@redhat.com>,
        =?UTF-8?q?Stephan=20M=C3=BCller?= <smueller@chronox.de>,
        Christophe Vu-Brugier <cvubrugier@fastmail.fm>
Subject: [PATCH 1/4] man: fix typos
Date:   Thu,  2 Jul 2020 10:57:20 +0200
Message-Id: <20200702085723.7026-2-cvubrugier@fastmail.fm>
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
 man/keyctl.3              | 4 ++--
 man/keyctl_capabilities.3 | 2 +-
 man/keyctl_chown.3        | 2 +-
 man/keyctl_clear.3        | 3 +--
 man/keyctl_link.3         | 3 +--
 man/keyctl_move.3         | 3 +--
 man/keyctl_read.3         | 3 +--
 man/keyctl_revoke.3       | 2 +-
 man/keyctl_set_timeout.3  | 2 +-
 man/keyctl_setperm.3      | 2 +-
 man/keyctl_update.3       | 2 +-
 11 files changed, 12 insertions(+), 16 deletions(-)

diff --git a/man/keyctl.3 b/man/keyctl.3
index b0f5fdc..cb0449c 100644
--- a/man/keyctl.3
+++ b/man/keyctl.3
@@ -71,9 +71,9 @@ and then telling the linker it should link in the library:
 .br
 .BR keyctl_negate (3)
 .br
-.BR keyctl_pkey_dec (3)
+.BR keyctl_pkey_decrypt (3)
 .br
-.BR keyctl_pkey_enc (3)
+.BR keyctl_pkey_encrypt (3)
 .br
 .BR keyctl_pkey_query (3)
 .br
diff --git a/man/keyctl_capabilities.3 b/man/keyctl_capabilities.3
index 63cee3c..f816df6 100644
--- a/man/keyctl_capabilities.3
+++ b/man/keyctl_capabilities.3
@@ -29,7 +29,7 @@ of the amount of buffer space available.  If the buffer is shorter than the
 data, a short copy will be made; if the buffer is larger than the data, the
 excess space will be cleared.
 .P
-If this operation is not available in the kernel, the keyutils library will be
+If this operation is not available in the kernel, the keyutils library will
 emulate it as best it can and the capability bit that indicates if the kernel
 operation is available will be cleared.
 .P
diff --git a/man/keyctl_chown.3 b/man/keyctl_chown.3
index 286bded..f85840a 100644
--- a/man/keyctl_chown.3
+++ b/man/keyctl_chown.3
@@ -37,7 +37,7 @@ does not match the process's GID or one of its group list.
 .P
 The caller must have
 .B setattr
-permission on a key to be able change its ownership.
+permission on a key to be able to change its ownership.
 .\"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 .SH RETURN VALUE
 On success
diff --git a/man/keyctl_clear.3 b/man/keyctl_clear.3
index 21e0c26..8da699e 100644
--- a/man/keyctl_clear.3
+++ b/man/keyctl_clear.3
@@ -25,7 +25,7 @@ clears the contents of a
 .P
 The caller must have
 .B write
-permission on a keyring to be able clear it.
+permission on a keyring to be able to clear it.
 .\"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 .SH RETURN VALUE
 On success
@@ -71,4 +71,3 @@ should be specified to the linker.
 .BR keyctl (3),
 .BR keyrings (7),
 .BR keyutils (7)
-
diff --git a/man/keyctl_link.3 b/man/keyctl_link.3
index 1185874..2cbc104 100644
--- a/man/keyctl_link.3
+++ b/man/keyctl_link.3
@@ -38,7 +38,7 @@ if it exists.
 .P
 The caller must have
 .B write
-permission on a keyring to be able create or remove links in it.
+permission on a keyring to be able to create or remove links in it.
 .P
 The caller must have
 .B link
@@ -105,4 +105,3 @@ should be specified to the linker.
 .BR keyctl (3),
 .BR keyrings (7),
 .BR keyutils (7)
-
diff --git a/man/keyctl_move.3 b/man/keyctl_move.3
index b241f70..6f144df 100644
--- a/man/keyctl_move.3
+++ b/man/keyctl_move.3
@@ -41,7 +41,7 @@ an error.
 .P
 The caller must have
 .B write
-permission on both keyring to be able create or remove links in them.
+permission on both keyring to be able to create or remove links in them.
 .P
 The caller must have
 .B link
@@ -106,4 +106,3 @@ should be specified to the linker.
 .BR keyctl (3),
 .BR keyrings (7),
 .BR keyutils (7)
-
diff --git a/man/keyctl_read.3 b/man/keyctl_read.3
index 852bc05..97b0e24 100644
--- a/man/keyctl_read.3
+++ b/man/keyctl_read.3
@@ -16,8 +16,7 @@ keyctl_read \- read a key
 .nf
 .B #include <keyutils.h>
 .sp
-.BI "long keyctl_read(key_serial_t " key ", char *" buffer ,
-.BI "size_t" buflen ");"
+.BI "long keyctl_read(key_serial_t " key ", char *" buffer ", size_t " buflen ");"
 .sp
 .BI "long keyctl_read_alloc(key_serial_t " key ", void **" _buffer ");"
 .\"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
diff --git a/man/keyctl_revoke.3 b/man/keyctl_revoke.3
index 914a253..622f1ac 100644
--- a/man/keyctl_revoke.3
+++ b/man/keyctl_revoke.3
@@ -28,7 +28,7 @@ meet with error
 .P
 The caller must have
 .B write
-permission on a key to be able revoke it.
+permission on a key to be able to revoke it.
 .\"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 .SH RETURN VALUE
 On success
diff --git a/man/keyctl_set_timeout.3 b/man/keyctl_set_timeout.3
index 1b7ec94..24c7049 100644
--- a/man/keyctl_set_timeout.3
+++ b/man/keyctl_set_timeout.3
@@ -33,7 +33,7 @@ When the key expires, further attempts to access it will be met with error
 .P
 The caller must have
 .B setattr
-permission on a key to be able change its permissions mask.
+permission on a key to be able to change its permissions mask.
 .\"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 .SH RETURN VALUE
 On success
diff --git a/man/keyctl_setperm.3 b/man/keyctl_setperm.3
index 0a4426d..d5d9015 100644
--- a/man/keyctl_setperm.3
+++ b/man/keyctl_setperm.3
@@ -29,7 +29,7 @@ same UID as the caller.
 .P
 The caller must have
 .B setattr
-permission on a key to be able change its permissions mask.
+permission on a key to be able to change its permissions mask.
 .P
 The permissions mask is a bitwise-OR of the following flags:
 .TP
diff --git a/man/keyctl_update.3 b/man/keyctl_update.3
index 17fbdb4..2d44740 100644
--- a/man/keyctl_update.3
+++ b/man/keyctl_update.3
@@ -25,7 +25,7 @@ updates the payload of a key if the key type permits it.
 .P
 The caller must have
 .B write
-permission on a key to be able update it.
+permission on a key to be able to update it.
 .P
 .I payload
 and
-- 
2.27.0

