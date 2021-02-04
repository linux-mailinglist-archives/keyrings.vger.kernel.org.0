Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A02030EB3F
	for <lists+keyrings@lfdr.de>; Thu,  4 Feb 2021 04:56:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232159AbhBDDzy (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 3 Feb 2021 22:55:54 -0500
Received: from aserp2130.oracle.com ([141.146.126.79]:34306 "EHLO
        aserp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231949AbhBDDzb (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 3 Feb 2021 22:55:31 -0500
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
        by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 1143htZU140853;
        Thu, 4 Feb 2021 03:53:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=content-type :
 subject : from : in-reply-to : date : cc : content-transfer-encoding :
 message-id : references : to : mime-version; s=corp-2020-01-29;
 bh=1iBW/Y9acsypRETfmTIrYxhAxjrtkxoDwvd/9NT/yto=;
 b=usvI0VfMqet1hYGW3RuaMoV4ei3ibnpfS8MiKNPWuhjtSO/jukO1EiG7AFaxHK7cDI58
 FZSO5d0qE2kK5UZclhgr7LZty0TpuE85PqrLPHt7M2gs2pkYERilZ1ewS+V+yb4WyXYa
 wNAF+5EGjK1EMKDmY1Enq8P50CTb70rtvtuzeeg1BIjlitZgLZspLriTK62LPvcVEn41
 uRNvGEspSKL4nE9q3Zi2q7fRrQZPiBJKY2HO7nKDrA/JLi4o4qP/aj6n6h16hWvVJxF2
 Q6B72O0+L5nBLd5CJFa4G7b0lzRSzTbttcYo/pf6SUNYGqHPCGKVrFk/Uki6fcf4OoML RQ== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by aserp2130.oracle.com with ESMTP id 36cvyb3ejd-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 04 Feb 2021 03:53:57 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 1143faa9063279;
        Thu, 4 Feb 2021 03:53:57 GMT
Received: from nam02-cy1-obe.outbound.protection.outlook.com (mail-cys01nam02lp2053.outbound.protection.outlook.com [104.47.37.53])
        by aserp3030.oracle.com with ESMTP id 36dh1rvkug-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 04 Feb 2021 03:53:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hnid1qnvGQOGCyXOiZAEsaaNcaUMSKtZR/O32+eT/fbYHnLvnG9tVjI4gUVrZMEPhp1d5Jn1PstucSno0a05UwpUrSSfe+B9lOUzcvAqHEWRKYMgajiKtwfbjNFwhVQe0ABf6q73AZeRmsr9fmNlxDYFaqxWZQlggWUW+UnQMTT4RE1YhnsVOwWm0e217iPMDd/dZUk0frV6OQnaN1A1ZKICud+crIbqnYq/IAMHYPYboA+G/5KTE9fPRKAKpMsTrJfcBtFaRKCSRxyUYbm1bT7aj8J0W/VHUpYxniNBgwb35hUqEl1XYyhM6JbpWLG/isGhiSLUQgxG0j2mfLLpGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1iBW/Y9acsypRETfmTIrYxhAxjrtkxoDwvd/9NT/yto=;
 b=WAYceV8xjWTwkbbKuhtHHMW2vaUabhiYNnhh1lz0dx8Uw2Gt/kCfamcRXQ0QOGl53Oh9toZLFuEg0SrMyhbHx0O3iJy4QtVkDbW4IuYH3JSRAlUQ3s4b35qdQutrurdnzDg/4OrUgKGEeXhZ4uSnWafbZ+qzZm5ATF3qVMlGUjqjsTyQxzkaHtu8uBoTFgF0kuQP3D7k1puMHRQTfUUmrHmP2pq1pGJi8ap2r2Vr/Vo34YwMnl2xHEas8nGSAUbbv1QDPnxsWXWfmQpc9QaYbnAEUWaqg3EBkqU39c/YgEss9kUVUUWyX6fGji2zHJmBxzXbNVwIMrVDrZrNAnJ1Jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1iBW/Y9acsypRETfmTIrYxhAxjrtkxoDwvd/9NT/yto=;
 b=cKsSKyF/FX0qZh2ibJRxjqf/NPtZT2zZHjf3l/gGxKAL66HoCjFJYF7JHrMC0Ouo06iqhq0NJQmzECu6me7j73df5oR08pynZEkZaLuQi0C9mk2UIYfKW2jendKDlEKzgIBnyDZokFw8HX9OCG05UQpW75UNC1wi5TMg0aebDog=
Authentication-Results: digikod.net; dkim=none (message not signed)
 header.d=none;digikod.net; dmarc=none action=none header.from=oracle.com;
Received: from DM6PR10MB3099.namprd10.prod.outlook.com (2603:10b6:5:1ad::18)
 by DS7PR10MB4975.namprd10.prod.outlook.com (2603:10b6:5:3b1::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.24; Thu, 4 Feb
 2021 03:53:55 +0000
Received: from DM6PR10MB3099.namprd10.prod.outlook.com
 ([fe80::70bf:d626:5218:70e4]) by DM6PR10MB3099.namprd10.prod.outlook.com
 ([fe80::70bf:d626:5218:70e4%7]) with mapi id 15.20.3825.019; Thu, 4 Feb 2021
 03:53:55 +0000
Content-Type: text/plain; charset=utf-8
Subject: =?utf-8?Q?Re=3A_Conflict_with_Micka=C3=ABl_Sala=C3=BCn=27s_blackl?=
 =?utf-8?Q?ist_patches_=5Bwas_=5BPATCH_v5_0/4=5D_Add_EFI=5FCERT=5FX509=5FG?=
 =?utf-8?Q?UID_support_for_dbx/mokx_entries=5D?=
From:   Eric Snowberg <eric.snowberg@oracle.com>
In-Reply-To: <10e6616e-0598-9f33-2de9-4a5268bba586@digikod.net>
Date:   Wed, 3 Feb 2021 20:53:49 -0700
Cc:     dwmw2@infradead.org, Jarkko Sakkinen <jarkko@kernel.org>,
        James.Bottomley@HansenPartnership.com, masahiroy@kernel.org,
        michal.lkml@markovi.net, jmorris@namei.org, serge@hallyn.com,
        ardb@kernel.org, Mimi Zohar <zohar@linux.ibm.com>,
        lszubowi@redhat.com, javierm@redhat.com, keyrings@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-security-module@vger.kernel.org,
        Tyler Hicks <tyhicks@linux.microsoft.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <A5B5DEC0-E47A-4C3D-8E79-AF37B6C2E565@oracle.com>
References: <20210122181054.32635-1-eric.snowberg@oracle.com>
 <1103491.1612369600@warthog.procyon.org.uk>
 <10e6616e-0598-9f33-2de9-4a5268bba586@digikod.net>
To:     =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>,
        David Howells <dhowells@redhat.com>
X-Mailer: Apple Mail (2.3273)
X-Originating-IP: [24.52.35.144]
X-ClientProxiedBy: BYAPR07CA0047.namprd07.prod.outlook.com
 (2603:10b6:a03:60::24) To DM6PR10MB3099.namprd10.prod.outlook.com
 (2603:10b6:5:1ad::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.16.177.128] (24.52.35.144) by BYAPR07CA0047.namprd07.prod.outlook.com (2603:10b6:a03:60::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.17 via Frontend Transport; Thu, 4 Feb 2021 03:53:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a265c3b5-b7cc-4279-7176-08d8c8c07e5c
X-MS-TrafficTypeDiagnostic: DS7PR10MB4975:
X-Microsoft-Antispam-PRVS: <DS7PR10MB4975DB814515A411F2A6DFC687B39@DS7PR10MB4975.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2399;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uc3DWfvxzt9GhpFZfXZAVVZt/c0gfcEuxbP0CYPpOZEG++9D4LK4qffjl+VELovpXqmfsM9XDqpszndx0BsmbiqalpD+PSNI5bzq7QZrOowZ4vyPzTlNZGlIn7jQg3cya9LLw/WhW/kjsKfzHRQXe21+24P1apYDuuSWlrHwnxrdZRqnZw729qzewblCAsnLWm5BSZp/5RfUEzYTXLPsIx/mP6iUyY/PEx21TNAyu0OlIaEWDMaUbPrYFIrVbZp5+j71QwxZYXUorQD/KM8wA3vXp5P/UeQFChOrTMuZn5IcK2cx/EgBgsfOIIoOS9q5LGjRtBAKk8pq1YCnfq84TDYfPclgkzuNN9QsicQd6h8e6g4FJK8jcIset33lIHKGfIpLXP6ZOz7MwES/7O1kOnsSOfTasr77DwOD+TvsONOc8oRbIfnyPeoiYgo+dQVrAQDqErUwYcpMzI50ZIG4YeqjehwZO16RhlfUAJGIm7L4CqVt4g0M9YiQSdGkblRBuN3DviGwhYk7uRwsGJJkgt5HiSqAeS9J253jX4e69jQrn7mPrE/O1OmBgSOi9+e4Xh45oN5N74tjZdCux3reaWnVz4DWwP/va9IE1NIhBANbJcwy/fcsV2ijJkKQID8nm993vv1GVlDtg+4PG9jyywJ1BMN6csTadoGcS9WK+gA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR10MB3099.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(39860400002)(366004)(136003)(376002)(346002)(66574015)(2906002)(36756003)(6666004)(966005)(33656002)(66946007)(66476007)(66556008)(53546011)(52116002)(6486002)(7416002)(4326008)(956004)(44832011)(316002)(16576012)(5660300002)(16526019)(224303003)(54906003)(83380400001)(110136005)(86362001)(186003)(8936002)(26005)(478600001)(2616005)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?eUI4TUNLQTBEc21mTHJ6cS9iRkVscjNxSDFiQ1BxczVIOUlIUzd4UGtzdy9w?=
 =?utf-8?B?ZUhKQWJ0R200UTY0OHdkRmp2RVdmcG5keG1jMWVVazdEeHBJTUZSYzV2b0p6?=
 =?utf-8?B?YnlZN1pSZmdib1Q4bkhUd1dHM2FOdWZKVVQzME8vazR0K0lpMHJtVlpBQmlP?=
 =?utf-8?B?T2VzRVNVVFdPWE5FWjUxUkpVa1RlZ1M2V1pBeXN0eE1KRVNyRHdRZ3RIdmV0?=
 =?utf-8?B?RlIvV3B2YnRTN2VUQ3dMdXBRWXZMR1YzR0dpcWorcTAxZXdBRVAzMWUwaG11?=
 =?utf-8?B?Mkxrc0dTSHc3b1BmQ2tvdCtCV2FFVXd6UGNvY1RIWGhEN3dsM1B6RjNlOVRO?=
 =?utf-8?B?MG5NZCt3VUIvWVpLVE5ESHZ1amhFUHhBdStLQXVGVVhLUFp0RE5DME1LOWQ3?=
 =?utf-8?B?QjdZYkdWZTBpbFNoU1dmQ0wrSFc4enBaWXpkbXp6aXVDakdpL0MxNFljNEp5?=
 =?utf-8?B?aExkZURWUmhNbU13NW80Y2lSNFhjVWViTGgvK2RXYkFKZEhhSEJwMUdvWU1h?=
 =?utf-8?B?TVZwM3lpSmo2V0F1bmpKSDR2eVlPdnNRM2J6bURJcWFBeHFNUkUvTWd2Y01O?=
 =?utf-8?B?TUxxcXJKY201Y3BWMDZhLzJZdUVwZzZSNkVFU2wxYjE5UFExbUIvNkNxZFRG?=
 =?utf-8?B?MUJOSmdKZTRjcWlwa0pxcWs0Um5BMG4vMyt1bGRDUkVHNTBFcks0S2IxaU5O?=
 =?utf-8?B?SXh0aCttWTc1cjRKTmZ3Y3JOaTdKUFFjU1JFRzFGQjc5UUhXVVY3eERQbGdx?=
 =?utf-8?B?TkV2ckJwOGNVSDM2M3FRNExtckhUN2wwcDNmNU5RMityQ1JrM25qS3BZMmdP?=
 =?utf-8?B?QTZTNitrdFRDM1IrTTg5ek9yMXh4NzF0MFZSVUxGVU1FRUdjQkQ3elRQKzVk?=
 =?utf-8?B?TXE3QU1aYjBHODhXc2tGMHNkRys0QVlxVUUwd0FKNENhWUZ3OG94Wmp3Lyt3?=
 =?utf-8?B?V2t3ZU5MNXNKT3BYb20xa0U5aTdFUGkwc0ZTYlVJL3Y4Z2xHMEJtOThKZENw?=
 =?utf-8?B?R2g0dmU3bmt5Vys5VjNpemhjTDk2aTlXRUdEN3JSUGFMVjRBdSs2V281TEF6?=
 =?utf-8?B?RVZ4K2YrR3ZxSDlURFBITW9jam5BeUY3dDczN0ZFNy85T2lEVmNtenFhYldW?=
 =?utf-8?B?WTNER2J0WldaR1lWS1lFajlnSjYrdkF0bWlhY1paNS91TUs1YjZWaS9UdHk1?=
 =?utf-8?B?Qm9RcHF3RHhBMC9oS2JObmg1TDExM0o0TWFqQWZLOFVjZmhUWmdsSG9aZlhT?=
 =?utf-8?B?a24zam5tQ3ZFelY4VHFTMkxqSG9ITnVUamg2Mm9NQ3NEdDJ0SWdKelBKTXRp?=
 =?utf-8?B?b1o1QTJTTWx4b241Y2hPUUw2NFBlbkVGQzB2a2pKc3VvV1N0R1RNeVl0c2hL?=
 =?utf-8?B?SW14N0I5YmJVL05QU05LQnY1bHhpeVNDUGdjU3NxUDNxRG9ZTk9kSk45Zldu?=
 =?utf-8?Q?AV/Y1/08?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a265c3b5-b7cc-4279-7176-08d8c8c07e5c
X-MS-Exchange-CrossTenant-AuthSource: DM6PR10MB3099.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2021 03:53:55.5316
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D75FPFp9Hu/KBrMm/FckZDGtpPWoEEcpDrAQVKOKiVO1Uwly8h/fKc7MyBMS15OUozKfjxNK487py60w4XM73Vg21Cq1YT3+pTV61fCNEWk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB4975
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9884 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 spamscore=0 phishscore=0
 suspectscore=0 mlxlogscore=999 bulkscore=0 mlxscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2102040020
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9884 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1011 impostorscore=0
 mlxscore=0 spamscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 mlxlogscore=999
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102040020
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org


> On Feb 3, 2021, at 11:49 AM, Micka=C3=ABl Sala=C3=BCn <mic@digikod.net> w=
rote:
>=20
> This looks good to me, and it still works for my use case. Eric's
> patchset only looks for asymmetric keys in the blacklist keyring, so
> even if we use the same keyring we don't look for the same key types. My
> patchset only allows blacklist keys (i.e. hashes, not asymmetric keys)
> to be added by user space (if authenticated), but because Eric's
> asymmetric keys are loaded with KEY_ALLOC_BYPASS_RESTRICTION, it should
> be OK for his use case.  There should be no interference between the two
> new features, but I find it a bit confusing to have such distinct use of
> keys from the same keyring depending on their type.

I agree, it is a bit confusing.  What is the thought of having a dbx=20
keyring, similar to how the platform keyring works?

https://www.spinics.net/lists/linux-security-module/msg40262.html


> On 03/02/2021 17:26, David Howells wrote:
>>=20
>> Eric Snowberg <eric.snowberg@oracle.com> wrote:
>>=20
>>> This is the fifth patch series for adding support for=20
>>> EFI_CERT_X509_GUID entries [1].  It has been expanded to not only inclu=
de
>>> dbx entries but also entries in the mokx.  Additionally my series to
>>> preload these certificate [2] has also been included.
>>=20
>> Okay, I've tentatively applied this to my keys-next branch.  However, it
>> conflicts minorly with Micka=C3=ABl Sala=C3=BCn's patches that I've prev=
iously merged on
>> the same branch.  Can you have a look at the merge commit
>>=20
>> 	https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git/c=
ommit/?h=3Dkeys-next&id=3Dfdbbe7ceeb95090d09c33ce0497e0394c82aa33d
>>=20
>> 	(the top patch of my keys-next branch)
>>=20
>> to see if that is okay by both of you?  If so, can you give it a whirl?


I=E2=80=99m seeing a build error within blacklist_hashes_checked with
one of my configs.

The config is as follows:

$ grep CONFIG_SYSTEM_BLACKLIST_HASH_LIST .config
CONFIG_SYSTEM_BLACKLIST_HASH_LIST=3D=E2=80=9Crevocation_list"

$ cat certs/revocation_list
"tbs:1e125ea4f38acb7b29b0c495fd8e7602c2c3353b913811a9da3a2fb505c08a32=E2=80=
=9D

make[1]: *** No rule to make target 'revocation_list', needed by 'certs/bla=
cklist_hashes_checked'.  Stop.


