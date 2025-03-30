Return-Path: <keyrings+bounces-2547-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 561B6A7590E
	for <lists+keyrings@lfdr.de>; Sun, 30 Mar 2025 11:02:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E29C5169DB3
	for <lists+keyrings@lfdr.de>; Sun, 30 Mar 2025 09:02:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F241B38FB9;
	Sun, 30 Mar 2025 09:02:23 +0000 (UTC)
X-Original-To: keyrings@vger.kernel.org
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A5E81FC8;
	Sun, 30 Mar 2025 09:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743325343; cv=none; b=fd46jwBxTkb0Sfn2iCIJMCqKsa3c8fYz+N8wkFFzCjh3eddoPDLQiJvngg7yD3RbMUDSgWZF9t5B/uUpHT71a9aSLumgaUqFIcwunZ6/Q9KTdcqjVlapz8AZhpbXu6O21Iwtyj7Il29mfclbp6Fllwoyw/PyJFOtMOqpLfPZgkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743325343; c=relaxed/simple;
	bh=HN4eyjGkmYzYJQBWqVbT566gMQ4nx+PEzy+YXapRTQc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P9mtt0u9xGUPr4chTLAyFu/7gdEPJ94CAXcXLcgyWOlBXO6vJgWJGutmkEj4PMHHziqyTjgbF036u1+kvZTD7K3z8/FRVTa/Cfw97pdrrgg5YEKJq/kQLuuWCTOr2fVq7FjeY8na/hFFMXUFavXoAQRy5GIqwa0QkIG3qptjXdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-72a4793d4e2so2358253a34.2;
        Sun, 30 Mar 2025 02:02:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743325341; x=1743930141;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1yBd/ODNrh8Fe+xOoPBuyChg14xiHnbz7kP9BJcwRFs=;
        b=KRLD+MdGApKt+WqZmBt59gUtgr8S04G92Id3GTqWcAgGCvPrsKXortgjwU2FYeB92R
         1+PPcFx3W/JQDtDO8fml/MBK7GomGGTygNMWlYR+c1h4cGBQneT2d431ziMlteEU0tzt
         ctb7kbsIy9CJaVMNpmIx+QlXk36qKmqpAwcoAecKRRmqLX1pAi2DMzTAln3xIoYL0DBf
         gQmZ2MC0qRbIyzKYG98boej4GYfcXNo7F2UfeU+WlY85oGRRk0c5nHuHtcpShI94u2L5
         Q3x05tc2OIKKnVL+u8ekF1SRhX4/Ln8ITQ9FPqoQiVmAGNcK4lA6de9+wgR2l0UB9rr6
         Nj1Q==
X-Forwarded-Encrypted: i=1; AJvYcCUH86sTTqU3f7y57scn2mVV7tXMFAqHR4TRh7WpoWkAkdnHStITQ5qyvFzym2RtltLMXyI0b3lcrQ7jm7Ao@vger.kernel.org, AJvYcCUMYO7ORR4AOAPA4z8dNlDw10i/n17XwCWQ/CV5t+X3G6ZTqHgrggNsdALl46AnblJjl3oUm0/t6DJ/NiA5TsI4/End72Ih@vger.kernel.org, AJvYcCW6L2G7vyrfk1M7XUTOCge5VRX1ffFImICtd3G0p7EEAxKoBej/Hc7G6v0PhCdR7OHWQoaugEkDCA==@vger.kernel.org, AJvYcCXBqwDi1v9aUzuymwvBWxFHohEOL5E10FC8t6GwcK8vj8wL04HCw3V83Dy9LFLhSSX9d196orFJpzEBmT7F@vger.kernel.org
X-Gm-Message-State: AOJu0YytgL2YS5CCqyogc/g1vRdroqoalmuwBKH6h6F9NjgViyBjki1o
	WMVHS4ZGGmyt2LTu9xKYru1jH08JhLlcPiNnEeJnooWW/rj+CW7O5WGe1/hc
X-Gm-Gg: ASbGnctXC7BVrpCjU7FQTDCt4p/Agk0uwGHjNwB4dVxrO5wI2ZgRNWsWOFWhojpzRaT
	Y341PcRZv/TY3/PnO89VkSok5jCch2G8aBxV2Zl7BTGaNqdq/apExtW+geLuyPek0DX5cGx53y9
	501T0V/02PSTpyQksgr+WIJH1MfwyH5rc+ejzBmk5uni/EQmkCaetUdU4D/JJa/SkBzRIyRo+n5
	XWBPxw70pXhHGe9iuJufHjgBs/28yQ6WQu+sajR8KM72UTg1JZkTTxm2HmRtQO/DxlB9mgEGrXL
	svT9bYqaxQhhcaeqlYNWZIUUfArrdaGyUh75w1wWUHa0YecJ9hWrOx3JUdkJ3lvNNnJxC70tEqX
	gy6sSVpU=
X-Google-Smtp-Source: AGHT+IGe1ca3/ROKpOPYc48RxAwb97dFnzwJgTg/ttj25F7g9YgtD4RPFjxSjWr8toYP2mqs9qF8Aw==
X-Received: by 2002:a05:6830:648d:b0:72b:8889:8224 with SMTP id 46e09a7af769-72c6378f567mr3776523a34.10.1743325340739;
        Sun, 30 Mar 2025 02:02:20 -0700 (PDT)
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com. [209.85.210.42])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-72c580fa72fsm1055752a34.41.2025.03.30.02.02.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 30 Mar 2025 02:02:20 -0700 (PDT)
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-72bbc03d436so2335232a34.3;
        Sun, 30 Mar 2025 02:02:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV143y1r4S9L/XvZtfpT27FdqbQcoYhDw7MI/e80L5o+Jdjg8MfubnyMO9TOi6vicPjL45gtvNSjhKr2f6W@vger.kernel.org, AJvYcCVMz3XnRkFBYG/MUmou22oMwYInYD0h+znB5QyUQpgreCxsIK4LnlBvBlSvp65UjNjWs9jbcoG5PKiVguMaI+LdUmeo6Ouq@vger.kernel.org, AJvYcCVfpBFjjFeuqZGAYX/oEKBD4YQL6Lxqqt3Njr+OZaJ9Bw0iVDNoSBhUfRquNT2ubNmNXW4AYM956g==@vger.kernel.org, AJvYcCW8hIUiESSggQ8aWdmvSTbUfNRSeJw1pBDBEJwzCWqJOQZmgS6yKnlQv0uTSuv1p0tjnp//HKzSe/IwKQj1@vger.kernel.org
X-Received: by 2002:a05:6102:374f:b0:4bd:22d5:fbd7 with SMTP id
 ada2fe7eead31-4c6d38bcea0mr3187622137.11.1743324864295; Sun, 30 Mar 2025
 01:54:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250314160543.605055-1-arnd@kernel.org> <CAMuHMdViGZRQL7toi7Arvm5L=OTK1mGmODbckE+427bx4KyWdw@mail.gmail.com>
 <4a1e3e4d-a568-4f5f-a6cc-502b9642d0eb@app.fastmail.com>
In-Reply-To: <4a1e3e4d-a568-4f5f-a6cc-502b9642d0eb@app.fastmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sun, 30 Mar 2025 10:54:12 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU2k8Bmnpw88s=zA_a2m8ez=exo7OA53MkzkG=evyC+PQ@mail.gmail.com>
X-Gm-Features: AQ5f1JphbMNAQgqmLcM55P3nJxdyUBj0OwAW-n13ImistOI9Tt0rKqYokhipW3k
Message-ID: <CAMuHMdU2k8Bmnpw88s=zA_a2m8ez=exo7OA53MkzkG=evyC+PQ@mail.gmail.com>
Subject: Re: [PATCH] [v2] crypto: lib/Kconfig: hide library options
To: Arnd Bergmann <arnd@arndb.de>
Cc: Arnd Bergmann <arnd@kernel.org>, "bbrezillon@kernel.org" <bbrezillon@kernel.org>, 
	Arnaud Ebalard <arno@natisbad.org>, Srujana Challa <schalla@marvell.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, "David S . Miller" <davem@davemloft.net>, 
	David Howells <dhowells@redhat.com>, Jarkko Sakkinen <jarkko@kernel.org>, 
	Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, 
	"Serge E. Hallyn" <serge@hallyn.com>, "Justin M. Forbes" <jforbes@fedoraproject.org>, 
	"Jason A . Donenfeld" <Jason@zx2c4.com>, Rosen Penev <rosenp@gmail.com>, Ard Biesheuvel <ardb@kernel.org>, 
	"James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>, linux-crypto@vger.kernel.org, 
	linux-kernel@vger.kernel.org, keyrings@vger.kernel.org, 
	linux-security-module@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Arnd,

On Sun, 30 Mar 2025 at 10:45, Arnd Bergmann <arnd@arndb.de> wrote:
> On Sun, Mar 30, 2025, at 10:34, Geert Uytterhoeven wrote:
> > On Fri, 14 Mar 2025 at 17:05, Arnd Bergmann <arnd@kernel.org> wrote:
> >> --- a/security/keys/Kconfig
> >> +++ b/security/keys/Kconfig
> >> @@ -60,7 +60,7 @@ config BIG_KEYS
> >>         bool "Large payload keys"
> >>         depends on KEYS
> >>         depends on TMPFS
> >> -       depends on CRYPTO_LIB_CHACHA20POLY1305 = y
> >> +       select CRYPTO_LIB_CHACHA20POLY1305
> >>         help
> >>           This option provides support for holding large keys within the kernel
> >>           (for example Kerberos ticket caches).  The data may be stored out to
> >
> > Due to dropping the dependency, this appeared on my radar.
> > Should this be selected by one or some of the Kerberos Kconfig symbols?
>
> I don't see why: before commit 521fd61c84a1 ("security/keys: rewrite
> big_key crypto to use library interface") it was user selectable
> without the crypto dependency, and now it got back to that. I think
> from the point of view of Kconfig that is how we want it.

Sure, I mean from a functional point of view.  Let me rephrase:
When do you want to store Kerberos ticket caches within the kernel?
Is that pure user-space, or is that done by the kernel?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

