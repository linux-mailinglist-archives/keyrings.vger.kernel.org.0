Return-Path: <keyrings+bounces-2312-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C75F09DEEC2
	for <lists+keyrings@lfdr.de>; Sat, 30 Nov 2024 03:46:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 873F9163476
	for <lists+keyrings@lfdr.de>; Sat, 30 Nov 2024 02:46:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6C9725777;
	Sat, 30 Nov 2024 02:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mTJAKZWp"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1EFB1C6A3
	for <keyrings@vger.kernel.org>; Sat, 30 Nov 2024 02:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732934800; cv=none; b=IjL/ifV9OwJ4N2R5ijbJuxdOMXm3OkbXsqqaiJy0/UwW0EEnx0Hlk6WEJLsutiHnLePZPHL1wqbGIsXQijJuY75zYRY46c9UEr4vBxslXamlkDkwS1vZJ77GNN/oM98BYlboeKDgktzo8KeKjv0qyqyAc6pTNHKaI/7yzNoSDdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732934800; c=relaxed/simple;
	bh=FNVwJbukGug+lPvAtXhdaX7kkWFFgOghoV2xW1O3b9o=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=LBreTYPzwLmVHEi7iXLfiWpy/b49o8Zaleul+hOYPZ+3zNp+d6dS02t5V61rnhFgwqlbNOOo12NZOye+qjJHZ24+KjDva+3KmS5KDLqoNi8tVDNa1D4obbKkJlhRREcZRCpr/t7kW3agjY9wXx5I5XAKxPydcbaoZlsftZ8qVsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mTJAKZWp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4DDDC4CECF;
	Sat, 30 Nov 2024 02:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732934800;
	bh=FNVwJbukGug+lPvAtXhdaX7kkWFFgOghoV2xW1O3b9o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mTJAKZWpE77pfgDQxjRSZocavkyM6OkstKGXQJ5vKl7QoTYaX/CboZoxKZiHt7/aw
	 Mhbbtf2QKbEFHztibFl/KppJ13OOELjD25jO7A7OCZuRRKktKHAE7Mb9KL/CdjL8n5
	 LojPXI5akVGKpu4AJgmAmfyTpL3RAIFI62HXsZTiPZPXvq1D3fXpDsXsSVf6TmA4SJ
	 Q7CVVXI5UcAoQ+erQDZ5CgjsBrHwVziaESQpbwL4pJgnvTnvL+6q1gJzk5MV24d4Pa
	 GSRfOnTNOflBXfH7GBCSrexhRiTvQFXhOqan6sNmhoGH3mYJi6490/S6audp0s6ct1
	 Z0IX8P/pwjZaQ==
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 30 Nov 2024 04:46:35 +0200
Message-Id: <D5Z646TLQVW0.2TIYHM0OCEUM1@kernel.org>
From: "Jarkko Sakkinen" <jarkko@kernel.org>
To: <mengensun88@gmail.com>, <dhowells@redhat.com>
Cc: <jmorris@namei.org>, <keyrings@vger.kernel.org>,
 <yuehongwu@tencent.com>, "MengEn Sun" <mengensun@tencent.com>
Subject: Re: [PATCH] keys: Add cond_resched to key_gc_unused_keys()
X-Mailer: aerc 0.18.2
References: <1732679561-22967-1-git-send-email-mengensun@tencent.com>
In-Reply-To: <1732679561-22967-1-git-send-email-mengensun@tencent.com>

On Wed Nov 27, 2024 at 5:52 AM EET, mengensun88 wrote:
> From: MengEn Sun <mengensun@tencent.com>
>
> When running the follow test:
> while :
> do
>     stress-ng --key=3D64 --key-ops=3D1000
> done
>
> We used the bcc tools funclatency to measure the execution
> latency of key_gc_unused_keys(), and the results are as
> follows:
>
> funclatency key_gc_unused_keys.constprop.5 -i 1 -m
> msecs               : count
>     0 -> 1          : 0
>     2 -> 3          : 0
>     4 -> 7          : 0
>     8 -> 15         : 0
>    16 -> 31         : 0
>    32 -> 63         : 0
>    64 -> 127        : 1
>
> It seems that key_gc_unused_keys() takes a long time to
> execute, and there are no scheduling points in this function,
> which may harm latency-sensitive services.
>
> Therefore, we have added a scheduling point to this function.
>
> Reviewed-by: YueHong Wu <yuehongwu@tencent.com>
> Signed-off-by: MengEn Sun <mengensun@tencent.com>
> ---
>  security/keys/gc.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/security/keys/gc.c b/security/keys/gc.c
> index 7d687b0..14e4f1c 100644
> --- a/security/keys/gc.c
> +++ b/security/keys/gc.c
> @@ -165,6 +165,7 @@ static noinline void key_gc_unused_keys(struct list_h=
ead *keys)
> =20
>  		memzero_explicit(key, sizeof(*key));
>  		kmem_cache_free(key_jar, key);
> +		cond_resched();
>  	}
>  }
> =20


This really needs ack from David.

Get the idea tho.

BR, Jarkko

