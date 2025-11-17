Return-Path: <keyrings+bounces-3371-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id C4D7BC65819
	for <lists+keyrings@lfdr.de>; Mon, 17 Nov 2025 18:32:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 188B43583F9
	for <lists+keyrings@lfdr.de>; Mon, 17 Nov 2025 17:18:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8610332919;
	Mon, 17 Nov 2025 17:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="szXxXd4X"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B34B630C601;
	Mon, 17 Nov 2025 17:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763399588; cv=none; b=Xl3KIwp/N+4r7SXhwTrjCCH/bF2N39HxbIXm9bzdpdVeDVLMbEnVXix7MKQrm6k49T/H2evs8fuWoRH4NJ4iZGE8hQBK+WI+RR8qGmm03zICGYMnfy7m94rP84M+vfSZeQ6MZEqLdwTgjNTKQQNJ2Qgtpd42P2tkgkTC0QBXMXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763399588; c=relaxed/simple;
	bh=eqlE9UvWpZDujuqfPvx8wBrXZo3p8g1cH7wpWiP0lW0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YrCH6+CgiPelY59g9XtcavPsPpKRdLYA6qemt/L8iJVzNGgDnBc6g/XYjXokVLrCLpD27mWv/FKdiV2hAwFQ+yJW9TYWeTlM2rqLACIo2kPoYjgY0z6lSSHQldCpTL9d5Y1Tw4PTzil1sm6Z8gjLA0d7J7qOl8BZUN83DI36ywo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=szXxXd4X; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5205AC113D0;
	Mon, 17 Nov 2025 17:13:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763399588;
	bh=eqlE9UvWpZDujuqfPvx8wBrXZo3p8g1cH7wpWiP0lW0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=szXxXd4XxFm2rNQTyhUR28W/APZJcRGHQm6JE62NbhiBErbMsncqQDlP+EqtGpw9l
	 EU8AyI/cR0S1iGrIvfGxuD6HEOlz60YLaSw/5U6A9doKyoakLgOmuiYVA5bVnrzY3g
	 bpaH/NX4Y9OQtBdhpmnauid+ij28D5aAG7T4mO9kYM5E/JOwq0HFEUhHbZ+ZUSCvnX
	 UtETS96nM3HQlQz7P1XpyKoHj1hR/rnXNRKNQizi6HjK8reG8prBL6ZzOVNUiL0HsU
	 iqoUjcaSkgNI56St/hKsYOgDKkvqPv9xf8mrYTPdmY3YN5dhAdrWqUEdBZsWAd1GJN
	 UrqPbMTPSnqOg==
Date: Mon, 17 Nov 2025 09:11:26 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: David Howells <dhowells@redhat.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
	Mark Brown <broonie@kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	linux-crypto@vger.kernel.org, keyrings@vger.kernel.org,
	linux-modules@vger.kernel.org, linux-next@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: Pick up keys-pqc branch for linux-next?
Message-ID: <20251117171126.GD1584@sol>
References: <20251117145606.2155773-1-dhowells@redhat.com>
 <2157243.1763392923@warthog.procyon.org.uk>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2157243.1763392923@warthog.procyon.org.uk>

On Mon, Nov 17, 2025 at 03:22:03PM +0000, David Howells wrote:
> Hi Stephen,
> 
> Can you pick up my keys-pqc branch for linux-next please?  It can be found at:
> 
> 	https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git/
> 	keys-pqc
> 
> Note that it's based on Eric Bigger's libcrypto/lbcrypto-next branch which I
> believe you already have in order to get SHA-3/SHAKE support.
> 

I don't really see the point yet, since this isn't going to be ready for
the next merge window anyway.

- Eric

