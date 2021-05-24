Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2443E38F4F6
	for <lists+keyrings@lfdr.de>; Mon, 24 May 2021 23:33:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233353AbhEXVfF (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Mon, 24 May 2021 17:35:05 -0400
Received: from mail.kernel.org ([198.145.29.99]:43994 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232911AbhEXVfF (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Mon, 24 May 2021 17:35:05 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1AA206140A;
        Mon, 24 May 2021 21:33:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621892016;
        bh=WBD2e9btmxzFICv0BVxtiErmuAMyfocstBLKIppfHWY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=p2MYVMlcO1FbZIp10u3/ossHfO/cul/EMEiUkkbpFmjwRE4HjIcLp/V6ZArMhd5Zv
         KVijKoFqmbMrg5q1P8e9E6vSjNAEGPPyM0HSpGVKgDgkcQMMC/Vsgdr90jLhVJamUg
         81kxjVY0cO1RS/ux6EobSoYgBlJsC9Aix/s854D46UXC2pxdxFWR48xJgWflXCfDjH
         fPmcryCWaHwaE4hzhRovn+LnGJOySE0bdWB8ClQDh7PmJlpz/j6l3ZCX4AxaufnOuC
         MZkDxQ9a1GGy8kE3yvwZUggk2IKVWgY0aa0YCvZc6fXiBgP7dKxl13hqDWOuoOrfV5
         VUbqMJrCIjj5w==
Date:   Tue, 25 May 2021 00:33:34 +0300
From:   Jarkko Sakkinen <jarkko@kernel.org>
To:     "Lee, Chun-Yi" <joeyli.kernel@gmail.com>
Cc:     David Howells <dhowells@redhat.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S . Miller" <davem@davemloft.net>,
        Ben Boeckel <me@benboeckel.net>,
        Randy Dunlap <rdunlap@infradead.org>,
        Malte Gell <malte.gell@gmx.de>,
        Varad Gautam <varad.gautam@suse.com>, keyrings@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
        "Lee, Chun-Yi" <jlee@suse.com>
Subject: Re: [PATCH v8,1/4] X.509: Add CodeSigning extended key usage parsing
Message-ID: <YKwbrlXGePkinTHb@kernel.org>
References: <20210524021540.18736-1-jlee@suse.com>
 <20210524021540.18736-2-jlee@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210524021540.18736-2-jlee@suse.com>
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Mon, May 24, 2021 at 10:15:37AM +0800, Lee, Chun-Yi wrote:
> This patch adds the logic for parsing the CodeSign extended key usage
> extension in X.509. The parsing result will be set to the eku flag
> which is carried by public key. It can be used in the PKCS#7
> verification.
> 
> Signed-off-by: "Lee, Chun-Yi" <jlee@suse.com>
> ---
>  crypto/asymmetric_keys/x509_cert_parser.c | 25 +++++++++++++++++++++++++
>  include/crypto/public_key.h               |  1 +
>  include/linux/oid_registry.h              |  5 +++++
>  3 files changed, 31 insertions(+)
> 
> diff --git a/crypto/asymmetric_keys/x509_cert_parser.c b/crypto/asymmetric_keys/x509_cert_parser.c
> index 6d003096b5bc..996db9419474 100644
> --- a/crypto/asymmetric_keys/x509_cert_parser.c
> +++ b/crypto/asymmetric_keys/x509_cert_parser.c
> @@ -542,6 +542,8 @@ int x509_process_extension(void *context, size_t hdrlen,
>  	struct x509_parse_context *ctx = context;
>  	struct asymmetric_key_id *kid;
>  	const unsigned char *v = value;
> +	int i = 0;
> +	enum OID oid;
>  
>  	pr_debug("Extension: %u\n", ctx->last_oid);
>  
> @@ -571,6 +573,29 @@ int x509_process_extension(void *context, size_t hdrlen,
>  		return 0;
>  	}
>  
> +	if (ctx->last_oid == OID_extKeyUsage) {
> +		if (vlen < 2 ||
> +		    v[0] != ((ASN1_UNIV << 6) | ASN1_CONS_BIT | ASN1_SEQ) ||
> +		    v[1] != vlen - 2)
> +			return -EBADMSG;
> +		i += 2;
> +
> +		while (i < vlen) {
> +			/* A 10 bytes EKU OID Octet blob =
> +			 * ASN1_OID + size byte + 8 bytes OID */
> +			if ((i + 10) > vlen || v[i] != ASN1_OID || v[i + 1] != 8)
> +				return -EBADMSG;
> +
> +			oid = look_up_OID(v + i + 2, v[i + 1]);
> +			if (oid == OID_codeSigning) {
> +				ctx->cert->pub->eku |= EKU_codeSigning;
> +			}
> +			i += 10;
> +		}
> +		pr_debug("extKeyUsage: %d\n", ctx->cert->pub->eku);
> +		return 0;
> +	}
> +
>  	return 0;
>  }
>  
> diff --git a/include/crypto/public_key.h b/include/crypto/public_key.h
> index 47accec68cb0..1ccaebe2a28b 100644
> --- a/include/crypto/public_key.h
> +++ b/include/crypto/public_key.h
> @@ -28,6 +28,7 @@ struct public_key {
>  	bool key_is_private;
>  	const char *id_type;
>  	const char *pkey_algo;
> +	unsigned int eku : 9;      /* Extended Key Usage (9-bit) */

Why no just name it ext_key_usage? I get the use of "EKU" elsewhere
but not in the variable name. Now you have to remember too much
context when just looking at this (and it's even undocumented to
add that).

>  };
>  
>  extern void public_key_free(struct public_key *key);
> diff --git a/include/linux/oid_registry.h b/include/linux/oid_registry.h
> index 461b7aa587ba..8c8935f0eb73 100644
> --- a/include/linux/oid_registry.h
> +++ b/include/linux/oid_registry.h
> @@ -125,9 +125,14 @@ enum OID {
>  	OID_TPMImportableKey,		/* 2.23.133.10.1.4 */
>  	OID_TPMSealedData,		/* 2.23.133.10.1.5 */
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
>  extern int parse_OID(const void *data, size_t datasize, enum OID *oid);
>  extern int sprint_oid(const void *, size_t, char *, size_t);
> -- 
> 2.16.4
> 
>005diaq6539262 


/Jarkko
