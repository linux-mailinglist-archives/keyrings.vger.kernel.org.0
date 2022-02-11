Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B69B64B21F4
	for <lists+keyrings@lfdr.de>; Fri, 11 Feb 2022 10:30:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232978AbiBKJ3n (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Fri, 11 Feb 2022 04:29:43 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:52414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232075AbiBKJ3n (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Fri, 11 Feb 2022 04:29:43 -0500
Received: from fornost.hmeau.com (helcar.hmeau.com [216.24.177.18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C49EE18
        for <keyrings@vger.kernel.org>; Fri, 11 Feb 2022 01:29:42 -0800 (PST)
Received: from gwarestrin.arnor.me.apana.org.au ([192.168.103.7])
        by fornost.hmeau.com with smtp (Exim 4.92 #5 (Debian))
        id 1nIRvY-0003Ts-2e; Fri, 11 Feb 2022 20:09:17 +1100
Received: by gwarestrin.arnor.me.apana.org.au (sSMTP sendmail emulation); Fri, 11 Feb 2022 20:09:15 +1100
Date:   Fri, 11 Feb 2022 20:09:15 +1100
From:   Herbert Xu <herbert@gondor.apana.org.au>
To:     Nicolai Stange <nstange@suse.de>
Cc:     "David S. Miller" <davem@davemloft.net>,
        Stephan =?iso-8859-1?Q?M=FCller?= <smueller@chronox.de>,
        Hannes Reinecke <hare@suse.de>, Torsten Duwe <duwe@suse.de>,
        David Howells <dhowells@redhat.com>,
        Jarkko Sakkinen <jarkko@kernel.org>,
        linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
        keyrings@vger.kernel.org
Subject: Re: [PATCH v3 11/15] crypto: dh - allow for passing NULL to the
 ffdheXYZ(dh)s' ->set_secret()
Message-ID: <YgYnu8ZzhSnr+OgZ@gondor.apana.org.au>
References: <20220202104012.4193-1-nstange@suse.de>
 <20220202104012.4193-12-nstange@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220202104012.4193-12-nstange@suse.de>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Wed, Feb 02, 2022 at 11:40:08AM +0100, Nicolai Stange wrote:
> Ephemeral key generation can be requested from any of the ffdheXYZ(dh)
> variants' common ->set_secret() by passing it an (encoded) struct dh
> with the key parameter being unset, i.e. with ->key_size == 0. As the
> whole purpose of the ffdheXYZ(dh) templates is to fill in the group
> parameters as appropriate, they expect ->p and ->g to be unset in any
> input struct dh as well. This means that a user would have to encode an
> all-zeroes struct dh instance via crypto_dh_encode_key() when requesting
> ephemeral key generation from a ffdheXYZ(dh) instance, which is kind of
> pointless.
> 
> Make dh_safe_prime_set_secret() to decode a struct dh from the supplied
> buffer only if the latter is non-NULL and initialize it with all zeroes
> otherwise.
> 
> That is, it is now possible to call
> 
>   crypto_kpp_set_secret(tfm, NULL, 0);
> 
> on any ffdheXYZ(dh) tfm for requesting ephemeral key generation.

Why do we need to support the non-NULL case? IOW what in the kernel
will be using these new templates with a non-NULL parameter?

Thanks,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
