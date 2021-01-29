Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC2EF308376
	for <lists+keyrings@lfdr.de>; Fri, 29 Jan 2021 02:57:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231313AbhA2B5a (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 28 Jan 2021 20:57:30 -0500
Received: from aserp2120.oracle.com ([141.146.126.78]:45054 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229819AbhA2B53 (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 28 Jan 2021 20:57:29 -0500
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10T1mqjd192161;
        Fri, 29 Jan 2021 01:56:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=content-type :
 subject : from : in-reply-to : date : cc : content-transfer-encoding :
 message-id : references : to : mime-version; s=corp-2020-01-29;
 bh=vovfwi5FNEFcK+EZPtVSn1vJlbaPCWwc1THeek7jmVI=;
 b=BUIrRJGobai4ncuFAKyxVa+TilKQtHB3Xi8XhuumtlIPR4I53IiTLmOuMGBx8jXsb9QB
 kV5eHe+/mKKGt+LEBtgfpjEoKl1NDSValJEaFa/6/YwJZBFPhGH8dYsE+YfnHoB1yXqg
 eoxiDSXvV6imNE2nBltpQIJnwVrbQMPMiio8eXtlVVkUylMmZ2wmCxtVHavSlZXieT9H
 GGrYeEzv5xnwOVPeMsgbDwsnQCATb2onaiRJ3HD5vb1pKa5JwH4jH/rd2t/sy2zygN/V
 FVNc88+Wxx7frvVrpjzDqB3zP3jeIS1sAJmH47OwT6ZQHXBMK4yeQpoe7LVoNBIK4m0M SQ== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by aserp2120.oracle.com with ESMTP id 368brkxvfv-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 29 Jan 2021 01:56:26 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10T1oHtf105654;
        Fri, 29 Jan 2021 01:56:26 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2047.outbound.protection.outlook.com [104.47.66.47])
        by userp3030.oracle.com with ESMTP id 368wr14yj3-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 29 Jan 2021 01:56:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ao0aqw6bonfvDjG8BwN2zBU2Cv+veO/WjBY4LEPciSsVEDKYvUsz0wRvv0eqvJ5j1NTft/V8LAxyM0WO/oas9n+y7q0hLuqiCQlVzXXPhzH6t+0kWdM5PP85vOdFUnglEJwZakESKEKoCIVxSDkcnrQUboNcYFcfMOHaDFZp+8lWrE30A9OZgqac55UKqZX5Ijamc9LmSI0ad2kNlcP4D0HqXZS1/fYM7kX6JLjiEINmspL+kcpEhl5IupzTECfdj0LUjuTXCOWaI7t1G4LB+p9R4Bs8z8wQEt492CaNeuRsHwyo1SCH7vphWTPNFD3qcSA5GfF0jWGvBF3xnnF/ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vovfwi5FNEFcK+EZPtVSn1vJlbaPCWwc1THeek7jmVI=;
 b=b8HPPEqInj46CfjeZJ0V3hx+TmXEhieTd4SBPTSWqo1Q5E3jJYzDG+OxJXLPbAw+vNqGGyml8jcaPnfGbjEjfuEgquqIh9ivQ3/29KltpX3Mqsx8sWkWyj/UQ52gGiP1EdnvXeKj2ivMiTFyNEZrJQFDp70Q12vQuprtTqlc1RINkI9vuPYKSC0N6PdZajesDHgJ4IUluAF0GiCTfZ3YlfiKgtBcfSQzgup7HABzzQK+U8LfGNTLx+I8ZbSYWgEstVsPYjtwltdw3UiaPNytaQ1TgCWCAQMgC0SJz6p6k/ZrE9ub8l4kPM8styr8S3Sg2UnxQ8qUuUKDpktftJHuAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vovfwi5FNEFcK+EZPtVSn1vJlbaPCWwc1THeek7jmVI=;
 b=dyPfDZBU5R/EufQvQn2ubRpNQs9sxdZtEglgAZswXfk29e3fnkixMUHSv+IoYT4/3uWV7GMM52pE0xa7+7nSaiM95i+nD/lyComYFKOiTFGCD1coerCh8zma0t/dxemsRJlEh/SUzhysN92T/OvOhA8ozjZZR44zdJ1ggeJb+pA=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB3095.namprd10.prod.outlook.com (2603:10b6:a03:157::15)
 by BY5PR10MB3876.namprd10.prod.outlook.com (2603:10b6:a03:1fa::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.13; Fri, 29 Jan
 2021 01:56:23 +0000
Received: from BYAPR10MB3095.namprd10.prod.outlook.com
 ([fe80::ec17:5c39:b99b:e404]) by BYAPR10MB3095.namprd10.prod.outlook.com
 ([fe80::ec17:5c39:b99b:e404%5]) with mapi id 15.20.3805.019; Fri, 29 Jan 2021
 01:56:23 +0000
Content-Type: text/plain; charset=utf-8
Subject: Re: [PATCH v5 1/4] certs: Add EFI_CERT_X509_GUID support for dbx
 entries
From:   Eric Snowberg <eric.snowberg@oracle.com>
In-Reply-To: <3579295.1611849483@warthog.procyon.org.uk>
Date:   Thu, 28 Jan 2021 18:56:16 -0700
Cc:     Nayna <nayna@linux.vnet.ibm.com>, dwmw2@infradead.org,
        Jarkko Sakkinen <jarkko@kernel.org>,
        James.Bottomley@HansenPartnership.com, masahiroy@kernel.org,
        michal.lkml@markovi.net, jmorris@namei.org, serge@hallyn.com,
        ardb@kernel.org, zohar@linux.ibm.com, lszubowi@redhat.com,
        javierm@redhat.com, keyrings@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-security-module@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <046773AE-687A-4924-8564-FDBBEEAB663F@oracle.com>
References: <8f0c3b88-872a-bbae-eaa2-1467b6f386a0@linux.vnet.ibm.com>
 <20210122181054.32635-1-eric.snowberg@oracle.com>
 <20210122181054.32635-2-eric.snowberg@oracle.com>
 <399024a1-59fb-12b8-9ea9-9bbee843dbc8@linux.vnet.ibm.com>
 <13EE0575-2F90-4C49-AF5D-365B63D2CB64@oracle.com>
 <3579295.1611849483@warthog.procyon.org.uk>
To:     David Howells <dhowells@redhat.com>
X-Mailer: Apple Mail (2.3273)
X-Originating-IP: [24.52.35.144]
X-ClientProxiedBy: CH2PR18CA0016.namprd18.prod.outlook.com
 (2603:10b6:610:4f::26) To BYAPR10MB3095.namprd10.prod.outlook.com
 (2603:10b6:a03:157::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.16.177.128] (24.52.35.144) by CH2PR18CA0016.namprd18.prod.outlook.com (2603:10b6:610:4f::26) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.17 via Frontend Transport; Fri, 29 Jan 2021 01:56:21 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 27d268ee-dd26-4216-21b0-08d8c3f91488
X-MS-TrafficTypeDiagnostic: BY5PR10MB3876:
X-Microsoft-Antispam-PRVS: <BY5PR10MB3876826A6876588DC5BF3E7F87B99@BY5PR10MB3876.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: E5fqgvyfvIQl/TZej5qL2g19g8+3n7I6ot8ImSbhXnZXbRazqXu5OO19z842mFbsfVWuQ4YbBbvJAzOLB1nTATtQq2UazJHjl5GMDFwyc09UtOILy5LjoxOiFW8ANWYeqhklOMMiAf32yWVEUEv5NB2apTvNkjrlr59LJVUYTJ0bEF0nOwIPq01W3LI6HX98eimC4FZjtgAUaNiV3MaCvehTQNNW1MXHImy0nYrS92sFOlnouXczFECTc30QTvPyWTp22k6J/o7Ue3gM7a4dfO9ae9jiUc0ghtYSAUqdB+MkXRXtDAXijNicDV7cjEwbw12luHNxivC3gQbd4UvNkY2qp67Hc+hGtIwGJ+WW12qRM0cM7S1zL7tRBGSKVWLieTSSAlruTHbQ+MWRQWJNJCM2KKS3kSXNYofNT/OCe/ZU3Gk+m67gxH+lSQWd84838+HNJuGPKlcwEtUsRUw4181RZvPija1V8ei3bxp/b2nsAqRThj3i4vIkY0Lr3JEbphgHx4ExDczTeJeJh9YHnm0gNYpjZNBTDdXz86ur0bcR4VY/W3rjLWGLImdAbaMTTiUsoxnS7nkVMkyTe9Aa1Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB3095.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(39860400002)(396003)(376002)(366004)(346002)(6916009)(16576012)(53546011)(52116002)(66946007)(86362001)(4744005)(2906002)(33656002)(6486002)(478600001)(956004)(4326008)(5660300002)(7416002)(316002)(2616005)(54906003)(26005)(16526019)(83380400001)(66556008)(44832011)(6666004)(186003)(8936002)(66476007)(8676002)(36756003)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ekh0UXZuOEJiSDZEZDQvckdmUHBCK2drV3hZTWNOaCtRWHduNkVsZ3V1eEtJ?=
 =?utf-8?B?Wkhkc1d0RW1LczlMUHFMaEllWnpDekpOeUEvT0MwMUtZMGVLMXZkaE5hRTdI?=
 =?utf-8?B?U0FvRG5JSE5lT1RERVJTQkZHdTdtWXprcXVYUHBieUhKSW1QK0plV0NEZjRE?=
 =?utf-8?B?WVhsMXpBcDI4cm1iclhBZlI2OHFNY1hEbm1mOWZnZ05lcy9aR29TZFFFekJy?=
 =?utf-8?B?RU1ScTl2OGtXWmZFeXRidDNUVjRoc3ExSFB2ZjZMQXVWRnM2VXF5RHZLREtm?=
 =?utf-8?B?Zk9ta3NXVjZCRGpHT1FvdUFqM3BTSkpEbXk5NGVxNkh2SGhlbzFYblZ3TTdW?=
 =?utf-8?B?bVB5eFV2MW5nL01XUUkwRGxlL2F0Z3FjY1A4RlF4dHRLbC8vWnNUQTY1UEtO?=
 =?utf-8?B?SU1oMGRjd0Z0bGhCYzdnY2J4bHJDRHVMMnQvNW52VzF4NGdCaE9aaUQ2Zzh2?=
 =?utf-8?B?Ti9DRlc1NGtZcnFUaEEvZmZQNzVYV0tOK2dKV3huYndqR3Y4YXQwOC9FOFFo?=
 =?utf-8?B?RWpSRWdtM1FYV3ZWMW1pRVNkZ1dnMFpsM3B6dGhzSFBPSWI5dEZWZW8rcFZD?=
 =?utf-8?B?Uk5pYkpCV3d5WnRNM0FBeWFsKzNQSkFTeVlhaDNjVWw4elBiVlVxTXNqT0ZU?=
 =?utf-8?B?NWVNUjNMdDdtTUprUTBJT2hkeFdJc1JUWEUrNituOW81RFR1QkJveTNyS0tk?=
 =?utf-8?B?d3RHR0RZSmdQT1RlbzdHYTcvVUV1TU1xeXNhU3YyQ21XeWwwaTMwL3Q0OXkz?=
 =?utf-8?B?NE9rQXpCWHN1blhkdVYvR3hWTDc1V2p6K05xRnZIODRZaTJkVklneFR0eWZ0?=
 =?utf-8?B?SEJpbVQxbDQ1SVQ3SjJIeG00WnFGQnFEM0VtK1V4Uy9STHA1U21mM1lFaXVJ?=
 =?utf-8?B?TjBMdHlJTVJ6NFFqUk5TMSt0QzdNdnhlaGF2YUM4NkdLQnE3bzlkN3BtcWJh?=
 =?utf-8?B?bTNSTXVZeW1lb3lObGU3OW9COWFyNlM2L056Yml1a2pkeC94Rk1UbUw2eFEz?=
 =?utf-8?B?NGhvL1hNa3gwYXNBaE9wbk16SjBFR1NWYXFaQkNaVkdST29RWU16ZEpSU2RS?=
 =?utf-8?B?V2F2R3RyTEtrYllTQ3dWMzlqZ3VEb1dMYjYxc1p1N3dFVmw0U215SVVneHd2?=
 =?utf-8?B?eXE2MTJZc0t5RTVKb2ZMYkJJbkpyVHhwVXRIVG4ySmM3eCtyM284aFFkdjB1?=
 =?utf-8?B?V3RweDFNdVN5Zkl1V3V0YTZMRDhvL1lhZDR6M09UVkNLMEs5cmtNT0txbFZC?=
 =?utf-8?B?b2ZVc2YrNExHSUhOMURoZXRRcDRGS2Q5dVZHdWFTUnl4eUdLYXRtY1UyUGR6?=
 =?utf-8?B?WGNwOHBLUlh6Yk42Mm1id1RWZTN4ZHIySUxtRzg5SmJ6YlZ5b1lJMG15UUZM?=
 =?utf-8?B?aXVRTmlGREdKTnRDU2dlaFdRZklqN2FSK0k0aDFaK25UbnA3K3hyR21YN0l0?=
 =?utf-8?Q?M4m1GaaG?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27d268ee-dd26-4216-21b0-08d8c3f91488
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3095.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2021 01:56:23.4552
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IhVh5BU2IZdh6ZiWSNukTC5rcjddTE8bBgmJ+CMUW3XNlebZshKC4scXsR71fBG3nilPEPGN4MlrhUTwCOEDeT7qoNSYlmyxW/Fx98SnMJk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB3876
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9878 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 spamscore=0 phishscore=0
 adultscore=0 mlxlogscore=999 malwarescore=0 suspectscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101290007
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9878 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 impostorscore=0
 phishscore=0 bulkscore=0 priorityscore=1501 mlxlogscore=999
 lowpriorityscore=0 spamscore=0 mlxscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101290007
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org


> On Jan 28, 2021, at 8:58 AM, David Howells <dhowells@redhat.com> wrote:
>=20
> Nayna <nayna@linux.vnet.ibm.com> wrote:
>=20
>> Thanks Eric for clarifying. I was confusing it with with the broader mea=
ning
>> of revocation i.e. certificate revocation list. To avoid similar confusi=
on in
>> the future, I wonder if we should call it as 'blocklist' or 'denylist' a=
s
>> suggested in the document. This is to avoid conflicts with actual CRL su=
pport
>> if added in the future. I also wonder if we should add the clarification=
 in
>> the patch description.
>=20
> Reject-list might be better.

As far as naming goes, I have no preference.  If we can come to an agreemen=
t=20
on the name, I can change it if needed. Or David, if you want to pull it in=
to
your tree and change the naming again, I=E2=80=99m fine with whatever you p=
ick.  Just
let me know how you would like to handle it.

