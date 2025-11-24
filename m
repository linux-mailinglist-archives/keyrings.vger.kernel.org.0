Return-Path: <keyrings+bounces-3432-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id E9756C82633
	for <lists+keyrings@lfdr.de>; Mon, 24 Nov 2025 21:11:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 42580342148
	for <lists+keyrings@lfdr.de>; Mon, 24 Nov 2025 20:11:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9432132E6A6;
	Mon, 24 Nov 2025 20:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="VMhEq6gV"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DAAD32E6A0
	for <keyrings@vger.kernel.org>; Mon, 24 Nov 2025 20:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764015049; cv=none; b=EBMfb/h7qnaVJrSvpCpOwmisKXUI3DAN1Z9KQuvONAxnK/C3KLWTtM7VpGDybCpEbTydsYF2w14FFuGqWJqaPFdol6uGidPZBynDCn8CJJtI4Gvl6VPRLjYCrZMMku+lqFr1LA8h9ZpYw60TajOJ2mWKEgIUgfmAydnRUeSEIWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764015049; c=relaxed/simple;
	bh=a+y4wukAA+1jMdGIq1khyra17EN9eXlmuIHqBxNOFXI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kv8UgTJG6ai6g578F16bDmybPQ6d+Xnsqhoq85QL/9FUHzsmFOOOA1C1pJm3WCvr5T2JvSypQBCPcqqV2m4kzUU5AZq38gfXz0OBPCO6nvfgUcGI60T01YOi1TmBFxRaz6FokxJq51Ii0oGx5Nq6MplnCBVYpF4xH987+GPYyDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b=VMhEq6gV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB9EAC19423
	for <keyrings@vger.kernel.org>; Mon, 24 Nov 2025 20:10:47 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="VMhEq6gV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1764015042;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mTFGv5+irE+D76L/fX9guw9f5TEqeJ3z4SWDcVvUWIo=;
	b=VMhEq6gVvDHlOeV0+1elngxiRSoRcfxWZ9Q++vtgmZTS4lEzULiheSU8ZDQR8yoULZNgmt
	lehXD2uwWg7jHOekuWw5y1VI0Kf7F99x6K+6jkXb9zzewM5mlfj7EK1Z+khcZ2RaqS7FLC
	hzVAibucSQVnSQKavvePRopgdo6Ciik=
Received: 
	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 4c2bf4c2 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
	for <keyrings@vger.kernel.org>;
	Mon, 24 Nov 2025 20:10:42 +0000 (UTC)
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-7c765f41346so1900996a34.3
        for <keyrings@vger.kernel.org>; Mon, 24 Nov 2025 12:10:41 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXveLEDtume9Q1yyuDPigojjLdkOwW2ZHmIfX7oMtG26o6aF4DXm7tsg+7DabWrNr/W0s7tsjauqg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwRqb+7HEBJLhH7sboltrrC0/FGNSlFhilvuoOoBgSNM/Ec40Sr
	KPg6YWSMZ1NugHZUXTxlwH0V5JB+jZHP+szVq6znlXBmpYz04SGd9tMOimshTC6KkmakudrXVQR
	gQixTq8SL3oQKjnvgxK9ThVq1P3h6hZM=
X-Google-Smtp-Source: AGHT+IEKUKzlPrtUzrUXVtGHzNIE1eu5x2hc3dhawKZInfj/tSJu3inQxzCC7kN8uLjnLqASm46j8mBNelKJmtIB0zo=
X-Received: by 2002:a05:6830:2707:b0:7c7:63b6:89d3 with SMTP id
 46e09a7af769-7c798c4e5cdmr6068249a34.19.1764015040160; Mon, 24 Nov 2025
 12:10:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251120104439.2620205-6-dhowells@redhat.com> <20251120104439.2620205-1-dhowells@redhat.com>
 <3374841.1763975577@warthog.procyon.org.uk> <20251124164914.GA6186@sol>
 <3647621.1764005088@warthog.procyon.org.uk> <CAHmME9pPWGKAdm83wKhc3iHCjgZ8gOtZnt=+6x5V6D1prMb2Gw@mail.gmail.com>
 <3649785.1764014053@warthog.procyon.org.uk>
In-Reply-To: <3649785.1764014053@warthog.procyon.org.uk>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 24 Nov 2025 21:10:33 +0100
X-Gmail-Original-Message-ID: <CAHmME9oK-e2BOXspf89McOFOiq8wp2-QgHsumK6r9kL5FyeMig@mail.gmail.com>
X-Gm-Features: AWmQ_blCIU2n1jvry0DcRMfnDRkDga25_Z6D-iElikYXrDuFyUM1Dxycud3IZeQ
Message-ID: <CAHmME9oK-e2BOXspf89McOFOiq8wp2-QgHsumK6r9kL5FyeMig@mail.gmail.com>
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

On Mon, Nov 24, 2025 at 8:54=E2=80=AFPM David Howells <dhowells@redhat.com>=
 wrote:
> > > > Still not really sure what the point is.  There's only one user of
> > > > crypto_sig, and it could just call the ML-DSA functions directly.
> > >
> > > Is it your aim to kill off the crypto/ dir and all the (old) crypto A=
PI?
> >
> > Probably entirely killing off the old API is going to be fraught
> > because its abstraction has leaked out to userspace. But to the extent
> > we can minimize its use over time, I think that's a good thing. Even
> > for crypto usages that generalize to a few different ciphers of one
> > variety or another, I think being explicit about which ciphers and
> > having purpose-built dispatchers is usually a better route.
>
> How are you proposing handling the autoloading feature of the old API?

I don't know. Not all features will have direct replacements. Not all
usages will be replaced. Not all use cases benefit from being
replaced. You asked if it was an "aim." I replied by telling you that
I think killing it is going to be difficult, but that over time, usage
will decline. I think that'll be a natural thing. For now, when
something uses the library API, there's a pretty easy and obvious case
to be made for it, as there are still such obvious low hanging use
cases. I suppose in a while, we might run out of those perhaps. But
that hasn't happened yet, I guess.

Jason

