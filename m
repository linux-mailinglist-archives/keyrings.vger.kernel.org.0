Return-Path: <keyrings+bounces-3318-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 53519C4E10F
	for <lists+keyrings@lfdr.de>; Tue, 11 Nov 2025 14:14:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B3EDE1894F24
	for <lists+keyrings@lfdr.de>; Tue, 11 Nov 2025 13:13:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FFCB328240;
	Tue, 11 Nov 2025 13:12:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b="bFszecDU"
X-Original-To: keyrings@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB55E33120E
	for <keyrings@vger.kernel.org>; Tue, 11 Nov 2025 13:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762866757; cv=none; b=Ec5TNyATrRR1M4MqR59TpG5fv00u/kZJcFIeaA1InwInMJvyeqA7uW7BHyBiA0KZzyUMKMpnJptAgGl8oJOylLIJtjD8rh6ntPP3h9K8J563xenTJ8GuSkHXeK6bswqVJuSdYl1tyUsllM2K93hscNoYq51nTdaRVSsp5HxfKLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762866757; c=relaxed/simple;
	bh=EGnbKrHwQf35J9AnxuPlelOdsu5xsBnPf6q56Y1mZ6g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gujnOBnA758d26KodTOKW0mg9zKZ2KdpU+H0XhueWgij9hwgHdEFD43cJEtncXSErxYfsIDfbKEK4As3CQX43IkFqzVkchhq7sS9EkuKpEcMr9ZnBjvHmllGQUPAIfndx/LSbWwxCgWxPDLFW6LirG4eyX4dtF3SzghJLpE1rd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com; spf=pass smtp.mailfrom=cloudflare.com; dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b=bFszecDU; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-59428d2d975so4367001e87.3
        for <keyrings@vger.kernel.org>; Tue, 11 Nov 2025 05:12:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1762866751; x=1763471551; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E7jciwWdh3H66OGfj1NnZexE/9Y0y/ejX83mYXH2iLM=;
        b=bFszecDUSjJbrVfTrhXlA6N6SnwkuN3iYgyy0nmhLT7ccXjYozNLx5Ov3ElvwGM3Jg
         LiGcGQZOEaDkSvRW4hWz4G8W1D8AS3KGbfKFIO7LG/tVwSCdjyjdeeOyhfNAUY6w2SY3
         P25HlETtRJrFf0/XydPkzENMJxSiCeH1QBA+iTuUCCgD3FgHGreRRxg114i9Wug9ZUi9
         ZdZa1cItUJWWDy0mATir7HkMt995hrDr67u+S53+xKrXqDd+xvk4ppbnVqTXffgdLpGW
         GU7iyNT+c2ONWCyvJeIX6aCQp4X3AkpyKWUesyqSZDHC8N0IhvNl1q36h7JAbLte5nUc
         Qwxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762866751; x=1763471551;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=E7jciwWdh3H66OGfj1NnZexE/9Y0y/ejX83mYXH2iLM=;
        b=VxPBqKlkpZBwDPY6WTRHMK8z0Yw9ObOwWHSQSbTNv9UOKJqLcj6W52/FEQ6RU8H+aR
         c2xAYSh1/mkXkRQi4m6MjyxJtM/yFMCdHTfE/nY10dedeE3Cr8HIodZorlheogLfbJQk
         bFD5lP7eJ0e1gPxns1BKkz94a3KNRwcZzWn/xmBRWVedgCp6nYIWMMCgaks5PWmPiAfF
         Gnxh0fkQO4OUxoqsA1+By8LcitdxJXVtvqkigDQvPwsAtd5BMRYQhQCPZ5q9wq9HX0tg
         6TGnDrypiV7bspyJtfVDsKhRXI/LQhQUoxkp2ZLxJV6BwlNkmrKADrParoy7XYEt+j3U
         pT1A==
X-Forwarded-Encrypted: i=1; AJvYcCUM9QQhsypaIW+GmLC1nlslof60wlzpViGmfcPIqXYX7lMXhophmf8AQ1xf6NqDjtYw3Gf27ixa+Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7XIgfYHCYmjUr2qamsF9105KVPsSZUl3G+EgUUR8l1+CS3ySb
	EEDbUE9shYDoa5Bcd13NdZjR/Lly7HaZUp+154X/IVdqOT66RgFa+WybDK0nXDM+FR+Z2XyYK4v
	PHK4LXwGHKo8STl/1GLUeiLZcBJGKlnOHDujpmRCRSQ==
X-Gm-Gg: ASbGncuiv0Bu/scs3uoJtzc3Zs79EX2dA/Tm58VMXeaYaPEFvZaMTaVCM9mw9ASk7X/
	R2Nt/cnHjpk3C/BPmL0+e7lrUXd2Jyo0O/pVv4K+Z7R+yJ3eJVC0I5gQneLimCRnRI97BxCSb+E
	nLA7m/yC8lJz03FDXAP6SyKRcMJoEkwpUo1m3zozuNZcgLnFvNpesOdVyI257lJ9LySC75++GaW
	xMUmfs7Nq0/dGD+gXe6vuhPyaYtVAmkQPMsA+iE6HOGAQN6deV+uoenqg7Q0fqryW/o5hwFqP7t
	gGs13oIsIBcNA33ktYxUtEe9
X-Google-Smtp-Source: AGHT+IEIRGsH8Giqc36DmnKP0JSpfOb8AE6CkoUWOtbfUoUIgt1gXHA0SukHVPGn8uC6UNJkIz1P2Q8hofY/ntcAOD4=
X-Received: by 2002:a05:6512:3da6:b0:592:fb6f:9edb with SMTP id
 2adb3069b0e04-5945f1cb261mr3682143e87.47.1762866751275; Tue, 11 Nov 2025
 05:12:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251105-aheev-uninitialized-free-attr-crypto-v1-1-83da1e10e8c4@gmail.com>
In-Reply-To: <20251105-aheev-uninitialized-free-attr-crypto-v1-1-83da1e10e8c4@gmail.com>
From: Ignat Korchagin <ignat@cloudflare.com>
Date: Tue, 11 Nov 2025 13:12:20 +0000
X-Gm-Features: AWmQ_blPChR3htSJY00aF_YdDoBw8oLm5Z2Zpo9mUJUgH8YoYHtRJd8Ynpk5Lx0
Message-ID: <CALrw=nH8z0p=nyM_S0BN0JfdUB8fQHvkH6AULD3qj6sPQ1qJig@mail.gmail.com>
Subject: Re: [PATCH] crypto: asymmetric_keys: fix uninitialized pointers with
 free attr
To: Ally Heev <allyheev@gmail.com>
Cc: David Howells <dhowells@redhat.com>, Lukas Wunner <lukas@wunner.de>, 
	Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, 
	keyrings@vger.kernel.org, linux-crypto@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Dan Carpenter <dan.carpenter@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Nov 5, 2025 at 9:53=E2=80=AFAM Ally Heev <allyheev@gmail.com> wrote=
:
>
> Uninitialized pointers with `__free` attribute can cause undefined
> behaviour as the memory assigned(randomly) to the pointer is freed
> automatically when the pointer goes out of scope
>
> crypto/asymmetric_keys doesn't have any bugs related to this as of now,
> but, it is better to initialize and assign pointers with `__free` attr
> in one statement to ensure proper scope-based cleanup
>
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Closes: https://lore.kernel.org/all/aPiG_F5EBQUjZqsl@stanley.mountain/
> Signed-off-by: Ally Heev <allyheev@gmail.com>
> ---
>  crypto/asymmetric_keys/x509_cert_parser.c | 11 +++++++----
>  crypto/asymmetric_keys/x509_public_key.c  | 14 ++++++++------
>  2 files changed, 15 insertions(+), 10 deletions(-)
>
> diff --git a/crypto/asymmetric_keys/x509_cert_parser.c b/crypto/asymmetri=
c_keys/x509_cert_parser.c
> index 8df3fa60a44f80fbd71af17faeca2e92b6cc03ce..bfd2cb2a9d81e3c615dfd4fe6=
f41653869a8cbd6 100644
> --- a/crypto/asymmetric_keys/x509_cert_parser.c
> +++ b/crypto/asymmetric_keys/x509_cert_parser.c
> @@ -60,12 +60,12 @@ EXPORT_SYMBOL_GPL(x509_free_certificate);
>   */
>  struct x509_certificate *x509_cert_parse(const void *data, size_t datale=
n)
>  {
> -       struct x509_certificate *cert __free(x509_free_certificate);

Should this be just initialized to NULL instead of moving the declaration?

> -       struct x509_parse_context *ctx __free(kfree) =3D NULL;

This pointer seems initialized. Is there still a problem?

>         struct asymmetric_key_id *kid;
>         long ret;
>
> -       cert =3D kzalloc(sizeof(struct x509_certificate), GFP_KERNEL);
> +       struct x509_certificate *cert __free(x509_free_certificate) =3D k=
zalloc(
> +               sizeof(struct x509_certificate), GFP_KERNEL);
> +
>         if (!cert)
>                 return ERR_PTR(-ENOMEM);
>         cert->pub =3D kzalloc(sizeof(struct public_key), GFP_KERNEL);
> @@ -74,7 +74,10 @@ struct x509_certificate *x509_cert_parse(const void *d=
ata, size_t datalen)
>         cert->sig =3D kzalloc(sizeof(struct public_key_signature), GFP_KE=
RNEL);
>         if (!cert->sig)
>                 return ERR_PTR(-ENOMEM);
> -       ctx =3D kzalloc(sizeof(struct x509_parse_context), GFP_KERNEL);
> +
> +       struct x509_parse_context *ctx __free(kfree) =3D kzalloc(
> +               sizeof(struct x509_parse_context), GFP_KERNEL);
> +
>         if (!ctx)
>                 return ERR_PTR(-ENOMEM);
>
> diff --git a/crypto/asymmetric_keys/x509_public_key.c b/crypto/asymmetric=
_keys/x509_public_key.c
> index 8409d7d36cb4f3582e15f9ee4d25f302b3b29358..818c9ab5d63940ff62c21666f=
d549d3a1ff07e67 100644
> --- a/crypto/asymmetric_keys/x509_public_key.c
> +++ b/crypto/asymmetric_keys/x509_public_key.c
> @@ -148,13 +148,13 @@ int x509_check_for_self_signed(struct x509_certific=
ate *cert)
>   */
>  static int x509_key_preparse(struct key_preparsed_payload *prep)
>  {
> -       struct x509_certificate *cert __free(x509_free_certificate);

And here: should we just initialize this to NULL?

> -       struct asymmetric_key_ids *kids __free(kfree) =3D NULL;
> -       char *p, *desc __free(kfree) =3D NULL;

Same here: these two pointers are initialized.

> +       char *p;
>         const char *q;
>         size_t srlen, sulen;
>
> -       cert =3D x509_cert_parse(prep->data, prep->datalen);
> +       struct x509_certificate *cert __free(x509_free_certificate) =3D
> +               x509_cert_parse(prep->data, prep->datalen);
> +
>         if (IS_ERR(cert))
>                 return PTR_ERR(cert);
>
> @@ -187,7 +187,7 @@ static int x509_key_preparse(struct key_preparsed_pay=
load *prep)
>                 q =3D cert->raw_serial;
>         }
>
> -       desc =3D kmalloc(sulen + 2 + srlen * 2 + 1, GFP_KERNEL);
> +       char *desc __free(kfree) =3D kmalloc(sulen + 2 + srlen * 2 + 1, G=
FP_KERNEL);
>         if (!desc)
>                 return -ENOMEM;
>         p =3D memcpy(desc, cert->subject, sulen);
> @@ -197,7 +197,9 @@ static int x509_key_preparse(struct key_preparsed_pay=
load *prep)
>         p =3D bin2hex(p, q, srlen);
>         *p =3D 0;
>
> -       kids =3D kmalloc(sizeof(struct asymmetric_key_ids), GFP_KERNEL);
> +       struct asymmetric_key_ids *kids __free(kfree) =3D kmalloc(
> +               sizeof(struct asymmetric_key_ids), GFP_KERNEL);
> +
>         if (!kids)
>                 return -ENOMEM;
>         kids->id[0] =3D cert->id;
>
> ---
> base-commit: c9cfc122f03711a5124b4aafab3211cf4d35a2ac
> change-id: 20251105-aheev-uninitialized-free-attr-crypto-bc94ec1b2253
>
> Best regards,
> --
> Ally Heev <allyheev@gmail.com>
>

Ignat

