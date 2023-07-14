Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8731575359B
	for <lists+keyrings@lfdr.de>; Fri, 14 Jul 2023 10:51:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235610AbjGNIvH (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Fri, 14 Jul 2023 04:51:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235612AbjGNIvF (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Fri, 14 Jul 2023 04:51:05 -0400
Received: from 167-179-156-38.a7b39c.syd.nbn.aussiebb.net (167-179-156-38.a7b39c.syd.nbn.aussiebb.net [167.179.156.38])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1796F26B2;
        Fri, 14 Jul 2023 01:51:05 -0700 (PDT)
Received: from gwarestrin.arnor.me.apana.org.au ([192.168.103.7])
        by fornost.hmeau.com with smtp (Exim 4.94.2 #2 (Debian))
        id 1qKEVn-001RdR-BA; Fri, 14 Jul 2023 18:50:52 +1000
Received: by gwarestrin.arnor.me.apana.org.au (sSMTP sendmail emulation); Fri, 14 Jul 2023 18:50:44 +1000
Date:   Fri, 14 Jul 2023 18:50:44 +1000
From:   Herbert Xu <herbert@gondor.apana.org.au>
To:     Gaosheng Cui <cuigaosheng1@huawei.com>
Cc:     dhowells@redhat.com, davem@davemloft.net, keyrings@vger.kernel.org,
        linux-crypto@vger.kernel.org
Subject: Re: [PATCH -next] verify_pefile: fix kernel-doc warnings in
 verify_pefile
Message-ID: <ZLEMZNemwIGlVRo3@gondor.apana.org.au>
References: <20230619132424.80587-1-cuigaosheng1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230619132424.80587-1-cuigaosheng1@huawei.com>
X-Spam-Status: No, score=2.7 required=5.0 tests=BAYES_00,HELO_DYNAMIC_IPADDR2,
        RCVD_IN_DNSWL_BLOCKED,RDNS_DYNAMIC,SPF_HELO_NONE,SPF_PASS,TVD_RCVD_IP,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Mon, Jun 19, 2023 at 09:24:24PM +0800, Gaosheng Cui wrote:
> Fix kernel-doc warnings in verify_pefile:
> 
> crypto/asymmetric_keys/verify_pefile.c:423: warning: Excess function
> parameter 'trust_keys' description in 'verify_pefile_signature'
> 
> crypto/asymmetric_keys/verify_pefile.c:423: warning: Function parameter
> or member 'trusted_keys' not described in 'verify_pefile_signature'
> 
> Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>
> ---
>  crypto/asymmetric_keys/verify_pefile.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
