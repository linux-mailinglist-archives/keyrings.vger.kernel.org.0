Return-Path: <keyrings+bounces-2667-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 77A71AA511D
	for <lists+keyrings@lfdr.de>; Wed, 30 Apr 2025 18:04:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D8DD19C00B5
	for <lists+keyrings@lfdr.de>; Wed, 30 Apr 2025 16:04:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEF8125A343;
	Wed, 30 Apr 2025 16:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jS+eFxKq"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A84025B1D9
	for <keyrings@vger.kernel.org>; Wed, 30 Apr 2025 16:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746029092; cv=none; b=F/0cWDxQNT3i/GxECN1YBUZKuy6CqGuHengatCOecbGIrYxxChivhgjM3n2TmmsRqmW8WAGOZsr9zElluMceEXyMuo22i5dPGEXWvh/6vMTvsHRNJpJLn99tl9zruaIn3q1fwpLS0KbM+K1yGya7FqPYN1r/X+JoJCQcJYUTlfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746029092; c=relaxed/simple;
	bh=P8UsjTu77Emhh/t0VMJhwApr8/0+0MAz3nk89AoHOnM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ilxQ+hrG+tjLSlUUMnwn37eul9Y8V56q9cTCeLCRwN3INgqXmImYkP+ZXq0X4kF1tRn5/Dqd4mD0au3RqT4Il/PUkvMJzu1kuIq3tMWLCvq+jPv71nvTAdJmir87UGDZSUXU3A3mnvHfptcGUj0E7esDG9YiRtuJzpeHnx8WmRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jS+eFxKq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57208C4CEE7;
	Wed, 30 Apr 2025 16:04:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746029091;
	bh=P8UsjTu77Emhh/t0VMJhwApr8/0+0MAz3nk89AoHOnM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jS+eFxKq4dJwh1J6f3Jtxc295RohqzBBCp+zypzc+ASeD86vPl29AwB3Rtxe84w9Z
	 K77I8ncayGkw22D0aVdFClp4/K0fHF6B+0p5jA766IpZdz6vgjbwiOXN3ELZgq/EFD
	 KET9LXNSdUDbhNhEN9IFrbxJodPSxZYGSZjB8LgyCIioolnxyBdXS58a0eKC7brHT0
	 daOD0lK1nAD8tirDn7MQG5PaJ/YgX1anuH7hM3qxdM5i2yDtGQobMjAR8q6UDaTxDM
	 4vEgWBApbzjPJ1/OFFMpRurk8S25DA9RPYEtE+lCf+zzvy3MQ47yKo3z4VU07b8eJi
	 cxTXqQP4kYcQw==
Date: Wed, 30 Apr 2025 19:04:47 +0300
From: Jarkko Sakkinen <jarkko@kernel.org>
To: David Howells <dhowells@redhat.com>
Cc: keyrings@vger.kernel.org
Subject: Re: [PATCH keyutils] test: Hide endianness
Message-ID: <aBJKH22UePEBneAg@kernel.org>
References: <2813085.1745332819@warthog.procyon.org.uk>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2813085.1745332819@warthog.procyon.org.uk>

On Tue, Apr 22, 2025 at 03:40:19PM +0100, David Howells wrote:
> Hi Jarkko,
> 
> Having tried a bunch of ways to determine the cpu endianness so that I can
> generate model content to compare against the raw contents of a keying, I
> think it might be better to sidestep the problem and rely on 'od' to byteswap
> the raw contents and then compare.  What do you think?

It's a heck a lot less convoluted at least.


> 
> David
> ---
> test: Hide endianness
> 
> Hide the endianness of the raw binary contents of a keyring by passing it
> through /usr/bin/od which will automatically byteswap it in 4-byte chunks
> rather than trying to detect the endianness by examining what may be a
> binary file to obtain a string the format of which changes over time.
> 
> Signed-off-by: David Howells <dhowells@redhat.com>
> ---
>  tests/keyctl/reading/valid/runtest.sh |    9 ++-------
>  tests/toolbox.inc.sh                  |   36 +++++++++++++++++++++++-------------
>  2 files changed, 25 insertions(+), 20 deletions(-)
> 
> diff --git a/tests/keyctl/reading/valid/runtest.sh b/tests/keyctl/reading/valid/runtest.sh
> index 2fb88b9..2527f13 100644
> --- a/tests/keyctl/reading/valid/runtest.sh
> +++ b/tests/keyctl/reading/valid/runtest.sh
> @@ -40,13 +40,8 @@ expect_payload payload "67697a7a 617264"
>  
>  # read the contents of the keyring as hex and match it to the key ID
>  marker "READ KEYRING"
> -read_key $keyringid
> -tmp=`printf %08x $keyid`
> -if [ "$endian" = "LE" ]
> -then
> -    tmp=`echo $tmp | sed 's/\(..\)\(..\)\(..\)\(..\)/\4\3\2\1/'`
> -fi
> -expect_payload payload $tmp
> +pipe_key_int32 $keyringid
> +expect_payload payload $keyid
>  
>  # remove read permission from the key and try reading it again
>  # - we should still have read permission because it's searchable in our
> diff --git a/tests/toolbox.inc.sh b/tests/toolbox.inc.sh
> index 609a6c7..6f4fb18 100644
> --- a/tests/toolbox.inc.sh
> +++ b/tests/toolbox.inc.sh
> @@ -12,19 +12,6 @@
>  
>  echo === $OUTPUTFILE ===
>  
> -endian=`file -L /proc/$$/exe`
> -if expr "$endian" : '.* MSB \+\(pie executable\|executable\|shared object\).*' >&/dev/null
> -then
> -    endian=BE
> -elif expr "$endian" : '.* LSB \+\(pie executable\|executable\|shared object\).*' >&/dev/null
> -then
> -    endian=LE
> -else
> -    echo -e "+++ \e[31;1mCan't Determine Endianness\e[0m"
> -    echo "+++ Can't Determine Endianness" >>$OUTPUTFILE
> -    exit 2
> -fi
> -
>  maxtypelen=31
>  maxtype=`for ((i=0; i<$((maxtypelen)); i++)); do echo -n a; done`
>  
> @@ -1055,6 +1042,29 @@ function pipe_key ()
>      fi
>  }
>  
> +###############################################################################
> +#
> +# pipe a key's raw payload to od to stdout, displaying it as a sequence of
> +# 32-bit numbers, appropriately byteswapped.
> +#
> +###############################################################################
> +function pipe_key_int32 ()
> +{
> +    my_exitval=0
> +    if [ "x$1" = "x--fail" ]
> +    then
> +	my_exitval=1
> +	shift
> +    fi
> +
> +    echo keyctl pipe $1 \| od -t u4 -A none >>$OUTPUTFILE
> +    echo `keyctl pipe $1 | od -t u4 -A none` >>$OUTPUTFILE 2>&1
> +    if [ $? != $my_exitval ]
> +    then
> +	failed
> +    fi
> +}
> +
>  ###############################################################################
>  #
>  # pipe a key's raw payload through md5sum
> 

Yeah, I mean it's also a change from text processing tool to a binary
tool (from complex to simple), so IMHO this quite obvious:

Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>

BR, Jarkko


