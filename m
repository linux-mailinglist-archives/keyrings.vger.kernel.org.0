Return-Path: <keyrings+bounces-2497-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CE03A6AADA
	for <lists+keyrings@lfdr.de>; Thu, 20 Mar 2025 17:16:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 74F4D3B95DF
	for <lists+keyrings@lfdr.de>; Thu, 20 Mar 2025 16:14:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EB9A21CC5A;
	Thu, 20 Mar 2025 16:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OtN0CmcP"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25CB21EB198;
	Thu, 20 Mar 2025 16:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742487261; cv=none; b=WSnQ5pg2hPDVcyfutVN6K6gT2AS+jn6s3+D0/C3ZeIRrjhtycYFV5UwKfje2qCzUOfwP6GgO6IJmhZJEUZI59nnWBx7mOU9+GV9g4yvnQkSlpv3urqWgE//VDR/Fte1UHsoVgY40wmqKOlykkvAl48yW1u3Zj1CLJZpBfiEhxl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742487261; c=relaxed/simple;
	bh=Fn9pXh4lxMLX31zHxont+zvhZMtgvYJNY46WZiexzOk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LQiXs+DokYkdvbmnz8yu8RvnAJv4UVLF50aJBaGinYVjKg6VAQGPcet+3rklUl0tND1vLiU+DnMlRPW2q7BLg8S4zzeWGGRX7yMHqIm9R5hhUzFOQibcckc6Ivu4K9Um4CIQDKVyIVLoejyxteU/Fe/zqhFx1I3O4AP5QkPDPNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OtN0CmcP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16672C4CEDD;
	Thu, 20 Mar 2025 16:14:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742487260;
	bh=Fn9pXh4lxMLX31zHxont+zvhZMtgvYJNY46WZiexzOk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OtN0CmcP94HKckc21kYxVbm0rKzb5PNwwH6AGGvLJuxusGlWt+Lhc4u3hA+tGm+F7
	 F6XXRQj9URQEhixVOSFtaqTm9LqiQAjBOZTE+GMug+v+PhFa6k/j7LyDLhdbeYIPNV
	 oc/YXnNoeMFFyuNZW6MH9fyETelTonxUavVNSYDfrurTuvsAcN3hEOdQ1/51q1KdCV
	 0Lpsi8wqyZCw4uzKv8FPCD9btVS00zr1/E8odwGnlG+K5b2sxeQOy5sE+uBnFhN0ET
	 28L7UtAD0sY46SbQsn7NyBOMmN+hgjtsqNSc7ThA+wO9V2NuUqgAUefy4elzBVael6
	 aoMg1DBUyELhg==
Date: Thu, 20 Mar 2025 18:14:15 +0200
From: Jarkko Sakkinen <jarkko@kernel.org>
To: David Howells <dhowells@redhat.com>
Cc: Kees Cook <kees@kernel.org>, Oleg Nesterov <oleg@redhat.com>,
	Greg KH <gregkh@linuxfoundation.org>,
	Josh Drake <josh@delphoslabs.com>,
	Suraj Sonawane <surajsonawane0215@gmail.com>,
	keyrings@vger.kernel.org, linux-security-module@vger.kernel.org,
	security@kernel.org, stable@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] keys: Fix UAF in key_put()
Message-ID: <Z9w-10St-WYpSnKC@kernel.org>
References: <2874581.1742399866@warthog.procyon.org.uk>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2874581.1742399866@warthog.procyon.org.uk>

On Wed, Mar 19, 2025 at 03:57:46PM +0000, David Howells wrote:
>     
> Once a key's reference count has been reduced to 0, the garbage collector
> thread may destroy it at any time and so key_put() is not allowed to touch
> the key after that point.  The most key_put() is normally allowed to do is
> to touch key_gc_work as that's a static global variable.
> 
> However, in an effort to speed up the reclamation of quota, this is now
> done in key_put() once the key's usage is reduced to 0 - but now the code
> is looking at the key after the deadline, which is forbidden.
> 
> Fix this by using a flag to indicate that a key can be gc'd now rather than
> looking at the key's refcount in the garbage collector.
> 
> Fixes: 9578e327b2b4 ("keys: update key quotas in key_put()")
> Reported-by: syzbot+6105ffc1ded71d194d6d@syzkaller.appspotmail.com
> Signed-off-by: David Howells <dhowells@redhat.com>
> Tested-by: syzbot+6105ffc1ded71d194d6d@syzkaller.appspotmail.com
> cc: Jarkko Sakkinen <jarkko@kernel.org>
> cc: Oleg Nesterov <oleg@redhat.com>
> cc: Kees Cook <kees@kernel.org>
> cc: Hillf Danton <hdanton@sina.com>,
> cc: keyrings@vger.kernel.org
> Cc: stable@vger.kernel.org # v6.10+
> ---
>  include/linux/key.h |    1 +
>  security/keys/gc.c  |    4 +++-
>  security/keys/key.c |    2 ++
>  3 files changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/include/linux/key.h b/include/linux/key.h
> index 074dca3222b9..ba05de8579ec 100644
> --- a/include/linux/key.h
> +++ b/include/linux/key.h
> @@ -236,6 +236,7 @@ struct key {
>  #define KEY_FLAG_ROOT_CAN_INVAL	7	/* set if key can be invalidated by root without permission */
>  #define KEY_FLAG_KEEP		8	/* set if key should not be removed */
>  #define KEY_FLAG_UID_KEYRING	9	/* set if key is a user or user session keyring */
> +#define KEY_FLAG_FINAL_PUT	10	/* set if final put has happened on key */
>  
>  	/* the key type and key description string
>  	 * - the desc is used to match a key against search criteria
> diff --git a/security/keys/gc.c b/security/keys/gc.c
> index 7d687b0962b1..f27223ea4578 100644
> --- a/security/keys/gc.c
> +++ b/security/keys/gc.c
> @@ -218,8 +218,10 @@ static void key_garbage_collector(struct work_struct *work)
>  		key = rb_entry(cursor, struct key, serial_node);
>  		cursor = rb_next(cursor);
>  
> -		if (refcount_read(&key->usage) == 0)
> +		if (test_bit(KEY_FLAG_FINAL_PUT, &key->flags)) {
> +			smp_mb(); /* Clobber key->user after FINAL_PUT seen. */

test_bit() is already atomic.

https://docs.kernel.org/core-api/wrappers/atomic_bitops.html

>  			goto found_unreferenced_key;
> +		}
>  
>  		if (unlikely(gc_state & KEY_GC_REAPING_DEAD_1)) {
>  			if (key->type == key_gc_dead_keytype) {
> diff --git a/security/keys/key.c b/security/keys/key.c
> index 3d7d185019d3..7198cd2ac3a3 100644
> --- a/security/keys/key.c
> +++ b/security/keys/key.c
> @@ -658,6 +658,8 @@ void key_put(struct key *key)
>  				key->user->qnbytes -= key->quotalen;
>  				spin_unlock_irqrestore(&key->user->lock, flags);
>  			}
> +			smp_mb(); /* key->user before FINAL_PUT set. */
> +			set_bit(KEY_FLAG_FINAL_PUT, &key->flags);

Ditto.

Nit: I'm just thinking should the name imply more like that "now
key_put() is actually done". E.g., even something like KEY_FLAG_PUT_DONE
would be more self-descriptive.

>  			schedule_work(&key_gc_work);
>  		}
>  	}
> 
> 

BR, Jarkko

