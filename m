Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 80DBC339E96
	for <lists+keyrings@lfdr.de>; Sat, 13 Mar 2021 15:41:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233961AbhCMOkt (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Sat, 13 Mar 2021 09:40:49 -0500
Received: from aserp2130.oracle.com ([141.146.126.79]:47228 "EHLO
        aserp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233959AbhCMOkg (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Sat, 13 Mar 2021 09:40:36 -0500
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
        by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12DEeDSh090853;
        Sat, 13 Mar 2021 14:40:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=content-type :
 subject : from : in-reply-to : date : cc : content-transfer-encoding :
 message-id : references : to : mime-version; s=corp-2020-01-29;
 bh=yU8LGLD1013iISsrmuORDmtMoS3bRI07t7jdpCkM2uw=;
 b=H46gCIwMWyt1tUkzqEBxInxVa0sg4xf30K+c72SiiXmM0whkRi8YC3lBtxzRacMkDjb1
 lzjAGxemXFEbyuaf+Ku9CS6Rt1Ivt5MQyDU9kQtnVQokNXOa6Kd5bEirkzL8obQk7Wzy
 9VIn5nORlmTm+N6MmEQ7KyyOCEaF27P5B3MbkNcVGixrj8Hv7OjLzqNew6x401v5roYt
 ZkSVg+CvBmoFDVefBgjlBYL9FU2HgzVnw+6d1d0sdJW8vfLRSx0D3L+qUivUCXmSkRdi
 5vSK5W+SSd4Si4t7TU7mX9GjV28R94EtC8xpaFmaDRGyVQzAj9jPyO48Frl5aAhjf6+2 rw== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by aserp2130.oracle.com with ESMTP id 378jwb8rye-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Sat, 13 Mar 2021 14:40:22 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12DEeBFo162738;
        Sat, 13 Mar 2021 14:40:22 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2170.outbound.protection.outlook.com [104.47.57.170])
        by aserp3030.oracle.com with ESMTP id 378keb215b-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Sat, 13 Mar 2021 14:40:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z+dW2Lv2A2KaWnVn15D4TxDQEFx5GeVV5TThKa99kP/0ZyXRMShsWVZqX5ZXnVN+awRP6z88geF75zKn1npuqnhJ7Nc7XK1MxK0Mm59rwdTpIt9x5SiIpa7i3VhwQwroTe0nQg9pWT7K+eyTEPK52Sdji9KP2wD3vcYZfZVRW/L5EUBTg+PiWq2I7B9QVn4kalELKAadvnihckoWliRepaiimFmVo3e0yRUmMSTdiCq2nXFsnA5EMNWflILuZVUa4RkJy2Se8bf0nknA5dPdT0lPLZRLkkGCX+/TmsRSMQ8gMDlJ1Eqb8g7Vn4jw7n1j1wgPiwmIdAPoTvdPQCEHlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yU8LGLD1013iISsrmuORDmtMoS3bRI07t7jdpCkM2uw=;
 b=obPt0faBT4AqDIotIwBGHMMVBtbUSA40F2OreoMnefa/e9axrXmtYXOSNbyjzEk8KDqH9FMu0sgg4lrFdSkVOsNOByr4bYLrt4SZub8znV/5SZpCCmuqPtBO5c6vuqrK7Fvh5Ey/fXqAcfCvaiuG2dJksJ09kGI7F2QIhqdxL/wqBw08AmdngDqj7iJ2oFwoL7AxoDaCfJ7hzo5yvdvXBOydk8B91E/MfI5Myg1vz7F4XPhZfjPoxwYVTsBBvwzv0OHoFUBjSHqQoCcnj26ftVQ3EJk8Iwg1WslUPByVff+D09Gi8IRQwfE/5smkkNJMdS0jQveLhSro97K3Vz4szA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yU8LGLD1013iISsrmuORDmtMoS3bRI07t7jdpCkM2uw=;
 b=X/yC1zQwAcZzG1oRMwiKt5Aumex4gZlTNq99Q8gpngBg28vYj5Y/a++IBzU445o6V/S6jqEHrKsC2FOyOdojuCp+BOnvye4l8qtZamFupBN8JvLRi74PgOPXwwnOtJF40jcZODTfBB5UtjpICOlw1puBa//GtetKhkR/3X1WxWo=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=oracle.com;
Received: from CH2PR10MB4150.namprd10.prod.outlook.com (2603:10b6:610:ac::13)
 by CH2PR10MB4037.namprd10.prod.outlook.com (2603:10b6:610:3::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Sat, 13 Mar
 2021 14:40:20 +0000
Received: from CH2PR10MB4150.namprd10.prod.outlook.com
 ([fe80::95df:950e:af4c:a5df]) by CH2PR10MB4150.namprd10.prod.outlook.com
 ([fe80::95df:950e:af4c:a5df%9]) with mapi id 15.20.3933.032; Sat, 13 Mar 2021
 14:40:20 +0000
Content-Type: text/plain; charset=us-ascii
Subject: Re: [PATCH 4/4] integrity: Load mokx variables into the blacklist
 keyring
From:   Eric Snowberg <eric.snowberg@oracle.com>
In-Reply-To: <2579343.1615623232@warthog.procyon.org.uk>
Date:   Sat, 13 Mar 2021 07:40:14 -0700
Cc:     Dimitri John Ledkov <dimitri.ledkov@canonical.com>,
        James Bottomley <James.Bottomley@HansenPartnership.com>,
        Jarkko Sakkinen <jarkko@kernel.org>,
        =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>,
        keyrings@vger.kernel.org, linux-security-module@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <12AAB359-A315-490E-8B94-FF947997B30E@oracle.com>
References: <337B72A8-C81A-4C53-A4D6-FFFD7FA66CEC@oracle.com>
 <161428671215.677100.6372209948022011988.stgit@warthog.procyon.org.uk>
 <161428674320.677100.12637282414018170743.stgit@warthog.procyon.org.uk>
 <4b275a33-28ac-78c2-e075-ea2eda4f13a8@canonical.com>
 <92182F5F-327E-4F1D-A7D9-42355625C84C@oracle.com>
 <b10f51dc-b9d7-e84d-3a52-438ebd358a7d@canonical.com>
 <2579343.1615623232@warthog.procyon.org.uk>
To:     David Howells <dhowells@redhat.com>
X-Mailer: Apple Mail (2.3273)
X-Originating-IP: [24.52.35.144]
X-ClientProxiedBy: SJ0PR03CA0014.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::19) To CH2PR10MB4150.namprd10.prod.outlook.com
 (2603:10b6:610:ac::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.16.177.128] (24.52.35.144) by SJ0PR03CA0014.namprd03.prod.outlook.com (2603:10b6:a03:33a::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32 via Frontend Transport; Sat, 13 Mar 2021 14:40:18 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3f4ddf38-39a6-4e37-ad04-08d8e62ded0a
X-MS-TrafficTypeDiagnostic: CH2PR10MB4037:
X-Microsoft-Antispam-PRVS: <CH2PR10MB4037CA39ABAE75D1709D7483876E9@CH2PR10MB4037.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UYGUky/a0Zo5bd0SX4v7ZGxyRBifvVHeg16hqJuF7ADg790EE8kF13mxuP7uDILHAHM/wF29I9vh1zKc0CJ1thARH5Au7RYoIIGgY5Y1QDB94tmMr+x/Qmj10WIhXc5tm+GHUAzQ3Ozs0O3L5i28kuIGu79QWjKL6NkAHnXtIXk469eqNQzanW7foxgvZJaghES5K3a8lmEM+RDxXGqFLiaEHGAHmdHGhM61JYmoGFQLFTaCtgYRLlB1mTE902AyHN02x4HOXPR7Zv9vZfL34zHkH8yP2UYdklpID4briiU2yTvCL+RcPiTwf1xhI8nY4YngADBOBErUHUAFrYiODKFqcTyJe6HM1v8NgSXX6yCaEKMkmJwtr4UcrthCzskZM7WhrtJ+/Y5FN4Mn2G6iS3ree+cjb80aL7R1Zd5xlSzeh0zEndw0Qo+X54Uvs+kpdSav+SezFe4pvEQHTatBajLwU6T2m/Le9xxoXqqUTlUWs0fIUuni0p9nW5MVuyRiKDwQVebwWAajln1NPLHnTw8IFitXMZ5J0P+XpF4V1rAcSbhSybgixB/68FUyg8JptoVLQihT7axGghZZv96xHt7C4/BhKs92fI55Be6HeLM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR10MB4150.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(376002)(346002)(39860400002)(396003)(136003)(6916009)(16576012)(4744005)(478600001)(66946007)(66476007)(4326008)(26005)(8676002)(8936002)(6486002)(36756003)(316002)(54906003)(86362001)(2616005)(956004)(6666004)(66556008)(83380400001)(53546011)(33656002)(52116002)(186003)(16526019)(5660300002)(2906002)(44832011)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?ohmHm3AZ4bRMkKqjd2jd+dqwI+PeFUGL3Rg7uBB414Ib8FmlxSD/KHVSuhTO?=
 =?us-ascii?Q?cJncqWpKhCTJ46BZkRvjm32cVT7ybHy4Qwg1deasaQqxL6EPHxMbWK8ZTTdX?=
 =?us-ascii?Q?sB3JiU6/T8UzITE30oQNqSV94k5FoiQdrX8tOs7IiHOqeAEmEcaqRw8Rv0F7?=
 =?us-ascii?Q?y868YUpYSvPfhtms6dKOcrNoVuEDH7I0yYP4pOd01UybO4thBT00rdA4mWzE?=
 =?us-ascii?Q?FdfUU3rvkCyRmhML/tp9wZQJqt2QZKieRsZ5b0m8gPdeZiigI9GXBtRmZAcy?=
 =?us-ascii?Q?Dvfwy7QNGOOzXkNkMGZEuNmNrvW7kxqiEGUrf/KgL2yjKtFDhq+uGjm7j1e7?=
 =?us-ascii?Q?L/rGACQgH58m7sUh+n1IBvu9vsftileuF+0qukBhR6yxV9Rd40kx00VawIGR?=
 =?us-ascii?Q?Dv0xZgcRIm8BOWLBsVd5xQeGkwfAW3pfbQHxQXBDnA/Ub3lUZ5xIaPOfw8/4?=
 =?us-ascii?Q?OILxzJC7aqYR2GDz+3nnSAK5R11oCSPRF9P35OUW94Au/YiOtXTIQpCWwfNs?=
 =?us-ascii?Q?2h1IWHRfX6Vm2Rb0XVCJaoTyT6Sx/hO7uBvNiJGiryDHkOsp00X4mG9A+XmB?=
 =?us-ascii?Q?DLF3U1y4yqQdvj5UB8es6AZkLHLjJxKNXH7jlv/XoXH34b4kZf4qbXSWpzCa?=
 =?us-ascii?Q?E+1a958dyX0ATdHQQrNLE/gJG8U6LUBlaE4r3iy0JfqZVh6L2VfT23GsrMhk?=
 =?us-ascii?Q?2MGIVq5I8tshEMSP606dR3CIbCqpgOlSVvMK5zQVLpKbxxgcDJnyjavavVCA?=
 =?us-ascii?Q?WHcb1VQ3pMJsbe2tX0fgKv4bdDq+zdt8AKP/BMtnnlAgPCOWfaypmI5g2IMe?=
 =?us-ascii?Q?d0Y8u9qVEfmNQyiPPiKX4Bz3ZJg4oRij3ovKgWe/pEkcjQN6nMq9n7t+/Wly?=
 =?us-ascii?Q?wsImiYlAtfR2IEzJsxXoRUnpHM+uMTB5cUjAZpBLeO6K1BFu6R6+mNsujlC1?=
 =?us-ascii?Q?6KkwXutiiJVCtM8v0bb1FMC1KA56Ek1J3T0KMvQ+c9r+Rx6/wa/oQpRQl7Tr?=
 =?us-ascii?Q?NSHEqOqFMNYrJ7p9LV8geBUbstlhYlRBWIAgvrCpd3IW1O+cePnIn0FDkruX?=
 =?us-ascii?Q?i4kT839642S/cPPLLb812e8gGBQL0kHp6XIN9/iW0drHVdhyGBt8KwYQRuwM?=
 =?us-ascii?Q?HJb1a0ulMHFfDYJJT396vvRUKBlC4sA7K/ZsT01QwkHQkqAUISodx97iyI/y?=
 =?us-ascii?Q?zVB3UqLyqbINF+tYAAHOYhySCoP4nacAvczZmztudBCVvHJSPjld5gBmovO+?=
 =?us-ascii?Q?2NDMm3K8vB/aweern3e/tqz69xeq8n9vSBxXVVeAVe+UoNdSqvsgxbeTdyBB?=
 =?us-ascii?Q?ZIc65nyc0YBWMbolM3EuJE/i?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f4ddf38-39a6-4e37-ad04-08d8e62ded0a
X-MS-Exchange-CrossTenant-AuthSource: CH2PR10MB4150.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2021 14:40:19.9110
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: twv6SGz81rZXVZGNKVtq2okuHhrXgInKjLPuy+6OlasctuBqMv6paesilLpjy7OJ+LwMnC6c4gipnjpgN1LFca/qartrHB891H8YdOM0Kmc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR10MB4037
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9922 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxlogscore=999
 suspectscore=0 mlxscore=0 adultscore=0 malwarescore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103130114
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9922 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 mlxlogscore=999
 spamscore=0 mlxscore=0 bulkscore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 adultscore=0 phishscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103130114
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org


> On Mar 13, 2021, at 1:13 AM, David Howells <dhowells@redhat.com> wrote:
> 
> Eric Snowberg <eric.snowberg@oracle.com> wrote:
> 
>> If MOKx will be available thru a config table in the next shim, 
>> I'll prepare a follow on patch to add this support. 
> 
> Can this go separately, or would it be better rolled into the existing
> patchset?

IMHO, since you have already sent a pull request and this is not available
yet in shim, it seems save to have it go separately.  I should have time 
to send something out next week to address this change.

