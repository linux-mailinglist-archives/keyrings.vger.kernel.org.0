Return-Path: <keyrings+bounces-3430-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 19CCAC82062
	for <lists+keyrings@lfdr.de>; Mon, 24 Nov 2025 19:08:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 0DF5434981F
	for <lists+keyrings@lfdr.de>; Mon, 24 Nov 2025 18:07:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 523083195E3;
	Mon, 24 Nov 2025 18:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="bJfgEjmE"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B9363191C6
	for <keyrings@vger.kernel.org>; Mon, 24 Nov 2025 18:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764007596; cv=none; b=eXrj7GKoujI+I7tIf4t3LW3QhuFxuP1aimOp1agiAKCmL3Zr+23z98Y/wUaSrafcF53NEw668Dq8eW2u0yPTnQvV5xIsRjuA2OREj6lV4J378QpigMSMeVevdBh2S7My0gCL8YFeK6oddn0J0LEigFN6n3Di9B94c2E6CVqFVWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764007596; c=relaxed/simple;
	bh=4jyjA348Uccis+uPWmeHP3/Cr7AKyDETtMz1PjRInZ8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HrbEkhH1xUILWtRzEdXG/pcV3yGXe5ArAXCfjr1lFk2F14jHVc6ma9wm2+1BShmWeFB+AiPg9aUFf9Rv7hSNQkPVkvT8FyY8UF3S3L0oBGj0pZpJJlUA8aDmJYbGx4m3oCzXHoHwjDNBR/f3kZ8DRT0xWtTyZf1nanO1ZUd/qRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b=bJfgEjmE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EBA4C16AAE
	for <keyrings@vger.kernel.org>; Mon, 24 Nov 2025 18:06:35 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="bJfgEjmE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1764007590;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Zi2tifdlnm4pilxLA5hX4iEYZ93yOyBEU+BXbr3Wug0=;
	b=bJfgEjmETChnLppoIv6NT9bWBm3wI4/mCbWKrAymfn1VES+mbp32JL97LFvDxqmeueLv4O
	FFCaD69mAbNsuPwF201bdzYtwP4UDgBUR9ztYOjJUFiFK/o354Jg+YhauFgxFBxVQdw4eo
	yqdJx45EXqfxaQG7IeR79zPkIMAkrHU=
Received: 
	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id e8d6dc48 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
	for <keyrings@vger.kernel.org>;
	Mon, 24 Nov 2025 18:06:29 +0000 (UTC)
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-7c6cc44ff62so3094021a34.3
        for <keyrings@vger.kernel.org>; Mon, 24 Nov 2025 10:06:29 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXETWR91czJ9g6PXGxwzAEX13t0uR0jo1+2xhA18xLBnqrlf7sjUnRVX79RiYx8bHGjoTCCS32wEA==@vger.kernel.org
X-Gm-Message-State: AOJu0YykoYJFNZMhZrpckQVVkSXkCu07tS5FCNElYwFCjS6QuJmLrS2P
	SdGHX024bcT/8M0CvfqQhoN+ITBjk6xf5BbkP5kQRan+SJM3AMk0LeXVrUBEFDuL6o7lP+Pv7MU
	N2GC2mo51LFSUBVMvSnrYxZpx/8Zcdmk=
X-Google-Smtp-Source: AGHT+IG9yFbAB9mPY1ah1S5DbEkyC1/NUapcR00z5eBy/hk+C134+OhB4O0SLZVWNpbSJa6pmV5YrLb6e0Z4ZggBlyM=
X-Received: by 2002:a05:6830:2644:b0:78a:8b0d:cd54 with SMTP id
 46e09a7af769-7c798cfe6a7mr7062422a34.34.1764007587801; Mon, 24 Nov 2025
 10:06:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251120104439.2620205-6-dhowells@redhat.com> <20251120104439.2620205-1-dhowells@redhat.com>
 <3374841.1763975577@warthog.procyon.org.uk> <20251124164914.GA6186@sol> <3647621.1764005088@warthog.procyon.org.uk>
In-Reply-To: <3647621.1764005088@warthog.procyon.org.uk>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 24 Nov 2025 19:06:20 +0100
X-Gmail-Original-Message-ID: <CAHmME9pPWGKAdm83wKhc3iHCjgZ8gOtZnt=+6x5V6D1prMb2Gw@mail.gmail.com>
X-Gm-Features: AWmQ_blyTgayiMTPgpS1b7DE0B0LOV2Mh4edriTwnBqHPtexJGQ8-Mu5aOF6q1A
Message-ID: <CAHmME9pPWGKAdm83wKhc3iHCjgZ8gOtZnt=+6x5V6D1prMb2Gw@mail.gmail.com>
Subject: Re: [PATCH v10 5/8] crypto: Add ML-DSA crypto_sig support
To: David Howells <dhowells@redhat.com>
Cc: Eric Biggers <ebiggers@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>, 
	Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
	Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Ard Biesheuvel <ardb@kernel.org>, Stephan Mueller <smueller@chronox.de>, Lukas Wunner <lukas@wunner.de>, 
	Ignat Korchagin <ignat@cloudflare.com>, linux-crypto@vger.kernel.org, 
	keyrings@vger.kernel.org, linux-modules@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 24, 2025 at 6:25=E2=80=AFPM David Howells <dhowells@redhat.com>=
 wrote:
>
> Eric Biggers <ebiggers@kernel.org> wrote:
>
> > Still not really sure what the point is.  There's only one user of
> > crypto_sig, and it could just call the ML-DSA functions directly.
>
> Is it your aim to kill off the crypto/ dir and all the (old) crypto API?

Probably entirely killing off the old API is going to be fraught
because its abstraction has leaked out to userspace. But to the extent
we can minimize its use over time, I think that's a good thing. Even
for crypto usages that generalize to a few different ciphers of one
variety or another, I think being explicit about which ciphers and
having purpose-built dispatchers is usually a better route.

Jason

