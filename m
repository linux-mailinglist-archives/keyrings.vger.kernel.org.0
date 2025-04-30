Return-Path: <keyrings+bounces-2668-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CA48AA5127
	for <lists+keyrings@lfdr.de>; Wed, 30 Apr 2025 18:05:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 67A063B59ED
	for <lists+keyrings@lfdr.de>; Wed, 30 Apr 2025 16:05:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32640258CE3;
	Wed, 30 Apr 2025 16:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uQMZ2yQ8"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DBC41494CC
	for <keyrings@vger.kernel.org>; Wed, 30 Apr 2025 16:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746029149; cv=none; b=hWrArChI8H4iMcuSrYlJaAX49Lm4fJdJX/Bfw8ewKWQFpMbvBb2gcvzHbNju7BGlKJ6I9CwpZjtpKAZ5vIggLPicmoKC82y5ie0A1rhag1qE32D0oEYhixwDWBldIKXlu5ihmEA5DawGdz5DloMsenXpls0DMsFRRrxEJ07/rHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746029149; c=relaxed/simple;
	bh=EK0n7GMXORAnFFilX3z9Rer5aEvC+3CVO1q/qf7S1QE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IyWQZHC22CQ3yl82IePwWx+bzl5iPBu5a9hFNUYlgBi5YixH50vpJzUz5iU8z65qpu+FkkpE4p5VaJsBg7mFHSFJA2jcW+XSlrWONWvX+nqrQlZ1nSm5aIKnAlb9RLY6FQQNFvxJ8z0HoaczxuOkOdrdnKsIx/qSSI6AtkocVto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uQMZ2yQ8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D60FAC4CEE7;
	Wed, 30 Apr 2025 16:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746029148;
	bh=EK0n7GMXORAnFFilX3z9Rer5aEvC+3CVO1q/qf7S1QE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uQMZ2yQ86RU1vY0U7pF+P46wae35CtKSJXpyZCgy8L0X0UIiLIUFyRVt6LveWAWAm
	 N3bSjtRh73EDr8XOwJE4Mel3/lr3iiBzb0bdVwrtRM2sMYsIT3EOltWmTN1JHJDYwO
	 Wt9VSj7aLPizSPZ0F6+fNPB+m3aNXt8ZdZge6ziDwsfVkKDTKqwE+qTcYzKXoaLsWi
	 JqY32GreF2PFNFh/97C4DjVkwSejZAgws5fvyTqbYGI+9ceI8iqs3SG1tiZbVltB0m
	 cmtlVPXeiMsCprXiXN9/sjJsXVmYacokSMPJ4Mrzx96SJCE3JsnSz6T6ydXCj+NrgC
	 62Z/IfeQWYbfg==
Date: Wed, 30 Apr 2025 19:05:43 +0300
From: Jarkko Sakkinen <jarkko@kernel.org>
To: David Howells <dhowells@redhat.com>
Cc: keyrings@vger.kernel.org
Subject: Re: [PATCH keyutils] tests: Add skips for testing of unsupported
 features
Message-ID: <aBJKV5vbo9OP5eei@kernel.org>
References: <3089643.1745491480@warthog.procyon.org.uk>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3089643.1745491480@warthog.procyon.org.uk>

On Thu, Apr 24, 2025 at 11:44:40AM +0100, David Howells wrote:
> Hi Jarkko,
> 
> Here's a patch I'm proposing to add to the keyutils testsuite so that I can
> use it with some older OS versions.
> 
> David
> ---
> tests: Add skips for testing of unsupported features
> 
> Add skips for features that are either unsupported by the kernel or by the
> keyutils package.
>     
> Signed-off-by: David Howells <dhowells@redhat.com>
> ---
>  tests/features/limits/runtest.sh          |    6 +++++
>  tests/hex2bin.pl                          |   21 +++++++++++++++++++
>  tests/keyctl/id/bad-args/runtest.sh       |    6 +++++
>  tests/keyctl/id/noargs/runtest.sh         |    6 +++++
>  tests/keyctl/id/valid/runtest.sh          |    6 +++++
>  tests/keyctl/move/bad-args/runtest.sh     |    6 +++++
>  tests/keyctl/move/noargs/runtest.sh       |    6 +++++
>  tests/keyctl/move/recursion/runtest.sh    |    6 +++++
>  tests/keyctl/move/valid/runtest.sh        |    6 +++++
>  tests/keyctl/session/valid2/runtest.sh    |    6 +++++
>  tests/keyctl/supports/bad-args/runtest.sh |    6 +++++
>  tests/keyctl/supports/valid/runtest.sh    |    6 +++++
>  tests/prepare.inc.sh                      |   23 ++++++++++++++++++++
>  tests/toolbox.inc.sh                      |   33 ++++++++++++++++++++++++------
>  14 files changed, 136 insertions(+), 7 deletions(-)
> 
> diff --git a/tests/features/limits/runtest.sh b/tests/features/limits/runtest.sh
> index 3af2f5a..7642071 100644
> --- a/tests/features/limits/runtest.sh
> +++ b/tests/features/limits/runtest.sh
> @@ -9,6 +9,12 @@
>  result=PASS
>  echo "++++ BEGINNING TEST" >$OUTPUTFILE
>  
> +if ! keyutils_at_or_later_than 1.6.2
> +then
> +    toolbox_skip_test $TEST "SKIPPING DUE TO LACK OF 'keyctl --test'"
> +    exit 0
> +fi
> +
>  # This doesn't work on MIPS earler than 3.19 because of a kernel bug
>  kver=`uname -r`
>  kmch=`uname -m`
> diff --git a/tests/hex2bin.pl b/tests/hex2bin.pl
> new file mode 100644
> index 0000000..4f0f27a
> --- /dev/null
> +++ b/tests/hex2bin.pl
> @@ -0,0 +1,21 @@
> +#!/usr/bin/perl -w
> +use strict;
> +
> +die "Format:\n\t$0 <hex> [<hex>]*\n\t$0 -\n" unless (@ARGV);
> +
> +my $str = "";
> +
> +if ($ARGV[0] eq "-") {
> +    shift(@ARGV);
> +    $str .= $_ while (<STDIN>);
> +} else {
> +    $str = join("", @ARGV);
> +}
> +
> +$str =~ s/[ \t\n]//g;
> +die "odd length string\n" if (length($str) & 1);
> +
> +for (; $str; $str = substr($str, 2)) {
> +    my $pair = hex(substr($str, 0, 2));
> +    print pack("C", $pair);
> +}
> diff --git a/tests/keyctl/id/bad-args/runtest.sh b/tests/keyctl/id/bad-args/runtest.sh
> index 957d1a5..bba62c6 100644
> --- a/tests/keyctl/id/bad-args/runtest.sh
> +++ b/tests/keyctl/id/bad-args/runtest.sh
> @@ -6,6 +6,12 @@
>  
>  # ---- do the actual testing ----
>  
> +if [ $have_id_command = 0 ]
> +then
> +    toolbox_skip_test $TEST "SKIPPING DUE TO LACK OF 'keyctl id'"
> +    exit 0
> +fi
> +
>  result=PASS
>  echo "++++ BEGINNING TEST" >$OUTPUTFILE
>  
> diff --git a/tests/keyctl/id/noargs/runtest.sh b/tests/keyctl/id/noargs/runtest.sh
> index aff9de6..b95c596 100644
> --- a/tests/keyctl/id/noargs/runtest.sh
> +++ b/tests/keyctl/id/noargs/runtest.sh
> @@ -6,6 +6,12 @@
>  
>  # ---- do the actual testing ----
>  
> +if [ $have_id_command = 0 ]
> +then
> +    toolbox_skip_test $TEST "SKIPPING DUE TO LACK OF 'keyctl id'"
> +    exit 0
> +fi
> +
>  result=PASS
>  echo "++++ BEGINNING TEST" >$OUTPUTFILE
>  
> diff --git a/tests/keyctl/id/valid/runtest.sh b/tests/keyctl/id/valid/runtest.sh
> index ffed995..2c06b3d 100644
> --- a/tests/keyctl/id/valid/runtest.sh
> +++ b/tests/keyctl/id/valid/runtest.sh
> @@ -6,6 +6,12 @@
>  
>  # ---- do the actual testing ----
>  
> +if [ $have_id_command = 0 ]
> +then
> +    toolbox_skip_test $TEST "SKIPPING DUE TO LACK OF 'keyctl id'"
> +    exit 0
> +fi
> +
>  result=PASS
>  echo "++++ BEGINNING TEST" >$OUTPUTFILE
>  
> diff --git a/tests/keyctl/move/bad-args/runtest.sh b/tests/keyctl/move/bad-args/runtest.sh
> index b1c7e66..9410941 100644
> --- a/tests/keyctl/move/bad-args/runtest.sh
> +++ b/tests/keyctl/move/bad-args/runtest.sh
> @@ -6,6 +6,12 @@
>  
>  # ---- do the actual testing ----
>  
> +if [ $have_move_key = 0 ]
> +then
> +    toolbox_skip_test $TEST "SKIPPING DUE TO LACK OF 'keyctl move'"
> +    exit 0
> +fi
> +
>  result=PASS
>  echo "++++ BEGINNING TEST" >$OUTPUTFILE
>  
> diff --git a/tests/keyctl/move/noargs/runtest.sh b/tests/keyctl/move/noargs/runtest.sh
> index 29a91f1..8ad91e9 100644
> --- a/tests/keyctl/move/noargs/runtest.sh
> +++ b/tests/keyctl/move/noargs/runtest.sh
> @@ -6,6 +6,12 @@
>  
>  # ---- do the actual testing ----
>  
> +if [ $have_move_key = 0 ]
> +then
> +    toolbox_skip_test $TEST "SKIPPING DUE TO LACK OF 'keyctl move'"
> +    exit 0
> +fi
> +
>  result=PASS
>  echo "++++ BEGINNING TEST" >$OUTPUTFILE
>  
> diff --git a/tests/keyctl/move/recursion/runtest.sh b/tests/keyctl/move/recursion/runtest.sh
> index 36cd5cb..8b90be8 100644
> --- a/tests/keyctl/move/recursion/runtest.sh
> +++ b/tests/keyctl/move/recursion/runtest.sh
> @@ -6,6 +6,12 @@
>  
>  # ---- do the actual testing ----
>  
> +if [ $have_move_key = 0 ]
> +then
> +    toolbox_skip_test $TEST "SKIPPING DUE TO LACK OF 'keyctl move'"
> +    exit 0
> +fi
> +
>  result=PASS
>  echo "++++ BEGINNING TEST" >$OUTPUTFILE
>  
> diff --git a/tests/keyctl/move/valid/runtest.sh b/tests/keyctl/move/valid/runtest.sh
> index 31b51d7..20ccff2 100644
> --- a/tests/keyctl/move/valid/runtest.sh
> +++ b/tests/keyctl/move/valid/runtest.sh
> @@ -6,6 +6,12 @@
>  
>  # ---- do the actual testing ----
>  
> +if [ $have_move_key = 0 ]
> +then
> +    toolbox_skip_test $TEST "SKIPPING DUE TO LACK OF 'keyctl move'"
> +    exit 0
> +fi
> +
>  result=PASS
>  echo "++++ BEGINNING TEST" >$OUTPUTFILE
>  
> diff --git a/tests/keyctl/session/valid2/runtest.sh b/tests/keyctl/session/valid2/runtest.sh
> index 12ad234..1642395 100644
> --- a/tests/keyctl/session/valid2/runtest.sh
> +++ b/tests/keyctl/session/valid2/runtest.sh
> @@ -6,6 +6,12 @@
>  
>  # ---- do the actual testing ----
>  
> +if [ $have_id_command = 0 ]
> +then
> +    toolbox_skip_test $TEST "SKIPPING DUE TO LACK OF 'keyctl id'"
> +    exit 0
> +fi
> +
>  result=PASS
>  echo "++++ BEGINNING TEST" >$OUTPUTFILE
>  
> diff --git a/tests/keyctl/supports/bad-args/runtest.sh b/tests/keyctl/supports/bad-args/runtest.sh
> index 05581a4..f87f517 100644
> --- a/tests/keyctl/supports/bad-args/runtest.sh
> +++ b/tests/keyctl/supports/bad-args/runtest.sh
> @@ -6,6 +6,12 @@
>  
>  # ---- do the actual testing ----
>  
> +if [ $have_capabilities = 0 ]
> +then
> +    toolbox_skip_test $TEST "SKIPPING DUE TO LACK OF 'keyctl supports'"
> +    exit 0
> +fi
> +
>  result=PASS
>  echo "++++ BEGINNING TEST" >$OUTPUTFILE
>  
> diff --git a/tests/keyctl/supports/valid/runtest.sh b/tests/keyctl/supports/valid/runtest.sh
> index 2c62ef2..4e41200 100644
> --- a/tests/keyctl/supports/valid/runtest.sh
> +++ b/tests/keyctl/supports/valid/runtest.sh
> @@ -6,6 +6,12 @@
>  
>  # ---- do the actual testing ----
>  
> +if [ $have_capabilities = 0 ]
> +then
> +    toolbox_skip_test $TEST "SKIPPING DUE TO LACK OF 'keyctl supports'"
> +    exit 0
> +fi
> +
>  result=PASS
>  echo "++++ BEGINNING TEST" >$OUTPUTFILE
>  
> diff --git a/tests/prepare.inc.sh b/tests/prepare.inc.sh
> index 4033d69..be134da 100644
> --- a/tests/prepare.inc.sh
> +++ b/tests/prepare.inc.sh
> @@ -112,11 +112,14 @@ then
>      esac
>  fi
>  
> +have_capabilities=0
>  have_key_invalidate=0
>  have_big_key_type=0
>  have_dh_compute=0
> -have_restrict_keyring=0
> +have_move_key=0
>  have_notify=0
> +have_public_key=0
> +have_restrict_keyring=0
>  
>  if keyctl supports capabilities >&/dev/null
>  then
> @@ -179,3 +182,21 @@ if [ "$SKIPINSTALLREQ" = "yes" ]
>  then
>      skip_install_required=1
>  fi
> +
> +#
> +# Check if "keyctl id" is supported
> +#
> +have_id_command=0
> +if keyutils_at_or_later_than 1.6.2
> +then
> +    have_id_command=1
> +fi
> +
> +#
> +# Check if "keyctl pkey_*" are supported
> +#
> +have_pkey_commands=0
> +if keyutils_at_or_later_than 1.6
> +then
> +    have_pkey_commands=1
> +fi
> diff --git a/tests/toolbox.inc.sh b/tests/toolbox.inc.sh
> index 6f4fb18..212b353 100644
> --- a/tests/toolbox.inc.sh
> +++ b/tests/toolbox.inc.sh
> @@ -613,8 +613,15 @@ function create_key ()
>  	my_keyring=$4
>      fi
>  
> -    echo keyctl add "$@" >>$OUTPUTFILE
> -    keyctl add "$@" >>$OUTPUTFILE 2>&1
> +    if [ "$1" = "-x" ] && version_less_than $OSRELEASE 9
> +    then
> +	shift
> +	echo perl ../../../hex2bin.pl "$3" "|" keyctl padd "$1 $2 $4" >>$OUTPUTFILE
> +	perl ../../../hex2bin.pl "$3" | keyctl padd "$1" "$2" "$4" >>$OUTPUTFILE
> +    else
> +	echo keyctl add "$@" >>$OUTPUTFILE
> +	keyctl add "$@" >>$OUTPUTFILE 2>&1
> +    fi
>      e=$?
>      if [ $e == $my_exitval ]
>      then
> @@ -682,8 +689,15 @@ function pcreate_key ()
>  	my_keyring=$3
>      fi
>  
> -    echo echo -n $data \| keyctl padd "$@" >>$OUTPUTFILE
> -    echo -n $data | keyctl padd "$@" >>$OUTPUTFILE 2>&1
> +    if [ "$1" = "-x" ] && version_less_than $OSRELEASE 9
> +    then
> +	shift
> +	echo echo -n $data \| perl ../../../hex2bin.pl "|" keyctl padd "$@" >>$OUTPUTFILE
> +	echo -n $data | perl ../../../hex2bin.pl - | keyctl padd "$@" >>$OUTPUTFILE
> +    else
> +	echo echo -n $data \| keyctl padd "$@" >>$OUTPUTFILE
> +	echo -n $data | keyctl padd "$@" >>$OUTPUTFILE 2>&1
> +	fi
>      e=$?
>      if [ $e == $my_exitval ]
>      then
> @@ -1232,8 +1246,15 @@ function update_key ()
>  	shift
>      fi
>  
> -    echo keyctl update "$@" >>$OUTPUTFILE
> -    keyctl update "$@" >>$OUTPUTFILE 2>&1
> +    if [ "x$1" = "x-x" ] && version_less_than $OSRELEASE 9
> +    then
> +	shift
> +	echo perl ../../../hex2bin.pl "$2" "|" keyctl pupdate "$1" >>$OUTPUTFILE
> +	perl ../../../hex2bin.pl "$2" | keyctl pupdate "$1" >>$OUTPUTFILE
> +    else
> +	echo keyctl update "$@" >>$OUTPUTFILE
> +	keyctl update "$@" >>$OUTPUTFILE 2>&1
> +    fi
>      e=$?
>      if [ $e == $my_exitval ]
>      then
> 

LGTM

Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>

BR, Jarkko

