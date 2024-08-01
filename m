Return-Path: <keyrings+bounces-1847-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C64F294512E
	for <lists+keyrings@lfdr.de>; Thu,  1 Aug 2024 18:58:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7329F283790
	for <lists+keyrings@lfdr.de>; Thu,  1 Aug 2024 16:58:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A2941B4C41;
	Thu,  1 Aug 2024 16:58:21 +0000 (UTC)
X-Original-To: keyrings@vger.kernel.org
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02ED31B4C3D;
	Thu,  1 Aug 2024 16:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.176.79.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722531501; cv=none; b=uv4g3o8K/fZzzr/ZCpHPCoIVMQAnl8AnPkvf3nkhnwRSxvAdobsgpteEVosw9K3e9za26s570pYcPBc+CFUObRDinrC1UIURDAUwlNbX/DiMlzd5IvWJUyx1AjLXXaojaDF7nMPB5E5N2nskfgoB23jwLM3IfdgusedrFMXYiMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722531501; c=relaxed/simple;
	bh=HQRlmXjw+fsUtIWLdg0+zcv2qRubE4O9yVO7IppOQss=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SGnx5L4/B4lu/xUo7jfGt0iJ9Xg1NXOB5XS9YQVXtrD9xcm7nygvTbAOrhvljWfa+eEF/EnvFWR4m9lZvu+HkmR/6GxZyoJwUn98SxzJIrRE+AfPlgyoU/ErlENT56dET8+Zm0an23cUjcm/ekn3daY9rYR7Q25H8PqAfNMk780=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=Huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=185.176.79.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=Huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4WZZpf6lMPz6K8vK;
	Fri,  2 Aug 2024 00:55:38 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (unknown [7.191.163.240])
	by mail.maildlp.com (Postfix) with ESMTPS id 37742140A86;
	Fri,  2 Aug 2024 00:58:15 +0800 (CST)
Received: from localhost (10.203.177.66) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Thu, 1 Aug
 2024 17:58:14 +0100
Date: Thu, 1 Aug 2024 17:58:13 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Lukas Wunner <lukas@wunner.de>
CC: Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller"
	<davem@davemloft.net>, Stefan Berger <stefanb@linux.ibm.com>, David Howells
	<dhowells@redhat.com>, Vitaly Chikunov <vt@altlinux.org>, Tadeusz Struk
	<tstruk@gigaio.com>, Andrew Zaborowski <andrew.zaborowski@intel.com>, "Saulo
 Alessandre" <saulo.alessandre@tse.jus.br>, <linux-crypto@vger.kernel.org>,
	<keyrings@vger.kernel.org>
Subject: Re: [PATCH 4/5] crypto: ecdsa - Move X9.62 signature decoding into
 template
Message-ID: <20240801175813.000058ad@Huawei.com>
In-Reply-To: <0d360e4c1502a81c48d74c8cd6b842cc5e6dbd9e.1722260176.git.lukas@wunner.de>
References: <cover.1722260176.git.lukas@wunner.de>
	<0d360e4c1502a81c48d74c8cd6b842cc5e6dbd9e.1722260176.git.lukas@wunner.de>
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

On Mon, 29 Jul 2024 15:50:00 +0200
Lukas Wunner <lukas@wunner.de> wrote:

> Unlike the rsa driver, which separates signature decoding and
> signature verification into two steps, the ecdsa driver does both in one.
> 
> This restricts users to the one signature format currently supported
> (X9.62) and prevents addition of others such as P1363, which is needed
> by the forthcoming SPDM library (Security Protocol and Data Model) for
> PCI device authentication.
> 
> Per Herbert's suggestion, change ecdsa to use a "raw" signature encoding
> and then implement X9.62 and P1363 as templates which convert their
> respective encodings to the raw one.  One may then specify
> "x962(ecdsa-nist-XXX)" or "p1363(ecdsa-nist-XXX)" to pick the encoding.
> 
> The present commit moves X9.62 decoding to a template.  A separate
> commit is going to introduce another template for P1363 decoding.
> 
> The ecdsa driver internally represents a signature as two u64 arrays of
> size ECC_MAX_BYTES.  This appears to be the most natural choice for the
> raw format as it can directly be used for verification without having to
> further decode signature data or copy it around.
> 
> Repurpose all the existing test vectors for "x962(ecdsa-nist-XXX)" and
> create a duplicate of them to test the raw encoding.
> 
> Link: https://lore.kernel.org/all/ZoHXyGwRzVvYkcTP@gondor.apana.org.au/
> Signed-off-by: Lukas Wunner <lukas@wunner.de>

Trivial stuff inline.


> ---
>  crypto/Makefile                     |   3 +-
>  crypto/asymmetric_keys/public_key.c |   3 +
>  crypto/ecdsa-x962.c                 | 211 ++++++++
>  crypto/ecdsa.c                      |  86 +--
>  crypto/testmgr.c                    |  27 +
>  crypto/testmgr.h                    | 813 +++++++++++++++++++++++++++-
>  include/crypto/internal/ecc.h       |   1 +
>  7 files changed, 1077 insertions(+), 67 deletions(-)
>  create mode 100644 crypto/ecdsa-x962.c
> 

> diff --git a/crypto/ecdsa-x962.c b/crypto/ecdsa-x962.c
> new file mode 100644
> index 000000000000..ff2da5be1355
> --- /dev/null
> +++ b/crypto/ecdsa-x962.c
> @@ -0,0 +1,211 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * ECDSA X9.62 signature encoding
> + *
> + * Copyright (c) 2021 IBM Corporation
> + * Copyright (c) 2024 Intel Corporation
> + */
> +
> +#include <linux/asn1_decoder.h>
> +#include <linux/err.h>
> +#include <linux/module.h>
> +#include <crypto/akcipher.h>
> +#include <crypto/algapi.h>
> +#include <crypto/internal/akcipher.h>
> +#include <crypto/internal/ecc.h>
> +
> +#include "ecdsasignature.asn1.h"
> +
> +struct ecdsa_x962_ctx {
> +	struct crypto_akcipher *child;
> +};
> +
> +struct ecdsa_x962_request {
> +	u64 r[ECC_MAX_DIGITS];
> +	u64 s[ECC_MAX_DIGITS];
> +	struct akcipher_request child_req;
> +};
> +
> +/* Get the r and s components of a signature from the X.509 certificate. */
> +static int ecdsa_get_signature_rs(u64 *dest, size_t hdrlen, unsigned char tag,
> +				  const void *value, size_t vlen,
> +				  unsigned int ndigits)
> +{
> +	size_t bufsize = ndigits * sizeof(u64);
> +	const char *d = value;
> +
> +	if (!value || !vlen || vlen > bufsize + 1)

Assuming previous musing correct middle test isn't needed.
Maybe want to keep it though. Up to you.


> +		return -EINVAL;
> +
> +	if (vlen > bufsize) {
> +		/* skip over leading zeros that make 'value' a positive int */
> +		if (*d == 0) {
> +			vlen -= 1;
> +			d++;
> +		} else {
> +			return -EINVAL;
> +		}
> +	}
> +
> +	ecc_digits_from_bytes(d, vlen, dest, ndigits);
> +
> +	return 0;
> +}
> +

...

> +static int ecdsa_x962_create(struct crypto_template *tmpl, struct rtattr **tb)
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
	if (cmp(ecdsa_alg->base.cra_name, "ecdsa", 5) != 0) {
		err = -EINVAL;
		goto err_free_inst;
	}

Seems more readable to me.


> +	err = crypto_inst_setname(akcipher_crypto_instance(inst), tmpl->name,
> +				  &ecdsa_alg->base);
> +	if (err)
> +		goto err_free_inst;
> +
> +	inst->alg.base.cra_priority = ecdsa_alg->base.cra_priority;
> +	inst->alg.base.cra_ctxsize = sizeof(struct ecdsa_x962_ctx);
> +
> +	inst->alg.init = ecdsa_x962_init_tfm;
> +	inst->alg.exit = ecdsa_x962_exit_tfm;
> +
> +	inst->alg.verify = ecdsa_x962_verify;
> +	inst->alg.max_size = ecdsa_x962_max_size;
> +	inst->alg.set_pub_key = ecdsa_x962_set_pub_key;
> +
> +	inst->free = ecdsa_x962_free;
> +
> +	err = akcipher_register_instance(tmpl, inst);
> +	if (err) {
> +err_free_inst:
> +		ecdsa_x962_free(inst);
> +	}
> +	return err;

I'd rather see a separate error path even if it's a little more code.

	if (err)
		goto err_free_inst;

	return 0;

err_free_inst:
	ecdsa_x862_free(inst)
	return err;
> +}
> +


