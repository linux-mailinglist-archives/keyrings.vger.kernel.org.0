Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21A2A2FE312
	for <lists+keyrings@lfdr.de>; Thu, 21 Jan 2021 07:42:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728926AbhATXnL (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 20 Jan 2021 18:43:11 -0500
Received: from mail.kernel.org ([198.145.29.99]:48710 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726189AbhATXle (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Wed, 20 Jan 2021 18:41:34 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 319492360D;
        Wed, 20 Jan 2021 23:40:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1611186053;
        bh=5ltyCuNfiUE9KRiJ8HW3CLWIbAjZ0q9Wk+JTvdTQgWs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=X9I4sy6Of1lMfYxINnVZu1UeYGGQAXahf1FcBiuaQta/L2fwHejCjspkH6Ub8Q6a0
         ScqliR8ACPQRKFE8AfThrQZXS5kaKfo60+OVYA8Rlhv2bpyoG7gR1JAsLPluWbyQnZ
         +Fynx8LyUfsDmzdpwmGqRCdVQkyEKt69fyCHO9HBoNiMWewZdg9kHeIPjbdtnHiKPv
         +BXUHg7OeQdyPP0rSXe6A84K/lYQzuopI9Amwg7sNjnePwaxiE1/PS7WMimjjwe17c
         QXkUXwBO4mXsxB78DTcf+Ab1CrDRU/PWiCVAqNaAV227Vh/eUZtULtt5jmre1Lz5fH
         89Eb+elO6cN3g==
Date:   Thu, 21 Jan 2021 01:40:48 +0200
From:   Jarkko Sakkinen <jarkko@kernel.org>
To:     "Lee, Chun-Yi" <joeyli.kernel@gmail.com>
Cc:     David Howells <dhowells@redhat.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S . Miller" <davem@davemloft.net>,
        Ben Boeckel <me@benboeckel.net>,
        Randy Dunlap <rdunlap@infradead.org>,
        Malte Gell <malte.gell@gmx.de>, keyrings@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
        "Lee, Chun-Yi" <jlee@suse.com>
Subject: Re: [PATCH 1/4] X.509: Add CodeSigning extended key usage parsing
Message-ID: <YAi/gERomykYZqKZ@kernel.org>
References: <20210120090517.23851-1-jlee@suse.com>
 <20210120090517.23851-2-jlee@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210120090517.23851-2-jlee@suse.com>
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Wed, Jan 20, 2021 at 05:05:14PM +0800, Lee, Chun-Yi wrote:
> This patch adds the logic for parsing the CodeSign extended key usage
> extension in X.509. The parsing result will be set to the eku flag
> which is carried by public key. It can be used in the PKCS#7
> verification.
> 
> Signed-off-by: "Lee, Chun-Yi" <jlee@suse.com>
> ---
>  crypto/asymmetric_keys/x509_cert_parser.c | 24 ++++++++++++++++++++++++
>  include/crypto/public_key.h               |  1 +
>  include/linux/oid_registry.h              |  5 +++++
>  3 files changed, 30 insertions(+)
> 
> diff --git a/crypto/asymmetric_keys/x509_cert_parser.c b/crypto/asymmetric_keys/x509_cert_parser.c
> index 52c9b455fc7d..65721313b265 100644
> --- a/crypto/asymmetric_keys/x509_cert_parser.c
> +++ b/crypto/asymmetric_keys/x509_cert_parser.c
> @@ -497,6 +497,8 @@ int x509_process_extension(void *context, size_t hdrlen,
>  	struct x509_parse_context *ctx = context;
>  	struct asymmetric_key_id *kid;
>  	const unsigned char *v = value;
> +	int i = 0;
> +	enum OID oid;
>  
>  	pr_debug("Extension: %u\n", ctx->last_oid);
>  
> @@ -526,6 +528,28 @@ int x509_process_extension(void *context, size_t hdrlen,
>  		return 0;
>  	}
>  
> +	if (ctx->last_oid == OID_extKeyUsage) {
> +		if (v[0] != ((ASN1_UNIV << 6) | ASN1_CONS_BIT | ASN1_SEQ) ||
> +		    v[1] != vlen - 2)
> +			return -EBADMSG;
> +		i += 2;
> +
> +		while (i < vlen) {
> +			/* A 10 bytes EKU OID Octet blob =
> +			 * ASN1_OID + size byte + 8 bytes OID */
> +			if (v[i] != ASN1_OID || v[i + 1] != 8 || (i + 10) > vlen)
> +				return -EBADMSG;
> +
> +			oid = look_up_OID(v + i + 2, v[i + 1]);
> +			if (oid == OID_codeSigning) {
> +				ctx->cert->pub->eku |= EKU_codeSigning;
> +			}
> +			i += 10;
> +		}
> +		pr_debug("extKeyUsage: %d\n", ctx->cert->pub->eku);

With eBPF around, does this make any sense?

/Jarkko

> +		return 0;
> +	}
> +
>  	return 0;
>  }
>  
> diff --git a/include/crypto/public_key.h b/include/crypto/public_key.h
> index 948c5203ca9c..07a1b28460a2 100644
> --- a/include/crypto/public_key.h
> +++ b/include/crypto/public_key.h
> @@ -29,6 +29,7 @@ struct public_key {
>  	bool key_is_private;
>  	const char *id_type;
>  	const char *pkey_algo;
> +	unsigned int eku : 9;      /* Extended Key Usage (9-bit) */
>  };
>  
>  extern void public_key_free(struct public_key *key);
> diff --git a/include/linux/oid_registry.h b/include/linux/oid_registry.h
> index 4462ed2c18cd..e20e8eb53b21 100644
> --- a/include/linux/oid_registry.h
> +++ b/include/linux/oid_registry.h
> @@ -113,9 +113,14 @@ enum OID {
>  	OID_SM2_with_SM3,		/* 1.2.156.10197.1.501 */
>  	OID_sm3WithRSAEncryption,	/* 1.2.156.10197.1.504 */
>  
> +	/* Extended key purpose OIDs [RFC 5280] */
> +	OID_codeSigning,		/* 1.3.6.1.5.5.7.3.3 */
> +
>  	OID__NR
>  };
>  
> +#define EKU_codeSigning	(1 << 2)
> +
>  extern enum OID look_up_OID(const void *data, size_t datasize);
>  extern int sprint_oid(const void *, size_t, char *, size_t);
>  extern int sprint_OID(enum OID, char *, size_t);
> -- 
> 2.16.4
> 
> 
