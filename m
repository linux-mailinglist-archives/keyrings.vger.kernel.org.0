Return-Path: <keyrings+bounces-2815-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 91E7EAD476D
	for <lists+keyrings@lfdr.de>; Wed, 11 Jun 2025 02:23:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4BEA21896118
	for <lists+keyrings@lfdr.de>; Wed, 11 Jun 2025 00:23:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A8E7EBE;
	Wed, 11 Jun 2025 00:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="QQdEpC8t"
X-Original-To: keyrings@vger.kernel.org
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A3CB134CF
	for <keyrings@vger.kernel.org>; Wed, 11 Jun 2025 00:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749601393; cv=none; b=Xog77xZc++vGzbK63IQMWzWI4AgmEkv0fgekjmYFLpvQxAl6f7clZR/SDlqYeWptxd+d7WoRh/bVOjdRMy36MlqG3xz7yYnNhh1u+NjYsGdpXwJWP8emj9YfuykTQBnx5mHqxh9Hs8dG3rEWv2rdMknH80srZw+c99nQWEX0hro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749601393; c=relaxed/simple;
	bh=V3aNCDfEzfxl/wtuWs/n53MDcr+guvxs8lJ6Ns350/k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dVdsT+tAV4K9TW+41F3GoFvFfIrHE8MmZOfUHYzv87umvzIxISx3nqN6uzyUs+NxXLYkvUiZJZvPOuKm+5SFxwbe8dDtgylP7D6I+4r8Fsq9MSRXrpYX88rAAg89zXRbA+WYbRWJs2sYi6MELgO1gysn3450zDxEHWb+DCa2WMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=QQdEpC8t; arc=none smtp.client-ip=209.85.219.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-e733a6ff491so5968346276.2
        for <keyrings@vger.kernel.org>; Tue, 10 Jun 2025 17:23:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1749601390; x=1750206190; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mqyjEVOkyXwfMaGU1TDVpK5OMwZjvM7JjuGuGfqQfiw=;
        b=QQdEpC8tvO2NYpn3COPmL+/PVmayKd1y/tEzRp0zD6fbiE8eEN/tMpdbmPxgl4EMO0
         ScWtF+n9c/bZM6shIOECHLIXiu4uMksVUw4N2IjniUwitDomLVXsMEs0p9mBN/UZqxQg
         9PHX0ZJhAdHoHjQL73gzqD5WWL/Dj3Ts/ki+xHpY6Ad+AY0jMdoH4HJLmlxtAuzFOPv9
         90GBTd4WFbQMWM4bCKBKQ1RXY7p3jLNOcCJNxI1iT+If9x4AZuVqy4MJr6wuQXT4puvA
         dZV7tUaAYEAQoe6iGv542LJH5RyAAWpsiUtdZikRLcn9Uf5NarsFa89Ah5Waf3KQDSUR
         2JyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749601390; x=1750206190;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mqyjEVOkyXwfMaGU1TDVpK5OMwZjvM7JjuGuGfqQfiw=;
        b=Z7q2IfNdRn3Fl3tG6dAs2kKl+YdCCkwy3s+d8XZ0G4ktB7aAwNAZ1W5NflXHvq2Y2Y
         ADyW5I71HkzO6+JbWvplRXMIdkxFb5FgmGjVOvwmfwhiMLK23vhA91rGbxTHlijqdvgE
         vVYC6DkrLfr1mNoK1hTbc0ix95x3j5R9W7PXKV78cFZReCOkAHVXlmHxZj0lSIO9T8c6
         +UDdmvkomtdIuVWZpi/MF1eenXEnOJoSYKR19fDj7m1YVCM0r3pbG/TaPh5d5Bq8doNh
         5nEYnq7LN3oXMJ4dqGpTQ46IRXnCBif+Wfozm0TSFpyy04V9xte5Mv2em7G4FjE6uSgM
         KNQQ==
X-Forwarded-Encrypted: i=1; AJvYcCWRBonkVTg9F1O1EiDSKDzci2M0EfveJEDh+/Iadd8xxACpbpOp/TQGUJHqsBSN2JMfkJHpYJi7/w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyGHSVZfFrXZ6OWdpqcUxDWZHhnWgts9MUyIOeBIZ+eceGpKh+T
	49x9WPlhmpKVzArgQVZzHl9d6vq53OILIYMqGXxttI+pyJ0CHqHLul/ZcI1s0ibop6El1vKkwat
	avsdKDSKWhFrkqAyI25YIGNDqrjrRzzilMGQ4ixav
X-Gm-Gg: ASbGncvDxOn8FoeavsTbQzSvs2bghdoyy/ykTLZOEartECkf7GAKtWVWAr9i+bePGZL
	lK4olroTjybO3Kvh8hfXDXmNthCbi5RgU8X/7MP6YdJ+eSbij4QhOZyv2SckMcofA1SdtycyNp0
	WLsihinPMKxbWNUVfj1/WkWCye7xW/zDbj1b8u2x/Bi8o=
X-Google-Smtp-Source: AGHT+IE8M3LJ60ObL9WxE/FHdUjay5d0gjuX+l5wso77lgWCLyR1qO4waNRelGVeYQBTPS1XTsACv75zMxCstcB/c64=
X-Received: by 2002:a05:690c:c92:b0:710:ead5:8a95 with SMTP id
 00721157ae682-71142415677mr13830317b3.14.1749601390477; Tue, 10 Jun 2025
 17:23:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <301015.1748434697@warthog.procyon.org.uk>
In-Reply-To: <301015.1748434697@warthog.procyon.org.uk>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 10 Jun 2025 20:22:59 -0400
X-Gm-Features: AX0GCFuzTbBPakT7-fabDOVnCNVNEVKiLmeRI0FjA7IWgXlosDeLqvnendebUgs
Message-ID: <CAHC9VhRn=EGu4+0fYup1bGdgkzWvZYpMPXKoARJf2N+4sy9g2w@mail.gmail.com>
Subject: Re: [PATCH] KEYS: Invert FINAL_PUT bit
To: David Howells <dhowells@redhat.com>
Cc: torvalds@linux-foundation.org, Herbert Xu <herbert@gondor.apana.org.au>, 
	Jarkko Sakkinen <jarkko@kernel.org>, keyrings@vger.kernel.org, 
	linux-security-module@vger.kernel.org, linux-crypto@vger.kernel.org, 
	linux-integrity@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 28, 2025 at 8:19=E2=80=AFAM David Howells <dhowells@redhat.com>=
 wrote:
>
> Hi Linus,
>
> Could you apply this, please?  There shouldn't be any functional change,
> rather it's a switch to using combined bit-barrier ops and lesser barrier=
s.
> A better way to do this might be to provide set_bit_release(), but the en=
d
> result would be much the same.
>
> Thanks,
> David
> ---
> From: Herbert Xu <herbert@gondor.apana.org.au>
>
> KEYS: Invert FINAL_PUT bit
>
> Invert the FINAL_PUT bit so that test_bit_acquire and clear_bit_unlock
> can be used instead of smp_mb.
>
> Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>
> Signed-off-by: David Howells <dhowells@redhat.com>
> Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>
> cc: keyrings@vger.kernel.org
> cc: linux-security-module@vger.kernel.org
> cc: linux-crypto@vger.kernel.org
> cc: linux-integrity@vger.kernel.org
> ---
>  include/linux/key.h |    2 +-
>  security/keys/gc.c  |    4 ++--
>  security/keys/key.c |    5 +++--
>  3 files changed, 6 insertions(+), 5 deletions(-)

It doesn't look like this has made its way to Linus.  David or Jarkko,
do one of you want to pick this up into a tree and send this to Linus
properly?

> diff --git a/include/linux/key.h b/include/linux/key.h
> index ba05de8579ec..81b8f05c6898 100644
> --- a/include/linux/key.h
> +++ b/include/linux/key.h
> @@ -236,7 +236,7 @@ struct key {
>  #define KEY_FLAG_ROOT_CAN_INVAL        7       /* set if key can be inva=
lidated by root without permission */
>  #define KEY_FLAG_KEEP          8       /* set if key should not be remov=
ed */
>  #define KEY_FLAG_UID_KEYRING   9       /* set if key is a user or user s=
ession keyring */
> -#define KEY_FLAG_FINAL_PUT     10      /* set if final put has happened =
on key */
> +#define KEY_FLAG_USER_ALIVE    10      /* set if final put has not happe=
ned on key yet */
>
>         /* the key type and key description string
>          * - the desc is used to match a key against search criteria
> diff --git a/security/keys/gc.c b/security/keys/gc.c
> index f27223ea4578..748e83818a76 100644
> --- a/security/keys/gc.c
> +++ b/security/keys/gc.c
> @@ -218,8 +218,8 @@ static void key_garbage_collector(struct work_struct =
*work)
>                 key =3D rb_entry(cursor, struct key, serial_node);
>                 cursor =3D rb_next(cursor);
>
> -               if (test_bit(KEY_FLAG_FINAL_PUT, &key->flags)) {
> -                       smp_mb(); /* Clobber key->user after FINAL_PUT se=
en. */
> +               if (!test_bit_acquire(KEY_FLAG_USER_ALIVE, &key->flags)) =
{
> +                       /* Clobber key->user after final put seen. */
>                         goto found_unreferenced_key;
>                 }
>
> diff --git a/security/keys/key.c b/security/keys/key.c
> index 7198cd2ac3a3..3bbdde778631 100644
> --- a/security/keys/key.c
> +++ b/security/keys/key.c
> @@ -298,6 +298,7 @@ struct key *key_alloc(struct key_type *type, const ch=
ar *desc,
>         key->restrict_link =3D restrict_link;
>         key->last_used_at =3D ktime_get_real_seconds();
>
> +       key->flags |=3D 1 << KEY_FLAG_USER_ALIVE;
>         if (!(flags & KEY_ALLOC_NOT_IN_QUOTA))
>                 key->flags |=3D 1 << KEY_FLAG_IN_QUOTA;
>         if (flags & KEY_ALLOC_BUILT_IN)
> @@ -658,8 +659,8 @@ void key_put(struct key *key)
>                                 key->user->qnbytes -=3D key->quotalen;
>                                 spin_unlock_irqrestore(&key->user->lock, =
flags);
>                         }
> -                       smp_mb(); /* key->user before FINAL_PUT set. */
> -                       set_bit(KEY_FLAG_FINAL_PUT, &key->flags);
> +                       /* Mark key as safe for GC after key->user done. =
*/
> +                       clear_bit_unlock(KEY_FLAG_USER_ALIVE, &key->flags=
);
>                         schedule_work(&key_gc_work);
>                 }
>         }
>
>

--=20
paul-moore.com

