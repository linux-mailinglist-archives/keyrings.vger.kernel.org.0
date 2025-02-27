Return-Path: <keyrings+bounces-2411-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 77991A4701E
	for <lists+keyrings@lfdr.de>; Thu, 27 Feb 2025 01:21:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5D4777A69BC
	for <lists+keyrings@lfdr.de>; Thu, 27 Feb 2025 00:20:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2258827004B;
	Thu, 27 Feb 2025 00:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="J939lYun"
X-Original-To: keyrings@vger.kernel.org
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83FAB2563
	for <keyrings@vger.kernel.org>; Thu, 27 Feb 2025 00:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740615713; cv=none; b=QDSVnb08XbQPo50AEiM+Jj0T6cS/jY1ct2b02j0ZC5wYbAB5e2RqNqjP9S1OxyX64gFOhFbKg0WHA6NdkN5zYo2ZF4vKaj9hZlULyzOaTJl7UMvkd7LPz92qLZQ8jc9pw7Pr7Ve3hX2L8Sg0Q/C4WhXq6m954V5rehd6mLOV4Ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740615713; c=relaxed/simple;
	bh=lA93WJsvl92fEN+e3o7YO4/3sHa1ZEPZrGW4J9LxunE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DzqBlARZlowVA+zSZC3173pYCD1UkXHgOD7q7sfphrXeob7h4odz3FaTqGGHnHlDj+e8ORWRHCHRVW6bB6+9QYFE6EAbMgaXm/bfNdI+jlcPU9nIVE5ZuvgwfeBiEb/+MFd3bvWyP1AsMtYxL4eZHDdIsBNsLXz9fnkR8htzZm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=J939lYun; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-6ef7c9e9592so4090497b3.1
        for <keyrings@vger.kernel.org>; Wed, 26 Feb 2025 16:21:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1740615710; x=1741220510; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LQb8xHBG/FR0hbx6pk01W2r0mdKrQfyVO9coElE3pw0=;
        b=J939lYuneuZWUQrkJvbPdGxmYYUyvfOLN4l0NbjdK8WrKF+Mq2s6otL437IQ4aksnp
         BmnIPcX9NL5c6L3Z41bEzfKBkcv8GWO4ERluiWhjEcUJuZykn1Oo+rm1et9Avr5Jaztd
         xPKCb4BRhK0Lnd3qK0vBwms18KLhbam/cetOPdB2hkiWVBFVD+jTtDAkdyPm0VgxFBUr
         zjIsc+mRBBVGl7FU2tsRaq5eQmVy8gh8pQ+D32++rSAKKjZG8jY5Wats3xfAfasZ0Z48
         Zstw4S+FpeHahidpzlz9ylXZBQb13ow4bR1UGwjq3xtNZmSPCg6iok1gLGQdZUEG22iD
         XZAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740615710; x=1741220510;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LQb8xHBG/FR0hbx6pk01W2r0mdKrQfyVO9coElE3pw0=;
        b=j33BedS4CK1PWi5gHaPAs3E6mzb4EhYYa6We/0yhNofcfWeDw8KsjQHPYzED8HwRD0
         kHfg1XSm/6hWckWNC+tEjGjnumQycnjgHEeVbTINT9NPDQI9Qbw6ivGx2WrWArd0cfx3
         rupGmXlMekEGScvUjPjlqbayiPddkYPH1dwxlaiFPuKgNrvIJ9NlfQTsL+aKgfP2jYo/
         bALs1JfxqSKPWL6St7YxCKz+zaPFWkzTaiU9iSsHbdYsdjmmYnouRfy8xrOBKPwGLAlQ
         Ezs9wL2zaagqX/OsnvQ5UJdG1NSUfXbsKkP0DIL3Z3rBWKip7v6jaheVcw7aHrXNgNl4
         uLUQ==
X-Forwarded-Encrypted: i=1; AJvYcCUdt7xWSz59YIT2Va4GuLD62xA4t2wh8Zt8koBn55LKWrTkaAS6q0KyhrBhvF3X5L+EK6b5CFewrA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwCWtHRx3mPDvQ7wfLx78pL7aLECcmqj+wxTwZUVTP5QDygtGWC
	cpGbCeVTiobeOCLCaoCjdp7Euc9XmI8rbXyuHZvcHAcit1u25QJebv8Ip7ZiZUegCLFLszof39L
	GqPT6axVm31Qd1Lq7EiIq0CZvUFmTiqTnEYMS
X-Gm-Gg: ASbGncsXqYrUPDVgUHGT9excht0PfwNqXch4KmJKmexjgJO/zk5j/bc+tQXHIaeA+jy
	tbYVhdS4zSt9i4C48XYcF6+o8B5xp35pRD7J9gD2Bh80aWHqF/p3SAlZ3ZOsJnEQyXOstnpGTmX
	uIdmOrF2E=
X-Google-Smtp-Source: AGHT+IE9M596fOsnvChdCaxBZdSAWh6n7T7MHXBJgqbUdKmToL6i4dODJlYnfR7DdaOaazxEJtI53RpYLKKE+GFsH3k=
X-Received: by 2002:a05:690c:6c04:b0:6fb:91a9:94d9 with SMTP id
 00721157ae682-6fd109aac64mr93407707b3.2.1740615710538; Wed, 26 Feb 2025
 16:21:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250123-sysctl_const-pcmoore-v1-1-d9f918dbb0be@suse.com>
In-Reply-To: <20250123-sysctl_const-pcmoore-v1-1-d9f918dbb0be@suse.com>
From: Paul Moore <paul@paul-moore.com>
Date: Wed, 26 Feb 2025 19:21:39 -0500
X-Gm-Features: AQ5f1JrZY5tKZxOzch7-SkqlEDKzPUv3kMxeIjzsldzlnYyGW6kgsoWl7IDE9J0
Message-ID: <CAHC9VhQpkyqaJsxj9_d4d6Vpc+FVbSnH_HeAFAVEdj0trGCh1g@mail.gmail.com>
Subject: Re: [PATCH] security: keys: Make sysctl table const
To: "Ricardo B. Marliere" <ricardo@marliere.net>, David Howells <dhowells@redhat.com>, 
	Jarkko Sakkinen <jarkko@kernel.org>
Cc: James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, keyrings@vger.kernel.org, 
	linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
	"Ricardo B. Marliere" <rbm@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 23, 2025 at 2:50=E2=80=AFPM Ricardo B. Marliere
<ricardo@marliere.net> wrote:
>
> Since commit 7abc9b53bd51 ("sysctl: allow registration of const struct
> ctl_table"), the sysctl registration API allows for struct ctl_table to b=
e
> in read-only memory. Move key_sysctls to be declared at build time, inste=
ad
> of having to be dynamically allocated at boot time.
>
> Cc: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>
> Suggested-by: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>
> Signed-off-by: Ricardo B. Marliere <rbm@suse.com>
> ---
>  security/keys/sysctl.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Looks fine to me.  David or Jarkko, this looks like something for the
keys tree, yes?

Reviewed-by: Paul Moore <paul@paul-moore.com>

> diff --git a/security/keys/sysctl.c b/security/keys/sysctl.c
> index 91f000eef3ad82370250e5238d9c9c80757aab61..cde08c478f3272081304e6db3=
4e36b64ce0d321a 100644
> --- a/security/keys/sysctl.c
> +++ b/security/keys/sysctl.c
> @@ -9,7 +9,7 @@
>  #include <linux/sysctl.h>
>  #include "internal.h"
>
> -static struct ctl_table key_sysctls[] =3D {
> +static const struct ctl_table key_sysctls[] =3D {
>         {
>                 .procname =3D "maxkeys",
>                 .data =3D &key_quota_maxkeys,
>
> ---
> base-commit: 714d87c90a766e6917f7d69f618b864d350f09d3
> change-id: 20250123-sysctl_const-pcmoore-fa14389b8329
>
> Best regards,
> --
> Ricardo B. Marliere <rbm@suse.com>

--=20
paul-moore.com

