Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D5CC48F8E1
	for <lists+keyrings@lfdr.de>; Sat, 15 Jan 2022 19:53:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233468AbiAOSxi (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Sat, 15 Jan 2022 13:53:38 -0500
Received: from dfw.source.kernel.org ([139.178.84.217]:50508 "EHLO
        dfw.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233446AbiAOSxi (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Sat, 15 Jan 2022 13:53:38 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E977B60F29;
        Sat, 15 Jan 2022 18:53:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C263FC36AEC;
        Sat, 15 Jan 2022 18:53:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1642272817;
        bh=fvUx6Er8Pamaez4x+DAGIw89tev/AFPlgTYss9t30e4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=S7zKbCjJbXc83+3PiBgZBOaHp6p1YVYbAOayDEMWimjgDyWSdAqp7sy3VD9h2r7zM
         FIRdjCNqC7d4HCj9xSlO/tQ4yRKF2gwH9zryvpmZ+tXgV3xMUf6LlMPsGRhY3v6kLe
         NE+iXxQ2C3fZv8BTAhMUcwUeh1stUsV40hBSwSQkYjoHFYiYiwwZw8iXeWlpTgsc0z
         9QOaaPwo6wFNf6Br+bBb4WaOywWfm2wMN3xetbnoGvjTtGvVT9QrFjrnFVwv4F6pUe
         Y+B50XCzpM96HCg7vbf9Qf47AkTbwLb5+hXngZBlsShTeZNrQQ//g/qX6RHkWkcJet
         8T72z0ttinz9w==
Date:   Sat, 15 Jan 2022 20:53:24 +0200
From:   Jarkko Sakkinen <jarkko@kernel.org>
To:     Eric Biggers <ebiggers@kernel.org>
Cc:     keyrings@vger.kernel.org, David Howells <dhowells@redhat.com>,
        linux-crypto@vger.kernel.org
Subject: Re: [PATCH 3/4] KEYS: x509: remove never-set ->unsupported_key flag
Message-ID: <YeMYJBOkfDRiIFUY@iki.fi>
References: <20220114002920.103858-1-ebiggers@kernel.org>
 <20220114002920.103858-4-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220114002920.103858-4-ebiggers@kernel.org>
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Thu, Jan 13, 2022 at 04:29:19PM -0800, Eric Biggers wrote:
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
>  crypto/asymmetric_keys/pkcs7_verify.c    | 3 ---
>  crypto/asymmetric_keys/x509_parser.h     | 1 -
>  crypto/asymmetric_keys/x509_public_key.c | 9 ---------
>  3 files changed, 13 deletions(-)
> 
> diff --git a/crypto/asymmetric_keys/pkcs7_verify.c b/crypto/asymmetric_keys/pkcs7_verify.c
> index 0b4d07aa8811..4ba81be3cd77 100644
> --- a/crypto/asymmetric_keys/pkcs7_verify.c
> +++ b/crypto/asymmetric_keys/pkcs7_verify.c
> @@ -226,9 +226,6 @@ static int pkcs7_verify_sig_chain(struct pkcs7_message *pkcs7,
>  			return 0;
>  		}
>  
> -		if (x509->unsupported_key)
> -			goto unsupported_crypto_in_x509;

Just a minor nit.

You see now there is only this statement left with a ref to that
label:

	/* If there's no authority certificate specified, then
         * the certificate must be self-signed and is the root
         * of the chain.  Likewise if the cert is its own
         * authority.
         */
        if (x509->unsupported_sig)
                goto unsupported_crypto_in_x509;

I'd suggest to rename this as unsupported_sig_in_x509.

> -
>  		pr_debug("- issuer %s\n", x509->issuer);
>  		sig = x509->sig;
>  		if (sig->auth_ids[0])
> diff --git a/crypto/asymmetric_keys/x509_parser.h b/crypto/asymmetric_keys/x509_parser.h
> index c233f136fb35..da854c94f111 100644
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
> index fe14cae115b5..b03d04d78eb9 100644
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

/Jarkko
