Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A79025E41F
	for <lists+keyrings@lfdr.de>; Sat,  5 Sep 2020 01:21:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728269AbgIDXVG (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Fri, 4 Sep 2020 19:21:06 -0400
Received: from userp2130.oracle.com ([156.151.31.86]:59760 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728249AbgIDXVF (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Fri, 4 Sep 2020 19:21:05 -0400
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 084NG2LG132422;
        Fri, 4 Sep 2020 23:20:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to;
 s=corp-2020-01-29; bh=3U+AWzZ3VOvj5CDDuDWGs0DpY0EazstKv2374JGKZMQ=;
 b=bjrYzJsHfZVC4SlZKC/XSIwbMSDXq0tVME7GYOCMuDH/ikV9WyNsu2KPzDlF2+uOtJGr
 NN7mo3hCWdLhJm1SmsUDfm0tGl6/OL4eCUIEvDgUoUKiLfQIx+R/wdyFaC/BOjIniJ0f
 Q7rPTNG5e6C05tJZEGhjASB+DKJck5xyRP+9I8+V5nfkDpz/oouHVi0/hj3hJoPkcMyE
 rZsE1eKKr8YufTnN68jSjC1X9O9Q6Y2aazgEuXZ2K5VTomnw5TEQlcRPchEhZPZ0YiWc
 oXhi5/0CdCgA7aZXaTr7D5qEiK/6Z6li9fgJ7vp0wh+YhCuwQSwdDivpO7cv/dXMLORs JA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by userp2130.oracle.com with ESMTP id 337eerguwj-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 04 Sep 2020 23:20:38 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 084NFEM4103386;
        Fri, 4 Sep 2020 23:20:38 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by userp3020.oracle.com with ESMTP id 33bhs5an24-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 04 Sep 2020 23:20:38 +0000
Received: from abhmp0018.oracle.com (abhmp0018.oracle.com [141.146.116.24])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 084NKK3c016818;
        Fri, 4 Sep 2020 23:20:21 GMT
Received: from dhcp-10-65-147-1.vpn.oracle.com (/10.65.147.1)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Fri, 04 Sep 2020 16:20:20 -0700
Content-Type: text/plain; charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Subject: Re: [RFC PATCH] certs: Add EFI_CERT_X509_GUID support for dbx
 entries]
From:   Eric Snowberg <eric.snowberg@oracle.com>
In-Reply-To: <20200904125931.GE39023@linux.intel.com>
Date:   Fri, 4 Sep 2020 17:20:17 -0600
Cc:     dhowells@redhat.com, dwmw2@infradead.org, jmorris@namei.org,
        serge@hallyn.com, Mimi Zohar <zohar@linux.ibm.com>,
        erichte@linux.ibm.com, nayna@linux.ibm.com, mpe@ellerman.id.au,
        keyrings@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-security-module@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <D842021F-3054-45FC-8519-9DF5A85AFC37@oracle.com>
References: <20200901165143.10295-1-eric.snowberg@oracle.com>
 <20200904125931.GE39023@linux.intel.com>
To:     Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
X-Mailer: Apple Mail (2.3273)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9734 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxscore=0 bulkscore=0
 mlxlogscore=999 spamscore=0 adultscore=0 suspectscore=3 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2009040196
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9734 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 adultscore=0 spamscore=0 mlxscore=0
 phishscore=0 impostorscore=0 mlxlogscore=999 bulkscore=0 suspectscore=3
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2009040196
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org


> On Sep 4, 2020, at 6:59 AM, Jarkko Sakkinen =
<jarkko.sakkinen@linux.intel.com> wrote:
>=20
> On Tue, Sep 01, 2020 at 12:51:43PM -0400, Eric Snowberg wrote:
>> The Secure Boot Forbidden Signature Database, dbx, contains a list of =
now
>> revoked signatures and keys previously approved to boot with UEFI =
Secure
>> Boot enabled.  The dbx is capable of containing any number of
>> EFI_CERT_X509_SHA256_GUID, EFI_CERT_SHA256_GUID, and =
EFI_CERT_X509_GUID
>> entries.
>>=20
>> Currently when EFI_CERT_X509_GUID are contained in the dbx, the =
entries are
>> skipped.
>>=20
>> This change adds support for EFI_CERT_X509_GUID dbx entries. When a
>> EFI_CERT_X509_GUID is found, it is added as an asymmetrical key to =
the
>> .blacklist keyring.  Anytime the .platform keyring is used, the keys =
in
>> the .blacklist keyring are referenced, if a matching key is found, =
the
>> key will be rejected.
>>=20
>> Signed-off-by: Eric Snowberg <eric.snowberg@oracle.com>
>=20
> In the last paragraph, please use imperative form: "Add support for =
=E2=80=A6".

I will change this in V2.

>=20
>> ---
>> certs/blacklist.c                             | 36 =
+++++++++++++++++++
>> certs/system_keyring.c                        |  6 ++++
>> include/keys/system_keyring.h                 | 11 ++++++
>> .../platform_certs/keyring_handler.c          | 11 ++++++
>> 4 files changed, 64 insertions(+)
>>=20
>> diff --git a/certs/blacklist.c b/certs/blacklist.c
>> index 6514f9ebc943..17ebf50cf0ae 100644
>> --- a/certs/blacklist.c
>> +++ b/certs/blacklist.c
>> @@ -15,6 +15,7 @@
>> #include <linux/err.h>
>> #include <linux/seq_file.h>
>> #include <keys/system_keyring.h>
>> +#include <crypto/pkcs7.h>
>> #include "blacklist.h"
>>=20
>> static struct key *blacklist_keyring;
>> @@ -100,6 +101,41 @@ int mark_hash_blacklisted(const char *hash)
>> 	return 0;
>> }
>>=20
>> +int mark_key_revocationlisted(const char *data, size_t size)
>> +{
>> +	key_ref_t key;
>> +
>> +	key =3D key_create_or_update(make_key_ref(blacklist_keyring, =
true),
>> +				   "asymmetric",
>> +				   NULL,
>> +				   data,
>> +				   size,
>> +				   ((KEY_POS_ALL & ~KEY_POS_SETATTR) |
>> +				    KEY_USR_VIEW),
>> +				   KEY_ALLOC_NOT_IN_QUOTA |
>> +				   KEY_ALLOC_BUILT_IN);
>> +
>> +	if (IS_ERR(key)) {
>> +		pr_err("Problem with revocation key (%ld)\n", =
PTR_ERR(key));
>> +		return PTR_ERR(key);
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +int is_key_revocationlisted(struct pkcs7_message *pkcs7)
>> +{
>> +	int ret;
>> +
>> +	ret =3D pkcs7_validate_trust(pkcs7, blacklist_keyring);
>> +
>> +	if (ret =3D=3D 0)
>> +		return -EKEYREJECTED;
>> +
>> +	return -ENOKEY;
>> +}
>> +EXPORT_SYMBOL_GPL(is_key_revocationlisted);
>> +
>> /**
>>  * is_hash_blacklisted - Determine if a hash is blacklisted
>>  * @hash: The hash to be checked as a binary blob
>> diff --git a/certs/system_keyring.c b/certs/system_keyring.c
>> index 798291177186..f8ea96219155 100644
>> --- a/certs/system_keyring.c
>> +++ b/certs/system_keyring.c
>> @@ -241,6 +241,12 @@ int verify_pkcs7_message_sig(const void *data, =
size_t len,
>> 			pr_devel("PKCS#7 platform keyring is not =
available\n");
>> 			goto error;
>> 		}
>> +
>> +		ret =3D is_key_revocationlisted(pkcs7);
>> +		if (ret !=3D -ENOKEY) {
>> +			pr_devel("PKCS#7 platform key =
revocationlisted\n");
>> +			goto error;
>> +		}
>> 	}
>> 	ret =3D pkcs7_validate_trust(pkcs7, trusted_keys);
>> 	if (ret < 0) {
>> diff --git a/include/keys/system_keyring.h =
b/include/keys/system_keyring.h
>> index fb8b07daa9d1..b6991cfe1b6d 100644
>> --- a/include/keys/system_keyring.h
>> +++ b/include/keys/system_keyring.h
>> @@ -31,11 +31,14 @@ extern int =
restrict_link_by_builtin_and_secondary_trusted(
>> #define restrict_link_by_builtin_and_secondary_trusted =
restrict_link_by_builtin_trusted
>> #endif
>>=20
>> +extern struct pkcs7_message *pkcs7;
>> #ifdef CONFIG_SYSTEM_BLACKLIST_KEYRING
>> extern int mark_hash_blacklisted(const char *hash);
>> +extern int mark_key_revocationlisted(const char *data, size_t size);
>> extern int is_hash_blacklisted(const u8 *hash, size_t hash_len,
>> 			       const char *type);
>> extern int is_binary_blacklisted(const u8 *hash, size_t hash_len);
>> +extern int is_key_revocationlisted(struct pkcs7_message *pkcs7);
>> #else
>> static inline int is_hash_blacklisted(const u8 *hash, size_t =
hash_len,
>> 				      const char *type)
>> @@ -47,6 +50,14 @@ static inline int is_binary_blacklisted(const u8 =
*hash, size_t hash_len)
>> {
>> 	return 0;
>> }
>> +static inline int mark_key_revocationlisted(const char *data, size_t =
size)
>> +{
>> +	return 0;
>> +}
>> +static inline int is_key_revocationlisted(struct pkcs7_message =
*pkcs7)
>> +{
>> +	return -ENOKEY;
>> +}
>> #endif
>>=20
>> #ifdef CONFIG_IMA_BLACKLIST_KEYRING
>> diff --git a/security/integrity/platform_certs/keyring_handler.c =
b/security/integrity/platform_certs/keyring_handler.c
>> index c5ba695c10e3..cc5a43804bc4 100644
>> --- a/security/integrity/platform_certs/keyring_handler.c
>> +++ b/security/integrity/platform_certs/keyring_handler.c
>> @@ -55,6 +55,15 @@ static __init void uefi_blacklist_binary(const =
char *source,
>> 	uefi_blacklist_hash(source, data, len, "bin:", 4);
>> }
>>=20
>> +/*
>> + * Revocationlist the X509 cert
>> + */
>> +static __init void uefi_revocationlist_x509(const char *source,
>> +					    const void *data, size_t =
len)
>> +{
>> +	mark_key_revocationlisted(data, len);
>> +}
>> +
>> /*
>>  * Return the appropriate handler for particular signature list types =
found in
>>  * the UEFI db and MokListRT tables.
>> @@ -76,5 +85,7 @@ __init efi_element_handler_t =
get_handler_for_dbx(const efi_guid_t *sig_type)
>> 		return uefi_blacklist_x509_tbs;
>> 	if (efi_guidcmp(*sig_type, efi_cert_sha256_guid) =3D=3D 0)
>> 		return uefi_blacklist_binary;
>> +	if (efi_guidcmp(*sig_type, efi_cert_x509_guid) =3D=3D 0)
>> +		return uefi_revocationlist_x509;
>> 	return 0;
>> }
>> --=20
>> 2.18.1
>>=20
>=20
> I did not find anything wrong with the code change.

Thanks

