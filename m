Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F1797572E8C
	for <lists+keyrings@lfdr.de>; Wed, 13 Jul 2022 08:54:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234376AbiGMGyM (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 13 Jul 2022 02:54:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234431AbiGMGxz (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 13 Jul 2022 02:53:55 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60413D12F
        for <keyrings@vger.kernel.org>; Tue, 12 Jul 2022 23:53:39 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id sz17so18178865ejc.9
        for <keyrings@vger.kernel.org>; Tue, 12 Jul 2022 23:53:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=chUvm+7w9+081ctK7WbmlahqGUsOkvr6wXdn+iPPwFk=;
        b=OKLJXBPxmJiFysO3RCovTOnMCnVl2pttKyBlnW9395IZ5JBNDDCeSDI/mrJtOaIn+n
         U6lZKRGCx0U5UmXsB8hUrQtCeC9JHABfHjhK2B4yFBno1rieiXWHEvk1wijRab5Pl5Iv
         y3HKdXBXSkFyF/rArW5s4LgdivZWXJul3y7dPEpIeTDbtc+ewRoli2lHkEj1L7k/8vgZ
         rvTlNHY3r8DtlBGhA8B8j0q+U9/HB3z2LUJgx+P37q/p17uJHXPvQhq+ON0N2H1rWrn+
         PzBPqFJmiktkIe6nwbghPstGw5G3gTTPb13C7payQNKG+KkPlhb2oBad0ANKoqMSS29P
         9HGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :mime-version:content-disposition;
        bh=chUvm+7w9+081ctK7WbmlahqGUsOkvr6wXdn+iPPwFk=;
        b=U7GjZWTMv5dycbZ6I35KhJTlUWOSacjRNBw0gci32WG6ZcdX6jUcfGjOfKfvDAhl4j
         tdOgrVG0URo1QlEH+mVfKK5vNd7vREBtTqK5kl5Cvuft2NqzKCxFxAOTm4cxAwDkUnK1
         BwGCJUaL6zFCMw7eVGJ6W8yaltHadJX5NXJuSzPYV5sfbB/PWRQpiMmdnIn3HBfaeUcc
         +mOhUE36tVtvfZNNBYmKrZnKIokgWD1ia3MnuRZFtduTy4vPEqoVUamV9fbKlpeZOUPZ
         Dc1iLSMdEGxBihwqloMZmzCJz2gLWBo5+dahd+H8lfvOD9TMfQTq2dAgK9+zkOy+v+It
         FVEw==
X-Gm-Message-State: AJIora9BFhlcmaHTqstIby2NzMSV8GtdFGbzuJmQbSLj/PPk8fR057qj
        3zan1ZMfmc1s5os3i+GjSVrHImP0+OlumA==
X-Google-Smtp-Source: AGRyM1tWCnKUcRnEGHxVNjgoaVvooIQa/MrL+gYsOYSbEi9ix0GD5pZyR/o879j9xqd0zmgEYbZBrA==
X-Received: by 2002:a17:907:c26:b0:72b:4d8e:b458 with SMTP id ga38-20020a1709070c2600b0072b4d8eb458mr1932051ejc.195.1657695217750;
        Tue, 12 Jul 2022 23:53:37 -0700 (PDT)
Received: from eldamar (c-82-192-242-114.customer.ggaweb.ch. [82.192.242.114])
        by smtp.gmail.com with ESMTPSA id dk11-20020a0564021d8b00b0043a5bcf80a2sm7421558edb.60.2022.07.12.23.53.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Jul 2022 23:53:37 -0700 (PDT)
Sender: Salvatore Bonaccorso <salvatore.bonaccorso@gmail.com>
Date:   Wed, 13 Jul 2022 08:53:36 +0200
From:   Salvatore Bonaccorso <carnil@debian.org>
To:     Ansgar Burchardt <ansgar@43-1.org>
Cc:     keyrings@vger.kernel.org, dhowells@redhat.com, dwmw2@infradead.org
Subject: Re: [PATCH] sign-file: correct error handling
Message-ID: <Ys5r8KDeXjeTtF1X@eldamar.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Hi Ansgar,

On Sun, Jul 03, 2022 at 11:17:50AM +0200, Ansgar Burchardt wrote:
> The functions CMS_final, i2d_CMS_bio_stream, i2d_PKCS7_bio and
> BIO_free all return 1 for success or 0 for failure.
> 
> Signed-off-by: Ansgar Burchardt <ansgar@43-1.org>
> ---
>  scripts/sign-file.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/scripts/sign-file.c b/scripts/sign-file.c
> index 7434e9ea926e..4889f919ff8a 100644
> --- a/scripts/sign-file.c
> +++ b/scripts/sign-file.c
> @@ -322,7 +322,7 @@ int main(int argc, char **argv)
>  				     CMS_NOSMIMECAP | use_keyid |
>  				     use_signed_attrs),
>  		    "CMS_add1_signer");
> -		ERR(CMS_final(cms, bm, NULL, CMS_NOCERTS | CMS_BINARY) < 0,
> +		ERR(!CMS_final(cms, bm, NULL, CMS_NOCERTS | CMS_BINARY),
>  		    "CMS_final");
>  
>  #else
> @@ -341,10 +341,10 @@ int main(int argc, char **argv)
>  			b = BIO_new_file(sig_file_name, "wb");
>  			ERR(!b, "%s", sig_file_name);
>  #ifndef USE_PKCS7
> -			ERR(i2d_CMS_bio_stream(b, cms, NULL, 0) < 0,
> +			ERR(!i2d_CMS_bio_stream(b, cms, NULL, 0),
>  			    "%s", sig_file_name);
>  #else
> -			ERR(i2d_PKCS7_bio(b, pkcs7) < 0,
> +			ERR(!i2d_PKCS7_bio(b, pkcs7),
>  			    "%s", sig_file_name);
>  #endif
>  			BIO_free(b);
> @@ -374,9 +374,9 @@ int main(int argc, char **argv)
>  
>  	if (!raw_sig) {
>  #ifndef USE_PKCS7
> -		ERR(i2d_CMS_bio_stream(bd, cms, NULL, 0) < 0, "%s", dest_name);
> +		ERR(!i2d_CMS_bio_stream(bd, cms, NULL, 0), "%s", dest_name);
>  #else
> -		ERR(i2d_PKCS7_bio(bd, pkcs7) < 0, "%s", dest_name);
> +		ERR(!i2d_PKCS7_bio(bd, pkcs7), "%s", dest_name);
>  #endif
>  	} else {
>  		BIO *b;
> @@ -396,7 +396,7 @@ int main(int argc, char **argv)
>  	ERR(BIO_write(bd, &sig_info, sizeof(sig_info)) < 0, "%s", dest_name);
>  	ERR(BIO_write(bd, magic_number, sizeof(magic_number) - 1) < 0, "%s", dest_name);
>  
> -	ERR(BIO_free(bd) < 0, "%s", dest_name);
> +	ERR(!BIO_free(bd), "%s", dest_name);
>  
>  	/* Finally, if we're signing in place, replace the original. */
>  	if (replace_orig)
> -- 
> 2.35.1

Let's loop in directly as well David Howells and David Woodhouse as
maintainers for the certificate handling.

David and David, are you okay with the patch and if so can you pick it
up?

Regards,
Salvatore
