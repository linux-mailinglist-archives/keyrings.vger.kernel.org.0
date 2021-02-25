Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A73DF3249A4
	for <lists+keyrings@lfdr.de>; Thu, 25 Feb 2021 05:05:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233396AbhBYEFB (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 24 Feb 2021 23:05:01 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:34792 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230174AbhBYEE7 (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 24 Feb 2021 23:04:59 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 11P43nti106113;
        Thu, 25 Feb 2021 04:04:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=content-type :
 subject : from : in-reply-to : date : cc : content-transfer-encoding :
 message-id : references : to : mime-version; s=corp-2020-01-29;
 bh=PY2pYwa0S7sXWB+wCNmG87YVm5BuP9Neqyhs/HPSS3g=;
 b=PHIupIEZKkee14pqqMWlUZo1Xp0W1c+ydbgpnst58FpvAXmDjUaCJIINyITpetjGdDpV
 GocJf15iErLWyO0DEQR1QbmmLH9emdPFqCGDVSyGlvw81uZJh7S48MsYwrMpsnoJJoQK
 2D2KmeE60D0816M5C87JHt+ubeURhpgzYviiuc+S+1OoNfuvUrfiUI4JJxrppmqRQKpo
 pUzgzyGDs3l1uOrsPbTnVxjtolPxkgrZwBwSb35aehZlTjZY/rWl40EwrVcMDbryNF9i
 UAyf/Vkx1zO7Yr3AphwZm3g7ExgU5vDOxEDDbrsBUbw1VEPQIYcoh5orXsi/XeI59c3h nw== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by userp2130.oracle.com with ESMTP id 36tsur53t1-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 25 Feb 2021 04:04:05 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 11P40a94112120;
        Thu, 25 Feb 2021 04:04:05 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2107.outbound.protection.outlook.com [104.47.58.107])
        by userp3030.oracle.com with ESMTP id 36ucc0pwbb-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 25 Feb 2021 04:04:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VQELBdfgTvH1+gWlgNZmRu21X2UZPz6eNUKgFT4l8snupctWNDmSYQuihX8n8wqXT+Fu3y0fJBW6FmWLlINN0N99MfCsWZpTR94L+X5OR3iyR6ZzaBsK2j/eios9yZ6xeySKJ1186Uk51BztJLkHw40VRp2Drpcn2OdZOYj5Kj3yIFb8huAZfkM7ePxyIBAHwY9lvuRHKf3j/YtAgJ44vjFsYMQKGCh2iMHagToKowxpnBabZaWx9W/as6WgFKHXjfES1p6OnYFefZ7BYa8lhjZLshLtGZf+pZICYGF1zMjgkyeE2iqG7uoSaACcphzD+a9iFrWejJ/5guO7bpZ5+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PY2pYwa0S7sXWB+wCNmG87YVm5BuP9Neqyhs/HPSS3g=;
 b=lMzh+a93U/2lHZ3jzAaWs9owYscjceNqFF9U3If60BXwlR3y38Jl0XjB5WrccBvW0FuXGiPWGwS8lCtjIoYURv0QoF1NTFF7kmMqhdg+I6aaR0VJ/YzOmDZtyC+Rlx+YqwBYs9TrVIok732TfjgRNLZ9Mg+wdTkl8PJeFVCsJzucUq1spC/v8kWgdi/u7tHcZDpmqk81fDV4aRUCqloB2rRm+gxXrF00eisFDXHf8B91rINsKQhYKzRJMmAEx9OILpc5pT3YMU5SRD4EFETvEqXIFZ02Mbeftv8GCouGZj5OvWysERmId4acDifiL4AW4Y/0zR+D051dLrLCv5LWJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PY2pYwa0S7sXWB+wCNmG87YVm5BuP9Neqyhs/HPSS3g=;
 b=mXQvbwgzS4QII75i5zSwUjrq552MpAWY61xkJ1f6j/1dEzYMkuv3QLG3wMZv46UTW0G3roE7Tjn6u8AbZ5tV1AS3WdHI6cVjuiwvJlz9ipjzpK2IglhU9r/4WPvrdGAFR03ShvCiwNW8HPLjnNQ8Ap9rnPxyFtdzvpynjJ5CsZg=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=oracle.com;
Received: from CH2PR10MB4150.namprd10.prod.outlook.com (2603:10b6:610:ac::13)
 by CH0PR10MB4938.namprd10.prod.outlook.com (2603:10b6:610:c4::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.19; Thu, 25 Feb
 2021 04:04:03 +0000
Received: from CH2PR10MB4150.namprd10.prod.outlook.com
 ([fe80::95df:950e:af4c:a5df]) by CH2PR10MB4150.namprd10.prod.outlook.com
 ([fe80::95df:950e:af4c:a5df%9]) with mapi id 15.20.3868.034; Thu, 25 Feb 2021
 04:04:03 +0000
Content-Type: text/plain; charset=utf-8
Subject: Re: [PATCH] cert: Add kconfig dependency for validate_trust
From:   Eric Snowberg <eric.snowberg@oracle.com>
In-Reply-To: <3731128.1614163916@warthog.procyon.org.uk>
Date:   Wed, 24 Feb 2021 21:03:59 -0700
Cc:     Jarkko Sakkinen <jarkko@kernel.org>,
        =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@linux.microsoft.com>,
        David Woodhouse <dwmw2@infradead.org>,
        keyrings@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <B7E35D95-1A22-4277-B41B-B3FCC2E93743@oracle.com>
References: <F6980CA4-737D-416A-BBE3-390CEBA8B192@oracle.com>
 <20210217165058.1336155-1-eric.snowberg@oracle.com>
 <3524595.1614124044@warthog.procyon.org.uk>
 <3731128.1614163916@warthog.procyon.org.uk>
To:     David Howells <dhowells@redhat.com>
X-Mailer: Apple Mail (2.3273)
X-Originating-IP: [24.52.35.144]
X-ClientProxiedBy: SA9PR03CA0005.namprd03.prod.outlook.com
 (2603:10b6:806:20::10) To CH2PR10MB4150.namprd10.prod.outlook.com
 (2603:10b6:610:ac::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.16.177.128] (24.52.35.144) by SA9PR03CA0005.namprd03.prod.outlook.com (2603:10b6:806:20::10) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.19 via Frontend Transport; Thu, 25 Feb 2021 04:04:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f7f327da-2970-4e66-f7bc-08d8d942637e
X-MS-TrafficTypeDiagnostic: CH0PR10MB4938:
X-Microsoft-Antispam-PRVS: <CH0PR10MB4938BCB0FCFF9DB97911AFEE879E9@CH0PR10MB4938.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Cl9AqRyNPp53dQP9CvgdfM01JL6htYJmU3kr91bNt2RkUvCJsnr2ga+ubPirY3CqZQPP/pIe8VBVRUwMPI4hqxX8DoWJR7TdxMYcuVHC89CKETPZIJ4l9+0UeFBNKYufI2qZonneRrm6tHTkiP9sFlEOu37ZDsfdU0ERO4qFT0YhAgUdT7VuZQyLS2RtEDHFX198AI6oQQX//WnigRfoAJD6vc5Pc2Vs5oNp1WQ+YF8oAsmgd/eUpSJ2vDxum+gpwp6BzmkopvuXmOkxdMgF5UOYdKxzAPRR+wzUiBINi/pLjpxYtRuizJoLJMzO4uiM8ZfrKCLQJeNx0JmmxWzXy7+SI32MtovU8nzFtPxai8HEnCABPj5uHJq48jioMBb/tjc+hywyFPzIJ2JWTMpj0waq97H23KnbrKQLXkpKA7zbiCzmRbieQg4YhFCLwf1LWg1HOlE81pNezG18Xs0+w6Sc398r23gfQQOLi1WpBwQhc85XjTXcjxfYlekEnLt2dBdRSdp9Cmvbu7YxBoQQjKR3QKkbTv+1FyjjAyDTKPOVaLD+BZiRCRJNZoW9FyOksyGeSlUvEAAqHTK+Gom7Xw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR10MB4150.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(39860400002)(376002)(366004)(396003)(346002)(136003)(8936002)(44832011)(52116002)(53546011)(2906002)(86362001)(316002)(83380400001)(15650500001)(16576012)(54906003)(6486002)(66556008)(5660300002)(956004)(66946007)(66476007)(33656002)(26005)(8676002)(186003)(6916009)(2616005)(36756003)(16526019)(6666004)(4326008)(478600001)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ZXBwK05FUUxSNEw4cEtBZU03ZzJNYjd3MXJYdUt4RTBOREJXQWV3ZjNaN2Vk?=
 =?utf-8?B?djRKRXhCUmpiZTk0RDJ3YWtVTVNnbWdBWnpnRDY5L3N0MnRqeWIzVXRUdTV3?=
 =?utf-8?B?TTFGbTRsZXdDVENrejhsU0JmcWRtWW9kM09ERnFZZzI1U1dLWGJrRktHZi9J?=
 =?utf-8?B?UFEzYWlHaEVEZ2pyR2d1Z3FIeE4rWmZxQ0dzc3dmRm5hK09wM2pCUUV2d056?=
 =?utf-8?B?WWpNVnJ5RklNWnJPT2JIcStjcXFPRTVIbWNnR3RVQkF1ZW4xR3lXNGwza3FT?=
 =?utf-8?B?VlpPRGhmTG1lZmYwL080UzhuS05ndXhxZEJoM3IxeFpiYWQ1MjJSNitIazlF?=
 =?utf-8?B?N0pxLzlLS1hSN0l2ZmdYb2RUeDdBeTFOdzNsd3hqWUNLaFJNUlRxY040ZWtG?=
 =?utf-8?B?UHZ4SkZ3cm15NU9DTzNkMm9lMXZnZkZHb05Bd3lXZXpkZHFUanMyK3JQeWkr?=
 =?utf-8?B?ZktkT3dzY2ZpalNwYld3SGw1U2JkSFM0ZWVDMjdRblgvQ241T1hHS2VhSDFq?=
 =?utf-8?B?c2ZXRGpueHZ6Wm10c05Wb1BZNEZjT3k5YmNjN2xlYUNxNHdJR3BRYk9Ldm9o?=
 =?utf-8?B?MmMreVkrWGVvbGFrdTNYZzI1WmJzendKSzFpMTNGWjBvRHFpaDVJMm5YMFRj?=
 =?utf-8?B?NG04Q2FuVFpwRW1OTUV5R05CM2JBaCtXTkVYNDJBZ0hHMVNsZlZzZ0JrQUVX?=
 =?utf-8?B?U0t4SkI2ZHlKb3RuUnRaemdXOFZsZU9aby9KUUpRWk9QY0laOUFDTWZMajJQ?=
 =?utf-8?B?UHZZTXNxTHVzMUYwUm9NRWovZE90eUp0NU5KVjY3ZUtkT0ZldThVSHpBMmtP?=
 =?utf-8?B?eFA3R3htRHplSVBuWS9BTU5oQ2xJamNFd2dLR0FxYU9pYVVOSlhyUW9WRjcr?=
 =?utf-8?B?YWtuUnZuM0tpQVJKNGdPb3c4N3VSRkFoQUswOXQyVXlhaU1tQzJDMkhHZ0lz?=
 =?utf-8?B?SVUyU2FkK2U0NU0zMUxNVWEvNGxyQ1lyUkJSQndxUHJlYmdxcVFXT1JyaERn?=
 =?utf-8?B?ank3Ukh4UGtxV214cFZBeVVwTjJkajNUT2htMUo3djNDMjl3cEdiR1NKMmZq?=
 =?utf-8?B?YkRLUkFsK3ltUXF1OWlZTzgzNENMTE9jR28rTDk4b0UvMk5OWU9UajlOOXFw?=
 =?utf-8?B?eTB5cUJYbFg3c2NISTh6ZGtrWnJGYk0yd1ZwUTNPbXZsd2tZSWtRaGltSGtm?=
 =?utf-8?B?UFplZFExU3hVR2tHenUyWUdCNkVDc3VrczJsWGw5VGE2MVBXZWl4RTk0bXZO?=
 =?utf-8?B?YURaS3ZLc1ZXUnBqM2Z0Ykl2M1ZYTGpVb2xhY3JZa1o1bUh2MWpMSVNtUENv?=
 =?utf-8?B?Q0JxUUllVCtWRnpoaTNZaWcxNEx3b0FhKzJsc241S0RQUm9jZGc0ZlJEYnhz?=
 =?utf-8?B?STNDRFNVa0VxUXA5THJ0c3N5a2tnOENjamdvcytNOWpuTG1wLzRNN3ZGaDA1?=
 =?utf-8?B?eStPSWRKaExpY0VqWW9xQWpRM0NtKzRjbnRHaHgzcnBBZGRjWTFKV3ZtcTdm?=
 =?utf-8?B?N1lUNXpWenBtSXFIei9mY3JIaGJ3MmpwMnh3M0dPLzYzVUxJbGM5VndlZTAw?=
 =?utf-8?B?YXVIUDBRbmhUKy9aazJSZVl4Wk5vV1NWV3BzWDhqa2FLVmFWMkRYYUxEM3RX?=
 =?utf-8?B?MkljNHFkM0R1a0dITjIrb3JkUmk0WWZqb1NnYUtwU2xNcUlTSVhlZXdwYnhJ?=
 =?utf-8?B?ZlBWSHFwUzRib1BhdGF1Z2l0UVpFZWRtMVJZaHNYTXJidTJXekpTcmRGU0FQ?=
 =?utf-8?Q?5CyQXAAURP8s7HOWJEXx9kVYRCzi4hPuNvCbovS?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7f327da-2970-4e66-f7bc-08d8d942637e
X-MS-Exchange-CrossTenant-AuthSource: CH2PR10MB4150.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2021 04:04:03.4693
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XTGjkVGmzg/y+/Z+bF9LGHOYAzP+FtuDku7n1VwXTqrdaIeD1cdbxUDANohATsaLGYXWtBCPKxx4RBYrXxRad8AX03wLms8hF1zXNEzJBvM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB4938
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9905 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 adultscore=0
 phishscore=0 spamscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102250031
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9905 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 spamscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 mlxscore=0 malwarescore=0
 clxscore=1015 phishscore=0 mlxlogscore=999 lowpriorityscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2102250032
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org


> On Feb 24, 2021, at 3:51 AM, David Howells <dhowells@redhat.com> wrote:
>=20
> How about these changes?
>=20
> I've added an extra config option to turn on SYSTEM_REVOCATION_LIST suppo=
rt.

I believe this is ok.  However currently, whenever the kernel finds either =
a=20
EFI_CERT_SHA256_GUID or EFI_CERT_X509_SHA256_GUID entry in the dbx, it load=
s=20
it into the blacklist keyring.  Then anytime signature validation takes pla=
ce,=20
these entries are referenced.  If there is a match, the signature check fai=
ls. =20
Now with the inclusion of EFI_CERT_X509_GUID, I question why we want to ena=
ble=20
it thru a Kconfig option, when we don=E2=80=99t for the other two types.

> I've also added kerneldoc comments

Thanks

> and moved the functions so that they're not
> in the middle of the blacklist-specific stuff.
>=20
> I'm not sure uefi_revocation_list_x509() needs conditionalising as the
> optimiser should just inline it if SYSTEM_REVOCATION_LIST=3Dn (assuming _=
_init
> doesn't disable inlining).
>=20
> David
> ---
> diff --git a/certs/Kconfig b/certs/Kconfig
> index c94e93d8bccf..76e469b56a77 100644
> --- a/certs/Kconfig
> +++ b/certs/Kconfig
> @@ -83,4 +83,13 @@ config SYSTEM_BLACKLIST_HASH_LIST
> 	  wrapper to incorporate the list into the kernel.  Each <hash> should
> 	  be a string of hex digits.
>=20
> +config SYSTEM_REVOCATION_LIST
> +	bool "Provide system-wide ring of revocation certificates=E2=80=9D
> +	depends on SYSTEM_BLACKLIST_KEYRING
> +	depends on PKCS7_MESSAGE_PARSER=3Dy
> +	help
> +	  If set, this allows revocation certificates to be stored in the
> +	  blacklist keyring and implements a hook whereby a PKCS#7 message can
> +	  be checked to see if it matches such a certificate.
> +
> endmenu
> diff --git a/certs/blacklist.c b/certs/blacklist.c
> index e9f5fc632f0d..2b8644123d5f 100644
> --- a/certs/blacklist.c
> +++ b/certs/blacklist.c
> @@ -101,38 +101,6 @@ int mark_hash_blacklisted(const char *hash)
> 	return 0;
> }
>=20
> -int add_key_to_revocation_list(const char *data, size_t size)
> -{
> -	key_ref_t key;
> -
> -	key =3D key_create_or_update(make_key_ref(blacklist_keyring, true),
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
> -	ret =3D validate_trust(pkcs7, blacklist_keyring);
> -
> -	if (ret =3D=3D 0)
> -		return -EKEYREJECTED;
> -
> -	return -ENOKEY;
> -}
> -
> /**
>  * is_hash_blacklisted - Determine if a hash is blacklisted
>  * @hash: The hash to be checked as a binary blob
> @@ -177,6 +145,49 @@ int is_binary_blacklisted(const u8 *hash, size_t has=
h_len)
> }
> EXPORT_SYMBOL_GPL(is_binary_blacklisted);
>=20
> +#ifdef CONFIG_SYSTEM_REVOCATION_LIST
> +/**
> + * add_key_to_revocation_list - Add a revocation certificate to the blac=
klist
> + * @data: The data blob containing the certificate
> + * @size: The size of data blob
> + */
> +int add_key_to_revocation_list(const char *data, size_t size)
> +{
> +	key_ref_t key;
> +
> +	key =3D key_create_or_update(make_key_ref(blacklist_keyring, true),
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
> + * is_key_on_revocation_list - Determine if the key for a PKCS#7 message=
 is revoked
> + * @pkcs7: The PKCS#7 message to check
> + */
> +int is_key_on_revocation_list(struct pkcs7_message *pkcs7)
> +{
> +	int ret;
> +
> +	ret =3D pkcs7_validate_trust(pkcs7, blacklist_keyring);
> +
> +	if (ret =3D=3D 0)
> +		return -EKEYREJECTED;
> +
> +	return -ENOKEY;
> +}
> +#endif
> +
> /*
>  * Initialise the blacklist
>  */
> diff --git a/certs/blacklist.h b/certs/blacklist.h
> index 420bb7c86e07..51b320cf8574 100644
> --- a/certs/blacklist.h
> +++ b/certs/blacklist.h
> @@ -3,13 +3,3 @@
> #include <crypto/pkcs7.h>
>=20
> extern const char __initconst *const blacklist_hashes[];
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
> diff --git a/include/keys/system_keyring.h b/include/keys/system_keyring.=
h
> index 61f98739e8b1..875e002a4180 100644
> --- a/include/keys/system_keyring.h
> +++ b/include/keys/system_keyring.h
> @@ -34,11 +34,9 @@ extern int restrict_link_by_builtin_and_secondary_trus=
ted(
> extern struct pkcs7_message *pkcs7;
> #ifdef CONFIG_SYSTEM_BLACKLIST_KEYRING
> extern int mark_hash_blacklisted(const char *hash);
> -extern int add_key_to_revocation_list(const char *data, size_t size);
> extern int is_hash_blacklisted(const u8 *hash, size_t hash_len,
> 			       const char *type);
> extern int is_binary_blacklisted(const u8 *hash, size_t hash_len);
> -extern int is_key_on_revocation_list(struct pkcs7_message *pkcs7);
> #else
> static inline int is_hash_blacklisted(const u8 *hash, size_t hash_len,
> 				      const char *type)
> @@ -50,6 +48,12 @@ static inline int is_binary_blacklisted(const u8 *hash=
, size_t hash_len)
> {
> 	return 0;
> }
> +#endif
> +
> +#ifdef CONFIG_SYSTEM_REVOCATION_LIST
> +extern int add_key_to_revocation_list(const char *data, size_t size);
> +extern int is_key_on_revocation_list(struct pkcs7_message *pkcs7);
> +#else
> static inline int add_key_to_revocation_list(const char *data, size_t siz=
e)
> {
> 	return 0;
>=20

