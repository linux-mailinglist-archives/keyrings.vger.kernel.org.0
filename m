Return-Path: <keyrings+bounces-1925-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 516B29616E5
	for <lists+keyrings@lfdr.de>; Tue, 27 Aug 2024 20:23:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 83E081C22AFF
	for <lists+keyrings@lfdr.de>; Tue, 27 Aug 2024 18:23:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39EA31D1F4C;
	Tue, 27 Aug 2024 18:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E2blvyp+"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EC791C7B63;
	Tue, 27 Aug 2024 18:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724783023; cv=none; b=B9GRgvdU7AcomDGBaJjXsQOsJZ+h+nnbTLfXaYVB9goazvfv0eWOoy4oB6sgr14YlMooBqZtxFQ4CQn+FwgJXtFc2WNN1GkYDxOe9pOwdVbfbW2b4UepKqnqJKjYcENQLbCqQQqUX0Mw97eoyhCQ8ajz+esgWSgBy+lYl+cYEQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724783023; c=relaxed/simple;
	bh=4v4iYT8Vx0RqfonG/nWgwbfesR4g31gFGrlehm5Fhb0=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=jc8U4IJpdeuG+6y78qzDU7xSal/8kmoRV5DIUG0PvoXKPKgsLSLkW8Xd60HQURnVa9W5rpuvSlYir1ufKvrk4WfiBsKZMXwLa6hdXOmqXZlNQsLq565nBAo8sJLSjpcavDYEjIzzW2dkTZu4XPpliKXMUOlKWwk29VNSBvnAg0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E2blvyp+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C838C4AF0E;
	Tue, 27 Aug 2024 18:23:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724783022;
	bh=4v4iYT8Vx0RqfonG/nWgwbfesR4g31gFGrlehm5Fhb0=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=E2blvyp+gANDSarTciYsQsyFXpleeQ5UH2AmoVLLz6+kopDIl6uEdSMPk7161jau0
	 UY0TeFogRWXbw5FTLbVJ811PdaiGpHk3vgF6TYzN9vY0sq31fgYd9X4gwWWDOHHPCs
	 YYPtsYK/0/a1TIj+tcrtZfXLX0ThtZiwES6+zpcca6zhRaoM7a7+RPplSIlyH34alM
	 t6KUx+blxsSOww6VwaMh/ocNonjMb0IW8leR0NFml8nAuPHy5I2ikl5u9CXRKzvSFQ
	 5Ab48nCz+dLHIAJX/irqSLjry9UnrQ5m2zgvFzJt6t9bThho5a6dXhZeE9em7XkLZN
	 dpfCfBkMc3FTg==
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 27 Aug 2024 21:23:39 +0300
Message-Id: <D3QWJWFPGR7Q.2XUGONFPC8B9S@kernel.org>
Cc: <keyrings@vger.kernel.org>, <linux-security-module@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 4/7] keys: Add a key_ref_get() wrapper
From: "Jarkko Sakkinen" <jarkko@kernel.org>
To: "David Howells" <dhowells@redhat.com>
X-Mailer: aerc 0.17.0
References: <20240821123616.60401-1-dhowells@redhat.com>
 <20240821123616.60401-5-dhowells@redhat.com>
In-Reply-To: <20240821123616.60401-5-dhowells@redhat.com>

On Wed Aug 21, 2024 at 3:36 PM EEST, David Howells wrote:
> Add a key_ref_get() wrapper function to go with key_ref_put() and use it
> for the place that needs it.
>
> Signed-off-by: David Howells <dhowells@redhat.com>
> cc: Jarkko Sakkinen <jarkko@kernel.org>
> cc: keyrings@vger.kernel.org
> cc: linux-security-module@vger.kernel.org
> ---
>  include/linux/key.h     | 5 +++++
>  security/keys/keyring.c | 2 +-
>  2 files changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/include/linux/key.h b/include/linux/key.h
> index 08062b4f807c..50a19e5f9e45 100644
> --- a/include/linux/key.h
> +++ b/include/linux/key.h
> @@ -315,6 +315,11 @@ static inline void key_ref_put(key_ref_t key_ref)
>  	key_put(key_ref_to_ptr(key_ref));
>  }
> =20
> +static inline void key_ref_get(key_ref_t key_ref)
> +{
> +	key_get(key_ref_to_ptr(key_ref));
> +}
> +
>  extern struct key *request_key_tag(struct key_type *type,
>  				   const char *description,
>  				   struct key_tag *domain_tag,
> diff --git a/security/keys/keyring.c b/security/keys/keyring.c
> index 0eed018448cb..7f02b913c560 100644
> --- a/security/keys/keyring.c
> +++ b/security/keys/keyring.c
> @@ -920,7 +920,7 @@ key_ref_t keyring_search_rcu(key_ref_t keyring_ref,
> =20
>  	ctx->now =3D ktime_get_real_seconds();
>  	if (search_nested_keyrings(keyring, ctx))
> -		__key_get(key_ref_to_ptr(ctx->result));
> +		key_ref_get(ctx->result);
>  	return ctx->result;
>  }
> =20

Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>

BR, Jarkko

