Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 732F269B474
	for <lists+keyrings@lfdr.de>; Fri, 17 Feb 2023 22:14:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229800AbjBQVOJ (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Fri, 17 Feb 2023 16:14:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229796AbjBQVOI (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Fri, 17 Feb 2023 16:14:08 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F29765DE25
        for <keyrings@vger.kernel.org>; Fri, 17 Feb 2023 13:14:06 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 94B1A61FB9
        for <keyrings@vger.kernel.org>; Fri, 17 Feb 2023 21:14:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14DACC4339C;
        Fri, 17 Feb 2023 21:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1676668445;
        bh=2OEoRNH1AAAT3ukd6q5cI5CvqIa1U/Yn+M1RH0odgVc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=t9wZY6nfs171FCZdhh0coMJ9tTIOD3nTGfJGHXJyXGtG5PtWXjgdcbIrnrn7J0GCL
         Wc+stjnd0eC3Wx/2MbTvcL/25s0C/wakK4bP8NDV67mdSbJi23Qs6O/ltYKEwuKofg
         Y5xDpRSGAFwilOTZJ2dSB2PQ07/Bs9rRE8eA7NhquYjN4pX2sPMPYdwjVJAsKL8Dx8
         FgyZWzzRvXHiSF1xxldtnXIC/2SfqM5w+Du5C7S+Mi4lUMtzkClWhRga/6qa8GFkeJ
         f8qy/2Zede/siiSrcHr23PH4glYdrx/nf7ikT2QvN6AicxoCWmzIODNYGXz27zKaa5
         3IZbq/jJtOkqw==
Date:   Fri, 17 Feb 2023 23:14:00 +0200
From:   Jarkko Sakkinen <jarkko@kernel.org>
To:     Robbie Harwood <rharwood@redhat.com>
Cc:     keyrings@vger.kernel.org, David Howells <dhowells@redhat.com>
Subject: Re: [PATCH v1 2/2] asymmetric_keys: log on fatal failures in PE/pkcs7
Message-ID: <Y+/uGG1rsvf9kt4d@kernel.org>
References: <20230217201435.39784-1-rharwood@redhat.com>
 <20230217201435.39784-3-rharwood@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230217201435.39784-3-rharwood@redhat.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Fri, Feb 17, 2023 at 03:14:35PM -0500, Robbie Harwood wrote:
> These particular errors can be encountered while trying to kexec when
> secureboot lockdown is in place.  Without this change, even with a
> signed debug build, one still needs to reboot the machine to add the
> appropriate dyndbg parameters (since lockdown blocks debugfs).
> 
> Accordingly, upgrade all pr_debug() before fatal error into pr_info().
> 
> Signed-off-by: Robbie Harwood <rharwood@redhat.com>

Eessentially this changes configuration to hard coded implementation.

No gain IMHO. If you are ready to patch the kernel you could live with
boot time dyndbg parameters.

> ---
>  crypto/asymmetric_keys/pkcs7_verify.c  | 10 +++++-----
>  crypto/asymmetric_keys/verify_pefile.c | 24 ++++++++++++------------
>  2 files changed, 17 insertions(+), 17 deletions(-)
> 
> diff --git a/crypto/asymmetric_keys/pkcs7_verify.c b/crypto/asymmetric_keys/pkcs7_verify.c
> index f6321c785714..da425d142720 100644
> --- a/crypto/asymmetric_keys/pkcs7_verify.c
> +++ b/crypto/asymmetric_keys/pkcs7_verify.c
> @@ -79,16 +79,16 @@ static int pkcs7_digest(struct pkcs7_message *pkcs7,
>  		}
>  
>  		if (sinfo->msgdigest_len != sig->digest_size) {
> -			pr_debug("Sig %u: Invalid digest size (%u)\n",
> -				 sinfo->index, sinfo->msgdigest_len);
> +			pr_info("Sig %u: Invalid digest size (%u)\n",
> +				sinfo->index, sinfo->msgdigest_len);
>  			ret = -EBADMSG;
>  			goto error;
>  		}
>  
>  		if (memcmp(sig->digest, sinfo->msgdigest,
>  			   sinfo->msgdigest_len) != 0) {
> -			pr_debug("Sig %u: Message digest doesn't match\n",
> -				 sinfo->index);
> +			pr_info("Sig %u: Message digest doesn't match\n",
> +				sinfo->index);
>  			ret = -EKEYREJECTED;
>  			goto error;
>  		}
> @@ -478,7 +478,7 @@ int pkcs7_supply_detached_data(struct pkcs7_message *pkcs7,
>  			       const void *data, size_t datalen)
>  {
>  	if (pkcs7->data) {
> -		pr_debug("Data already supplied\n");
> +		pr_info("Data already supplied\n");
>  		return -EINVAL;
>  	}
>  	pkcs7->data = data;
> diff --git a/crypto/asymmetric_keys/verify_pefile.c b/crypto/asymmetric_keys/verify_pefile.c
> index fe1bb374239d..c30e6610db26 100644
> --- a/crypto/asymmetric_keys/verify_pefile.c
> +++ b/crypto/asymmetric_keys/verify_pefile.c
> @@ -74,7 +74,7 @@ static int pefile_parse_binary(const void *pebuf, unsigned int pelen,
>  		break;
>  
>  	default:
> -		pr_debug("Unknown PEOPT magic = %04hx\n", pe32->magic);
> +		pr_info("Unknown PEOPT magic = %04hx\n", pe32->magic);
>  		return -ELIBBAD;
>  	}
>  
> @@ -95,7 +95,7 @@ static int pefile_parse_binary(const void *pebuf, unsigned int pelen,
>  	ctx->certs_size = ddir->certs.size;
>  
>  	if (!ddir->certs.virtual_address || !ddir->certs.size) {
> -		pr_debug("Unsigned PE binary\n");
> +		pr_info("Unsigned PE binary\n");
>  		return -ENODATA;
>  	}
>  
> @@ -127,7 +127,7 @@ static int pefile_strip_sig_wrapper(const void *pebuf,
>  	unsigned len;
>  
>  	if (ctx->sig_len < sizeof(wrapper)) {
> -		pr_debug("Signature wrapper too short\n");
> +		pr_info("Signature wrapper too short\n");
>  		return -ELIBBAD;
>  	}
>  
> @@ -142,16 +142,16 @@ static int pefile_strip_sig_wrapper(const void *pebuf,
>  	 * rounded up since 0.110.
>  	 */
>  	if (wrapper.length > ctx->sig_len) {
> -		pr_debug("Signature wrapper bigger than sig len (%x > %x)\n",
> -			 ctx->sig_len, wrapper.length);
> +		pr_info("Signature wrapper bigger than sig len (%x > %x)\n",
> +			ctx->sig_len, wrapper.length);
>  		return -ELIBBAD;
>  	}
>  	if (wrapper.revision != WIN_CERT_REVISION_2_0) {
> -		pr_debug("Signature is not revision 2.0\n");
> +		pr_info("Signature is not revision 2.0\n");
>  		return -ENOTSUPP;
>  	}
>  	if (wrapper.cert_type != WIN_CERT_TYPE_PKCS_SIGNED_DATA) {
> -		pr_debug("Signature certificate type is not PKCS\n");
> +		pr_info("Signature certificate type is not PKCS\n");
>  		return -ENOTSUPP;
>  	}
>  
> @@ -164,7 +164,7 @@ static int pefile_strip_sig_wrapper(const void *pebuf,
>  	ctx->sig_offset += sizeof(wrapper);
>  	ctx->sig_len -= sizeof(wrapper);
>  	if (ctx->sig_len < 4) {
> -		pr_debug("Signature data missing\n");
> +		pr_info("Signature data missing\n");
>  		return -EKEYREJECTED;
>  	}
>  
> @@ -198,7 +198,7 @@ static int pefile_strip_sig_wrapper(const void *pebuf,
>  		return 0;
>  	}
>  not_pkcs7:
> -	pr_debug("Signature data not PKCS#7\n");
> +	pr_info("Signature data not PKCS#7\n");
>  	return -ELIBBAD;
>  }
>  
> @@ -341,8 +341,8 @@ static int pefile_digest_pe(const void *pebuf, unsigned int pelen,
>  	digest_size = crypto_shash_digestsize(tfm);
>  
>  	if (digest_size != ctx->digest_len) {
> -		pr_debug("Digest size mismatch (%zx != %x)\n",
> -			 digest_size, ctx->digest_len);
> +		pr_info("Digest size mismatch (%zx != %x)\n",
> +			digest_size, ctx->digest_len);
>  		ret = -EBADMSG;
>  		goto error_no_desc;
>  	}
> @@ -373,7 +373,7 @@ static int pefile_digest_pe(const void *pebuf, unsigned int pelen,
>  	 * PKCS#7 certificate.
>  	 */
>  	if (memcmp(digest, ctx->digest, ctx->digest_len) != 0) {
> -		pr_debug("Digest mismatch\n");
> +		pr_info("Digest mismatch\n");
>  		ret = -EKEYREJECTED;
>  	} else {
>  		pr_debug("The digests match!\n");
> -- 
> 2.39.1
> 

BR, Jarkko
