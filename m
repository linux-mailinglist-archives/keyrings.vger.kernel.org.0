Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 54157336851
	for <lists+keyrings@lfdr.de>; Thu, 11 Mar 2021 01:05:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229641AbhCKAEw (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 10 Mar 2021 19:04:52 -0500
Received: from aserp2120.oracle.com ([141.146.126.78]:60932 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229828AbhCKAEs (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 10 Mar 2021 19:04:48 -0500
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12ANtUj3119734;
        Thu, 11 Mar 2021 00:04:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=content-type :
 subject : from : in-reply-to : date : cc : content-transfer-encoding :
 message-id : references : to : mime-version; s=corp-2020-01-29;
 bh=QbwWCSn0lrodqIPqB3dNEQN0s+UNysahp4QjGWBQOrE=;
 b=gIVZSg22WoaSp8GEWOV0eqdlWWPXbfQLqza62QszkX+r14DnUXMFBM0lspM69Z5Tce22
 b13sNjf6+Tmw3ozFqbD1V5a72LoCnCQ73qMPkYbjISMj3ahx2ns3/K3lpxqNUcp5t1jO
 rzez/X+6l+RJlR0aIkEvMry13SEvY7+6rL5qBxevsL0bhyjwoetof962mYKMkurGWGOG
 jhnZlTaF/rgD9llBZkHRXCRcAp/XQTBl6TDAJXKj20yN8qOZOjU2Adh8CDvHr2I6DYic
 U0e4pyBakBXm63hH2GPLtnxM6p6/cDaaGCSntdy3BqRqdVfROz68tyC7knSHhPsbfdtK 0Q== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by aserp2120.oracle.com with ESMTP id 3741pmmvkq-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 11 Mar 2021 00:04:10 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12ANtYY1073873;
        Thu, 11 Mar 2021 00:04:09 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2171.outbound.protection.outlook.com [104.47.55.171])
        by aserp3020.oracle.com with ESMTP id 374kn1pnsc-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 11 Mar 2021 00:04:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cGm3gUx1eiWfnY378F+o8kTPzK6PA2rp4FYAsfyekse4iRy2bfAPnneW5Ay5T0cZ50/UiZyJm3w44lS7HF/FmAYnoju53Q7/yRYAsdCyafaWsOtK7VP8DX+do9Nug7Rk0cy9p5D06W6Wi7h8olMraRR9//SUzOKQ0Gh9HJwCKVenufTShS2AK40aK+q4vxLMJt11VVOJZEikgxMi0jP/o+IMbfBKaqo/7cZaolR22TCXvMpguJsJnz3vyR3F9lq0hyhjO3yOnZ8OI3AT6IsWrpIJGU25RTC41RW+Rl+7jyXHQuedVG4JtPlqVDnZE+uqqtzSsOeMug1NfyJr+mKcug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QbwWCSn0lrodqIPqB3dNEQN0s+UNysahp4QjGWBQOrE=;
 b=O15YQkvIvz7cx5ti6b8DFZI5Ja2qCNhq1IVAq57LK/pv9GyFllrFBlS6xTFqzLDSkNnH6/7sp3b26ymXwcyKKhbsfchHEGUdyrOJeIFvlLO1bUqCzvQFdusGjMtmnzBlwTc9AurgliheVeGffe8nOgvVeUcTQsLkWMLO9z7sG0TYhbLxkQYn0NdI71Y8A+Fr3YvywPq1B3y72gZvy2UkrnXYyU8OIJuLQ3cHPKcx0j2w+jy7/HkNQXsXQa0KnQwuTb4MRA04MHMnWokILQNpGbOJSW4zJN3vFGwLNng1KdFDtjMeAWjc27egHeWDeGMqhmwoBA0Gex9T4LD7bmxkTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QbwWCSn0lrodqIPqB3dNEQN0s+UNysahp4QjGWBQOrE=;
 b=wX7FyKNQp3bmAtVqyXQn/7aHle5pl5N7meoOPYU5LS3fWjOvKdxF9o2KZM1Yrrg5ubP6YgJSWMC9O4aWrf2hWA8Pu3stw2S5ssrqY5ZhSO7gaWU8zjvjVehH/GYn9TPpyrbxoE7xs6jBouZOf3pxa7jGXxZCb8Cf2bHipnOqDec=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=oracle.com;
Received: from CH2PR10MB4150.namprd10.prod.outlook.com (2603:10b6:610:ac::13)
 by CH0PR10MB5260.namprd10.prod.outlook.com (2603:10b6:610:c4::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17; Thu, 11 Mar
 2021 00:04:06 +0000
Received: from CH2PR10MB4150.namprd10.prod.outlook.com
 ([fe80::95df:950e:af4c:a5df]) by CH2PR10MB4150.namprd10.prod.outlook.com
 ([fe80::95df:950e:af4c:a5df%9]) with mapi id 15.20.3912.030; Thu, 11 Mar 2021
 00:04:06 +0000
Content-Type: text/plain; charset=utf-8
Subject: Re: [PATCH v2] certs: Fix wrong kconfig option used for
 x509_revocation_list
From:   Eric Snowberg <eric.snowberg@oracle.com>
In-Reply-To: <YEkhYtQD68Qy/gcA@kernel.org>
Date:   Wed, 10 Mar 2021 17:04:02 -0700
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        David Howells <dhowells@redhat.com>, nathan@kernel.org,
        dwmw2@infradead.org, keyrings@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <49B7E289-5B29-4173-8C3A-A0D1BA95AC10@oracle.com>
References: <20210304175030.184131-1-eric.snowberg@oracle.com>
 <YEkhYtQD68Qy/gcA@kernel.org>
To:     Jarkko Sakkinen <jarkko@kernel.org>
X-Mailer: Apple Mail (2.3273)
X-Originating-IP: [24.52.35.144]
X-ClientProxiedBy: CH0PR03CA0119.namprd03.prod.outlook.com
 (2603:10b6:610:cd::34) To CH2PR10MB4150.namprd10.prod.outlook.com
 (2603:10b6:610:ac::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.16.177.128] (24.52.35.144) by CH0PR03CA0119.namprd03.prod.outlook.com (2603:10b6:610:cd::34) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17 via Frontend Transport; Thu, 11 Mar 2021 00:04:06 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 45db36ce-3fc9-49b3-cbda-08d8e4213034
X-MS-TrafficTypeDiagnostic: CH0PR10MB5260:
X-Microsoft-Antispam-PRVS: <CH0PR10MB52607ACEB33EE7DEA1FE210587909@CH0PR10MB5260.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1468;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8g+nTcIy9ugnjhH9tiUY/LsVcVVYwELdIy6kDbFupy1vVOQLIShveoMm30YhHRaC4Q6luAiW/wxvTaMUzEdtNYe7Xu4OrbjmGD5kyXP6ZqJuSE1VBRnG99MInuAeYhxbH733rNki6X2dY0HOaGSvhWg2oEHC3nvOoZnA2gZDgzLWhr++vjq4b5PZUY+DDMM5AX2hk3okkzCVblWkOtn+IL2oMrqdqzDddVs0K0elNrqjHiARK3mXXTIVDc5jIFZ3AO8fs6bsdzPW/V0DTfPCnYRq2pAm84vZtElZ7HO74AFFyctNHeQIobZVBBQnAR3TWHuuCe4b3M+0AZ7CGyW8mfdqeZSOlVAOTAuXV6tZU/GApGY6U13CJVwDxK4BBMUUIf0T2HVLkncor+TdnPI8gGmCodeBlGoxUGS3Ikljj541bDtUwORNrqxu2jcC9VY7rpNrYQnzDqbqnC2ZNxH1IeOsxzDZdy/LnrE+SwiH/9jAUuUR0thqKe5KzqORS9tRqNGZxyH8ueiH/H476SF1cWxZ3U49XpXhQXyN3mIFmtR5jWR1OMNSmvy/Oyfk+hl0HZ13ktjZfT+Wm1Irb4ZNtSnqGhVKeGvJW+27UG2nu9HSM/1SYf/yRNwoeKfJYlZdsDd/fL2O7NLk/gpBUDtENHsRlETCQtKsH8Jv4TNQSHM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR10MB4150.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(39860400002)(366004)(376002)(396003)(346002)(44832011)(8676002)(8936002)(6916009)(4326008)(956004)(36756003)(53546011)(66556008)(66476007)(66946007)(966005)(6486002)(52116002)(478600001)(6666004)(2616005)(5660300002)(2906002)(16526019)(16576012)(26005)(186003)(54906003)(86362001)(83380400001)(316002)(33656002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?bk9uYkpYSlJWMS8xSytGc1JZL0lidDFnc29kWEt4aXptUkNjbFJ5cUdNUFkv?=
 =?utf-8?B?MXlwWFg0WXZkdGdNSmhnSUhuUHB4Y2IxaW1IRVlxWTErSUVzcWk2ZUMvM0Yv?=
 =?utf-8?B?MUpTdENwZlN2NnZ3STZvWjdlcG5ldUlKZEIzMnhZM1FFTUtWNGhHVE5TRmkx?=
 =?utf-8?B?ckVWbTdNbjByYWZSWkh0cFIydnBBbFF5TUFVNEd4MHU3RlVGSFBacVlBaUxH?=
 =?utf-8?B?OXpjZXFqQzBIclIxSXRkQzNuU1NlSFVOUlROL2syNmRjcFAvTUZkR2dzbCt3?=
 =?utf-8?B?a2pPQzFiMHhYMGhqMnhSRkhmWDIwM3FHTWZ4LzJFdjRaR2hCODZCa0pDQUpE?=
 =?utf-8?B?ZDBNRGE3ZXRtbzZBSjM4aEYzb3dKRVhaZkpDeWcwMTdwQ2RhSVRwLytwSFlG?=
 =?utf-8?B?OEM0YjR5ejhMa09vRDcrWHJ1bzlOd1VUTTYyakQxMWZhbmNvTk5qZnNicUVz?=
 =?utf-8?B?RUsxalhhdHNLNWpMcjNtQ0VzU0tDVjI4bE05N2pqVXpIRUk0d25uSndvYkxQ?=
 =?utf-8?B?clpUYm1TRDI4WFdObktzdVFZRXF2RnM2UmorOUpVaDZQMWQ2RlVzWHN3bnlk?=
 =?utf-8?B?WVM5UGN5MjczOEtNOVdFeDdQZWY5WXAwUDZKdld0QkF0cWpWaDRXYmFMYjRt?=
 =?utf-8?B?UDlFaEJkdDVUQVU3Vjk4cEVQb1ZkR3ByMWgwcXRQSytKcERqRmZEcE5hcFhq?=
 =?utf-8?B?YTZTMFQ2blA0WHBFMEltTDVob2xXSlBZYS9ycU1ZWTl5OWRyb2hFall0Y2x0?=
 =?utf-8?B?Zk12akRqN09mSjFXUTAwS3VCeWZvWUJXSkw2MDdpSjAzVkVvZjRoRTkrQTA5?=
 =?utf-8?B?MmR3d2xUQ1dDeHh6WFQ0SVQrTEJaekRLeU9NdG5yVUNCbXJIdVdvS1FoMWI5?=
 =?utf-8?B?Nm5ZdGk2Q0x3YTN0bEJEejN5L0hqczZ3T2k1NitoVHlhWlMydk00N29ISUFG?=
 =?utf-8?B?UlVoWmhLUG1Fc0tZYlBObFQzZE5CV2dkdmRMUm9lUVQ4TFZlT2VYbnQ5dTAz?=
 =?utf-8?B?d2VISDBWWWVhR0hnZGNTUXUwNmpjUjIzR0g5amRvcXFkaS9aMGsrTEgzMUQ2?=
 =?utf-8?B?K0IwN0I5b0gybmJDMVlNQk5TMDdqeHFxRWJoSW1hc1RaK21jbk4rMXVSUUV6?=
 =?utf-8?B?UWt0VVY4Y3VrQlVORis4anBZdHlkRVlGbGY5TEh1TnZETC9UZ1FUaHlRaFRP?=
 =?utf-8?B?bkJoeXlNS3ZvREcxSUx0ZHZmZlVxZW1xZkFMYjFTRkFoUlc0RWxJYzNBZnZq?=
 =?utf-8?B?Q0FFbUZjN3lZZGpzTisvWFI2Zm9OemdYcWRmeTErWVF0cmVVZk1JSWVYTTVR?=
 =?utf-8?B?OXJSL1pnZndrYkxjRzAxMUR1MG91c05FTkwybzUxenkreHFHV25ZQTkybUlm?=
 =?utf-8?B?Q3d4SHZyaWRTaUNHU2lOOGhSQUk5MHBackFPamlCTzAyZWhWMUo4M3FQUVBN?=
 =?utf-8?B?L0JoaE5ZZ2hHOE4wa0o3ZCtXZkVUUmlpUGRzNDJqZ2pvOHVheHhmMFY0MHg4?=
 =?utf-8?B?MDJBYUZ0NENZZDFDK3N2cG9taU8yZ3lEK1lVOHZHYXowSitiS3Z5b0tTR205?=
 =?utf-8?B?c0VYaEtPRlhzSFZCR2l6Y3Exb1M0WFl1RGhCaVhlOEMreXI0MWs2RVZpdlNM?=
 =?utf-8?B?RWkzZDZpU0h4Y1V1SUMzTmNHa1N3UU9kV0R4dTRQa3ZVRTNhd3EvUVVmdkg0?=
 =?utf-8?B?KzB2c1M2MWpUWENacjVNZkpubnpVRFdYL3VhanpBa29pOEJPTVc3dXRwTjFB?=
 =?utf-8?Q?ZVHB+7sRNobejw1141JDE+rSCUU9CL0IZ2PDkE+?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45db36ce-3fc9-49b3-cbda-08d8e4213034
X-MS-Exchange-CrossTenant-AuthSource: CH2PR10MB4150.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2021 00:04:06.8149
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KQTR6rP7fKIXHiW/o38iKkblINjTg81Ohgqy/b7acswVK2Gk5aVLtpYoO4a4Qj3PBc4aMh/t2I+n+IvlxfEr+aUb42XFlNoLVO18Ma+Kirg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB5260
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9919 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 bulkscore=0 malwarescore=0
 spamscore=0 mlxlogscore=999 phishscore=0 adultscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103100116
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9919 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 bulkscore=0 mlxlogscore=999
 adultscore=0 impostorscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 phishscore=0 spamscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103100116
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org


> On Mar 10, 2021, at 12:43 PM, Jarkko Sakkinen <jarkko@kernel.org> wrote:
>=20
> On Thu, Mar 04, 2021 at 12:50:30PM -0500, Eric Snowberg wrote:
>> Fix a build issue when x509_revocation_list is not defined.
>>=20
>> $ make ARCH=3Dx86_64 O=3Dbuild64 all
>>=20
>> EXTRACT_CERTS   ../
>> At main.c:154:
>> - SSL error:0909006C:PEM routines:get_name:no start line: crypto/pem/pem=
_lib.c:745
>> extract-cert: ../: Is a directory
>> make[2]: [../certs/Makefile:119: certs/x509_revocation_list] Error 1 (ig=
nored)
>>=20
>> When the new CONFIG_SYSTEM_REVOCATION_LIST was added [1], it was not car=
ried
>> into the code for preloading the revocation certificates [2].  Change fr=
om
>> using the original CONFIG_SYSTEM_BLACKLIST_KEYRING  to the new
>> CONFIG_SYSTEM_REVOCATION_LIST.
>>=20
>> [1] https://lore.kernel.org/keyrings/EDA280F9-F72D-4181-93C7-CDBE95976FF=
7@oracle.com/T/#m562c1b27bf402190e7bb573ad20eff5b6310d08f
>> [2] https://lore.kernel.org/keyrings/EDA280F9-F72D-4181-93C7-CDBE95976FF=
7@oracle.com/T/#m07e258bf019ccbac23820fad5192ceffa74fc6ab
>>=20
>> Reported-by: Randy Dunlap <rdunlap@infradead.org>
>> Signed-off-by: Eric Snowberg <eric.snowberg@oracle.com>
>=20
> Got my first ever chance to try out b4:
>=20
> $ b4 am 20210304175030.184131-1-eric.snowberg@oracle.com
> Looking up https://lore.kernel.org/r/20210304175030.184131-1-eric.snowber=
g%40oracle.com
> Grabbing thread from lore.kernel.org/keyrings
> Analyzing 5 messages in the thread
> ---
> Writing ./v2_20210304_eric_snowberg_certs_fix_wrong_kconfig_option_used_f=
or_x509_revocation_list.mbx
>  =E2=9C=93 [PATCH v2] certs: Fix wrong kconfig option used for x509_revoc=
ation_list
>    + Tested-by: Nathan Chancellor <nathan@kernel.org> (=E2=9C=93 DKIM/ker=
nel.org)
>  ---
>  =E2=9C=93 Attestation-by: DKIM/oracle.com (From: eric.snowberg@oracle.co=
m)
> ---
> Total patches: 1
> ---
> Link: https://lore.kernel.org/r/20210304175030.184131-1-eric.snowberg@ora=
cle.com
> Base: not found
>       git am ./v2_20210304_eric_snowberg_certs_fix_wrong_kconfig_option_u=
sed_for_x509_revocation_list.mbx
>=20
> Wondering tho, what "Base: not found" means?

This was based off David=E2=80=99s keys-next branch, which I think has now
changed.  I probably should have sent this with the following base-commit:

base-commit: ea20ea8b8ba4d475ebc79da63350850780933a81

I=E2=80=99ll try to remember to make sure to have the base-commit added in
the future.

