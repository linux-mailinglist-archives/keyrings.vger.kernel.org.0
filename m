Return-Path: <keyrings+bounces-3433-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 12323C82688
	for <lists+keyrings@lfdr.de>; Mon, 24 Nov 2025 21:27:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id A7627348F81
	for <lists+keyrings@lfdr.de>; Mon, 24 Nov 2025 20:27:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51EA324679C;
	Mon, 24 Nov 2025 20:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AARKnf5y"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B4C821D58B;
	Mon, 24 Nov 2025 20:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764016026; cv=none; b=R8GbZcFg+8W5xZta+hX78lOPflRlnr2x4aeMYF4ptx9ElSdRVRIB7WcRzVtFbg31A5WBF2LRpdwkE34KJMy/r54smj587Ig4vBStKjqZdRFPt3U0zt59eEwezK+mayNuu+SpnNn/+/cBdjGgRlAAFkZ7TdfDGzBCbfyZBUTuG6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764016026; c=relaxed/simple;
	bh=NvzDm9hi3uqVMgctZ+wcHzy6c2UCEzupyEHOQTxXkSM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BG4Zjt6AtHc29tRNGnMSOD7r0RyERcOIyAkF0tzftFGRMD5NV2A06loS6vBAxjJhCX+UQTfwckL+DCld9pecEYMK3qvV8IP3jCjGs+qSuL9DSMX5Oi7enYDkglKN/BGxRHMUrMENbhcgrJ+tAnMMLQv6lC44VJL6h3yJB6miPaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AARKnf5y; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9DEEC4CEF1;
	Mon, 24 Nov 2025 20:27:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764016025;
	bh=NvzDm9hi3uqVMgctZ+wcHzy6c2UCEzupyEHOQTxXkSM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AARKnf5ydWZUpOccxfrRnWXgtOILIvTUJxA+L0S+V2xK20LQZi5Yx5ivT/dYIZsCB
	 s9vMdH8NF5TyYrH1A/6hTostxsTYdHsdZ+aBl8IVquAaLxOdVM8ci8TGSnGcwZz9SD
	 E6Dm8OJiiAeI56t50LVJKZO6ypA5LLBplp70EfeklyTVmjfwWubm3sBJYbj0zqCiq7
	 R1xVrKjp4hyeN6yFkltXfU0fR1Feyq3fTsJulXa/GheTk7AMIbkxC7cyFsMkeQbJtm
	 1qGtjNiBm2v1NH66iwUvcdp37k/wmus17ZlnGUnhsQUOHTQSvQNw4D5vrG1cWn/Vay
	 gdlOccdhKnE0g==
Date: Mon, 24 Nov 2025 20:27:02 +0000
From: Eric Biggers <ebiggers@kernel.org>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: David Howells <dhowells@redhat.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Daniel Gomez <da.gomez@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Stephan Mueller <smueller@chronox.de>,
	Lukas Wunner <lukas@wunner.de>,
	Ignat Korchagin <ignat@cloudflare.com>,
	linux-crypto@vger.kernel.org, keyrings@vger.kernel.org,
	linux-modules@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v10 5/8] crypto: Add ML-DSA crypto_sig support
Message-ID: <20251124202702.GA43598@google.com>
References: <20251120104439.2620205-6-dhowells@redhat.com>
 <20251120104439.2620205-1-dhowells@redhat.com>
 <3374841.1763975577@warthog.procyon.org.uk>
 <20251124164914.GA6186@sol>
 <3647621.1764005088@warthog.procyon.org.uk>
 <CAHmME9pPWGKAdm83wKhc3iHCjgZ8gOtZnt=+6x5V6D1prMb2Gw@mail.gmail.com>
 <3649785.1764014053@warthog.procyon.org.uk>
 <CAHmME9oK-e2BOXspf89McOFOiq8wp2-QgHsumK6r9kL5FyeMig@mail.gmail.com>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHmME9oK-e2BOXspf89McOFOiq8wp2-QgHsumK6r9kL5FyeMig@mail.gmail.com>

On Mon, Nov 24, 2025 at 09:10:33PM +0100, Jason A. Donenfeld wrote:
> On Mon, Nov 24, 2025 at 8:54 PM David Howells <dhowells@redhat.com> wrote:
> > > > > Still not really sure what the point is.  There's only one user of
> > > > > crypto_sig, and it could just call the ML-DSA functions directly.
> > > >
> > > > Is it your aim to kill off the crypto/ dir and all the (old) crypto API?
> > >
> > > Probably entirely killing off the old API is going to be fraught
> > > because its abstraction has leaked out to userspace. But to the extent
> > > we can minimize its use over time, I think that's a good thing. Even
> > > for crypto usages that generalize to a few different ciphers of one
> > > variety or another, I think being explicit about which ciphers and
> > > having purpose-built dispatchers is usually a better route.
> >
> > How are you proposing handling the autoloading feature of the old API?
> 
> I don't know. Not all features will have direct replacements. Not all
> usages will be replaced. Not all use cases benefit from being
> replaced. You asked if it was an "aim." I replied by telling you that
> I think killing it is going to be difficult, but that over time, usage
> will decline. I think that'll be a natural thing. For now, when
> something uses the library API, there's a pretty easy and obvious case
> to be made for it, as there are still such obvious low hanging use
> cases. I suppose in a while, we might run out of those perhaps. But
> that hasn't happened yet, I guess.
> 
> Jason

+1 to what Jason said.  The traditional API generally isn't going away.
However, there's no need to add new functionality to it when the library
is a better fit.  The crypto_sig abstraction doesn't seem very helpful,
since it was added only recently and has only one user (public_key).

The traditional crypto API's dynamic loading by name also tends to be
more harmful than helpful.  Linux users and distros keep running into
problems where algorithms aren't available in the initramfs when they
should be, or where the slow generic code is used instead of the
optimized code.  The direct linking finally just fixes that.

You may also still be thinking of the ML-DSA code as something
heavyweight.  I reduced it to under 4 KB of object code.

It should also become the recommended algorithm anyway, right?

Either way, 4 KB seems awfully small to be wanting to be dynamically
loaded.  Last year I shrunk the x86_64 AES-GCM code (which most Linux
distros build in to avoid the dynamic loading issues) by over 200 KB.
No one even seemed to care that much...  We can add a lot of stuff
before we're even back to where we were before that.

- Eric

