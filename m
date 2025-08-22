Return-Path: <keyrings+bounces-2975-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B3831B31BD8
	for <lists+keyrings@lfdr.de>; Fri, 22 Aug 2025 16:37:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 098AB1D60D25
	for <lists+keyrings@lfdr.de>; Fri, 22 Aug 2025 14:30:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 670193128D2;
	Fri, 22 Aug 2025 14:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="b6+c71Xd"
X-Original-To: keyrings@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 640253128C3
	for <keyrings@vger.kernel.org>; Fri, 22 Aug 2025 14:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755872563; cv=none; b=p/0NLDsixDhsGK5cL/1zaI59xR+gW1u3dhtbpaCU2fy45Z5xifzmbWtfWSRKwJ92AFWQ++ztoDI9xGKgw0LuEbjIhfblDGRhBWvA6UaJLv2f6dWVJWccim4MZmG4PyrqLuPczTLnqjjIznPOs/b6TcO/wTC9x3z+KTKBF42cSP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755872563; c=relaxed/simple;
	bh=j1vPITvQZRDC7p9CURE4NAGVCfaoq3pQr6ZkNtGZYds=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=L6OGOWQPS2PV8znIH9G7nwJq4gIhv8NUTYCizAuPPESjEtsG+iJyVu3dJviBoxjOMZY9s6l2RtqZt3T9ScL9Cptq7X6dd/D8+5BszPonyD3Nt/R96iplZ8u2wUM3feuPb4kCkgRS/2qzeAlRuMiZ8fkfSE7oZuQIx1UUwY65KxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=b6+c71Xd; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755872560;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IUJpUooiNBv3XSIVDQcnwAYMx5ZgTm1CmlE2bCCM7T8=;
	b=b6+c71XdVJHks16d9wccR+FJqBDviY2USdttJPLVoVXIQpqVfTH5cwfcZneOPkn4Mvlwuw
	Exq2TjdHg3hvuRggV8faou//lmSsbF1jcTHdYZvlVkhPjofylN6TUHvpceLwZwNrZOJ54M
	5QZrH0FF2kxEmb/oOSW4sSn5rjAiIsA=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-358-Xn1AZ9JgOvKdnNYJ1kYVDQ-1; Fri,
 22 Aug 2025 10:22:36 -0400
X-MC-Unique: Xn1AZ9JgOvKdnNYJ1kYVDQ-1
X-Mimecast-MFC-AGG-ID: Xn1AZ9JgOvKdnNYJ1kYVDQ_1755872555
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C0FCD180034A;
	Fri, 22 Aug 2025 14:22:35 +0000 (UTC)
Received: from warthog.procyon.org.com (unknown [10.42.28.132])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 8F56B180028F;
	Fri, 22 Aug 2025 14:22:34 +0000 (UTC)
From: David Howells <dhowells@redhat.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: David Howells <dhowells@redhat.com>,
	keyrings@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 6/7] request-key: Add a simpler debug test
Date: Fri, 22 Aug 2025 15:22:13 +0100
Message-ID: <20250822142215.2475014-7-dhowells@redhat.com>
In-Reply-To: <20250822142215.2475014-1-dhowells@redhat.com>
References: <20250822142215.2475014-1-dhowells@redhat.com>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

Add a simpler debug test to avoid the need to supply all the parameters
that don't take part in the matching.  This looks like:

	request-key --check <type> <desc> [<callout>] [<op>]
	request-key --check user debug:bar

The unspecified parameters are just defaulted.

Signed-off-by: David Howells <dhowells@redhat.com>
---
 man/request-key.8 |  38 ++++++---
 request-key.c     | 203 ++++++++++++++++++++++++++++++----------------
 2 files changed, 161 insertions(+), 80 deletions(-)

diff --git a/man/request-key.8 b/man/request-key.8
index 15b6bb8..90121d9 100644
--- a/man/request-key.8
+++ b/man/request-key.8
@@ -14,14 +14,18 @@ request\-key \- handle key instantiation callback requests from the kernel
 .nf
 \fB/sbin/request\-key\fP [\fB--help\fP|\fB--version\fP]
 \fB/sbin/request\-key\fP \fIop key uid gid t-ring p-ring s-ring\fP [\fIinfo\fP]
-\fB/sbin/request\-key -d [-lnv] -D\fP \fIdesc\fP \fIop key\fP...
+\fB/sbin/request\-key -d\fP [\fB-lnv\fP] [\fB-D\fP \fIdesc\fP] \fIop key\fP...
+\fB/sbin/request\-key --check\fP [\fB-lnv\fP] \fItype desc\fP [\fIinfo\fP] [\fIop\fP]
 .fi
 .SH DESCRIPTION
 This program is invoked by the kernel when the kernel is asked for a key that
 it doesn't have immediately available. The kernel creates a partially set up
-key and then calls out to this program to instantiate it. It is not intended to
-be called directly.  A debugging capability is available through command line
-options, however, to aid in testing and in debugging configuration.
+key and then calls out to this program to instantiate it. It is not generally
+intended to be called directly.
+.PP
+Debugging capabilities are also available through command line options to aid
+in testing and in configuration debugging.
+.SH COMMAND-LINE OPTIONS
 .PP
 The normally required parameters are:
 .IP \fBop\fP
@@ -39,12 +43,12 @@ The optional callout info that can be passed by \fIrequest_key(2)\fP.
 .PP
 The options that may also be supplied are:
 .IP \fB-d\fP
-Turn on debugging mode.  In this mode, no attempts are made to access any keys
+Debug the lookup.  If this is supplied, no attempts are made to access any keys
 and, if a handler program is selected, it won't be executed; instead, this
-program will print a message and exit 0.
-.IP \fB-D <description>\fP
-In debugging mode, use the proposed key description specified with this rather
-than the sample ("user;0;0;1f0000;debug:1234") built into the program.
+program will print a message and exit.
+.IP "\fB-D\fP \fIdescription\fP"
+Use with \fB-d\fP to provide a specific key description rather than using the
+sample ("user;0;0;1f0000;debug:1234") built into the program.
 .IP \fB-l\fP
 Use configuration from the current directory.  The program will use
 .IR request-key.d/* " and " request-key.conf
@@ -56,6 +60,9 @@ will be copied to the system log - this will prevent that.
 .IP \fB-v\fP
 Turn on debugging output.  This may be specified multiple times to produce
 increasing levels of verbosity.
+.IP \fB--check\fP
+If this is provide, then a simpler debugging mode is engaged that defaults most
+of the arguments, but otherwise operates much the same as '-d'.
 .IP \fB--help\fP
 Print help text and exit.
 .IP \fB--version\fP
@@ -67,8 +74,19 @@ of them don't matter and can be just set to 0, e.g.:
 .nf
 request-key -d -D "user;0;0;0;debug:bar" create 0 0 0 0 0 0 foo
 .fi
+.PP
+With the simple check mode, the parameters that aren't involved in matching
+are just defaulted and only those that are necessary are given; further, only
+the basic key description needs be supplied, e.g.:
+.PP
+.nf
+request-key --check user debug:bar
+request-key --check user debug:bar foo
+request-key --check user debug:bar foo create
+.fi
 .SH ERRORS
-All errors will be logged to the syslog unless the \fB-n\fP option is given.
+All errors will be logged to the syslog unless \fB-n\fP or \fB--check\fP are
+given.  Errors will also be logged to stderr if \fB-v\fP is given.
 .SH FILES
 .ul
 /etc/request\-key.d/*.conf
diff --git a/request-key.c b/request-key.c
index 9a7d741..302d083 100644
--- a/request-key.c
+++ b/request-key.c
@@ -133,6 +133,17 @@ static void error(const char *fmt, ...)
 #define file_error(FMT, ...)  error("%s: "FMT, conffile, ## __VA_ARGS__)
 #define line_error(FMT, ...)  error("%s:%d: "FMT, conffile, confline, ## __VA_ARGS__)
 
+static  __attribute__((noreturn, format(printf, 1, 2)))
+void cmderror(const char *fmt, ...)
+{
+	va_list va;
+
+	va_start(va, fmt);
+	vfprintf(stderr, fmt, va);
+	va_end(va);
+	exit(2);
+}
+
 static void oops(int x)
 {
 	error("Died on signal %d", x);
@@ -141,6 +152,7 @@ static void oops(int x)
 static const char help_text[] =
 	"Usage: request-key [OPTIONS] [PARAMS]\n"
 	"       request-key [OPTIONS] -d -D <desc> [PARAMS]\n"
+	"       request-key [OPTIONS] --check <type> <desc> [<callout>] [<op>]\n"
 	"\n"
 	"Where the required parameters, [PARAMS], are, in order:\n"
 	"  <op>     : The operation type (e.g. 'create')\n"
@@ -158,22 +170,33 @@ static const char help_text[] =
 	"  -l       : Use config from local dir, not /etc\n"
 	"  -n       : Don't log to syslog\n"
 	"  -v       : Turn up verbosity (can use multiple times)\n"
-	"  --version: Print version and exit\n"
 	"  --help   : Print this text and exit\n"
+	"  --version: Print version and exit\n"
 	"\n"
 	"Service program lookup testing can be done with the '-d' option, but\n"
-	"as there is no actual key to query, the called must supply the key's\n"
-	"attributes manually using '-D' in the form returned by the\n"
-	"'keyctl rdescribe' command, for example:\n"
+	"as there is no actual key to query, the caller must supply the key's\n"
+	"attributes manually.  For debug mode this is done  using the '-D'\n"
+	"option with a parameter in the form returned by the 'keyctl rdescribe'\n"
+	"command, for example:\n"
 	"\n"
 	"  ./request-key -d -D \"user;0;0;0;debug:bar\" create 0 0 0 0 0 0 foo\n"
 	"\n"
 	"where 'user' is the key type and 'debug:bar' is the key description.\n"
+	"\n"
+	"A simpler test mode is also available by specifying '--check'.  In\n"
+	"this mode, most of the parameters are set to fixed values and the\n"
+	"'callout' and 'op' values may be defaulted (to \"\" and \"create\"\n"
+	"respectively), for example:\n"
+	"\n"
+	"  ./request-key --check user debug:bar\n"
+	"  ./request-key --check user debug:bar foo\n"
+	"  ./request-key --check user debug:bar foo create\n"
 	;
 
 static struct option long_options[] = {
 	{ .name = "help",	.val = 1 },
 	{ .name = "version",	.val = 2 },
+	{ .name = "check",	.val = 3 },
 	{}
 };
 
@@ -183,7 +206,7 @@ static struct option long_options[] = {
  */
 int main(int argc, char *argv[])
 {
-	struct parameters params;
+	struct parameters params = {};
 	char *test_desc = "user;0;0;1f0000;debug:1234";
 	char *buf;
 	int ret, ntype, dpos, n, fd, opt;
@@ -202,15 +225,23 @@ int main(int argc, char *argv[])
 		switch (opt) {
 		case 1:
 			fputs(help_text, stderr);
-			exit(2);
+			exit(0);
 		case 2:
 			printf("request-key from %s (Built %s)\n",
 			       keyutils_version_string, keyutils_build_string);
 			return 0;
+		case 3:
+			if (debug_mode)
+				cmderror("Multiple debug modes specified\n");
+			debug_mode = 2;
+			xnolog = 1;
+			break;
 		case 'D':
 			test_desc = optarg;
 			break;
 		case 'd':
+			if (debug_mode)
+				cmderror("Multiple debug modes specified\n");
 			debug_mode = 1;
 			break;
 		case 'l':
@@ -228,80 +259,102 @@ int main(int argc, char *argv[])
 	argc -= optind;
 	argv += optind;
 
-	if (argc != 7 && argc != 8)
-		error("Unexpected argument count: %d\n", argc);
+	switch (debug_mode) {
+	case 0:
+		/* If we were invoked directly by the kernel, make sure we have
+		 * stdin, stdout and stderr set.
+		 */
+		fd = open("/dev/null", O_RDWR);
+		if (fd < 0)
+			error("open");
+		if (fd > 2) {
+			close(fd);
+		}
+		else if (fd < 2) {
+			ret = dup(fd);
+			if (ret < 0)
+				error("dup failed: %m\n");
 
-	fd = open("/dev/null", O_RDWR);
-	if (fd < 0)
-		error("open");
-	if (fd > 2) {
-		close(fd);
-	}
-	else if (fd < 2) {
-		ret = dup(fd);
-		if (ret < 0)
-			error("dup failed: %m\n");
+			if (ret < 2 && dup(fd) < 0)
+				error("dup failed: %m\n");
+		}
+		/* Fallthrough. */
+
+	case 1:
+		if (argc != 7 && argc != 8)
+			cmderror("Unexpected argument count: %d\n", argc);
+
+		params.op		= argv[0];
+		params.key		= argv[1];
+		params.uid		= argv[2];
+		params.gid		= argv[3];
+		params.thread_keyring	= argv[4];
+		params.process_keyring	= argv[5];
+		params.session_keyring	= argv[6];
+		params.callout_info	= argv[7];
+
+		params.key_id = atoi(params.key);
+
+		if (!debug_mode) {
+			/* assume authority over the key
+			 * - older kernel doesn't support this function
+			 */
+			ret = keyctl_assume_authority(params.key_id);
+			if (ret < 0 && !(argc == 8 || errno == EOPNOTSUPP))
+				error("Failed to assume authority over key %d (%m)\n",
+				      params.key_id);
 
-		if (ret < 2 && dup(fd) < 0)
-			error("dup failed: %m\n");
-	}
+			/* ask the kernel to describe the key to us */
+			ret = keyctl_describe_alloc(params.key_id, &buf);
+			if (ret < 0)
+				goto inaccessible;
 
-	params.op		= argv[0];
-	params.key		= argv[1];
-	params.uid		= argv[2];
-	params.gid		= argv[3];
-	params.thread_keyring	= argv[4];
-	params.process_keyring	= argv[5];
-	params.session_keyring	= argv[6];
-	params.callout_info	= argv[7];
+			/* get hold of the callout info */
+			if (!params.callout_info) {
+				void *tmp;
 
-	params.key_id = atoi(params.key);
+				if (keyctl_read_alloc(KEY_SPEC_REQKEY_AUTH_KEY, &tmp) < 0)
+					error("Failed to retrieve callout info (%m)\n");
 
-	/* assume authority over the key
-	 * - older kernel doesn't support this function
-	 */
-	if (!debug_mode) {
-		ret = keyctl_assume_authority(params.key_id);
-		if (ret < 0 && !(argc == 8 || errno == EOPNOTSUPP))
-			error("Failed to assume authority over key %d (%m)\n",
-			      params.key_id);
-	}
+				params.callout_info = tmp;
+			}
+		} else {
+			buf = strdup(test_desc);
+		}
 
-	/* ask the kernel to describe the key to us */
-	if (!debug_mode) {
-		ret = keyctl_describe_alloc(params.key_id, &buf);
-		if (ret < 0)
-			goto inaccessible;
-	} else {
-		buf = strdup(test_desc);
+		/* extract the type and description from the key */
+		debug("Key descriptor: \"%s\"\n", buf);
+		ntype = -1;
+		dpos = -1;
+
+		n = sscanf(buf, "%*[^;]%n;%*d;%*d;%x;%n", &ntype, &n, &dpos);
+		if (n != 1)
+			error("Failed to parse key description\n");
+
+		params.key_type = buf;
+		params.key_type[ntype] = 0;
+		params.key_desc = buf + dpos;
+		break;
+
+	case 2:
+		/* request-key <type> <desc> [<callout>] [<op>] */
+		if (argc < 2 || argc > 4)
+			cmderror("Unexpected argument count: %d\n", argc);
+		params.key_type		= argv[0];
+		params.key_desc		= argv[1];
+		params.callout_info	= argc > 2 ? argv[2] : "";
+		params.op		= argc > 3 ? argv[3] : "create";
+		params.key		= "undef-key";
+		params.uid		= "undef-uid";
+		params.gid		= "undef-gid";
+		params.thread_keyring	= "undef-tring";
+		params.process_keyring	= "undef-pring";
+		params.session_keyring	= "undef-sring";
+		break;
 	}
 
-	/* extract the type and description from the key */
-	debug("Key descriptor: \"%s\"\n", buf);
-	ntype = -1;
-	dpos = -1;
-
-	n = sscanf(buf, "%*[^;]%n;%*d;%*d;%x;%n", &ntype, &n, &dpos);
-	if (n != 1)
-		error("Failed to parse key description\n");
-
-	params.key_type = buf;
-	params.key_type[ntype] = 0;
-	params.key_desc = buf + dpos;
-
 	debug("Key type: %s\n", params.key_type);
 	debug("Key desc: %s\n", params.key_desc);
-
-	/* get hold of the callout info */
-	if (!params.callout_info) {
-		void *tmp;
-
-		if (keyctl_read_alloc(KEY_SPEC_REQKEY_AUTH_KEY, &tmp) < 0)
-			error("Failed to retrieve callout info (%m)\n");
-
-		params.callout_info = tmp;
-	}
-
 	debug("CALLOUT: '%s'\n", params.callout_info);
 
 	/* determine the action to perform */
@@ -734,6 +787,16 @@ static void execute_program(struct parameters *params, char *cmdline)
 		debug("%s %s\n", pipeit ? "PipeThru" : "Run", prog);
 		for (ap = argv; *ap; ap++)
 			debug("- argv[%td] = \"%s\"\n", ap - argv, *ap);
+	} else if (debug_mode) {
+		char **ap;
+
+		printf("Run: ");
+		if (pipeit)
+			putchar('|');
+		printf("%s", prog);
+		for (ap = argv; *ap; ap++)
+			printf(" \"%s\"", *ap);
+		printf("\n");
 	}
 
 	/* become the same UID/GID as the key requesting process */


