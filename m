Return-Path: <keyrings+bounces-1176-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E9088BB883
	for <lists+keyrings@lfdr.de>; Sat,  4 May 2024 01:51:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CBD82B21378
	for <lists+keyrings@lfdr.de>; Fri,  3 May 2024 23:51:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8EF984D1F;
	Fri,  3 May 2024 23:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Rxuz3epp"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC5EB82D68;
	Fri,  3 May 2024 23:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714780274; cv=none; b=gS0U0j4QIuE1/fP5SFkgvqr9VwCbxcPho5pKnRCy3expjnF+KTV7joD4TWY8pHgTdEYLGfJC9/n6oQAP8Qfm2hFj4gXbQJDwi0Cs7BGvRUrepI4qKyGt2Kzebler5bavyU30BQS4ZReyFvIxiAqvTd0iNwIuYYok2jhssNgCAVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714780274; c=relaxed/simple;
	bh=ansExeZ54EN2Gwl1KlKzW+ZHZ0Hp2A8hYwISf5vI6es=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=n/0Gu3B3sTLZhBdUHqsBvUjU7EHXvPZU4h/3y6t+VuEMcXeFfh2fMae79hfKoB3XIzdbKzW8LwLPVOcEqM62SMCFZEQIH9oShJqXhcg9AiL10oQK6dH4UmgzEqaFMDBlWhgKCpEFjsqy/Ap/mJUJubrHdWYcXf6mD4enwIFRiNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Rxuz3epp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DA11C116B1;
	Fri,  3 May 2024 23:51:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714780274;
	bh=ansExeZ54EN2Gwl1KlKzW+ZHZ0Hp2A8hYwISf5vI6es=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=Rxuz3eppCG7YzxNlBSdEO+oWVb4epP13J8oYH5yrhvQ9XfHsWfgN3037C/fI/Qy3C
	 GQfGe82OLj59IJ99uPUQoiV8wuxToy2jGXmoiPFke/WwUlESWW9vNC9+wrQDwa/sDl
	 5GgG0Mnz5YPyUn7j/tNA5U55hVYdaa9qXmzeIqVwYHh6oU+K8KEmyUrqNQbWf5wBAt
	 vArtLRMLy0S9Br1AGuXbGbcYej/6McQZbngdJOKlKGw9ghD1CBHNE/HZWoAjt/DbOj
	 Ew/uL26jGNIRmYdNogpxMsquXtYxBGLNt1SvhxTUY2X8CmJXOg4+l6ceECu29dATQH
	 H9KzhBS8gBW7A==
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 04 May 2024 02:51:10 +0300
Message-Id: <D10EVH7PZ358.F5M40RN8AII7@kernel.org>
Cc: "Lukas Wunner" <lukas@wunner.de>, "Stefan Berger"
 <stefanb@linux.ibm.com>, <keyrings@vger.kernel.org>,
 <linux-crypto@vger.kernel.org>, <davem@davemloft.net>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] crypto: ecc - Protect ecc_digits_from_bytes from
 reading too many bytes
From: "Jarkko Sakkinen" <jarkko@kernel.org>
To: "Jarkko Sakkinen" <jarkko@kernel.org>, "Herbert Xu"
 <herbert@gondor.apana.org.au>
X-Mailer: aerc 0.17.0
References: <20240426225553.3038070-1-stefanb@linux.ibm.com>
 <D0W3MTR0CY08.Q2UIYE4N274L@kernel.org> <Zi8UXS1MD5V58dnN@wunner.de>
 <D0WIZTMRKHSJ.1Z4ZV54DLVWAB@kernel.org>
 <ZjS83WIPglXiUH3n@gondor.apana.org.au>
 <D10EUK2TUF57.1E87NSEA2ZYU@kernel.org>
In-Reply-To: <D10EUK2TUF57.1E87NSEA2ZYU@kernel.org>

On Sat May 4, 2024 at 2:49 AM EEST, Jarkko Sakkinen wrote:
> On Fri May 3, 2024 at 1:30 PM EEST, Herbert Xu wrote:
> > On Mon, Apr 29, 2024 at 01:14:15PM +0300, Jarkko Sakkinen wrote:
> > >=20
> > > Yeah, sure, that would be even better, or even memzero_explicit()?
> >
> > memzero_explicit should only be used for stack memory.
>
> BTW, is this in kernel documentation? It's a guideline really
> and would be nice to have reminder, that's all.

Any case makes sense and is pretty obvious now that you said it.

BR, Jarkko

