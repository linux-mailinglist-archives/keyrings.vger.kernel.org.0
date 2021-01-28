Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5745D306C77
	for <lists+keyrings@lfdr.de>; Thu, 28 Jan 2021 05:50:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229849AbhA1EuP (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 27 Jan 2021 23:50:15 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:6098 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231147AbhA1EuJ (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 27 Jan 2021 23:50:09 -0500
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 10S3X3il002469;
        Wed, 27 Jan 2021 22:54:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=Glvu/YL3wdHcS0QD4BWVaHN5NqyTXmHKknZ5yG0ZdYE=;
 b=rUw9SOf2822b/Kiduol+LHU/OVfgvC+Ce4i10KzSv7QD0RFfV+duJCLJVL7baXvl9swP
 4Qu6eiYJ+zu7VSASaGzY4Yuk3hBZvAnI/7t+JMhtHNlHI4Qd8gsVOHiKAfVlK9lYOsaL
 gLdQC0aa+YDH141hEbW9EGaam01+92ArjhzcZRO4HyYp2xqQPRBycWHhL2BGgU/5kyvT
 PDgqCwp1lAGMf+bbo604CU3tigY3GzMWqI0UG1la6Jy52eLbmKGHnFi0xo7FN4iTEYMW
 rcATdxFXjKMjSyvdN0qyplxETk1n1yYLjCFncUoWZa3YtTLMKiJ/BwvRDULcoHFMnX4D dw== 
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0a-001b2d01.pphosted.com with ESMTP id 36b5brmvdh-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 27 Jan 2021 22:54:05 -0500
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 10S3XDIO003338;
        Wed, 27 Jan 2021 22:54:05 -0500
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com [169.47.144.27])
        by mx0a-001b2d01.pphosted.com with ESMTP id 36b5brmvd0-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 27 Jan 2021 22:54:05 -0500
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
        by ppma05wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 10S3WtQX026891;
        Thu, 28 Jan 2021 03:54:03 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com [9.57.198.27])
        by ppma05wdc.us.ibm.com with ESMTP id 36a3qc1mdy-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 28 Jan 2021 03:54:03 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com [9.57.199.107])
        by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 10S3s3mx28180858
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 28 Jan 2021 03:54:03 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 39BFD124055;
        Thu, 28 Jan 2021 03:54:03 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id CE976124052;
        Thu, 28 Jan 2021 03:54:01 +0000 (GMT)
Received: from li-4b5937cc-25c4-11b2-a85c-cea3a66903e4.ibm.com (unknown [9.65.198.104])
        by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
        Thu, 28 Jan 2021 03:54:01 +0000 (GMT)
Subject: Re: [PATCH v5 1/4] certs: Add EFI_CERT_X509_GUID support for dbx
 entries
To:     Eric Snowberg <eric.snowberg@oracle.com>, dhowells@redhat.com,
        dwmw2@infradead.org, jarkko@kernel.org,
        James.Bottomley@HansenPartnership.com
Cc:     masahiroy@kernel.org, michal.lkml@markovi.net, jmorris@namei.org,
        serge@hallyn.com, ardb@kernel.org, zohar@linux.ibm.com,
        lszubowi@redhat.com, javierm@redhat.com, keyrings@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-security-module@vger.kernel.org
References: <20210122181054.32635-1-eric.snowberg@oracle.com>
 <20210122181054.32635-2-eric.snowberg@oracle.com>
From:   Nayna <nayna@linux.vnet.ibm.com>
Message-ID: <399024a1-59fb-12b8-9ea9-9bbee843dbc8@linux.vnet.ibm.com>
Date:   Wed, 27 Jan 2021 22:54:01 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20210122181054.32635-2-eric.snowberg@oracle.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343,18.0.737
 definitions=2021-01-27_10:2021-01-27,2021-01-27 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 mlxscore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 spamscore=0
 adultscore=0 impostorscore=0 priorityscore=1501 mlxlogscore=999
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101280014
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org


On 1/22/21 1:10 PM, Eric Snowberg wrote:
> This fixes CVE-2020-26541.
>
> The Secure Boot Forbidden Signature Database, dbx, contains a list of now
> revoked signatures and keys previously approved to boot with UEFI Secure
> Boot enabled.  The dbx is capable of containing any number of
> EFI_CERT_X509_SHA256_GUID, EFI_CERT_SHA256_GUID, and EFI_CERT_X509_GUID
> entries.
>
> Currently when EFI_CERT_X509_GUID are contained in the dbx, the entries are
> skipped.
>
> Add support for EFI_CERT_X509_GUID dbx entries. When a EFI_CERT_X509_GUID
> is found, it is added as an asymmetrical key to the .blacklist keyring.
> Anytime the .platform keyring is used, the keys in the .blacklist keyring
> are referenced, if a matching key is found, the key will be rejected.
>
> Signed-off-by: Eric Snowberg <eric.snowberg@oracle.com>
> Reviewed-by: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
> Signed-off-by: David Howells <dhowells@redhat.com>
> ---
> v5: Function name changes done by David Howells
> ---
>   certs/blacklist.c                             | 32 +++++++++++++++++++
>   certs/blacklist.h                             | 12 +++++++
>   certs/system_keyring.c                        |  6 ++++
>   include/keys/system_keyring.h                 | 11 +++++++
>   .../platform_certs/keyring_handler.c          | 11 +++++++
>   5 files changed, 72 insertions(+)
>
> diff --git a/certs/blacklist.c b/certs/blacklist.c
> index 6514f9ebc943..a7f021878a4b 100644
> --- a/certs/blacklist.c
> +++ b/certs/blacklist.c
> @@ -100,6 +100,38 @@ int mark_hash_blacklisted(const char *hash)
>   	return 0;
>   }
>
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
> +int is_key_on_revocation_list(struct pkcs7_message *pkcs7)
> +{
> +	int ret;
> +
> +	ret = validate_trust(pkcs7, blacklist_keyring);
> +
> +	if (ret == 0)
> +		return -EKEYREJECTED;
> +
> +	return -ENOKEY;
> +}
> +
>   /**
>    * is_hash_blacklisted - Determine if a hash is blacklisted
>    * @hash: The hash to be checked as a binary blob
> diff --git a/certs/blacklist.h b/certs/blacklist.h
> index 1efd6fa0dc60..420bb7c86e07 100644
> --- a/certs/blacklist.h
> +++ b/certs/blacklist.h
> @@ -1,3 +1,15 @@
>   #include <linux/kernel.h>
> +#include <linux/errno.h>
> +#include <crypto/pkcs7.h>
>
>   extern const char __initconst *const blacklist_hashes[];
> +
> +#ifdef CONFIG_INTEGRITY_PLATFORM_KEYRING
> +#define validate_trust pkcs7_validate_trust
> +#else
> +static inline int validate_trust(struct pkcs7_message *pkcs7,
> +				 struct key *trust_keyring)
> +{
> +	return -ENOKEY;
> +}
> +#endif
> diff --git a/certs/system_keyring.c b/certs/system_keyring.c
> index 798291177186..cc165b359ea3 100644
> --- a/certs/system_keyring.c
> +++ b/certs/system_keyring.c
> @@ -241,6 +241,12 @@ int verify_pkcs7_message_sig(const void *data, size_t len,
>   			pr_devel("PKCS#7 platform keyring is not available\n");
>   			goto error;
>   		}
> +
> +		ret = is_key_on_revocation_list(pkcs7);
> +		if (ret != -ENOKEY) {
> +			pr_devel("PKCS#7 platform key is on revocation list\n");
> +			goto error;
> +		}
>   	}
>   	ret = pkcs7_validate_trust(pkcs7, trusted_keys);
>   	if (ret < 0) {
> diff --git a/include/keys/system_keyring.h b/include/keys/system_keyring.h
> index fb8b07daa9d1..61f98739e8b1 100644
> --- a/include/keys/system_keyring.h
> +++ b/include/keys/system_keyring.h
> @@ -31,11 +31,14 @@ extern int restrict_link_by_builtin_and_secondary_trusted(
>   #define restrict_link_by_builtin_and_secondary_trusted restrict_link_by_builtin_trusted
>   #endif
>
> +extern struct pkcs7_message *pkcs7;
>   #ifdef CONFIG_SYSTEM_BLACKLIST_KEYRING
>   extern int mark_hash_blacklisted(const char *hash);
> +extern int add_key_to_revocation_list(const char *data, size_t size);
>   extern int is_hash_blacklisted(const u8 *hash, size_t hash_len,
>   			       const char *type);
>   extern int is_binary_blacklisted(const u8 *hash, size_t hash_len);
> +extern int is_key_on_revocation_list(struct pkcs7_message *pkcs7);
>   #else
>   static inline int is_hash_blacklisted(const u8 *hash, size_t hash_len,
>   				      const char *type)
> @@ -47,6 +50,14 @@ static inline int is_binary_blacklisted(const u8 *hash, size_t hash_len)
>   {
>   	return 0;
>   }
> +static inline int add_key_to_revocation_list(const char *data, size_t size)
> +{
> +	return 0;
> +}
> +static inline int is_key_on_revocation_list(struct pkcs7_message *pkcs7)
> +{
> +	return -ENOKEY;
> +}
>   #endif
>
>   #ifdef CONFIG_IMA_BLACKLIST_KEYRING
> diff --git a/security/integrity/platform_certs/keyring_handler.c b/security/integrity/platform_certs/keyring_handler.c
> index c5ba695c10e3..5604bd57c990 100644
> --- a/security/integrity/platform_certs/keyring_handler.c
> +++ b/security/integrity/platform_certs/keyring_handler.c
> @@ -55,6 +55,15 @@ static __init void uefi_blacklist_binary(const char *source,
>   	uefi_blacklist_hash(source, data, len, "bin:", 4);
>   }
>
> +/*
> + * Add an X509 cert to the revocation list.
> + */
> +static __init void uefi_revocation_list_x509(const char *source,
> +					     const void *data, size_t len)
> +{
> +	add_key_to_revocation_list(data, len);
> +}

In keeping the naming convention with other functions that blacklist 
hashes, why can't we call these functions:

* uefi_revocation_list_x509() -> uefi_blacklist_x509_cert()
* add_key_to_revocation_list() -> uefi_blacklist_cert()
* is_key_on_revocation_list() -> is_cert_blacklisted()

Thanks & Regards,

      - Nayna

