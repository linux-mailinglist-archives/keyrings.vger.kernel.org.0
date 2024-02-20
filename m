Return-Path: <keyrings+bounces-705-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 729D885C343
	for <lists+keyrings@lfdr.de>; Tue, 20 Feb 2024 19:03:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 02BC3B2445F
	for <lists+keyrings@lfdr.de>; Tue, 20 Feb 2024 18:03:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D82A776C9F;
	Tue, 20 Feb 2024 18:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AOw0sgVg"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE08C76C83;
	Tue, 20 Feb 2024 18:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708452188; cv=none; b=i5Q8Bq5l1XsZZEkollUoXw0WgytT0ennN184KqvvfpJ0aY0e4f/V5/VlWDOmtWWsip0y/gfztv76DBrgT5i0sapZM4Tqp8mLJ68tphRGhFCjRnsQR0AuSx2zQ2rGJec9VcNAuLfWKtORlpfV8SVyY27zu6ThRHcCO+EkfOhVDqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708452188; c=relaxed/simple;
	bh=yPSlryxt4R8pj3MxRFRtP46K8MzZYDku9kbAxbJ3Otk=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=Sdg1DiMGbLWDKcAoKkv0ckMe4xP/WjYNanfM+u6/LcEaRETs2a8mwyvLrirE3+Z48S4SvNPeFG0w9uwx4bqKKdzZycLLW5qYnHTXquGcutrvsqRe4V7K2//eAqR79pfWksx8g8hEVtKzcdn1nhdWBVDPagkDgpew2AxXtrwoP6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AOw0sgVg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1483EC433F1;
	Tue, 20 Feb 2024 18:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708452188;
	bh=yPSlryxt4R8pj3MxRFRtP46K8MzZYDku9kbAxbJ3Otk=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=AOw0sgVg1wZzwis6jy7i+48gWccEwvAKQ5XzAiSMdjdvIwecnoKrGJ3CJrRAIcxMk
	 ESLoHXy8xOfVx/f1dk0xyGE0qGGdvcXdrcqnq1zStYYnl4C+3Ab+7Vnyn8Eru9z9kG
	 WloTdBOA9uVO+4lAKClLHUZSXDRSLTFVSQp9w/2ondklXbqO4PMB+P8WLfG+kIwWrS
	 Zszw1DtlKXZyL99jF7tIRkqUseioutq79fzQBeRhOtp7E4G+PDkL7xXf5NiYdeQoAY
	 Ct9e3+OO6SzIflZ4b+Qsz+4q75FFwyFDnO6+phbnpINmLAQM9XIRLvEQQDQGHGjnJ1
	 U2w3URs4IL2lg==
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 20 Feb 2024 18:03:02 +0000
Message-Id: <CZA3R5R9CVYD.1HH1S662FW2RX@seitikki>
Cc: <keyrings@vger.kernel.org>, <linux-crypto@vger.kernel.org>, "Andy
 Shevchenko" <andriy.shevchenko@linux.intel.com>, "Peter Zijlstra"
 <peterz@infradead.org>, "Dan Williams" <dan.j.williams@intel.com>, "Ard
 Biesheuvel" <ardb@kernel.org>, "Nick Desaulniers"
 <ndesaulniers@google.com>, "Nathan Chancellor" <nathan@kernel.org>
Subject: Re: [PATCH v3] X.509: Introduce scope-based x509_certificate
 allocation
From: "Jarkko Sakkinen" <jarkko@kernel.org>
To: "Jarkko Sakkinen" <jarkko@kernel.org>, "Lukas Wunner" <lukas@wunner.de>,
 "David Howells" <dhowells@redhat.com>, "Herbert Xu"
 <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>,
 "Jonathan Cameron" <Jonathan.Cameron@huawei.com>
X-Mailer: aerc 0.15.2
References: <63cc7ab17a5064756e26e50bc605e3ff8914f05a.1708439875.git.lukas@wunner.de> <CZA3PCY3U4YU.3R05ZC4X16EX0@seitikki>
In-Reply-To: <CZA3PCY3U4YU.3R05ZC4X16EX0@seitikki>

On Tue Feb 20, 2024 at 6:00 PM UTC, Jarkko Sakkinen wrote:
> On Tue Feb 20, 2024 at 3:10 PM UTC, Lukas Wunner wrote:
> > Add a DEFINE_FREE() clause for x509_certificate structs and use it in
> > x509_cert_parse() and x509_key_preparse().  These are the only function=
s
> > where scope-based x509_certificate allocation currently makes sense.
> > A third user will be introduced with the forthcoming SPDM library
> > (Security Protocol and Data Model) for PCI device authentication.
>
> I think you are adding scope-based memory management and not
> DEFINE_FREE(). Otherwise, this would be one-liner patch.
>
> I'm not sure if the last sentence adds more than clutter as this
> patch has nothing to do with SPDM changes per se.
>
> > Unlike most other DEFINE_FREE() clauses, this one checks for IS_ERR()
> > instead of NULL before calling x509_free_certificate() at end of scope.
> > That's because the "constructor" of x509_certificate structs,
> > x509_cert_parse(), returns a valid pointer or an ERR_PTR(), but never
> > NULL.
> >
> > I've compared the Assembler output before/after and they are identical,
> > save for the fact that gcc-12 always generates two return paths when
> > __cleanup() is used, one for the success case and one for the error cas=
e.
>
> Use passive as commit message is not a personal letter.
>
> >
> > In x509_cert_parse(), add a hint for the compiler that kzalloc() never
> > returns an ERR_PTR().  Otherwise the compiler adds a gratuitous IS_ERR(=
)
> > check on return.  Introduce a handy assume() macro for this which can b=
e
> > re-used elsewhere in the kernel to provide hints for the compiler.
>
> Does not explain why it is "handy".
>
> I don't see a story here but instead I see bunch of disordered tecnical
> terms.
>
> We have the code diff for detailed technical stuff. The commit message
> should simply explain why we want this and what it does for us. And we
> zero care about PCI changes in the scope of this patch, especially since
> this is not part of such patch set.

I mean think it this way.

What is the most important function of a commit message? Well, it comes
when the commit is in the mainline. It reminds of the *reasons* why a
change was made and this commit message does not really serve well in
that role.

BR, Jarkko

