Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E8E3A331D02
	for <lists+keyrings@lfdr.de>; Tue,  9 Mar 2021 03:29:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230391AbhCIC3Y (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Mon, 8 Mar 2021 21:29:24 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:44566 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231163AbhCIC3M (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Mon, 8 Mar 2021 21:29:12 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 1292K0Hu033009;
        Tue, 9 Mar 2021 02:28:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=content-type :
 subject : from : in-reply-to : date : cc : content-transfer-encoding :
 message-id : references : to : mime-version; s=corp-2020-01-29;
 bh=8HMCol7IN29pxzbZ8rc7fsX0gzVOXYrIHPuzqXglj3E=;
 b=SclHdOavDlU7Qyg0KL9JL6lio3czxlBSvu2HzyNcGQqKaWS4EkDz9F1+PDAtZsoPNOkq
 befUSlhdQQd3b1HY5Vyzr5LaSXXK1GWExTDMcxtrdaVmSc+jRG5f2NoocC9INn1r1O4t
 duHocAKrlFVf+B+3ml146uOH/U4L5Mx2HYkT4lfiEykTi8393g+f4dap9cBYNtS5lP7a
 hC9JsPD2H9LIMGprNQjzmsZvrEaf7O2agN9wnAJgti1ElcWAdZUrZY2StIeKon+DYZVi
 7kmvtQBCI1qzcz13vTCtZ7HGxjx0dHo9+88pozxxQZGIC7ar6EnJ8Z5XJy/nEt+OVlnX FQ== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by userp2130.oracle.com with ESMTP id 37415r5qgs-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 09 Mar 2021 02:28:48 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 1292KwAD164450;
        Tue, 9 Mar 2021 02:28:47 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2168.outbound.protection.outlook.com [104.47.55.168])
        by userp3020.oracle.com with ESMTP id 374kgr5q5g-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 09 Mar 2021 02:28:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FwF4x846JakqaOHH/NNHUN0JUwOxK9tEhOypf5df/Xl2uqL5HLDIkiNL+Kkgc6PQZDjDn0uWPksNYp2w3c9Cbimxp2MnbE/smrTeLtGJvDAq4HxBk5rM8Wb+WF5zUA7A+GlAFSh4TAQrvWaxG0z2oyE+JGFi3kWi3Wp01vsC48l2NjWNhShIjtQ8Ocr4spXGeDithlCBAMxR5tT/CUmMCpfgoPxvjlwOQD084C19mWh58tABckmV4He3jYXMhssI/GOeUQXgAin0vUNs7wyGBa4BF7l4ypWcaBAx0Sy7IDRwLhWJ8M++t/qNa0TUvinQKrkXfdCnYPwqZC0A5R0ZQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8HMCol7IN29pxzbZ8rc7fsX0gzVOXYrIHPuzqXglj3E=;
 b=iDCKaxeDmcmtUnaJ5gwOKiUwE4SaOJ+56iQTjZgGSqSJOylgJvN/Tr9wxzEegfcbjMTwByXxwCFoHwXN2FkHOgVCx8wFHmOfdSV/vgvu0KqbHLzx9jGTYf+obW4CnU++h3sr38LC1x+zjSBzOPw3HE6Th6KiOXKkiiHD8UN29dvIQ7mhRif13WzB0KYzTf+2o3OtgaK3/3763DxqyYPjg8NyirDnh6CChrK8pbLttn7r2osU7Cpl2GDHtaDlg48PyHlNKFZwYgjGECctekn0JzdRkX21r8VkD3iEK0wxT1QVgNerqDbENsoxfFTvx+AFnrWFxmtezsBlyy+iQjCY7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8HMCol7IN29pxzbZ8rc7fsX0gzVOXYrIHPuzqXglj3E=;
 b=Xa/UJJit4KPPTtcriq9Hoye9IQnuVWIfaUaLBJaBlrFM62ea9DUF9FtPToF3rWW5myQflv42OXz5T6HR0u0Q6XQIVzL4HOgKzyYG91BvZFPfcb/JDgQ2miRYIPlnt51Zl5X4BfFVIR7CIqL/ut5bOn/GFQwVW3+RMy3046bYyjU=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=oracle.com;
Received: from CH2PR10MB4150.namprd10.prod.outlook.com (2603:10b6:610:ac::13)
 by CH2PR10MB3829.namprd10.prod.outlook.com (2603:10b6:610:11::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.19; Tue, 9 Mar
 2021 02:28:44 +0000
Received: from CH2PR10MB4150.namprd10.prod.outlook.com
 ([fe80::95df:950e:af4c:a5df]) by CH2PR10MB4150.namprd10.prod.outlook.com
 ([fe80::95df:950e:af4c:a5df%9]) with mapi id 15.20.3912.027; Tue, 9 Mar 2021
 02:28:44 +0000
Content-Type: text/plain; charset=utf-8
Subject: Re: [PATCH v2] certs: Fix wrong kconfig option used for
 x509_revocation_list
From:   Eric Snowberg <eric.snowberg@oracle.com>
In-Reply-To: <147604.1614981032@warthog.procyon.org.uk>
Date:   Mon, 8 Mar 2021 19:28:37 -0700
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Jarkko Sakkinen <jarkko@kernel.org>, nathan@kernel.org,
        David Woodhouse <dwmw2@infradead.org>,
        keyrings@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <77085577-01EB-48F5-868B-E7A1813363A1@oracle.com>
References: <20210304175030.184131-1-eric.snowberg@oracle.com>
 <147604.1614981032@warthog.procyon.org.uk>
To:     David Howells <dhowells@redhat.com>
X-Mailer: Apple Mail (2.3273)
X-Originating-IP: [24.52.35.144]
X-ClientProxiedBy: BYAPR02CA0027.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::40) To CH2PR10MB4150.namprd10.prod.outlook.com
 (2603:10b6:610:ac::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.16.177.128] (24.52.35.144) by BYAPR02CA0027.namprd02.prod.outlook.com (2603:10b6:a02:ee::40) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17 via Frontend Transport; Tue, 9 Mar 2021 02:28:43 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 09faf522-ec53-4cad-595d-08d8e2a30f94
X-MS-TrafficTypeDiagnostic: CH2PR10MB3829:
X-Microsoft-Antispam-PRVS: <CH2PR10MB382971A68D7D225470AAC1A487929@CH2PR10MB3829.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uy3e2gFzujAk/OjA6EkpQU3dwTqZtWXgxZmfroNnj4nLa2Er3ZEdKZJf5dTMv4/mXmUrIGMV4z3i2n/nnEh43oJojTeYr9GzUK1kLvvjqyGhxHZT5JchwDnz1ns9oZ29a3o5Ft0N55b2Ur2qqqRg17LnmcziXvl8hQlnDssjpAHWRBE8qdXHJgUlKJZ4BfWqDn5B9hUncqRpLCe1plP/fd0hv6+1kDz7iMj3qXVwQ0lcyu9n+tzrict4ZN6HFUK+iQ7JX2g6r9pIbobTIhRj/CzSGoZiO7pnvhZeZyshvhR3kZh/z93IrPP+kC6O4aTUP1giY7uO8+Ib+20cjbvesk2rBJWqDG591h1NgPzQySwbO0dGPMwwOHumqk92tWhKU+rpPx+bBV/CRPHdsJGg10NvT0joG7JDElY77jho4qi1wnKEqchKDikCJaVsN3emWGafBB1Nz76KRZ+VzvKaTSrMXtcX9myQ40HFMOoblRKNJqN4mNH1glEFpJnnAT9wWvbXSuxp6LwD1C2GqaRI0ek/wvQANuKEImoECbYNn1RTU8SxF3UvmuWd2y50HNkS/CMeJQ6iy+WX+pJFzgrS3Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR10MB4150.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(396003)(136003)(346002)(39860400002)(366004)(6916009)(33656002)(8936002)(66556008)(86362001)(16526019)(26005)(4744005)(2906002)(8676002)(16576012)(316002)(54906003)(5660300002)(4326008)(53546011)(6666004)(66946007)(6486002)(36756003)(66476007)(186003)(478600001)(2616005)(52116002)(956004)(44832011)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Ujk5emREMWhzVmhqWVhRYXRTK0VJR2dkczN4bFNsT2g0bWVUMW5oUnFTR21S?=
 =?utf-8?B?eEJUVUZJT2R0NjM0a3ZwN2VnbmwrS0FlZEE2bmZDVG02MGR5bVhXV0hMMjVt?=
 =?utf-8?B?SEVRR0ZwRnR5aGt2NTVIVlh6WStzUzAzRldyR1pMRS9pcGN6S0pRWGJnZVpP?=
 =?utf-8?B?Zk8xeExIeWh0WGNoU2hTTitDQzNEck5WNTNMY0NIaEUvNy8zdURpZDkwdDQ4?=
 =?utf-8?B?amhubk1RcXd3NkRjMjNtc05jVXlmSmE5bXVWb3I5VWZCeDR1Ymk4MXp4Qnkx?=
 =?utf-8?B?QmdoVTRuNTNXWkRkNjdjS3lGOUZBRWl2VmVYNEZiQi9RUzg2VlVzMGh2c0k0?=
 =?utf-8?B?NGtoOE5SNXNudms0ZHlWNFU5eDI0ZlB6aHlNMno5emJpeU1PbFk5N21OUGt1?=
 =?utf-8?B?MU9LN1VaUEMrZlk1eFFUL0Q1SitYdDVBSDFBdHBRTWhyN2VYUjdPS2owZ2lB?=
 =?utf-8?B?TFllM0NVL1dTWlU5SVhpTUtPNzVrTVhjSEZkMjBsZXc0WVExTWJ4QWd5cFFT?=
 =?utf-8?B?dUYveU5BS2EydlZjTkY0QldMTjNNd2xyNU9rYkRnOHIxd2JCaEZ0MkcvKzFq?=
 =?utf-8?B?bFIvSGlML1ZjSWNlMDE1c2ltemhkc28vNXNiRjA0NkFjL214UXVXeWRwTEdi?=
 =?utf-8?B?TGQwR2Z0dU9Wb0d1VnNSN1BXWUQwNjFod3NsSjRJNjlKcUNlTEorWms4SXlD?=
 =?utf-8?B?NFZBLzZjOTQ0b25rVklVTlNqSWJzRHJqdkRyelFBVFpMbXRDVlVub3EvWkli?=
 =?utf-8?B?TVg2aGw5TnhuZU1JT2h4ZWdhRGx4clZLTFRKTGlKdGZsbU95dlp2QkIvRFlp?=
 =?utf-8?B?cHlDV3FGaWh5NXpuMndVVmhwLzdsS0pmREZRUysvcXR3UzZnY2ZoU3ZXTjZH?=
 =?utf-8?B?QUVqR1VYRThRN1FGaWs5U09xb3kzOTlmMjVDajgwMnJkQ0dpQ2RidU1wa0J2?=
 =?utf-8?B?b1J6dDhhRGZ3UjFMU0VtRXZray8ra2dKeHdYU1hrSmdWOFQvY2cvM0J3Ty9D?=
 =?utf-8?B?dmdhVkF2Sk16cyttVVkreWNtWWhEWEF6cFBHYW9ERnUvZ2U4UjJPcmcxTmV3?=
 =?utf-8?B?WlUzQzZNVFVyeGdQcVRDZndpTDdZYUNNSGszb3AxQmZCaG83NnZNVjlFNlZF?=
 =?utf-8?B?cmhaeFh5aEY1ZTQvUnd0VkpXTzhkeDNId0U0TTE1UDJid05vVlJsQnNBS2Fh?=
 =?utf-8?B?VThUTEh6TDcrT1o2MjhxdmRuUW50c2Z3a3BUOVdWU1hPYmFiRkJSczZvNTRV?=
 =?utf-8?B?Y2E2REQwNFVWbVhlZ0RBZ3F4dlM1czg4dDVSYUZ3MDRnMXhteUM5dEdNSnVz?=
 =?utf-8?B?Q3hycFQ3dG5nTFdPNkdjNWJhUmNxbS9oOHc1S0Z3UE1nRHJBYzlOZ2lZajlx?=
 =?utf-8?B?cmJqaXpCN2RuUXVoSUYrRUtsRWRYbERkVjhHR0diZFc2cTFSdXVKZEprVk5Y?=
 =?utf-8?B?M3pFenUyOW5hSy9EVU1ZdmkxLytNWDBLYndMSVlieGxTbjNwcFViOWJVZ2Z4?=
 =?utf-8?B?cFVzS2dLUG9ubU9QZ2hkSzA1bHF4RmIyc2ZuVnA5YUwrWmlyZUUrd01uVkc2?=
 =?utf-8?B?Z2JZOVVQZTJkRWpIQmkvK0VKMVNvNHZ1a2t1TnF3aEhsaWFFc2lYTjJ1TlJr?=
 =?utf-8?B?cFhSZStrV1lodDVCVVo2RTNZdCtMa0ZyVUJXRVpqd0IxNG9qL3ZTRk5Sdm1S?=
 =?utf-8?B?SnEvV29SSm5UdTQvTU1RSHh6aTRESmtwdUhlaEU4c2JFZWtSRm0yUVdEV0sv?=
 =?utf-8?Q?JqgJDEN5K7kiniwqwkllgwqHd5mKq4XgD+TzFo8?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09faf522-ec53-4cad-595d-08d8e2a30f94
X-MS-Exchange-CrossTenant-AuthSource: CH2PR10MB4150.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2021 02:28:44.3285
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yQ/+mHTca3+nXm8rZX+FBCdpdsZfBN/1Zsj6qtMxd5fGI/TR791tbhHuYtvctZiw/2XD9n5QaT0UM3KvXjFmOujIBWAXaCpS+uEfo2qMIyE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR10MB3829
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9917 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 adultscore=0
 malwarescore=0 bulkscore=0 suspectscore=0 mlxscore=0 mlxlogscore=999
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103090009
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9917 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 lowpriorityscore=0
 impostorscore=0 mlxlogscore=999 malwarescore=0 suspectscore=0 adultscore=0
 phishscore=0 spamscore=0 priorityscore=1501 bulkscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103090009
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org


> On Mar 5, 2021, at 2:50 PM, David Howells <dhowells@redhat.com> wrote:
>=20
> Eric Snowberg <eric.snowberg@oracle.com> wrote:
>=20
>> @@ -11,7 +11,7 @@ hostprogs-always-$(CONFIG_ASN1)				+=3D asn1_compiler
>> hostprogs-always-$(CONFIG_MODULE_SIG_FORMAT)		+=3D sign-file
>> hostprogs-always-$(CONFIG_SYSTEM_TRUSTED_KEYRING)	+=3D extract-cert
>> hostprogs-always-$(CONFIG_SYSTEM_EXTRA_CERTIFICATE)	+=3D insert-sys-cert
>> - hostprogs-always-$(CONFIG_SYSTEM_BLACKLIST_KEYRING)	+=3D extract-cert
>> +hostprogs-always-$(CONFIG_SYSTEM_REVOCATION_LIST)	+=3D extract-cert
>=20
> Hmmm...  We have extract-cert listed twice.  Does that matter, I wonder?

Isn=E2=80=99t this necessary, since one could build with either=20
CONFIG_SYSTEM_REVOCATION_LIST or CONFIG_SYSTEM_TRUSTED_KEYRING, without=20
the other being defined?

