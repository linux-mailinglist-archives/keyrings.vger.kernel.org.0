Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1259C3079FE
	for <lists+keyrings@lfdr.de>; Thu, 28 Jan 2021 16:44:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231126AbhA1Poc (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 28 Jan 2021 10:44:32 -0500
Received: from aserp2120.oracle.com ([141.146.126.78]:53558 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231148AbhA1Po2 (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 28 Jan 2021 10:44:28 -0500
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10SFIu86161844;
        Thu, 28 Jan 2021 15:43:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=content-type :
 subject : from : in-reply-to : date : cc : content-transfer-encoding :
 message-id : references : to : mime-version; s=corp-2020-01-29;
 bh=CVLMcR4tiBntsRKU0kq3y8hj2RKFQVBkkmQa/gCRibY=;
 b=dCwnLi0/LY4RZW2pIPs4IEaVcgaexYVuUtfeyjDBe2oTVlr9r8oqY2Gu8XP1cu1N1ERz
 r/vCenBMM0YEAxWffja1RHjWq4bchtnZPTJoSxv3PoszZ4sMQ/ShyWtItmg5gv1c0kHE
 QEnQk5DWgVCpexiXDEtKti7CjM3k0dIshTfxDesLG+DIVKyEHHbOS87822WLdGZg2eIR
 lLHBiLVvBtFvQC/rjd65MGRXAMaTNQKbckukyAiVVlBs0DWF7FAuQ1HLwJw2IbBFfI6e
 Jf8hL+BUjVwVV1j1MFlyhuBrtUVqM8iOsm1u6XHXbDLHHqC62XAVNK6mqHVJWPS1U3mb EQ== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by aserp2120.oracle.com with ESMTP id 368brkvpen-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 28 Jan 2021 15:43:13 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10SFJqKR134570;
        Thu, 28 Jan 2021 15:41:12 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2176.outbound.protection.outlook.com [104.47.58.176])
        by userp3020.oracle.com with ESMTP id 368wju7n2m-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 28 Jan 2021 15:41:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hMel7e7HlPJiD6bGoGF/HSz2pDVsqTZx5l93NQX2FWnygqEnkwLe5+eW/7j0H4HEBTGtiekJ7oOS65jANZ2Ly/BlqsJWUPCofmh2/KwTa5gAFe4czmdCFFFC/rACYcGD9gmhZLvPuNOmK4GGiYjwmRhDnit25lW8P5XzSnsBegzxLmbK0JnWrUCtawVsg3+qG9U+PX/r1ovFnrYYPSt3R71nsSwNUC7qevBKjzfET2MmtKQtHilKQsZdTNxSB0W4+AoWlmWwDqTNHPApnH5qVqo4+kvXYCJEWF+Yh7Mh42d/wxdWaQAKfr2nj9R/encrgumxJnRsVbz0flLreMGbcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CVLMcR4tiBntsRKU0kq3y8hj2RKFQVBkkmQa/gCRibY=;
 b=Qodg/L6FvPjD2ONwy0twfBY0AhJGvoG4yuBde1UBVHiKg5Qrlt/aiwfzlIXPCxkCNl9XbMH3PVxHr4DfZVpD5MDx1tF54l6v8yxqM+JU0vNjGGFOMjII/zVKbBeAVQMIauUKKUzM51ZhYVJcCLkcyT5QuHwSMwj/YWi0fXe5rHEepv4kL74Is04nNQoK4qyXfEiJC/Sta1hPfSIRNaq3LJ4dZ5igHEr22OfPEe1vowF5HzgLR/nvTocSHtt+MskwCvLX6DD0NZgOjxUnfM6llRXDvFZOed4F7ZCdqr1S/5rSfSZSIpcTNFityhHsxiIosp7f3i2EfAtzL88x7rwJiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CVLMcR4tiBntsRKU0kq3y8hj2RKFQVBkkmQa/gCRibY=;
 b=GJAwZ8xgipz4shVoZkIGvDXbaKiev/+vPJq58DmrALEoEWjSE9NJExkMX0LQie4V3S2uu9j0mMPbZd39pqxg4GSo5KQzw2O6SU9R/zQzBeKZ6WfjbswJdeNKVzw1i5tz2Bk0ueCUOcAwRO5HwwauVsY+z+mNuv8MO8slEFiJxvU=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=oracle.com;
Received: from DM6PR10MB3099.namprd10.prod.outlook.com (2603:10b6:5:1ad::18)
 by DM6PR10MB2698.namprd10.prod.outlook.com (2603:10b6:5:b9::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.16; Thu, 28 Jan
 2021 15:41:08 +0000
Received: from DM6PR10MB3099.namprd10.prod.outlook.com
 ([fe80::70bf:d626:5218:70e4]) by DM6PR10MB3099.namprd10.prod.outlook.com
 ([fe80::70bf:d626:5218:70e4%7]) with mapi id 15.20.3784.019; Thu, 28 Jan 2021
 15:41:08 +0000
Content-Type: text/plain; charset=us-ascii
Subject: Re: [PATCH v5 0/4] Add EFI_CERT_X509_GUID support for dbx/mokx
 entries
From:   Eric Snowberg <eric.snowberg@oracle.com>
In-Reply-To: <3568165.1611846997@warthog.procyon.org.uk>
Date:   Thu, 28 Jan 2021 08:41:04 -0700
Cc:     dwmw2@infradead.org, Jarkko Sakkinen <jarkko@kernel.org>,
        James.Bottomley@HansenPartnership.com, masahiroy@kernel.org,
        michal.lkml@markovi.net, jmorris@namei.org, serge@hallyn.com,
        ardb@kernel.org, zohar@linux.ibm.com, lszubowi@redhat.com,
        javierm@redhat.com, keyrings@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-security-module@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <F1679B8B-F8F4-4B49-B728-27E8AE3F156C@oracle.com>
References: <20210122181054.32635-1-eric.snowberg@oracle.com>
 <3568165.1611846997@warthog.procyon.org.uk>
To:     David Howells <dhowells@redhat.com>
X-Mailer: Apple Mail (2.3273)
X-Originating-IP: [24.52.35.144]
X-ClientProxiedBy: CH2PR14CA0006.namprd14.prod.outlook.com
 (2603:10b6:610:60::16) To DM6PR10MB3099.namprd10.prod.outlook.com
 (2603:10b6:5:1ad::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.16.177.128] (24.52.35.144) by CH2PR14CA0006.namprd14.prod.outlook.com (2603:10b6:610:60::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.16 via Frontend Transport; Thu, 28 Jan 2021 15:41:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2d0ab8db-e8f2-4fdf-e439-08d8c3a3219d
X-MS-TrafficTypeDiagnostic: DM6PR10MB2698:
X-Microsoft-Antispam-PRVS: <DM6PR10MB2698C8B46BA2245D5E909B2C87BA9@DM6PR10MB2698.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4vAb572FetjFjZVusZDK4PSaNYjrevLDiigWBw2PBOnzTgBBSjkm3Q+sqWFsOBZiK5xLucIpRX3n/JXI15JgQewtGdJNa9WCq6SzxMb02iMKoAz4183IjU0mc1QZ54ETFZzEo4eWbtTWuC9UGGdO8S2nU51ILOq+0QK6BtGrhJNG9fb8m7oSdPMtJsy/L5ZDBfFXf29w1fdv2AFbRR0zG8M32N2GxQHK3m4o9ix0QyrjA3SSQYlL5X4m+xU0mOTsU15XuGSaa/S0r6BhfhMhunGqQD688jTLtsTuIWHcUv8aaxAVxAc/66F7wMiK6UOj6L96tE20/o59rhipWOwW7uqJzmTQstTuQnGVabLkNOU5+DFWY7dtZU0QzuhPuwEHL3RLjCOMEcFwQRwsxb9zm1rj0YVIxBZr1w67ozdTjNVHdQVSpLotsbwwELxRUTGhqn677L0/hGik6BLOiCM0N5rHJ7togZ6puuuJdltHbGBxwhdgsUbhzjbercmiXW9oySOE5jZi3M2Tmno+6mo649ltbh364sBpCYcXH26rn9zJnBEz6lKrxc1FLeQNw0JVDc6zggIv8LIytUYSTDf5wA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR10MB3099.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(39860400002)(136003)(366004)(346002)(376002)(396003)(6916009)(6486002)(52116002)(4744005)(33656002)(8936002)(2906002)(16576012)(66476007)(316002)(36756003)(66556008)(26005)(4326008)(66946007)(44832011)(478600001)(186003)(5660300002)(6666004)(86362001)(16526019)(7416002)(8676002)(956004)(2616005)(53546011)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?omHuZrPCbfLvmzP8Fhhb3yuJimoke092eCl9pwGH1/ETCN4Qujf9EQa/ZvPw?=
 =?us-ascii?Q?tOczf3Ab9/pQczqImrpcLjdOMhvFKE0GdiqvM7p/YANsAZeDZfGADM/HQPnd?=
 =?us-ascii?Q?Kqt0XrDdA9u6ZkmIgGQGn91e47beWfUthqRBiTQJ4LImKd33r+xwcucVG/Av?=
 =?us-ascii?Q?pr/YoPP7RuAMGAh9sNoCHPgMoEomRiVDu7TnLSKuRzXQF6HSZA4Q/Rb1ePhC?=
 =?us-ascii?Q?nVZgxkayd5HstUV0laAQC5mH+WbEz88VzCJve2AHphgW5XiGQYW9rsHIcq3k?=
 =?us-ascii?Q?4wfFHDrW2zgbGwxGq5sgjtsPllAEmK2O1vRR0zvmj2kPQX3wXZrRY+hzoHn+?=
 =?us-ascii?Q?1xrdkgEnA+2VwXB9g9FVpZ4e5UlCKEnSmUZAYWzegJiCaOp5o3n6ytVOiQx8?=
 =?us-ascii?Q?rFMOk4aYzJXxxmSsw+OoQ1s+TeXBUNdNeiZzPzCWHsG31zNqLuXd2Sp1x0wS?=
 =?us-ascii?Q?1MlpRH2GOBbw6ojS/eUSNNFj/eA91Wc9X+LOUsmkAyzogQzMtJgMbI1AonNw?=
 =?us-ascii?Q?YXHwacrfro9esRPZi6sllcLUFxmbyF4dDXWxKpm8X9kNiMy7Ju8ngwdfGdqD?=
 =?us-ascii?Q?M/jDA7EssWw4Qf/yGMwiWnTPJqjf3yC5HBk2Wb0RC9PDatlWOPxz6VQ7Q/nt?=
 =?us-ascii?Q?lOLo4x7Ua2QkWTW2q0b5uzLu97Ghtib8sXp0K55p6n5BvNX/1+zlM2c2FPk4?=
 =?us-ascii?Q?1UmNqyg2cpCyUu0Pj2cH1RvLBXYCjgmEPRkVdAPbfSiY/KUTOxCPFQ+kFFPv?=
 =?us-ascii?Q?U/fVlw9c/+SoSJC1czP0+VEhxiQOYY5IC9HGZJJYKBGYcdng2tauOdu4IslM?=
 =?us-ascii?Q?qxLishd8Pn1p0wI5ldhYINiPX3cb9RBCmt0dxQgN9V4xzBp0DPAm3Jq1v64B?=
 =?us-ascii?Q?7fvIiEvzqB2npSATjSGlWJa887yrteGemu+yFxkVL2Nsv7h/xcAWGYBHq+kL?=
 =?us-ascii?Q?msmrh23IdnC1qPT/7s0sB5j5T1dAeoZIxfQ4DYbSSB6hCOtiK4sotYbBEQj4?=
 =?us-ascii?Q?cWaVaTbQBXljfnfGjsh4/cgUK6Wq+iKepFBhZvqWR0OAc/KpJLBC/cX6wQzL?=
 =?us-ascii?Q?jlhewKD2?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d0ab8db-e8f2-4fdf-e439-08d8c3a3219d
X-MS-Exchange-CrossTenant-AuthSource: DM6PR10MB3099.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2021 15:41:08.6335
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XjQ877m211gn/p71q3qLowqIPkKbvoDJnJTw1g4140hMY8VtH1InBCcM1VOS6Nj/Eci2n9eL6I8k3eOtMfUkV6ZTu+b1g5SqSZ+EP/Gl4MU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB2698
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9877 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 suspectscore=0
 adultscore=0 mlxscore=0 malwarescore=0 spamscore=0 mlxlogscore=999
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101280079
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9877 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 impostorscore=0
 phishscore=0 bulkscore=0 priorityscore=1501 mlxlogscore=999
 lowpriorityscore=0 spamscore=0 mlxscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101280079
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org


> On Jan 28, 2021, at 8:16 AM, David Howells <dhowells@redhat.com> wrote:
>=20
> Which tree do you envision this going through?  EFI or keyrings - or are =
you
> going to ask Linus to pull it directly?  I can pull it if it should go th=
rough
> the keyrings tree.

I was thinking it would go thru your tree, since a majority of the code
is contained within it.

