Return-Path: <keyrings+bounces-1845-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CA70944FDE
	for <lists+keyrings@lfdr.de>; Thu,  1 Aug 2024 18:02:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B4B4AB24D02
	for <lists+keyrings@lfdr.de>; Thu,  1 Aug 2024 16:02:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D1741B3F2F;
	Thu,  1 Aug 2024 16:02:35 +0000 (UTC)
X-Original-To: keyrings@vger.kernel.org
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF9681B3F09;
	Thu,  1 Aug 2024 16:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.176.79.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722528155; cv=none; b=hnXrKq7zAf1ae9m74/j7D27OG6bLqiGKxWByYdiV+SE4KrxJQzKGqCu50pyiXOde+GDfogq8I7b9YmhRrbxeHeS9ZxphFL9k/OQtYqcAyLPB/CGSQp+aXzOKybXVL5zvWuNTB8ZMT2poStN8S0bDEzcrS7qgAPIkzFzHSE5Tllg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722528155; c=relaxed/simple;
	bh=rjPMRQJ9r0fzwgliZFEbBtW1VRQdI6lP4hr9JNBPtUY=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aicL/uiPp9pFhYvH8uq7M5HwLqAGUVYzaxk0aQzPPK7owjSBHS6iJtw/1JU+HD6g3GVaEXa6/FsSkaHxeEoR/dMj8GCLzJWmSTvv4fCjEsf0Oa+q/83gtpbCy0Q9RIOriARvJU3849rMDyJ4daYUQNJ+WaaphxvOZm8mE0dnwIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=Huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=185.176.79.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=Huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4WZYZH61SWz6K9M2;
	Thu,  1 Aug 2024 23:59:51 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (unknown [7.191.163.240])
	by mail.maildlp.com (Postfix) with ESMTPS id 10A9B140B67;
	Fri,  2 Aug 2024 00:02:28 +0800 (CST)
Received: from localhost (10.203.177.66) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Thu, 1 Aug
 2024 17:02:27 +0100
Date: Thu, 1 Aug 2024 17:02:26 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Lukas Wunner <lukas@wunner.de>
CC: Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller"
	<davem@davemloft.net>, Stefan Berger <stefanb@linux.ibm.com>, David Howells
	<dhowells@redhat.com>, Vitaly Chikunov <vt@altlinux.org>, Tadeusz Struk
	<tstruk@gigaio.com>, Andrew Zaborowski <andrew.zaborowski@intel.com>, "Saulo
 Alessandre" <saulo.alessandre@tse.jus.br>, <linux-crypto@vger.kernel.org>,
	<keyrings@vger.kernel.org>
Subject: Re: [PATCH 2/5] crypto: akcipher - Drop usage of sglists for verify
 op
Message-ID: <20240801170226.000070ea@Huawei.com>
In-Reply-To: <eb13c292f60a61b0af14f0c5afd23719b3cb0bd7.1722260176.git.lukas@wunner.de>
References: <cover.1722260176.git.lukas@wunner.de>
	<eb13c292f60a61b0af14f0c5afd23719b3cb0bd7.1722260176.git.lukas@wunner.de>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: lhrpeml500006.china.huawei.com (7.191.161.198) To
 lhrpeml500005.china.huawei.com (7.191.163.240)

On Mon, 29 Jul 2024 15:48:00 +0200
Lukas Wunner <lukas@wunner.de> wrote:

> Commit 6cb8815f41a9 ("crypto: sig - Add interface for sign/verify")
> introduced an API which accepts kernel buffers instead of sglists for
> signature generation and verification.
> 
> Commit 63ba4d67594a ("KEYS: asymmetric: Use new crypto interface without
> scatterlists") converted the sole user in the tree to the new API.
> 
> Although the API externally accepts kernel buffers, internally it still
> converts them to sglists, which results in overhead for asymmetric
> algorithms because they need to copy the sglists back into kernel
> buffers.
> 
> Take the next step and switch signature verification over to using
> kernel buffers internally, thereby avoiding the sglists overhead.
> 
> Because all ->verify implementations are synchronous, forego invocation
> of crypto_akcipher_sync_{prep,post}() and call crypto_akcipher_verify()
> directly from crypto_sig_verify().
> 
> Signed-off-by: Lukas Wunner <lukas@wunner.de>

I'm a little out of my depth in this code, but one question did
come to mind. Rather than passing scatter lists and buffers
via the same function void akcipher_request_set_crypt()
why not add a variant that takes buffers for signing cases so
that you can maintain the scatterlist pointers for the encrypt/decrypt
cases?



> diff --git a/include/crypto/akcipher.h b/include/crypto/akcipher.h
> index 18a10cad07aa..2c5bc35d297a 100644
> --- a/include/crypto/akcipher.h
> +++ b/include/crypto/akcipher.h
> @@ -16,28 +16,39 @@
>   *
>   * @base:	Common attributes for async crypto requests
>   * @src:	Source data
> - *		For verify op this is signature + digest, in that case
> - *		total size of @src is @src_len + @dst_len.
> - * @dst:	Destination data (Should be NULL for verify op)
> + * @dst:	Destination data
>   * @src_len:	Size of the input buffer
> - *		For verify op it's size of signature part of @src, this part
> - *		is supposed to be operated by cipher.
> - * @dst_len:	Size of @dst buffer (for all ops except verify).
> + * @dst_len:	Size of @dst buffer
>   *		It needs to be at least	as big as the expected result
>   *		depending on the operation.
>   *		After operation it will be updated with the actual size of the
>   *		result.
>   *		In case of error where the dst sgl size was insufficient,
>   *		it will be updated to the size required for the operation.
> - *		For verify op this is size of digest part in @src.
> + * @sig:	Signature
> + * @digest:	Digest
> + * @sig_len:	Size of @sig
> + * @digest_len:	Size of @digest
>   * @__ctx:	Start of private context data
>   */
>  struct akcipher_request {
>  	struct crypto_async_request base;
> -	struct scatterlist *src;
> -	struct scatterlist *dst;
> -	unsigned int src_len;
> -	unsigned int dst_len;
> +	union {
> +		struct {
> +			/* sign, encrypt, decrypt operations */
> +			struct scatterlist *src;
> +			struct scatterlist *dst;
> +			unsigned int src_len;
> +			unsigned int dst_len;
> +		};
> +		struct {
> +			/* verify operation */
> +			const void *sig;
> +			const void *digest;
> +			unsigned int sig_len;
> +			unsigned int digest_len;
> +		};
> +	};
>  	void *__ctx[] CRYPTO_MINALIGN_ATTR;
>  };
>  
> @@ -242,20 +253,18 @@ static inline void akcipher_request_set_callback(struct akcipher_request *req,
>   * Sets parameters required by crypto operation
>   *
>   * @req:	public key request
> - * @src:	ptr to input scatter list
> - * @dst:	ptr to output scatter list or NULL for verify op
> - * @src_len:	size of the src input scatter list to be processed
> - * @dst_len:	size of the dst output scatter list or size of signature
> - *		portion in @src for verify op
> + * @src:	ptr to input scatter list or signature for verify op
> + * @dst:	ptr to output scatter list or digest for verify op
> + * @src_len:	size of @src
> + * @dst_len:	size of @dst
>   */
>  static inline void akcipher_request_set_crypt(struct akcipher_request *req,
> -					      struct scatterlist *src,
> -					      struct scatterlist *dst,
> +					      const void *src, const void *dst,
Maybe it's worth a 'special' variant.
static inline void akcipher_request_set_crypt_for_verify()
so that you can keep the other list typed and not rely
on overlapping pointer fields via the union.

>  					      unsigned int src_len,
>  					      unsigned int dst_len)
>  {
> -	req->src = src;
> -	req->dst = dst;
> +	req->sig = src;
> +	req->digest = dst;
>  	req->src_len = src_len;
>  	req->dst_len = dst_len;
>  }
> @@ -372,10 +381,6 @@ static inline int crypto_akcipher_sign(struct akcipher_request *req)
>   *
>   * @req:	asymmetric key request
>   *
> - * Note: req->dst should be NULL, req->src should point to SG of size
> - * (req->src_size + req->dst_size), containing signature (of req->src_size
> - * length) with appended digest (of req->dst_size length).
> - *
>   * Return: zero on verification success; error code in case of error.
>   */
>  static inline int crypto_akcipher_verify(struct akcipher_request *req)


