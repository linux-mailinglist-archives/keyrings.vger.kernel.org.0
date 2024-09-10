Return-Path: <keyrings+bounces-1948-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2271E9738C5
	for <lists+keyrings@lfdr.de>; Tue, 10 Sep 2024 15:38:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D1D38284BC1
	for <lists+keyrings@lfdr.de>; Tue, 10 Sep 2024 13:38:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 636B0192B71;
	Tue, 10 Sep 2024 13:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iYkJZOqM"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 398BD192B62;
	Tue, 10 Sep 2024 13:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725975522; cv=none; b=bZ+v64kyYBTexDlDyAJHPJPSqAojxy8txOZT01sKYeOp7nxdpl2Y+RXljDsPXP0CxJ1UZIek5S2ozIhDSS2Z6TyzpaUv0UicBUk+TNgS+XLM6UPnDCERh/WlA9Mv5+8BgThq9d2+GupbXfS0YbFlAxXOOQCxyQBc/h/nUgdJsOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725975522; c=relaxed/simple;
	bh=8F+jvQcvG+xddGLkzDfn0BxcU7yltO6/GkL4xDVEa88=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=iU2PRWqM+NyxN+KezIYyATnOxCUEnAnaBV6ssjsyyTbh25OhvPH9iXdc8FdWCYy9dkSJ1h0ruujYGWM7XTYDTvJf44YE+hjW4OhQw85Uw+lWm3AB1HJJ5olUr7dJ/Eyv0z129bfI3mVTcA40uvNnvxIZYhIvdMYEeq1A/48WwsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iYkJZOqM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F018C4CEC3;
	Tue, 10 Sep 2024 13:38:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725975521;
	bh=8F+jvQcvG+xddGLkzDfn0BxcU7yltO6/GkL4xDVEa88=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=iYkJZOqMj0ZLBwLFdIdUWVRRkyxPcuNUUegKpGOod3Qaxt2tcPLfiDiIjUXybUrat
	 LPXNByZy2t15rmHgczps1grny2c+UcajTB8oY1+8sjCMqZsdsYSaPmvEfpw7bezwwQ
	 QhV83AhG1JSASl+Q+ZTCZOBNV/ZQm+eGXpp2mmEcHxZ8HD/CoQpQlcTYn7mkLB2aK+
	 jjNtVDoudXKR+dboO6ILHPi9HR4IQPKRTR1tg3iFkM74A/G2tiSs7GPIiKmGJ20B90
	 I13r3ixDEUN+Zdg/qO28b3VTGZOeN34QqcqXse7Kvs1+fAb3t8l7JNRLEiPtqWcqAv
	 tQTdTCCMABnoQ==
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 10 Sep 2024 16:38:37 +0300
Message-Id: <D42N9ASJJSUD.EG094MFWZA4Q@kernel.org>
Cc: <keyrings@vger.kernel.org>, <linux-crypto@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <lvc-project@linuxtesting.org>, "Sergey
 Shtylyov" <s.shtylyov@omp.ru>
Subject: Re: [PATCH v2] KEYS: prevent NULL pointer dereference in
 find_asymmetric_key()
From: "Jarkko Sakkinen" <jarkko@kernel.org>
To: "Roman Smirnov" <r.smirnov@omp.ru>, "David Howells"
 <dhowells@redhat.com>, "Herbert Xu" <herbert@gondor.apana.org.au>, "David
 S. Miller" <davem@davemloft.net>, "Andrew Zaborowski"
 <andrew.zaborowski@intel.com>
X-Mailer: aerc 0.18.2
References: <20240910111806.65945-1-r.smirnov@omp.ru>
In-Reply-To: <20240910111806.65945-1-r.smirnov@omp.ru>

On Tue Sep 10, 2024 at 2:18 PM EEST, Roman Smirnov wrote:
> In find_asymmetric_key(), if all NULLs are passed in id_{0,1,2} parameter=
s
> the kernel will first emit WARN and then have an oops because id_2 gets
> dereferenced anyway.
>
> Found by Linux Verification Center (linuxtesting.org) with Svace static
> analysis tool.

Weird, I recall that I've either sent a patch to address the same site
OR have commented a patch with similar reasoning. Well, it does not
matter, I think it this makes sense to me.

You could further add to the motivation that given the panic_on_warn
kernel command-line parameter, it is for the best limit the scope and
use of the WARN-macro.

>
> Fixes: 7d30198ee24f ("keys: X.509 public key issuer lookup without AKID")

I would still call this an improvement. It overuses warn but I don't
think this a bug.=20

> Suggested-by: Sergey Shtylyov <s.shtylyov@omp.ru>
> Signed-off-by: Roman Smirnov <r.smirnov@omp.ru>
> Reviewed-by: Sergey Shtylyov <s.shtylyov@omp.ru>
> ---
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

This is totally fine. It is an improvement to the current situation.

> +		return ERR_PTR(-EINVAL);
>  	}
> =20
>  	/* Construct an identifier "id:<keyid>". */

Can be applied as an improvement and with the added bits about
panic_on_warn to the commit message.

BR, Jarkko

