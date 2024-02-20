Return-Path: <keyrings+bounces-704-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FFE585C339
	for <lists+keyrings@lfdr.de>; Tue, 20 Feb 2024 19:00:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1B81D1C20D69
	for <lists+keyrings@lfdr.de>; Tue, 20 Feb 2024 18:00:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 493C277648;
	Tue, 20 Feb 2024 18:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sE2pq2kb"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2194476C70;
	Tue, 20 Feb 2024 18:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708452047; cv=none; b=E3RTSUCE9n+Tl8TKFO/TNNt07yzpvryBJPNsDGAE3Ak2VitEYBKf6Ym4fHijp3HkMDhzMGMN0oLxhGTgyxbg7s0EP1YwNPA3YHXUmpyZXJLD+dKixFDnB8d4pHsxDx0g6TkDFPhwNMYAKz3RaBD5LgXKXZOOoSk2zRS6ZPGisr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708452047; c=relaxed/simple;
	bh=Dhhd422rIU7Fe28Juuz6Lqp97VGVe56qgQbVeLGmTwo=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=S1dLlh3ariafzgWerzReowNy5YrYBcYNpF/CQ+pMPOQyN/sescT9nxXfSr9x+jz23ki+pq1vtTmYRQSvdgh+MLEWq6PVG3pKAY8HP8EbqkP3J/gLsWDaqNkXe+JS2A2w9zP/ENzwvfnIxKIOJyPLkBwRiPM7z6RxyV3F+Ymx5o0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sE2pq2kb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCE93C433C7;
	Tue, 20 Feb 2024 18:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708452046;
	bh=Dhhd422rIU7Fe28Juuz6Lqp97VGVe56qgQbVeLGmTwo=;
	h=Date:To:Cc:Subject:From:References:In-Reply-To:From;
	b=sE2pq2kb3nMi2cd7Rf5ZtbeaUzyD/HXPZWq+4lPvT8MJjIjV5sF+CvpDstBY+TZP1
	 CbY7goMP47h+tHF+e274bjxghAGf+P8lhBsV3ySj8XytvyzNjO03IJT0JDp9PwCnCo
	 lfHs2lmoOvHWuvcizBm6WT9Tsxo7xs9VXMJTDPodPEVko209DQlehJFwXNStQYNBeB
	 N3vqQ0WCpcwti8AyMgKpFGYHrlSUC5E1lfAvizEPmBnJUZlSRL73OV5JGJrcaiCWiT
	 tW6hPSU0PihaAP4nvNAfObkzEjZETVChMwdsErrR5qmwcaizkssUIXJirBRqLP8xZP
	 mm4TGDShkdYkA==
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 20 Feb 2024 18:00:41 +0000
Message-Id: <CZA3PCY3U4YU.3R05ZC4X16EX0@seitikki>
To: "Lukas Wunner" <lukas@wunner.de>, "David Howells" <dhowells@redhat.com>,
 "Herbert Xu" <herbert@gondor.apana.org.au>, "David S. Miller"
 <davem@davemloft.net>, "Jonathan Cameron" <Jonathan.Cameron@huawei.com>
Cc: <keyrings@vger.kernel.org>, <linux-crypto@vger.kernel.org>, "Andy
 Shevchenko" <andriy.shevchenko@linux.intel.com>, "Peter Zijlstra"
 <peterz@infradead.org>, "Dan Williams" <dan.j.williams@intel.com>, "Ard
 Biesheuvel" <ardb@kernel.org>, "Nick Desaulniers"
 <ndesaulniers@google.com>, "Nathan Chancellor" <nathan@kernel.org>
Subject: Re: [PATCH v3] X.509: Introduce scope-based x509_certificate
 allocation
From: "Jarkko Sakkinen" <jarkko@kernel.org>
X-Mailer: aerc 0.15.2
References: <63cc7ab17a5064756e26e50bc605e3ff8914f05a.1708439875.git.lukas@wunner.de>
In-Reply-To: <63cc7ab17a5064756e26e50bc605e3ff8914f05a.1708439875.git.lukas@wunner.de>

On Tue Feb 20, 2024 at 3:10 PM UTC, Lukas Wunner wrote:
> Add a DEFINE_FREE() clause for x509_certificate structs and use it in
> x509_cert_parse() and x509_key_preparse().  These are the only functions
> where scope-based x509_certificate allocation currently makes sense.
> A third user will be introduced with the forthcoming SPDM library
> (Security Protocol and Data Model) for PCI device authentication.

I think you are adding scope-based memory management and not
DEFINE_FREE(). Otherwise, this would be one-liner patch.

I'm not sure if the last sentence adds more than clutter as this
patch has nothing to do with SPDM changes per se.

> Unlike most other DEFINE_FREE() clauses, this one checks for IS_ERR()
> instead of NULL before calling x509_free_certificate() at end of scope.
> That's because the "constructor" of x509_certificate structs,
> x509_cert_parse(), returns a valid pointer or an ERR_PTR(), but never
> NULL.
>
> I've compared the Assembler output before/after and they are identical,
> save for the fact that gcc-12 always generates two return paths when
> __cleanup() is used, one for the success case and one for the error case.

Use passive as commit message is not a personal letter.

>
> In x509_cert_parse(), add a hint for the compiler that kzalloc() never
> returns an ERR_PTR().  Otherwise the compiler adds a gratuitous IS_ERR()
> check on return.  Introduce a handy assume() macro for this which can be
> re-used elsewhere in the kernel to provide hints for the compiler.

Does not explain why it is "handy".

I don't see a story here but instead I see bunch of disordered tecnical
terms.

We have the code diff for detailed technical stuff. The commit message
should simply explain why we want this and what it does for us. And we
zero care about PCI changes in the scope of this patch, especially since
this is not part of such patch set.

BR, Jarkko

