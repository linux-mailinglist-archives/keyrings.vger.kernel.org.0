Return-Path: <keyrings+bounces-2979-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CD58FB32CA1
	for <lists+keyrings@lfdr.de>; Sun, 24 Aug 2025 02:03:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 889D81B210AB
	for <lists+keyrings@lfdr.de>; Sun, 24 Aug 2025 00:04:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B97C9A41;
	Sun, 24 Aug 2025 00:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dyWucTTg"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EA6736B;
	Sun, 24 Aug 2025 00:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755993826; cv=none; b=bajItJXrm4ni26m6ewl+Ng+xq1l2zG7BS19Ofv9kRzwg8eTFpR/jHe+nWaDco29kjMJaYciRE9qM3PDK4ws67MQIFE01qDOub80CqxvsZDhY1r+D23UiURgV5eKV085DybWwlonvB5h5DFq2cYBXxNN6mLyANB15pZbfmHfurok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755993826; c=relaxed/simple;
	bh=CFcVxcPvLawgDuRkyuHIK4u0LqGy1lq2LsL77RaDxHw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k0vOMf/qSvwmzNaDs6PQ1o1a0IdnSevfmry2hVO+If6YTEiJ6sU37Nt0IRtROCqA5LLPODP7fmsJoXddoF1POhTNCW5uyDOqFOVXkQcp51NGhCA9hgIq9sDuwu3CNw8G054Cnb/pM1+g6p+Ljmh44AT8zzczlN5QnD74YFWZoCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dyWucTTg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A00EC4CEE7;
	Sun, 24 Aug 2025 00:03:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755993826;
	bh=CFcVxcPvLawgDuRkyuHIK4u0LqGy1lq2LsL77RaDxHw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dyWucTTg96d6rfCUejCkzM4JaU4LzEGCfMX2Cy6cyiIGe5ipy/3w7kEDqI1O258A+
	 odx3e3Suck6YD8AKxTRWws1z/xEO2co0RBBfR4L4qCBWaijlFsNZzrE4kTcG0DBVIK
	 H2kO5ZTSHYfmzUbPU4Q70dVMx79V7l0Fh9muHBYC7AObroTILO6gIVI9XrwqPlQeAa
	 CJqQF5HOk8vkStvR9NTorjsTfcymZzp4AOGWwtqU5nVZIazk5Yvp5BElE/aXrPaXFv
	 i5lPQmJ8XJIeJgws5bfE11Gx8THx1Za/G1vFs4qIgr0UBfD9JbNCTD/1U3wGVmN9N0
	 fagOmp12q7rsg==
Date: Sun, 24 Aug 2025 03:03:42 +0300
From: Jarkko Sakkinen <jarkko@kernel.org>
To: David Howells <dhowells@redhat.com>
Cc: keyrings@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/7] request-key: Add help text
Message-ID: <aKpW3tlrcQp30QPd@kernel.org>
References: <20250822142215.2475014-1-dhowells@redhat.com>
 <20250822142215.2475014-6-dhowells@redhat.com>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250822142215.2475014-6-dhowells@redhat.com>

On Fri, Aug 22, 2025 at 03:22:12PM +0100, David Howells wrote:
> Add --help text to /sbin/request-key.
> 
> Signed-off-by: David Howells <dhowells@redhat.com>
> ---


Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>

>  man/request-key.8 | 42 +++++++++++++++++++++++++++-------
>  request-key.c     | 57 ++++++++++++++++++++++++++++++++++++++++++-----
>  2 files changed, 85 insertions(+), 14 deletions(-)
> 
> diff --git a/man/request-key.8 b/man/request-key.8
> index 50a7506..15b6bb8 100644
> --- a/man/request-key.8
> +++ b/man/request-key.8
> @@ -7,20 +7,37 @@
>  .\" as published by the Free Software Foundation; either version
>  .\" 2 of the License, or (at your option) any later version.
>  .\"
> -.TH REQUEST-KEY 8 "15 Nov 2011" Linux "Linux Key Management Utilities"
> +.TH REQUEST-KEY 8 "22 Aug 2025" Linux "Linux Key Management Utilities"
>  .SH NAME
>  request\-key \- handle key instantiation callback requests from the kernel
>  .SH SYNOPSIS
> -\fB/sbin/request\-key \fR<op> <key> <uid> <gid> <threadring> <processring>
> -	<sessionring> [<info>]
> +.nf
> +\fB/sbin/request\-key\fP [\fB--help\fP|\fB--version\fP]
> +\fB/sbin/request\-key\fP \fIop key uid gid t-ring p-ring s-ring\fP [\fIinfo\fP]
> +\fB/sbin/request\-key -d [-lnv] -D\fP \fIdesc\fP \fIop key\fP...
> +.fi
>  .SH DESCRIPTION
>  This program is invoked by the kernel when the kernel is asked for a key that
>  it doesn't have immediately available. The kernel creates a partially set up
> -key and then calls out to this program to instantiate it. It is not intended
> -to be called directly.
> +key and then calls out to this program to instantiate it. It is not intended to
> +be called directly.  A debugging capability is available through command line
> +options, however, to aid in testing and in debugging configuration.
>  .PP
> -However, for debugging purposes, it can be given some options on the command
> -line:
> +The normally required parameters are:
> +.IP \fBop\fP
> +The operation being done, such as "create" if a key is being instantiated for
> +creation.
> +.IP \fBkey\fP
> +The ID of the key being operated upon.
> +.IP "\fBuid\fP, \fBgid\fP"
> +The ownership of the task that caused the key to be created.
> +.IP "\fBt-ring\fP, \fBp-ring\fP, \fBs-ring\fP"
> +The thread, process and session keyrings of the task that caused the key to be
> +created.
> +.IP \fBinfo\fP
> +The optional callout info that can be passed by \fIrequest_key(2)\fP.
> +.PP
> +The options that may also be supplied are:
>  .IP \fB-d\fP
>  Turn on debugging mode.  In this mode, no attempts are made to access any keys
>  and, if a handler program is selected, it won't be executed; instead, this
> @@ -39,10 +56,19 @@ will be copied to the system log - this will prevent that.
>  .IP \fB-v\fP
>  Turn on debugging output.  This may be specified multiple times to produce
>  increasing levels of verbosity.
> +.IP \fB--help\fP
> +Print help text and exit.
>  .IP \fB--version\fP
>  Print the program version and exit.
> +.SH EXAMPLES
> +When using the debugging mode, all the parameters must be given, though a lot
> +of them don't matter and can be just set to 0, e.g.:
> +.PP
> +.nf
> +request-key -d -D "user;0;0;0;debug:bar" create 0 0 0 0 0 0 foo
> +.fi
>  .SH ERRORS
> -All errors will be logged to the syslog.
> +All errors will be logged to the syslog unless the \fB-n\fP option is given.
>  .SH FILES
>  .ul
>  /etc/request\-key.d/*.conf
> diff --git a/request-key.c b/request-key.c
> index d1feec3..9a7d741 100644
> --- a/request-key.c
> +++ b/request-key.c
> @@ -111,7 +111,7 @@ static void error(const char *fmt, ...)
>  {
>  	va_list va;
>  
> -	if (verbosity) {
> +	if (verbosity || debug_mode) {
>  		va_start(va, fmt);
>  		vfprintf(stderr, fmt, va);
>  		va_end(va);
> @@ -138,6 +138,45 @@ static void oops(int x)
>  	error("Died on signal %d", x);
>  }
>  
> +static const char help_text[] =
> +	"Usage: request-key [OPTIONS] [PARAMS]\n"
> +	"       request-key [OPTIONS] -d -D <desc> [PARAMS]\n"
> +	"\n"
> +	"Where the required parameters, [PARAMS], are, in order:\n"
> +	"  <op>     : The operation type (e.g. 'create')\n"
> +	"  <key>    : The ID of the key to be operated upon\n"
> +	"  <uid>    : The UID of the requesting process\n"
> +	"  <gid>    : The GID of the requesting process\n"
> +	"  <t-ring> : The thread keyring of the requesting process (or 0)\n"
> +	"  <p-ring> : The process keyring of the requesting process (or 0)\n"
> +	"  <s-ring> : The session keyring of the requesting process (or 0)\n"
> +	"  <callout>: The callout data supplied to the request\n"
> +	"\n"
> +	"and [OPTIONS] are none or more of\n"
> +	"  -d       : Debug mode for direct cmdline testing\n"
> +	"  -D <desc>: Description for debug mode\n"
> +	"  -l       : Use config from local dir, not /etc\n"
> +	"  -n       : Don't log to syslog\n"
> +	"  -v       : Turn up verbosity (can use multiple times)\n"
> +	"  --version: Print version and exit\n"
> +	"  --help   : Print this text and exit\n"
> +	"\n"
> +	"Service program lookup testing can be done with the '-d' option, but\n"
> +	"as there is no actual key to query, the called must supply the key's\n"
> +	"attributes manually using '-D' in the form returned by the\n"
> +	"'keyctl rdescribe' command, for example:\n"
> +	"\n"
> +	"  ./request-key -d -D \"user;0;0;0;debug:bar\" create 0 0 0 0 0 0 foo\n"
> +	"\n"
> +	"where 'user' is the key type and 'debug:bar' is the key description.\n"
> +	;
> +
> +static struct option long_options[] = {
> +	{ .name = "help",	.val = 1 },
> +	{ .name = "version",	.val = 2 },
> +	{}
> +};
> +
>  /*****************************************************************************/
>  /*
>   *
> @@ -149,19 +188,25 @@ int main(int argc, char *argv[])
>  	char *buf;
>  	int ret, ntype, dpos, n, fd, opt;
>  
> -	if (argc == 2 && strcmp(argv[1], "--version") == 0) {
> -		printf("request-key from %s (Built %s)\n",
> -		       keyutils_version_string, keyutils_build_string);
> -		return 0;
> +	if (argc == 1) {
> +		fputs(help_text, stderr);
> +		exit(2);
>  	}
>  
>  	signal(SIGSEGV, oops);
>  	signal(SIGBUS, oops);
>  	signal(SIGPIPE, SIG_IGN);
>  
> -	while (opt = getopt(argc, argv, "D:dlnv"),
> +	while (opt = getopt_long(argc, argv, "D:dlnv", long_options, NULL),
>  	       opt != -1) {
>  		switch (opt) {
> +		case 1:
> +			fputs(help_text, stderr);
> +			exit(2);
> +		case 2:
> +			printf("request-key from %s (Built %s)\n",
> +			       keyutils_version_string, keyutils_build_string);
> +			return 0;
>  		case 'D':
>  			test_desc = optarg;
>  			break;
> 

BR, Jarkko

