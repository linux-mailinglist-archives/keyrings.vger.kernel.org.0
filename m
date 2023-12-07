Return-Path: <keyrings+bounces-235-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 93F3D807ED4
	for <lists+keyrings@lfdr.de>; Thu,  7 Dec 2023 03:43:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2FFDF1F212F8
	for <lists+keyrings@lfdr.de>; Thu,  7 Dec 2023 02:43:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A04601846;
	Thu,  7 Dec 2023 02:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gJCt8ETd"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 818411841
	for <keyrings@vger.kernel.org>; Thu,  7 Dec 2023 02:43:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 305DDC433C7;
	Thu,  7 Dec 2023 02:43:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701917005;
	bh=lVj1DWlacgL/uVB9kHKy8XLmDpLD+qr5X0q9T0kkNwk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gJCt8ETde2U42gqN1DfxUwKsU+YOBVkrFfrUGVb/VV8+Yv/i7Ea8+QW8qIfhE5obz
	 AuQpRIiLwClHgG5QhSD84iiGUjGj4PXIZ8KrxrKukYTPYXBaWZPiv+GQ0Kzn6nyMw1
	 Fv0Cl4MavRjLINYL8rOdSBh+TY3+tsqZngJMDqGJsKhSlZN22zmGzD1JdK/VJJ0Cs4
	 esycynauabr067rvOiQp1qt45nTYySdY5WNYur/V6GUl1WzlB6GhuXscxDbS2gJqbZ
	 SlXDCFvVJXjZLvpK+JMPE/FFhQOvxoYlzuMnOHoZOKdooAcdMR8Bq8owMlmnhf8eqI
	 xgTD6/nZu3sLg==
Date: Wed, 6 Dec 2023 18:43:23 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Luis Henriques <lhenriques@suse.de>
Cc: David Howells <dhowells@redhat.com>,
	Jarkko Sakkinen <jarkko@kernel.org>, keyrings@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] keys: flush work when accessing /proc/key-users
Message-ID: <20231207024323.GA1994@sol.localdomain>
References: <20231206145744.17277-1-lhenriques@suse.de>
 <498294.1701878642@warthog.procyon.org.uk>
 <87bkb3z047.fsf@suse.de>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87bkb3z047.fsf@suse.de>

On Wed, Dec 06, 2023 at 05:55:52PM +0000, Luis Henriques wrote:
> David Howells <dhowells@redhat.com> writes:
> 
> > Luis Henriques <lhenriques@suse.de> wrote:
> >
> >> This patch is mostly for getting some feedback on how to fix an fstest
> >> failing for ext4/fscrypt (generic/581).  Basically, the test relies on the
> >> data read from /proc/key-users to be up-to-date regarding the number of
> >> keys a given user currently has.  However, this file can't be trusted
> >> because it races against the keys GC.
> >
> > Unfortunately, I don't think your patch helps.  If the GC hasn't started yet,
> > it won't achieve anything and the GC can still be triggered at any time after
> > the flush and thus race.
> >
> > What is it you're actually trying to determine?
> >
> > And is it only for doing the test?
> 
> OK, let me try to describe what the generic/581 fstest does.
> 
> After doing a few fscrypt related things, which involve adding and
> removing keys, the test will:
> 
> 1. Get the number of keys for user 'fsgqa' from '/proc/key-users'
> 2. Set the maxkeys to 5 + <keys the user had in 1.>
> 3. In a loop, try to add 6 new keys, to confirm the last one will fail
> 
> Most of the time the test passes, i.e., the 6th key fails to be added.
> However, if, for example, the test is executed in a loop, it is possible
> to have it fail because the 6th key was successfully added.  The reason
> is, obviously, because the test is racy: the GC can kick-in too late,
> after the maxkeys is set in step 2.
> 
> So, this is mostly an issue with the test itself, but I couldn't figure
> out a way to work around it.
> 
> Another solution I thought but I didn't look too deep into was to try to
> move the
> 
> 	atomic_dec(&key->user->nkeys);
> 
> out of the GC, in function key_gc_unused_keys().  Decrementing it
> synchronously in key_put() (or whatever other functions could schedule GC)
> should solve the problem with this test.  But as I said I didn't went too
> far looking into that, so I don't really know if that's feasible.
> 
> Finally, the test itself could be hacked so that the loop in step 3. would
> update the maxkeys value if needed, i.e. if the current number of keys for
> the user isn't what was expected in each loop iteration.  But even that
> would still be racy.

If there was a function that fully and synchronously releases a key's quota,
fs/crypto/ could call it before unlinking the key.  key_payload_reserve(key, 0)
almost does the trick, but it would release the key's bytes, not the key itself.

However, that would only fix the flakiness of the key quota for fs/crypto/, not
for other users of the keyrings service.  Maybe this suggests that key_put()
should release the key's quota right away if the key's refcount drops to 0?

Either way, note that where fs/crypto/ does key_put() on a whole keyring at
once, it would first need to call keyring_clear() to clear it synchronously.

A third solution would be to make fs/crypto/ completely stop using 'struct key',
and handle quotas itself.  It would do it correctly, i.e. synchronously so that
the results are predictable.  This would likely mean separate accounting, where
adding an fscrypt key counts against an fscrypt key quota, not the regular
keyrings service quota as it does now.  That should be fine, though the same
limits might still need to be used, in case users are relying on the sysctls...

The last solution seems quite attractive at this point, given the number of
times that issues in the keyrings service have caused problems for fs/crypto/.
Any thoughts are appreciated, though.

- Eric

