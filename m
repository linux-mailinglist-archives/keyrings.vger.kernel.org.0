Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 64BF2314379
	for <lists+keyrings@lfdr.de>; Tue,  9 Feb 2021 00:07:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231559AbhBHXGx (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Mon, 8 Feb 2021 18:06:53 -0500
Received: from aserp2130.oracle.com ([141.146.126.79]:55608 "EHLO
        aserp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229939AbhBHXGv (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Mon, 8 Feb 2021 18:06:51 -0500
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
        by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 118N5M5t057254;
        Mon, 8 Feb 2021 23:05:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=content-type :
 subject : from : in-reply-to : date : cc : content-transfer-encoding :
 message-id : references : to : mime-version; s=corp-2020-01-29;
 bh=Dqy5Yv0Iijm66Uq4YLMHuwAF8WgmZa8Dv7/wFfMPHZY=;
 b=FoDMVouQUlBMaleVjrA/P5XZSyaw/nwGPNDK/7DFm+fC0E1RqE8+izjd1zbjMFFe1WRI
 ps399sG0b3HXnckXofr0Q0N3ikUyWi2OgBbKKrVVzpF9/grQ6sadwimnnwigPHkUHqmG
 RdpqZr4gWxnBBzlj5FJUoA3KoXbDdAgntSYU/uunMnbShtAwOBZuvCxOCzi+dd3gpD5f
 r6++KVLexYuY4Pnu6Vfh9UMgwEFyZvT9H0einRBtJSSisAkuV/RFOEZxBu5FOJoJTsfL
 Zwk/j6ihUiYFpycCUevVOiIfWHt+lWA2fFfYU+fphGvkcPWPjwxPvPD3aXFQlBR6b3CN +w== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by aserp2130.oracle.com with ESMTP id 36hgmadu0j-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 08 Feb 2021 23:05:21 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 118Mxr57145414;
        Mon, 8 Feb 2021 23:05:21 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2176.outbound.protection.outlook.com [104.47.57.176])
        by aserp3030.oracle.com with ESMTP id 36j4pmxa4b-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 08 Feb 2021 23:05:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k8USHaQyicermXwGPh5tRSncekVhhe8eBogpkvsnoHmo6UCLY3SBxLoFt/ugN7QICkELPtevk1jAQziVVWgPUFcK0evY4AuJjtEnUdU1td19Ylonxxhd8QLXKAN+VnG3XScdjTo8HTXLBmk0HhMAgZ7xakl2u2P67ZWq960qGRRlvL4N8Kus9nRZtP5V6joKGTuez9bdbAHmgxWqNHiWkfZm+BdPtXdRbnl7NSQVxbsF0OvLWgeu23dqzmc8PP9apn/zfw1q39T8kmjnsi05/+Z2KShdVqTidi3pT07XG0EXcX1+3qZWvO8UKH2WMJmRkWqdJ8oC31JA4eOLWHBZYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dqy5Yv0Iijm66Uq4YLMHuwAF8WgmZa8Dv7/wFfMPHZY=;
 b=TP7Ua8Ca3LeHyLvEj0IMZmbZV3SkjZne4sMGtgz5EbChgXFx6RwFzvpKa+jHYvor6eo9RKy9m9JNoL+fZ5Loljhyuf+W8uMjiIAVOxT9Y4z/z87/INK7WYKtYaqmpJ/zstjIUOO3lRE0Jw2JNa7D3rP4/ClTZfTZS3ewd8z285mqk4rb+aZS2zEn5mRjzNEQI1lzIh2A2+Y2ba9IDIvCkI6tvW7afrTdOiBcccXI/2raMtIfXfO4Kx/6350qtTgQt+7OVeOfUU+slTENRhn6NdYMaIi12Og+zAPs26HoyYuk+WtF1vbqI5dXcpBySuFkV1Xm+UUlxI0wpHdx/Cd68w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dqy5Yv0Iijm66Uq4YLMHuwAF8WgmZa8Dv7/wFfMPHZY=;
 b=fT7jFQEwrao1AiYa0RxjKj/86CgrXGd59Cp1hX68rWXgm4i9aTvwcP+ZkiCxvnZdt0ocPpm91bgbkGgE25Zcmkpn//WrQzy9K22J6bpiDeG1u2aCkUmqFXqH+4zbJVR0g5TBV4iHdz3zdO3y6rBTNBJU/ttssHZtZp2AjxFCUN4=
Authentication-Results: digikod.net; dkim=none (message not signed)
 header.d=none;digikod.net; dmarc=none action=none header.from=oracle.com;
Received: from DM6PR10MB3099.namprd10.prod.outlook.com (2603:10b6:5:1ad::18)
 by DS7PR10MB5136.namprd10.prod.outlook.com (2603:10b6:5:38d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.20; Mon, 8 Feb
 2021 23:05:18 +0000
Received: from DM6PR10MB3099.namprd10.prod.outlook.com
 ([fe80::70bf:d626:5218:70e4]) by DM6PR10MB3099.namprd10.prod.outlook.com
 ([fe80::70bf:d626:5218:70e4%7]) with mapi id 15.20.3825.030; Mon, 8 Feb 2021
 23:05:18 +0000
Content-Type: text/plain; charset=utf-8
Subject: =?utf-8?Q?Re=3A_Conflict_with_Micka=C3=ABl_Sala=C3=BCn=27s_blackl?=
 =?utf-8?Q?ist_patches_=5Bwas_=5BPATCH_v5_0/4=5D_Add_EFI=5FCERT=5FX509=5FG?=
 =?utf-8?Q?UID_support_for_dbx/mokx_entries=5D?=
From:   Eric Snowberg <eric.snowberg@oracle.com>
In-Reply-To: <99066eb7-53ac-41b0-46cf-36ea3d7f6590@digikod.net>
Date:   Mon, 8 Feb 2021 16:05:01 -0700
Cc:     David Howells <dhowells@redhat.com>, dwmw2@infradead.org,
        Jarkko Sakkinen <jarkko@kernel.org>,
        James.Bottomley@HansenPartnership.com, masahiroy@kernel.org,
        michal.lkml@markovi.net, jmorris@namei.org, serge@hallyn.com,
        ardb@kernel.org, Mimi Zohar <zohar@linux.ibm.com>,
        lszubowi@redhat.com, javierm@redhat.com, keyrings@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-security-module@vger.kernel.org,
        Tyler Hicks <tyhicks@linux.microsoft.com>,
        Eric Snowberg <eric.snowberg@oracle.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <74EC102D-BD18-4863-A7FB-C88439654C8C@oracle.com>
References: <20210122181054.32635-1-eric.snowberg@oracle.com>
 <1103491.1612369600@warthog.procyon.org.uk>
 <10e6616e-0598-9f33-2de9-4a5268bba586@digikod.net>
 <A5B5DEC0-E47A-4C3D-8E79-AF37B6C2E565@oracle.com>
 <7924ce4c-ea94-9540-0730-bddae7c6af07@digikod.net>
 <BFC930B3-7994-4C5B-A8EF-1DD1C73F5750@oracle.com>
 <dc6a4524-3935-fda6-40a8-cebf80942cdf@digikod.net>
 <188DE1AF-A011-4631-B88A-2C4324DA013B@oracle.com>
 <99066eb7-53ac-41b0-46cf-36ea3d7f6590@digikod.net>
To:     =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>
X-Mailer: Apple Mail (2.3273)
X-Originating-IP: [24.52.35.144]
X-ClientProxiedBy: LO4P123CA0345.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18d::8) To DM6PR10MB3099.namprd10.prod.outlook.com
 (2603:10b6:5:1ad::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.16.177.128] (24.52.35.144) by LO4P123CA0345.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:18d::8) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.19 via Frontend Transport; Mon, 8 Feb 2021 23:05:12 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4c8aeeb8-5c2b-4830-5423-08d8cc86009c
X-MS-TrafficTypeDiagnostic: DS7PR10MB5136:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DS7PR10MB513699350B85B02F98750A09878F9@DS7PR10MB5136.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6uIU3JXaEw3cFjPg1P11UH1ctr7JhsTIUjJqx4JrfwbUu82fftM8qyy7RhaE2nSochbn0AftIJWqfJgRGFXWykq4LLjU3/n+ndKRswVo01rJSLe6kj9jxcR0DRIa8KDRKL6rBCfBuQFTxbpuZEHHKpGltV/mYP9LUuBsExIaKnZfDdp6kYrvXcDuTygSKIFXo/ufGNSOQxDjyFUuvMpCqFz6BT80yAhoSBysW06pmWWIEtE0OLSM+SsuVDC5kMabtS8Ayb/az932YagFb48sti9RE6u5B5o0mZNC3wqqEOto6vKaZUdAuqNVe3bO+Z156pv+2bXQygG8itVFhFVdJczsxFNWIvID7/VC35+FMOxvDxiW2mRQq6uYTm9cSd6Vpd7QifbV7KsAPhQZKFhLR8xM+iYpIorIHpmQQBECJGNrCofkNdL3tOA6UpwscIPXGV6zc0WnybbzDHUo/+ogPAWGMTk9p4CWNGnHmuy2iVZEAZ/Q4nSaPdAMGx1wqy/VkvbwpmSj/SnJxGxp6HjeDO/lQLkYZfxmOsyQ941LYBp5O+3zYsPyVGiB6H9a3PuN8h29xCM4zevXGZJpt2nBzw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR10MB3099.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(39860400002)(366004)(136003)(346002)(376002)(396003)(52116002)(36756003)(186003)(107886003)(6666004)(2616005)(956004)(6486002)(7416002)(4326008)(8936002)(16526019)(86362001)(26005)(53546011)(316002)(224303003)(6916009)(33656002)(66476007)(2906002)(54906003)(16576012)(44832011)(66946007)(478600001)(83380400001)(66556008)(5660300002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?b3M4cDRVa05ITnlWU3Z4RlZQK2lneVdqOVRLOWF0QzQ4RWdkSktiM2dRTzhM?=
 =?utf-8?B?cTV3U0h4MGZ2ZUlubm0xZWVNY0pqZkxDYW5iSWl6TWhDV0JLMWo1VjBxZW1W?=
 =?utf-8?B?U1Zmb2t1VGM2Sm5xWHNHLzVtQjFiY1o5eVczRUdUSEcrbW43bDZsTFVXV3k4?=
 =?utf-8?B?WUQydE9Yc0RWLzZIVVZCRnZWZnRQL2NoNXpDZEdIVWlQdWYxSWQ2dWZrWE5Y?=
 =?utf-8?B?Q1kxNG12blBseHloMWZ2UnA2SXRha0lQMkRnYW5CQld0djl1UnpaN3JnZ3M5?=
 =?utf-8?B?TVZ6NHhPaXJ5RUdWR2lDUVJ3M2duZnVzdE4rUHNmeDBJK1FYLzN5aWduYzBE?=
 =?utf-8?B?R3p5cGZoUzI4cG14VDZJZ0pJOFVKMW0zekN4NmpFSGV2aDk2TWRpMi8zd3ZV?=
 =?utf-8?B?SDByOXp3VStOYjRmb0U1NE8rLzZmSXdHU0VDOGJHNVF4Z2NPRVpUQWtmYnJE?=
 =?utf-8?B?VS9INnhWM1RWM2dlQXR3Yk9odGFpZ2ZYNHd5MGI0c0kzTlpQQyt5UU1CcnJZ?=
 =?utf-8?B?WDNhNExJM216Vi84ai9sSlZvTnV6NFh1ZGVvUXI4eHBiMU5kOGpIRUY5aFJZ?=
 =?utf-8?B?amlnQkNwT0Fuc2QzNXBWS0tPdTJoTCt5RWl4bUhmeFhsR1dnTG8yMXYwYkw4?=
 =?utf-8?B?ZG5UeCtHeE5oTzZrZmxKM21MV1FjdVRpc01WVDZrK1FhUFlXNU5xTHI2ZTFj?=
 =?utf-8?B?cHMrVnRoUkRnYlVtMU9qSGc5ejJ6VEJYTitqYnJScmVoazJwdkx6RXZYU283?=
 =?utf-8?B?VEN2V0lUeTdUYVpXTmkwSG1NN2V6UzYzUGg1eitPZWpzVDU2SkFvTVBZazR5?=
 =?utf-8?B?SjRUM3dDdFB5Si9reXJXeERJSEtPNGFjb05lU0wvK0R4ckRWRlZud1NjcGNU?=
 =?utf-8?B?SStSdVBtN1owL3p0eEV0dXdob1p3MTRsaHVHTGhmSFFRUjd5c3NLR21JTzI4?=
 =?utf-8?B?MHM4dFBaUlYreFJaekNuZDUwcWdvdXZRdUpEL0ZwOEoxNHR4NU1vUDVwRitW?=
 =?utf-8?B?Ykt6RmpkZXk5RjVPWVB5cExkT0JQVnJzSTZYNjFvWkd2dDlQbDQzUDRHOEM5?=
 =?utf-8?B?ZnhJV2pYVER4OE9VWmdJczBGMVBBN1d4NjEyR3RsdUxlU2k4M0FDMnBrN3BP?=
 =?utf-8?B?WWZwa2lselFub2NTVERlSy9GaUlMNkJoQnZrUGk0QTVXSXFvVVduaXFySGNU?=
 =?utf-8?B?VlZ0UDFNam1nTEJlVERnY2p0eDRHVllQOStQbHY5NU1XZ21MeFBOUTRJQS9V?=
 =?utf-8?B?VWxYUWlFbVdxMnFzY1BrSHQ1c2M2MUxpOVprTXVtMVQwaEMrZzZBbUs3ZlFU?=
 =?utf-8?B?UDU4ck1XZkd6enVIcnlNZk5IeTEvaFcwYWJ2LzlFRWdZRVc1MEp3c3RHd28z?=
 =?utf-8?B?Uk9DaWlGM2VSL2xPWlp6MW12T0lIZW5kRHBsbzc3RTYzaXo5T0REMHBhRG9q?=
 =?utf-8?B?ckxwUzNBbUVGNURYUzJGd05hMGk3OHJhbzRJcWtzQUxiWlNHUUY2cERESXFv?=
 =?utf-8?B?cGhQT2tNeTBkeWJQdGc2Y3FvZWFsN0hCUGt1dnN2cjVqek9yMGdENjN1TG9h?=
 =?utf-8?B?QzZtMlJnbjJwUHR3eWdsMlA4UnRKY2RLMHF4Y0dkM2p0aTUxdzhaYUtKbnM4?=
 =?utf-8?B?ZVFYMzNBR1dwQTNnTmJJakpQb0txTHNGbVRVRzRoY2tPRDVybmx0Y25uZElo?=
 =?utf-8?B?dUZxZ0NnWE40VXhQRG5RcEZ2RXpaWmJFSmIxTTVGK1pvSENSM1VLWVZmeWEw?=
 =?utf-8?Q?KTHNGJROktyzXAM8GsscLnFvX99a6ofz6Y+sE76?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c8aeeb8-5c2b-4830-5423-08d8cc86009c
X-MS-Exchange-CrossTenant-AuthSource: DM6PR10MB3099.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2021 23:05:18.3083
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8p39idJfrvXgdLyxiNeFWeVKubIMSGQD59W/80i0lCvGKtfqZ3HvKmSvz+bYR1FnkqQZndOZ9NgV4u5p2Lzn5NSe6xILCgt6OIWvoSDVfag=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5136
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9889 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 adultscore=0
 mlxlogscore=999 malwarescore=0 bulkscore=0 phishscore=0 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102080128
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9889 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 spamscore=0 lowpriorityscore=0 phishscore=0 adultscore=0 impostorscore=0
 suspectscore=0 mlxscore=0 clxscore=1015 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2102080129
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org


> On Feb 6, 2021, at 11:30 AM, Micka=C3=ABl Sala=C3=BCn <mic@digikod.net> w=
rote:
>=20
> On 06/02/2021 02:14, Eric Snowberg wrote:
>=20
>> I have done some additional testing, I am seeing a regression. The black=
list=20
>> keyring is no longer picking up any of the hashes from the dbx during bo=
ot.=20
>> I backed out the merge with my changes  (fdbbe7ceeb95090d09c33ce0497e039=
4c82aa33d)=20
>> and still see the regression.  I then backed out Micka=C3=ABl merge
>> (5bf1adccf5c41dbdd51d1f4de220d335d9548598) and it fixes the regression.
>>=20
>> On a x86 with the updated dbx from uefi.org, I=E2=80=99d expect to see 2=
34 bin hash entries
>> in the blacklist keyring.  With the current merged code, there is none.
>=20
> Hum, I missed a part in refactoring (commit
> f78e50c8f750c0ac6767ac1ed006360cf77c56c4). :/
> Could you please test the following patch?
>=20
> diff --git a/certs/blacklist.c b/certs/blacklist.c
> index 07c592ae5307..f998a2e85ddc 100644
> --- a/certs/blacklist.c
> +++ b/certs/blacklist.c
> @@ -197,13 +197,16 @@ int mark_hash_blacklisted(const u8 *hash, size_t
> hash_len,
>                enum blacklist_hash_type hash_type)
> {
>        const char *buffer;
> +       int err;
>=20
>        buffer =3D get_raw_hash(hash, hash_len, hash_type);
>        if (IS_ERR(buffer))
>                return PTR_ERR(buffer);
> +       err =3D mark_raw_hash_blacklisted(buffer);
>        kfree(buffer);
> -       return 0;
> +       return err;
> }

I applied this patch, it works better, but there is still a regression.=20
Most of the hashes show up in the blacklist keyring now.  However some=20
do not, here is what I see in the log during boot:

[    2.321876] blacklist: Problem blacklisting hash (-13)
[    2.322729] blacklist: Problem blacklisting hash (-13)
[    2.323549] blacklist: Problem blacklisting hash (-13)
[    2.324369] blacklist: Problem blacklisting hash (-13)

> Is it possible to test these kind of dbx blacklist with Qemu?

Yes, just use OVMF.=20

