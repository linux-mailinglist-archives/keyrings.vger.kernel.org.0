Return-Path: <keyrings+bounces-3247-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 373F2BECC3C
	for <lists+keyrings@lfdr.de>; Sat, 18 Oct 2025 11:20:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BC43619A31C2
	for <lists+keyrings@lfdr.de>; Sat, 18 Oct 2025 09:20:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A055227CCEE;
	Sat, 18 Oct 2025 09:20:07 +0000 (UTC)
X-Original-To: keyrings@vger.kernel.org
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79699354AC2;
	Sat, 18 Oct 2025 09:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.17.235.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760779207; cv=none; b=OtQXUNukYE2qW5x2gEJhgNtd/T7K2ge+hY8WgAc3VIAnGZkp9tq2pq73Xhy4lipqccjA/1a/5gsy6ghQo4KomEu9fWii5ux8darHWWXJoaR4/uPgYuf/85aqBJxIaqSVEXSnjKauoUKpu71G8DKLTImYbYaRJG2RrLmMbw3YG9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760779207; c=relaxed/simple;
	bh=Js3Sv/xG8mYjoHec+OB1wgclcQpEP3pJbcpRQXSFxB4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pm2lnFn5lUtn1vUnscaSHxD62/OM9PxQrKBkjxfP6vIaUyOOrkfQaol0y8cDxS5L0d8lPjbxI1LTZqLRkpX2GriGy6Yc30G/SRZmeFNpmvrZOG3I4m2dOQ0x+SPE3LY7f26209fbtP3uWeEvJRJC+Qi1sso4tdEgoe0WUQrw2iY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass smtp.mailfrom=csgroup.eu; arc=none smtp.client-ip=93.17.235.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csgroup.eu
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4cpbJ13kd9z9sSC;
	Sat, 18 Oct 2025 11:00:33 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HJxa1yDcQJwG; Sat, 18 Oct 2025 11:00:33 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4cpbJ12blgz9sS8;
	Sat, 18 Oct 2025 11:00:33 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 468C38B765;
	Sat, 18 Oct 2025 11:00:33 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id 0rhQCqUhMXYB; Sat, 18 Oct 2025 11:00:33 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 4BD6D8B764;
	Sat, 18 Oct 2025 11:00:32 +0200 (CEST)
Message-ID: <f2e43e3f-b4fc-4ebd-b6ae-7e610b2ea164@csgroup.eu>
Date: Sat, 18 Oct 2025 11:00:32 +0200
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 02/17] arm64/sha3: Rename conflicting functions
To: David Howells <dhowells@redhat.com>, Eric Biggers <ebiggers@kernel.org>
Cc: "Jason A . Donenfeld" <Jason@zx2c4.com>, Ard Biesheuvel
 <ardb@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>,
 Stephan Mueller <smueller@chronox.de>, Lukas Wunner <lukas@wunner.de>,
 Ignat Korchagin <ignat@cloudflare.com>, Luis Chamberlain
 <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>,
 Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>,
 linux-crypto@vger.kernel.org, keyrings@vger.kernel.org,
 linux-modules@vger.kernel.org, linux-kernel@vger.kernel.org,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 linux-arm-kernel@lists.infradead.org
References: <20251017144311.817771-1-dhowells@redhat.com>
 <20251017144311.817771-3-dhowells@redhat.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <20251017144311.817771-3-dhowells@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 17/10/2025 à 16:42, David Howells a écrit :
> Rename the arm64 sha3_* functions to have an "arm64_" prefix to avoid
> conflict with generic code.

Same comment as previous patch, the functions are static, why would they 
conflict with generic code ?

Also generic code doesn't have such functions at the moment, are they 
added by a follow patch ?

Christophe


> 
> Signed-off-by: David Howells <dhowells@redhat.com>
> cc: Eric Biggers <ebiggers@kernel.org>
> cc: Jason A. Donenfeld <Jason@zx2c4.com>
> cc: Ard Biesheuvel <ardb@kernel.org>
> cc: Catalin Marinas <catalin.marinas@arm.com>
> cc: Will Deacon <will@kernel.org>
> cc: Herbert Xu <herbert@gondor.apana.org.au>
> cc: Stephan Mueller <smueller@chronox.de>
> cc: linux-crypto@vger.kernel.org
> cc: linux-arm-kernel@lists.infradead.org
> ---
>   arch/arm64/crypto/sha3-ce-glue.c | 22 +++++++++++-----------
>   1 file changed, 11 insertions(+), 11 deletions(-)
> 
> diff --git a/arch/arm64/crypto/sha3-ce-glue.c b/arch/arm64/crypto/sha3-ce-glue.c
> index b4f1001046c9..426d8044535a 100644
> --- a/arch/arm64/crypto/sha3-ce-glue.c
> +++ b/arch/arm64/crypto/sha3-ce-glue.c
> @@ -31,7 +31,7 @@ MODULE_ALIAS_CRYPTO("sha3-512");
>   asmlinkage int sha3_ce_transform(u64 *st, const u8 *data, int blocks,
>   				 int md_len);
>   
> -static int sha3_update(struct shash_desc *desc, const u8 *data,
> +static int arm64_sha3_update(struct shash_desc *desc, const u8 *data,
>   		       unsigned int len)
>   {
>   	struct sha3_state *sctx = shash_desc_ctx(desc);
> @@ -55,8 +55,8 @@ static int sha3_update(struct shash_desc *desc, const u8 *data,
>   	return len;
>   }
>   
> -static int sha3_finup(struct shash_desc *desc, const u8 *src, unsigned int len,
> -		      u8 *out)
> +static int arm64_sha3_finup(struct shash_desc *desc, const u8 *src, unsigned int len,
> +			    u8 *out)
>   {
>   	struct sha3_state *sctx = shash_desc_ctx(desc);
>   	struct crypto_shash *tfm = desc->tfm;
> @@ -90,8 +90,8 @@ static int sha3_finup(struct shash_desc *desc, const u8 *src, unsigned int len,
>   static struct shash_alg algs[] = { {
>   	.digestsize		= SHA3_224_DIGEST_SIZE,
>   	.init			= crypto_sha3_init,
> -	.update			= sha3_update,
> -	.finup			= sha3_finup,
> +	.update			= arm64_sha3_update,
> +	.finup			= arm64_sha3_finup,
>   	.descsize		= SHA3_STATE_SIZE,
>   	.base.cra_name		= "sha3-224",
>   	.base.cra_driver_name	= "sha3-224-ce",
> @@ -102,8 +102,8 @@ static struct shash_alg algs[] = { {
>   }, {
>   	.digestsize		= SHA3_256_DIGEST_SIZE,
>   	.init			= crypto_sha3_init,
> -	.update			= sha3_update,
> -	.finup			= sha3_finup,
> +	.update			= arm64_sha3_update,
> +	.finup			= arm64_sha3_finup,
>   	.descsize		= SHA3_STATE_SIZE,
>   	.base.cra_name		= "sha3-256",
>   	.base.cra_driver_name	= "sha3-256-ce",
> @@ -114,8 +114,8 @@ static struct shash_alg algs[] = { {
>   }, {
>   	.digestsize		= SHA3_384_DIGEST_SIZE,
>   	.init			= crypto_sha3_init,
> -	.update			= sha3_update,
> -	.finup			= sha3_finup,
> +	.update			= arm64_sha3_update,
> +	.finup			= arm64_sha3_finup,
>   	.descsize		= SHA3_STATE_SIZE,
>   	.base.cra_name		= "sha3-384",
>   	.base.cra_driver_name	= "sha3-384-ce",
> @@ -126,8 +126,8 @@ static struct shash_alg algs[] = { {
>   }, {
>   	.digestsize		= SHA3_512_DIGEST_SIZE,
>   	.init			= crypto_sha3_init,
> -	.update			= sha3_update,
> -	.finup			= sha3_finup,
> +	.update			= arm64_sha3_update,
> +	.finup			= arm64_sha3_finup,
>   	.descsize		= SHA3_STATE_SIZE,
>   	.base.cra_name		= "sha3-512",
>   	.base.cra_driver_name	= "sha3-512-ce",
> 
> 


