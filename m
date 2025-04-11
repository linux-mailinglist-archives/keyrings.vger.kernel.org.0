Return-Path: <keyrings+bounces-2615-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 454CAA866B0
	for <lists+keyrings@lfdr.de>; Fri, 11 Apr 2025 21:55:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 338034A4080
	for <lists+keyrings@lfdr.de>; Fri, 11 Apr 2025 19:55:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FB1B27F4F0;
	Fri, 11 Apr 2025 19:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b="Fnm/b9x9"
X-Original-To: keyrings@vger.kernel.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB02B27F4DB
	for <keyrings@vger.kernel.org>; Fri, 11 Apr 2025 19:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744401303; cv=none; b=cxUDWzCLNj/FTRX9EvFofK/k+4vX6tfQixamD8ZlhAV98eCpRspQzVQOaLCN+vDjnt+90khhY+zyLepZMTk7Zmn/1uk4EHjJeYWMqEKhIEKN0MJhw9zXaAI+jBG1s4Sey+KESBysZyLnJSF2DX7uOXlEKu6XxtWo2fULEfsbQ4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744401303; c=relaxed/simple;
	bh=fMl/cO4Mc+3rRQGsUDrG2q1xGapHt7w8Pi2Ez0VeIfQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kVkijCWgWq+axs4Idxet47UO2iVr2GSV1sUG2J/ySZI8Ef6eTLSiY/XsIdPIUshpxjrhRHUq76FYhrCrKFtNiKGSDleXBQEIXh++6j5HjPSVpxxVE/IiJeNuNnh+pB5K5ZeroQzkzwuPFeN8rwWeWHNkvF3FqV5cIGpesAomoLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com; spf=pass smtp.mailfrom=cloudflare.com; dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b=Fnm/b9x9; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-301918a4e1bso1961592a91.1
        for <keyrings@vger.kernel.org>; Fri, 11 Apr 2025 12:55:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1744401301; x=1745006101; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qmuXF4G8oAveu1kU1QwyLEPu0VP5pJHFUetOkYKYD+E=;
        b=Fnm/b9x93jbCvqaWNHQGL0hLLgms6dNKtSFON45I3XtYE6PrARTl3Sx1I+pIQ5Ks1e
         mNxxZ+r2cb4jmjfMUgLgELjqqf/+Xehx4VNZ/2UTGp4b6ufWCoP9+Wrh6iSr9VoThaAI
         J03YSE9NYJXfAzNoh2kcvDr5Aa+zJOT/JYnSpM6hFA/rK1uv6SPfv2VApsFCmre3uV3i
         hqUIQRnYRVBQJZl2eNgpNpsj47U+l7WVWSbWvCtmvnqbTE8hDN3S7SDkhgSWoGTGQkJB
         uswQP0Xqk0XPmM/5jTcZ2ie366rhTDX6bFJuR3WmEvr7X0XTbaZtv3/phUHEleMO6FE5
         /72Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744401301; x=1745006101;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qmuXF4G8oAveu1kU1QwyLEPu0VP5pJHFUetOkYKYD+E=;
        b=eMZ5amhArwHSiZnPS7A72u3gS865USYp6W1yd90r23T7S49N6LxsvC1TejI92xAIYE
         0DiWKuJSKUL1Mane+ZUSqrnjSWLV6v6/fTZvlLrr4Fb2OP+ijaCt6Ommmr1FVTLxFOVP
         MLfYB6MFvilT+DmSn59QcKjI3+JQthHzaiLbMPkSJGDED8x4nnXZOIMYnoKOnBA5sQmm
         XiSWaPD2drgIcW4l4JH7R3Bdtf8V3dgNULvQoXStMDkzE8U+wTJb2+hB4vRhPUEhKcyw
         qhsDH1betvDXUe6E1+JclsLl9COwE1jcIDvhwBNcocQOwcjNJFTTumyURN0ZrMoHdsGi
         XePg==
X-Forwarded-Encrypted: i=1; AJvYcCX5ta2DDC7/WT/49CjS3VydqUbbOcPZz2OoPGMloiOkXeo6CvQove63FpMXTRgcn526Aeb+G+nQZQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzg2FIzQdVX5tjZo3x9z37YjvQiT+xKZl6qOPKH7QXhkVxoIaqC
	6o+o9tE+VNKgGoaJorpF8MmZ++/iseGARMZ3YKsIlU1GtTl2SmnEUsmeOK6wsB/tI89eCQJA3RQ
	DDB5iOCuX3Vu+DA/IG9meEBwq5nV06lrUrP6Nfg5djOkv7D8bV90RjQ==
X-Gm-Gg: ASbGnct3Zca7Pc9XBI/H9ukwFbifCeVkCdcGpOYhZkZbSC0iJg2mbWcmYx1rz0Y0CUw
	HH7FR3jt+Rd71Qo/A3aAeCiicYyi0YVMCPOyFe1msi0kI37LsEdjzvwcL0wJn1at50O/gxeIvr9
	XTnq5Vb1jS4gJhK0Anj2oPEXl2aANv8RwSygKjWEmK
X-Google-Smtp-Source: AGHT+IEnWF6ApvR+x3IIHITC/uWVzWWJi+T0SFmfe017j/rzp6CXgf5avrrjDB4yDV9iv2tl/vmLn2sZEZi79yCWRvY=
X-Received: by 2002:a17:90b:4c04:b0:2ff:62b7:dcc0 with SMTP id
 98e67ed59e1d1-3082367dd5emr6478582a91.15.1744401300804; Fri, 11 Apr 2025
 12:55:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1744052920.git.lukas@wunner.de> <831608e465078cdcd3a8e74d6dfd85e77b2083a8.1744052920.git.lukas@wunner.de>
In-Reply-To: <831608e465078cdcd3a8e74d6dfd85e77b2083a8.1744052920.git.lukas@wunner.de>
From: Ignat Korchagin <ignat@cloudflare.com>
Date: Fri, 11 Apr 2025 20:54:48 +0100
X-Gm-Features: ATxdqUE9FTCjpKwEwPpUJicmrT9B0LP527CN1MU-wtw7jKidDcOWVFOYixBPDLU
Message-ID: <CALrw=nFr_R6As6UhHwJR+awaRwFQhEg3d-q4fwDoZbX=av40AQ@mail.gmail.com>
Subject: Re: [PATCH RESEND v2 1/2] crypto: ecdsa - Fix enc/dec size reported
 by KEYCTL_PKEY_QUERY
To: Lukas Wunner <lukas@wunner.de>
Cc: Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, 
	David Howells <dhowells@redhat.com>, Stefan Berger <stefanb@linux.ibm.com>, 
	Vitaly Chikunov <vt@altlinux.org>, linux-crypto@vger.kernel.org, keyrings@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 7, 2025 at 8:42=E2=80=AFPM Lukas Wunner <lukas@wunner.de> wrote=
:
>
> KEYCTL_PKEY_QUERY system calls for ecdsa keys return the key size as
> max_enc_size and max_dec_size, even though such keys cannot be used for
> encryption/decryption.  They're exclusively for signature generation or
> verification.
>
> Only rsa keys with pkcs1 encoding can also be used for encryption or
> decryption.
>
> Return 0 instead for ecdsa keys (as well as ecrdsa keys).
>
> Signed-off-by: Lukas Wunner <lukas@wunner.de>
> Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>

Reviewed-by: Ignat Korchagin <ignat@cloudflare.com>

> ---
>  crypto/asymmetric_keys/public_key.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/crypto/asymmetric_keys/public_key.c b/crypto/asymmetric_keys=
/public_key.c
> index bf165d3..dd44a96 100644
> --- a/crypto/asymmetric_keys/public_key.c
> +++ b/crypto/asymmetric_keys/public_key.c
> @@ -188,6 +188,8 @@ static int software_key_query(const struct kernel_pke=
y_params *params,
>         ptr =3D pkey_pack_u32(ptr, pkey->paramlen);
>         memcpy(ptr, pkey->params, pkey->paramlen);
>
> +       memset(info, 0, sizeof(*info));
> +
>         if (issig) {
>                 sig =3D crypto_alloc_sig(alg_name, 0, 0);
>                 if (IS_ERR(sig)) {
> @@ -211,6 +213,9 @@ static int software_key_query(const struct kernel_pke=
y_params *params,
>                         info->supported_ops |=3D KEYCTL_SUPPORTS_SIGN;
>
>                 if (strcmp(params->encoding, "pkcs1") =3D=3D 0) {
> +                       info->max_enc_size =3D len;
> +                       info->max_dec_size =3D len;
> +
>                         info->supported_ops |=3D KEYCTL_SUPPORTS_ENCRYPT;
>                         if (pkey->key_is_private)
>                                 info->supported_ops |=3D KEYCTL_SUPPORTS_=
DECRYPT;
> @@ -232,6 +237,8 @@ static int software_key_query(const struct kernel_pke=
y_params *params,
>                 len =3D crypto_akcipher_maxsize(tfm);
>                 info->max_sig_size =3D len;
>                 info->max_data_size =3D len;
> +               info->max_enc_size =3D len;
> +               info->max_dec_size =3D len;
>
>                 info->supported_ops =3D KEYCTL_SUPPORTS_ENCRYPT;
>                 if (pkey->key_is_private)
> @@ -239,8 +246,6 @@ static int software_key_query(const struct kernel_pke=
y_params *params,
>         }
>
>         info->key_size =3D len * 8;
> -       info->max_enc_size =3D len;
> -       info->max_dec_size =3D len;
>
>         ret =3D 0;
>
> --
> 2.43.0
>

