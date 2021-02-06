Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B2C4311BB9
	for <lists+keyrings@lfdr.de>; Sat,  6 Feb 2021 07:24:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229596AbhBFGYc (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Sat, 6 Feb 2021 01:24:32 -0500
Received: from aserp2120.oracle.com ([141.146.126.78]:42038 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229536AbhBFGY3 (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Sat, 6 Feb 2021 01:24:29 -0500
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 1160ttZU023056;
        Sat, 6 Feb 2021 01:14:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=content-type :
 subject : from : in-reply-to : date : cc : content-transfer-encoding :
 message-id : references : to : mime-version; s=corp-2020-01-29;
 bh=lLQJxfCWoFSKigzqydeFxiNWGWnSJbMNBXaWAieMJHM=;
 b=ZDKy7xIfBoH1Zho1qMWMKvRaKtut6JyrTtfeQFYBaDRk8zHkN1ZwlbqcXrSQlqBom0A1
 RUZlNS4lOXfFWGa0Ue75mVHL1qgYgPdSjs7w9zLOpkZyzGKAvU+xX8nNVQ1oRXn0UIGP
 pTdCT9nV40Z00h6xFDMuVXbFKkbiqZ6I+ahNApw6Rb2aLegYlcTOAIJdmHa4yAsYBwp4
 F5kHbLWGxbKzQOb7Fc/ObWl3sMXLNvFxqMQTkRS20eVn+2ZwwOhoosPWUvqCHE+LI2x5
 i+jYw649qg8A3Fsm/DftOqc3BXwnEtqnBoqTHvbDpQHtPLPdXNSouVeRNROgFwhfAsxy 9w== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by aserp2120.oracle.com with ESMTP id 36cydmbha9-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Sat, 06 Feb 2021 01:14:21 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 11615va2067364;
        Sat, 6 Feb 2021 01:14:21 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2100.outbound.protection.outlook.com [104.47.70.100])
        by aserp3030.oracle.com with ESMTP id 36hh5909n6-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Sat, 06 Feb 2021 01:14:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ejRVyyA9Lt03R8BVUXgBBmFCM3hHMwyI4uEg5DGdbqQtOWvvpxAu/l6LpwHKmArIIXVZaP/W/gVI5VFOA+/hmrlD751Ru0H93mRG19KMDrC/ex0Q+8DT3ozhuwrogYdPzHamsu2QkPRYCnW8g4zyvu7sFHnuNONGroDHf9OKjiqEhuzoUwtC8NT41EKzyaaWRrH1C9c+P+pUtej+t/tLej5XZpINTQfSZE2Jrj6ONx/vzc+NC3YJfVVQX8cK05USN4NjEBkkqMAkmrFI40OPoWUX1sKjCeyAyInrylDyTIdrhXmH/oPGrCBC+wyRu/bzHLeSkFm7djGlDHCc11UuvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lLQJxfCWoFSKigzqydeFxiNWGWnSJbMNBXaWAieMJHM=;
 b=nJFaSf3rNJQIsHhDDcFaZe3sSegZfzNmfeFeHNfvCL19pGoQUWrJZjoD/yLhV1J6EEN2VrzWlt/eIEiPLdFPvKCZF8GAAGDfp+hAarbqQfi+VI7qTwh23otPJwa2XpvxLtVGGw8VeZVlvPPJCfilfNXz/SmoxkjNXyiOSrYkzEij9WaDrISISwqeR8ATtxzy/SwFSUrG9BdjjBqmKVDf+HEOkn+lHEKdYHNCNpJybTSmV6PIDw+rk0ECPVXkp1Vh+Oyrz4NCW/ANMn7ZzfUtfNTUBWUa06eycbweiVX4pcc1jJkQOVycH+IaPxC4BPWbxrZcJdrMryeTMdqCdEZJBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lLQJxfCWoFSKigzqydeFxiNWGWnSJbMNBXaWAieMJHM=;
 b=whTHWwypamxbmEfdRB7cUB4kOMpwq3rAEmQHdQ+YaPZonpEFuZoIoJ9HwAaMrMX6wKh+mRVjjQbg5HLi4LlyR02s2zdBfbLxclxghQrsbCjKb2vrjTc13wnB+kdPDSr0lpYhp6SUZRJaOS3I2Y+bReA9UmMKpwNhBuVztdh+Qcc=
Authentication-Results: digikod.net; dkim=none (message not signed)
 header.d=none;digikod.net; dmarc=none action=none header.from=oracle.com;
Received: from DM6PR10MB3099.namprd10.prod.outlook.com (2603:10b6:5:1ad::18)
 by DM6PR10MB2699.namprd10.prod.outlook.com (2603:10b6:5:b3::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.16; Sat, 6 Feb
 2021 01:14:19 +0000
Received: from DM6PR10MB3099.namprd10.prod.outlook.com
 ([fe80::70bf:d626:5218:70e4]) by DM6PR10MB3099.namprd10.prod.outlook.com
 ([fe80::70bf:d626:5218:70e4%7]) with mapi id 15.20.3825.019; Sat, 6 Feb 2021
 01:14:18 +0000
Content-Type: text/plain; charset=utf-8
Subject: =?utf-8?Q?Re=3A_Conflict_with_Micka=C3=ABl_Sala=C3=BCn=27s_blackl?=
 =?utf-8?Q?ist_patches_=5Bwas_=5BPATCH_v5_0/4=5D_Add_EFI=5FCERT=5FX509=5FG?=
 =?utf-8?Q?UID_support_for_dbx/mokx_entries=5D?=
From:   Eric Snowberg <eric.snowberg@oracle.com>
In-Reply-To: <dc6a4524-3935-fda6-40a8-cebf80942cdf@digikod.net>
Date:   Fri, 5 Feb 2021 18:14:12 -0700
Cc:     dwmw2@infradead.org, Jarkko Sakkinen <jarkko@kernel.org>,
        James.Bottomley@HansenPartnership.com, masahiroy@kernel.org,
        michal.lkml@markovi.net, jmorris@namei.org, serge@hallyn.com,
        ardb@kernel.org, Mimi Zohar <zohar@linux.ibm.com>,
        lszubowi@redhat.com, javierm@redhat.com, keyrings@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-security-module@vger.kernel.org,
        Tyler Hicks <tyhicks@linux.microsoft.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <188DE1AF-A011-4631-B88A-2C4324DA013B@oracle.com>
References: <20210122181054.32635-1-eric.snowberg@oracle.com>
 <1103491.1612369600@warthog.procyon.org.uk>
 <10e6616e-0598-9f33-2de9-4a5268bba586@digikod.net>
 <A5B5DEC0-E47A-4C3D-8E79-AF37B6C2E565@oracle.com>
 <7924ce4c-ea94-9540-0730-bddae7c6af07@digikod.net>
 <BFC930B3-7994-4C5B-A8EF-1DD1C73F5750@oracle.com>
 <dc6a4524-3935-fda6-40a8-cebf80942cdf@digikod.net>
To:     =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>,
        David Howells <dhowells@redhat.com>
X-Mailer: Apple Mail (2.3273)
X-Originating-IP: [24.52.35.144]
X-ClientProxiedBy: SJ0PR03CA0102.namprd03.prod.outlook.com
 (2603:10b6:a03:333::17) To DM6PR10MB3099.namprd10.prod.outlook.com
 (2603:10b6:5:1ad::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.16.177.128] (24.52.35.144) by SJ0PR03CA0102.namprd03.prod.outlook.com (2603:10b6:a03:333::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.20 via Frontend Transport; Sat, 6 Feb 2021 01:14:16 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 46e45ed1-4997-4a81-7849-08d8ca3c8718
X-MS-TrafficTypeDiagnostic: DM6PR10MB2699:
X-Microsoft-Antispam-PRVS: <DM6PR10MB26994D5346C912AE5F05084D87B19@DM6PR10MB2699.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9MsJWvXBFsoRe2lcHlP6zfQzAUYKSVU8exps/PmRGhY7UioymhLq5mjN9k4kEfou5TH16Q9UKb1uuL7aSinIBkjUaa9RO+uOw7Hkpp2DE3Pai/vv+6nY8il/mS9ZL9xr36C0OaZ7lfztJs3zgyvaANUd1FxS0+U2Kjmf9XuvCSU6MjOj0tJiYmF9HFycOoCeLr+h72RBssgd9Fi+IJ4OW4w1eIPKHhtWMCAXEnGGhMSClTKWN4py3Jx+08AgAeZgGAtX7m/Wqc+QBkbrwHH/VenDSKWJlODRdJXh5z8wyhzy74lTVfajYKxxvc/0f8Pn37HlrqAqT9i4VGOwnt9gXM2RChcBay+NrLPBRNorZqBvI/Px+7RFq5fKM1OuDlaSNPHVteEeLRsvJ6vLRVSJTCWcFzWPKh7XzoA4Ry8Qnle4Og0l6R6kUYpELLl+fn633eKgrJ9r3nCRSB0koBZuQ6QVnjfpMNSU+CDNk09lxSir2VBbXfF9IajoOScWiLRGfPqyv9zoQUah3z8CyMeogA4Rsvwpbthhc3LddCctWHCglOBNXzjO8EYpAhxla99/R+QZd2qTFkoxsq2ClUAcyVeCZ8VgkI3BDmxTxf5cYNQ0H75Npdi1TN8hJTgWPfreA9u+WpaG8sdGgJS1lmmAhkwJhgkXnA9Q4EAVhzfiE9M=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR10MB3099.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(39850400004)(396003)(376002)(346002)(136003)(366004)(66556008)(6666004)(8936002)(36756003)(110136005)(66476007)(478600001)(66946007)(956004)(224303003)(83380400001)(66574015)(26005)(7416002)(54906003)(5660300002)(2906002)(44832011)(186003)(33656002)(2616005)(52116002)(86362001)(16526019)(6486002)(316002)(53546011)(4326008)(966005)(16576012)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?aEhHNEtPTjQwQ3dPYi8xM2lIZThNckxXbGFNaTM4WWtZTUtOSEk1NEY3d0U2?=
 =?utf-8?B?K2tMSXE0Z2tGQk54MG9IWll4S1BFR05LQnR2d0kxTW9vNnppdnpFZDRobEtj?=
 =?utf-8?B?WlRZbGplc2RJSDRpR2puMkRRTU93dmxkZkRSNzd2Qy84eURldDJLaC8vUEFq?=
 =?utf-8?B?VmhNclBRN2FjUWtEcU1BM0hqTHZkb0tLUlZzVG1rUUc2TUMzK1ZuSWZmM3pq?=
 =?utf-8?B?WDUvQlVCOHZ6VVlKV3JwcTlNcEhDMnVvS0ZQN3ZkY2tEbVc3QVZ3VXIxc3o3?=
 =?utf-8?B?K1pEVnQ2bk1KbnpubnRwbjluUnJrc1hYMTNMSWx4Sk85NS9FMDBIYzlONWcv?=
 =?utf-8?B?aVRCeUdxOWQ2YzZPaFREMCtqc3RTMFhZenk4VFFYL29LTkR1T3hUaStBVEgx?=
 =?utf-8?B?TW5UUGZVTGo3bzhVZHVKYm1MejlCOXZoV2wvT0daQlZhd3Nvd2NOZ3VVRnFZ?=
 =?utf-8?B?MlBDTWkvRVFvek9oNTBxUlRHNXRSdVo0dDNOU0lGd0E5ODBVQ0NFWUhSSyt1?=
 =?utf-8?B?ZDVLRUovWGNZSEhsQldGTFQycHJvMkhMRFlsS1d4VUlyQlB4WThNZ3dORlQv?=
 =?utf-8?B?bVFWQzdRWDNNckRQOTRKTWd5b3kwZmsyOFFrQ21mSWJXUFBwSFdxbitKVVNm?=
 =?utf-8?B?dlBHOERkT0hIa0lmWmhYVjBCL3dGSE4xcVR1T2NvaXRUREErckxZYSs3dTRB?=
 =?utf-8?B?dHVwZjJveHNrQUFJQjBoOTJ1Y00vcTEybDh0QlhiTHp0SjloYTh5UXYwbUxn?=
 =?utf-8?B?V3RHWGwveXZqNVhPQ2NKU2Q2Z08rekpXSDRhUWdEaFVqM2YrVm96VlVTUnZP?=
 =?utf-8?B?NThvaG5FOWFhTzZXSWk1dUFPYXZReGJSZG9LdHplL1BJbThQQUhsaDZ6WTNN?=
 =?utf-8?B?eE9HUlpXdWlrWWdzblBMd2R4Z2xYaTFuVDBOYXN0Z2toMld3OEhRTXkzWjNW?=
 =?utf-8?B?K29OTldCZEdZTjBtY3l6L2F3QUpSUWY2YUlxbE45enV2VlNDbldZWjArNmxK?=
 =?utf-8?B?TjlZNlYyV3ZNU1VDc0J1TEFYQW50dnQ1TklCZ2s4RHhNZ01DNkN1Y1VPQ0or?=
 =?utf-8?B?TXJkckpOYklCQjJiSzZzc0k4azFFRERMYnFPZTlpcGZRSksva043elhWTGFt?=
 =?utf-8?B?dWFTZTdqKzlpUjVEMHZPdXJWaTJxVmtPdXVOaFNXU0NWK1dUUkdWSHVUNmpU?=
 =?utf-8?B?ZnpONjdva2FXd1JjZVgwY0dBb3Y4UTRCNTFHTmZTZUFRR3JMMHdGV2JlWnI4?=
 =?utf-8?B?ZzRrT3g2elVVYnJsS2prWGh3WVl0RmZwUEhDcVF5elRkamJTQWhPRjlnZWFP?=
 =?utf-8?B?c2dGSGptKzJTNDFXQXFENDRicmVCZGRtOTczYTg3SUZ3aG05YlVyblVaNTk4?=
 =?utf-8?B?a1Zzd2pxNzhpTStueFQ1RDN4c0s5UEw5dkFmalYvNVdsQThNNGw5RHRkVmVH?=
 =?utf-8?B?QWl0VzJpVnpldFM2TGRrcWljSnhYNVdXeDV0a0RoT2IxU3kxUk9TOXY4RXU1?=
 =?utf-8?B?ckkxemlWUVNWVGczK3lBUThINTlSZDdmdzlMdHFDbEU5KzgvZFBteGI1TmpU?=
 =?utf-8?B?UmtPRlZSRldmNjYwWUxCRUM1ckN3YVN2YnRxdVliNGdVdEJQNVUzSjBEQ2kr?=
 =?utf-8?B?RnQzV0hQNUNBN1I2azBaMHp4NWNkY0ViSkc2K0hqVUc1VWVET3gwM1p5TEdC?=
 =?utf-8?B?ei90QmFQMkxZOTlhQldocVE4c0J1WDM5dmxYTVFYT3l1dGwyd3V3RlB5MjFG?=
 =?utf-8?Q?PZGnIngdp5BLbf/J95toY2pEL+gX0fAeO+74Il8?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46e45ed1-4997-4a81-7849-08d8ca3c8718
X-MS-Exchange-CrossTenant-AuthSource: DM6PR10MB3099.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2021 01:14:18.8620
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +P2BoTqGVXTVRTP+3ecebm7OdLnYc5r85oW1pid+cVH/9AAoCX/1dxB34LNLdkI/tBcOrtoVoHkqrb/TYAUT7QFzROz1dmzFhKawKmZVvKI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB2699
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9886 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 suspectscore=0 bulkscore=0
 malwarescore=0 mlxlogscore=999 spamscore=0 adultscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2102060002
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9886 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 clxscore=1015
 spamscore=0 lowpriorityscore=0 phishscore=0 mlxlogscore=999 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102060002
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org


> On Feb 5, 2021, at 3:27 AM, Micka=C3=ABl Sala=C3=BCn <mic@digikod.net> wr=
ote:
>=20
>=20
> On 05/02/2021 01:24, Eric Snowberg wrote:
>>=20
>>> On Feb 4, 2021, at 1:26 AM, Micka=C3=ABl Sala=C3=BCn <mic@digikod.net> =
wrote:
>>>=20
>>>=20
>>> On 04/02/2021 04:53, Eric Snowberg wrote:
>>>>=20
>>>>> On Feb 3, 2021, at 11:49 AM, Micka=C3=ABl Sala=C3=BCn <mic@digikod.ne=
t> wrote:
>>>>>=20
>>>>> This looks good to me, and it still works for my use case. Eric's
>>>>> patchset only looks for asymmetric keys in the blacklist keyring, so
>>>>> even if we use the same keyring we don't look for the same key types.=
 My
>>>>> patchset only allows blacklist keys (i.e. hashes, not asymmetric keys=
)
>>>>> to be added by user space (if authenticated), but because Eric's
>>>>> asymmetric keys are loaded with KEY_ALLOC_BYPASS_RESTRICTION, it shou=
ld
>>>>> be OK for his use case.  There should be no interference between the =
two
>>>>> new features, but I find it a bit confusing to have such distinct use=
 of
>>>>> keys from the same keyring depending on their type.
>>>>=20
>>>> I agree, it is a bit confusing.  What is the thought of having a dbx=20
>>>> keyring, similar to how the platform keyring works?
>>>>=20
>>>> https://www.spinics.net/lists/linux-security-module/msg40262.html
>>>>=20
>>>>=20
>>>>> On 03/02/2021 17:26, David Howells wrote:
>>>>>>=20
>>>>>> Eric Snowberg <eric.snowberg@oracle.com> wrote:
>>>>>>=20
>>>>>>> This is the fifth patch series for adding support for=20
>>>>>>> EFI_CERT_X509_GUID entries [1].  It has been expanded to not only i=
nclude
>>>>>>> dbx entries but also entries in the mokx.  Additionally my series t=
o
>>>>>>> preload these certificate [2] has also been included.
>>>>>>=20
>>>>>> Okay, I've tentatively applied this to my keys-next branch.  However=
, it
>>>>>> conflicts minorly with Micka=C3=ABl Sala=C3=BCn's patches that I've =
previously merged on
>>>>>> the same branch.  Can you have a look at the merge commit
>>>>>>=20
>>>>>> 	https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.g=
it/commit/?h=3Dkeys-next&id=3Dfdbbe7ceeb95090d09c33ce0497e0394c82aa33d
>>>>>>=20
>>>>>> 	(the top patch of my keys-next branch)
>>>>>>=20
>>>>>> to see if that is okay by both of you?  If so, can you give it a whi=
rl?
>>>>=20
>>>>=20
>>>> I=E2=80=99m seeing a build error within blacklist_hashes_checked with
>>>> one of my configs.
>>>>=20
>>>> The config is as follows:
>>>>=20
>>>> $ grep CONFIG_SYSTEM_BLACKLIST_HASH_LIST .config
>>>> CONFIG_SYSTEM_BLACKLIST_HASH_LIST=3D=E2=80=9Crevocation_list"
>>>>=20
>>>> $ cat certs/revocation_list
>>>> "tbs:1e125ea4f38acb7b29b0c495fd8e7602c2c3353b913811a9da3a2fb505c08a32=
=E2=80=9D
>>>>=20
>>>> make[1]: *** No rule to make target 'revocation_list', needed by 'cert=
s/blacklist_hashes_checked'.  Stop.
>>>=20
>>> It requires an absolute path.
>>=20
>> Ok, if I use an absolute path now with CONFIG_SYSTEM_BLACKLIST_HASH_LIST=
=20
>> it works.
>>=20
>>> This is to align with other variables
>>> using the config_filename macro: CONFIG_SYSTEM_TRUSTED_KEYS,
>>> CONFIG_MODULE_SIG_KEY and now CONFIG_SYSTEM_REVOCATION_KEYS.
>>=20
>> I just did a quick test with CONFIG_SYSTEM_TRUSTED_KEYS. It looks like w=
e=20
>> can use either a relative or absolute path with CONFIG_SYSTEM_TRUSTED_KE=
YS.=20
>> Shouldn=E2=80=99t this be consistent?
>=20
> CONFIG_SYSTEM_TRUSTED_KEYS (and similar config) works with relative path
> to $(srctree) not $(srctree)/certs as in your example.

Correct, I had "certs" in my relative path.

> We can make CONFIG_SYSTEM_BLACKLIST_HASH_LIST works with $(srctree) with
> this patch:
>=20
> diff --git a/certs/Makefile b/certs/Makefile
> index eb45407ff282..92a233eaa926 100644
> --- a/certs/Makefile
> +++ b/certs/Makefile
> @@ -14,6 +14,8 @@ $(eval $(call config_filename,SYSTEM_BLACKLIST_HASH_LIS=
T))
>=20
> $(obj)/blacklist_hashes.o: $(obj)/blacklist_hashes_checked
>=20
> +CFLAGS_blacklist_hashes.o +=3D -I$(srctree)
> +
> targets +=3D blacklist_hashes_checked

After applying this patch, CONFIG_SYSTEM_BLACKLIST_HASH_LIST now works
like the other filename macros.  It seems like this would be a good
addition.

I have done some additional testing, I am seeing a regression. The blacklis=
t=20
keyring is no longer picking up any of the hashes from the dbx during boot.=
=20
I backed out the merge with my changes  (fdbbe7ceeb95090d09c33ce0497e0394c8=
2aa33d)=20
and still see the regression.  I then backed out Micka=C3=ABl merge
(5bf1adccf5c41dbdd51d1f4de220d335d9548598) and it fixes the regression.

On a x86 with the updated dbx from uefi.org, I=E2=80=99d expect to see 234 =
bin hash entries
in the blacklist keyring.  With the current merged code, there is none.


