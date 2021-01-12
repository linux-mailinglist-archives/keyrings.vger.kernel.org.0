Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF6E82F39CA
	for <lists+keyrings@lfdr.de>; Tue, 12 Jan 2021 20:16:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392591AbhALTOV (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 12 Jan 2021 14:14:21 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:46050 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392228AbhALTOV (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Tue, 12 Jan 2021 14:14:21 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10CJ99GS147156;
        Tue, 12 Jan 2021 19:12:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to;
 s=corp-2020-01-29; bh=25sNARMhFegNfZBuaWy2+FmVLXFGPDPyjhNnYuf8e0I=;
 b=Do/rRp4IyytP1qbWiqltXQntBAccTlJN6ZLg2WxROWDnexJuk8o7NcKmbBVkVixOvq3p
 LrPQRSn7ziwNbIxxLzX9iTksT8b3+dPuqVVrszPRO2I5q/RcTXcXAeucddTSzAu/70b3
 bahXR6OxyV15Oz5/uyxfnWEEV5gN69AKoZxWKCPPMGuarL9d/9CYj/Z83/kB07KN88HQ
 9itH933TjNNFkCXzrYwMZEiWr7A9e0AKWYdQSFickfO2cTcYCn+8vZV3HaDTNxwyZKqd
 snZPIEG8q+mLD6zaUL2qvKTTbhXwykrRynFdrwxOKblk7ndDjq7ZUcIN/ab+zXRbYiUl 8A== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by userp2130.oracle.com with ESMTP id 360kvjyx9n-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 12 Jan 2021 19:12:13 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10CJA4MK106222;
        Tue, 12 Jan 2021 19:12:12 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by aserp3030.oracle.com with ESMTP id 360key8reh-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 12 Jan 2021 19:12:12 +0000
Received: from abhmp0001.oracle.com (abhmp0001.oracle.com [141.146.116.7])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 10CJC438017597;
        Tue, 12 Jan 2021 19:12:04 GMT
Received: from dhcp-10-154-126-151.vpn.oracle.com (/10.154.126.151)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Tue, 12 Jan 2021 11:12:03 -0800
Content-Type: text/plain; charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Subject: Re: [PATCH v4] certs: Add EFI_CERT_X509_GUID support for dbx entries
From:   Eric Snowberg <eric.snowberg@oracle.com>
In-Reply-To: <2560432.1610471400@warthog.procyon.org.uk>
Date:   Tue, 12 Jan 2021 12:13:05 -0700
Cc:     dwmw2@infradead.org,
        Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
        herbert@gondor.apana.org.au, davem@davemloft.net,
        jmorris@namei.org, serge@hallyn.com, nayna@linux.ibm.com,
        Mimi Zohar <zohar@linux.ibm.com>, erichte@linux.ibm.com,
        mpe@ellerman.id.au, keyrings@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
        linux-security-module@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <282F1B46-7B89-4795-B298-DBE639D820D1@oracle.com>
References: <E090372C-06A3-4991-8FC3-F06A0DA60729@oracle.com>
 <20200916004927.64276-1-eric.snowberg@oracle.com>
 <1360578.1607593748@warthog.procyon.org.uk>
 <2560432.1610471400@warthog.procyon.org.uk>
To:     David Howells <dhowells@redhat.com>
X-Mailer: Apple Mail (2.3273)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9862 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 bulkscore=0 malwarescore=0
 suspectscore=0 adultscore=0 spamscore=0 mlxlogscore=999 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101120111
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9862 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 phishscore=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 clxscore=1011 impostorscore=0 spamscore=0 mlxscore=0 suspectscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101120111
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org


> On Jan 12, 2021, at 10:10 AM, David Howells <dhowells@redhat.com> =
wrote:
>=20
> How about the attached?

This looks good to me.

> I've changed the function names to something that I
> think reads better, but otherwise it's the same.

I agree, the function name changes you made sound better.

We are starting to see platforms with KEK signed DBX updates containing
certs like this following boothole, so it would be great if we could get
something like this in.  I also had a follow on series that allowed =
these
certs to be compiled into the kernel.

https://lkml.org/lkml/2020/9/30/1301

I=E2=80=99d appreciate any feedback on that series as well.

Thanks

> David
> ---
> commit 8913866babb96fcfe452aac6042ca8862d4c0b53
> Author: Eric Snowberg <eric.snowberg@oracle.com>
> Date:   Tue Sep 15 20:49:27 2020 -0400
>=20
>    certs: Add EFI_CERT_X509_GUID support for dbx entries
>=20
>    The Secure Boot Forbidden Signature Database, dbx, contains a list =
of now
>    revoked signatures and keys previously approved to boot with UEFI =
Secure
>    Boot enabled.  The dbx is capable of containing any number of
>    EFI_CERT_X509_SHA256_GUID, EFI_CERT_SHA256_GUID, and =
EFI_CERT_X509_GUID
>    entries.
>=20
>    Currently when EFI_CERT_X509_GUID are contained in the dbx, the =
entries are
>    skipped.
>=20
>    Add support for EFI_CERT_X509_GUID dbx entries. When a =
EFI_CERT_X509_GUID
>    is found, it is added as an asymmetrical key to the .blacklist =
keyring.
>    Anytime the .platform keyring is used, the keys in the .blacklist =
keyring
>    are referenced, if a matching key is found, the key will be =
rejected.
>=20
>    Signed-off-by: Eric Snowberg <eric.snowberg@oracle.com>
>    Reviewed-by: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
>    Signed-off-by: David Howells <dhowells@redhat.com>
>=20
> diff --git a/certs/blacklist.c b/certs/blacklist.c
> index 6514f9ebc943..a7f021878a4b 100644
> --- a/certs/blacklist.c
> +++ b/certs/blacklist.c
> @@ -100,6 +100,38 @@ int mark_hash_blacklisted(const char *hash)
> 	return 0;
> }
>=20
> +int add_key_to_revocation_list(const char *data, size_t size)
> +{
> +	key_ref_t key;
> +
> +	key =3D key_create_or_update(make_key_ref(blacklist_keyring, =
true),
> +				   "asymmetric",
> +				   NULL,
> +				   data,
> +				   size,
> +				   ((KEY_POS_ALL & ~KEY_POS_SETATTR) | =
KEY_USR_VIEW),
> +				   KEY_ALLOC_NOT_IN_QUOTA | =
KEY_ALLOC_BUILT_IN);
> +
> +	if (IS_ERR(key)) {
> +		pr_err("Problem with revocation key (%ld)\n", =
PTR_ERR(key));
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
> +	ret =3D validate_trust(pkcs7, blacklist_keyring);
> +
> +	if (ret =3D=3D 0)
> +		return -EKEYREJECTED;
> +
> +	return -ENOKEY;
> +}
> +
> /**
>  * is_hash_blacklisted - Determine if a hash is blacklisted
>  * @hash: The hash to be checked as a binary blob
> diff --git a/certs/blacklist.h b/certs/blacklist.h
> index 1efd6fa0dc60..420bb7c86e07 100644
> --- a/certs/blacklist.h
> +++ b/certs/blacklist.h
> @@ -1,3 +1,15 @@
> #include <linux/kernel.h>
> +#include <linux/errno.h>
> +#include <crypto/pkcs7.h>
>=20
> extern const char __initconst *const blacklist_hashes[];
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
> @@ -241,6 +241,12 @@ int verify_pkcs7_message_sig(const void *data, =
size_t len,
> 			pr_devel("PKCS#7 platform keyring is not =
available\n");
> 			goto error;
> 		}
> +
> +		ret =3D is_key_on_revocation_list(pkcs7);
> +		if (ret !=3D -ENOKEY) {
> +			pr_devel("PKCS#7 platform key is on revocation =
list\n");
> +			goto error;
> +		}
> 	}
> 	ret =3D pkcs7_validate_trust(pkcs7, trusted_keys);
> 	if (ret < 0) {
> diff --git a/include/keys/system_keyring.h =
b/include/keys/system_keyring.h
> index fb8b07daa9d1..61f98739e8b1 100644
> --- a/include/keys/system_keyring.h
> +++ b/include/keys/system_keyring.h
> @@ -31,11 +31,14 @@ extern int =
restrict_link_by_builtin_and_secondary_trusted(
> #define restrict_link_by_builtin_and_secondary_trusted =
restrict_link_by_builtin_trusted
> #endif
>=20
> +extern struct pkcs7_message *pkcs7;
> #ifdef CONFIG_SYSTEM_BLACKLIST_KEYRING
> extern int mark_hash_blacklisted(const char *hash);
> +extern int add_key_to_revocation_list(const char *data, size_t size);
> extern int is_hash_blacklisted(const u8 *hash, size_t hash_len,
> 			       const char *type);
> extern int is_binary_blacklisted(const u8 *hash, size_t hash_len);
> +extern int is_key_on_revocation_list(struct pkcs7_message *pkcs7);
> #else
> static inline int is_hash_blacklisted(const u8 *hash, size_t hash_len,
> 				      const char *type)
> @@ -47,6 +50,14 @@ static inline int is_binary_blacklisted(const u8 =
*hash, size_t hash_len)
> {
> 	return 0;
> }
> +static inline int add_key_to_revocation_list(const char *data, size_t =
size)
> +{
> +	return 0;
> +}
> +static inline int is_key_on_revocation_list(struct pkcs7_message =
*pkcs7)
> +{
> +	return -ENOKEY;
> +}
> #endif
>=20
> #ifdef CONFIG_IMA_BLACKLIST_KEYRING
> diff --git a/security/integrity/platform_certs/keyring_handler.c =
b/security/integrity/platform_certs/keyring_handler.c
> index c5ba695c10e3..5604bd57c990 100644
> --- a/security/integrity/platform_certs/keyring_handler.c
> +++ b/security/integrity/platform_certs/keyring_handler.c
> @@ -55,6 +55,15 @@ static __init void uefi_blacklist_binary(const char =
*source,
> 	uefi_blacklist_hash(source, data, len, "bin:", 4);
> }
>=20
> +/*
> + * Add an X509 cert to the revocation list.
> + */
> +static __init void uefi_revocation_list_x509(const char *source,
> +					     const void *data, size_t =
len)
> +{
> +	add_key_to_revocation_list(data, len);
> +}
> +
> /*
>  * Return the appropriate handler for particular signature list types =
found in
>  * the UEFI db and MokListRT tables.
> @@ -76,5 +85,7 @@ __init efi_element_handler_t =
get_handler_for_dbx(const efi_guid_t *sig_type)
> 		return uefi_blacklist_x509_tbs;
> 	if (efi_guidcmp(*sig_type, efi_cert_sha256_guid) =3D=3D 0)
> 		return uefi_blacklist_binary;
> +	if (efi_guidcmp(*sig_type, efi_cert_x509_guid) =3D=3D 0)
> +		return uefi_revocation_list_x509;
> 	return 0;
> }
>=20

