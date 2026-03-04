Return-Path: <keyrings+bounces-4112-lists+keyrings=lfdr.de@vger.kernel.org>
Delivered-To: lists+keyrings@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YF5SEtR4p2kshwAAu9opvQ
	(envelope-from <keyrings+bounces-4112-lists+keyrings=lfdr.de@vger.kernel.org>)
	for <lists+keyrings@lfdr.de>; Wed, 04 Mar 2026 01:12:04 +0100
X-Original-To: lists+keyrings@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A9C4B1F8C20
	for <lists+keyrings@lfdr.de>; Wed, 04 Mar 2026 01:12:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B947D314174C
	for <lists+keyrings@lfdr.de>; Wed,  4 Mar 2026 00:10:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B7A325487B;
	Wed,  4 Mar 2026 00:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kqFyvjKe"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA058156661;
	Wed,  4 Mar 2026 00:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772583016; cv=none; b=DUBpRvgZud2XBOUFne0JRPuR2xaSJutkhGZfijPS9OuMDsGzO42njOXQE/cCTFjam8UhtzlenMQYXFMpOTaok4HXiqB7cOPLA8+TEwqBheB5s+ToPDXIa1bf2Wuny8Cprec7s9g7NDWekuYzWW0D74JSOIObsPwE6r733qgZPWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772583016; c=relaxed/simple;
	bh=/+Y6TOGK51ZxFNMXoih+KFXcgCQwCvWw+S5SsTriiBI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pYmxC1NUJnp/a3vmQrPDQO1hKgt1i8MVElFf4zzl56Va0JfGzobacT0OXm6l1edH0PsB7Oh2MXTlt/AB8zX8c+qFgqxduRFxSzV46PEgoaabDauw/bk6bT8eduaG8oh+ackWBAb/b9KpLokpbjUwXblvLpv7u9Amr6NVihTAWlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kqFyvjKe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22A05C2BCB4;
	Wed,  4 Mar 2026 00:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772583016;
	bh=/+Y6TOGK51ZxFNMXoih+KFXcgCQwCvWw+S5SsTriiBI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kqFyvjKekxr0UU4fQxcooWEVJkBJ5eVm8pG44sRwAfaIwgW4TW7sJwYwOrkp+l6xy
	 Zo4KjkzOz4ANbJ/ALJnP81uTD2Rm5YTJGPQePeq2yKrXUYGxzS4+I1igu7MJwEAQEi
	 2QZn9V994pbUJTIhFX1hnuCNamtTHWKtWCW4YUrO/ERSaLXCLH9lonbvaadT+ssRTG
	 cK4DMDokKjuLW+XgeSnJkD8eVsxXxyfxO5OEGdrM8miaFoNUA3nJYBkB0on6flIrh6
	 CwO/9uchMQL7Fc7PYkzDDDtJAVGvNTWeS9soWwuXexPLocE5nbwnynqqH3UCRcAffN
	 dIpgYLSn6s/RA==
Date: Wed, 4 Mar 2026 02:10:11 +0200
From: Jarkko Sakkinen <jarkko@kernel.org>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: David Howells <dhowells@redhat.com>, Paul Moore <paul@paul-moore.com>,
	James Morris <jmorris@namei.org>,
	"Serge E. Hallyn" <serge@hallyn.com>, keyrings@vger.kernel.org,
	linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] keys: Remove return variable and length check to
 simplify user_read
Message-ID: <aad4Y7WFjHr8lRyC@kernel.org>
References: <20260228094447.869637-1-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260228094447.869637-1-thorsten.blum@linux.dev>
X-Rspamd-Queue-Id: A9C4B1F8C20
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_FROM(0.00)[bounces-4112-lists,keyrings=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jarkko@kernel.org,keyrings@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[keyrings];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,linux.dev:email]
X-Rspamd-Action: no action

On Sat, Feb 28, 2026 at 10:44:46AM +0100, Thorsten Blum wrote:
> In user_read(), remove the unnecessary return variable 'ret' and return
> ->datalen directly. Drop the redundant 'buflen > 0' check and use min()
> to determine the number of bytes to copy.  No functional changes.
> 
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>

Trivial cleanup commits with no function are not feasible. They only do
harm e.g., for backporting actual bug fixes.

> ---
>  security/keys/user_defined.c | 12 +++---------
>  1 file changed, 3 insertions(+), 9 deletions(-)
> 
> diff --git a/security/keys/user_defined.c b/security/keys/user_defined.c
> index 6f88b507f927..b53e063272c2 100644
> --- a/security/keys/user_defined.c
> +++ b/security/keys/user_defined.c
> @@ -171,20 +171,14 @@ EXPORT_SYMBOL_GPL(user_describe);
>  long user_read(const struct key *key, char *buffer, size_t buflen)
>  {
>  	const struct user_key_payload *upayload;
> -	long ret;
>  
>  	upayload = user_key_payload_locked(key);
> -	ret = upayload->datalen;
>  
>  	/* we can return the data as is */
> -	if (buffer && buflen > 0) {
> -		if (buflen > upayload->datalen)
> -			buflen = upayload->datalen;
> +	if (buffer)
> +		memcpy(buffer, upayload->data, min(buflen, upayload->datalen));
>  
> -		memcpy(buffer, upayload->data, buflen);
> -	}
> -
> -	return ret;
> +	return upayload->datalen;
>  }
>  
>  EXPORT_SYMBOL_GPL(user_read);
> -- 
> Thorsten Blum <thorsten.blum@linux.dev>
> GPG: 1D60 735E 8AEF 3BE4 73B6  9D84 7336 78FD 8DFE EAD4
> 

BR, Jarkko

