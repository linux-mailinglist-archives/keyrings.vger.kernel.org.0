Return-Path: <keyrings+bounces-1924-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 015869616E1
	for <lists+keyrings@lfdr.de>; Tue, 27 Aug 2024 20:23:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AA5551F27AC9
	for <lists+keyrings@lfdr.de>; Tue, 27 Aug 2024 18:23:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05F541D27A3;
	Tue, 27 Aug 2024 18:23:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R7Zd6d0F"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB8E71D27B8;
	Tue, 27 Aug 2024 18:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724782998; cv=none; b=kmHCwWEaroPvPG25oXipW0QdQVXjtalo5kmKZiBZzLLURG27120cdHSPVOL4unQxCv0oGdiWVVfaCu51gkOoEvHVgElpqM95ZQPkDNdZFEDzmDM5lJIVoAn9J6IuLKCEhjlDAtEn7G/TlSvkxND5XKshNXFHYQ2x/2zuZ3PhlTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724782998; c=relaxed/simple;
	bh=z/Tdym7ndOJ3Ts49eEQq72gc/dps0EUbcthPF1hjAC0=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=gXG3bYOgjHbAPHV040pB7Av/aQ2CK9e23JOSlYf6f4lbdb2JENXHJa2pBGVWVTVGR9rPkC+sE1rAAVlZXibtjFx0IY4iX86vJuTomY8Ec8rXa8Acy8sJwvCvhnVz2L/b7Xp/r5cym7AS8SIYmtjwgkOroZLa4AA1KGol2xAxoHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R7Zd6d0F; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0012CC4AF0E;
	Tue, 27 Aug 2024 18:23:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724782998;
	bh=z/Tdym7ndOJ3Ts49eEQq72gc/dps0EUbcthPF1hjAC0=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=R7Zd6d0FOfxNS0z2cQnsnleF1n5H7JoEGl0q2wjROCExuxmRuC8b8AfV4k/vYpKan
	 qkretCiB11MWvLhbFPB+n8gwef5j85H+w+5YAYwLCddy6BpGDwPL1YKi816DBfg5/0
	 aVLEFN9z613NzmSWiBr7qRzk/pUD6d1U1WDjotLY3g7NyR3V4p3LSd3F9eDFkGFHMw
	 YfV7nIj6qxkC3XutatHdHPN9sVC8dM42DCBB4iwjMKsLvzNiCqTBgT1rPJRicgOh8/
	 n3dVzVX+M6YqQTcfIeGaem3KZMNdtGeB1rt/F+ustxjv0KlWlZH3fgq+cexPHzuUji
	 CQHa+0PKddSXQ==
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 27 Aug 2024 21:23:14 +0300
Message-Id: <D3QWJL5NN42Q.K7TNBNJHIG83@kernel.org>
Cc: <keyrings@vger.kernel.org>, <linux-security-module@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 3/7] keys: Move key_get() out of line so a tracepoint
 can be added
From: "Jarkko Sakkinen" <jarkko@kernel.org>
To: "David Howells" <dhowells@redhat.com>
X-Mailer: aerc 0.17.0
References: <20240821123616.60401-1-dhowells@redhat.com>
 <20240821123616.60401-4-dhowells@redhat.com>
In-Reply-To: <20240821123616.60401-4-dhowells@redhat.com>

On Wed Aug 21, 2024 at 3:36 PM EEST, David Howells wrote:
> Move key_get() out of line so that a tracepoint can be added into it
> without incurring circular header dependencies or overly expanding the
> callers.
>
> Signed-off-by: David Howells <dhowells@redhat.com>
> cc: Jarkko Sakkinen <jarkko@kernel.org>
> cc: keyrings@vger.kernel.org
> cc: linux-security-module@vger.kernel.org
> ---
>  include/linux/key.h |  6 +-----
>  security/keys/key.c | 14 ++++++++++++++
>  2 files changed, 15 insertions(+), 5 deletions(-)
>
> diff --git a/include/linux/key.h b/include/linux/key.h
> index 943a432da3ae..08062b4f807c 100644
> --- a/include/linux/key.h
> +++ b/include/linux/key.h
> @@ -299,6 +299,7 @@ extern struct key *key_alloc(struct key_type *type,
> =20
>  extern void key_revoke(struct key *key);
>  extern void key_invalidate(struct key *key);
> +struct key *key_get(struct key *key);
>  extern void key_put(struct key *key);
>  extern bool key_put_tag(struct key_tag *tag);
>  extern void key_remove_domain(struct key_tag *domain_tag);
> @@ -309,11 +310,6 @@ static inline struct key *__key_get(struct key *key)
>  	return key;
>  }
> =20
> -static inline struct key *key_get(struct key *key)
> -{
> -	return key ? __key_get(key) : key;
> -}
> -
>  static inline void key_ref_put(key_ref_t key_ref)
>  {
>  	key_put(key_ref_to_ptr(key_ref));
> diff --git a/security/keys/key.c b/security/keys/key.c
> index 3d7d185019d3..14c7ee77ea15 100644
> --- a/security/keys/key.c
> +++ b/security/keys/key.c
> @@ -635,6 +635,20 @@ int key_reject_and_link(struct key *key,
>  }
>  EXPORT_SYMBOL(key_reject_and_link);
> =20
> +/**
> + * key_get - Get a reference on a key
> + * @key: The key to get a reference on.
> + *
> + * Get a reference on a key, if not NULL, and return the parameter.
> + */
> +struct key *key_get(struct key *key)
> +{
> +	if (key)
> +		refcount_inc(&key->usage);
> +	return key;
> +}
> +EXPORT_SYMBOL(key_get);
> +
>  /**
>   * key_put - Discard a reference to a key.
>   * @key: The key to discard a reference from.


Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>

BR, Jarkko

