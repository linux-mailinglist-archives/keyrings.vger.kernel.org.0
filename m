Return-Path: <keyrings+bounces-2563-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 16EE7A7A274
	for <lists+keyrings@lfdr.de>; Thu,  3 Apr 2025 14:06:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8C62E1891A90
	for <lists+keyrings@lfdr.de>; Thu,  3 Apr 2025 12:06:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1B9A24CEF9;
	Thu,  3 Apr 2025 12:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PiZCDBZ+"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 814F424290C;
	Thu,  3 Apr 2025 12:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743681963; cv=none; b=jQ17YqhshfujVnMBtNUxLnZ6NmG/gNgQ8Oz1oCdl98fAJtZzXrXzl+LSYuDcz41PZNe304tbW4t9Thw7BAdbgRr0iGzJ5AKsy91mWZ6+E1CFGklVuhs/134/tJXJKk/lrhOvuPtbphiQwpTaA3ETkXJDP3yAMIpqMMybcMT7A7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743681963; c=relaxed/simple;
	bh=sjmack4EoUmHmo6vMAILdfQ+jA0WcdHfWudhUmx1cO8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WNXXWY/p7qfAQep7kw4/pGBoi9x1oy4LwmsyewG3h6MVM1/jTxjY0gox/jO/Ftb4FqoSnoKYj5P9XaIStHBa4Mg3UiKoxWPUpK96DDEyinYoE9is543kBqHaRmQZA0l7f5gyKoAywwpytFH09Wg5ULuIIYb/y5xMNDQOuGBhxW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PiZCDBZ+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB682C4CEE7;
	Thu,  3 Apr 2025 12:06:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743681963;
	bh=sjmack4EoUmHmo6vMAILdfQ+jA0WcdHfWudhUmx1cO8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PiZCDBZ+Jq820ndaBbrtHhdNCeptfln1iERsn26JhPQpmdhSICCEOcDbNdd4/Giuj
	 7zdB/yWzw7hQbo9ezDKsDcJg3ikXHuqhiveB/PDncf3CHlJ5q/BBNhVPqqJp1ZmH5v
	 abmpojSl0ogWOjg81ORGXZi+Lj2wvp9N6Aq/S/LBy0BmkjnMVLLCnn+TFiBnCQdU9K
	 Daw0B0qGxBXyeSbKFyixAPnzgByPNktUDD+UmhTmi7DZjrxnNaTNXCwrR79b4ihcQa
	 YfqhlAvZQ8jsOWvdMVx6fKpxIzpDsD8SpN8wDToVurGRr9IfmuzVtJUt+rCynnq7UP
	 Ksk9OurcYdaCg==
Date: Thu, 3 Apr 2025 15:05:59 +0300
From: Jarkko Sakkinen <jarkko@kernel.org>
To: David Howells <dhowells@redhat.com>
Cc: keyrings@vger.kernel.org, Jarkko Sakkinen <jarkko.sakkinen@opinsys.com>,
	Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
	"Serge E. Hallyn" <serge@hallyn.com>, linux-kernel@vger.kernel.org,
	linux-security-module@vger.kernel.org
Subject: Re: [RFC PATCH v3] KEYS: Add a list for unreferenced keys
Message-ID: <Z-55p44u6rJRrY5A@kernel.org>
References: <20250402085257.728844-1-jarkko@kernel.org>
 <797521.1743602083@warthog.procyon.org.uk>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <797521.1743602083@warthog.procyon.org.uk>

On Wed, Apr 02, 2025 at 02:54:43PM +0100, David Howells wrote:
> Jarkko Sakkinen <jarkko@kernel.org> wrote:
> 
> > Add an isolated list for unreferenced keys, thereby splitting key
> > deletion as separate phase, after the reaping cycle. This makes the
> > whole process more safe, as these two distinct tasks don't intervene
> > each other. As an effect, KEY_FLAG_FINAL_PUT is no longer needed.
> >
> > Since `security/keys/proc.c` reserves key_serial_lock for variable
> > amount of time, `rb_erase()` cannot be done within `key_put()` by using
> > IRQ saving/restoring versions of the spin lock functions. For the same
> > reason, the key needs to co-exist both in the tree and in the list for
> > period of time.
> >
> > Therefore, split the union in `struct key` into separate `serial_node`
> > and `graveyard_link` fields, and introduce a separate lock for the
> > graveyard, which is locked and unlocked using IRQ saving/restoring
> > versions of the locking routines.

For this response I'll just discuss around the bullets brought up.
I need more time with seqlock solution.

What I did pick from your patch is that I'll revert the name of the
helper function back to key_gc_unused_keys() because I think it is
not senseful rename (only adds unneeded delta).

> Splitting the union seems reasonable.
> 
> However, you need to be very careful extracting keys from the serial tree
> outside of the gc loop:
> 
>  (1) The serial tree walking loop assumes that it can keep a pointer to the
>      key it is currently examining without holding any locks.  I think this is
>      probably not a problem for your patch as you're doing the removal in the
>      same work item.
> 
>  (2) We have to deal with put keys belonging to a key type that's undergoing
>      removal.  That might not be a problem as we can just get rid of them
>      directly - but we have to deal with the RCU implications and may need to
>      call synchronize_rcu() again after calling key_gc_graveyard().
> 
>  (3) We still have to deal with a new key_put() happening immediately after
>      you've done the rb_erase() calls.  I think it's probably worth still
>      skipping the evaluation of the key state if the refcount is 0 (if we're
>      getting rid of the FINAL_PUT flag).  We might be holding up key
>      insertion, after all.

In this v3, true, the processing is broken, as pages with usage at zero
go also go through "gc state machine" (or whatever you want to call the
key type teardown process).

How my solution could be improved to address these concerns for the most
part, would be to do this in the beginning of each iteration:

	if (!refcount_inc_not_zero(&key->usage))
		goto skip_dead_key;

And after processing: call key_put() (essentially open-coded
kref_get_unless_zero).

This would guarantee that the traversal keeps it hands off from pages
with usage reduced to zero, wouldn't it?

If this is added to the patch, I don't really see how this patch would
break the causality i.e., order of how things are executed in the
garbage collection flow.

BR, Jarkko
 

