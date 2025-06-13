Return-Path: <keyrings+bounces-2836-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D8679AD9328
	for <lists+keyrings@lfdr.de>; Fri, 13 Jun 2025 18:49:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2DE847A4153
	for <lists+keyrings@lfdr.de>; Fri, 13 Jun 2025 16:47:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C08020127A;
	Fri, 13 Jun 2025 16:49:13 +0000 (UTC)
X-Original-To: keyrings@vger.kernel.org
Received: from frasgout12.his.huawei.com (frasgout12.his.huawei.com [14.137.139.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC1904207F;
	Fri, 13 Jun 2025 16:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=14.137.139.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749833352; cv=none; b=CZiyJWuEHPulJ4gSywhOWzyvBZj8bxkXgrlxXECqOiLuE61om1JvV4Qpi8yN73sR0mahhANSkQwp6pfdyi+F73KW3fDIzx8+cnVvmledvRPIEGJKX703pDST34H3D659gmfEESv7TwshsE5kIVC3miA3+2FxKSn2ev1QjRcdGNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749833352; c=relaxed/simple;
	bh=Kzcv1y0IlQTrRjySbtAFTooNBaHArg/VI4VIiCWODrQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lH6Mfym1ahPKnheK2QLJs5RQi+TIJJPGKddMt3pQIP0R7PqEl2Vfl/BXVoI3AcpIKvG+iMbTbCVQ2kVhUnyiXfWk5PS07KNaVJA2qeVATknEJc8lsc8GnGRLvDoBI8WiVTndj71QcLZsa5yqvaU0f6hNoqxg6+bDabymzPnwVLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com; spf=pass smtp.mailfrom=huaweicloud.com; arc=none smtp.client-ip=14.137.139.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaweicloud.com
Received: from mail.maildlp.com (unknown [172.18.186.51])
	by frasgout12.his.huawei.com (SkyGuard) with ESMTPS id 4bJlKM0wr0zsSKX;
	Sat, 14 Jun 2025 00:31:51 +0800 (CST)
Received: from mail02.huawei.com (unknown [7.182.16.47])
	by mail.maildlp.com (Postfix) with ESMTP id 806121402FC;
	Sat, 14 Jun 2025 00:32:57 +0800 (CST)
Received: from [127.0.0.1] (unknown [10.204.63.22])
	by APP1 (Coremail) with SMTP id LxC2BwCnLUyYUkxomp2vCQ--.58407S2;
	Fri, 13 Jun 2025 17:32:56 +0100 (CET)
Message-ID: <5dbd2f9d79e0ffee006c5c9f448d486737d93b6a.camel@huaweicloud.com>
Subject: Re: Module signing and post-quantum crypto public key algorithms
From: Roberto Sassu <roberto.sassu@huaweicloud.com>
To: James Bottomley <James.Bottomley@HansenPartnership.com>, David Howells
 <dhowells@redhat.com>, Herbert Xu <herbert@gondor.apana.org.au>, Stephan
 Mueller <smueller@chronox.de>, Simo Sorce <simo@redhat.com>,
 torvalds@linux-foundation.org, Paul Moore <paul@paul-moore.com>
Cc: Lukas Wunner <lukas@wunner.de>, Ignat Korchagin <ignat@cloudflare.com>, 
 Clemens Lang <cllang@redhat.com>, David Bohannon <dbohanno@redhat.com>,
 Roberto Sassu <roberto.sassu@huawei.com>, keyrings@vger.kernel.org, 
 linux-crypto@vger.kernel.org, linux-security-module@vger.kernel.org, 
 linux-kernel@vger.kernel.org
Date: Fri, 13 Jun 2025 18:32:21 +0200
In-Reply-To: <01f2f3171dd0f1cd9dcb496ac66bc6903767a2d2.camel@HansenPartnership.com>
References: <501216.1749826470@warthog.procyon.org.uk>
	 <01f2f3171dd0f1cd9dcb496ac66bc6903767a2d2.camel@HansenPartnership.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu2 
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-CM-TRANSID:LxC2BwCnLUyYUkxomp2vCQ--.58407S2
X-Coremail-Antispam: 1UD129KBjvJXoW3GFykJr45Zr43ZF45CrWDtwb_yoW7ZFW3pF
	W5tFWYkrWkJFn2yFn2ka18KF4Fyws3Jw45Jr9xG348Z3Z8XFnxAr1IkFWYvFZrCrs3G3WY
	vrWSyrn2kws5ZaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvmb4IE77IF4wAFF20E14v26ryj6rWUM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
	vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7Cj
	xVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxV
	AFwI0_Gr0_Gr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40E
	x7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x
	0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI1lc7CjxVAaw2AF
	wI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4
	xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r4a6rW5
	MIIYY7kG6xAYrwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2I
	x0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2
	z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnU
	UI43ZEXa7IU5pmh7UUUUU==
X-CM-SenderInfo: purev21wro2thvvxqx5xdzvxpfor3voofrz/1tbiAQASBGhLzecHGAACsD

On Fri, 2025-06-13 at 12:13 -0400, James Bottomley wrote:
> On Fri, 2025-06-13 at 15:54 +0100, David Howells wrote:
> > Hi,
> >=20
> > So we need to do something about the impending quantum-related
> > obsolescence of the RSA signatures that we use for module signing,
> > kexec, BPF signing, IMA and a bunch of other things.
>=20
> Wait, that's not necessarily the whole threat.  There are two possible
> ways quantum could compromise us.  One is a computer that has enough
> qbits to run the shor algorithm and break non-quantum crypto.  The
> other is that a computer comes along with enough qbits to speed up the
> brute force attacks using the grover algorithm.  NIST still believes
> the latter will happen way before the former, so our first step should
> be doubling the number of security bits in existing algorithms, which
> means ECC of at least 512 bits (so curve25519 needs replacing with at
> least curve448) and for all practical purposes deprecating RSA (unless
> someone wants to play with huge keys).
>=20
> > From my point of view, the simplest way would be to implement key
> > verification in the kernel for one (or more) of the available post-
> > quantum algorithms (of which there are at least three), driving this
> > with appropriate changes to the X.509 certificate to indicate that's
> > what we want to use.
>=20
> Can you at least enumerate them?  There's still a dispute going on
> about whether we should use pure post-quantum or hybrid.  I tend to
> think myself that hybrid is best for durable things like digital
> signatures but given the NIST advice, we should be using > 512 bit
> curves for that.
>=20
> > The good news is that Stephan Mueller has an implemementation that
> > includes
> > kernel bits that we can use, or, at least, adapt:
> >=20
> > 	https://github.com/smuellerDD/leancrypto/
>=20
> So the only hybrid scheme in there is dilithium+25519 which doesn't
> quite fit the bill (although I'm assuming dilithium+448 could easily be
> implemented)
>=20
> >=20
> > Note that we only need the signature verification bits.=C2=A0 One
> > question, though: he's done it as a standalone "leancrypto" module,
> > not integrated into crypto/, but should it be integrated into crypto/
> > or is the standalone fine?
> >=20
> > The not so good news, as I understand it, though, is that the X.509
> > bits are not yet standardised.
> >=20
> >=20
> > However!=C2=A0 Not everyone agrees with this.=C2=A0 An alternative prop=
osal
> > would rather get the signature verification code out of the kernel
> > entirely.=C2=A0 Simo Sorce's proposal, for example, AIUI, is to compile
> > all the hashes we need into the kernel at build time, possibly with a
> > hashed hash list to be loaded later to reduce the amount of
> > uncompressible code in the kernel.=C2=A0 If signatures are needed at al=
l,
> > then this should be offloaded to a userspace program (which would
> > also have to be hashed and marked unptraceable and I think
> > unswappable) to do the checking.
> >=20
> > I don't think we can dispense with signature checking entirely,
> > though: we need it for third party module loading, quick single-
> > module driver updates and all the non-module checking stuff.=C2=A0 If i=
t
> > were to be done in userspace, this might entail an upcall for each
> > signature we want to check - either that, or the kernel has to run a
> > server process that it can delegate checking to.
>=20
> I agree we can't predict everything at build time, so we need a runtime
> scheme (like signatures) as well.  However, I'm not convinced it should
> be run outside the kernel.  The expansion of the TCB plus the amount of
> checking the kernel has to do to make sure the upcall is secure adds to
> the vulnerability over in-kernel where everything just works.
>=20
> > It's also been suggested that PQ algorithms are really slow.=C2=A0 For
> > kernel modules that might not matter too much as we may well not load
> > more than 200 or so during boot - but there are other users that may
> > get used more frequently (IMA, for example).
>=20
> If we go with a hybrid signature scheme, we can start off with only
> verifying the pre-quantum signature and have a switch to verify both.
>=20
> > Now, there's also a possible hybrid approach, if I understand Roberto
> > Sassu's proposal correctly, whereby it caches bundles of hashes
> > obtained from, say, the hashes included in an RPM.=C2=A0 These bundles =
of
> > hashes can be checked by signature generated by the package signing
> > process.=C2=A0 This would reduce the PQ overhead to checking a bundle a=
nd
> > would also make IMA's measuring easier as the hashes can be added in
> > the right order, rather than being dependent on the order that the
> > binaries are used.
>=20
> I think you're referring to the IMA digest list extension proposal:
>=20
> https://github.com/initlove/linux/wiki/IMA-Digest-Lists-Extension
>=20
> I'm not sure it's been progressed much.

The latest iteration can be found here:

https://lore.kernel.org/linux-integrity/20241119104922.2772571-1-roberto.sa=
ssu@huaweicloud.com/

It is more or less ready for upstreaming (from my point of view), with
the exception of a few comments that I still need to address.

The main problem was parsing the RPM headers in the kernel, that Linus
didn't like, but I believe I solved it now with Mimi's suggestion of
making the digest list parsers pluggable (so the RPM parser has been
removed from this submission, and moved to a kernel module that is
expected to be signed by distros).

I explored the alternative of moving the parser to user space, but as
you mentioned, it is a more risky approach.

Other than that, yes, it makes IMA much faster in my benchmarks (~34
seconds to lookup 12312 digests and verify 303 ECDSA signatures, as
opposed to ~98 seconds to verify 12312 ECDSA signatures).

Roberto


