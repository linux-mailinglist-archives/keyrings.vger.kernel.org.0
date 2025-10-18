Return-Path: <keyrings+bounces-3248-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 2496ABECC4B
	for <lists+keyrings@lfdr.de>; Sat, 18 Oct 2025 11:20:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id DCC584E9547
	for <lists+keyrings@lfdr.de>; Sat, 18 Oct 2025 09:20:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FABA29DB6A;
	Sat, 18 Oct 2025 09:20:11 +0000 (UTC)
X-Original-To: keyrings@vger.kernel.org
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DA4728D8DF;
	Sat, 18 Oct 2025 09:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.17.235.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760779211; cv=none; b=Mz3mcPTvWZFQYwngDYh6Kc/i66/ZJeJwTSGUlLEjAm7065rVUEtKYlxRvgkH+CRHvEvekIY2vyF50CaHqWcPXuMaG/Qw+7R0+jZ4NK9UIQyE5pelu/ch2gMWWJc7lOb0zNjcgvkLXHdPQdrj67qg9A7MHf00CIbqesM6P3099N0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760779211; c=relaxed/simple;
	bh=aAi6g/khW0SALq6szlRSlkz1cbBGnXMWTNb6QEZr7Pk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MD+1SYTfyDRfsu3TNcUcsY3RFRCNYCLpfgu2/GZgT5lK0DLe2DzCCcp64w2K63zs1mlZRAKqUsIhj9fwTwAlT/w5CImzWQbfLPsV2g4weFgEOOHiRh4bLqhArFKtfkFY1xeXRN9f+2kWwbjZmcrl5RazUyozc6ButIHa9FrptZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass smtp.mailfrom=csgroup.eu; arc=none smtp.client-ip=93.17.235.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csgroup.eu
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4cpbGk2FcJz9sRr;
	Sat, 18 Oct 2025 10:59:26 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gVKW9aCqDUi0; Sat, 18 Oct 2025 10:59:26 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4cpbGk0hZ3z9sRk;
	Sat, 18 Oct 2025 10:59:26 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id DE68A8B765;
	Sat, 18 Oct 2025 10:59:25 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id Hld9OZxqoe3u; Sat, 18 Oct 2025 10:59:25 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id DF0598B764;
	Sat, 18 Oct 2025 10:59:24 +0200 (CEST)
Message-ID: <395b82fc-728b-45da-afa8-c4ac8b625a45@csgroup.eu>
Date: Sat, 18 Oct 2025 10:59:24 +0200
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 01/17] s390/sha3: Rename conflicting functions
To: David Howells <dhowells@redhat.com>, Eric Biggers <ebiggers@kernel.org>
Cc: "Jason A . Donenfeld" <Jason@zx2c4.com>, Ard Biesheuvel
 <ardb@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>,
 Stephan Mueller <smueller@chronox.de>, Lukas Wunner <lukas@wunner.de>,
 Ignat Korchagin <ignat@cloudflare.com>, Luis Chamberlain
 <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>,
 Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>,
 linux-crypto@vger.kernel.org, keyrings@vger.kernel.org,
 linux-modules@vger.kernel.org, linux-kernel@vger.kernel.org,
 Harald Freudenberger <freude@linux.ibm.com>,
 Holger Dengler <dengler@linux.ibm.com>, linux-s390@vger.kernel.org
References: <20251017144311.817771-1-dhowells@redhat.com>
 <20251017144311.817771-2-dhowells@redhat.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <20251017144311.817771-2-dhowells@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 17/10/2025 à 16:42, David Howells a écrit :
> Rename the s390 sha3_* functions to have an "s390_" prefix to avoid
> conflict with generic code.

The functions are static, why would they conflict with generic code ?

Also generic code doesn't have such functions at the moment, are they 
added by a follow patch ?

Christophe

> 
> Signed-off-by: David Howells <dhowells@redhat.com>
> Acked-By: Harald Freudenberger <freude@linux.ibm.com>
> cc: Eric Biggers <ebiggers@kernel.org>
> cc: Jason A. Donenfeld <Jason@zx2c4.com>
> cc: Ard Biesheuvel <ardb@kernel.org>
> cc: Holger Dengler <dengler@linux.ibm.com>
> cc: Herbert Xu <herbert@gondor.apana.org.au>
> cc: Stephan Mueller <smueller@chronox.de>
> cc: linux-crypto@vger.kernel.org
> cc: linux-s390@vger.kernel.org
> ---
>   arch/s390/crypto/sha3_256_s390.c | 26 +++++++++++++-------------
>   arch/s390/crypto/sha3_512_s390.c | 26 +++++++++++++-------------
>   2 files changed, 26 insertions(+), 26 deletions(-)
> 
> diff --git a/arch/s390/crypto/sha3_256_s390.c b/arch/s390/crypto/sha3_256_s390.c
> index 03bb4f4bab70..fd5ecae60a57 100644
> --- a/arch/s390/crypto/sha3_256_s390.c
> +++ b/arch/s390/crypto/sha3_256_s390.c
> @@ -19,7 +19,7 @@
>   
>   #include "sha.h"
>   
> -static int sha3_256_init(struct shash_desc *desc)
> +static int s390_sha3_256_init(struct shash_desc *desc)
>   {
>   	struct s390_sha_ctx *sctx = shash_desc_ctx(desc);
>   
> @@ -32,7 +32,7 @@ static int sha3_256_init(struct shash_desc *desc)
>   	return 0;
>   }
>   
> -static int sha3_256_export(struct shash_desc *desc, void *out)
> +static int s390_sha3_256_export(struct shash_desc *desc, void *out)
>   {
>   	struct s390_sha_ctx *sctx = shash_desc_ctx(desc);
>   	union {
> @@ -50,7 +50,7 @@ static int sha3_256_export(struct shash_desc *desc, void *out)
>   	return 0;
>   }
>   
> -static int sha3_256_import(struct shash_desc *desc, const void *in)
> +static int s390_sha3_256_import(struct shash_desc *desc, const void *in)
>   {
>   	struct s390_sha_ctx *sctx = shash_desc_ctx(desc);
>   	union {
> @@ -68,22 +68,22 @@ static int sha3_256_import(struct shash_desc *desc, const void *in)
>   	return 0;
>   }
>   
> -static int sha3_224_import(struct shash_desc *desc, const void *in)
> +static int s390_sha3_224_import(struct shash_desc *desc, const void *in)
>   {
>   	struct s390_sha_ctx *sctx = shash_desc_ctx(desc);
>   
> -	sha3_256_import(desc, in);
> +	s390_sha3_256_import(desc, in);
>   	sctx->func = CPACF_KIMD_SHA3_224;
>   	return 0;
>   }
>   
>   static struct shash_alg sha3_256_alg = {
>   	.digestsize	=	SHA3_256_DIGEST_SIZE,	   /* = 32 */
> -	.init		=	sha3_256_init,
> +	.init		=	s390_sha3_256_init,
>   	.update		=	s390_sha_update_blocks,
>   	.finup		=	s390_sha_finup,
> -	.export		=	sha3_256_export,
> -	.import		=	sha3_256_import,
> +	.export		=	s390_sha3_256_export,
> +	.import		=	s390_sha3_256_import,
>   	.descsize	=	S390_SHA_CTX_SIZE,
>   	.statesize	=	SHA3_STATE_SIZE,
>   	.base		=	{
> @@ -96,22 +96,22 @@ static struct shash_alg sha3_256_alg = {
>   	}
>   };
>   
> -static int sha3_224_init(struct shash_desc *desc)
> +static int s390_sha3_224_init(struct shash_desc *desc)
>   {
>   	struct s390_sha_ctx *sctx = shash_desc_ctx(desc);
>   
> -	sha3_256_init(desc);
> +	s390_sha3_256_init(desc);
>   	sctx->func = CPACF_KIMD_SHA3_224;
>   	return 0;
>   }
>   
>   static struct shash_alg sha3_224_alg = {
>   	.digestsize	=	SHA3_224_DIGEST_SIZE,
> -	.init		=	sha3_224_init,
> +	.init		=	s390_sha3_224_init,
>   	.update		=	s390_sha_update_blocks,
>   	.finup		=	s390_sha_finup,
> -	.export		=	sha3_256_export, /* same as for 256 */
> -	.import		=	sha3_224_import, /* function code different! */
> +	.export		=	s390_sha3_256_export, /* same as for 256 */
> +	.import		=	s390_sha3_224_import, /* function code different! */
>   	.descsize	=	S390_SHA_CTX_SIZE,
>   	.statesize	=	SHA3_STATE_SIZE,
>   	.base		=	{
> diff --git a/arch/s390/crypto/sha3_512_s390.c b/arch/s390/crypto/sha3_512_s390.c
> index a5c9690eecb1..f4b52a3a0433 100644
> --- a/arch/s390/crypto/sha3_512_s390.c
> +++ b/arch/s390/crypto/sha3_512_s390.c
> @@ -18,7 +18,7 @@
>   
>   #include "sha.h"
>   
> -static int sha3_512_init(struct shash_desc *desc)
> +static int s390_sha3_512_init(struct shash_desc *desc)
>   {
>   	struct s390_sha_ctx *sctx = shash_desc_ctx(desc);
>   
> @@ -31,7 +31,7 @@ static int sha3_512_init(struct shash_desc *desc)
>   	return 0;
>   }
>   
> -static int sha3_512_export(struct shash_desc *desc, void *out)
> +static int s390_sha3_512_export(struct shash_desc *desc, void *out)
>   {
>   	struct s390_sha_ctx *sctx = shash_desc_ctx(desc);
>   	union {
> @@ -49,7 +49,7 @@ static int sha3_512_export(struct shash_desc *desc, void *out)
>   	return 0;
>   }
>   
> -static int sha3_512_import(struct shash_desc *desc, const void *in)
> +static int s390_sha3_512_import(struct shash_desc *desc, const void *in)
>   {
>   	struct s390_sha_ctx *sctx = shash_desc_ctx(desc);
>   	union {
> @@ -67,22 +67,22 @@ static int sha3_512_import(struct shash_desc *desc, const void *in)
>   	return 0;
>   }
>   
> -static int sha3_384_import(struct shash_desc *desc, const void *in)
> +static int s390_sha3_384_import(struct shash_desc *desc, const void *in)
>   {
>   	struct s390_sha_ctx *sctx = shash_desc_ctx(desc);
>   
> -	sha3_512_import(desc, in);
> +	s390_sha3_512_import(desc, in);
>   	sctx->func = CPACF_KIMD_SHA3_384;
>   	return 0;
>   }
>   
>   static struct shash_alg sha3_512_alg = {
>   	.digestsize	=	SHA3_512_DIGEST_SIZE,
> -	.init		=	sha3_512_init,
> +	.init		=	s390_sha3_512_init,
>   	.update		=	s390_sha_update_blocks,
>   	.finup		=	s390_sha_finup,
> -	.export		=	sha3_512_export,
> -	.import		=	sha3_512_import,
> +	.export		=	s390_sha3_512_export,
> +	.import		=	s390_sha3_512_import,
>   	.descsize	=	S390_SHA_CTX_SIZE,
>   	.statesize	=	SHA3_STATE_SIZE,
>   	.base		=	{
> @@ -97,22 +97,22 @@ static struct shash_alg sha3_512_alg = {
>   
>   MODULE_ALIAS_CRYPTO("sha3-512");
>   
> -static int sha3_384_init(struct shash_desc *desc)
> +static int s390_sha3_384_init(struct shash_desc *desc)
>   {
>   	struct s390_sha_ctx *sctx = shash_desc_ctx(desc);
>   
> -	sha3_512_init(desc);
> +	s390_sha3_512_init(desc);
>   	sctx->func = CPACF_KIMD_SHA3_384;
>   	return 0;
>   }
>   
>   static struct shash_alg sha3_384_alg = {
>   	.digestsize	=	SHA3_384_DIGEST_SIZE,
> -	.init		=	sha3_384_init,
> +	.init		=	s390_sha3_384_init,
>   	.update		=	s390_sha_update_blocks,
>   	.finup		=	s390_sha_finup,
> -	.export		=	sha3_512_export, /* same as for 512 */
> -	.import		=	sha3_384_import, /* function code different! */
> +	.export		=	s390_sha3_512_export, /* same as for 512 */
> +	.import		=	s390_sha3_384_import, /* function code different! */
>   	.descsize	=	S390_SHA_CTX_SIZE,
>   	.statesize	=	SHA3_STATE_SIZE,
>   	.base		=	{
> 
> 


