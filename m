Return-Path: <keyrings+bounces-1848-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6627A94514B
	for <lists+keyrings@lfdr.de>; Thu,  1 Aug 2024 19:06:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E6EF51F24001
	for <lists+keyrings@lfdr.de>; Thu,  1 Aug 2024 17:06:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78DAE1B29AF;
	Thu,  1 Aug 2024 17:06:22 +0000 (UTC)
X-Original-To: keyrings@vger.kernel.org
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A819C16F8EB;
	Thu,  1 Aug 2024 17:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.176.79.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722531982; cv=none; b=ITKy4jSbxdgutDCb+SfaCCtifpnLmdfOLwnLydetueJRRJbY2M/wleyn8WRnUjAyW8g3CLYmJP8WL2/RK0QJAQqEj+aG0waCWuK8gOqwGlgcTyb9JF4V3xYe+cfhp8lPX4S+6Fw7sXZLdOcDL28aegMmqEUZkJKaAEu2gVDY26U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722531982; c=relaxed/simple;
	bh=dHeZ+wX1yiNDfIHcqmtDPjq/nk9oaPB1DI+8ieJOXjU=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AL/HyrK3wBiQxQ5W0RpRj1+GqutRrhrPl6ncQdgYurfnr1BWeVDhTuqKXFOjks8iecfdIAcZcFj7R5RuseP4+0cGT+NXf+wAYHA/lSpMHlWKPt3d2p2YYcXmtPUkBJ5ub9nhSRA31z4y4pFs38jvERpzYHk4yDtkELf3ScqSI9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=Huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=185.176.79.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=Huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4WZZzw0v29z6K6Yj;
	Fri,  2 Aug 2024 01:03:40 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (unknown [7.191.163.240])
	by mail.maildlp.com (Postfix) with ESMTPS id 22436140B55;
	Fri,  2 Aug 2024 01:06:16 +0800 (CST)
Received: from localhost (10.203.177.66) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Thu, 1 Aug
 2024 18:06:15 +0100
Date: Thu, 1 Aug 2024 18:06:14 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Lukas Wunner <lukas@wunner.de>
CC: Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller"
	<davem@davemloft.net>, Stefan Berger <stefanb@linux.ibm.com>, David Howells
	<dhowells@redhat.com>, Vitaly Chikunov <vt@altlinux.org>, Tadeusz Struk
	<tstruk@gigaio.com>, Andrew Zaborowski <andrew.zaborowski@intel.com>, "Saulo
 Alessandre" <saulo.alessandre@tse.jus.br>, <linux-crypto@vger.kernel.org>,
	<keyrings@vger.kernel.org>
Subject: Re: [PATCH 5/5] crypto: ecdsa - Support P1363 signature decoding
Message-ID: <20240801180614.00002fa9@Huawei.com>
In-Reply-To: <73f2190e7254181f9ab7e9a3ec64cae56def8435.1722260176.git.lukas@wunner.de>
References: <cover.1722260176.git.lukas@wunner.de>
	<73f2190e7254181f9ab7e9a3ec64cae56def8435.1722260176.git.lukas@wunner.de>
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
X-ClientProxiedBy: lhrpeml100004.china.huawei.com (7.191.162.219) To
 lhrpeml500005.china.huawei.com (7.191.163.240)

On Mon, 29 Jul 2024 15:51:00 +0200
Lukas Wunner <lukas@wunner.de> wrote:

> Alternatively to the X9.62 encoding of ecdsa signatures, which uses
> ASN.1 and is already supported by the kernel, there's another common
> encoding called P1363.  It stores r and s as the concatenation of two
> big endian, unsigned integers.  The name originates from IEEE P1363.
> 
> Add a P1363 template in support of the forthcoming SPDM library
> (Security Protocol and Data Model) for PCI device authentication.
> 
> P1363 is prescribed by SPDM 1.2.1 margin no 44:
> 
>    "For ECDSA signatures, excluding SM2, in SPDM, the signature shall be
>     the concatenation of r and s.  The size of r shall be the size of
>     the selected curve.  Likewise, the size of s shall be the size of
>     the selected curve.  See BaseAsymAlgo in NEGOTIATE_ALGORITHMS for
>     the size of r and s.  The byte order for r and s shall be in big
>     endian order.  When placing ECDSA signatures into an SPDM signature
>     field, r shall come first followed by s."
> 
> Link: https://www.dmtf.org/sites/default/files/standards/documents/DSP0274_1.2.1.pdf
> Signed-off-by: Lukas Wunner <lukas@wunner.de>
One trivial follow on from previous patch. Up to you though as style
comment only.  FWIW as this all gives me a headache ;)

Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>


> diff --git a/crypto/ecdsa-p1363.c b/crypto/ecdsa-p1363.c
> new file mode 100644
> index 000000000000..c0610d88aa9e
> --- /dev/null
> +++ b/crypto/ecdsa-p1363.c
> @@ -0,0 +1,155 @@

> +static int ecdsa_p1363_create(struct crypto_template *tmpl, struct rtattr **tb)
> +{
> +	struct crypto_akcipher_spawn *spawn;
> +	struct akcipher_instance *inst;
> +	struct akcipher_alg *ecdsa_alg;
> +	u32 mask;
> +	int err;
> +
> +	err = crypto_check_attr_type(tb, CRYPTO_ALG_TYPE_AKCIPHER, &mask);
> +	if (err)
> +		return err;
> +
> +	inst = kzalloc(sizeof(*inst) + sizeof(*spawn), GFP_KERNEL);
> +	if (!inst)
> +		return -ENOMEM;
> +
> +	spawn = akcipher_instance_ctx(inst);
> +
> +	err = crypto_grab_akcipher(spawn, akcipher_crypto_instance(inst),
> +				   crypto_attr_alg_name(tb[1]), 0, mask);
> +	if (err)
> +		goto err_free_inst;
> +
> +	ecdsa_alg = crypto_spawn_akcipher_alg(spawn);
> +
> +	err = -EINVAL;
> +	if (strncmp(ecdsa_alg->base.cra_name, "ecdsa", 5) != 0)
> +		goto err_free_inst;
> +
> +	err = crypto_inst_setname(akcipher_crypto_instance(inst), tmpl->name,
> +				  &ecdsa_alg->base);
> +	if (err)
> +		goto err_free_inst;
> +
> +	inst->alg.base.cra_priority = ecdsa_alg->base.cra_priority;
> +	inst->alg.base.cra_ctxsize = sizeof(struct ecdsa_p1363_ctx);
> +
> +	inst->alg.init = ecdsa_p1363_init_tfm;
> +	inst->alg.exit = ecdsa_p1363_exit_tfm;
> +
> +	inst->alg.verify = ecdsa_p1363_verify;
> +	inst->alg.max_size = ecdsa_p1363_max_size;
> +	inst->alg.set_pub_key = ecdsa_p1363_set_pub_key;
> +
> +	inst->free = ecdsa_p1363_free;
> +
> +	err = akcipher_register_instance(tmpl, inst);
> +	if (err) {
> +err_free_inst:
Same comment as in previous patch. I'd use a separate error path after
a return 0 to improve readability.

> +		ecdsa_p1363_free(inst);
> +	}
> +	return err;
> +}



