Return-Path: <keyrings+bounces-2031-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 33E60976BD2
	for <lists+keyrings@lfdr.de>; Thu, 12 Sep 2024 16:20:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EB55C283A79
	for <lists+keyrings@lfdr.de>; Thu, 12 Sep 2024 14:20:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 165CD1AD25D;
	Thu, 12 Sep 2024 14:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y02RydHn"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E385A1AD24C;
	Thu, 12 Sep 2024 14:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726150839; cv=none; b=P5er8ESnW/51BdQgclMQkQj6o9yocHJp9kOLZbx9vrsyjirosGFpvV0M2YOGwkmnElw49cRqORDJ/9SPVBkzAUSSQ5NRIRYEgJH3VsN0ae3s5vewJKkX+xFndtSiJb7BYnOGAjOA1eRFGYilnwfdSYb4TjRSbi0WQGw6MIH2fEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726150839; c=relaxed/simple;
	bh=KAU0PY03KRqnWf3s8ERZdEBmVCwp6kPw5OS8nAMo/pw=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=cNYQtgOODZD53r+AnUEAMd+usR1MFAz3QpFz5DzJq7nn4e9yoorZcxVntEWQ8nPUlJN2F7tiMcMRRZBKwZi17ORItoj8hzlQy6vemVkOlmgOfQZIYhS/45eP1XOWkh1WHSnjsMFhdumTyIsK/ynNxEZ1wDNdGjHocg4Da1l8c18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y02RydHn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20002C4CEC3;
	Thu, 12 Sep 2024 14:20:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726150838;
	bh=KAU0PY03KRqnWf3s8ERZdEBmVCwp6kPw5OS8nAMo/pw=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=Y02RydHnic95INM3A0d+6o1Xc0Vl6FbfX47eEaNNUmaWPz96aUdSgWnk/muFCiDcW
	 Nf94vt+SsbvD+Im74H3s9RbjR1iQVFrNYOVKq303z8IZnWmbRIP08AIaSyds5qQBPH
	 GXGqyMv5LpOZMPIacm9E9nusiDex7Z7P5XcewDlUutR12Hc4Pi/26bNJI3x4u5W9GI
	 BnqRsdAejktrhX8/2D/wjZ34FLbLCaX/ZwGy5KUDVToD59JaM1sN6LErPWe5+WlEPd
	 zS7KaWaYtpGVaHJozM8VK5ZfHEo09ni3QMriNyKGrmzY4yGaER7G6U7Oax0JWGDTPa
	 XL6cxnm1XIGCg==
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 12 Sep 2024 17:20:34 +0300
Message-Id: <D44DEI8HIZYP.1FP3PSAX538W4@kernel.org>
Cc: "Herbert Xu" <herbert@gondor.apana.org.au>, "David S. Miller"
 <davem@davemloft.net>, "Eric Biggers" <ebiggers@google.com>, "Stefan
 Berger" <stefanb@linux.ibm.com>, "Vitaly Chikunov" <vt@altlinux.org>,
 "Tadeusz Struk" <tstruk@gigaio.com>, "David Howells" <dhowells@redhat.com>,
 "Andrew Zaborowski" <andrew.zaborowski@intel.com>, "Saulo Alessandre"
 <saulo.alessandre@tse.jus.br>, "Jonathan Cameron"
 <Jonathan.Cameron@huawei.com>, "Ignat Korchagin" <ignat@cloudflare.com>,
 "Marek Behun" <kabel@kernel.org>, "Varad Gautam" <varadgautam@google.com>,
 "Stephan Mueller" <smueller@chronox.de>, "Denis Kenzior"
 <denkenz@gmail.com>, <linux-crypto@vger.kernel.org>,
 <keyrings@vger.kernel.org>
Subject: Re: [PATCH v2 04/19] crypto: ecrdsa - Migrate to sig_alg backend
From: "Jarkko Sakkinen" <jarkko@kernel.org>
To: "Lukas Wunner" <lukas@wunner.de>
X-Mailer: aerc 0.18.2
References: <cover.1725972333.git.lukas@wunner.de>
 <45acc8db555f80408c8b975771da34c569da45da.1725972334.git.lukas@wunner.de>
 <D43GTXWLMJ2E.258ZI34E5JRK6@kernel.org> <ZuKgwrocKlI5Qk8t@wunner.de>
In-Reply-To: <ZuKgwrocKlI5Qk8t@wunner.de>

On Thu Sep 12, 2024 at 11:05 AM EEST, Lukas Wunner wrote:
> On Wed, Sep 11, 2024 at 03:49:07PM +0300, Jarkko Sakkinen wrote:
> > On Tue Sep 10, 2024 at 5:30 PM EEST, Lukas Wunner wrote:
> > > A sig_alg backend has just been introduced with the intent of moving =
all
> > > asymmetric sign/verify algorithms to it one by one.
> > >
> > > Migrate ecrdsa.c to the new backend.
> [...]
> > >  	if (!ctx->curve ||
> > >  	    !ctx->digest ||
> > > -	    !req->src ||
> > > +	    !src ||
> > > +	    !digest ||
> > >  	    !ctx->pub_key.x ||
> > > -	    req->dst_len !=3D ctx->digest_len ||
> > > -	    req->dst_len !=3D ctx->curve->g.ndigits * sizeof(u64) ||
> > > +	    dlen !=3D ctx->digest_len ||
> > > +	    dlen !=3D ctx->curve->g.ndigits * sizeof(u64) ||
> > >  	    ctx->pub_key.ndigits !=3D ctx->curve->g.ndigits ||
> > > -	    req->dst_len * 2 !=3D req->src_len ||
> > > -	    WARN_ON(req->src_len > sizeof(sig)) ||
> > > -	    WARN_ON(req->dst_len > sizeof(digest)))
> > > +	    dlen * 2 !=3D slen ||
> > > +	    WARN_ON(slen > ECRDSA_MAX_SIG_SIZE) ||
> > > +	    WARN_ON(dlen > STREEBOG512_DIGEST_SIZE))
> >=20
> > Despite being migration I don't see no point recycling use of WARN_ON()
> > here, given panic_on_warn kernel command-line flag.
> >=20
> > If you want to print to something, please do separate checks and use
> > pr_warn() instead at most.
>
> The object of the patch is to migrate ecrdsa.c to sig_alg with no
> behavioral change.
>
> If you feel the WARN_ON() is uncalled for, please submit a cleanup
> patch.

OK, put on consideration since I have a related series.

BR, Jarkko

