Return-Path: <keyrings+bounces-3922-lists+keyrings=lfdr.de@vger.kernel.org>
Delivered-To: lists+keyrings@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kIwlGEQsdmkVMwEAu9opvQ
	(envelope-from <keyrings+bounces-3922-lists+keyrings=lfdr.de@vger.kernel.org>)
	for <lists+keyrings@lfdr.de>; Sun, 25 Jan 2026 15:44:20 +0100
X-Original-To: lists+keyrings@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8764F810BC
	for <lists+keyrings@lfdr.de>; Sun, 25 Jan 2026 15:44:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 49B3F3004630
	for <lists+keyrings@lfdr.de>; Sun, 25 Jan 2026 14:44:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75E3F3242A5;
	Sun, 25 Jan 2026 14:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rSaUs/uX"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 521E61397;
	Sun, 25 Jan 2026 14:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769352257; cv=none; b=rptMkayY5Uusfx8TQ258M18uyD9tYSbQUsJMfoVJciKfUuhtOc6Blc1xeHjYtNxlDT/fg2eN4ZMyVxxS18EL9qNaqztA1V9QBvxKnqAsf+R58D7KAqkiEPUQ/ymKEoW9s5ke9k4DzwIHRxUYbfKERhvPACmptTYYY6CIP836PgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769352257; c=relaxed/simple;
	bh=aWMBV7bkuKCbXdqOTdGTEoNbK5MxTyT9ecr5TmC2HEI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fuXXKWrl2f0dB0jhIA/3hmpFL38o/xc2HE7kqlcBKXWKFR0IMgfk8UGXc4P5veSba8uwCteGz9AgJflWQpYAlSx+/avrTd3kWMvy/9fBzc1oOtNdmzPPmxMouhb0+eEJAy94KUxZp7XT+0EUeXrR7HVNoQeQkq+Fz7Lb/ir9J8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rSaUs/uX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B703C4CEF1;
	Sun, 25 Jan 2026 14:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769352256;
	bh=aWMBV7bkuKCbXdqOTdGTEoNbK5MxTyT9ecr5TmC2HEI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rSaUs/uXJpSoe0X2+pZdsmxCL0pMCfBsNP7ujs1m3L9TDRdFrgdBh4nIWTkcYyrtV
	 LSxI+BtCYyJTaJ86w9ou/oseoa71YMe8RYWiItRLiqC81Mnj5SxJApmCqcdZyhpakw
	 g0Q8iO6a/WhfzJzbCKjNn11tbO/oRoAJZE4dDdv2Z3HlV1zdI6DfLl1kP3uIYMEf1L
	 fzkOiI380pYBBLLSjLWhEmjSfGc56TA6KSNTRbjEo2ijsuDf7uyZjqpyR/uD/wjXEL
	 Vn5rFnF1FsmuFuStf5vtfVNuRxnC5chYLr6IKyfrKJRe2vh3rCLCEK4mh3n8ry1TbP
	 vuo+E/CC59iog==
Date: Sun, 25 Jan 2026 16:44:12 +0200
From: Jarkko Sakkinen <jarkko@kernel.org>
To: David Howells <dhowells@redhat.com>
Cc: Lukas Wunner <lukas@wunner.de>, Ignat Korchagin <ignat@cloudflare.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Eric Biggers <ebiggers@kernel.org>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Daniel Gomez <da.gomez@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Stephan Mueller <smueller@chronox.de>, linux-crypto@vger.kernel.org,
	keyrings@vger.kernel.org, linux-modules@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v14 5/5] modsign: Enable ML-DSA module signing
Message-ID: <aXYsPF4zhF0TNm7L@kernel.org>
References: <20260121223609.1650735-1-dhowells@redhat.com>
 <20260121223609.1650735-6-dhowells@redhat.com>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260121223609.1650735-6-dhowells@redhat.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-3922-lists,keyrings=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jarkko@kernel.org,keyrings@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[keyrings];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,wunner.de:email,chronox.de:email,cloudflare.com:email,apana.org.au:email]
X-Rspamd-Queue-Id: 8764F810BC
X-Rspamd-Action: no action

On Wed, Jan 21, 2026 at 10:36:07PM +0000, David Howells wrote:
> Allow ML-DSA module signing to be enabled.
> 
> Note that OpenSSL's CMS_*() function suite does not, as of OpenSSL-3.6,
> support the use of CMS_NOATTR with ML-DSA, so the prohibition against using
> signedAttrs with module signing has to be removed.  The selected digest
> then applies only to the algorithm used to calculate the digest stored in
> the messageDigest attribute.  The OpenSSL development branch has patches
> applied that fix this[1], but it appears that that will only be available
> in OpenSSL-4.
> 
> [1] https://github.com/openssl/openssl/pull/28923
> 
> sign-file won't set CMS_NOATTR if openssl is earlier than v4, resulting in
> the use of signed attributes.
> 
> The ML-DSA algorithm takes the raw data to be signed without regard to what
> digest algorithm is specified in the CMS message.  The CMS specified digest
> algorithm is ignored unless signedAttrs are used; in such a case, only
> SHA512 is permitted.
> 
> Signed-off-by: David Howells <dhowells@redhat.com>
> cc: Eric Biggers <ebiggers@kernel.org>
> cc: Lukas Wunner <lukas@wunner.de>
> cc: Ignat Korchagin <ignat@cloudflare.com>
> cc: Stephan Mueller <smueller@chronox.de>
> cc: Herbert Xu <herbert@gondor.apana.org.au>
> cc: keyrings@vger.kernel.org
> cc: linux-crypto@vger.kernel.org
> ---
>  Documentation/admin-guide/module-signing.rst | 16 +++++----
>  certs/Kconfig                                | 30 +++++++++++++++++
>  certs/Makefile                               |  3 ++
>  crypto/asymmetric_keys/pkcs7_verify.c        |  4 ---
>  scripts/sign-file.c                          | 34 +++++++++++++++-----
>  5 files changed, 68 insertions(+), 19 deletions(-)
> 
> diff --git a/Documentation/admin-guide/module-signing.rst b/Documentation/admin-guide/module-signing.rst
> index a8667a777490..7f2f127dc76f 100644
> --- a/Documentation/admin-guide/module-signing.rst
> +++ b/Documentation/admin-guide/module-signing.rst
> @@ -28,10 +28,12 @@ trusted userspace bits.
>  
>  This facility uses X.509 ITU-T standard certificates to encode the public keys
>  involved.  The signatures are not themselves encoded in any industrial standard
> -type.  The built-in facility currently only supports the RSA & NIST P-384 ECDSA
> -public key signing standard (though it is pluggable and permits others to be
> -used).  The possible hash algorithms that can be used are SHA-2 and SHA-3 of
> -sizes 256, 384, and 512 (the algorithm is selected by data in the signature).
> +type.  The built-in facility currently only supports the RSA, NIST P-384 ECDSA
> +and NIST FIPS-204 ML-DSA public key signing standards (though it is pluggable
> +and permits others to be used).  For RSA and ECDSA, the possible hash
> +algorithms that can be used are SHA-2 and SHA-3 of sizes 256, 384, and 512 (the
> +algorithm is selected by data in the signature); ML-DSA does its own hashing,
> +but is allowed to be used with a SHA512 hash for signed attributes.
>  
>  
>  ==========================
> @@ -146,9 +148,9 @@ into vmlinux) using parameters in the::
>  
>  file (which is also generated if it does not already exist).
>  
> -One can select between RSA (``MODULE_SIG_KEY_TYPE_RSA``) and ECDSA
> -(``MODULE_SIG_KEY_TYPE_ECDSA``) to generate either RSA 4k or NIST
> -P-384 keypair.
> +One can select between RSA (``MODULE_SIG_KEY_TYPE_RSA``), ECDSA
> +(``MODULE_SIG_KEY_TYPE_ECDSA``) and ML-DSA (``MODULE_SIG_KEY_TYPE_MLDSA_*``) to
> +generate an RSA 4k, a NIST P-384 keypair or an ML-DSA 44, 65 or 87 keypair.
>  
>  It is strongly recommended that you provide your own x509.genkey file.
>  
> diff --git a/certs/Kconfig b/certs/Kconfig
> index 78307dc25559..2b088ef58373 100644
> --- a/certs/Kconfig
> +++ b/certs/Kconfig
> @@ -39,6 +39,36 @@ config MODULE_SIG_KEY_TYPE_ECDSA
>  	 Note: Remove all ECDSA signing keys, e.g. certs/signing_key.pem,
>  	 when falling back to building Linux 5.14 and older kernels.
>  
> +config MODULE_SIG_KEY_TYPE_MLDSA_44
> +	bool "ML-DSA-44"
> +	select CRYPTO_MLDSA
> +	help
> +	  Use an ML-DSA-44 key (NIST FIPS 204) for module signing.  ML-DSA
> +	  support requires OpenSSL-3.5 minimum; preferably OpenSSL-4+.  With
> +	  the latter, the entire module body will be signed; with the former,
> +	  signedAttrs will be used as it lacks support for CMS_NOATTR with
> +	  ML-DSA.
> +
> +config MODULE_SIG_KEY_TYPE_MLDSA_65
> +	bool "ML-DSA-65"
> +	select CRYPTO_MLDSA
> +	help
> +	  Use an ML-DSA-65 key (NIST FIPS 204) for module signing.  ML-DSA
> +	  support requires OpenSSL-3.5 minimum; preferably OpenSSL-4+.  With
> +	  the latter, the entire module body will be signed; with the former,
> +	  signedAttrs will be used as it lacks support for CMS_NOATTR with
> +	  ML-DSA.
> +
> +config MODULE_SIG_KEY_TYPE_MLDSA_87
> +	bool "ML-DSA-87"
> +	select CRYPTO_MLDSA
> +	help
> +	  Use an ML-DSA-87 key (NIST FIPS 204) for module signing.  ML-DSA
> +	  support requires OpenSSL-3.5 minimum; preferably OpenSSL-4+.  With
> +	  the latter, the entire module body will be signed; with the former,
> +	  signedAttrs will be used as it lacks support for CMS_NOATTR with
> +	  ML-DSA.
> +
>  endchoice
>  
>  config SYSTEM_TRUSTED_KEYRING
> diff --git a/certs/Makefile b/certs/Makefile
> index f6fa4d8d75e0..3ee1960f9f4a 100644
> --- a/certs/Makefile
> +++ b/certs/Makefile
> @@ -43,6 +43,9 @@ targets += x509_certificate_list
>  ifeq ($(CONFIG_MODULE_SIG_KEY),certs/signing_key.pem)
>  
>  keytype-$(CONFIG_MODULE_SIG_KEY_TYPE_ECDSA) := -newkey ec -pkeyopt ec_paramgen_curve:secp384r1
> +keytype-$(CONFIG_MODULE_SIG_KEY_TYPE_MLDSA_44) := -newkey ml-dsa-44
> +keytype-$(CONFIG_MODULE_SIG_KEY_TYPE_MLDSA_65) := -newkey ml-dsa-65
> +keytype-$(CONFIG_MODULE_SIG_KEY_TYPE_MLDSA_87) := -newkey ml-dsa-87
>  
>  quiet_cmd_gen_key = GENKEY  $@
>        cmd_gen_key = openssl req -new -nodes -utf8 -$(CONFIG_MODULE_SIG_HASH) -days 36500 \
> diff --git a/crypto/asymmetric_keys/pkcs7_verify.c b/crypto/asymmetric_keys/pkcs7_verify.c
> index a5b2ed4d53fd..75d1d694dc7b 100644
> --- a/crypto/asymmetric_keys/pkcs7_verify.c
> +++ b/crypto/asymmetric_keys/pkcs7_verify.c
> @@ -431,10 +431,6 @@ int pkcs7_verify(struct pkcs7_message *pkcs7,
>  			pr_warn("Invalid module sig (not pkcs7-data)\n");
>  			return -EKEYREJECTED;
>  		}
> -		if (pkcs7->have_authattrs) {
> -			pr_warn("Invalid module sig (has authattrs)\n");
> -			return -EKEYREJECTED;
> -		}
>  		break;
>  	case VERIFYING_FIRMWARE_SIGNATURE:
>  		if (pkcs7->data_type != OID_data) {
> diff --git a/scripts/sign-file.c b/scripts/sign-file.c
> index 7070245edfc1..547b97097230 100644
> --- a/scripts/sign-file.c
> +++ b/scripts/sign-file.c
> @@ -315,18 +315,36 @@ int main(int argc, char **argv)
>  		ERR(!digest_algo, "EVP_get_digestbyname");
>  
>  #ifndef USE_PKCS7
> +
> +		unsigned int flags =
> +			CMS_NOCERTS |
> +			CMS_PARTIAL |
> +			CMS_BINARY |
> +			CMS_DETACHED |
> +			CMS_STREAM  |
> +			CMS_NOSMIMECAP |
> +			CMS_NO_SIGNING_TIME |
> +			use_keyid;
> +
> +		if ((EVP_PKEY_is_a(private_key, "ML-DSA-44") ||
> +		     EVP_PKEY_is_a(private_key, "ML-DSA-65") ||
> +		     EVP_PKEY_is_a(private_key, "ML-DSA-87")) &&
> +		    OPENSSL_VERSION_MAJOR < 4) {
> +			 /* ML-DSA + CMS_NOATTR is not supported in openssl-3.5
> +			  * and before.
> +			  */
> +			use_signed_attrs = 0;
> +		}
> +
> +		flags |= use_signed_attrs;
> +
>  		/* Load the signature message from the digest buffer. */
> -		cms = CMS_sign(NULL, NULL, NULL, NULL,
> -			       CMS_NOCERTS | CMS_PARTIAL | CMS_BINARY |
> -			       CMS_DETACHED | CMS_STREAM);
> +		cms = CMS_sign(NULL, NULL, NULL, NULL, flags);
>  		ERR(!cms, "CMS_sign");
>  
> -		ERR(!CMS_add1_signer(cms, x509, private_key, digest_algo,
> -				     CMS_NOCERTS | CMS_BINARY |
> -				     CMS_NOSMIMECAP | use_keyid |
> -				     use_signed_attrs),
> +		ERR(!CMS_add1_signer(cms, x509, private_key, digest_algo, flags),
>  		    "CMS_add1_signer");
> -		ERR(CMS_final(cms, bm, NULL, CMS_NOCERTS | CMS_BINARY) != 1,
> +		ERR(CMS_final(cms, bm, NULL, flags) != 1,
>  		    "CMS_final");
>  
>  #else
> 

LGTM

Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>

BR, Jarkko

