Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AFECA323BB0
	for <lists+keyrings@lfdr.de>; Wed, 24 Feb 2021 12:57:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235186AbhBXL5T (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 24 Feb 2021 06:57:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235217AbhBXL4J (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 24 Feb 2021 06:56:09 -0500
Received: from smtp-8fac.mail.infomaniak.ch (smtp-8fac.mail.infomaniak.ch [IPv6:2001:1600:4:17::8fac])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F701C06174A
        for <keyrings@vger.kernel.org>; Wed, 24 Feb 2021 03:55:23 -0800 (PST)
Received: from smtp-3-0000.mail.infomaniak.ch (unknown [10.4.36.107])
        by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4DlvVs3zfBzMpnfH;
        Wed, 24 Feb 2021 12:55:17 +0100 (CET)
Received: from ns3096276.ip-94-23-54.eu (unknown [23.97.221.149])
        by smtp-3-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4DlvVr43GRzlh8TN;
        Wed, 24 Feb 2021 12:55:16 +0100 (CET)
Subject: Re: [PATCH] cert: Add kconfig dependency for validate_trust
To:     David Howells <dhowells@redhat.com>,
        Eric Snowberg <eric.snowberg@oracle.com>
Cc:     Jarkko Sakkinen <jarkko@kernel.org>,
        =?UTF-8?Q?Micka=c3=abl_Sala=c3=bcn?= <mic@linux.microsoft.com>,
        David Woodhouse <dwmw2@infradead.org>,
        keyrings@vger.kernel.org, linux-kernel@vger.kernel.org
References: <F6980CA4-737D-416A-BBE3-390CEBA8B192@oracle.com>
 <20210217165058.1336155-1-eric.snowberg@oracle.com>
 <3524595.1614124044@warthog.procyon.org.uk>
 <3731128.1614163916@warthog.procyon.org.uk>
From:   =?UTF-8?Q?Micka=c3=abl_Sala=c3=bcn?= <mic@digikod.net>
Message-ID: <30122760-0492-1f32-cb37-7d2f84560cab@digikod.net>
Date:   Wed, 24 Feb 2021 12:56:43 +0100
User-Agent: 
MIME-Version: 1.0
In-Reply-To: <3731128.1614163916@warthog.procyon.org.uk>
Content-Type: text/plain; charset=iso-8859-15
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org


On 24/02/2021 11:51, David Howells wrote:
> How about these changes?
> 
> I've added an extra config option to turn on SYSTEM_REVOCATION_LIST support.
> 
> I've also added kerneldoc comments and moved the functions so that they're not
> in the middle of the blacklist-specific stuff.
> 
> I'm not sure uefi_revocation_list_x509() needs conditionalising as the
> optimiser should just inline it if SYSTEM_REVOCATION_LIST=n (assuming __init
> doesn't disable inlining).
> 
> David
> ---
> diff --git a/certs/Kconfig b/certs/Kconfig
> index c94e93d8bccf..76e469b56a77 100644
> --- a/certs/Kconfig
> +++ b/certs/Kconfig
> @@ -83,4 +83,13 @@ config SYSTEM_BLACKLIST_HASH_LIST
>  	  wrapper to incorporate the list into the kernel.  Each <hash> should
>  	  be a string of hex digits.
>  
> +config SYSTEM_REVOCATION_LIST
> +	bool "Provide system-wide ring of revocation certificates"
> +	depends on SYSTEM_BLACKLIST_KEYRING
> +	depends on PKCS7_MESSAGE_PARSER=y

The function verify_pkcs7_message_sig() (which is patched) is only
available if CONFIG_SYSTEM_DATA_VERIFICATION is defined. I suggest to
use the same dependencies as for my dynamic authenticated blacklist
keyring patchset.


> +	help
> +	  If set, this allows revocation certificates to be stored in the
> +	  blacklist keyring and implements a hook whereby a PKCS#7 message can
> +	  be checked to see if it matches such a certificate.
> +
>  endmenu
> diff --git a/certs/blacklist.c b/certs/blacklist.c
> index e9f5fc632f0d..2b8644123d5f 100644
> --- a/certs/blacklist.c
> +++ b/certs/blacklist.c
> @@ -101,38 +101,6 @@ int mark_hash_blacklisted(const char *hash)
>  	return 0;
>  }
>  
> -int add_key_to_revocation_list(const char *data, size_t size)
> -{
> -	key_ref_t key;
> -
> -	key = key_create_or_update(make_key_ref(blacklist_keyring, true),
> -				   "asymmetric",
> -				   NULL,
> -				   data,
> -				   size,
> -				   ((KEY_POS_ALL & ~KEY_POS_SETATTR) | KEY_USR_VIEW),
> -				   KEY_ALLOC_NOT_IN_QUOTA | KEY_ALLOC_BUILT_IN);
> -
> -	if (IS_ERR(key)) {
> -		pr_err("Problem with revocation key (%ld)\n", PTR_ERR(key));
> -		return PTR_ERR(key);
> -	}
> -
> -	return 0;
> -}
> -
> -int is_key_on_revocation_list(struct pkcs7_message *pkcs7)
> -{
> -	int ret;
> -
> -	ret = validate_trust(pkcs7, blacklist_keyring);
> -
> -	if (ret == 0)
> -		return -EKEYREJECTED;
> -
> -	return -ENOKEY;
> -}
> -
>  /**
>   * is_hash_blacklisted - Determine if a hash is blacklisted
>   * @hash: The hash to be checked as a binary blob

Could you please not move those functions? It makes the patch more
readable and avoids merge conflicts (e.g. with the dynamic authenticated
blacklist keyring patchset). Thanks.


> @@ -177,6 +145,49 @@ int is_binary_blacklisted(const u8 *hash, size_t hash_len)
>  }
>  EXPORT_SYMBOL_GPL(is_binary_blacklisted);
>  
> +#ifdef CONFIG_SYSTEM_REVOCATION_LIST
> +/**
> + * add_key_to_revocation_list - Add a revocation certificate to the blacklist
> + * @data: The data blob containing the certificate
> + * @size: The size of data blob
> + */
> +int add_key_to_revocation_list(const char *data, size_t size)
> +{
> +	key_ref_t key;
> +
> +	key = key_create_or_update(make_key_ref(blacklist_keyring, true),
> +				   "asymmetric",
> +				   NULL,
> +				   data,
> +				   size,
> +				   ((KEY_POS_ALL & ~KEY_POS_SETATTR) | KEY_USR_VIEW),
> +				   KEY_ALLOC_NOT_IN_QUOTA | KEY_ALLOC_BUILT_IN);
> +
> +	if (IS_ERR(key)) {
> +		pr_err("Problem with revocation key (%ld)\n", PTR_ERR(key));
> +		return PTR_ERR(key);
> +	}
> +
> +	return 0;
> +}
> +
> +/**
> + * is_key_on_revocation_list - Determine if the key for a PKCS#7 message is revoked
> + * @pkcs7: The PKCS#7 message to check
> + */
> +int is_key_on_revocation_list(struct pkcs7_message *pkcs7)
> +{
> +	int ret;
> +
> +	ret = pkcs7_validate_trust(pkcs7, blacklist_keyring);
> +
> +	if (ret == 0)
> +		return -EKEYREJECTED;
> +
> +	return -ENOKEY;
> +}
> +#endif
> +
>  /*
>   * Initialise the blacklist
>   */
> diff --git a/certs/blacklist.h b/certs/blacklist.h
> index 420bb7c86e07..51b320cf8574 100644
> --- a/certs/blacklist.h
> +++ b/certs/blacklist.h
> @@ -3,13 +3,3 @@
>  #include <crypto/pkcs7.h>
>  
>  extern const char __initconst *const blacklist_hashes[];
> -
> -#ifdef CONFIG_INTEGRITY_PLATFORM_KEYRING
> -#define validate_trust pkcs7_validate_trust
> -#else
> -static inline int validate_trust(struct pkcs7_message *pkcs7,
> -				 struct key *trust_keyring)
> -{
> -	return -ENOKEY;
> -}
> -#endif
> diff --git a/include/keys/system_keyring.h b/include/keys/system_keyring.h
> index 61f98739e8b1..875e002a4180 100644
> --- a/include/keys/system_keyring.h
> +++ b/include/keys/system_keyring.h
> @@ -34,11 +34,9 @@ extern int restrict_link_by_builtin_and_secondary_trusted(
>  extern struct pkcs7_message *pkcs7;
>  #ifdef CONFIG_SYSTEM_BLACKLIST_KEYRING
>  extern int mark_hash_blacklisted(const char *hash);
> -extern int add_key_to_revocation_list(const char *data, size_t size);
>  extern int is_hash_blacklisted(const u8 *hash, size_t hash_len,
>  			       const char *type);
>  extern int is_binary_blacklisted(const u8 *hash, size_t hash_len);
> -extern int is_key_on_revocation_list(struct pkcs7_message *pkcs7);
>  #else
>  static inline int is_hash_blacklisted(const u8 *hash, size_t hash_len,
>  				      const char *type)
> @@ -50,6 +48,12 @@ static inline int is_binary_blacklisted(const u8 *hash, size_t hash_len)
>  {
>  	return 0;
>  }
> +#endif
> +
> +#ifdef CONFIG_SYSTEM_REVOCATION_LIST
> +extern int add_key_to_revocation_list(const char *data, size_t size);
> +extern int is_key_on_revocation_list(struct pkcs7_message *pkcs7);
> +#else
>  static inline int add_key_to_revocation_list(const char *data, size_t size)
>  {
>  	return 0;
> 
