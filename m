Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4DD38310193
	for <lists+keyrings@lfdr.de>; Fri,  5 Feb 2021 01:27:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231901AbhBEA0G (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 4 Feb 2021 19:26:06 -0500
Received: from aserp2120.oracle.com ([141.146.126.78]:56882 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231788AbhBEA0D (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 4 Feb 2021 19:26:03 -0500
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 11509AMl135377;
        Fri, 5 Feb 2021 00:24:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=content-type :
 subject : from : in-reply-to : date : cc : content-transfer-encoding :
 message-id : references : to : mime-version; s=corp-2020-01-29;
 bh=iUhErWrwdsYtOXAZj/2saTHcuE/jTVf3xctgEIZNEtU=;
 b=q+ymcYIvxzCU5fdtcEN9FEN84wPkTkrYc7996HAAupEnSFaprOgo8js2+pnm54bf0h0Y
 Q9+ORxvZcK3qsKVceyZGABMbm4j0Is5PoH+3QmG12//gnIPPantLBJ+d7ATB+PLZJHqz
 Gt5qALbzuJiidw6RVkubLyojyQWBuMDjslT0+37UrhyHbl2vXdht/TgCpZeGHNb9gXQU
 4406j9Ulne61MoRpvrYR7NsjjLWraumXsOPwq3Rnp1DBUAi13khUkUJqznxAaAeTl61G
 q2ipkAC/5w/on62TqPgYAs/Gt3nL99X5zBvUfjrF5DzClc9MycEEVCN6iwGTf/t3gq5O 9Q== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by aserp2120.oracle.com with ESMTP id 36cydm7st2-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 05 Feb 2021 00:24:46 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 11509c2V047050;
        Fri, 5 Feb 2021 00:24:45 GMT
Received: from nam04-bn3-obe.outbound.protection.outlook.com (mail-bn3nam04lp2050.outbound.protection.outlook.com [104.47.46.50])
        by aserp3030.oracle.com with ESMTP id 36dh1t70uk-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 05 Feb 2021 00:24:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PvQ+qvUHHwVGgDVa+OxHX0UqEoWYuZtKCLX5zvSe3+dXJH208war0oVzlReD3Zf7QaaeLkWm4t62zdfJUUfVB/hLLrkP1tSgHQ79uei/ymJ35R4URY0UUV/tY7J0u+LZjFlerlKi4rmxf3VIssKpYsdFO5mnCepOADmQB4s6/KGwwroBfOwvFpboWF6pR/W8+CUZ3zSaQty+g3fFdD76n9PpeUXrgl2cx5JQYjaHV8tuS8q0h2WfwP02AXdjFdrDk9oum5VpJ3W6PzxLQy4qpnLivB/a08iJv+ahWH7sbgLJRkVh9yGgYLFyd6ITEHH3GBfdUhCn4Z7naCW2q7AwLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iUhErWrwdsYtOXAZj/2saTHcuE/jTVf3xctgEIZNEtU=;
 b=MQ7F15Kdyrhu9nmPtSKx7IQ21/nQa1mp2mfOEpseFQa/Sl5jG6PDEOaJAX5MXV7b+1lNRtPvUwNu+JF5gGW4w05u8PejIe/p10xq+BLj8S9T61yY0QDmYq3zz9S2cYqWi7JUC8ck6Mfgy2rsdlr54a10U6/wat6MJ+updN38PVldpjCNwY+41f7RgbytPyWQ+ztu4GxUdx0sfx6Q7xfcECeCj/iotk63KabEE9ZTQewlOfsAH20/SyQBkDJTa2C3gZY9IUp5CLkiJar3AarzGFFOym/qAQqhS9xOP6NzFEECN+OEb13fN1JhWaAqesw3f5NZc1UtUqvKSwts5bLbNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iUhErWrwdsYtOXAZj/2saTHcuE/jTVf3xctgEIZNEtU=;
 b=QEtvX8FnJfLYm4DujfU+0cMCvZ8xedvy8I0vEmY5FFodoH3Ys8rS7KcATnrIX3Q8Mh7fSrpbNf/yENn4LAtnkaQuHhsh8Yn0laOTYTGKzLsdn9vjjr4MsEn7LCHmQHYSEMgeNboN0aUmKdJQG5qIxs3f7OElbiOOEB7LbWPfbG0=
Authentication-Results: digikod.net; dkim=none (message not signed)
 header.d=none;digikod.net; dmarc=none action=none header.from=oracle.com;
Received: from DM6PR10MB3099.namprd10.prod.outlook.com (2603:10b6:5:1ad::18)
 by DM6PR10MB3179.namprd10.prod.outlook.com (2603:10b6:5:1ac::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.17; Fri, 5 Feb
 2021 00:24:42 +0000
Received: from DM6PR10MB3099.namprd10.prod.outlook.com
 ([fe80::70bf:d626:5218:70e4]) by DM6PR10MB3099.namprd10.prod.outlook.com
 ([fe80::70bf:d626:5218:70e4%7]) with mapi id 15.20.3825.019; Fri, 5 Feb 2021
 00:24:42 +0000
Content-Type: text/plain; charset=utf-8
Subject: =?utf-8?Q?Re=3A_Conflict_with_Micka=C3=ABl_Sala=C3=BCn=27s_blackl?=
 =?utf-8?Q?ist_patches_=5Bwas_=5BPATCH_v5_0/4=5D_Add_EFI=5FCERT=5FX509=5FG?=
 =?utf-8?Q?UID_support_for_dbx/mokx_entries=5D?=
From:   Eric Snowberg <eric.snowberg@oracle.com>
In-Reply-To: <7924ce4c-ea94-9540-0730-bddae7c6af07@digikod.net>
Date:   Thu, 4 Feb 2021 17:24:36 -0700
Cc:     David Howells <dhowells@redhat.com>, dwmw2@infradead.org,
        Jarkko Sakkinen <jarkko@kernel.org>,
        James.Bottomley@HansenPartnership.com, masahiroy@kernel.org,
        michal.lkml@markovi.net, jmorris@namei.org, serge@hallyn.com,
        ardb@kernel.org, Mimi Zohar <zohar@linux.ibm.com>,
        lszubowi@redhat.com, javierm@redhat.com, keyrings@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-security-module@vger.kernel.org,
        Tyler Hicks <tyhicks@linux.microsoft.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <BFC930B3-7994-4C5B-A8EF-1DD1C73F5750@oracle.com>
References: <20210122181054.32635-1-eric.snowberg@oracle.com>
 <1103491.1612369600@warthog.procyon.org.uk>
 <10e6616e-0598-9f33-2de9-4a5268bba586@digikod.net>
 <A5B5DEC0-E47A-4C3D-8E79-AF37B6C2E565@oracle.com>
 <7924ce4c-ea94-9540-0730-bddae7c6af07@digikod.net>
To:     =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>
X-Mailer: Apple Mail (2.3273)
X-Originating-IP: [24.52.35.144]
X-ClientProxiedBy: BY5PR17CA0058.namprd17.prod.outlook.com
 (2603:10b6:a03:167::35) To DM6PR10MB3099.namprd10.prod.outlook.com
 (2603:10b6:5:1ad::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.16.177.128] (24.52.35.144) by BY5PR17CA0058.namprd17.prod.outlook.com (2603:10b6:a03:167::35) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.17 via Frontend Transport; Fri, 5 Feb 2021 00:24:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a8d4721d-4f07-4b63-02bd-08d8c96c6ea8
X-MS-TrafficTypeDiagnostic: DM6PR10MB3179:
X-Microsoft-Antispam-PRVS: <DM6PR10MB3179BEDA44165031B802CEB287B29@DM6PR10MB3179.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2399;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ppu4M5h5i8mQg73ICLanX4EuSI2ga+4JnwNWztFN4ikpfpd2sEg699wDH3b/Pok3qkf4iLC0v5VT5q73/6A5HaeRx2W7dtgEFmf3x9MuqH94BrvkpDdIkaHp6jk/n4R1Fr5QoxYbv5kZ2qzmoYlkDGqHdiM8/NLxhTlZWHiIja4onuTm7YrvmWrEzvEJU5J9JN9567+LF+7pN2I/en3vumLgX6SJbB2mTlRRqy+TZ1PMwb0Bxcn57MtLv/JIlmigjoEbr1QfNbUE+pp57EYzHYZhuubYMNUwOc2u2VebYkMctPmZpiZr8mkNeO+t2fuBcZp+HLG7qtxIQzH6dhZ/BIh7h5fEZLTHT+2IGpaCm31YouAAP8vT9fScS0yxx2a2P1efWK1t499ngSiMeOTLrxp8H8j1TKrF7aY3rX3AkXGpUrfFd5EER218P47uLzqFptn4xl7F8r4wFwI8GyAEUEBKTj5s3myz7sZJ0zM/XbF7bd1O8CrC6fkUQN1Rvr+SMiQy8jLOP/TD7CFlfnUzd/slr6MRkumFSjz8WZSgRCnu1eAzl/EylbQv/QPUTIY5/tY40DDDq7h5AXFckvwSMQH6JDjEeY/stAwb16R5supOHX8hTzlWNqPq1fbFCxcEeffYwgglMCOz4XFnL7HgFIpfk7UzjCKDiMOhDEl+5Fo=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR10MB3099.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(376002)(346002)(366004)(136003)(39860400002)(956004)(52116002)(53546011)(966005)(6916009)(26005)(8936002)(33656002)(16526019)(5660300002)(66946007)(186003)(86362001)(316002)(54906003)(6666004)(2906002)(66556008)(66476007)(2616005)(4326008)(7416002)(36756003)(224303003)(83380400001)(66574015)(16576012)(478600001)(6486002)(44832011)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?akJTTCt6WHFhYW5YSEs2QmtIYnY5V3lVOTQ4MTVISHhJa25INkpkajMwTWVF?=
 =?utf-8?B?dFJGZVhFTG5aWmdjOGd1dUZaSStTb1VCUGJhZTMraHZ2LzZmKzB4NHdSZGcx?=
 =?utf-8?B?b01pUlVzcjNhajdKRkplZVUzQ2JaVkUwWUJaMVRrTDVUUHVTSGJlcnJzNVFn?=
 =?utf-8?B?NEhlcDk5MFcrMUFxK095UUxaWExESHdQcHpZMXdtUGR2WXhpMW4xQ0ZjN214?=
 =?utf-8?B?ZTl6SGZHSkw4SmVadHFtYTZaZ1BiQ2ZvVUJCdEw1WUlXdWZlSEIyYm8vSFJq?=
 =?utf-8?B?eHladVJOM29zSXpqb0FPeEtOQk5xdUNVb29jUUo0Z3dzdWd4ZWFOR3Z5Qm5k?=
 =?utf-8?B?NDRHcUNnRERoVGVsUEgvcVh0NDQxZWYrOTFsL1YrN3V2L1VOc3RtbWtOd05Q?=
 =?utf-8?B?VWMzYkFNeDhDcXFYVE9UbTdDcEFDQWRrZnBNZnk1OTV3WUNtblY4ZytOWUdk?=
 =?utf-8?B?SU1qQldEenVEU2xLQ0NsWEM5OTRuWU1jQU03RzRYUXllZ1pxS1ZNWG0ydmpZ?=
 =?utf-8?B?ejVLYmpqMzBNYmdUYlZ0Qm1UcmdhREZCTFdPUForZWpNU2hjMTdZZ3Vvc1No?=
 =?utf-8?B?a1ZBTThvbXIrSUl2VnV4QUVIRGQ0bFMvcTF6dStsREdzc2ZoWnRFQ0dObzhi?=
 =?utf-8?B?Vmo3Tlk0MzBzZFpSV3RwWnYxTGdQb1FqakE1aXFLUCthN2ZtK1k4c1BFSnR0?=
 =?utf-8?B?WEtzR0ViOUNCVVBkeXArdC9RUVpib0dUWm1neDh6cGpvSzM5aDhRM0ZMYUFm?=
 =?utf-8?B?aVVZeVFnc2x5cUJ1MjRtTDRtOXg1NmMrMHhpT0hhN1pzVzIvdjhtdFVueWZ2?=
 =?utf-8?B?T1BTcFJRZWdCV0xlZzRGRXczSGR2eWFOVFR4UDlhdVA5b0dKNE1JR01jSDEv?=
 =?utf-8?B?ajQzaE1ralFpQmZ3WDhrcmFJNjQrQ3FhWDhHb2QrNm1pWDJwS2ttRGxpOFFK?=
 =?utf-8?B?RU9jakFRRGJqNWpoWVZnbzVQa0lUYy8xbzZLY3V3bllLSkpFY1hyRklIMUN0?=
 =?utf-8?B?bnJ0clBCWFVDLy9HeEQrKzFqemE3dXc1cTZMeDBuMlRwM0hDVXVMcjFWL0J6?=
 =?utf-8?B?YUtQQkpIK0oxN2IycFlFb3BWRWVQTmp6d3ZlRGZsK3ArT3FIZUIveS8ybHR3?=
 =?utf-8?B?K2RWMWZZcm12Z3JoUVJ5MHgwcUtuVXNudllmanBtMFNuUENIMWpjQUNZMDZt?=
 =?utf-8?B?cEtMQkhBVHJadGFTUGQwNlBOb3Y4ME9JMm0wdlI2TFpZekZBaS9MRm0wdGxG?=
 =?utf-8?B?L1l3NTg5MEVVWWM0YnFVc1pjUlBsdWw4S1NIdmNEL0ZLeWY0dEJ1VEFkVElM?=
 =?utf-8?B?RlNjR1JwTnZ3ZE92M1ByTzh2UTdNZEl0YUpYdEVHdDhkSnRvZXVaL000aDhT?=
 =?utf-8?B?L0gxK0RtQVFqUmRkd1FlK2M4UXIzQmlJb2RZMEpMdFJySk9leDZOcUZkWkFE?=
 =?utf-8?B?ZnhWc2VUMkhxVC9DMjU0dmxQS3pKdTBCOGJSYmQ3d3c2akx1dmhXYkM3R2JW?=
 =?utf-8?B?ZHBXQ081aVBFdkVrQkQ2R2RoejRYY1dGY1lvc2k2RWxpL292aVZxNXI1NkFP?=
 =?utf-8?B?TTJpQ2xwUmd3UUhMM2JGc2s2OUQrRklhRGs2RGlNRjF1MHUrWkJxbk01bXQ1?=
 =?utf-8?B?eGVMS2tFNHdZNkVuQ3BqakZRakQ4T2dna1lya0VQYlYremRROERpRERwdm9w?=
 =?utf-8?B?MnlVa2l4VjEzQUhTam9lejRJSTgzNFlHUFVFajBSQWJDaTl6VURHcDEzOGdv?=
 =?utf-8?Q?77KoO5gIJuNrtU7Fe0OZkpl/aAgcitrfUlvuX85?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8d4721d-4f07-4b63-02bd-08d8c96c6ea8
X-MS-Exchange-CrossTenant-AuthSource: DM6PR10MB3099.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2021 00:24:42.5199
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K0l8ETLETYDWXiOsFfjyHXO4Ic7yDwXIiSvNRgzVLKGyPfcRC+jYfSuPK/ykR2pKekjS2OxMNnwPsF/ByfgWm+7VRMfwy5b7pxU0R3oru7g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB3179
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9885 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 spamscore=0 phishscore=0
 suspectscore=0 mlxlogscore=999 bulkscore=0 mlxscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2102040148
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9885 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 clxscore=1015
 spamscore=0 lowpriorityscore=0 phishscore=0 mlxlogscore=999 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102040148
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org


> On Feb 4, 2021, at 1:26 AM, Micka=C3=ABl Sala=C3=BCn <mic@digikod.net> wr=
ote:
>=20
>=20
> On 04/02/2021 04:53, Eric Snowberg wrote:
>>=20
>>> On Feb 3, 2021, at 11:49 AM, Micka=C3=ABl Sala=C3=BCn <mic@digikod.net>=
 wrote:
>>>=20
>>> This looks good to me, and it still works for my use case. Eric's
>>> patchset only looks for asymmetric keys in the blacklist keyring, so
>>> even if we use the same keyring we don't look for the same key types. M=
y
>>> patchset only allows blacklist keys (i.e. hashes, not asymmetric keys)
>>> to be added by user space (if authenticated), but because Eric's
>>> asymmetric keys are loaded with KEY_ALLOC_BYPASS_RESTRICTION, it should
>>> be OK for his use case.  There should be no interference between the tw=
o
>>> new features, but I find it a bit confusing to have such distinct use o=
f
>>> keys from the same keyring depending on their type.
>>=20
>> I agree, it is a bit confusing.  What is the thought of having a dbx=20
>> keyring, similar to how the platform keyring works?
>>=20
>> https://www.spinics.net/lists/linux-security-module/msg40262.html
>>=20
>>=20
>>> On 03/02/2021 17:26, David Howells wrote:
>>>>=20
>>>> Eric Snowberg <eric.snowberg@oracle.com> wrote:
>>>>=20
>>>>> This is the fifth patch series for adding support for=20
>>>>> EFI_CERT_X509_GUID entries [1].  It has been expanded to not only inc=
lude
>>>>> dbx entries but also entries in the mokx.  Additionally my series to
>>>>> preload these certificate [2] has also been included.
>>>>=20
>>>> Okay, I've tentatively applied this to my keys-next branch.  However, =
it
>>>> conflicts minorly with Micka=C3=ABl Sala=C3=BCn's patches that I've pr=
eviously merged on
>>>> the same branch.  Can you have a look at the merge commit
>>>>=20
>>>> 	https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git=
/commit/?h=3Dkeys-next&id=3Dfdbbe7ceeb95090d09c33ce0497e0394c82aa33d
>>>>=20
>>>> 	(the top patch of my keys-next branch)
>>>>=20
>>>> to see if that is okay by both of you?  If so, can you give it a whirl=
?
>>=20
>>=20
>> I=E2=80=99m seeing a build error within blacklist_hashes_checked with
>> one of my configs.
>>=20
>> The config is as follows:
>>=20
>> $ grep CONFIG_SYSTEM_BLACKLIST_HASH_LIST .config
>> CONFIG_SYSTEM_BLACKLIST_HASH_LIST=3D=E2=80=9Crevocation_list"
>>=20
>> $ cat certs/revocation_list
>> "tbs:1e125ea4f38acb7b29b0c495fd8e7602c2c3353b913811a9da3a2fb505c08a32=E2=
=80=9D
>>=20
>> make[1]: *** No rule to make target 'revocation_list', needed by 'certs/=
blacklist_hashes_checked'.  Stop.
>=20
> It requires an absolute path.

Ok, if I use an absolute path now with CONFIG_SYSTEM_BLACKLIST_HASH_LIST=20
it works.

> This is to align with other variables
> using the config_filename macro: CONFIG_SYSTEM_TRUSTED_KEYS,
> CONFIG_MODULE_SIG_KEY and now CONFIG_SYSTEM_REVOCATION_KEYS.

I just did a quick test with CONFIG_SYSTEM_TRUSTED_KEYS. It looks like we=20
can use either a relative or absolute path with CONFIG_SYSTEM_TRUSTED_KEYS.=
=20
Shouldn=E2=80=99t this be consistent?

> Cf. https://lore.kernel.org/lkml/1221725.1607515111@warthog.procyon.org.u=
k/
>=20
> We may want to patch scripts/kconfig/streamline_config.pl for both
> CONFIG_SYSTEM_REVOCATION_KEYS and CONFIG_SYSTEM_BLACKLIST_HASH_LIST, to
> warn user (and exit with an error) if such files are not found.

