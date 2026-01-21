Return-Path: <keyrings+bounces-3872-lists+keyrings=lfdr.de@vger.kernel.org>
Delivered-To: lists+keyrings@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eB3RApk2cGl9XAAAu9opvQ
	(envelope-from <keyrings+bounces-3872-lists+keyrings=lfdr.de@vger.kernel.org>)
	for <lists+keyrings@lfdr.de>; Wed, 21 Jan 2026 03:14:49 +0100
X-Original-To: lists+keyrings@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id B0C264F994
	for <lists+keyrings@lfdr.de>; Wed, 21 Jan 2026 03:14:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 6DA4466F8B4
	for <lists+keyrings@lfdr.de>; Wed, 21 Jan 2026 02:14:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 274592E54B6;
	Wed, 21 Jan 2026 02:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EvaCi02j"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E250127B4F7;
	Wed, 21 Jan 2026 02:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768961656; cv=none; b=ks7eg3jJy79+EyOMmM7vojnEuXpy64tPUW1zG98JNs4cR2/+YMU3ne1VIQtlUfrwerL3gUNnbl2GmuHLqDbNJ5uNB+UecO49V1RyspUuee8nPYUsNfVOsulEtQl0A1lazpCprj3Yr64oNa8fFsTffYqWFupJDdXOHmpJlUYMcZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768961656; c=relaxed/simple;
	bh=BG9pkfBir7XLyspne+cVryo9UhHMwaspQ+CurD6p3FU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SB7SLF6dK34mzoLy2m7XUohqNrDWH5sf2skln+/U0WKxU6Fu0G5FyhzqvbGybN1RpVvSquIzzJ4YaT9jdNuJyQACiNaTNvPqIJQpY0YnCmAwpMlBU362q5M5KkGkfM7HAZq1Bpv96ht0QuSdE5p59ZvHTsKL+NlEmQZu+zQb//s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EvaCi02j; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1443C16AAE;
	Wed, 21 Jan 2026 02:14:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768961655;
	bh=BG9pkfBir7XLyspne+cVryo9UhHMwaspQ+CurD6p3FU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EvaCi02jvSfBnscmszmkY55oB161aLkf/C22HgL3eo/DNjXp0/zofrFZqvJDd43V6
	 pYHbAUY0dqogzyBrASpPMNyVhaO+CbCFC3KDypx/zF4XRF2MtC0S0tQLTux14rREby
	 fvifk2bX+kwc7WuZ9mtQQipM4W+DYrJAuoh9vPu37qbFMZUoCYv6GUhn9wyGMEwj0E
	 9ViYiH57Lb9eJl6Cpx5xm9vQReGpQhad37drvG7B8vum5Gn5NLgQSAqcWoykVI5xP/
	 CofAwUQQ5OtYYl3borIK/4fTtxTHvvlXs3UHHNwiHGOSdx7v7hbl+uiEQwtY48kLBj
	 JG067t3fMS4tA==
Date: Wed, 21 Jan 2026 02:14:13 +0000
From: Eric Biggers <ebiggers@kernel.org>
To: David Howells <dhowells@redhat.com>
Cc: Lukas Wunner <lukas@wunner.de>, Ignat Korchagin <ignat@cloudflare.com>,
	Jarkko Sakkinen <jarkko@kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Daniel Gomez <da.gomez@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Stephan Mueller <smueller@chronox.de>, linux-crypto@vger.kernel.org,
	keyrings@vger.kernel.org, linux-modules@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Tadeusz Struk <tadeusz.struk@intel.com>,
	"David S. Miller" <davem@davemloft.net>
Subject: Re: [PATCH v13 07/12] crypto: Add RSASSA-PSS support
Message-ID: <20260121021413.GA998999@google.com>
References: <20260120145103.1176337-1-dhowells@redhat.com>
 <20260120145103.1176337-8-dhowells@redhat.com>
 <20260120224108.GC6191@quark>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260120224108.GC6191@quark>
X-Spamd-Result: default: False [-1.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-3872-lists,keyrings=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ebiggers@kernel.org,keyrings@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[keyrings];
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo,metzdowd.com:url,googlesource.com:url]
X-Rspamd-Queue-Id: B0C264F994
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Jan 20, 2026 at 02:41:11PM -0800, Eric Biggers wrote:
> On Tue, Jan 20, 2026 at 02:50:53PM +0000, David Howells wrote:
> > Add support for RSASSA-PSS [RFC8017 sec 8.1] signature verification support
> > to the RSA driver in crypto/.
> 
> This additional feature significantly increases the scope of your
> patchset, especially considering that the kernel previously didn't
> implement RSASSA-PSS at all.  This patchset also doesn't include any
> explanation for why this additional feature is needed.  It might make
> sense to add this feature, but it needs to be properly explained, and it
> would be preferable for it to be its own patchset.
> 
> > The verification function requires an info string formatted as a
> > space-separated list of key=value pairs.  The following parameters need to
> > be provided:
> > 
> >  (1) sighash=<algo>
> > 
> >      The hash algorithm to be used to digest the data.
> > 
> >  (2) pss_mask=<type>,...
> > 
> >      The mask generation function (MGF) and its parameters.
> > 
> >  (3) pss_salt=<len>
> > 
> >      The length of the salt used.
> > 
> > The only MGF currently supported is "mgf1".  This takes an additional
> > parameter indicating the mask-generating hash (which need not be the same
> > as the data hash).  E.g.:
> > 
> >      "sighash=sha256 pss_mask=mgf1,sha256 pss_salt=32"
> 
> One of the issues with RSASSA-PSS is the excessive flexibility in the
> parameters, which often end up being attacker controlled.  Therefore
> many implementations of RSASSA-PSS restrict the allowed parameters to
> something reasonable, e.g. restricting the allowed hash algorithms,
> requiring the two hash algorithms to be the same, and requiring the salt
> size to match the digest size.  We should do likewise if possible.

Looking into this a bit more, I'm increasingly skeptical that RSASSA-PSS
would be a worthwhile addition, especially when integrated into CMS and
X.509.  It seems that while in theory it's an improvement over PKCS#1
v1.5 padding, the specifications were messed up and it has way too many
unnecessary and error-prone parameters.  Here are some references that
describe some of the issues in RSASSA-PSS:

    * https://boringssl-review.googlesource.com/c/boringssl/+/81656
    * https://www.metzdowd.com/pipermail/cryptography/2019-November/035449.html

It seems it might not be very widely used either.

I think the fact that this patchset implements RSASSA-PSS verification
incorrectly (by not verifying that the leading bit is zero) further
validates these concerns.

With RSA also being two generations behind the current generation of
signature algorithms (RSA => elliptic curves => lattices), I'm wondering
what the motivation for this feature is.

- Eric

