Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA0B2306BFD
	for <lists+keyrings@lfdr.de>; Thu, 28 Jan 2021 05:14:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231177AbhA1EMw (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 27 Jan 2021 23:12:52 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:56472 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231172AbhA1EMs (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 27 Jan 2021 23:12:48 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10S3s1ca050748;
        Thu, 28 Jan 2021 04:11:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=content-type :
 subject : from : in-reply-to : date : cc : content-transfer-encoding :
 message-id : references : to : mime-version; s=corp-2020-01-29;
 bh=ypAsYmrWYJsKhFqIVEWrsvzNQMoXhR7AJcGUxqv2uGw=;
 b=VxlGP4dHM9QtSgCqUGJXmIcRYlWO7zOF2gTJ8j/DdIJL3JWnrs9jPzSs9ESjqOA/pYCa
 fQO2LR0/00qUJyJslTXjzKYZNnIUT6xFUlieCvv/tYxNtdHDzU9FuKwQ2jIAfAxftgH3
 Gw5X+1Ua+5uSkW9NIxSU8o2pKDEYC8UK54C/VZz00sTRoIn2cyIRX1WNayJdSbePrTEl
 zXuadF3FFnF8Y2NZ0KYacfA2Q9r1QmVhtaXHiFu4u3uWkxUe7zvL09q37Td/7a0yGZZu
 NDuzx6ZkmzLYfb17We6/zsELRrkIMAXtTrsPVCLXiYHK30jN8q0O0CfEPJURrKM/4ylx gw== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by userp2130.oracle.com with ESMTP id 368b7r28mn-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 28 Jan 2021 04:11:30 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10S3ubvO184312;
        Thu, 28 Jan 2021 04:11:29 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam08lp2040.outbound.protection.outlook.com [104.47.74.40])
        by aserp3020.oracle.com with ESMTP id 368wq13b24-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 28 Jan 2021 04:11:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L+Th5zy8bJvLoeJWoxYY3YD/eg0bMp6FeIYSJjLaUz+thT63feis3LbdXcJtzSCCVsqhRZflbDaHddDEKE2xfhA5nfkyZlXtND5sNQkGrRDMqaTdjG3iOC0TqxkyWd8fOMfSsFVqooVVFJmlsO+WcwquWXJ+eBRfMQQhMrVLLRANFxurTipzC10kiFZntrWX+x6/TxdXwdMeNDMh+wXUnkURds5znnsRSDs9/ZGrctW3MhaC0a4KLwa6lNyghINwkNOncceeZm+FKV0SXvJt1we4rEN8UVoR4xyR+Q6lyiZkAupcbT0MuM93tkGQgiowTfwtilKPVb1qfyZ3eIIGjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ypAsYmrWYJsKhFqIVEWrsvzNQMoXhR7AJcGUxqv2uGw=;
 b=ZRaNo0mgJqy8BPUYy0UuO7qLedfEZsenRF7JSrm/DBaXbD1f/Ykd0arPoDk21caK7jjFHChhxmnraLpaI9GrhUbxIFhAac1xyBZvmjft7VWvF5tmSaK/Fmbp+4m5eloSY+6hKN/Ze0EgAtmBZ2j+J6RbEW9j6gcFZZnqA/O9FmeP357mUzL2OPPmLMKKkP9HbAITNi6bUTvYEg5Esopk8WgOQikkqLo1d5Vvw4mzXie0exFMWe0Bk18oqEMUIY2mE4t2cpR5ItWcVt7/zTv/jySTTRPt3VSZGVZVbyR4JPQmhVBBl7UpLHYTb6L/DVc8NZKsrt35hBF6pwtiSH7Zkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ypAsYmrWYJsKhFqIVEWrsvzNQMoXhR7AJcGUxqv2uGw=;
 b=E+IYkgZfVZqsOi0Tn3wnwdjjd54ejw0oGr7+hBJlwVI1lFZhWHT8FigCWK/maz43RnmCG+R8YbdGFRzhd79QdRXSxwf06T5XvKUMkQIQoh/73yqlYRj3xL6HuTEbj+5qP340d31eaQCb+nIHoubooGOXzajYbWgnFn/LBxQA7NM=
Authentication-Results: linux.vnet.ibm.com; dkim=none (message not signed)
 header.d=none;linux.vnet.ibm.com; dmarc=none action=none
 header.from=oracle.com;
Received: from DM6PR10MB3099.namprd10.prod.outlook.com (2603:10b6:5:1ad::18)
 by DM6PR10MB2938.namprd10.prod.outlook.com (2603:10b6:5:6c::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.17; Thu, 28 Jan
 2021 04:11:27 +0000
Received: from DM6PR10MB3099.namprd10.prod.outlook.com
 ([fe80::70bf:d626:5218:70e4]) by DM6PR10MB3099.namprd10.prod.outlook.com
 ([fe80::70bf:d626:5218:70e4%7]) with mapi id 15.20.3784.019; Thu, 28 Jan 2021
 04:11:27 +0000
Content-Type: text/plain; charset=us-ascii
Subject: Re: [PATCH v5 1/4] certs: Add EFI_CERT_X509_GUID support for dbx
 entries
From:   Eric Snowberg <eric.snowberg@oracle.com>
In-Reply-To: <399024a1-59fb-12b8-9ea9-9bbee843dbc8@linux.vnet.ibm.com>
Date:   Wed, 27 Jan 2021 21:11:22 -0700
Cc:     David Howells <dhowells@redhat.com>, dwmw2@infradead.org,
        Jarkko Sakkinen <jarkko@kernel.org>,
        James.Bottomley@HansenPartnership.com, masahiroy@kernel.org,
        michal.lkml@markovi.net, jmorris@namei.org, serge@hallyn.com,
        ardb@kernel.org, zohar@linux.ibm.com, lszubowi@redhat.com,
        javierm@redhat.com, keyrings@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-security-module@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <13EE0575-2F90-4C49-AF5D-365B63D2CB64@oracle.com>
References: <20210122181054.32635-1-eric.snowberg@oracle.com>
 <20210122181054.32635-2-eric.snowberg@oracle.com>
 <399024a1-59fb-12b8-9ea9-9bbee843dbc8@linux.vnet.ibm.com>
To:     Nayna <nayna@linux.vnet.ibm.com>
X-Mailer: Apple Mail (2.3273)
X-Originating-IP: [24.52.35.144]
X-ClientProxiedBy: CO2PR05CA0092.namprd05.prod.outlook.com
 (2603:10b6:104:1::18) To DM6PR10MB3099.namprd10.prod.outlook.com
 (2603:10b6:5:1ad::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.16.177.128] (24.52.35.144) by CO2PR05CA0092.namprd05.prod.outlook.com (2603:10b6:104:1::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.8 via Frontend Transport; Thu, 28 Jan 2021 04:11:25 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 28ffecf3-d927-482f-6b95-08d8c342c837
X-MS-TrafficTypeDiagnostic: DM6PR10MB2938:
X-Microsoft-Antispam-PRVS: <DM6PR10MB2938F8F019F96E99ED41F1CC87BA9@DM6PR10MB2938.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: I9kIngCCiAdMN+kDAzLDR0fE0VuEnt4UHJaUrcG5Rbjff/1i22aVtzXhaY2Q5Lu9AzFMs7guBFcA/Rj4uEx+RB70WVuGpJjWUw99OBeng9Ioncll/StJriJl17gNNXxJqvPzGbPt3+INYYG/9dIzjeccZfne+aoxC8AxGY+Z4YRCUfjXLarCsXFWzdF9uaSLERbFLL4U2RUNDpLrYmi1BwsingpYGeOchHwWS0lfH1SUmo3XV9YVU6O69tHpSwdWsVJXlE2rXveoSW6LthLCoXVTNAemsE4rXIAORAjjQAMJ4KUJL+l4ewtLB2ajrpL4YWgWyeJIJJ1eYEhb6rSzh1BHsoCHZIzswy4xa6EaPntDACi56nPgUvstra6UjR2Mc3jeDIvMGdMr3ohf2ytzZeszXxXDWF0DXWvo/twU7uXzScfXSpRXu3DEyVyKS4RJzg4+NeMkcFKaZfJjevOy88ZU93AjAzuWpn2OehYTqVnHfQ1EcGu5STIb8Lrr+RI9RtcwDhDijYvO7feLFHLy2d5rUWzYbbObOyFaVUbLyrlgD8hxg22y2dPB02c0PnpI0oQC3uH2UjnMsGMQej/JR+k+7dIrVW+WkTzS7hXkTqR/8QG8EjfKeElXYPxFBVyEff+oCsoacXP2bAMQNnnsZg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR10MB3099.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(39860400002)(346002)(376002)(366004)(136003)(396003)(2616005)(66556008)(26005)(66476007)(66946007)(956004)(44832011)(5660300002)(7416002)(52116002)(316002)(36756003)(16526019)(186003)(54906003)(16576012)(83380400001)(86362001)(53546011)(8936002)(6666004)(8676002)(6486002)(6916009)(2906002)(966005)(478600001)(33656002)(4326008)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?0azgqn7Y3Sem/TMXS16iDZWTHiWZfW9hTv9ZhSktYDuK0NMFHGQnEg9S/jHr?=
 =?us-ascii?Q?AqN0aWNQTAtRgP86PlaZkebgRYW/wr0DqUHkUBtQF858xqZh9PhOFjXwZAeT?=
 =?us-ascii?Q?pRoVKZudRQ2YbSUOm8iLL3WaZxFQrzaWd18iVioqRqmbPGMasEXg+KHoXeZQ?=
 =?us-ascii?Q?4rIrpxl6iQIlZ7okNSMNLS6htwQY3zYnL+IG09OJgXJCyKlr6L6dl9TfZYhn?=
 =?us-ascii?Q?eNrKJbfy5EhftIJLrHGlNu83ve5uSSg9cDoQcqTNr4ufd+TeUfNDsQQm0zaV?=
 =?us-ascii?Q?r7ZAUXazgd62q+MZlHHobqL0KyeE9iz26t0VQgsmtAWqa41VSLJbMUhtw2+n?=
 =?us-ascii?Q?D9KAs0Mv8BWLbf41OkmBsCI7EwVduoOV0cYQl2g3QT+sjJLeRHMf4Ar3hKe8?=
 =?us-ascii?Q?7CUhLIZwHzcHM0d338JLvfoO41hJtO0oGljzX2aPYwckO63L4a3savsa/eZJ?=
 =?us-ascii?Q?5GWS/p9ir33iaU7QdzxpYdIVfYas1l5PTh892+PZBct7Gmnfmf2vesHUadPW?=
 =?us-ascii?Q?FyXrBDNqkWmbPeMCXm5EMV0VMER8hUlB26liD7jN1zCyuo5TOoBMb8Hctl8k?=
 =?us-ascii?Q?pUTs36uCbdfiCEkAq/kYe77YkKw8pQshggzUTTKVuBtoojdquirVzmUlqBxb?=
 =?us-ascii?Q?rgPAHz4+PMuSS0+ABqSnr49Ub24HheKdixm2s/ONa+YW9UzQRwaexEU8N90/?=
 =?us-ascii?Q?LBGB35JwHCrUZAMCFKL5SloxTP/mBBS1F1qKm206VNkPMKszYQ42jD+mG7Ia?=
 =?us-ascii?Q?3XXDLP0t/7rLaoOFz9Oec4Tjp37L7x5MUeiAlsZDTSraw43PGFdAW7fPEibd?=
 =?us-ascii?Q?A8G92HgoE8pmGNn4XmLVajqT6AjcU/s03j1h3xhXwLZexc5e/JE9k/67R+oZ?=
 =?us-ascii?Q?uolCfBnkbqUpHsU6eEbjKw1lGcqdF3JkUM6WcECKyHKrD9bTfO6Xe7e8g36x?=
 =?us-ascii?Q?8DPDlPXc7zLtF5y4dpUaJc5HCiM9tHh8keVNOxCtigzDQ8Q5pjnqNjWvuyXh?=
 =?us-ascii?Q?vwco0wJFx2mt3LXUh+VSAXRsvxMgY5eaKhk9g1fnK0uqt99OplSljL8aP7V5?=
 =?us-ascii?Q?WETAGQf5?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28ffecf3-d927-482f-6b95-08d8c342c837
X-MS-Exchange-CrossTenant-AuthSource: DM6PR10MB3099.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2021 04:11:27.2755
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 78apjSuZL9ENFOG61Y00JgjrTnixSkplqwTTBaljctd3z6ewJd9Uj+4+xNkSx4uN6X9hIurip/kWW7paRIJoWTEv/l8LdAP7WkuurzdQhRE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB2938
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9877 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 mlxscore=0 spamscore=0
 adultscore=0 bulkscore=0 phishscore=0 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101280018
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9877 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 spamscore=0 phishscore=0
 adultscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 mlxscore=0 clxscore=1011 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101280018
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org


> On Jan 27, 2021, at 8:54 PM, Nayna <nayna@linux.vnet.ibm.com> wrote:
>=20
>=20
> On 1/22/21 1:10 PM, Eric Snowberg wrote:
>> This fixes CVE-2020-26541.
>>=20
>> The Secure Boot Forbidden Signature Database, dbx, contains a list of no=
w
>> revoked signatures and keys previously approved to boot with UEFI Secure
>> Boot enabled.  The dbx is capable of containing any number of
>> EFI_CERT_X509_SHA256_GUID, EFI_CERT_SHA256_GUID, and EFI_CERT_X509_GUID
>> entries.
>>=20
>> Currently when EFI_CERT_X509_GUID are contained in the dbx, the entries =
are
>> skipped.
>>=20
>> Add support for EFI_CERT_X509_GUID dbx entries. When a EFI_CERT_X509_GUI=
D
>> is found, it is added as an asymmetrical key to the .blacklist keyring.
>> Anytime the .platform keyring is used, the keys in the .blacklist keyrin=
g
>> are referenced, if a matching key is found, the key will be rejected.
>>=20
>> Signed-off-by: Eric Snowberg <eric.snowberg@oracle.com>
>> Reviewed-by: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
>> Signed-off-by: David Howells <dhowells@redhat.com>
>> ---
>> v5: Function name changes done by David Howells
>> ---
>>  certs/blacklist.c                             | 32 +++++++++++++++++++
>>  certs/blacklist.h                             | 12 +++++++
>>  certs/system_keyring.c                        |  6 ++++
>>  include/keys/system_keyring.h                 | 11 +++++++
>>  .../platform_certs/keyring_handler.c          | 11 +++++++
>>  5 files changed, 72 insertions(+)
>>=20
>> diff --git a/certs/blacklist.c b/certs/blacklist.c
>> index 6514f9ebc943..a7f021878a4b 100644
>> --- a/certs/blacklist.c
>> +++ b/certs/blacklist.c
>> @@ -100,6 +100,38 @@ int mark_hash_blacklisted(const char *hash)
>>  	return 0;
>>  }
>>=20
>> +int add_key_to_revocation_list(const char *data, size_t size)
>> +{
>> +	key_ref_t key;
>> +
>> +	key =3D key_create_or_update(make_key_ref(blacklist_keyring, true),
>> +				   "asymmetric",
>> +				   NULL,
>> +				   data,
>> +				   size,
>> +				   ((KEY_POS_ALL & ~KEY_POS_SETATTR) | KEY_USR_VIEW),
>> +				   KEY_ALLOC_NOT_IN_QUOTA | KEY_ALLOC_BUILT_IN);
>> +
>> +	if (IS_ERR(key)) {
>> +		pr_err("Problem with revocation key (%ld)\n", PTR_ERR(key));
>> +		return PTR_ERR(key);
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +int is_key_on_revocation_list(struct pkcs7_message *pkcs7)
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
>> +
>>  /**
>>   * is_hash_blacklisted - Determine if a hash is blacklisted
>>   * @hash: The hash to be checked as a binary blob
>> diff --git a/certs/blacklist.h b/certs/blacklist.h
>> index 1efd6fa0dc60..420bb7c86e07 100644
>> --- a/certs/blacklist.h
>> +++ b/certs/blacklist.h
>> @@ -1,3 +1,15 @@
>>  #include <linux/kernel.h>
>> +#include <linux/errno.h>
>> +#include <crypto/pkcs7.h>
>>=20
>>  extern const char __initconst *const blacklist_hashes[];
>> +
>> +#ifdef CONFIG_INTEGRITY_PLATFORM_KEYRING
>> +#define validate_trust pkcs7_validate_trust
>> +#else
>> +static inline int validate_trust(struct pkcs7_message *pkcs7,
>> +				 struct key *trust_keyring)
>> +{
>> +	return -ENOKEY;
>> +}
>> +#endif
>> diff --git a/certs/system_keyring.c b/certs/system_keyring.c
>> index 798291177186..cc165b359ea3 100644
>> --- a/certs/system_keyring.c
>> +++ b/certs/system_keyring.c
>> @@ -241,6 +241,12 @@ int verify_pkcs7_message_sig(const void *data, size=
_t len,
>>  			pr_devel("PKCS#7 platform keyring is not available\n");
>>  			goto error;
>>  		}
>> +
>> +		ret =3D is_key_on_revocation_list(pkcs7);
>> +		if (ret !=3D -ENOKEY) {
>> +			pr_devel("PKCS#7 platform key is on revocation list\n");
>> +			goto error;
>> +		}
>>  	}
>>  	ret =3D pkcs7_validate_trust(pkcs7, trusted_keys);
>>  	if (ret < 0) {
>> diff --git a/include/keys/system_keyring.h b/include/keys/system_keyring=
.h
>> index fb8b07daa9d1..61f98739e8b1 100644
>> --- a/include/keys/system_keyring.h
>> +++ b/include/keys/system_keyring.h
>> @@ -31,11 +31,14 @@ extern int restrict_link_by_builtin_and_secondary_tr=
usted(
>>  #define restrict_link_by_builtin_and_secondary_trusted restrict_link_by=
_builtin_trusted
>>  #endif
>>=20
>> +extern struct pkcs7_message *pkcs7;
>>  #ifdef CONFIG_SYSTEM_BLACKLIST_KEYRING
>>  extern int mark_hash_blacklisted(const char *hash);
>> +extern int add_key_to_revocation_list(const char *data, size_t size);
>>  extern int is_hash_blacklisted(const u8 *hash, size_t hash_len,
>>  			       const char *type);
>>  extern int is_binary_blacklisted(const u8 *hash, size_t hash_len);
>> +extern int is_key_on_revocation_list(struct pkcs7_message *pkcs7);
>>  #else
>>  static inline int is_hash_blacklisted(const u8 *hash, size_t hash_len,
>>  				      const char *type)
>> @@ -47,6 +50,14 @@ static inline int is_binary_blacklisted(const u8 *has=
h, size_t hash_len)
>>  {
>>  	return 0;
>>  }
>> +static inline int add_key_to_revocation_list(const char *data, size_t s=
ize)
>> +{
>> +	return 0;
>> +}
>> +static inline int is_key_on_revocation_list(struct pkcs7_message *pkcs7=
)
>> +{
>> +	return -ENOKEY;
>> +}
>>  #endif
>>=20
>>  #ifdef CONFIG_IMA_BLACKLIST_KEYRING
>> diff --git a/security/integrity/platform_certs/keyring_handler.c b/secur=
ity/integrity/platform_certs/keyring_handler.c
>> index c5ba695c10e3..5604bd57c990 100644
>> --- a/security/integrity/platform_certs/keyring_handler.c
>> +++ b/security/integrity/platform_certs/keyring_handler.c
>> @@ -55,6 +55,15 @@ static __init void uefi_blacklist_binary(const char *=
source,
>>  	uefi_blacklist_hash(source, data, len, "bin:", 4);
>>  }
>>=20
>> +/*
>> + * Add an X509 cert to the revocation list.
>> + */
>> +static __init void uefi_revocation_list_x509(const char *source,
>> +					     const void *data, size_t len)
>> +{
>> +	add_key_to_revocation_list(data, len);
>> +}
>=20
> In keeping the naming convention with other functions that blacklist hash=
es, why can't we call these functions:
>=20
> * uefi_revocation_list_x509() -> uefi_blacklist_x509_cert()
> * add_key_to_revocation_list() -> uefi_blacklist_cert()
> * is_key_on_revocation_list() -> is_cert_blacklisted()

The word revocation was used do to the updated Linux coding style:

https://lkml.org/lkml/2020/7/4/229


