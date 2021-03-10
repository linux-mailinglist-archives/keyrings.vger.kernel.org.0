Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 784B0334BED
	for <lists+keyrings@lfdr.de>; Wed, 10 Mar 2021 23:48:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231368AbhCJWsZ (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 10 Mar 2021 17:48:25 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:38104 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232523AbhCJWsE (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 10 Mar 2021 17:48:04 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12AMiAav184316;
        Wed, 10 Mar 2021 22:47:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=content-type :
 subject : from : in-reply-to : date : cc : content-transfer-encoding :
 message-id : references : to : mime-version; s=corp-2020-01-29;
 bh=3uAFnGjT7sdJ9LxUg5ZTgpu2lBdfCh0rS4krQ+CZFYA=;
 b=tfn6hSBqvXagXtnecYSizs0JuRHrfcYpJ6v3kqt1XGWvob/LErOkMhiEvcHHk+i978FJ
 ydjThZiCPk0u15JIx/akC8Q5z1BeanErQQ2gkXdxca1Sp361LOmTuj0fOeVjcjFtZGcK
 rh9KT4gSdK3g6J0ueD2A8T4ZR7yHuDr8jbQcAxJYa8hJbBcZDEKx6eaeFiMTd3NyZenA
 8p7m9GiPTibBImo1xeqMNE0QO9aXTNPznUF+PkF3X1aU/pClTKrdHkaueoQw8oKP4OXl
 grh61Fqvf/jfx6kNDxKZjALdWXN8tNsobFDGdvO+X9lc7VXR53hSHwqv0Afq7SjfTfV6 3A== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by userp2130.oracle.com with ESMTP id 37415rcr2r-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 10 Mar 2021 22:47:44 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12AMjTU9039660;
        Wed, 10 Mar 2021 22:47:44 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2174.outbound.protection.outlook.com [104.47.59.174])
        by userp3030.oracle.com with ESMTP id 374kp01y7e-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 10 Mar 2021 22:47:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Awr5gfvlpN/feBUt+M1T8Vw9JO22yfUiScZdKxO6EwTwoxUWCHasObPKqkCYTE2MH1CJ3xiw/KrGhE00Ax9975+QqphqHGKmy+qmqRlqCGoLE6jLBbAgJ/kLjxfZaJigNXhLdj9/Pdct60exPW448kmNowJqy127Jj9TfVGVhczpL8+Y7h1IGEJGGhjO9ZU/lzNSwhEXpVEWtfOzYhZVasCHbqVnqDSKtA09aIJt/9ACxfMS51ur1ItzSJ+YmrXPyD0wkD6lMAsymvHMt6GGMzvg0XsxOjlJamfPHTHyEg/uzSdLwAKBx0aJ4fj4XHDf82O/MUcVp3BuSNiFJpkk7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3uAFnGjT7sdJ9LxUg5ZTgpu2lBdfCh0rS4krQ+CZFYA=;
 b=RqE0PZIx0ItujocX0w3wPk3rYMD/P2s0pRQhwMZ5PbDKR6/2YC25SN4lx7s5Ibi4UUGmJ+4+CtgTPEUdKx8/rfl2KR2invapNZzVtuWJAxO6meDbRufkn5R484L4Jj6f9zHgKH9rMpgdxHdhCmdv+xhp+Elo+hSmmrnTMd/7YD5nl0KsgCR76tYRMTRTzbvZakwXWq0Sw5/H8Bup3fm8ldkJtEc0ZsuYGZxaTGrT8iFRHxihnu90eDfdd546+e+OwSmmTWg+4gPyMEtesEViXLyC5jaxhM3koncJL6uLHmwjaTV1WXfg2L5QoyL6cxxXPHg53xb6tjRKIKpt18T5hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3uAFnGjT7sdJ9LxUg5ZTgpu2lBdfCh0rS4krQ+CZFYA=;
 b=gKwf71/+V8VOyTDSj9QkAbhoFOrmE7DwX3dNKniSx4XCW/og2qHMdUfG8G1WqA1X/Bgz+d6BTeFIopQH2qIbAsuPLO+8T9JP6KegvKJQYEVi8IhqjNZqiUy76VOeS9CIVCScItE3xX0bHuQNkYauYSQSOo3tyDRs3i6SYt03zAA=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=oracle.com;
Received: from CH2PR10MB4150.namprd10.prod.outlook.com (2603:10b6:610:ac::13)
 by CH2PR10MB4117.namprd10.prod.outlook.com (2603:10b6:610:ac::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.26; Wed, 10 Mar
 2021 22:47:42 +0000
Received: from CH2PR10MB4150.namprd10.prod.outlook.com
 ([fe80::95df:950e:af4c:a5df]) by CH2PR10MB4150.namprd10.prod.outlook.com
 ([fe80::95df:950e:af4c:a5df%9]) with mapi id 15.20.3912.030; Wed, 10 Mar 2021
 22:47:42 +0000
Content-Type: text/plain; charset=us-ascii
Subject: Re: [PATCH v3 3/4] certs: Add ability to preload revocation certs
From:   Eric Snowberg <eric.snowberg@oracle.com>
In-Reply-To: <305838.1615410490@warthog.procyon.org.uk>
Date:   Wed, 10 Mar 2021 15:47:37 -0700
Cc:     Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
        Randy Dunlap <rdunlap@infradead.org>, keyrings@vger.kernel.org,
        Jarkko Sakkinen <jarkko@kernel.org>,
        =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>,
        linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <AC03D44D-E09E-4C43-8E9F-61EA79AC00F2@oracle.com>
References: <161529606657.163428.3340689182456495390.stgit@warthog.procyon.org.uk>
 <161529604216.163428.4905283330048991183.stgit@warthog.procyon.org.uk>
 <305838.1615410490@warthog.procyon.org.uk>
To:     David Howells <dhowells@redhat.com>
X-Mailer: Apple Mail (2.3273)
X-Originating-IP: [24.52.35.144]
X-ClientProxiedBy: BY5PR17CA0004.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::17) To CH2PR10MB4150.namprd10.prod.outlook.com
 (2603:10b6:610:ac::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.16.177.128] (24.52.35.144) by BY5PR17CA0004.namprd17.prod.outlook.com (2603:10b6:a03:1b8::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17 via Frontend Transport; Wed, 10 Mar 2021 22:47:41 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9612920d-687a-4f7e-d64e-08d8e4168390
X-MS-TrafficTypeDiagnostic: CH2PR10MB4117:
X-Microsoft-Antispam-PRVS: <CH2PR10MB41176D7044A3DEA881AB872587919@CH2PR10MB4117.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2958;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: U+7JKxHNRCijjf+LH1vFrhfYkz0JRGRi8MnwlFRN46a3qzL1CItpqudar3I0eSE+bnvDVa445lRJqTU3UglT+Q5sAChFFMiYqJI/wq3YRIRajn+r5cngrex8a3UyYrq/ek2cNtwPEqzvbNMEdmSeH3VIgxGehC4CM47w91zxPNl3AkMixshWBC11mKCXzsGQmOsaEL9ZzLVhdx3S5bFv4wgk4xCUUH+U70jTkz8vnKjUA/c1ZqMLQplzjdhSNevoNWV9J5wi5yCwNqm2zgfJ5g3JiU04RuqzpI63n1mEZfY8sAfoKQjWLhPEWyQ50gC+eNo/1b0IJXc0HYTr0KOVGAXGBXgz/2Zyob7I1j/G3RuBDsBEscFdDeQzd0ueD3g+cfRUcZkR5ZQknlyx10AieYoAFrx6jARDSmNLMP0D98PGvdQMMDK9quJs+JVU30IIMEkXcYITSY4oIsonD2HMEkr0QUztUHa5312mt/XmV1WLJVbnpN1G1oghGldnXiJlmbmMin+9VOuj19MocDKcVtiuKE46tNjUC4TXNZoR6XMHRRVSe1HO/nSA97XWvEPfXOL6xwwGDQxjD/lj8Ooadw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR10MB4150.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(346002)(376002)(136003)(366004)(39860400002)(54906003)(33656002)(956004)(2616005)(66476007)(66556008)(558084003)(4326008)(6916009)(478600001)(2906002)(316002)(66946007)(36756003)(44832011)(16576012)(8936002)(52116002)(186003)(8676002)(53546011)(6486002)(26005)(6666004)(16526019)(86362001)(5660300002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?vLC6XKYYOJGOs/cPXUn8eODO6YHCRiM80lkx4NIw/+flPQwPUymwZlMFAbap?=
 =?us-ascii?Q?fYR/9XPgkGFuerXgxh/NpN8TV1rYpNyXF7ygLYH4xuV93vUgdc2Zg+YA+yjU?=
 =?us-ascii?Q?YBsBl+f3I34EDusS8HAySVZtVufN56GCu534ji+kInxvYQWYEcESFtjEu9NM?=
 =?us-ascii?Q?RkqoXYI6s/gFlDuU30s8VHmOxOtwouDbXahsUsCRc0loUh3nQqGTE4uvxMk7?=
 =?us-ascii?Q?NK3vkbVELK1bn5MVI1FUfFuoEy8Fv9WAnsCUDWUxox89oe8lF2uLv7wSx52O?=
 =?us-ascii?Q?rc7sAxCO/wAc+NeSbvGvzigoOH/in6/sggcz2nxX8NfRB4jYiwAOFZIJfvj8?=
 =?us-ascii?Q?ZhtpREsHwd5rwxVc1SK21eG5Mbjpk3hb4TsR09iEXxil3fLT8AL7fJGPbnbk?=
 =?us-ascii?Q?/fwsKi+R0MNmafbx4vk4SB93z2LoxyDp6KLptP3AFpA+zBGqAIwrB4cYvo6/?=
 =?us-ascii?Q?VjzLtfgAtNs69mtb1vkkpC6MlpWKIP1BS8Q+hlNsTfUBzOoaEEiCUBOmuiaQ?=
 =?us-ascii?Q?7AKuePx/oh8lj6BIuDwCRgL9X6J2tC0JQngU85N830w65zJwbSPAj3ZwhMgS?=
 =?us-ascii?Q?f1U7D/a3SAIFDsAgng+iKfLEqMnm5opiKBbyIrztwBmMg7kDp33yHfC56JW/?=
 =?us-ascii?Q?sztPiSGwxRCVF08La69PebiSK5qFa1+mhhz/ETObv8EkKUiXaAnd8k/sEC46?=
 =?us-ascii?Q?H1rsj/wpHllymzZfoBv77L4MIHdL4nRSS1CaqbSEWQk2baiZTX5jbVqlLh1q?=
 =?us-ascii?Q?I+w1Ho+ifRtqW7BGMHlN4ILuqqhNTc5f7GY/K3GgzmYCR3abL9hDn26pp53r?=
 =?us-ascii?Q?ayBESZTJTYH2WMFCUJJfBN92njV7JuCu1Aq7v8+VtD0N4S9LDvs6/YqWOPdV?=
 =?us-ascii?Q?gTkfSp9G44vHik6eG414+b/c4OJMYZ1JbucnSlF57yEQZIzL2fjxRHOx4DXP?=
 =?us-ascii?Q?Vsr6WNvhbZBlTlPEq/VJ7TR0yGy4mfVPkRUoCWA8D1LhM/3ueXdYQZ/90X2Q?=
 =?us-ascii?Q?bmgWmSfW7I3DuNISQpgx7ADo9+oKiykOw4LKh8SChb6LXKsdRiAJElP7/4zI?=
 =?us-ascii?Q?/oZbKgmbrrsFDzNlBsIDy7XbQQJn+k8jGWOz3Gndpq0p4UKhxmKWb7xSN/sV?=
 =?us-ascii?Q?Wffv9JXDQ91m7uNZd2RKyPrYGWzEp0JgGuotTEVZWcYAMvlAsDrFJr67osmt?=
 =?us-ascii?Q?AtgA61WDrlGYMoecz8qSjeF3qJFUhdGOPRAh01lMprx4tqoIugHP4ZCQyPVr?=
 =?us-ascii?Q?HYunDYOu6BTg/OFVEcX3K3/OX20XsgTcELKbq68vxTCZQm/arDAJXRWDDtF9?=
 =?us-ascii?Q?61p4zxZeox925CCrsPbW68qh?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9612920d-687a-4f7e-d64e-08d8e4168390
X-MS-Exchange-CrossTenant-AuthSource: CH2PR10MB4150.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2021 22:47:42.1671
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f2Elobx80WZGZrH/VgKOtyLT2QVNgX94YEgHxOgtGRyL4mL43IUb/AfUrTidJ+Z8rl8KrhoJyr6NbMnnTkWp9F8O5fOhb4PynxSvBI3xW4k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR10MB4117
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9919 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 suspectscore=0 adultscore=0
 phishscore=0 malwarescore=0 mlxscore=0 bulkscore=0 mlxlogscore=944
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103100110
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9919 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 lowpriorityscore=0
 impostorscore=0 mlxlogscore=999 malwarescore=0 suspectscore=0 adultscore=0
 phishscore=0 spamscore=0 priorityscore=1501 bulkscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103100110
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org


> On Mar 10, 2021, at 2:08 PM, David Howells <dhowells@redhat.com> wrote:
> 
> Can you check this patch?  I rolled your changes into it.

Looks good to me, thanks.


