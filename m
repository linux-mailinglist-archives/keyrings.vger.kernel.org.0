Return-Path: <keyrings+bounces-1922-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BF3429616D5
	for <lists+keyrings@lfdr.de>; Tue, 27 Aug 2024 20:22:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F18A81C226C6
	for <lists+keyrings@lfdr.de>; Tue, 27 Aug 2024 18:22:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 137D51CF291;
	Tue, 27 Aug 2024 18:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WpBlAI5x"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBAD01C57A5;
	Tue, 27 Aug 2024 18:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724782944; cv=none; b=RUzNnHhjK4uhjPnYJ2JOnaIJP6TqcdxjmPkfsP05R36uOl2At6iO2CT34k9pvaDOVApJImZi5QLprWIJv5dPwpZO/jQMmtSbpS0rF0oEZkdcz7oR8Zn//kGATeWT3oDbS+a0wL0dedSxtB4dN8mfnxuyoApQh2Gd5b9QbQ4gpcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724782944; c=relaxed/simple;
	bh=7hdYxdp0h4HrbUL2hEPjOQoitXxoa82OnPsx6X6CD28=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=SPjtkoAdQycOvAhuTuHEEkBLn6Gx1YIU0AaUudhjSyzNt4UdWC6w95Ojm/A+iXt8dg3SBl1u2DIglIJKu+a+0ci7AN9adAahgohGBOgvKTi7BocJqFN/rae6p2g7oMFISGDs3B00Tgol6lYacoeBcKpo/2PLDt5V7h/JJ0pThVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WpBlAI5x; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10F5AC4AF60;
	Tue, 27 Aug 2024 18:22:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724782943;
	bh=7hdYxdp0h4HrbUL2hEPjOQoitXxoa82OnPsx6X6CD28=;
	h=Date:To:Cc:Subject:From:References:In-Reply-To:From;
	b=WpBlAI5xQyYkqJpiQVtKpPCeEM5/uvP/Hyrc5cikgQSHa/Gr9VziezXs2q61OU1xK
	 M36dsiyvSKA5uiZ7/JN+xJBJ/XXcMbtAynDnvW2AZj2cX6TjANYtn0WdStm4r1n2xm
	 So1pR0GH8lNQ5FAfTbM4HHtqEQF//NrNf8jnOha5+oySh6RoToXSvutmWOnwgVdwSA
	 qVKfgaFwW/FmwyzZlWCw9YdT4vRo/U928Igp4VOlWlSUkONk37l2JdclnEHCAuss0D
	 y5Tc3M3YqjF4Vfz+rNgBGj4aKNDgtq0AWcM/wkOYku/+kEgi4Pqd2CLkL3mI2KZtzR
	 RIUY7jcrDC2bA==
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 27 Aug 2024 21:22:19 +0300
Message-Id: <D3QWIW0EZK6J.180CPCNSOPTCN@kernel.org>
To: "David Howells" <dhowells@redhat.com>
Cc: <keyrings@vger.kernel.org>, <linux-security-module@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/7] keys: Out of line key_is_dead() so it can have
 tracepoints added in
From: "Jarkko Sakkinen" <jarkko@kernel.org>
X-Mailer: aerc 0.17.0
References: <20240821123616.60401-1-dhowells@redhat.com>
 <20240821123616.60401-2-dhowells@redhat.com>
In-Reply-To: <20240821123616.60401-2-dhowells@redhat.com>

On Wed Aug 21, 2024 at 3:36 PM EEST, David Howells wrote:
> Move key_is_dead() out of line so that tracepoints can be added in to it
> without incurring circular #includes.  Also, it is only used from the fil=
e
> it is moved into.
>
> Signed-off-by: David Howells <dhowells@redhat.com>
> cc: Jarkko Sakkinen <jarkko@kernel.org>
> cc: keyrings@vger.kernel.org
> cc: linux-security-module@vger.kernel.org
> ---
>  security/keys/internal.h | 20 --------------------
>  security/keys/keyring.c  | 20 ++++++++++++++++++++
>  2 files changed, 20 insertions(+), 20 deletions(-)
>
> diff --git a/security/keys/internal.h b/security/keys/internal.h
> index 2cffa6dc8255..8ba87127e446 100644
> --- a/security/keys/internal.h
> +++ b/security/keys/internal.h
> @@ -211,26 +211,6 @@ extern struct key *request_key_auth_new(struct key *=
target,
> =20
>  extern struct key *key_get_instantiation_authkey(key_serial_t target_id)=
;
> =20
> -/*
> - * Determine whether a key is dead.
> - */
> -static inline bool key_is_dead(const struct key *key, time64_t limit)
> -{
> -	time64_t expiry =3D key->expiry;
> -
> -	if (expiry !=3D TIME64_MAX) {
> -		if (!(key->type->flags & KEY_TYPE_INSTANT_REAP))
> -			expiry +=3D key_gc_delay;
> -		if (expiry <=3D limit)
> -			return true;
> -	}
> -
> -	return
> -		key->flags & ((1 << KEY_FLAG_DEAD) |
> -			      (1 << KEY_FLAG_INVALIDATED)) ||
> -		key->domain_tag->removed;
> -}
> -
>  /*
>   * keyctl() functions
>   */
> diff --git a/security/keys/keyring.c b/security/keys/keyring.c
> index 4448758f643a..0eed018448cb 100644
> --- a/security/keys/keyring.c
> +++ b/security/keys/keyring.c
> @@ -1687,6 +1687,26 @@ static void keyring_revoke(struct key *keyring)
>  	}
>  }
> =20
> +/*
> + * Determine whether a key is dead.
> + */
> +static bool key_is_dead(const struct key *key, time64_t limit)
> +{
> +	time64_t expiry =3D key->expiry;
> +
> +	if (expiry !=3D TIME64_MAX) {
> +		if (!(key->type->flags & KEY_TYPE_INSTANT_REAP))
> +			expiry +=3D key_gc_delay;
> +		if (expiry <=3D limit)
> +			return true;
> +	}
> +
> +	return
> +		key->flags & ((1 << KEY_FLAG_DEAD) |
> +			      (1 << KEY_FLAG_INVALIDATED)) ||
> +		key->domain_tag->removed;
> +}
> +
>  static bool keyring_gc_select_iterator(void *object, void *iterator_data=
)
>  {
>  	struct key *key =3D keyring_ptr_to_key(object);

Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>

BR, Jarkko

