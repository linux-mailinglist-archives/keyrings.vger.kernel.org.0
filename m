Return-Path: <keyrings+bounces-2545-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 694CBA758F8
	for <lists+keyrings@lfdr.de>; Sun, 30 Mar 2025 10:41:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ED5763A96A2
	for <lists+keyrings@lfdr.de>; Sun, 30 Mar 2025 08:40:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C68216D4E6;
	Sun, 30 Mar 2025 08:41:01 +0000 (UTC)
X-Original-To: keyrings@vger.kernel.org
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65C4815A858;
	Sun, 30 Mar 2025 08:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743324061; cv=none; b=n8pkgsegX38Iz9pRTPVPmvOIYn3BkVzI0PP/gQKUdov4I9dLq5l5erMAlQA82h6XbtdkePsFTWRqdc/dRmXKhKYJQAJJ2zVyHYs2360KUsIzqtJFkUDRCprbv6Fq/nLKRtrpYazw3TtPb2H//R5ozb1OX0mx2WM+CiEVmubsYOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743324061; c=relaxed/simple;
	bh=jo+fUY9KjPyIY0nrwSxzp+BoGwLTb2tLqe+pxfvkNlk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QGoJptZkj0Y+DRojToEzmU4RQsENND6i0gpNz9Z4XzIcrYxzUDBxWBiiI6ReEs43dR2ANs6YVSfzUPkwkmHe4ZPHeUeYiKk6ONZaFowxms97pqCnoWwPuQEwh9w7DWbJddM20Z8zQjA+8Fy7sbvHq+N6ZNvJ9twN8WLVaUBawL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-520847ad493so3499405e0c.1;
        Sun, 30 Mar 2025 01:40:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743324058; x=1743928858;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZoQHXpkA0HF8Mt8XDc2rN36k5LR7d1tDjvQ8h8PozaY=;
        b=mocfEpqgqP4bnD+hCM5E+m+qseSJsc4ItXXgpfLfTyPUoyemWJ63/yGK8vaHc6RoKq
         PQ5RAN5sPqqynIfFQ+3OPbIbsTeHdTvd0VQMONPgsJRN08UfRxc6pq7sYFvqKQaZPag7
         waY9sC4DdSglf9U9yIUz0yJ7Pkt64GwHeTPhkirUe9xY/5XMR5XoO0Mk43kewU2wIcVX
         W7lEii4/JsbZLKwG52LqVIlqw+IezDzBqgmCmVgCU5ohsXWQ0/ZB2lMQbCyd2qpGP2gu
         nG7OyqdBt9dIfHDjf7+dTtc3OjkT5bBN75isp1N+SnK635RRAt7dr9cv/4k/09JktUqU
         uJ+g==
X-Forwarded-Encrypted: i=1; AJvYcCU6i9bflgLZc2VjjCZDvnUKo1RvdNnwBdZKreYXVn7vs3J6aDhqI89ogzlCWeleI3nE8p6kvzwJfw==@vger.kernel.org, AJvYcCVSGCKB6QWLRpF0v28g2/CzQnAOl8AXjqd+NTcGfA2UrF7Y6T1lakk6Gg+5KP60jk+QaGKQjomtx9Tu3nKf@vger.kernel.org, AJvYcCVzoppZQrC8Ek5Mcj9xD47JbDQ3vyYs5FZLKBUN8XdEp/9lVujeH0M5Legjog0vrSGYej5WNa9BbSNcqqGGMoxC0by04FCi@vger.kernel.org, AJvYcCXCD0GIs6zOkDs5WjR+1U/mgoNn2AhQtJK3zz0aTbPDsyqNh+eWBjdA38XDMkF5blPydrY1hBCMPqxg+BYR@vger.kernel.org
X-Gm-Message-State: AOJu0YyBFfciJeT/uGqtGJvkulendmAHJZ+QeWOxLbpF2cCSGpjXBTT2
	j5gXKlwIwU7csJi1DwBr00FpY6e/7PmOC9yzjCRCtsSzZFIJDwp+OZbXMOtI
X-Gm-Gg: ASbGnctDmYgJl3rNG3ezv3fObsaI7sSR6/j/yQND6jLl7VfE/ityYUNS6cLpxCtELQy
	MCZvC0R3dAiNWpwOHJK6ChDEmmBH7kx9C/8zgJaJk/13F0jZyUn2OV6PwDWDnCKhRToKcZltUsS
	Q/BK2kefkFrgmkzwawrFcpLgnD3UgCrEElPNrU9mcZOL5pe3rxOdyMOxxr6u+mZkhcHOc9kf9GH
	rApsU2qaFjU+rDDExn1epYFK3TzF6tz92ki/7SikPmm2PavFviPxX0esCXi04/3rMxDKdPIr8uL
	DKVGaDqra4PhEoUOWcLtdT59qPfxRk8iMLaYtMhJ4B8n5NuDNX3pqh+zf6n/QehPnBz4jNECW10
	5efU17JJX+D4=
X-Google-Smtp-Source: AGHT+IErjvIbcTuJxAq6mh/8rbjw67uY0ViOSP6eInFj77h33Zq0HidJ+dL38gtlD2aa2pZvQixC3Q==
X-Received: by 2002:a05:6102:3ca4:b0:4bb:e511:15a6 with SMTP id ada2fe7eead31-4c6d38d34fcmr3532115137.11.1743324057951;
        Sun, 30 Mar 2025 01:40:57 -0700 (PDT)
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com. [209.85.221.174])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4c6bfce96f4sm1136438137.14.2025.03.30.01.40.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 30 Mar 2025 01:40:57 -0700 (PDT)
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-520847ad493so3499403e0c.1;
        Sun, 30 Mar 2025 01:40:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU6qxxH9jYlhC3jEyKl65ES6l77XLOZuB5VGcy59p0X3E5iXOVhp+jkoY1lOF59xukB2ffWng7ABFgbexAn@vger.kernel.org, AJvYcCV5JI0hxLK2jqy9gcG5qDtxNuqnwej4Nd/Kqsv0GcbyPgAGZuFw6DaVQdJlmJi4y6PfluMI5odSq7bGCtpM@vger.kernel.org, AJvYcCWo0v/HkZBaRkrgB4tF3ieCILAGggtcBQ702jH8cPNlRcqcWms2RJ3TqaC372Zdv4mEGR0VCrtkgw==@vger.kernel.org, AJvYcCXfj0UroMn3WWJjHYxNZJ6iYOHv6D2YJRGZ7wLGeWhLxDpFR3+32FRylnCm2JIWgVna92Z88WO+iZ5hAFMZ9HjpCoYMOKG5@vger.kernel.org
X-Received: by 2002:a05:6102:510c:b0:4c1:869b:7db4 with SMTP id
 ada2fe7eead31-4c6d3886c27mr3306697137.9.1743323690025; Sun, 30 Mar 2025
 01:34:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250314160543.605055-1-arnd@kernel.org>
In-Reply-To: <20250314160543.605055-1-arnd@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sun, 30 Mar 2025 10:34:38 +0200
X-Gmail-Original-Message-ID: <CAMuHMdViGZRQL7toi7Arvm5L=OTK1mGmODbckE+427bx4KyWdw@mail.gmail.com>
X-Gm-Features: AQ5f1JpsRk8bUwx1w_Bo7lsmXMYQpvMMe33_LKw24q3KhkiO1G7u-hb7ENrQgYE
Message-ID: <CAMuHMdViGZRQL7toi7Arvm5L=OTK1mGmODbckE+427bx4KyWdw@mail.gmail.com>
Subject: Re: [PATCH] [v2] crypto: lib/Kconfig: hide library options
To: Arnd Bergmann <arnd@kernel.org>
Cc: Boris Brezillon <bbrezillon@kernel.org>, Arnaud Ebalard <arno@natisbad.org>, 
	Srujana Challa <schalla@marvell.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	"David S. Miller" <davem@davemloft.net>, David Howells <dhowells@redhat.com>, 
	Jarkko Sakkinen <jarkko@kernel.org>, Paul Moore <paul@paul-moore.com>, 
	James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, 
	"Justin M. Forbes" <jforbes@fedoraproject.org>, "Jason A. Donenfeld" <Jason@zx2c4.com>, 
	Arnd Bergmann <arnd@arndb.de>, Rosen Penev <rosenp@gmail.com>, Ard Biesheuvel <ardb@kernel.org>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, linux-crypto@vger.kernel.org, 
	linux-kernel@vger.kernel.org, keyrings@vger.kernel.org, 
	linux-security-module@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Arnd,

On Fri, 14 Mar 2025 at 17:05, Arnd Bergmann <arnd@kernel.org> wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>
> Any driver that needs these library functions should already be selecting
> the corresponding Kconfig symbols, so there is no real point in making
> these visible.
>
> The original patch that made these user selectable described problems
> with drivers failing to select the code they use, but for consistency
> it's better to always use 'select' on a symbol than to mix it with
> 'depends on'.
>
> Fixes: e56e18985596 ("lib/crypto: add prompts back to crypto libraries")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Thanks for your patch, which is now commit edc8e80bf862a728 ("crypto:
lib/Kconfig - hide library options").

> --- a/security/keys/Kconfig
> +++ b/security/keys/Kconfig
> @@ -60,7 +60,7 @@ config BIG_KEYS
>         bool "Large payload keys"
>         depends on KEYS
>         depends on TMPFS
> -       depends on CRYPTO_LIB_CHACHA20POLY1305 = y
> +       select CRYPTO_LIB_CHACHA20POLY1305
>         help
>           This option provides support for holding large keys within the kernel
>           (for example Kerberos ticket caches).  The data may be stored out to

Due to dropping the dependency, this appeared on my radar.
Should this be selected by one or some of the Kerberos Kconfig symbols?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

