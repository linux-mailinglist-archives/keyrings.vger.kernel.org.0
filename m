Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 110B026B26E
	for <lists+keyrings@lfdr.de>; Wed, 16 Sep 2020 00:47:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727722AbgIOWqw (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 15 Sep 2020 18:46:52 -0400
Received: from aserp2120.oracle.com ([141.146.126.78]:48738 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727490AbgIOPpH (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Tue, 15 Sep 2020 11:45:07 -0400
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 08FFP3ca146660;
        Tue, 15 Sep 2020 15:44:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to;
 s=corp-2020-01-29; bh=dtTmhZe5n21zVdQpTOTAtBeFkVA42Abq50W1Y+Hydlc=;
 b=OprU6tm8Pf4j3FOvGuBH51uVcE2dGBc9k0MwnaLrDqBQCLrURlJNlqWziuCTfnbk4Z7F
 qHn24Yd4VFJjk8SX6+USk320Gh0QowSG/Ybhe/eXGv0E/LjcwhgrsHNulUbwxbh3B028
 8YhbegIF1sYOwt9YScVT8Y+ukRsj8mE4XnuHfODlKLRlXSRfJsWt5IzT/BdHjW0Y/BlO
 4nlL4AdKVN1as2QX2ae/nXhWTgxLXwDChJwCwWPnCvst5Kvhnje9b3kOHbBfJyIKbQnp
 cVBi586AVkx4Ij/22PY89PVqyI1pm9PIvwilhHZYY2ITh4S+OxT7ZGIKK87pzf0ZMdaL Rg== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by aserp2120.oracle.com with ESMTP id 33gp9m5x17-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 15 Sep 2020 15:44:40 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 08FFJxKU017009;
        Tue, 15 Sep 2020 15:42:39 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by aserp3030.oracle.com with ESMTP id 33h7wpadr9-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 15 Sep 2020 15:42:39 +0000
Received: from abhmp0019.oracle.com (abhmp0019.oracle.com [141.146.116.25])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 08FFgVH5017794;
        Tue, 15 Sep 2020 15:42:33 GMT
Received: from dhcp-10-65-178-159.vpn.oracle.com (/10.65.178.159)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Tue, 15 Sep 2020 15:42:30 +0000
Content-Type: text/plain; charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Subject: Re: [PATCH v3] certs: Add EFI_CERT_X509_GUID support for dbx entries
From:   Eric Snowberg <eric.snowberg@oracle.com>
In-Reply-To: <20200914181227.GF9369@linux.intel.com>
Date:   Tue, 15 Sep 2020 09:42:27 -0600
Cc:     dhowells@redhat.com, dwmw2@infradead.org, jmorris@namei.org,
        serge@hallyn.com, nayna@linux.ibm.com, erichte@linux.ibm.com,
        mpe@ellerman.id.au, zohar@linux.ibm.com, keyrings@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        linux-security-module@vger.kernel.org, rdunlap@infradead.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <F25F6F0E-7E13-4C9D-A7BA-33CDEF7074F2@oracle.com>
References: <20200911182230.62266-1-eric.snowberg@oracle.com>
 <20200914181227.GF9369@linux.intel.com>
To:     Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
X-Mailer: Apple Mail (2.3273)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9745 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=3 malwarescore=0
 adultscore=0 bulkscore=0 phishscore=0 mlxlogscore=999 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009150128
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9745 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxlogscore=999
 adultscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 spamscore=0 priorityscore=1501 suspectscore=3 impostorscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2009150128
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org


> On Sep 14, 2020, at 12:12 PM, Jarkko Sakkinen =
<jarkko.sakkinen@linux.intel.com> wrote:
>=20
> On Fri, Sep 11, 2020 at 02:22:30PM -0400, Eric Snowberg wrote:
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
>> Add support for EFI_CERT_X509_GUID dbx entries. When a =
EFI_CERT_X509_GUID
>> is found, it is added as an asymmetrical key to the .blacklist =
keyring.
>> Anytime the .platform keyring is used, the keys in the .blacklist =
keyring
>> are referenced, if a matching key is found, the key will be rejected.
>>=20
>> Signed-off-by: Eric Snowberg <eric.snowberg@oracle.com>
>> ---
>> v3:
>> Fixed an issue when CONFIG_PKCS7_MESSAGE_PARSER is not builtin and =
defined
>> as a module instead, pointed out by Randy Dunlap
>>=20
>> v2:=20
>> Fixed build issue reported by kernel test robot <lkp@intel.com>
>> Commit message update (suggested by Jarkko Sakkinen)
>> ---
>> certs/blacklist.c                             | 33 =
+++++++++++++++++++
>> certs/blacklist.h                             | 12 +++++++
>> certs/system_keyring.c                        |  6 ++++
>> include/keys/system_keyring.h                 | 11 +++++++
>> .../platform_certs/keyring_handler.c          | 11 +++++++
>> 5 files changed, 73 insertions(+)
>>=20
>> diff --git a/certs/blacklist.c b/certs/blacklist.c
>> index 6514f9ebc943..3d1514ba5d47 100644
>> --- a/certs/blacklist.c
>> +++ b/certs/blacklist.c
>> @@ -100,6 +100,39 @@ int mark_hash_blacklisted(const char *hash)
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
>> +				   ((KEY_POS_ALL & ~KEY_POS_SETATTR) | =
KEY_USR_VIEW),
>> +				   KEY_ALLOC_NOT_IN_QUOTA | =
KEY_ALLOC_BUILT_IN);
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
>> +	ret =3D validate_trust(pkcs7, blacklist_keyring);
>> +
>> +	if (ret =3D=3D 0)
>> +		return -EKEYREJECTED;
>> +
>> +	return -ENOKEY;
>> +}
>> +EXPORT_SYMBOL_GPL(is_key_revocationlisted);
>=20
> Hmm... ignore my previous comment about this. Export symbol is called
> only by system keyring code.
>=20
> Would be best if the commit message would explicitly reason new =
exports.

I don=E2=80=99t see a good reason to keep the export now, I=E2=80=99ll =
remove it from the
next version.  Thanks.

