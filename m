Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D26E9339B4F
	for <lists+keyrings@lfdr.de>; Sat, 13 Mar 2021 03:37:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231597AbhCMCg4 (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Fri, 12 Mar 2021 21:36:56 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:38044 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232255AbhCMCgg (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Fri, 12 Mar 2021 21:36:36 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12D2aORw038816;
        Sat, 13 Mar 2021 02:36:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=content-type :
 subject : from : in-reply-to : date : cc : content-transfer-encoding :
 message-id : references : to : mime-version; s=corp-2020-01-29;
 bh=ZCoW2+RJRu4zaBTQ7Q+n4HjVHt94vShM2V4zEtCafNg=;
 b=iVPpBG5jm+y8z8HcSxKJ2ckntqNn2mH2+/RKURaHUxRp18uPjPUOsTrLVfZXJcAaMN2H
 v4O4J7GvjwbuCuCvpMAJ46FhOlBEwwzW08BcOfn9thrAsC8m2JVs5HsLhWAbTXQExWGo
 wBVTpbNoROaPrDnjP7tZ7xHfIjadbJZQn698xzOoAYrZektl2f/z1XegTB8f63Bke4Vw
 UJ/0xJAp4UEYoSqzdiDeDBHzbGCmXxvTNxfnwjVDAyeQ0idVPeDPPcqNQwQ/VEKuplmV
 hwB7xRgHDaieq5fMu1X9iBOG7uZj8lgKrBtvY78+1fJU6zi+3PEpxqc4wL4fNvlawnFa 6g== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by userp2130.oracle.com with ESMTP id 37415rkqwg-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Sat, 13 Mar 2021 02:36:23 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12D2VXPU104053;
        Sat, 13 Mar 2021 02:36:23 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam08lp2175.outbound.protection.outlook.com [104.47.73.175])
        by userp3030.oracle.com with ESMTP id 378jgtfy7h-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Sat, 13 Mar 2021 02:36:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OVIg7iD403frQzRGjor7tlknGKFYwepXWrpZ5LwFAuLlcWwheFzBQSNVzeQX7XVzE8YWqitCgfhJM1cq5lv0Fo/zOczYWfVa+hbYX2abSZ7cjNiElQGYBIWvHjwegL5EydYnA4GZ97lDczoSEaRkKz6IRnG88z9Wlq6K+qHd3ryOIdzLQrFLF277CE+kQlEBk4Sr+AG49DhABgf6V0cRnUJBV2k4VwUy+xFCzA6jRn/GQB9MBnr1+TJqew4uYvgen7Kjh7ReqSaJ+iKOGGOvxR94PKZ6Jm9c5tTvSCxd3pvx7bv6LQJ+xUbyDbcS1i9foiyegFVhjiA19rE19/W8cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZCoW2+RJRu4zaBTQ7Q+n4HjVHt94vShM2V4zEtCafNg=;
 b=P90/zpLjnZ0H+Qcg2kaFW6SGqus9kfZS+JXs4uIhmypnCeOK5NL1/ilfORcCbYNRkRmZZpdR9ijwB3rPIr1tZzksHUjWnZHCPi+1Ch3IakW2tMAs7JN66bc294jEh/up/BynAv1Nma/9PXhDgq/i7zfEGTTTV+3nT7JfuXMpueQPLhiplqE8GYLfyrjdcglHD93KQFspXyFS7pCKiYWBeKGDZ45svCSG2V+fCFKw7GXhBG8oLGFUMmxbBTjzpPD5pKdOvNUnClRPEVO/uwxHj23bcKtotSq1X1M8q/u7z1fhyGIUAhadPVRFT6VvY727XYf/bWgFJmepd3IoAKRDkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZCoW2+RJRu4zaBTQ7Q+n4HjVHt94vShM2V4zEtCafNg=;
 b=n4a2Blylk5BCnQwKACeo3cj2u/+0PcFokOz+xVbq0vPCcJocd7+mBWSO1Sy5G9d/fUVd9tHz5h5Fhd2ddbfSNoky/93v1E/6HoElr4qHT0/ThBucfO/xMnEGnRiefbJRGIlq+toZA+cbxuAkWEsink0m2Egp/k9iiNWzlmGSoxY=
Authentication-Results: canonical.com; dkim=none (message not signed)
 header.d=none;canonical.com; dmarc=none action=none header.from=oracle.com;
Received: from CH2PR10MB4150.namprd10.prod.outlook.com (2603:10b6:610:ac::13)
 by CH2PR10MB4342.namprd10.prod.outlook.com (2603:10b6:610:a4::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.30; Sat, 13 Mar
 2021 02:36:20 +0000
Received: from CH2PR10MB4150.namprd10.prod.outlook.com
 ([fe80::95df:950e:af4c:a5df]) by CH2PR10MB4150.namprd10.prod.outlook.com
 ([fe80::95df:950e:af4c:a5df%9]) with mapi id 15.20.3933.032; Sat, 13 Mar 2021
 02:36:19 +0000
Content-Type: text/plain; charset=utf-8
Subject: Re: [PATCH 4/4] integrity: Load mokx variables into the blacklist
 keyring
From:   Eric Snowberg <eric.snowberg@oracle.com>
In-Reply-To: <b10f51dc-b9d7-e84d-3a52-438ebd358a7d@canonical.com>
Date:   Fri, 12 Mar 2021 19:36:13 -0700
Cc:     David Howells <dhowells@redhat.com>,
        James Bottomley <James.Bottomley@HansenPartnership.com>,
        Jarkko Sakkinen <jarkko@kernel.org>,
        =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>,
        keyrings@vger.kernel.org, linux-security-module@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <337B72A8-C81A-4C53-A4D6-FFFD7FA66CEC@oracle.com>
References: <161428671215.677100.6372209948022011988.stgit@warthog.procyon.org.uk>
 <161428674320.677100.12637282414018170743.stgit@warthog.procyon.org.uk>
 <4b275a33-28ac-78c2-e075-ea2eda4f13a8@canonical.com>
 <92182F5F-327E-4F1D-A7D9-42355625C84C@oracle.com>
 <b10f51dc-b9d7-e84d-3a52-438ebd358a7d@canonical.com>
To:     Dimitri John Ledkov <dimitri.ledkov@canonical.com>
X-Mailer: Apple Mail (2.3273)
X-Originating-IP: [24.52.35.144]
X-ClientProxiedBy: SJ0PR05CA0108.namprd05.prod.outlook.com
 (2603:10b6:a03:334::23) To CH2PR10MB4150.namprd10.prod.outlook.com
 (2603:10b6:610:ac::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.16.177.128] (24.52.35.144) by SJ0PR05CA0108.namprd05.prod.outlook.com (2603:10b6:a03:334::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.10 via Frontend Transport; Sat, 13 Mar 2021 02:36:18 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 27a6a888-cf71-4593-0d81-08d8e5c8c8cd
X-MS-TrafficTypeDiagnostic: CH2PR10MB4342:
X-Microsoft-Antispam-PRVS: <CH2PR10MB43424C2509A649E87A4A1097876E9@CH2PR10MB4342.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ut3Pq6PHWgGbFOnWYMxDXdrRdsaR0J68Qq1XB4Aa2sxWcT0ySmd/cWX++uJhU2kmquk0rHCaDj+r6EV5TjamwKTBStk6ErvNggSrbmKgudnD/x9cv+c4enNuR9kLSEgij3pIpAW+yo5yi8E27gMqZ4D5L93LGve4reMCwaDj2L29tfiAAjCJSWpqaJ9soFy2uOP5VyfO6bibu1VhCLJNKwECeI7qgP5Plh0uNljZigyqdl7TJUUZSbEreSz8a8Yz5BTWjS8lbPfNdnqUDtTdU4cbkenXcMVrSb1So9Uw3oni+Gn7EcnFUlLn87U91zGE/d6g6RqWr4UVXOtZUvA5cFXVdJxuX0j0vj1zX2atRqEsN/GRgD0mb0WS2RzaahNLrj4jKDPnqgEhcyHxs/gMJtFcf1gjdWaOJBXPFwWc35TCYTepaMQ8UVPEi3pn+ESErqP1jIzvaLIOsZidHcKp/r1wdJofIUZ40rVvXq3G5pCb2+Il3WbPMT88RV5q9b0DONTL0iR0nlWMpCm+lBSP71Jv+3k9zgU4VP7zLIxUgFFFPC4YWS4aGxzmsx5J1rtaiD6DsM5woPh4afh/8muBa9UwXQEcEkT6Sy7fZrM9bs9HuDWEJ244Bl9zGzdwAvMDOM21LBK/tJcmIJOvTob/WvzOMiDUjf+J4DkXId/sw5c=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR10MB4150.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(376002)(39860400002)(366004)(396003)(136003)(478600001)(6916009)(5660300002)(8676002)(6666004)(2906002)(4326008)(53546011)(956004)(2616005)(52116002)(966005)(36756003)(44832011)(8936002)(26005)(33656002)(66476007)(66556008)(186003)(16526019)(54906003)(66946007)(6486002)(86362001)(83380400001)(316002)(16576012)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?b3RUUWJvMy80dnJVakQ5QmVQVG1pb3A5aisySFV4cWpKbm1sRG1XcE9NY0ky?=
 =?utf-8?B?RExtdWE1czZtUTUzcDR3cGx2SGVyTVFlNHlBcHV6UXdDQU9JMVVVRVp1S1lw?=
 =?utf-8?B?OVpHVUg3WHkxWm5weGhyWUVldm5DbUVucmo5SXRUR255ZkxNYWcyVy9TaVBk?=
 =?utf-8?B?RDVCTWFzQTNCaFNiaTNYWDY5NXluTUFXZmVwbkdqNXpudU5iQTkyR29zVHVy?=
 =?utf-8?B?cGxXc2FJT05RNG5Vc2JGSnJNcGFvTDR3eUprVzhaR0pzcEs2dzVGYXdkbGRj?=
 =?utf-8?B?bkN5TkEyZy9UclpTeWViamdXMzNKU2Z5bXBTVVcyVFFYanBFUEdiMzNRZVV3?=
 =?utf-8?B?ZFlGc1JQWitIU1RybjhRdGtBS3hheWN1ZmxBd2FiWFlVMDhHNE5UQmJIVFRT?=
 =?utf-8?B?M3U0TDd0UjhKWmNkYnBPTi9sN2oxd0JmK1k2dDdaYnFJMEVqcXdFWHBlN0ts?=
 =?utf-8?B?QlRXNDFhbFM4ZGRySEpra2RwbjRkR1JPWjZxck1wMzk3S3VybHRlZzVkemE0?=
 =?utf-8?B?czlQT2puc0dZQWg1ZTJZcE5VRk5YZWZKaWRXVHVQbXY5Y2IydmZZQzJUdjJv?=
 =?utf-8?B?cVZuU3JNSVpGaUJBbW8vQU9kTm5zTVhOMkdUY2M2TFp0NjI3RmlNMTVIZU1t?=
 =?utf-8?B?QkhuK1NVVThmeUVJQWFpVUlrN0trMEd4eng5ZVRyL2RzSFdJTTlTZ2U1a3BZ?=
 =?utf-8?B?dlZyb2swQWNMZDJudGVmTVJ0SVlBc2ZkUWtOdVhhVjB0M2w0Nk1xSDN5Slpk?=
 =?utf-8?B?RGw0OTZlRGszb3JzVWZYM09pUG5yK1pWbWNta3pxVUY4U2gwM2ZrMWU2WThT?=
 =?utf-8?B?RmI3dVJBNVR1QzQvQWUzL0RwR1pacmVUaGFZTGZuVy9xSW9iL3FOSjlha2l4?=
 =?utf-8?B?MDZkTVB0MHZudmVqMFZJaW9yZnV6VmpCdDZkRUM5M0NTQ0UrUXczTGZETk5h?=
 =?utf-8?B?Mzh5QXJEMUNQY0xCWUEyWjVTRGlTeGNlMG1qUHd4VkZKeElmdW9KSUhqRUt5?=
 =?utf-8?B?R0VIZE4rOHNsNkU5dzlRZEx3NTZ2amdvZyt5VWxOTEYybHhQUGhCa0FTVUYx?=
 =?utf-8?B?QzNLUThsZ3FSRWxMOTltMlFhcWlSTyttZWtZNDNZaUVsT2t2Z0ZBM1cvR2NR?=
 =?utf-8?B?YW8remp3WU1neW11Tk11b1kzYkhEWFl5c2JaeHJ6OUVnTzhDL2l4U1d5dnQ1?=
 =?utf-8?B?NGpKd3psWFV4VmFNZE80WlNaN3JmVmNuM3RoTHljUVdTbm0wWEg2bkE1T0N4?=
 =?utf-8?B?bXdnVzlXNmRQcFJqKzI5SFdxWUNOVDB4eWVKUGltUTJkQ1Z1LzFaN1UrU2Yw?=
 =?utf-8?B?ZXJNbUtwMEk0bENCMnJFa1BPdm14dTlZUTJMMjNpRlFBM29wRCt4Y2U1MnhB?=
 =?utf-8?B?TVcrQndBS0pxTzlmQmRCcEVwUGQ4dGxpYUNNVkRhV3hMT3ZwcCtwamxXWGhV?=
 =?utf-8?B?cWduaWpHQkVSenI2TzJkSStKcHI3Y2hMeEpkaGUySGFMTzBCMnNhWTBMUTRG?=
 =?utf-8?B?VXhwYW82MkJHNGtvbHlKWGdlT2o3N2lCbmo4a1k5UENZR1JRU1lCUHVncFBG?=
 =?utf-8?B?aXAzVW1tUmhlQ1p0algzNXNXdCtWRnVCODdLLzU4Rmx4UVRueWZlcE81dk4w?=
 =?utf-8?B?WHk3U2d5djJPcUpnR0pXdGJNNEYwOUtWdEdzU1NsYk1XOUZEZndFbmt3Z3R3?=
 =?utf-8?B?c01tTjZDMlk1WURHdW01QTFVRERXVXBjOXV1bWc5Qmd2QS80N0tZM0FmREp3?=
 =?utf-8?Q?bMC7UFkBvGxkuTKp4vRJ0LcFTXOlRZA0/lR56kw?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27a6a888-cf71-4593-0d81-08d8e5c8c8cd
X-MS-Exchange-CrossTenant-AuthSource: CH2PR10MB4150.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2021 02:36:19.9206
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bBvvd6XrgcrmdD+qk04vlTs+wJ316ytksjms0C4TIYrLG4uviFJ8hQiMp+DdlGDxiens/nPPzk3mmXJ4T0WeGigZaWRMqlfcsHzyKE/V9oQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR10MB4342
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9921 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 suspectscore=0
 malwarescore=0 mlxscore=0 phishscore=0 bulkscore=0 adultscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103130015
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9921 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 lowpriorityscore=0
 impostorscore=0 mlxlogscore=999 malwarescore=0 suspectscore=0 adultscore=0
 phishscore=0 spamscore=0 priorityscore=1501 bulkscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103130015
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org


> On Mar 12, 2021, at 4:53 PM, Dimitri John Ledkov <dimitri.ledkov@canonica=
l.com> wrote:
>=20
> On 12/03/2021 21:49, Eric Snowberg wrote:
>>=20
>>> On Mar 12, 2021, at 11:39 AM, Dimitri John Ledkov <dimitri.ledkov@canon=
ical.com> wrote:
>>>=20
>>> On 25/02/2021 20:59, David Howells wrote:
>>>> From: Eric Snowberg <eric.snowberg@oracle.com>
>>>>=20
>>>> During boot the Secure Boot Forbidden Signature Database, dbx,
>>>> is loaded into the blacklist keyring.  Systems booted with shim
>>>> have an equivalent Forbidden Signature Database called mokx.
>>>> Currently mokx is only used by shim and grub, the contents are
>>>> ignored by the kernel.
>>>>=20
>>>> Add the ability to load mokx into the blacklist keyring during boot.
>>>>=20
>>>> Signed-off-by: Eric Snowberg <eric.snowberg@oracle.com>
>>>> Suggested-by: James Bottomley <James.Bottomley@HansenPartnership.com>
>>>> Signed-off-by: David Howells <dhowells@redhat.com>
>>>> cc: Jarkko Sakkinen <jarkko@kernel.org>
>>>> Link: https://lore.kernel.org/r/20210122181054.32635-5-eric.snowberg@o=
racle.com/ # v5
>>>> Link: https://lore.kernel.org/r/c33c8e3839a41e9654f41cc92c7231104931b1=
d7.camel@HansenPartnership.com/
>>>> ---
>>>>=20
>>>> security/integrity/platform_certs/load_uefi.c |   20 +++++++++++++++++=
+--
>>>> 1 file changed, 18 insertions(+), 2 deletions(-)
>>>>=20
>>>> diff --git a/security/integrity/platform_certs/load_uefi.c b/security/=
integrity/platform_certs/load_uefi.c
>>>> index ee4b4c666854..f290f78c3f30 100644
>>>> --- a/security/integrity/platform_certs/load_uefi.c
>>>> +++ b/security/integrity/platform_certs/load_uefi.c
>>>> @@ -132,8 +132,9 @@ static int __init load_moklist_certs(void)
>>>> static int __init load_uefi_certs(void)
>>>> {
>>>> 	efi_guid_t secure_var =3D EFI_IMAGE_SECURITY_DATABASE_GUID;
>>>> -	void *db =3D NULL, *dbx =3D NULL;
>>>> -	unsigned long dbsize =3D 0, dbxsize =3D 0;
>>>> +	efi_guid_t mok_var =3D EFI_SHIM_LOCK_GUID;
>>>> +	void *db =3D NULL, *dbx =3D NULL, *mokx =3D NULL;
>>>> +	unsigned long dbsize =3D 0, dbxsize =3D 0, mokxsize =3D 0;
>>>> 	efi_status_t status;
>>>> 	int rc =3D 0;
>>>>=20
>>>> @@ -175,6 +176,21 @@ static int __init load_uefi_certs(void)
>>>> 		kfree(dbx);
>>>> 	}
>>>>=20
>>>> +	mokx =3D get_cert_list(L"MokListXRT", &mok_var, &mokxsize, &status);
>>>> +	if (!mokx) {
>>>> +		if (status =3D=3D EFI_NOT_FOUND)
>>>> +			pr_debug("mokx variable wasn't found\n");
>>>> +		else
>>>> +			pr_info("Couldn't get mokx list\n");
>>>> +	} else {
>>>> +		rc =3D parse_efi_signature_list("UEFI:MokListXRT",
>>>> +					      mokx, mokxsize,
>>>> +					      get_handler_for_dbx);
>>>> +		if (rc)
>>>> +			pr_err("Couldn't parse mokx signatures %d\n", rc);
>>>> +		kfree(mokx);
>>>> +	}
>>>> +
>>>=20
>>>=20
>>> My preference would be if the above hunk was moved into the
>>> load_moklist_certs() function which is called just below. Such that
>>> loading of MokListRT & MOkListXRT are done next to each other.
>>>=20
>>> And also implement loading the same way it is done for MokListRT -
>>> specifically via the EFI MOKvar config table & then via a variable.
>>>=20
>>> See 726bd8965a5f112d9601f7ce68effa1e46e02bf2 otherwise large MokListXRT
>>> will fail to parse.
>>=20
>> Is this support available from shim now?  Previously I thought only
>> MOK could be loaded from the config table, not MOKx.
>>=20
>=20
> It is about to become available across all distributions with the next
> shim as everyone is about to ship SBAT capable shims.

When I tested this change, I thought it was around 25+ certs and
hundreds of hashes before shim started having problems. Someone
needing the config list must really have a large list. It would
be nice of the MOKx in shim would support a TBS certificate hash,
it would really save space.

If MOKx will be available thru a config table in the next shim,=20
I=E2=80=99ll prepare a follow on patch to add this support.=20

> From my system with the next shim & 5.10 kernel I have:
>=20
> $ ls /sys/firmware/efi/mok-variables/
> MokIgnoreDB  MokListRT  MokListXRT  MokSBStateRT  SbatRT
>=20
> It's not just a single Mok variable, but _all_ mok variables are
> available from the mok-table that are used to determine mok state.
> Including whether or not db should be ignored, whether or not signature
> verification is turned off, and what are the SBAT generation revocations
> are, in addition to MokListRT & MokListXRT.
>=20
> For example, kernel could gain further functionality to honor the user
> choices and disable loading db controlled by MokIgnoreDB especially
> since shim chooses to not consider db certificates & hashes as trust-wort=
hy.

Isn=E2=80=99t this already handled by uefi_check_ignore_db()?


