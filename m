Return-Path: <keyrings+bounces-3411-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 06185C77108
	for <lists+keyrings@lfdr.de>; Fri, 21 Nov 2025 03:51:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id E26C62D9AC
	for <lists+keyrings@lfdr.de>; Fri, 21 Nov 2025 02:49:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 517432D94A9;
	Fri, 21 Nov 2025 02:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fEyH3ZWm"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDB672D5936;
	Fri, 21 Nov 2025 02:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763693341; cv=none; b=jJ4LKRfmPzt0IUq8giwHi42/A0uj9amsM9rzUalfGGjFPI7WJdvif8u9V5tdhnykWaCNgLP+elrM9WSzlVZ7LZely3zrYK5DXtq1c3rmPbAyuxJiOk2MauGpGVe6zWXy9zYmAEGeZPtx54r2WgNTogBhnZsAyOv6MbPMNnvsMA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763693341; c=relaxed/simple;
	bh=rYCe1ng9GN8lAKrRsQFaHSoA6O7M1MA4Zq+l9DnN4lk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bidfALAD2HoHT9tjXdM92FScDo0oCjuOQMek/bdHTG8P/Y0e2bJ/2iV5l52hre81eo5OPyO9z9vgWZ6HVmDyEqWfM3k1Pxhgv/RHAKcs08fJMd0ZSGXonogKqoSm0/sAcbXQgIh7Y67DAQ1v7d8Jo51QeR+OeNCiDE5EiFecKmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fEyH3ZWm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BB70C4CEF1;
	Fri, 21 Nov 2025 02:49:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763693340;
	bh=rYCe1ng9GN8lAKrRsQFaHSoA6O7M1MA4Zq+l9DnN4lk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fEyH3ZWm+fsM6eRzbdK97zUu9tGNnECbv/u/cmG5V7+7VnhQXsSVn/y3OqDaBZGsY
	 ZzundhyXBblDJdPMckISY11zL4RbGMdpKp3rMbh/39JxLIAY4IVB13PVjrM7+YD1PB
	 sA7yEbRHw/ASyP/j2eUKOkUU6nE0NvbnCPPbHCOwtBaBnZJoHytKTNS9YAnp6pYlmM
	 DTzt7QM9Sld5kgvdCKPdc9OfSUyw+HI6KpPOUODTt3yiXxtNreUzUD1az3bZY2cTGj
	 UKbBX61r/wfiv/f8VxhRK3pztDNdu4Z3C98fxif90vz+NodQtweK7NCk/I0TQaiq3D
	 xtlrzsxdzzX+Q==
Date: Fri, 21 Nov 2025 02:48:58 +0000
From: Eric Biggers <ebiggers@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: David Howells <dhowells@redhat.com>, Mark Brown <broonie@kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	linux-crypto@vger.kernel.org, keyrings@vger.kernel.org,
	linux-modules@vger.kernel.org, linux-next@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: Pick up keys-pqc branch for linux-next?
Message-ID: <20251121024858.GF3078357@google.com>
References: <20251117145606.2155773-1-dhowells@redhat.com>
 <2157243.1763392923@warthog.procyon.org.uk>
 <20251117171126.GD1584@sol>
 <20251120205341.7e28927b@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251120205341.7e28927b@canb.auug.org.au>

On Thu, Nov 20, 2025 at 08:53:41PM +1100, Stephen Rothwell wrote:
> Hi David,
> 
> On Mon, 17 Nov 2025 09:11:26 -0800 Eric Biggers <ebiggers@kernel.org> wrote:
> >
> > On Mon, Nov 17, 2025 at 03:22:03PM +0000, David Howells wrote:
> > > 
> > > Can you pick up my keys-pqc branch for linux-next please?  It can be found at:
> > > 
> > > 	https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git/
> > > 	keys-pqc
> > > 
> > > Note that it's based on Eric Bigger's libcrypto/lbcrypto-next branch which I
> > > believe you already have in order to get SHA-3/SHAKE support.
> > 
> > I don't really see the point yet, since this isn't going to be ready for
> > the next merge window anyway.
> 
> Yeah, if it is not going into the next merge window, then I don't want
> it until after that merge window closes, OK?

Makes sense to me.  David, with
https://lore.kernel.org/r/20251120003653.335863-2-ebiggers@kernel.org
we're getting closer, but it's still too late for 6.19.  We need proper
tests to be added at the same time as the ML-DSA implementation itself.
The higher-level parts such as crypto/asymmetric_keys/ need review too.
Also, lib/crypto/ changes should go through the libcrypto tree.

wycheproof has negative test vectors for ML-DSA edge cases.  We maybe
could borrow those.  Note that ML-DSA keys and signatures are very
large, which results in huge files for the test vectors.  I'd also like
to keep the size down, but we might not have much choice there.

I'm also working to get another crypto-oriented developer, who doesn't
normally work on the Linux kernel, to review my ML-DSA code.  (I don't
think I was going to have any chance at getting anyone to look at the
original 4800-line submission, but with the 600-line one it's feasible.)

It's also worth noting that this is ML-DSA, not ML-KEM.  The
cryptographic community generally views upgrading to quantum-resistant
key encapsulation (e.g. ML-KEM) as more urgent than upgrading to
quantum-resistant signatures (e.g. ML-DSA).  I assume you have a reason
why you want the signatures.  That's fine, and I'm okay with ML-DSA
support being added.  But we shouldn't rush it in.

- Eric

