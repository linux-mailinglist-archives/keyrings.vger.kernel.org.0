Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B99513807A5
	for <lists+keyrings@lfdr.de>; Fri, 14 May 2021 12:46:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231968AbhENKrc (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Fri, 14 May 2021 06:47:32 -0400
Received: from helcar.hmeau.com ([216.24.177.18]:37054 "EHLO deadmen.hmeau.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231600AbhENKrc (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Fri, 14 May 2021 06:47:32 -0400
Received: from gondobar.mordor.me.apana.org.au ([192.168.128.4] helo=gondobar)
        by deadmen.hmeau.com with esmtp (Exim 4.89 #2 (Debian))
        id 1lhVKb-0002FW-O5; Fri, 14 May 2021 18:46:09 +0800
Received: from herbert by gondobar with local (Exim 4.89)
        (envelope-from <herbert@gondor.apana.org.au>)
        id 1lhVK3-0006WD-Hm; Fri, 14 May 2021 18:45:35 +0800
Date:   Fri, 14 May 2021 18:45:35 +0800
From:   Herbert Xu <herbert@gondor.apana.org.au>
To:     Varad Gautam <varad.gautam@suse.com>
Cc:     linux-crypto@vger.kernel.org, dhowells@redhat.com,
        davem@davemloft.net, vt@altlinux.org,
        tianjia.zhang@linux.alibaba.com, keyrings@vger.kernel.org,
        linux-kernel@vger.kernel.org, jarkko@kernel.org
Subject: Re: [PATCH v3 13/18] crypto: rsa-psspad: Get signature parameters
 from a given signature
Message-ID: <20210514104535.q4zjtshxroruvoz3@gondor.apana.org.au>
References: <20210420114124.9684-1-varad.gautam@suse.com>
 <20210420114124.9684-14-varad.gautam@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210420114124.9684-14-varad.gautam@suse.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Tue, Apr 20, 2021 at 01:41:18PM +0200, Varad Gautam wrote:
>
> +static int psspad_set_sig_params(struct crypto_akcipher *tfm,
> +				 const void *sig,
> +				 unsigned int siglen)
> +{
> +	struct akcipher_instance *inst = akcipher_alg_instance(tfm);
> +	struct rsapad_inst_ctx *ictx = akcipher_instance_ctx(inst);
> +	const struct public_key_signature *s = sig;
> +
> +	if (!sig)
> +		return -EINVAL;
> +
> +	ictx->salt_len = s->salt_length;
> +	ictx->mgf_hash_algo = s->mgf_hash_algo;

Is there any reason why this couldn't be embedded into the key
instead?

Thanks,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
