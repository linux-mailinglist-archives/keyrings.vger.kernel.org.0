Return-Path: <keyrings+bounces-3379-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D6DB0C6C683
	for <lists+keyrings@lfdr.de>; Wed, 19 Nov 2025 03:36:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id 323872C10F
	for <lists+keyrings@lfdr.de>; Wed, 19 Nov 2025 02:36:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 907E128B4FA;
	Wed, 19 Nov 2025 02:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qiPyJD6y"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FDB028A72F;
	Wed, 19 Nov 2025 02:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763519799; cv=none; b=aO8VOz9JFZJ1SV05zdS110QvFp8Us7T68YE4gTI+whHiX5tYc4k1l9u07uKdwJdozcJbYB0+GTZhVWxoL9I3TivrY13Ii/lDbHYDUykHYqcO4PD05TFuKnq8wobjwIDvd2Q6CjP1MMvcV8azzFuBghBLcVxkdd7sWhMhsdSBenI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763519799; c=relaxed/simple;
	bh=ABnM292mGMnOc/mRBhXhFlHjMDzWFRfRmF+nLZtFZvU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a0f7+nC0C3Y2LH2xmMpqbW1CyNEVPaJ3fXFzSuHnm6qQ8vIlh4X+y1+XAXhlAX1Mt4WV7/HpmMwfiJTR9cV3DWufIqU+1mpP6W/i8dxeK1YuMZ/pihu9QGLz6iIDhqBxbkYjhlhHkwPyZ1zVt+CIxiGWVtRGaF3WSksk886khnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qiPyJD6y; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52053C4CEF5;
	Wed, 19 Nov 2025 02:36:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763519798;
	bh=ABnM292mGMnOc/mRBhXhFlHjMDzWFRfRmF+nLZtFZvU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qiPyJD6y/YTjGjGyYgRjyoPunNxA0GQm+sz5TAcN1/om5JmMeyHYowej37zoSPOAW
	 Oj13VTfz1hbyRHliVZWRviqxyuwZZ8riFmtQoiImdiSN/cyF8jRCf1F7ZnhCWMD44F
	 ibQ9xeGgONTUcR7s9IOmu4XtPq6ZAoTbXINcJvS6pAvq3B6/83fi7tKR/7Ry5g9Ca/
	 LC0h+1EJaCXSQt9j2JWieN3aGG/Y6ebkOhScJafgnnwn5kglGBsxVYoyCcqdG4Psbt
	 4VhbZFGNbxdTCkOm5xnjNK14+42bcDRdHkcgLsptQpEQulupyXCQ1LyL2gMGAen1wB
	 1MQZQV863aKQg==
Date: Wed, 19 Nov 2025 04:36:32 +0200
From: Jarkko Sakkinen <jarkko@kernel.org>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: David Howells <dhowells@redhat.com>, Paul Moore <paul@paul-moore.com>,
	James Morris <jmorris@namei.org>,
	"Serge E. Hallyn" <serge@hallyn.com>, keyrings@vger.kernel.org,
	linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] keys: Replace memcpy with strscpy in proc_keys_show
Message-ID: <aR0tME7U4tYNH-x6@kernel.org>
References: <20251112172620.4254-2-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251112172620.4254-2-thorsten.blum@linux.dev>

On Wed, Nov 12, 2025 at 06:26:21PM +0100, Thorsten Blum wrote:
> Use strscpy() to copy strings into the fixed-size buffer 'xbuf' instead
> of hardcoding the number of bytes to copy. This improves maintainability

I don't consider maintainaibility as a stimulus of applying change given
that as a word it means me absolutely nothing.

> and ensures the buffer is always NUL-terminated.
> 
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> ---
>  security/keys/proc.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/security/keys/proc.c b/security/keys/proc.c
> index 4f4e2c1824f1..1d380766f45d 100644
> --- a/security/keys/proc.c
> +++ b/security/keys/proc.c
> @@ -10,6 +10,7 @@
>  #include <linux/fs.h>
>  #include <linux/proc_fs.h>
>  #include <linux/seq_file.h>
> +#include <linux/string.h>
>  #include <asm/errno.h>
>  #include "internal.h"
>  
> @@ -199,9 +200,9 @@ static int proc_keys_show(struct seq_file *m, void *v)
>  	/* come up with a suitable timeout value */
>  	expiry = READ_ONCE(key->expiry);
>  	if (expiry == TIME64_MAX) {
> -		memcpy(xbuf, "perm", 5);
> +		strscpy(xbuf, "perm");
>  	} else if (now >= expiry) {
> -		memcpy(xbuf, "expd", 5);
> +		strscpy(xbuf, "expd");
>  	} else {
>  		timo = expiry - now;
>  
> -- 
> 2.51.0
> 

BR, Jarkko

