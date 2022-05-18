Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6D38A52B1A5
	for <lists+keyrings@lfdr.de>; Wed, 18 May 2022 06:53:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229953AbiEREpo (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 18 May 2022 00:45:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229904AbiEREpn (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 18 May 2022 00:45:43 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B127A275ED;
        Tue, 17 May 2022 21:45:41 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 276C76172E;
        Wed, 18 May 2022 04:45:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6A8AC385A9;
        Wed, 18 May 2022 04:45:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1652849140;
        bh=j6MOiP9+5B8pAiYMM89g+aACwKHd4IkfAHOyZ69pSTA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=bNpqpBk6m+7sfo46rNylXB8FfOd/nFnzvIsVi946WoLJt7F7FzUQrOjSEOmybKlZ+
         Y02gmJO2pnjUD0BCEyphtuDs8277lkMT3b6gcYVp+jrnqShnuJ+oFzTnwXttGLsiI7
         YYTZWayz5noT0hsmJsfZ/qeEPU4b4c9Jm7P4s5wf5zA1Q48Cp57tJgv1JNLxjbNEYY
         9qJABxenqZ21m5/TlgpHguixMe6xwHlq0lvNRuco1NaXQ8szWH8c4+x7C6vFCXEdKQ
         LMcsfE5wKbhE9Fd/33t4qFK1prm7kIbHKUtNHa/zacKo8jFyt0Vn43m6kFkHbezAEv
         uBnPAN8xMDxDw==
Date:   Tue, 17 May 2022 23:55:07 -0500
From:   "Gustavo A. R. Silva" <gustavoars@kernel.org>
To:     GUO Zihua <guozihua@huawei.com>
Cc:     keyrings@vger.kernel.org, linux-crypto@vger.kernel.org,
        davem@davemloft.net, dhowells@redhat.com,
        herbert@gondor.apana.org.au, linux-hardening@vger.kernel.org
Subject: Re: [PATCH v2] crypto: Use struct_size() helper in kmalloc()
Message-ID: <20220518045507.GA16144@embeddedor>
References: <20220518005639.181640-1-guozihua@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220518005639.181640-1-guozihua@huawei.com>
X-Spam-Status: No, score=-7.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Wed, May 18, 2022 at 08:56:39AM +0800, GUO Zihua wrote:
> Make use of struct_size() heler for structures containing flexible array
> member instead of sizeof() which prevents potential issues as well as
> addressing the following sparse warning:
> 
> crypto/asymmetric_keys/asymmetric_type.c:155:23: warning: using sizeof
> on a flexible structure
> crypto/asymmetric_keys/asymmetric_type.c:247:28: warning: using sizeof
> on a flexible structure

The warnings above are not silenced with this patch as struct_size()
internally use sizeof on the struct-with-flex-array.

However, the use of struct_size() instead of the open-coded expressions
in the calls to kmalloc() is correct.

> 
> Reference: https://github.com/KSPP/linux/issues/174

I updated this issue on the issue tracker. Please, from now on, just
use that issue as a list of potential open-coded instances to be
audited. :)

> 
> Signed-off-by: GUO Zihua <guozihua@huawei.com>

Reviewed-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Thanks
--
Gustavo

> 
> ---
> 
> v2:
>     Use size_add() helper following Kees Cook's suggestion.
> ---
>  crypto/asymmetric_keys/asymmetric_type.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/crypto/asymmetric_keys/asymmetric_type.c b/crypto/asymmetric_keys/asymmetric_type.c
> index 41a2f0eb4ce4..e020222b1fe5 100644
> --- a/crypto/asymmetric_keys/asymmetric_type.c
> +++ b/crypto/asymmetric_keys/asymmetric_type.c
> @@ -152,7 +152,7 @@ struct asymmetric_key_id *asymmetric_key_generate_id(const void *val_1,
>  {
>  	struct asymmetric_key_id *kid;
>  
> -	kid = kmalloc(sizeof(struct asymmetric_key_id) + len_1 + len_2,
> +	kid = kmalloc(struct_size(kid, data, size_add(len_1, len_2)),
>  		      GFP_KERNEL);
>  	if (!kid)
>  		return ERR_PTR(-ENOMEM);
> @@ -244,7 +244,7 @@ struct asymmetric_key_id *asymmetric_key_hex_to_key_id(const char *id)
>  	if (asciihexlen & 1)
>  		return ERR_PTR(-EINVAL);
>  
> -	match_id = kmalloc(sizeof(struct asymmetric_key_id) + asciihexlen / 2,
> +	match_id = kmalloc(struct_size(match_id, data, asciihexlen / 2),
>  			   GFP_KERNEL);
>  	if (!match_id)
>  		return ERR_PTR(-ENOMEM);
> -- 
> 2.36.0
> 
