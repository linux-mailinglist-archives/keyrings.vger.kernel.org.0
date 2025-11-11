Return-Path: <keyrings+bounces-3327-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 041FBC4F1FE
	for <lists+keyrings@lfdr.de>; Tue, 11 Nov 2025 17:52:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E30F918879F0
	for <lists+keyrings@lfdr.de>; Tue, 11 Nov 2025 16:52:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72F94377E88;
	Tue, 11 Nov 2025 16:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b="V6vmHzIZ"
X-Original-To: keyrings@vger.kernel.org
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FDA92F5A16
	for <keyrings@vger.kernel.org>; Tue, 11 Nov 2025 16:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762879928; cv=none; b=kQ9MJEYCO5TL5oisXMxf4CXZ73yzhfU71wZaExTxCkqaFfTZs/3ZrfMH4UDYdX6FgUaxkg0hkYLYKXwubqlh9hbu6iGxKtfdmBk0LG0R6ndpW632/qtAgz94IPeWTE8X+/7U9zSMyzd04snmhxiJzSzSjNqjyVY69vDIB+QKH0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762879928; c=relaxed/simple;
	bh=HEIC2usiTHdfW1IJriTA3jOrfNUiVWrInSNqYkPBaGo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ev/PLY38Ml8tj3LjsmtyxDfPGSgT/MBIBDie+TkbMsX83WEFJ30dUbEn0FNhG1W4zXhgJp/itKB0EJW3ZUJ74KVX6fHlI7QYrfRxLddqEkV1jIaQqxe49I3jkH+pm5rm7CQZ/IZ2ZdFNbssO8SLEZUwNE0ZSOOsfFgc+gm8NT28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com; spf=pass smtp.mailfrom=cloudflare.com; dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b=V6vmHzIZ; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-8b272a4ca78so367340485a.1
        for <keyrings@vger.kernel.org>; Tue, 11 Nov 2025 08:52:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1762879924; x=1763484724; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uaNFkqsjr5HqJ0U2z2rhHc1IR4euaoELq+Vuadxi0mU=;
        b=V6vmHzIZ/0h7EG7IVdRdOaO4C+VQXmZpWkT533XH8PJbezQnyvbfR0oj+PHCbZgjYv
         MM3U9dyu0ZjiX15PmEwMJf5+JndnDy1GL3RKUR+8XIVMP0ibr6hj4nseci/qvvFxaDqK
         5VV0vdbPgLEaC498zwwEJUN22k87lH65Kc5805zrDSRMBwzZTSv1kftFRKcbq+3zF5hE
         0qP5TfYV390B0zbi8X94lENmZElkbGgjI40s+Hq/TsUn0ZX3m9XUhVspaKc2+d4V2Huc
         LE83yy8wrkxFyiyKxdOQrFSWnOuCzB/Ixk2uJRPM+pOOXEfemtiLVPwdy24UalKnQWJ5
         +4Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762879924; x=1763484724;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uaNFkqsjr5HqJ0U2z2rhHc1IR4euaoELq+Vuadxi0mU=;
        b=vznDxrtsDRe8Qk0kBv393B+UL/a0aYf2qnzMvawMWto54r/MbelzpUMgxDc6iIU165
         9l7xjSftK7fAlo81ciBuHOFoRcUJFYk1gl5ChbhHuMldAp4uA7cJzv/Va1txPPzxkXM5
         G26RRcZWXhnuqNW06Aw6ZLD7GA44f2sJYrysIwkVWa36oCYcb7bKjZKrADEDTzb3SL6q
         0of6CEru3ZPLffupVZl2WUQKNfwsVdCA9k1JzGlW+TqULvvOJ8qnsW0tr2zaazeEFxlH
         ZljE4VqdhsPtWyuEs34EHIaHBRhpnTQ0gTRZcbeXzueuKwkARcmM3qGn2/mMZ51MO6Cw
         lc9Q==
X-Forwarded-Encrypted: i=1; AJvYcCUrVs2bsy0Y+ycnKrGOne+Yiy2IvC2AdzdWa8hHYv4rBswqE3fUuB9djmg7Xo/3OXDVWvxMqtw0rA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxcv/Taf20ZO1XWGrs0x4IOKFzn0YJSHbmemitrvodFMb66gG0H
	yppnN9hhPCToJhPcOeBEPzwvaSNNoALu/sUWYAfVYtG2bh6KXBln9Y1ztag6PiRlLa36F9AUNsL
	yne/1881bZv4cEHq/84QJPgGWCOk/xUbOWEJpaLZNBw==
X-Gm-Gg: ASbGncthj+mgnNkxm/yWom88/QyVakojyTgaDOTNTOqHoGRF49ELfgvtz/jtF6HmuQO
	DxBQDdO2VxmDh5lDFrHRulbMu2dULcZXNstfgyttlZmatL3r/JRHxnVwtoCd1WI7K19Bj/+UshJ
	t1YlPpE3nG8tt3lVx3VFzOTOSM3ayW7TImp8Sm6oc/kXibHu7YlJbLuguAsDrQ1xOfnP+lYr5PR
	MgSbtSfjUw0fP2RccG1D6mO+4VRj1GdrmZ5vMM2ZNi0V9JT9SKIlxk73GfQswB8v21xEVmh1h1R
	GTnZqsLalXTxtUqXB3YaKxRf
X-Google-Smtp-Source: AGHT+IEUkPPpBFSnV49PowujRgyHB8h3Cch3prLC6j+Nq7FI3gGEKIgq2OVf2cRR3rles90pF9EIZfNOPT3YwIjwQ28=
X-Received: by 2002:a05:620a:31a4:b0:866:a24e:2eb5 with SMTP id
 af79cd13be357-8b257ef5b64mr1620026685a.34.1762879923750; Tue, 11 Nov 2025
 08:52:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aRHClatB48XT_hap@kspp>
In-Reply-To: <aRHClatB48XT_hap@kspp>
From: Ignat Korchagin <ignat@cloudflare.com>
Date: Tue, 11 Nov 2025 16:51:48 +0000
X-Gm-Features: AWmQ_bnpjuyUMlKXkIQGvaXCW-KCOwGvfQY3esE3go312vitsho8JRzN-sru6wg
Message-ID: <CALrw=nF_riH-aHJ6gpKBw59s0szrWhqT+QmdpYVH6d38Kc_rZA@mail.gmail.com>
Subject: Re: [PATCH][next] KEYS: Avoid -Wflex-array-member-not-at-end warning
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: David Howells <dhowells@redhat.com>, Lukas Wunner <lukas@wunner.de>, 
	Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, 
	keyrings@vger.kernel.org, linux-crypto@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 10, 2025 at 10:46=E2=80=AFAM Gustavo A. R. Silva
<gustavoars@kernel.org> wrote:
>
> -Wflex-array-member-not-at-end was introduced in GCC-14, and we are
> getting ready to enable it, globally.
>
> Use the new TRAILING_OVERLAP() helper to fix the following warning:
>
> crypto/asymmetric_keys/restrict.c:20:34: warning: structure containing a =
flexible array member is not at the end of another structure [-Wflex-array-=
member-not-at-end]
>
> This helper creates a union between a flexible-array member (FAM) and a
> set of MEMBERS that would otherwise follow it.
>
> This overlays the trailing MEMBER unsigned char data[10]; onto the FAM
> struct asymmetric_key_id::data[], while keeping the FAM and the start
> of MEMBER aligned.
>
> The static_assert() ensures this alignment remains, and it's
> intentionally placed inmediately after the corresponding structures --no
> blank line in between.
>
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Reviewed-by: Ignat Korchagin <ignat@cloudflare.com>

> ---
>  crypto/asymmetric_keys/restrict.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/crypto/asymmetric_keys/restrict.c b/crypto/asymmetric_keys/r=
estrict.c
> index afcd4d101ac5..86292965f493 100644
> --- a/crypto/asymmetric_keys/restrict.c
> +++ b/crypto/asymmetric_keys/restrict.c
> @@ -17,9 +17,12 @@ static struct asymmetric_key_id *ca_keyid;
>
>  #ifndef MODULE
>  static struct {
> -       struct asymmetric_key_id id;
> -       unsigned char data[10];
> +       /* Must be last as it ends in a flexible-array member. */
> +       TRAILING_OVERLAP(struct asymmetric_key_id, id, data,
> +               unsigned char data[10];
> +       );
>  } cakey;
> +static_assert(offsetof(typeof(cakey), id.data) =3D=3D offsetof(typeof(ca=
key), data));

The whole thing looks a bit convoluted to me just to declare a
fixed-sized static buffer and call sizeof() in one place in the code.
But I couldn't come up with a better refactor not introducing
potential alignment side-effects. So LGTM.

>  static int __init ca_keys_setup(char *str)
>  {
> --
> 2.43.0
>

