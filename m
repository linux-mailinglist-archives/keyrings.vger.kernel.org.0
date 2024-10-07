Return-Path: <keyrings+bounces-2185-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 22D0A9922C2
	for <lists+keyrings@lfdr.de>; Mon,  7 Oct 2024 04:33:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3B0AC281786
	for <lists+keyrings@lfdr.de>; Mon,  7 Oct 2024 02:33:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BF7A1173F;
	Mon,  7 Oct 2024 02:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=kev009.com header.i=@kev009.com header.b="tuIpb769"
X-Original-To: keyrings@vger.kernel.org
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A208522A
	for <keyrings@vger.kernel.org>; Mon,  7 Oct 2024 02:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728268382; cv=none; b=E6NDz/b0msN4bfHuXuIZCwgT12bgo/LSnM4wSzem5Yuv3dIti2l/C97Ap5XuQ6oT9Tv2OH8/dbPc/L4WuCVklr0ai6LdN31by34yFPa9LcFaaOI3OWAKdUA7QKWzYZsKvw64CaaK2kXGuAIGFXgLyWtm1tGiD2cqyKJ56JT68aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728268382; c=relaxed/simple;
	bh=UmYzWjwwdRldGzMtasrj0iUPzywF33QHaFRM8bXmb/M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Cc3Tzkidt8zN1IxKuufzktbHldZT0DtZX3osblG2Q2XI2tBTrOUKVmwg5eZB+NGiSildwNlL+ysvncN5CX6xXp2chSks+2azBmlJZfL0yw1+tZp+aldcsX9VzkKiRSzMeZUydvVs9c16eDKyH+kRLmxu1dBP01koVP500uFyPMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kev009.com; spf=pass smtp.mailfrom=kev009.com; dkim=fail (0-bit key) header.d=kev009.com header.i=@kev009.com header.b=tuIpb769 reason="key not found in DNS"; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kev009.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kev009.com
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-4581e7f31eeso36158151cf.0
        for <keyrings@vger.kernel.org>; Sun, 06 Oct 2024 19:32:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kev009.com; s=google; t=1728268379; x=1728873179; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eIagNj3XBeiwbes7ESay7OedVVX9YeO+j3SWRSuWDgU=;
        b=tuIpb769p5oD0BWU9SUrJE4RyPonSCiDvwzOKjzffMGJDU82HUKHq4lzCS/ioKYOrm
         QDXVeJV6LQjGIWPMtPKHYfrf4AEIiyZpWU3He1FOCy/6WqsM0rud7fQP4UtlJDBTZCq1
         ZjzQRzllrHWRp3q6Q9zICqXpK/uhznT/YuZoY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728268379; x=1728873179;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eIagNj3XBeiwbes7ESay7OedVVX9YeO+j3SWRSuWDgU=;
        b=Me912yHnLzL4qEh52ghz7j1Dp8Kif/4cstwwIaq1bOPjV7IhoSGwIaw7T5v2nPOm7l
         zNMTV5zIIZgEqqT55tLbfWVFIKdBPbOg65eEzrKiVQh+mQpsfQHGtDSpiBPu87NpfcVj
         iauFVgjx4XFK/etR+s47Le5sxaKxqUkIVk0vQoalFGBDIbXPp7lf6fnH/TL1Rd3pmTEu
         lfG6jy//28Lv3F32Dhkl9BQWY8JqkNz3R2btMBYGnsJS0A2yBtrPzcohc2bwC3wATPO0
         eO3+UVyJb163reHfBklCM18alkqNJAL2FUibyk3vXl2ctGF/ldmSJ2X2DMMVxQicMiGq
         aJnQ==
X-Forwarded-Encrypted: i=1; AJvYcCUmG/Ei2FiDHxODvmiWsg1pL5oZuh5AsYd5t1Jg3DAdDoI42OeKEtoVSUummi9I9sB0IOQ8e458EQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywaei3pnwOx9YfeokaRuRiY5pquZP0Nm+Wi1v/PQmwdaXSxWKHl
	jIhyhtYyOOm4mxSqg2u1LmoAWllsjJnAjFUV3yQaGGLSuDrcVvNVXqAh50GcHgzX7veIPEdVsSw
	/r6bysuPoMNerY4BNfYiCHnMAmjGxyhKdmuFjd09Rm4lfj1w=
X-Google-Smtp-Source: AGHT+IGW6ESRO/rs7JsIqpNrzr5mR+Qf6lp+llFyFWrhgLaCLuuBhqRYKgzRWQDEQknxfpZf58As69biVB1biwW3opY=
X-Received: by 2002:ac8:5792:0:b0:45b:1d3:d9a8 with SMTP id
 d75a77b69052e-45d9ba85fdcmr172235491cf.27.1728268379057; Sun, 06 Oct 2024
 19:32:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240801210155.89097-1-kevin.bowling@kev009.com>
In-Reply-To: <20240801210155.89097-1-kevin.bowling@kev009.com>
From: Kevin Bowling <kevin.bowling@kev009.com>
Date: Sun, 6 Oct 2024 19:32:47 -0700
Message-ID: <CAK7dMtDiL16JAXvTuTv3fOL5JNkMOCyjr6tVx44uDMKQxVnwqA@mail.gmail.com>
Subject: Re: [PATCH] KEYS: Print digitalSignature and CA link errors
To: dhowells@redhat.com, keyrings@vger.kernel.org, jarkko@kernel.org
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Hopefully this is pretty self explanatory, it just increases the
diagnostic capabilities of using the keyring erroneously.  How do I
get someone to look at it?

Regards,
Kevin


On Thu, Aug 1, 2024 at 2:02=E2=80=AFPM Kevin Bowling <kevin.bowling@kev009.=
com> wrote:
>
> ENOKEY is overloaded for several different failure types in these link
> functions.  In addition, by the time we are consuming the return several
> other methods can return ENOKEY.  Add some error prints to help diagnose
> fundamental certificate issues.
>
> Cc: stable@vger.kernel.org
> Signed-off-by: Kevin Bowling <kevin.bowling@kev009.com>
> ---
>  crypto/asymmetric_keys/restrict.c | 24 ++++++++++++++++++------
>  1 file changed, 18 insertions(+), 6 deletions(-)
>
> diff --git a/crypto/asymmetric_keys/restrict.c b/crypto/asymmetric_keys/r=
estrict.c
> index afcd4d101ac5..472561e451b3 100644
> --- a/crypto/asymmetric_keys/restrict.c
> +++ b/crypto/asymmetric_keys/restrict.c
> @@ -140,14 +140,20 @@ int restrict_link_by_ca(struct key *dest_keyring,
>         pkey =3D payload->data[asym_crypto];
>         if (!pkey)
>                 return -ENOPKG;
> -       if (!test_bit(KEY_EFLAG_CA, &pkey->key_eflags))
> +       if (!test_bit(KEY_EFLAG_CA, &pkey->key_eflags)) {
> +               pr_err("Missing CA usage bit\n");
>                 return -ENOKEY;
> -       if (!test_bit(KEY_EFLAG_KEYCERTSIGN, &pkey->key_eflags))
> +       }
> +       if (!test_bit(KEY_EFLAG_KEYCERTSIGN, &pkey->key_eflags)) {
> +               pr_err("Missing keyCertSign usage bit\n");
>                 return -ENOKEY;
> +       }
>         if (!IS_ENABLED(CONFIG_INTEGRITY_CA_MACHINE_KEYRING_MAX))
>                 return 0;
> -       if (test_bit(KEY_EFLAG_DIGITALSIG, &pkey->key_eflags))
> +       if (test_bit(KEY_EFLAG_DIGITALSIG, &pkey->key_eflags)) {
> +               pr_err("Unexpected digitalSignature usage bit\n");
>                 return -ENOKEY;
> +       }
>
>         return 0;
>  }
> @@ -183,14 +189,20 @@ int restrict_link_by_digsig(struct key *dest_keyrin=
g,
>         if (!pkey)
>                 return -ENOPKG;
>
> -       if (!test_bit(KEY_EFLAG_DIGITALSIG, &pkey->key_eflags))
> +       if (!test_bit(KEY_EFLAG_DIGITALSIG, &pkey->key_eflags)) {
> +               pr_err("Missing digitalSignature usage bit\n");
>                 return -ENOKEY;
> +       }
>
> -       if (test_bit(KEY_EFLAG_CA, &pkey->key_eflags))
> +       if (test_bit(KEY_EFLAG_CA, &pkey->key_eflags)) {
> +               pr_err("Unexpected CA usage bit\n");
>                 return -ENOKEY;
> +       }
>
> -       if (test_bit(KEY_EFLAG_KEYCERTSIGN, &pkey->key_eflags))
> +       if (test_bit(KEY_EFLAG_KEYCERTSIGN, &pkey->key_eflags)) {
> +               pr_err("Unexpected keyCertSign usage bit\n");
>                 return -ENOKEY;
> +       }
>
>         return restrict_link_by_signature(dest_keyring, type, payload,
>                                           trust_keyring);
> --
> 2.46.0
>

