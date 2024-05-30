Return-Path: <keyrings+bounces-1524-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 93A8C8D44CA
	for <lists+keyrings@lfdr.de>; Thu, 30 May 2024 07:28:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0DAAAB2319A
	for <lists+keyrings@lfdr.de>; Thu, 30 May 2024 05:28:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27E1F143C4B;
	Thu, 30 May 2024 05:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Id/Betoz"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDEA9143C49;
	Thu, 30 May 2024 05:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717046930; cv=none; b=KrQMS95/sAkD5o0k1Lhb0wHA5oaXYkfldcnVkx3h/KUkS8xAwZGUR5ZQoWYbdKnraMileemV/l9u1yn9riD2zm6Owj9QZMSvovZURZZmdapMdMSGdUusqaEgpmC3TdQQPMeUC5wu4u4Mu8gRnFFQzLjcNhijBpyjkPU+DsS64T4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717046930; c=relaxed/simple;
	bh=cb4PAq0uFIPeKLQhiizJcOzIgfExkFZm+Cc9F71CdHQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=dxDXzEvt4nt+ht/NKLAyDDd/6EpTsOHJTiazMeFSFeDmllbwTWVH0le1/D1iEa7XYfAOeUXXOVshwOHvCVsVEgMEnmfWFw8leXxZGDzB+JdnLdiZimVUJbcHX/thff4goDaFFCgL5SD8PRfob5eoq0nXfUi2ei8kQvwIf8sHty8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Id/Betoz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0ED7AC2BBFC;
	Thu, 30 May 2024 05:28:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717046929;
	bh=cb4PAq0uFIPeKLQhiizJcOzIgfExkFZm+Cc9F71CdHQ=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=Id/BetozTUhF1QSpRC9R0j5WmBAY8A9R1D5sunH7eU41t00laI+bTq3O8F256aHBh
	 LKh+OSGprNc4tHRC6t2PU9W17wxiF+qbBNvSEtJcdV0qvt1MqrBwsWQDoB1mshOQn1
	 S9Uem30ggJKFBprURXhDRDasmaB5pfsh/QoVHGKFVo5YvWj2ROyVhEFsbyYrI45HOm
	 rd+IGZgW8H4P18X8O9W0N/NMI2HJOFhf3YRiMQLMrJU+7JgSeZQSaKdaWSEF8kEvfJ
	 HWhkbo8GCktmZx26PQhd52t58Tn8uTOfPprpiQ6oUb8snQTuIBvBRLYWfwEgq8X3yZ
	 FMWlh1CmV7KIw==
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 30 May 2024 08:28:43 +0300
Message-Id: <D1MQC3CFQVE0.W19B0918DT1I@kernel.org>
Cc: <linux-kernel@vger.kernel.org>, <lukas@wunner.de>
Subject: Re: [PATCH 2/2] crypto: ecdsa - Use ecc_digits_from_bytes to
 convert signature
From: "Jarkko Sakkinen" <jarkko@kernel.org>
To: "Stefan Berger" <stefanb@linux.ibm.com>, <keyrings@vger.kernel.org>,
 <linux-crypto@vger.kernel.org>, <herbert@gondor.apana.org.au>,
 <davem@davemloft.net>
X-Mailer: aerc 0.17.0
References: <20240529230827.379111-1-stefanb@linux.ibm.com>
 <20240529230827.379111-3-stefanb@linux.ibm.com>
In-Reply-To: <20240529230827.379111-3-stefanb@linux.ibm.com>

On Thu May 30, 2024 at 2:08 AM EEST, Stefan Berger wrote:
> Since ecc_digits_from_bytes will provide zeros when an insufficient numbe=
r
> of bytes are passed in the input byte array, use it to convert the r and =
s
> components of the signature to digits directly from the input byte
> array. This avoids going through an intermediate byte array that has the
> first few bytes filled with zeros.
>
> Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
> ---
>  crypto/ecdsa.c | 12 ++----------
>  1 file changed, 2 insertions(+), 10 deletions(-)
>
> diff --git a/crypto/ecdsa.c b/crypto/ecdsa.c
> index fa029f36110b..941cdc2b889b 100644
> --- a/crypto/ecdsa.c
> +++ b/crypto/ecdsa.c
> @@ -38,7 +38,6 @@ static int ecdsa_get_signature_rs(u64 *dest, size_t hdr=
len, unsigned char tag,
>  	size_t bufsize =3D ndigits * sizeof(u64);
>  	ssize_t diff =3D vlen - bufsize;
>  	const char *d =3D value;
> -	u8 rs[ECC_MAX_BYTES];
> =20
>  	if (!value || !vlen)
>  		return -EINVAL;
> @@ -46,7 +45,7 @@ static int ecdsa_get_signature_rs(u64 *dest, size_t hdr=
len, unsigned char tag,
>  	/* diff =3D 0: 'value' has exacly the right size
>  	 * diff > 0: 'value' has too many bytes; one leading zero is allowed th=
at
>  	 *           makes the value a positive integer; error on more
> -	 * diff < 0: 'value' is missing leading zeros, which we add
> +	 * diff < 0: 'value' is missing leading zeros
>  	 */
>  	if (diff > 0) {
>  		/* skip over leading zeros that make 'value' a positive int */
> @@ -61,14 +60,7 @@ static int ecdsa_get_signature_rs(u64 *dest, size_t hd=
rlen, unsigned char tag,
>  	if (-diff >=3D bufsize)
>  		return -EINVAL;
> =20
> -	if (diff) {
> -		/* leading zeros not given in 'value' */
> -		memset(rs, 0, -diff);
> -	}
> -
> -	memcpy(&rs[-diff], d, vlen);
> -
> -	ecc_swap_digits((u64 *)rs, dest, ndigits);
> +	ecc_digits_from_bytes(d, vlen, dest, ndigits);
> =20
>  	return 0;
>  }

Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>

BR, Jarkko

