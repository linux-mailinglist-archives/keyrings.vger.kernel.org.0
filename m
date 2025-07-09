Return-Path: <keyrings+bounces-2916-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 404E3AFEA2E
	for <lists+keyrings@lfdr.de>; Wed,  9 Jul 2025 15:29:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D81B9587882
	for <lists+keyrings@lfdr.de>; Wed,  9 Jul 2025 13:26:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CABFF2DFA32;
	Wed,  9 Jul 2025 13:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=digikod.net header.i=@digikod.net header.b="zNmNIxQ0"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp-1909.mail.infomaniak.ch (smtp-1909.mail.infomaniak.ch [185.125.25.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2830A2E5B3D
	for <keyrings@vger.kernel.org>; Wed,  9 Jul 2025 13:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.25.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752067536; cv=none; b=OtrfVlcMoTEXrDo/QmxsrZrbd0Cgce+SVsn2lDb7ffe4hEZwzsev4nO9HE1hA6Q1wJ5vzPg2IN6Ew8GpibqUvAVC9upUVYGpl9Y/6dCuNCCsrJGxa4kywQ5ZEOvStZGcKQHcCzfGmoWJIUP0Fb8SeV+6PoieUkStWPL8piPJGjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752067536; c=relaxed/simple;
	bh=529vMxoUETNz3a2irTlz0MIO1m7YmbMlOMc22IQW1Kw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fQu2rqDvc5xRoUkqQNNee6iidEkezNkRTh++RBK1GEePgcH+FlxUL9BNqWoF0oOlE79qTNwt+X5y6/nLxABUyYgOYvSb2y4toaqJcVaTiH1gZlvHIftqbWftqpZF5JnK648YTi8SIycIICMCa+eA/usHcgMY0kbNSRpov1ue8OA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=digikod.net; spf=pass smtp.mailfrom=digikod.net; dkim=pass (1024-bit key) header.d=digikod.net header.i=@digikod.net header.b=zNmNIxQ0; arc=none smtp.client-ip=185.125.25.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=digikod.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=digikod.net
Received: from smtp-4-0001.mail.infomaniak.ch (smtp-4-0001.mail.infomaniak.ch [10.7.10.108])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4bcdqp0fTvz230;
	Wed,  9 Jul 2025 15:19:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=digikod.net;
	s=20191114; t=1752067189;
	bh=m3BWQpuQmEFZdrMj5SD0N9Qqh8R1aqfc25e9m6GeQKg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=zNmNIxQ0BaFGtdW8ah7zpIhdNqK+MCYgP2iAT0TZdxM2doJNNc+2dEgG02Xp4YlyS
	 mfo+XYxcj5juyIwfbq5dwTteWq7qLkr2Vh5w2MWTbiErFAxQb52ZS/e/0dYWK18pv9
	 ZbcvxLJeHdD2Dy9DM/8P+5Cku6krckuEC9S4tfrc=
Received: from unknown by smtp-4-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4bcdqm4WJmzrmS;
	Wed,  9 Jul 2025 15:19:48 +0200 (CEST)
Date: Wed, 9 Jul 2025 15:19:47 +0200
From: =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>
To: David Howells <dhowells@redhat.com>, 
	David Woodhouse <dwmw2@infradead.org>
Cc: keyrings@vger.kernel.org, Eric Snowberg <eric.snowberg@oracle.com>, 
	Jarkko Sakkinen <jarkko@kernel.org>, Daniel Urbonas <t-durbonas@microsoft.com>, 
	linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] tools/certs: Make print-cert-tbs-hash.sh compatible with
 recent OpenSSL
Message-ID: <20250709.ZooYu6oasaiN@digikod.net>
References: <20240729180233.1114694-1-mic@digikod.net>
 <20241007.aek5Ohpahlai@digikod.net>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241007.aek5Ohpahlai@digikod.net>
X-Infomaniak-Routing: alpha

I can take it but I'd like an Acked-by please.

On Mon, Oct 07, 2024 at 08:42:16PM +0200, Mickaël Salaün wrote:
> Could someone please take this patch?
> 
> On Mon, Jul 29, 2024 at 08:02:32PM +0200, Mickaël Salaün wrote:
> > Recent OpenSSL versions (2 or 3) broke the "x509" argument parsing by
> > not handling "-in -" (unlike OpenSSL 1.1):
> >   Could not open file or uri for loading certificate from -: No such
> >   file or directory
> > 
> > Avoid this issue and still make this script work with older versions of
> > OpenSSL by using implicit arguments instead.
> > 
> > To hopefully make it more future-proof, apply the same simplifications
> > for other OpenSSL commands.
> > 
> > Cc: David Howells <dhowells@redhat.com>
> > Cc: David Woodhouse <dwmw2@infradead.org>
> > Cc: Eric Snowberg <eric.snowberg@oracle.com>
> > Cc: Jarkko Sakkinen <jarkko@kernel.org>
> > Reported-by: Daniel Urbonas <t-durbonas@microsoft.com>
> > Fixes: 58d416351e6d ("tools/certs: Add print-cert-tbs-hash.sh")
> > Signed-off-by: Mickaël Salaün <mic@digikod.net>
> > ---
> >  tools/certs/print-cert-tbs-hash.sh | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> > 
> > diff --git a/tools/certs/print-cert-tbs-hash.sh b/tools/certs/print-cert-tbs-hash.sh
> > index c93df5387ec9..22bdeec4d286 100755
> > --- a/tools/certs/print-cert-tbs-hash.sh
> > +++ b/tools/certs/print-cert-tbs-hash.sh
> > @@ -54,7 +54,7 @@ RANGE_AND_DIGEST_RE='
> >  '
> >  
> >  RANGE_AND_DIGEST=($(echo "${PEM}" | \
> > -	openssl asn1parse -in - | \
> > +	openssl asn1parse | \
> >  	sed -n -e "${RANGE_AND_DIGEST_RE}"))
> >  
> >  if [ "${#RANGE_AND_DIGEST[@]}" != 3 ]; then
> > @@ -85,7 +85,7 @@ if [ -z "${DIGEST_MATCH}" ]; then
> >  fi
> >  
> >  echo "${PEM}" | \
> > -	openssl x509 -in - -outform DER | \
> > +	openssl x509 -outform DER | \
> >  	dd "bs=1" "skip=${OFFSET}" "count=${END}" "status=none" | \
> > -	openssl dgst "-${DIGEST_MATCH}" - | \
> > +	openssl dgst "-${DIGEST_MATCH}" | \
> >  	awk '{printf "tbs:" $2}'
> > -- 
> > 2.45.2
> > 

