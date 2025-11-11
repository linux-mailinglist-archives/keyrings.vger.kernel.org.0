Return-Path: <keyrings+bounces-3324-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 7817AC4EEF9
	for <lists+keyrings@lfdr.de>; Tue, 11 Nov 2025 17:09:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 08D0F4E04CD
	for <lists+keyrings@lfdr.de>; Tue, 11 Nov 2025 16:09:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2B1B36B072;
	Tue, 11 Nov 2025 16:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b="T9NakLss"
X-Original-To: keyrings@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F17A36B04F
	for <keyrings@vger.kernel.org>; Tue, 11 Nov 2025 16:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762877340; cv=none; b=SFT+A9hdW8GWp/vmkCqZXMOzDRULxT/Rm1tMdT8YQMaxlmoYHdeP9iiD8Urd789JwMFXPUIMpDMErJ7c5wvwVURk663wOuLEjpeAUi7dSS20hpri355ldOMJYEL546A5FjMtZmVvYoPXOSEgaiL+hVwvbb2V7rceLyS7BI6DHtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762877340; c=relaxed/simple;
	bh=aysh5UWarQ7L8UM6wmzXLNddrubxWUn3U+QaaL3x7+s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ea/u9AjhEbBtCi6jn3XyNF3xlC3bvmnKTKk+D3TtnqEYVE4TRwaNkulGI4OGfJTlxzeH1uCt0UGHa3BQI2pEATwnhUGffLUrHkSB1ZiM2T+WJVEh6LQf2RkojJYmk6xresB12DNkEHPDIkvF+Wse1cnHpAP4+lnVO1fbDyg81A8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com; spf=pass smtp.mailfrom=cloudflare.com; dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b=T9NakLss; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-3637d6e9923so36230581fa.3
        for <keyrings@vger.kernel.org>; Tue, 11 Nov 2025 08:08:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1762877337; x=1763482137; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iLmijrLc4WS3nSB0g1tes3gmjZB4xp4JotsNrP4RgbI=;
        b=T9NakLssrxRZu4Y1431XbGWnyx7s417lj3ApaCz0BRZUZjEedWsHiTYNEmZ4ef0gK7
         RjehRBafD7u+FIeiqgxiRBLOFTyMBhn6hzZDPPFAb8ng7++LFIbsKKYaOTutOK0t9geo
         4Qvqh0yNnroKgO9HPWtIMZyL+HYY+4SQVNdIzx06hs3XX2R3MeWeItQCXCObm66eMLi2
         fiI9HbC7MOzxJh58B1txJW+IUYJn6shk82Hd+JTNpmNzduI72JhGOArvkbvRYhOxyUeM
         s6GzEDgoJJtaqBiZfXwHnVpCyVbLBpLYYEbAMvsA2n6CClkqSo+2Y6FMcbgTe0/EfONg
         /VpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762877337; x=1763482137;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iLmijrLc4WS3nSB0g1tes3gmjZB4xp4JotsNrP4RgbI=;
        b=GslAzqihghR08rDgW9R6vRXuMrhsVc1tNyuHl+ytqSVKJq5WIPR+UFCnQ/kNvBtBS1
         ATANwVQD3VNPgwcYstY/XxFXGIG+5vQiTiXuEiaHC3Wf4vW6npT+FSlKjy7nMjff2D5c
         ++/DAhf2A/NNLhcjBAvl4a0AC5EGA9eGJOz59tJKB5DydsC+3ocQqqfi06ncR/G2+yHd
         obRsrfRhqicFkF6y6rxI5VIGnKks70l52fgj/4hJSmdRP1Dq5tZ0rQfCfeOnD29T0A3T
         CxWBnJtRy/nBy0QnnLsFAItcuJCoaHaw4fkEx4g1IUZNdwQqVgPxp5I7c29QO6bCM+au
         NqLA==
X-Forwarded-Encrypted: i=1; AJvYcCX7JcZy7xq3d5g3/rENnXNrHNeLcdlX0lUSOjd7Ucz9U2Q+2rFqr3n/E2inHGUEAb5gy/+wf9m/YQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxz+3UaLsa/hUXHRwMHS+eCjN1I16sc88a+oF9j6+4a9kGWTK/Q
	uGWGHXfO8bn3No7KY7przeYgdhPlUBCfQveOjDjYqVgFj3+3ZBASUkuYY63kmMAvXgOjB38rfOs
	fZw8Yud12tAMqJm6LGmhP9KbP4p8J3BjSTSu6YqnY0Q==
X-Gm-Gg: ASbGncvt4ACwMtPaPSkZ/6hSeQAwuAD0XexN0rAWXeee0BsK7prd7bYY/ZuAo/GX9Pd
	ONKYjCd2VVzCZa1UHPZAKH4oahBZfWoPM/ak39iZ6qWGKbRneDKQAlY+7kos5jJYn6oScfchmGU
	9g/2sbCSRUzaXK0V+IQoCNqhBXRaCow1GC6rZ/m+6DDcA5t3wwqevb6qYLXdg5rLfGnh6MpXDx4
	IZpcC4XGcoL87aCTa7Lkhtslu7NnTmcEz1LY4MQs3u9x7ADrFLgMOSuRYOBPv2czVOL9l3JeFYc
	En0K8xw1ZdHT8Q==
X-Google-Smtp-Source: AGHT+IEcmZOwLvG+h7fUXsvJcnFNIhiV+MryGzOffXJ6dYV5aA7YnFbnyG0YTd/n2a6NhgLGBZaHssoFT3rWJmo9VQY=
X-Received: by 2002:a05:6512:3a86:b0:57c:2474:371f with SMTP id
 2adb3069b0e04-5945f1e5562mr4251059e87.45.1762877337250; Tue, 11 Nov 2025
 08:08:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251111-aheev-uninitialized-free-attr-crypto-v2-1-33699a37a3ed@gmail.com>
In-Reply-To: <20251111-aheev-uninitialized-free-attr-crypto-v2-1-33699a37a3ed@gmail.com>
From: Ignat Korchagin <ignat@cloudflare.com>
Date: Tue, 11 Nov 2025 16:08:45 +0000
X-Gm-Features: AWmQ_bmEt7CJwei-GA566n9pELQVcfSa-BAXmZkdFeUOGoDXbcYtgD_qygu4668
Message-ID: <CALrw=nF1ms+s9gbY-aLfGkTcTWGBoKjJXBsUpQ5v07d+8_M_gg@mail.gmail.com>
Subject: Re: [PATCH v2] crypto: asymmetric_keys: fix uninitialized pointers
 with free attribute
To: Ally Heev <allyheev@gmail.com>
Cc: David Howells <dhowells@redhat.com>, Lukas Wunner <lukas@wunner.de>, 
	Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, 
	keyrings@vger.kernel.org, linux-crypto@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Dan Carpenter <dan.carpenter@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 11, 2025 at 1:36=E2=80=AFPM Ally Heev <allyheev@gmail.com> wrot=
e:
>
> Uninitialized pointers with `__free` attribute can cause undefined
> behavior as the memory assigned randomly to the pointer is freed
> automatically when the pointer goes out of scope.
>
> crypto/asymmetric_keys doesn't have any bugs related to this as of now,
> but, it is better to initialize and assign pointers with `__free`
> attribute in one statement to ensure proper scope-based cleanup
>
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Closes: https://lore.kernel.org/all/aPiG_F5EBQUjZqsl@stanley.mountain/
> Signed-off-by: Ally Heev <allyheev@gmail.com>

Reviewed-by: Ignat Korchagin <ignat@cloudflare.com>

> ---
> Changes in v2:
> - moved declarations to the top and initialized them with NULL
> - Link to v1: https://lore.kernel.org/r/20251105-aheev-uninitialized-free=
-attr-crypto-v1-1-83da1e10e8c4@gmail.com
> ---
>  crypto/asymmetric_keys/x509_cert_parser.c | 2 +-
>  crypto/asymmetric_keys/x509_public_key.c  | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/crypto/asymmetric_keys/x509_cert_parser.c b/crypto/asymmetri=
c_keys/x509_cert_parser.c
> index 8df3fa60a44f80fbd71af17faeca2e92b6cc03ce..b37cae914987b69c996d65590=
58c00f13c92b5b9 100644
> --- a/crypto/asymmetric_keys/x509_cert_parser.c
> +++ b/crypto/asymmetric_keys/x509_cert_parser.c
> @@ -60,7 +60,7 @@ EXPORT_SYMBOL_GPL(x509_free_certificate);
>   */
>  struct x509_certificate *x509_cert_parse(const void *data, size_t datale=
n)
>  {
> -       struct x509_certificate *cert __free(x509_free_certificate);
> +       struct x509_certificate *cert __free(x509_free_certificate) =3D N=
ULL;
>         struct x509_parse_context *ctx __free(kfree) =3D NULL;
>         struct asymmetric_key_id *kid;
>         long ret;
> diff --git a/crypto/asymmetric_keys/x509_public_key.c b/crypto/asymmetric=
_keys/x509_public_key.c
> index 8409d7d36cb4f3582e15f9ee4d25f302b3b29358..12e3341e806b8db93803325a9=
6a3821fd5d0a9f0 100644
> --- a/crypto/asymmetric_keys/x509_public_key.c
> +++ b/crypto/asymmetric_keys/x509_public_key.c
> @@ -148,7 +148,7 @@ int x509_check_for_self_signed(struct x509_certificat=
e *cert)
>   */
>  static int x509_key_preparse(struct key_preparsed_payload *prep)
>  {
> -       struct x509_certificate *cert __free(x509_free_certificate);
> +       struct x509_certificate *cert __free(x509_free_certificate) =3D N=
ULL;
>         struct asymmetric_key_ids *kids __free(kfree) =3D NULL;
>         char *p, *desc __free(kfree) =3D NULL;
>         const char *q;
>
> ---
> base-commit: c9cfc122f03711a5124b4aafab3211cf4d35a2ac
> change-id: 20251105-aheev-uninitialized-free-attr-crypto-bc94ec1b2253
>
> Best regards,
> --
> Ally Heev <allyheev@gmail.com>
>

