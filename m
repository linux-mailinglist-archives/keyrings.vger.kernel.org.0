Return-Path: <keyrings+bounces-1927-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A28C09616F1
	for <lists+keyrings@lfdr.de>; Tue, 27 Aug 2024 20:24:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A452F1C23014
	for <lists+keyrings@lfdr.de>; Tue, 27 Aug 2024 18:24:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2ACCB1D2F47;
	Tue, 27 Aug 2024 18:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rxfOrOef"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 008531D27A3;
	Tue, 27 Aug 2024 18:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724783077; cv=none; b=Hx9wnoFekfMV7oMaunGBmC/9se+Vm/EAV9yHCY6hFcdM0Fwx1F0BBvMgJO1FOit4MwJGqZE/fsoUd7QcMZ/F615uDMAhcgtNRvuQ2ZuZdZJTvBCVCBbCgQ+U9r7xIJNqDeGZgR7buHKXVsBravFmIgcpjOKt9Zt6xLzRkOBp34c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724783077; c=relaxed/simple;
	bh=/Tw/BAbmJ86KglO6HRmnOfxV9PBQaZOCrQMcgFDZ6tc=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=Krp1zrZ3Kc7Wqjug0/lQpksAiZXb4RaY9RfIHxqLRHS80j76mnDBjT2L+b7xhv70siYAUK1T8Ul1dMozv8RGx9ZJNa0qzRsi0HI0khFfGFYCokBLGDMp2HOgxBYP3NOHnmcu2TCui1EMSxXAGf5esghxTDBm6LRpeRQfVx+X49k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rxfOrOef; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A907C4AF0E;
	Tue, 27 Aug 2024 18:24:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724783076;
	bh=/Tw/BAbmJ86KglO6HRmnOfxV9PBQaZOCrQMcgFDZ6tc=;
	h=Date:To:Cc:Subject:From:References:In-Reply-To:From;
	b=rxfOrOefl1/065iEs0XC4vrQUvHW0oAkICAyCa7v4tIWKKfiw5jQHJAhd5CBvuK1b
	 Tt7fCknWLVK5X1zdc2ayYnEN2Fy9BsuS0LQF0JlvvsoadCPWLx2LY3rRkkPvkeTngI
	 ta4rmWzdVp9AbyYOlEYR2ldifDEBeNQmIJe1US/+PZS6dOjjh9Df8TbC0bLel09C3g
	 MoTSOFDCaQaEeihuAhGa+htPWoHyZowvrn/+UX4ZsWzd+zaWZk4r7jYudDhckqU3Ht
	 r7BDhzK1e16cbmQio1W06Uy69ZgwOzy7K/9EBokZgTvCl+3ZrgvxpAj/5D65YF1euM
	 QO2mI5PPxRlZg==
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 27 Aug 2024 21:24:33 +0300
Message-Id: <D3QWKLDSU5CF.1NC837V9HZ3O3@kernel.org>
To: "David Howells" <dhowells@redhat.com>
Cc: <keyrings@vger.kernel.org>, <linux-security-module@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 6/7] keys: Provide a key_try_get() function and use it
From: "Jarkko Sakkinen" <jarkko@kernel.org>
X-Mailer: aerc 0.17.0
References: <20240821123616.60401-1-dhowells@redhat.com>
 <20240821123616.60401-7-dhowells@redhat.com>
In-Reply-To: <20240821123616.60401-7-dhowells@redhat.com>

On Wed Aug 21, 2024 at 3:36 PM EEST, David Howells wrote:
> Add a key_try_get() function to try to get a ref on a key and switch code
> that's manipulating the key refcount directly to use it.  This will allow=
 a
> tracepoint to be emplaced there later.
>
> Signed-off-by: David Howells <dhowells@redhat.com>
> cc: Jarkko Sakkinen <jarkko@kernel.org>
> cc: keyrings@vger.kernel.org
> cc: linux-security-module@vger.kernel.org
> ---
>  include/linux/key.h     |  1 +
>  security/keys/key.c     | 16 +++++++++++++++-
>  security/keys/keyring.c |  2 +-
>  3 files changed, 17 insertions(+), 2 deletions(-)
>
> diff --git a/include/linux/key.h b/include/linux/key.h
> index 80d736813b89..4e5baf3e7286 100644
> --- a/include/linux/key.h
> +++ b/include/linux/key.h
> @@ -300,6 +300,7 @@ extern struct key *key_alloc(struct key_type *type,
>  extern void key_revoke(struct key *key);
>  extern void key_invalidate(struct key *key);
>  struct key *key_get(struct key *key);
> +struct key *key_try_get(struct key *key);
>  extern void key_put(struct key *key);
>  extern bool key_put_tag(struct key_tag *tag);
>  extern void key_remove_domain(struct key_tag *domain_tag);
> diff --git a/security/keys/key.c b/security/keys/key.c
> index 14c7ee77ea15..59cffb6f9b94 100644
> --- a/security/keys/key.c
> +++ b/security/keys/key.c
> @@ -649,6 +649,20 @@ struct key *key_get(struct key *key)
>  }
>  EXPORT_SYMBOL(key_get);
> =20
> +/**
> + * key_try_get - Get a ref on a key if its refcount is not non-zero.
> + * @key: The key to get a reference on.
> + *
> + * Get a reference on a key unless it has no references and return true =
if
> + * successful.  @key must not be NULL.
> + */
> +struct key *key_try_get(struct key *key)
> +{
> +	if (!refcount_inc_not_zero(&key->usage))
> +		return NULL;
> +	return key;
> +}
> +
>  /**
>   * key_put - Discard a reference to a key.
>   * @key: The key to discard a reference from.
> @@ -709,7 +723,7 @@ struct key *key_lookup(key_serial_t id)
>  	/* A key is allowed to be looked up only if someone still owns a
>  	 * reference to it - otherwise it's awaiting the gc.
>  	 */
> -	if (!refcount_inc_not_zero(&key->usage))
> +	if (!key_try_get(key))
>  		goto not_found;
> =20
>  error:
> diff --git a/security/keys/keyring.c b/security/keys/keyring.c
> index e77d927f1d4d..a09a4c2b1bcb 100644
> --- a/security/keys/keyring.c
> +++ b/security/keys/keyring.c
> @@ -1174,7 +1174,7 @@ struct key *find_keyring_by_name(const char *name, =
bool uid_keyring)
>  		/* we've got a match but we might end up racing with
>  		 * key_cleanup() if the keyring is currently 'dead'
>  		 * (ie. it has a zero usage count) */
> -		if (!refcount_inc_not_zero(&keyring->usage))
> +		if (!key_try_get(keyring))
>  			continue;
>  		keyring->last_used_at =3D ktime_get_real_seconds();
>  		goto out;

Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>

BR, Jarkko

