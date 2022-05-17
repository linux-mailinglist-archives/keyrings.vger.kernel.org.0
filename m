Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 90CE252AD7F
	for <lists+keyrings@lfdr.de>; Tue, 17 May 2022 23:26:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230153AbiEQV0s (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 17 May 2022 17:26:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229469AbiEQV0q (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Tue, 17 May 2022 17:26:46 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A095251E52
        for <keyrings@vger.kernel.org>; Tue, 17 May 2022 14:26:45 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id l7-20020a17090aaa8700b001dd1a5b9965so101686pjq.2
        for <keyrings@vger.kernel.org>; Tue, 17 May 2022 14:26:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=qLJg95t8R5cMqLU8BKOAsIibZzXFsrk9MeOVY0EHh98=;
        b=Zy3T4x476IYScnuQ4oQveqRGMhLKJZVxMoLu6uG6d99FerUglj29HdwnGrQ+ta7Q6O
         r6DA5/nGpi5QjRJppqsqbHpjqlifbw9JLXPNJj3p7XTLhBzsQnwi68BZX9dApNZ3+vpY
         G3wreieQn48yEHwfa0dh7kGMSGRHDFp33MbT4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=qLJg95t8R5cMqLU8BKOAsIibZzXFsrk9MeOVY0EHh98=;
        b=CVciY+u/PET9Q7/Z5AP/mmTlRLK+FLCH3DyWjeAmu84eBxLCpcd9DyvYfd4W7ZTt+M
         nP0LN2d6GAmrGsZx5qvjQXj5pN+hSQjLdU63beLpZDl76f6Vs/WDsXTWOvPGJHLRqvdn
         GeybHmeojCHo3QYWeYKdzj21qmi9Bzt0/CyQNC1YEmgCL8ADNpO7vj89H+Y7kKd7OhGY
         P4T/hrwsRUKlTKFut0Sk5i4mCdbS8fI6eo2iiFuPsZZNSXPjnGC00jx0ezWi6LN92tqL
         CotUmlPbMh4pfNIeC3TTovTMz7qyjp9c8w76b/0IyW1QyqTlWWtQY5+oM7sAss99Wzre
         3RHw==
X-Gm-Message-State: AOAM530UQm//jzwSQTSSJ90ehAMeYk/cICGqFvYFYiIdKsSIxtl2Afus
        M6nw8cw+btu5qtsvAXTCE0v9yQ==
X-Google-Smtp-Source: ABdhPJw4YmKS8zJYnuDLhmLwpfwUIROVB9p9nPBNDBDH2YBY5Eqmnikjrzy/efi8Ky4G7rfprcjTmw==
X-Received: by 2002:a17:902:f542:b0:15e:b6d2:88d9 with SMTP id h2-20020a170902f54200b0015eb6d288d9mr23741493plf.128.1652822805160;
        Tue, 17 May 2022 14:26:45 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id l1-20020a170902ec0100b0015e8d4eb267sm70065pld.177.2022.05.17.14.26.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 May 2022 14:26:44 -0700 (PDT)
Date:   Tue, 17 May 2022 14:26:44 -0700
From:   Kees Cook <keescook@chromium.org>
To:     GUO Zihua <guozihua@huawei.com>
Cc:     keyrings@vger.kernel.org, linux-crypto@vger.kernel.org,
        davem@davemloft.net, dhowells@redhat.com,
        herbert@gondor.apana.org.au, gustavoars@kernel.org,
        linux-hardening@vger.kernel.org
Subject: Re: [PATCH] crypto: Use struct_size() helper in kmalloc()
Message-ID: <202205171424.CF36CE58@keescook>
References: <20220517080532.31015-1-guozihua@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220517080532.31015-1-guozihua@huawei.com>
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Tue, May 17, 2022 at 04:05:32PM +0800, GUO Zihua wrote:
> Make use of struct_size() heler for structures containing flexible array
> member instead of sizeof() which prevents potential issues as well as
> addressing the following sparse warning:
> 
> crypto/asymmetric_keys/asymmetric_type.c:155:23: warning: using sizeof
> on a flexible structure
> crypto/asymmetric_keys/asymmetric_type.c:247:28: warning: using sizeof
> on a flexible structure
> 
> Reference: https://github.com/KSPP/linux/issues/174
> 
> Signed-off-by: GUO Zihua <guozihua@huawei.com>
> ---
>  crypto/asymmetric_keys/asymmetric_type.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/crypto/asymmetric_keys/asymmetric_type.c b/crypto/asymmetric_keys/asymmetric_type.c
> index 41a2f0eb4ce4..96a99a91bf17 100644
> --- a/crypto/asymmetric_keys/asymmetric_type.c
> +++ b/crypto/asymmetric_keys/asymmetric_type.c
> @@ -152,7 +152,7 @@ struct asymmetric_key_id *asymmetric_key_generate_id(const void *val_1,
>  {
>  	struct asymmetric_key_id *kid;
>  
> -	kid = kmalloc(sizeof(struct asymmetric_key_id) + len_1 + len_2,
> +	kid = kmalloc(struct_size(kid, data, len_1 + len_2),

Please use the size_add() helper for this open-coded add here.

>  		      GFP_KERNEL);
>  	if (!kid)
>  		return ERR_PTR(-ENOMEM);
> @@ -244,7 +244,7 @@ struct asymmetric_key_id *asymmetric_key_hex_to_key_id(const char *id)
>  	if (asciihexlen & 1)
>  		return ERR_PTR(-EINVAL);
>  
> -	match_id = kmalloc(sizeof(struct asymmetric_key_id) + asciihexlen / 2,
> +	match_id = kmalloc(struct_size(match_id, data, asciihexlen / 2),

There is no size_div(), but that's ok here because the denominator is an
constant expression.

>  			   GFP_KERNEL);
>  	if (!match_id)
>  		return ERR_PTR(-ENOMEM);
> -- 
> 2.36.0
> 

-- 
Kees Cook
