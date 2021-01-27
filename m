Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 48098306428
	for <lists+keyrings@lfdr.de>; Wed, 27 Jan 2021 20:35:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344462AbhA0TdW (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 27 Jan 2021 14:33:22 -0500
Received: from helcar.hmeau.com ([216.24.177.18]:49316 "EHLO fornost.hmeau.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1344440AbhA0Tc5 (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Wed, 27 Jan 2021 14:32:57 -0500
Received: from gwarestrin.arnor.me.apana.org.au ([192.168.103.7])
        by fornost.hmeau.com with smtp (Exim 4.92 #5 (Debian))
        id 1l4qXh-0001Dq-4Z; Thu, 28 Jan 2021 06:31:54 +1100
Received: by gwarestrin.arnor.me.apana.org.au (sSMTP sendmail emulation); Thu, 28 Jan 2021 06:31:53 +1100
Date:   Thu, 28 Jan 2021 06:31:52 +1100
From:   Herbert Xu <herbert@gondor.apana.org.au>
To:     Stefan Berger <stefanb@linux.vnet.ibm.com>
Cc:     dhowells@redhat.com, keyrings@vger.kernel.org,
        linux-kernel@vger.kernel.org, davem@davemloft.net,
        linux-crypto@vger.kernel.org, patrick@puiterwijk.org,
        Stefan Berger <stefanb@linux.ibm.com>
Subject: Re: [PATCH v3 2/3] x509: Add support for parsing x509 certs with
 NIST p256 keys
Message-ID: <20210127193152.GA27505@gondor.apana.org.au>
References: <20210127123350.817593-1-stefanb@linux.vnet.ibm.com>
 <20210127123350.817593-3-stefanb@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210127123350.817593-3-stefanb@linux.vnet.ibm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Wed, Jan 27, 2021 at 07:33:49AM -0500, Stefan Berger wrote:
>
> +static struct akcipher_alg ecc_nist_p256 = {
> +	.verify = ecdsa_verify,
> +	.set_pub_key = ecc_set_pub_key,
> +	.max_size = ecc_nist_p256_max_size,
> +	.init = ecc_nist_p256_init_tfm,
> +	.exit = ecc_exit_tfm,
> +	.base = {
> +		.cra_name = "nist_p256",
> +		.cra_driver_name = "ecc-nist-p256",
> +		.cra_priority = 100,
> +		.cra_module = THIS_MODULE,
> +		.cra_ctxsize = sizeof(struct ecc_ctx),
> +	},
> +};

This is not how we name generic algorithms.

Please split this out and submit them through the crypto tree
instead.

Thanks,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
