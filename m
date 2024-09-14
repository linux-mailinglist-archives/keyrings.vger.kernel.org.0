Return-Path: <keyrings+bounces-2057-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 487BB97908B
	for <lists+keyrings@lfdr.de>; Sat, 14 Sep 2024 13:36:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F2ADC1F21C91
	for <lists+keyrings@lfdr.de>; Sat, 14 Sep 2024 11:36:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 061371CF280;
	Sat, 14 Sep 2024 11:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pC0rAyg/"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC49C1CEE91;
	Sat, 14 Sep 2024 11:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726313799; cv=none; b=IaiAxN7z5VZNGmCUU+qnRscUTFqPq39LoKbSpq16DrTu7Q7j7w6AB63t8G6qiKomD2jNmFM+BohDTWxwnwTZofhAf4BOfTu6VpffVk7WVJvUjZLNZN1KGKcXcC4gCdPc2GBZflsBMnVbScoik/qidDRStK/yX3XPyEc2B8kKNEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726313799; c=relaxed/simple;
	bh=qnVKswh1C/VcMi/8JBHh5XHeNODqo3B7FYnosOg1iQ8=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=WS1eTaXkEOJpStB0rTXv7uso+8ku1JXB8yKNCQNmUPgwJJijACuMn18+NEtGiCm02KzWFsfMpWP1S2f2B8EstUrjmgd10uQLwBbqOqCCSPiCUhR0jyH140ZUUHAcjv+mlFDDeQKYktuBqjeddS5lKy6kQvXShoOgr8JEKDiy2Ds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pC0rAyg/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E2ECC4CEC0;
	Sat, 14 Sep 2024 11:36:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726313799;
	bh=qnVKswh1C/VcMi/8JBHh5XHeNODqo3B7FYnosOg1iQ8=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=pC0rAyg/AeP9bBL1eEWSuL3M3eNWRaTA3iUMWDTHAej2H9t8eARMY6EJKXkSpY7qd
	 Fvs6jnJ83YZZsJUyW8C2W/c3aJfR4HNWSO7BkIFnKmHUczs2lShv378hyR+gaIiHDj
	 ufksGhjE7KFs2CJKAMsBNtNV8xh5mQo32I8XCEpwCHafAxHNJDCw1TB2YMaTqWZCVq
	 fCCJP2bPvoeuJsRBQiKDTbNbQDM4tKpi2Cr+k8RgVqUujO+Ggzlu0//Xn5d1dTD2mh
	 oIivRCysd3rT07AMHAqVV22jii4bgcJ2WfzWp/YI0zDDF/tZq+qXzL2Qrmq0lCJYPg
	 cC1eBCEyzQWwg==
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 14 Sep 2024 14:36:35 +0300
Message-Id: <D45Z61F5DSHN.1PJB50JEMACEW@kernel.org>
Cc: <keyrings@vger.kernel.org>, <linux-crypto@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <lvc-project@linuxtesting.org>, "Sergey
 Shtylyov" <s.shtylyov@omp.ru>, "Karina Yankevich" <k.yankevich@omp.ru>,
 "Sergey Yudin" <s.yudin@omp.ru>
Subject: Re: [PATCH v3] KEYS: prevent NULL pointer dereference in
 find_asymmetric_key()
From: "Jarkko Sakkinen" <jarkko@kernel.org>
To: "Roman Smirnov" <r.smirnov@omp.ru>, "David Howells"
 <dhowells@redhat.com>, "Herbert Xu" <herbert@gondor.apana.org.au>, "David S
 . Miller" <davem@davemloft.net>, "Andrew Zaborowski"
 <andrew.zaborowski@intel.com>
X-Mailer: aerc 0.18.2
References: <20240913143010.117883-1-r.smirnov@omp.ru>
In-Reply-To: <20240913143010.117883-1-r.smirnov@omp.ru>

On Fri Sep 13, 2024 at 5:30 PM EEST, Roman Smirnov wrote:
> In find_asymmetric_key(), if all NULLs are passed in the id_{0,1,2}
> arguments, the kernel will first emit WARN but then have an oops
> because id_2 gets dereferenced anyway.
>
> Add the missing id_2 check and move WARN_ON() to the final else branch
> to avoid duplicate NULL checks.
>
> Found by Linux Verification Center (linuxtesting.org) with Svace static
> analysis tool.
>
> Fixes: 7d30198ee24f ("keys: X.509 public key issuer lookup without AKID")
> Suggested-by: Sergey Shtylyov <s.shtylyov@omp.ru>
> Signed-off-by: Roman Smirnov <r.smirnov@omp.ru>
> Reviewed-by: Sergey Shtylyov <s.shtylyov@omp.ru>
> ---
>  V1 -> V2: updated patch description, returned WARN_ON() macro
>  V2 -> V3: updated patch description
>  crypto/asymmetric_keys/asymmetric_type.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/crypto/asymmetric_keys/asymmetric_type.c b/crypto/asymmetric=
_keys/asymmetric_type.c
> index a5da8ccd353e..43af5fa510c0 100644
> --- a/crypto/asymmetric_keys/asymmetric_type.c
> +++ b/crypto/asymmetric_keys/asymmetric_type.c
> @@ -60,17 +60,18 @@ struct key *find_asymmetric_key(struct key *keyring,
>  	char *req, *p;
>  	int len;
> =20
> -	WARN_ON(!id_0 && !id_1 && !id_2);
> -
>  	if (id_0) {
>  		lookup =3D id_0->data;
>  		len =3D id_0->len;
>  	} else if (id_1) {
>  		lookup =3D id_1->data;
>  		len =3D id_1->len;
> -	} else {
> +	} else if (id_2) {
>  		lookup =3D id_2->data;
>  		len =3D id_2->len;
> +	} else {
> +		WARN_ON(1);
> +		return ERR_PTR(-EINVAL);
>  	}
> =20
>  	/* Construct an identifier "id:<keyid>". */

Thanks this works for me at least. David do you have objections?
If not, I'll pick it up for my v6.12 PR.

BR, Jarkko

