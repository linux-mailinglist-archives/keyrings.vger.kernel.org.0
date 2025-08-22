Return-Path: <keyrings+bounces-2976-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B18D3B31BC7
	for <lists+keyrings@lfdr.de>; Fri, 22 Aug 2025 16:36:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A25A51CC469D
	for <lists+keyrings@lfdr.de>; Fri, 22 Aug 2025 14:30:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 127DC313526;
	Fri, 22 Aug 2025 14:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SHSaUikg"
X-Original-To: keyrings@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07FFE3128CB
	for <keyrings@vger.kernel.org>; Fri, 22 Aug 2025 14:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755872565; cv=none; b=L+Y7L7/HyYvuHsmwdFiD3XdCGtoJQgyURblY4GjDO3pESm03EWVAszMUBiwvR1LEnEGgdGj6rotWP+9AkRECJoQQi0GuwDUSAx6uUuvHIZIuN/+wvYnYoGHRkD4871EhFgo0JLcY/xVtnkfsfBqAvJmKoyfDtDz1PnFuILuHCZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755872565; c=relaxed/simple;
	bh=rCTWizcS8tppI1Pb0q/Qf3pwJuoMcIAjRl0Y1SBqJ7k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fqoYUljGaQB5Ab+K3FG0gaWOnm/EbqTzoCXA/C8PCX9/tRUMRz9ZjV6lkKPjVs11qgaJGYt3Lz1oJR9xqIv+VYbar3Qo4TH4NItA2lm8JqEOacHHA87w6Xq3H3rlt9sTOX7BCdRZP/xi2H9RWaHjUWqSkktPX6nfXAG58CDJ0yM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SHSaUikg; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755872561;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MyiW9WG9d02tUGD/bkZ0ruTVUbMBtZ9QTexYOI6sGjk=;
	b=SHSaUikgqM0JMJa/qQ2blFhRnXPKCkJVRjIVuGysqxzX2sMnLoA+MtaU+roS5wL60ROXBk
	BdeYZK+pWtrv/eFQqkfulF6i3EZHNnS+fW+uqqegseXy1tEOHCzjlHIQ4nD1gAwnMfXro8
	gliCDWsrOojRIhut8gLwrYGFa4LjVxE=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-413-xBDlz-VGM3KQFE3OqAiivQ-1; Fri,
 22 Aug 2025 10:22:39 -0400
X-MC-Unique: xBDlz-VGM3KQFE3OqAiivQ-1
X-Mimecast-MFC-AGG-ID: xBDlz-VGM3KQFE3OqAiivQ_1755872558
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 762F31956087;
	Fri, 22 Aug 2025 14:22:38 +0000 (UTC)
Received: from warthog.procyon.org.com (unknown [10.42.28.132])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 3B68C1955F24;
	Fri, 22 Aug 2025 14:22:37 +0000 (UTC)
From: David Howells <dhowells@redhat.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: David Howells <dhowells@redhat.com>,
	keyrings@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 7/7] request-key: Support the promised multiwildcard matching
Date: Fri, 22 Aug 2025 15:22:14 +0100
Message-ID: <20250822142215.2475014-8-dhowells@redhat.com>
In-Reply-To: <20250822142215.2475014-1-dhowells@redhat.com>
References: <20250822142215.2475014-1-dhowells@redhat.com>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

The manual page for request-key.conf says that multiple wildcards can be
used in match elements in the config files, so implement this feature.

Also add a flag, "--test-match", to allow that match function to be tested
directly, e.g.:

  request-key --test-match "**a*a***i**a**a**" antidisestablishmentarianism

Signed-off-by: David Howells <dhowells@redhat.com>
---
 man/request-key.8 |  19 +++-
 request-key.c     | 252 ++++++++++++++++++++++++++++++++++++----------
 2 files changed, 217 insertions(+), 54 deletions(-)

diff --git a/man/request-key.8 b/man/request-key.8
index 90121d9..7cec6e8 100644
--- a/man/request-key.8
+++ b/man/request-key.8
@@ -16,6 +16,7 @@ request\-key \- handle key instantiation callback requests from the kernel
 \fB/sbin/request\-key\fP \fIop key uid gid t-ring p-ring s-ring\fP [\fIinfo\fP]
 \fB/sbin/request\-key -d\fP [\fB-lnv\fP] [\fB-D\fP \fIdesc\fP] \fIop key\fP...
 \fB/sbin/request\-key --check\fP [\fB-lnv\fP] \fItype desc\fP [\fIinfo\fP] [\fIop\fP]
+\fB/sbin/request\-key --match\fP [\fB-v\fP] \fIpattern datum\fP [\fIdatum...\fP]
 .fi
 .SH DESCRIPTION
 This program is invoked by the kernel when the kernel is asked for a key that
@@ -65,6 +66,10 @@ If this is provide, then a simpler debugging mode is engaged that defaults most
 of the arguments, but otherwise operates much the same as '-d'.
 .IP \fB--help\fP
 Print help text and exit.
+.IP \fB--match\fP
+Test the pattern matcher.  The first parameter is the pattern and all
+subsequent parameters are strings to try matching against that.  The program
+exits 1 if any match failure occurs, 0 if all succeed.
 .IP \fB--version\fP
 Print the program version and exit.
 .SH EXAMPLES
@@ -84,9 +89,19 @@ request-key --check user debug:bar
 request-key --check user debug:bar foo
 request-key --check user debug:bar foo create
 .fi
+.PP
+Pattern match testing can be done directly without invoking any of the lookup
+code and without reference to the configuration, e.g.:
+.PP
+.nf
+request-key --match "debug:*" debug:a user:b user:debug:c
+request-key --match -v "*a*a***a*a**a**" antidisestablishmentarianism
+.fi
+.PP
 .SH ERRORS
-All errors will be logged to the syslog unless \fB-n\fP or \fB--check\fP are
-given.  Errors will also be logged to stderr if \fB-v\fP is given.
+All errors will be logged to the syslog unless one of \fB-n\fP, \fB--check\fP
+or \fB--match\fP are given.  Errors will also be logged to stderr if \fB-v\fP
+is given.
 .SH FILES
 .ul
 /etc/request\-key.d/*.conf
diff --git a/request-key.c b/request-key.c
index 302d083..97afeee 100644
--- a/request-key.c
+++ b/request-key.c
@@ -16,6 +16,7 @@
  *	data:	command name, e.g.: "/home/dhowells/request-key-create.sh"
  */
 
+#define _GNU_SOURCE
 #include <stdio.h>
 #include <stdint.h>
 #include <stdlib.h>
@@ -56,6 +57,7 @@ struct parameters {
 };
 
 static int verbosity;
+static int match_debug;
 static int xlocaldirs;
 static int xnolog;
 static int debug_mode;
@@ -81,8 +83,8 @@ static void pipe_to_program(struct parameters *params,
 			    char **argv)
 	__attribute__((noreturn));
 
-static int match(const char *pattern, int plen, const char *datum, int dlen,
-		 unsigned int *wildness);
+static int match(const char *pattern, unsigned int plen,
+		 const char *datum, unsigned int dlen);
 
 static void debug(const char *fmt, ...) __attribute__((format(printf, 1, 2)));
 static void debug(const char *fmt, ...)
@@ -153,6 +155,7 @@ static const char help_text[] =
 	"Usage: request-key [OPTIONS] [PARAMS]\n"
 	"       request-key [OPTIONS] -d -D <desc> [PARAMS]\n"
 	"       request-key [OPTIONS] --check <type> <desc> [<callout>] [<op>]\n"
+	"       request-key [OPTIONS] --match <pattern> <datum> [datum ...]\n"
 	"\n"
 	"Where the required parameters, [PARAMS], are, in order:\n"
 	"  <op>     : The operation type (e.g. 'create')\n"
@@ -168,6 +171,7 @@ static const char help_text[] =
 	"  -d       : Debug mode for direct cmdline testing\n"
 	"  -D <desc>: Description for debug mode\n"
 	"  -l       : Use config from local dir, not /etc\n"
+	"  -M       : Enable string-matching algorithm debugging\n"
 	"  -n       : Don't log to syslog\n"
 	"  -v       : Turn up verbosity (can use multiple times)\n"
 	"  --help   : Print this text and exit\n"
@@ -191,12 +195,20 @@ static const char help_text[] =
 	"  ./request-key --check user debug:bar\n"
 	"  ./request-key --check user debug:bar foo\n"
 	"  ./request-key --check user debug:bar foo create\n"
+	"\n"
+	"Another test mode is available ('--match') that allows the\n"
+	"pattern match evaluator to be tested against a bunch of sample\n"
+	"strings.  For each string, either 'No' or 'Yes(n)' is printed,\n"
+	"where 'n' is the number of wild-matched characters.  For example:\n"
+	"\n"
+	"  ./request-key --match \"**foo**bar*\" \"foobar\"\n"
 	;
 
 static struct option long_options[] = {
 	{ .name = "help",	.val = 1 },
 	{ .name = "version",	.val = 2 },
 	{ .name = "check",	.val = 3 },
+	{ .name = "match",	.val = 4 },
 	{}
 };
 
@@ -236,6 +248,12 @@ int main(int argc, char *argv[])
 			debug_mode = 2;
 			xnolog = 1;
 			break;
+		case 4:
+			if (debug_mode)
+				cmderror("Multiple debug modes specified\n");
+			debug_mode = 3;
+			xnolog = 1;
+			break;
 		case 'D':
 			test_desc = optarg;
 			break;
@@ -351,6 +369,30 @@ int main(int argc, char *argv[])
 		params.process_keyring	= "undef-pring";
 		params.session_keyring	= "undef-sring";
 		break;
+
+	case 3:
+		const char *pattern;
+		int e = 0;
+
+		if (verbosity)
+			match_debug = 1;
+		if (argc < 2)
+			cmderror("Insufficient arguments\n");
+		pattern = argv[0];
+		argv++;
+		argc--;
+		for (; argc; argc--) {
+			int m = match(pattern, strlen(pattern),
+				      argv[0], strlen(argv[0]));
+			if (m >= 0) {
+				printf("Yes(%d)\n", m);
+			} else {
+				printf("No\n");
+				e = 3;
+			}
+			argv++;
+		}
+		exit(e);
 	}
 
 	debug("Key type: %s\n", params.key_type);
@@ -450,6 +492,7 @@ static void scan_conf_file(struct parameters *params, int dirfd, const char *con
 	for (confline = 1;; confline++) {
 		unsigned int wildness[4] = {};
 		unsigned int len;
+		int m;
 
 		/* read the file line-by-line */
 		if (!fgets(buf, sizeof(buf), conf)) {
@@ -478,9 +521,10 @@ static void scan_conf_file(struct parameters *params, int dirfd, const char *con
 			goto syntax_error;
 		*p = 0;
 
-		if (!match(q, p - q, params->op, params->oplen, &wildness[0]))
+		m = match(q, p - q, params->op, params->oplen);
+		if (m < 0)
 			continue;
-
+		wildness[0] += m;
 		p++;
 
 		/* attempt to match the type */
@@ -494,8 +538,10 @@ static void scan_conf_file(struct parameters *params, int dirfd, const char *con
 			goto syntax_error;
 		*p = 0;
 
-		if (!match(q, p - q, params->key_type, params->ktlen, &wildness[1]))
+		m = match(q, p - q, params->key_type, params->ktlen);
+		if (m < 0)
 			continue;
+		wildness[1] += m;
 
 		p++;
 
@@ -510,9 +556,10 @@ static void scan_conf_file(struct parameters *params, int dirfd, const char *con
 			goto syntax_error;
 		*p = 0;
 
-		if (!match(q, p - q, params->key_desc, params->kdlen, &wildness[2]))
+		m = match(q, p - q, params->key_desc, params->kdlen);
+		if (m < 0)
 			continue;
-
+		wildness[2] += m;
 		p++;
 
 		/* attempt to match the callout info */
@@ -526,8 +573,10 @@ static void scan_conf_file(struct parameters *params, int dirfd, const char *con
 			goto syntax_error;
 		*p = 0;
 
-		if (!match(q, p - q, params->callout_info, params->cilen, &wildness[3]))
+		m = match(q, p - q, params->callout_info, params->cilen);
+		if (m < 0)
 			continue;
+		wildness[3] += m;
 
 		p++;
 
@@ -569,75 +618,174 @@ syntax_error:
 	line_error("Syntax error\n");
 }
 
+static void mdebug(const char *msg,
+		   const char *pattern, unsigned int plen,
+		   const char *datum, unsigned int dlen)
+{
+	if (match_debug)
+		printf("- %s(%*.*s,%*.*s)\n",
+		       msg, plen, plen, pattern, dlen, dlen, datum);
+}
+
+static void mdebug2(const char *msg)
+{
+	if (match_debug)
+		printf("- %s\n", msg);
+}
+
 /*****************************************************************************/
 /*
  * attempt to match a datum to a pattern
  * - one asterisk is allowed anywhere in the pattern to indicate a wildcard
- * - returns true if matched, false if not
- * - adds the total number of chars skipped by wildcard to *_wildness
+ * - returns -1 if not matched or the number of chars skipped by wildcard
  */
-static int match(const char *pattern, int plen, const char *datum, int dlen,
-		 unsigned int *_wildness)
+static int match(const char *pattern, unsigned int plen,
+		 const char *datum, unsigned int dlen)
 {
-	const char *asterisk;
-	int n;
+	const char *left, *right;
+	unsigned int wild = 0, n;
 
 	if (verbosity >= 2)
 		debug("match(%*.*s,%*.*s)", plen, plen, pattern, dlen, dlen, datum);
+	mdebug("match", pattern, plen, datum, dlen);
 
-	asterisk = memchr(pattern, '*', plen);
-	if (!asterisk) {
-		/* exact match only if no wildcard */
-		if (plen == dlen && memcmp(pattern, datum, dlen) == 0)
-			goto yes;
+	if (plen <= 0)
 		goto no;
+
+	/* Special case "*" matches everything */
+	if (plen == 1 && pattern[0] == '*') {
+		wild = dlen;
+		goto yes;
 	}
 
-	/* the datum mustn't be shorter than the pattern without the asterisk */
-	if (dlen < plen - 1)
+	left = memchr(pattern, '*', plen);
+	if (!left) {
+		/* No wildcard: exact match only. */
+		mdebug2("exact-only");
+		if (plen == dlen && memcmp(pattern, datum, dlen) == 0) {
+			wild = 0;
+			goto yes;
+		}
 		goto no;
+	}
 
-	n = asterisk - pattern;
-	if (n == 0) {
-		/* wildcard at beginning of pattern */
-		pattern++;
-		if (!*pattern)
-			goto yes_wildcard; /* "*" matches everything */
+	if (left > pattern) {
+		/* Check prefix matches. */
+		mdebug("prefix", pattern, left - pattern, datum, dlen);
+		if (dlen < left - pattern ||
+		    memcmp(pattern, datum, left - pattern) != 0) {
+			mdebug2("prefix-x");
+			goto no;
+		}
+		n = left - pattern;
+		datum += n;
+		dlen  -= n;
+		pattern += n + 1;
+		plen    -= n + 1;
+		while (plen > 0 && *pattern == '*') {
+			pattern++;
+			plen--;
+		}
+		if (!plen) {
+			/* Simple prefix match. */
+			mdebug2("simple-prefix");
+			wild = dlen;
+			goto yes;
+		}
+	} else {
+		while (plen > 0 && *pattern == '*') {
+			pattern++;
+			plen--;
+		}
+	}
 
-		/* match the end of the datum */
-		if (memcmp(pattern, datum + (dlen - (plen - 1)), plen - 1) == 0)
-			goto yes_wildcard;
-		goto no;
+	right = memrchr(pattern, '*', plen);
+	if (right != pattern + plen - 1) {
+		/* Check suffix matches */
+		const char *suffix = right ? right + 1 : pattern;
+		const char *p_end = pattern + plen;
+		const char *d_end = datum + dlen;
+		int slen = p_end - suffix;
+
+		mdebug("suffix", suffix, slen, datum, dlen);
+		if (slen > dlen ||
+		    memcmp(suffix, d_end - slen, slen) != 0) {
+			mdebug2("suffix-x");
+			goto no;
+		}
+		dlen -= slen;
+		plen -= slen;
+		while (plen > 0 && pattern[plen - 1] == '*')
+			plen--;
+		if (!plen) {
+			/* Simple prefix+suffix match. */
+			wild = dlen;
+			goto yes;
+		}
+	} else {
+		while (plen > 0 && pattern[plen - 1] == '*')
+			plen--;
 	}
 
-	/* need to match beginning of datum for "abc*" and "abc*def" */
-	if (memcmp(pattern, datum, n) != 0)
-		goto no;
+	/* We now have a remnant part of the pattern bounded by a pair of
+	 * wildcards (e.g.: [aa**]bb*cc*dd[**ee]) and we need to find the
+	 * middle substrings in order in the remnant part of the datum.  The
+	 * remnant pattern fragment may also contain further wildcards.
+	 */
+	for (;;) {
+		mdebug("middle", pattern, plen, datum, dlen);
+		const char *sub = pattern, *p;
+		int slen, skip;
+
+		left = memchr(pattern, '*', plen);
+		if (!left) {
+			/* No further wildcard */
+			mdebug2("middle-1");
+			if (plen > dlen)
+				goto no;
+			p = memmem(datum, dlen, pattern, plen);
+			if (!p) {
+				mdebug2("middle-1-x");
+				goto no;
+			}
+			wild += dlen - plen;
+			goto yes;
+		}
 
-	if (!asterisk[1])
-		goto yes_wildcard; /* "abc*" matches */
+		slen = left - pattern;
+		pattern = left + 1;
+		plen -= slen + 1;
 
-	/* match the end of the datum */
-	asterisk++;
-	n = plen - n - 1;
-	if (memcmp(pattern, datum + (dlen - n), n) == 0)
-		goto yes_wildcard;
+		p = memmem(datum, dlen, sub, slen);
+		if (!p) {
+			mdebug2("middle-x");
+			goto no;
+		}
+		skip = p - datum;
+		wild += skip;
+		datum += skip + slen;
+		dlen -= skip + slen;
+
+		while (plen && *pattern == '*') {
+			pattern++;
+			plen--;
+		}
 
-no:
-	if (verbosity >= 2)
-		debug(" = no\n");
-	return 0;
+		/* plen really shouldn't be 0 here. */
+		if (plen <= 0) {
+			error("plen unexpectedly 0\n");
+			goto no;
+		}
+	}
 
 yes:
 	if (verbosity >= 2)
-		debug(" = yes (w=0)\n");
-	return 1;
-
-yes_wildcard:
-	*_wildness += dlen - (plen - 1);
+		debug(" = yes (w=%u)\n", wild);
+	return wild;
+no:
 	if (verbosity >= 2)
-		debug(" = yes (w=%u)\n", dlen - (plen - 1));
-	return 1;
+		debug(" = no\n");
+	return -1;
 
 } /* end match() */
 


