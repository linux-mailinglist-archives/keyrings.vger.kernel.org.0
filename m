Return-Path: <keyrings+bounces-2973-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DC5EEB31BD1
	for <lists+keyrings@lfdr.de>; Fri, 22 Aug 2025 16:37:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3250B1CC754C
	for <lists+keyrings@lfdr.de>; Fri, 22 Aug 2025 14:29:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74E563128B5;
	Fri, 22 Aug 2025 14:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fJoTTNAI"
X-Original-To: keyrings@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A48FC3128A8
	for <keyrings@vger.kernel.org>; Fri, 22 Aug 2025 14:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755872559; cv=none; b=JOpv+rX2y3GANhyoiLJVWaG1oFIF+uTWp4cw31tnoGNWp0DpM2g+yXca7z4uMZ47Qk8bUHGrUzDbWlX03zZNuHjDmpnPyPjXrzsCplG/F3teDIYnY9JAv6WvE1gZkYb/TstBVgwgo6tcO8wwNINOVUaJmSWsCZe1YEfRwHLZHzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755872559; c=relaxed/simple;
	bh=8ZSK0v83UzgndVd+6j+Ob2zWxBO+LwO1vSvTVJ6AS7c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Iqc9OmOBTaJ1iE6evdkdK+k/ttlrkDXLPVOrsqKIQlVN0+RbwxRSHwrgyxez9Aa/TWKFwdLtCsagaHEouzwweU53kIj2/JkHPWYIKynTWlIav1GGe0Ywa39chlodZsMhq8hNeGAk1r0ePv8XAOCzXUI1raBiaB6TfEdYO3TEMWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fJoTTNAI; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755872556;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Zg5th46DkHtvRDX7ITaK0hA9kgkdfvZehuTYviRd8Ck=;
	b=fJoTTNAI89/42xevbltxY0hLGmtLPp62/0jwaRFTWeFkE285ikhWzDR5U/LqRuDs2cEpH0
	Fetg0Lrbi1q1o8XhbvssIisvJwNdkUNNDYymfM86WCUG1Rtq5RW/6kkNCCyobmDH8BrJOd
	Q/is0wXAbmNqycjQatXoEbAP1Bb5Vts=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-35-3B29MiX5Nwub36e3U3GTUg-1; Fri,
 22 Aug 2025 10:22:34 -0400
X-MC-Unique: 3B29MiX5Nwub36e3U3GTUg-1
X-Mimecast-MFC-AGG-ID: 3B29MiX5Nwub36e3U3GTUg_1755872553
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 4AE4919560B4;
	Fri, 22 Aug 2025 14:22:33 +0000 (UTC)
Received: from warthog.procyon.org.com (unknown [10.42.28.132])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 1457E19560B0;
	Fri, 22 Aug 2025 14:22:31 +0000 (UTC)
From: David Howells <dhowells@redhat.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: David Howells <dhowells@redhat.com>,
	keyrings@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 5/7] request-key: Add help text
Date: Fri, 22 Aug 2025 15:22:12 +0100
Message-ID: <20250822142215.2475014-6-dhowells@redhat.com>
In-Reply-To: <20250822142215.2475014-1-dhowells@redhat.com>
References: <20250822142215.2475014-1-dhowells@redhat.com>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

Add --help text to /sbin/request-key.

Signed-off-by: David Howells <dhowells@redhat.com>
---
 man/request-key.8 | 42 +++++++++++++++++++++++++++-------
 request-key.c     | 57 ++++++++++++++++++++++++++++++++++++++++++-----
 2 files changed, 85 insertions(+), 14 deletions(-)

diff --git a/man/request-key.8 b/man/request-key.8
index 50a7506..15b6bb8 100644
--- a/man/request-key.8
+++ b/man/request-key.8
@@ -7,20 +7,37 @@
 .\" as published by the Free Software Foundation; either version
 .\" 2 of the License, or (at your option) any later version.
 .\"
-.TH REQUEST-KEY 8 "15 Nov 2011" Linux "Linux Key Management Utilities"
+.TH REQUEST-KEY 8 "22 Aug 2025" Linux "Linux Key Management Utilities"
 .SH NAME
 request\-key \- handle key instantiation callback requests from the kernel
 .SH SYNOPSIS
-\fB/sbin/request\-key \fR<op> <key> <uid> <gid> <threadring> <processring>
-	<sessionring> [<info>]
+.nf
+\fB/sbin/request\-key\fP [\fB--help\fP|\fB--version\fP]
+\fB/sbin/request\-key\fP \fIop key uid gid t-ring p-ring s-ring\fP [\fIinfo\fP]
+\fB/sbin/request\-key -d [-lnv] -D\fP \fIdesc\fP \fIop key\fP...
+.fi
 .SH DESCRIPTION
 This program is invoked by the kernel when the kernel is asked for a key that
 it doesn't have immediately available. The kernel creates a partially set up
-key and then calls out to this program to instantiate it. It is not intended
-to be called directly.
+key and then calls out to this program to instantiate it. It is not intended to
+be called directly.  A debugging capability is available through command line
+options, however, to aid in testing and in debugging configuration.
 .PP
-However, for debugging purposes, it can be given some options on the command
-line:
+The normally required parameters are:
+.IP \fBop\fP
+The operation being done, such as "create" if a key is being instantiated for
+creation.
+.IP \fBkey\fP
+The ID of the key being operated upon.
+.IP "\fBuid\fP, \fBgid\fP"
+The ownership of the task that caused the key to be created.
+.IP "\fBt-ring\fP, \fBp-ring\fP, \fBs-ring\fP"
+The thread, process and session keyrings of the task that caused the key to be
+created.
+.IP \fBinfo\fP
+The optional callout info that can be passed by \fIrequest_key(2)\fP.
+.PP
+The options that may also be supplied are:
 .IP \fB-d\fP
 Turn on debugging mode.  In this mode, no attempts are made to access any keys
 and, if a handler program is selected, it won't be executed; instead, this
@@ -39,10 +56,19 @@ will be copied to the system log - this will prevent that.
 .IP \fB-v\fP
 Turn on debugging output.  This may be specified multiple times to produce
 increasing levels of verbosity.
+.IP \fB--help\fP
+Print help text and exit.
 .IP \fB--version\fP
 Print the program version and exit.
+.SH EXAMPLES
+When using the debugging mode, all the parameters must be given, though a lot
+of them don't matter and can be just set to 0, e.g.:
+.PP
+.nf
+request-key -d -D "user;0;0;0;debug:bar" create 0 0 0 0 0 0 foo
+.fi
 .SH ERRORS
-All errors will be logged to the syslog.
+All errors will be logged to the syslog unless the \fB-n\fP option is given.
 .SH FILES
 .ul
 /etc/request\-key.d/*.conf
diff --git a/request-key.c b/request-key.c
index d1feec3..9a7d741 100644
--- a/request-key.c
+++ b/request-key.c
@@ -111,7 +111,7 @@ static void error(const char *fmt, ...)
 {
 	va_list va;
 
-	if (verbosity) {
+	if (verbosity || debug_mode) {
 		va_start(va, fmt);
 		vfprintf(stderr, fmt, va);
 		va_end(va);
@@ -138,6 +138,45 @@ static void oops(int x)
 	error("Died on signal %d", x);
 }
 
+static const char help_text[] =
+	"Usage: request-key [OPTIONS] [PARAMS]\n"
+	"       request-key [OPTIONS] -d -D <desc> [PARAMS]\n"
+	"\n"
+	"Where the required parameters, [PARAMS], are, in order:\n"
+	"  <op>     : The operation type (e.g. 'create')\n"
+	"  <key>    : The ID of the key to be operated upon\n"
+	"  <uid>    : The UID of the requesting process\n"
+	"  <gid>    : The GID of the requesting process\n"
+	"  <t-ring> : The thread keyring of the requesting process (or 0)\n"
+	"  <p-ring> : The process keyring of the requesting process (or 0)\n"
+	"  <s-ring> : The session keyring of the requesting process (or 0)\n"
+	"  <callout>: The callout data supplied to the request\n"
+	"\n"
+	"and [OPTIONS] are none or more of\n"
+	"  -d       : Debug mode for direct cmdline testing\n"
+	"  -D <desc>: Description for debug mode\n"
+	"  -l       : Use config from local dir, not /etc\n"
+	"  -n       : Don't log to syslog\n"
+	"  -v       : Turn up verbosity (can use multiple times)\n"
+	"  --version: Print version and exit\n"
+	"  --help   : Print this text and exit\n"
+	"\n"
+	"Service program lookup testing can be done with the '-d' option, but\n"
+	"as there is no actual key to query, the called must supply the key's\n"
+	"attributes manually using '-D' in the form returned by the\n"
+	"'keyctl rdescribe' command, for example:\n"
+	"\n"
+	"  ./request-key -d -D \"user;0;0;0;debug:bar\" create 0 0 0 0 0 0 foo\n"
+	"\n"
+	"where 'user' is the key type and 'debug:bar' is the key description.\n"
+	;
+
+static struct option long_options[] = {
+	{ .name = "help",	.val = 1 },
+	{ .name = "version",	.val = 2 },
+	{}
+};
+
 /*****************************************************************************/
 /*
  *
@@ -149,19 +188,25 @@ int main(int argc, char *argv[])
 	char *buf;
 	int ret, ntype, dpos, n, fd, opt;
 
-	if (argc == 2 && strcmp(argv[1], "--version") == 0) {
-		printf("request-key from %s (Built %s)\n",
-		       keyutils_version_string, keyutils_build_string);
-		return 0;
+	if (argc == 1) {
+		fputs(help_text, stderr);
+		exit(2);
 	}
 
 	signal(SIGSEGV, oops);
 	signal(SIGBUS, oops);
 	signal(SIGPIPE, SIG_IGN);
 
-	while (opt = getopt(argc, argv, "D:dlnv"),
+	while (opt = getopt_long(argc, argv, "D:dlnv", long_options, NULL),
 	       opt != -1) {
 		switch (opt) {
+		case 1:
+			fputs(help_text, stderr);
+			exit(2);
+		case 2:
+			printf("request-key from %s (Built %s)\n",
+			       keyutils_version_string, keyutils_build_string);
+			return 0;
 		case 'D':
 			test_desc = optarg;
 			break;


