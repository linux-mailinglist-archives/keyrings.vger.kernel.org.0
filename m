Return-Path: <keyrings+bounces-2961-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6171AB21534
	for <lists+keyrings@lfdr.de>; Mon, 11 Aug 2025 21:14:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 73D3616BFD0
	for <lists+keyrings@lfdr.de>; Mon, 11 Aug 2025 19:14:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B76252E2830;
	Mon, 11 Aug 2025 19:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PFvedfDN"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CB062D47F6;
	Mon, 11 Aug 2025 19:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754939653; cv=none; b=gWM7lTeiSdff4mOM2OyI5pLzT80sTlJpTcTbYezgJuX3BQKBVdaEnr1ZM+UM6yUwPw+ldSRoc7eppS2K7tYWTADcf/3DQ6iw+6a/lGC5dNnFLxOCVcjNTT17rbVneJoJb/lo4U8Kv3sSvxEtCWEbqah2zjbWUlg/4gqo00Giqg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754939653; c=relaxed/simple;
	bh=cbaqCKPXEXPTfgN6IxyGi0nDJS2U4EFH4E50ryMtCQ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NG810SUDh+Obqhw1iGbIUR10Fj95QCakSwqdhPO4SGcKZhgbMnY/MCoU2+jLhNaAdT6Nio0dw24z3D38GS68PkLCpMKdxNZlJwcTWE0oQr+kSOFFWLg4I9sY5Q+x6mDRu8rNlwxbN5VJX1rt2Gi22+W10AwEzdW7dCrgSCRS1I0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PFvedfDN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7859FC4CEED;
	Mon, 11 Aug 2025 19:14:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754939653;
	bh=cbaqCKPXEXPTfgN6IxyGi0nDJS2U4EFH4E50ryMtCQ4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PFvedfDNl1Zg4/N8XuP6Mh9vPP5LeLyoZK+H9T8G+pniYPzO5kFWvqk8YDUGcYDru
	 yaGn03vcWftCBY67/MrlsEfWAz8eEsE6mFpRBNdMQ1vlikxykHhCUkOtlLB2jja8Ig
	 gx6ZnGYbQ5HpNG5h+8TAdVTZBj8kJkFekAMrYH/SyTDH3gbmtQrYPqA4nW7Jv/iWGR
	 k0SEaCxW7IJp61HdNzHKNiBU3XKy3AYMa+JpjXT0fiey+n0HHbQYxRm6kHdeMS/rRG
	 nDg0+T6QqrGfj+kpxsTTZaiPkK+0mCpBQelZVrKOEg4wpZvTmVvDeYWw8EmNyGHufB
	 erowVb8NmIX2w==
Date: Mon, 11 Aug 2025 12:14:08 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Nicolas Schier <nicolas.schier@linux.dev>
Cc: "longguang.yue" <bigclouds@163.com>, linux-kbuild@vger.kernel.org,
	masahiroy@kernel.org, David Howells <dhowells@redhat.com>,
	David Woodhouse <dwmw2@infradead.org>, keyrings@vger.kernel.org
Subject: Re: [PATCH] Makefile: mrproper deletes signing_key.x509
Message-ID: <20250811191408.GA169691@ax162>
References: <20250809120405.22957-1-bigclouds@163.com>
 <aJerjQGmXXcpTtBB@fjasle.eu>
 <1ac1d3e3.58ad.19897d159ff.Coremail.bigclouds@163.com>
 <20250811-diligent-rigorous-ara-e7a9d2@l-nschier-aarch64>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250811-diligent-rigorous-ara-e7a9d2@l-nschier-aarch64>

On Mon, Aug 11, 2025 at 03:59:23PM +0200, Nicolas Schier wrote:
> Cc: certs/ people
> 
> [re-ordered quote]
> On Mon, Aug 11, 2025 at 02:28:56PM +0800, longguang.yue wrote:
> > At 2025-08-10 04:11:57, "Nicolas Schier" <nicolas.schier@linux.dev> wrote:
> > > On Sat, Aug 09, 2025 at 08:04:05PM +0800 longguang.yue wrote:
> > > > deletes temporary signing_key.x509 and reserves user-defined x509.genkey
> > > 
> > > can you elaborate the actual problem with some more details?
> > > 
> > > certs/signing_key.x509 is removed during 'make clean' which is a dependency
> > > of 'mrproper'.
> > > 
> > > 'mrproper' is meant to remove everything that might influence a subsequent
> > > call of kbuild for the sane architecture.
> > > 
> > > Without further details I cannot see any problem here.
> > > 
> > > Kind regards,
> > > Nicolas
> [...]
> > 
> >   It should not delete x509.genkey because of its exsitence in gitignore.
> > Normally, users want to keep  a self-defined x509.genkey,  but mrproper deletes it, only default_x509.genkey is effective. 
> > After applying this patch, users just need to copy self-defined x509.genkey into certs directory once.
> 
> 'make mrproper' is meant to prepare the source tree to be as pristine as 
> possible for the given architecture.  This includes removal of any 
> configuration file(s) that influence subsequent builds.  From kbuild 
> point of view, certs/x509.genkey is also a kind of a configuration file, 
> as leaving it in tree after mrproper creates different build results 
> compared to a build from a really pristine source tree.

Agreed, I think it is intentional that this is in mrproper and not
clean, so I don't think we can accept this change as is, but I am happy
to be told otherwise from the certs maintainers.

> Iff the certs/ maintainers think that retaining a user x509.genkey file 
> over a mrproper makes sense, then we should probably adjust the rule for 
> generating $(objtree)/certs/x509.genkey, e.g. by allowing to provide one 
> by environment variable.
> 
> David or David, do you have an opinion on this?

Furthermore, if the user wanted to use a predefined x509 configuration,
why can't they generate their own signing key and provide it via
CONFIG_MODULE_SIG_KEY, instead of hijacking the default logic of
certs/signing_key.pem? Based on my reading of certs/Makefile, it sounds
like the default logic is mostly there just for allyesconfig or
randconfig.

Cheers,
Nathan

