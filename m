Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A359B49CC03
	for <lists+keyrings@lfdr.de>; Wed, 26 Jan 2022 15:14:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235382AbiAZOOU (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 26 Jan 2022 09:14:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235408AbiAZOOR (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 26 Jan 2022 09:14:17 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 950C0C061749;
        Wed, 26 Jan 2022 06:14:16 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 525AAB81D44;
        Wed, 26 Jan 2022 14:14:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8689CC340E3;
        Wed, 26 Jan 2022 14:14:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1643206454;
        bh=rt/HV+TwfzAKe+iAbfuxp0I6beYN+GTOaaQQOnIS0q4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=dlVhsNMsGV81Kk9qtZASpYqcfNS0tHjmH+nhiGhgfbwShE1BIWd8Z3krthr4SnOCV
         RXivbI2ri2A683Ya19GBi6HyTPJa6anZD8yg0iZxDBIpo+TfSmdIYB0treXHirV+YI
         4OTy+8dk3zJB3u0V7Gh4pUvw+87u2dnjhuZ+UkTxZMgCdtgGXH3m0b+mdznWFfrDQH
         u6B/rKMbxm4zBvY6loMDxjs+B2hX4EjcN+72bFzh4WIM8wKSzCPUOrV97e2XdxFSxG
         ZAsSWDSA0BhhIac9ME4Wc3byjhf5Im7DHmTk6o6F61vfczLcn+K6B8JMB6bXDwaun5
         MPvoAxe6CzQ/w==
Date:   Wed, 26 Jan 2022 16:13:53 +0200
From:   Jarkko Sakkinen <jarkko@kernel.org>
To:     Eric Biggers <ebiggers@kernel.org>
Cc:     keyrings@vger.kernel.org, David Howells <dhowells@redhat.com>,
        linux-crypto@vger.kernel.org
Subject: Re: [PATCH v2 3/4] KEYS: x509: remove never-set ->unsupported_key
 flag
Message-ID: <YfFXIY29zlIfQTcH@iki.fi>
References: <20220119005436.119072-1-ebiggers@kernel.org>
 <20220119005436.119072-4-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220119005436.119072-4-ebiggers@kernel.org>
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Tue, Jan 18, 2022 at 04:54:35PM -0800, Eric Biggers wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> The X.509 parser always sets cert->pub->pkey_algo on success, since
> x509_extract_key_data() is a mandatory action in the X.509 ASN.1
> grammar, and it returns an error if the algorithm is unknown.  Thus,
> remove the dead code which handled this field being NULL.  This results
> in the ->unsupported_key flag never being set, so remove that too.
> 
> Signed-off-by: Eric Biggers <ebiggers@google.com>
> ---
>  crypto/asymmetric_keys/pkcs7_verify.c    | 7 ++-----
>  crypto/asymmetric_keys/x509_parser.h     | 1 -
>  crypto/asymmetric_keys/x509_public_key.c | 9 ---------
>  3 files changed, 2 insertions(+), 15 deletions(-)
> 
> diff --git a/crypto/asymmetric_keys/pkcs7_verify.c b/crypto/asymmetric_keys/pkcs7_verify.c
> index 0b4d07aa88111..d37b187faf9ae 100644
> --- a/crypto/asymmetric_keys/pkcs7_verify.c
> +++ b/crypto/asymmetric_keys/pkcs7_verify.c
> @@ -226,9 +226,6 @@ static int pkcs7_verify_sig_chain(struct pkcs7_message *pkcs7,
>  			return 0;
>  		}
>  
> -		if (x509->unsupported_key)
> -			goto unsupported_crypto_in_x509;
> -
>  		pr_debug("- issuer %s\n", x509->issuer);
>  		sig = x509->sig;
>  		if (sig->auth_ids[0])
> @@ -245,7 +242,7 @@ static int pkcs7_verify_sig_chain(struct pkcs7_message *pkcs7,
>  			 * authority.
>  			 */
>  			if (x509->unsupported_sig)
> -				goto unsupported_crypto_in_x509;
> +				goto unsupported_sig_in_x509;
>  			x509->signer = x509;
>  			pr_debug("- self-signed\n");
>  			return 0;
> @@ -309,7 +306,7 @@ static int pkcs7_verify_sig_chain(struct pkcs7_message *pkcs7,
>  		might_sleep();
>  	}
>  
> -unsupported_crypto_in_x509:
> +unsupported_sig_in_x509:
>  	/* Just prune the certificate chain at this point if we lack some
>  	 * crypto module to go further.  Note, however, we don't want to set
>  	 * sinfo->unsupported_crypto as the signed info block may still be
> diff --git a/crypto/asymmetric_keys/x509_parser.h b/crypto/asymmetric_keys/x509_parser.h
> index c233f136fb354..da854c94f1115 100644
> --- a/crypto/asymmetric_keys/x509_parser.h
> +++ b/crypto/asymmetric_keys/x509_parser.h
> @@ -36,7 +36,6 @@ struct x509_certificate {
>  	bool		seen;			/* Infinite recursion prevention */
>  	bool		verified;
>  	bool		self_signed;		/* T if self-signed (check unsupported_sig too) */
> -	bool		unsupported_key;	/* T if key uses unsupported crypto */
>  	bool		unsupported_sig;	/* T if signature uses unsupported crypto */
>  	bool		blacklisted;
>  };
> diff --git a/crypto/asymmetric_keys/x509_public_key.c b/crypto/asymmetric_keys/x509_public_key.c
> index fe14cae115b51..b03d04d78eb9d 100644
> --- a/crypto/asymmetric_keys/x509_public_key.c
> +++ b/crypto/asymmetric_keys/x509_public_key.c
> @@ -33,9 +33,6 @@ int x509_get_sig_params(struct x509_certificate *cert)
>  	sig->data = cert->tbs;
>  	sig->data_size = cert->tbs_size;
>  
> -	if (!cert->pub->pkey_algo)
> -		cert->unsupported_key = true;
> -
>  	if (!sig->pkey_algo)
>  		cert->unsupported_sig = true;
>  
> @@ -173,12 +170,6 @@ static int x509_key_preparse(struct key_preparsed_payload *prep)
>  
>  	pr_devel("Cert Issuer: %s\n", cert->issuer);
>  	pr_devel("Cert Subject: %s\n", cert->subject);
> -
> -	if (cert->unsupported_key) {
> -		ret = -ENOPKG;
> -		goto error_free_cert;
> -	}
> -
>  	pr_devel("Cert Key Algo: %s\n", cert->pub->pkey_algo);
>  	pr_devel("Cert Valid period: %lld-%lld\n", cert->valid_from, cert->valid_to);
>  
> -- 
> 2.34.1
> 


Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>

BR, Jarkko
