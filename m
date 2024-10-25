Return-Path: <keyrings+bounces-2256-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A1B129B0A4C
	for <lists+keyrings@lfdr.de>; Fri, 25 Oct 2024 18:50:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4A1351F252E6
	for <lists+keyrings@lfdr.de>; Fri, 25 Oct 2024 16:50:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E81B41E00BF;
	Fri, 25 Oct 2024 16:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PUBoGWfW"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B74F017622F;
	Fri, 25 Oct 2024 16:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729875039; cv=none; b=XoRKIhA2CuGP4ZMeqwmpktgg4KOiZu2CKLdM7lvXpjEciKd+Eh3gsniqtk9PpBdZZrF6StrZnH15rdSm+KXWBsv9FQ9scRH0+3ta7JR3G5H1Rj6XRBZNdT3EXF1ulrAWJuuDg9X2OeNXDsQaWo+a5hovoLl1tfNlhJvuFdtFf6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729875039; c=relaxed/simple;
	bh=xliGdU77s0SszF/PxwOUWbXr+y3SAI0y29O315Jj780=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o6Ya+BEv2RZHQQhxUmUc1oCc9YtZZWVeYHB2/0Jkm35t41sGu0VdXwWkeYlZPS+72wXxGbVOHFO0YXxmVVRzvtdEkvSXdDWT7PoPcw98kkHKd5dJ/bcSxeQilSG2r3OqoCiYWfj9R5oJxt3AaTS6BOF4swtnGQ9tRCoA7W1ntcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PUBoGWfW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BA14C4CEC3;
	Fri, 25 Oct 2024 16:50:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729875039;
	bh=xliGdU77s0SszF/PxwOUWbXr+y3SAI0y29O315Jj780=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PUBoGWfWnq8FyuJAxuq6zeCl4dpTMvw3sRW53OZlG5TBBK7TfsBA2UG5Y55xgZUm0
	 OUeHCAzf4uAFSF3oaRfmOhAJwpeTUT41jiF6QM8IVTOLAqLMrRM+j426ogA91IqQ23
	 SWx8WDKv8H/2dibb8NUEh6BmdPmLt82BwowBPIiSvgqXoVMhWrLR6if8bH3aTIWl+4
	 0ObTRr1P47hczes1GOvQuMqKeREzrUIuPDSMMeRIDRleiZZGD9HCLTpEd6JycFOU+K
	 +sjGhORJsPJLErC/RpywyVOMPE3tJlnwJtaXFy5MELVNQBRuWVEU480uMoR4IO7/UU
	 uDzfzvRPw60JQ==
Date: Fri, 25 Oct 2024 09:50:37 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Lukas Wunner <lukas@wunner.de>
Cc: Klara Modin <klarasmodin@gmail.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Stefan Berger <stefanb@linux.ibm.com>,
	Vitaly Chikunov <vt@altlinux.org>,
	Tadeusz Struk <tstruk@gigaio.com>,
	David Howells <dhowells@redhat.com>,
	Andrew Zaborowski <andrew.zaborowski@intel.com>,
	Saulo Alessandre <saulo.alessandre@tse.jus.br>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Ignat Korchagin <ignat@cloudflare.com>,
	Marek Behun <kabel@kernel.org>,
	Varad Gautam <varadgautam@google.com>,
	Stephan Mueller <smueller@chronox.de>,
	Denis Kenzior <denkenz@gmail.com>, linux-crypto@vger.kernel.org,
	keyrings@vger.kernel.org, Mimi Zohar <zohar@linux.ibm.com>,
	Roberto Sassu <roberto.sassu@huawei.com>,
	Dmitry Kasatkin <dmitry.kasatkin@gmail.com>,
	Eric Snowberg <eric.snowberg@oracle.com>,
	linux-security-module@vger.kernel.org
Subject: Re: [PATCH v2 06/19] crypto: rsassa-pkcs1 - Migrate to sig_alg
 backend
Message-ID: <20241025165037.GA1141@sol.localdomain>
References: <cover.1725972333.git.lukas@wunner.de>
 <743afd4f298a3fad03e42ab46f913d1f51cb8b7c.1725972335.git.lukas@wunner.de>
 <2ed09a22-86c0-4cf0-8bda-ef804ccb3413@gmail.com>
 <ZxalYZwH5UiGX5uj@wunner.de>
 <9c33d208-168c-4af7-a155-9571872ede4d@gmail.com>
 <ZxtF7qVpAuX6YMXa@wunner.de>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZxtF7qVpAuX6YMXa@wunner.de>

On Fri, Oct 25, 2024 at 09:17:02AM +0200, Lukas Wunner wrote:
> So below is a new patch which reinstates support for these legacy
> protocols.  It should also fix the issue you're seeing with TLS 1.2
> or newer (which is caused by invoking KEYCTL_PKEY_QUERY without
> specifying a hash algorithm).
[...]
> I've looked at the source code of wpa_supplicant as well as
> various IKEv1 daemons (strongswan, libreswan, isakmpd, raccoon)
> and none of them seems to use the kernel's Key Retention Service,
> so iwd is the only known user space application affected so far.

Yes, based on historical mailing list discussions it appears that KEYCTL_PKEY_*
were added to the kernel for iwd, and iwd is their only user.  This design is a
huge mistake both on the part of iwd and the kernel community, for a variety of
reasons that have already been covered extensively in the discussions that occur
each time iwd breaks.  iwd should be using a real crypto library, like all the
other wireless daemons.

- Eric

