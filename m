Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 91BE4291FCA
	for <lists+keyrings@lfdr.de>; Sun, 18 Oct 2020 22:22:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726593AbgJRUWh (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Sun, 18 Oct 2020 16:22:37 -0400
Received: from mail.kernel.org ([198.145.29.99]:55464 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726422AbgJRUWh (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Sun, 18 Oct 2020 16:22:37 -0400
Received: from localhost (83-245-197-237.elisa-laajakaista.fi [83.245.197.237])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5E95C22269;
        Sun, 18 Oct 2020 20:22:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603052556;
        bh=djgPT3OUbdriMIW6EBsKoPCp/kWKr1Yxd/g3Lx5LDoY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=2RZvdZvsizq//jKiin6Ozq6c0RCfe716zQJbjFhPFkBXlsAMIOy7ivi5SN+HDNu/e
         D2nUWMrz4+/9NP6lfEd7xB+KHYUqJM771TrNjVXn8PzJXHquHM2diPRb5EUp5n/z+y
         h+9u2ZWnR/Kve3/hgtlIy/cR2WjTXx3ek3b5zNKY=
Date:   Sun, 18 Oct 2020 23:22:34 +0300
From:   Jarkko Sakkinen <jarkko@kernel.org>
To:     Andrew Zaborowski <andrew.zaborowski@intel.com>
Cc:     keyrings@vger.kernel.org, dhowells@redhat.com
Subject: Re: [RESEND][PATCH] keys: Handle missing Authority Key Identifier
 X509 extension
Message-ID: <20201018202234.GA574776@kapsi.fi>
References: <20201013133939.1182462-1-andrew.zaborowski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201013133939.1182462-1-andrew.zaborowski@intel.com>
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Tue, Oct 13, 2020 at 03:39:38PM +0200, Andrew Zaborowski wrote:
> In a self-signed certificate the subject and issuer are the same and so
> the Authority Key Identifier X.509 v3 extension is explicitly made
> optional in RFC5280 section 4.2.1.1.
> crypto/asymmetric_keys/x509_cert_parser.c can't handle this and makes
> (at least) the restrict.c functions refuse to work with certificates
> that don't include the AKID.  Fix this by filling in the missing
> cert->sig->auth_ids with the certificate's own IDs after parsing and
> determinig the certificate is self-signed.
> 
> The asymmetric_key_generate_id return value is not checked because it's
> already succeeded once at this point.
> 
> There are root X.509 v3 certificates in use where this is the case,
> mostly oldish ones.
> 
> Signed-off-by: Andrew Zaborowski <andrew.zaborowski@intel.com>

Acked-by: Jarkko Sakkinen <jarkko@kernel.org>

> ---
>  crypto/asymmetric_keys/x509_cert_parser.c | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/crypto/asymmetric_keys/x509_cert_parser.c b/crypto/asymmetric_keys/x509_cert_parser.c
> index 26ec20ef489..a5a2f93e242 100644
> --- a/crypto/asymmetric_keys/x509_cert_parser.c
> +++ b/crypto/asymmetric_keys/x509_cert_parser.c
> @@ -136,6 +136,25 @@ struct x509_certificate *x509_cert_parse(const void *data, size_t datalen)
>  	if (ret < 0)
>  		goto error_decode;
>  
> +	if (cert->self_signed) {
> +		if (!cert->sig->auth_ids[0]) {
> +			/* Duplicate cert->id */
> +			kid = asymmetric_key_generate_id(cert->raw_serial,
> +							 cert->raw_serial_size,
> +							 cert->raw_issuer,
> +							 cert->raw_issuer_size);
> +			cert->sig->auth_ids[0] = kid;
> +		}
> +
> +		if (!cert->sig->auth_ids[1] && cert->skid) {
> +			/* Duplicate cert->skid */
> +			kid = asymmetric_key_generate_id(cert->raw_skid,
> +							 cert->raw_skid_size,
> +							 "", 0);
> +			cert->sig->auth_ids[1] = kid;
> +		}
> +	}
> +
>  	kfree(ctx);
>  	return cert;
>  
> -- 
> 2.20.1
> 
> 

/Jarkko
