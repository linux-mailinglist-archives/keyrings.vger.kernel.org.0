Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E9A949CC07
	for <lists+keyrings@lfdr.de>; Wed, 26 Jan 2022 15:14:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235480AbiAZOOn (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 26 Jan 2022 09:14:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235423AbiAZOOm (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 26 Jan 2022 09:14:42 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F7F4C06161C;
        Wed, 26 Jan 2022 06:14:42 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 53721B81E6E;
        Wed, 26 Jan 2022 14:14:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F387C340E3;
        Wed, 26 Jan 2022 14:14:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1643206480;
        bh=3iNzted477lq9TSO1EjldnQ7/t2LlgxupBJGGjercVc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=QWclduL8pe8cbC1PYdm6QKAXyltgjXzIapUfoiu6uzdtBWT2FHRviY1C+6GLlfBQG
         pFjHpZdVJjAJiIq0GGVqchsEMzE/GIqQXOjz1u/gwQJa4+5OBbZ4YNC9UurrTbVSHY
         /xGXHE8CQRRKjktLVyTCpM96l0ymsqsWfPDhyMXiHaFY0Kh7bDziH1X3cOedFn+son
         U1iRHyoRkgE0+eb9QeS5uWb1NzY/oVxZR73c5S7a/v6elaAY53APOV+TgpQzVVS21v
         AzaxHJeYCo9cWvxXGqeQztf0EY+IP9791msCBKgggnVSgV8SMeO7hLh6GBEOGn4oTp
         JPIMwoh3WkFvg==
Date:   Wed, 26 Jan 2022 16:14:19 +0200
From:   Jarkko Sakkinen <jarkko@kernel.org>
To:     Eric Biggers <ebiggers@kernel.org>
Cc:     keyrings@vger.kernel.org, David Howells <dhowells@redhat.com>,
        linux-crypto@vger.kernel.org
Subject: Re: [PATCH v2 4/4] KEYS: x509: remove dead code that set
 ->unsupported_sig
Message-ID: <YfFXO/gMxKCoHUKD@iki.fi>
References: <20220119005436.119072-1-ebiggers@kernel.org>
 <20220119005436.119072-5-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220119005436.119072-5-ebiggers@kernel.org>
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Tue, Jan 18, 2022 at 04:54:36PM -0800, Eric Biggers wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> The X.509 parser always sets cert->sig->pkey_algo and
> cert->sig->hash_algo on success, since x509_note_sig_algo() is a
> mandatory action in the X.509 ASN.1 grammar, and it returns an error if
> the signature's algorithm is unknown.  Thus, remove the dead code which
> handled these fields being NULL.
> 
> Acked-by: Jarkko Sakkinen <jarkko@kernel.org>
> Signed-off-by: Eric Biggers <ebiggers@google.com>
> ---
>  crypto/asymmetric_keys/x509_public_key.c | 9 ---------
>  1 file changed, 9 deletions(-)
> 
> diff --git a/crypto/asymmetric_keys/x509_public_key.c b/crypto/asymmetric_keys/x509_public_key.c
> index b03d04d78eb9d..8c77a297a82d4 100644
> --- a/crypto/asymmetric_keys/x509_public_key.c
> +++ b/crypto/asymmetric_keys/x509_public_key.c
> @@ -33,15 +33,6 @@ int x509_get_sig_params(struct x509_certificate *cert)
>  	sig->data = cert->tbs;
>  	sig->data_size = cert->tbs_size;
>  
> -	if (!sig->pkey_algo)
> -		cert->unsupported_sig = true;
> -
> -	/* We check the hash if we can - even if we can't then verify it */
> -	if (!sig->hash_algo) {
> -		cert->unsupported_sig = true;
> -		return 0;
> -	}
> -
>  	sig->s = kmemdup(cert->raw_sig, cert->raw_sig_size, GFP_KERNEL);
>  	if (!sig->s)
>  		return -ENOMEM;
> -- 
> 2.34.1
> 


Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>


/Jarkko
