Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 121BB39A11E
	for <lists+keyrings@lfdr.de>; Thu,  3 Jun 2021 14:34:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230386AbhFCMge (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 3 Jun 2021 08:36:34 -0400
Received: from helcar.hmeau.com ([216.24.177.18]:32772 "EHLO deadmen.hmeau.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230255AbhFCMge (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Thu, 3 Jun 2021 08:36:34 -0400
Received: from gondobar.mordor.me.apana.org.au ([192.168.128.4] helo=gondobar)
        by deadmen.hmeau.com with esmtp (Exim 4.92 #5 (Debian))
        id 1lomYb-0002Da-T8; Thu, 03 Jun 2021 20:34:41 +0800
Received: from herbert by gondobar with local (Exim 4.92)
        (envelope-from <herbert@gondor.apana.org.au>)
        id 1lomYa-0001iF-5L; Thu, 03 Jun 2021 20:34:40 +0800
Date:   Thu, 3 Jun 2021 20:34:40 +0800
From:   Herbert Xu <herbert@gondor.apana.org.au>
To:     Hongbo Li <herbert.tencent@gmail.com>
Cc:     keyrings@vger.kernel.org, linux-crypto@vger.kernel.org,
        ebiggers@kernel.org, dhowells@redhat.com, jarkko@kernel.org,
        tianjia.zhang@linux.alibaba.com, herberthbli@tencent.com,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] crypto: sm2 - fix a memory leak in sm2
Message-ID: <20210603123357.GM6161@gondor.apana.org.au>
References: <1622552752-15501-1-git-send-email-herbert.tencent@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1622552752-15501-1-git-send-email-herbert.tencent@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Tue, Jun 01, 2021 at 09:05:52PM +0800, Hongbo Li wrote:
> From: Hongbo Li <herberthbli@tencent.com>
> 
> SM2 module alloc ec->Q in sm2_set_pub_key(), when doing alg test in
> test_akcipher_one(), it will set public key for every test vector,
> and don't free ec->Q. This will cause a memory leak.
> 
> This patch alloc ec->Q in sm2_ec_ctx_init().
> 
> Fixes: ea7ecb66440b ("crypto: sm2 - introduce OSCCA SM2 asymmetric cipher algorithm")
> Signed-off-by: Hongbo Li <herberthbli@tencent.com>
> Cc: stable@vger.kernel.org # v5.10+
> Reviewed-by: Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
> ---
>  crypto/sm2.c | 24 ++++++++++--------------
>  1 file changed, 10 insertions(+), 14 deletions(-)

Your patch has been discarded by patchwork because you didn't
update the Subject.  The usual method is to use a version prefix
such as v2, v3, etc. so that the Subject remains distinct.

Please resubmit with a new Subject.

Oh and don't cc stable@vger.kernel.org.

Thanks,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
