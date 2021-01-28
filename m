Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A5923079DD
	for <lists+keyrings@lfdr.de>; Thu, 28 Jan 2021 16:37:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231134AbhA1Pg2 (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 28 Jan 2021 10:36:28 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:18886 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S231148AbhA1Pg0 (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 28 Jan 2021 10:36:26 -0500
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 10SFVaSV166435;
        Thu, 28 Jan 2021 10:35:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=GiDQ1TkgyPxG+v5wVXYhjJOvThYtDnI+bVif0Z/O0EY=;
 b=ESbyALE+1msPDZ0XPh0dQPt+zOeJeoLI+yFmgd8D72tV108rc/eO6H2NBiPgxa+TjGwF
 jKI+YTNZ36b8pJYRa4kgF1OxEFhmVc0wIuc+rfe5Xyh8ZlS/caQcHp9dnvudL+fCKH26
 Ylg+knTZjWyyUihPzwU1NXiRbq5zBpDgEni+UCvWFtXMyyhYVvUdbFBqid8JN9S0GGWt
 9LUkEM2qQsBVRV22H7UWdbBxwcT/cY/HyGu3dHIWDL4aL4TmlmSM/NvAS4kcxdmB/XEN
 RXC3H32rMgJ3o1VpME2lSq+6RSvMzcOxo2dxEUea/JjrOGj6dJdP0szwQqHowGM5xBur yw== 
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0b-001b2d01.pphosted.com with ESMTP id 36bvdgyqp1-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 28 Jan 2021 10:35:16 -0500
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 10SFW6Nl171796;
        Thu, 28 Jan 2021 10:35:15 -0500
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com [169.47.144.26])
        by mx0b-001b2d01.pphosted.com with ESMTP id 36bvdgyqn2-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 28 Jan 2021 10:35:15 -0500
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
        by ppma04wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 10SFMvYV001640;
        Thu, 28 Jan 2021 15:35:14 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
        by ppma04wdc.us.ibm.com with ESMTP id 36ag3yhamr-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 28 Jan 2021 15:35:13 +0000
Received: from b03ledav006.gho.boulder.ibm.com (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
        by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 10SFZDVv27132226
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 28 Jan 2021 15:35:13 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 02FDAC6057;
        Thu, 28 Jan 2021 15:35:13 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id F2613C6055;
        Thu, 28 Jan 2021 15:35:09 +0000 (GMT)
Received: from li-4b5937cc-25c4-11b2-a85c-cea3a66903e4.ibm.com (unknown [9.65.198.104])
        by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
        Thu, 28 Jan 2021 15:35:09 +0000 (GMT)
Subject: Re: [PATCH v5 1/4] certs: Add EFI_CERT_X509_GUID support for dbx
 entries
To:     Eric Snowberg <eric.snowberg@oracle.com>
Cc:     David Howells <dhowells@redhat.com>, dwmw2@infradead.org,
        Jarkko Sakkinen <jarkko@kernel.org>,
        James.Bottomley@HansenPartnership.com, masahiroy@kernel.org,
        michal.lkml@markovi.net, jmorris@namei.org, serge@hallyn.com,
        ardb@kernel.org, zohar@linux.ibm.com, lszubowi@redhat.com,
        javierm@redhat.com, keyrings@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-security-module@vger.kernel.org
References: <20210122181054.32635-1-eric.snowberg@oracle.com>
 <20210122181054.32635-2-eric.snowberg@oracle.com>
 <399024a1-59fb-12b8-9ea9-9bbee843dbc8@linux.vnet.ibm.com>
 <13EE0575-2F90-4C49-AF5D-365B63D2CB64@oracle.com>
From:   Nayna <nayna@linux.vnet.ibm.com>
Message-ID: <8f0c3b88-872a-bbae-eaa2-1467b6f386a0@linux.vnet.ibm.com>
Date:   Thu, 28 Jan 2021 10:35:09 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <13EE0575-2F90-4C49-AF5D-365B63D2CB64@oracle.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343,18.0.737
 definitions=2021-01-28_08:2021-01-28,2021-01-28 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 lowpriorityscore=0 mlxscore=0 mlxlogscore=999 adultscore=0
 priorityscore=1501 spamscore=0 phishscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2009150000 definitions=main-2101280077
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org


On 1/27/21 11:11 PM, Eric Snowberg wrote:
>> On Jan 27, 2021, at 8:54 PM, Nayna <nayna@linux.vnet.ibm.com> wrote:
>>
>>
>> On 1/22/21 1:10 PM, Eric Snowberg wrote:
>>> This fixes CVE-2020-26541.
>>>
>>> The Secure Boot Forbidden Signature Database, dbx, contains a list of now
>>> revoked signatures and keys previously approved to boot with UEFI Secure
>>> Boot enabled.  The dbx is capable of containing any number of
>>> EFI_CERT_X509_SHA256_GUID, EFI_CERT_SHA256_GUID, and EFI_CERT_X509_GUID
>>> entries.
>>>
>>> Currently when EFI_CERT_X509_GUID are contained in the dbx, the entries are
>>> skipped.
>>>
>>> Add support for EFI_CERT_X509_GUID dbx entries. When a EFI_CERT_X509_GUID
>>> is found, it is added as an asymmetrical key to the .blacklist keyring.
>>> Anytime the .platform keyring is used, the keys in the .blacklist keyring
>>> are referenced, if a matching key is found, the key will be rejected.
>>>
>>> Signed-off-by: Eric Snowberg <eric.snowberg@oracle.com>
>>> Reviewed-by: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
>>> Signed-off-by: David Howells <dhowells@redhat.com>
>>> ---
>>> v5: Function name changes done by David Howells
>>> ---
>>>   certs/blacklist.c                             | 32 +++++++++++++++++++
>>>   certs/blacklist.h                             | 12 +++++++
>>>   certs/system_keyring.c                        |  6 ++++
>>>   include/keys/system_keyring.h                 | 11 +++++++
>>>   .../platform_certs/keyring_handler.c          | 11 +++++++
>>>   5 files changed, 72 insertions(+)
>>>
>>> diff --git a/certs/blacklist.c b/certs/blacklist.c
>>> index 6514f9ebc943..a7f021878a4b 100644
>>> --- a/certs/blacklist.c
>>> +++ b/certs/blacklist.c
>>> @@ -100,6 +100,38 @@ int mark_hash_blacklisted(const char *hash)
>>>   	return 0;
>>>   }
>>>
>>> +int add_key_to_revocation_list(const char *data, size_t size)
>>> +{
>>> +	key_ref_t key;
>>> +
>>> +	key = key_create_or_update(make_key_ref(blacklist_keyring, true),
>>> +				   "asymmetric",
>>> +				   NULL,
>>> +				   data,
>>> +				   size,
>>> +				   ((KEY_POS_ALL & ~KEY_POS_SETATTR) | KEY_USR_VIEW),
>>> +				   KEY_ALLOC_NOT_IN_QUOTA | KEY_ALLOC_BUILT_IN);
>>> +
>>> +	if (IS_ERR(key)) {
>>> +		pr_err("Problem with revocation key (%ld)\n", PTR_ERR(key));
>>> +		return PTR_ERR(key);
>>> +	}
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +int is_key_on_revocation_list(struct pkcs7_message *pkcs7)
>>> +{
>>> +	int ret;
>>> +
>>> +	ret = validate_trust(pkcs7, blacklist_keyring);
>>> +
>>> +	if (ret == 0)
>>> +		return -EKEYREJECTED;
>>> +
>>> +	return -ENOKEY;
>>> +}
>>> +
>>>   /**
>>>    * is_hash_blacklisted - Determine if a hash is blacklisted
>>>    * @hash: The hash to be checked as a binary blob
>>> diff --git a/certs/blacklist.h b/certs/blacklist.h
>>> index 1efd6fa0dc60..420bb7c86e07 100644
>>> --- a/certs/blacklist.h
>>> +++ b/certs/blacklist.h
>>> @@ -1,3 +1,15 @@
>>>   #include <linux/kernel.h>
>>> +#include <linux/errno.h>
>>> +#include <crypto/pkcs7.h>
>>>
>>>   extern const char __initconst *const blacklist_hashes[];
>>> +
>>> +#ifdef CONFIG_INTEGRITY_PLATFORM_KEYRING
>>> +#define validate_trust pkcs7_validate_trust
>>> +#else
>>> +static inline int validate_trust(struct pkcs7_message *pkcs7,
>>> +				 struct key *trust_keyring)
>>> +{
>>> +	return -ENOKEY;
>>> +}
>>> +#endif
>>> diff --git a/certs/system_keyring.c b/certs/system_keyring.c
>>> index 798291177186..cc165b359ea3 100644
>>> --- a/certs/system_keyring.c
>>> +++ b/certs/system_keyring.c
>>> @@ -241,6 +241,12 @@ int verify_pkcs7_message_sig(const void *data, size_t len,
>>>   			pr_devel("PKCS#7 platform keyring is not available\n");
>>>   			goto error;
>>>   		}
>>> +
>>> +		ret = is_key_on_revocation_list(pkcs7);
>>> +		if (ret != -ENOKEY) {
>>> +			pr_devel("PKCS#7 platform key is on revocation list\n");
>>> +			goto error;
>>> +		}
>>>   	}
>>>   	ret = pkcs7_validate_trust(pkcs7, trusted_keys);
>>>   	if (ret < 0) {
>>> diff --git a/include/keys/system_keyring.h b/include/keys/system_keyring.h
>>> index fb8b07daa9d1..61f98739e8b1 100644
>>> --- a/include/keys/system_keyring.h
>>> +++ b/include/keys/system_keyring.h
>>> @@ -31,11 +31,14 @@ extern int restrict_link_by_builtin_and_secondary_trusted(
>>>   #define restrict_link_by_builtin_and_secondary_trusted restrict_link_by_builtin_trusted
>>>   #endif
>>>
>>> +extern struct pkcs7_message *pkcs7;
>>>   #ifdef CONFIG_SYSTEM_BLACKLIST_KEYRING
>>>   extern int mark_hash_blacklisted(const char *hash);
>>> +extern int add_key_to_revocation_list(const char *data, size_t size);
>>>   extern int is_hash_blacklisted(const u8 *hash, size_t hash_len,
>>>   			       const char *type);
>>>   extern int is_binary_blacklisted(const u8 *hash, size_t hash_len);
>>> +extern int is_key_on_revocation_list(struct pkcs7_message *pkcs7);
>>>   #else
>>>   static inline int is_hash_blacklisted(const u8 *hash, size_t hash_len,
>>>   				      const char *type)
>>> @@ -47,6 +50,14 @@ static inline int is_binary_blacklisted(const u8 *hash, size_t hash_len)
>>>   {
>>>   	return 0;
>>>   }
>>> +static inline int add_key_to_revocation_list(const char *data, size_t size)
>>> +{
>>> +	return 0;
>>> +}
>>> +static inline int is_key_on_revocation_list(struct pkcs7_message *pkcs7)
>>> +{
>>> +	return -ENOKEY;
>>> +}
>>>   #endif
>>>
>>>   #ifdef CONFIG_IMA_BLACKLIST_KEYRING
>>> diff --git a/security/integrity/platform_certs/keyring_handler.c b/security/integrity/platform_certs/keyring_handler.c
>>> index c5ba695c10e3..5604bd57c990 100644
>>> --- a/security/integrity/platform_certs/keyring_handler.c
>>> +++ b/security/integrity/platform_certs/keyring_handler.c
>>> @@ -55,6 +55,15 @@ static __init void uefi_blacklist_binary(const char *source,
>>>   	uefi_blacklist_hash(source, data, len, "bin:", 4);
>>>   }
>>>
>>> +/*
>>> + * Add an X509 cert to the revocation list.
>>> + */
>>> +static __init void uefi_revocation_list_x509(const char *source,
>>> +					     const void *data, size_t len)
>>> +{
>>> +	add_key_to_revocation_list(data, len);
>>> +}
>> In keeping the naming convention with other functions that blacklist hashes, why can't we call these functions:
>>
>> * uefi_revocation_list_x509() -> uefi_blacklist_x509_cert()
>> * add_key_to_revocation_list() -> uefi_blacklist_cert()
>> * is_key_on_revocation_list() -> is_cert_blacklisted()
> The word revocation was used do to the updated Linux coding style:
>
> https://lkml.org/lkml/2020/7/4/229
>
>
Thanks Eric for clarifying. I was confusing it with with the broader 
meaning of revocation i.e. certificate revocation list. To avoid similar 
confusion in the future, I wonder if we should call it as 'blocklist' or 
'denylist' as suggested in the document. This is to avoid conflicts with 
actual CRL support if added in the future. I also wonder if we should 
add the clarification in the patch description.

Thanks & Regards,

        - Nayna


