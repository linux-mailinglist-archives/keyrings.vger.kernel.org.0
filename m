Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED927483A76
	for <lists+keyrings@lfdr.de>; Tue,  4 Jan 2022 03:06:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231657AbiADCGs (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Mon, 3 Jan 2022 21:06:48 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:52372 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231848AbiADCGr (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Mon, 3 Jan 2022 21:06:47 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: aratiu)
        with ESMTPSA id 7B4DC1F41E48
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1641262006;
        bh=kccC9yzmvfwg7eQf3K6wsd0IwvxdUzpmEV4W5F3acTk=;
        h=From:To:Cc:Subject:Date:From;
        b=At/biebcypnOrOYTvND+V4wmo5d/PG5DkGb8fYVAemrao6ys0GFSoy/5f21IvMhXD
         jciseQuiyGHokJ29A0qyXkYZCoh29tPQ1d1wWgq7iOgjTTjSb7FJ9rdW1jiwsgSCI2
         /i4sULTqOZm9tW494wJVUSBWd1VYkCSEluQLYszCKHwE6PCDL91m6ZbxAScBNnJicB
         1Bj/fTPIRK8542OLQvQVblKTazTVFKyPcygPiCQP+LG5P9TK2SDjMi2SGH577XZq3K
         lIz/0l5p85RDMUc8pxY7PhJN7Metqu7bZTdjAsaua/h7KVlsn/+10D9nh8TEfgbQH1
         TTX99zrGkpUNg==
From:   Adrian Ratiu <adrian.ratiu@collabora.com>
To:     David Howells <dhowells@redhat.com>
Cc:     keyrings@vger.kernel.org
Subject: [PATCH] Makefile: only run rpmspec if it exists
Date:   Tue,  4 Jan 2022 04:06:43 +0200
Message-Id: <20220104020643.2957571-1-adrian.ratiu@collabora.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

keyutils is built on many distros which do not use rpm like
Gentoo, ChromeOS or Arch. Older versions of bash silently
ignored the fact that rpmspec was missing, but newer bash
like v5.1 issue a new error:

/bin/sh: line 1: rpmspec: command not found

This happens every time the Makefile is parsed, including
for a simple "make" invocation or "make install" even if
a rpm package is not desired.

Arch Linux simply ignores this new error but Gentoo and
ChromeOS fail because portage actively monitors the build
log for errors like this. See bug report [1].

Fix this by calling rpmspec only if it exists.

[1] https://bugs.gentoo.org/760633

Signed-off-by: Adrian Ratiu <adrian.ratiu@collabora.com>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 599b145..1b39e8a 100644
--- a/Makefile
+++ b/Makefile
@@ -285,7 +285,7 @@ SRCBALL	:= rpmbuild/SOURCES/$(TARBALL)
 ZSRCBALL := rpmbuild/SOURCES/$(ZTARBALL)
 
 BUILDID	:= .local
-rpmver0	:= $(shell rpmspec -q ./keyutils.spec --define "buildid $(BUILDID)")
+rpmver0	:= $(shell if which rpmspec >/dev/null 2>&1; then rpmspec -q ./keyutils.spec --define "buildid $(BUILDID)"; fi)
 rpmver1	:= $(word 1,$(rpmver0))
 rpmver2	:= $(subst ., ,$(rpmver1))
 rpmver3	:= $(lastword $(rpmver2))
-- 
2.34.1

