Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 30CD436580A
	for <lists+keyrings@lfdr.de>; Tue, 20 Apr 2021 13:49:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232465AbhDTLr7 (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 20 Apr 2021 07:47:59 -0400
Received: from de-smtp-delivery-102.mimecast.com ([62.140.7.102]:42107 "EHLO
        de-smtp-delivery-102.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232164AbhDTLrX (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Tue, 20 Apr 2021 07:47:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
        t=1618919211;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Mm0/lIKcQ1S5jU58QH3aLMrnNUYlWJeE7OvgWheH/Ts=;
        b=agWJJXkGacQISxZRo+PIv22Ck4mUGs3N0SAncLkF4Up1xyaDfY9ehloSdZT+iTWQNAwsq6
        PtCw5JAls/OUryLiweD87fi+sI8r6IEMhkXUjlkUwLV32yCi5rKHBTDGLtG+DNSahy8mce
        EqOECXLcoUTanExgkUpgxUijKLyDSt0=
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2111.outbound.protection.outlook.com [104.47.17.111])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-28-a2cke583PJiKrIxQcdFxGQ-1; Tue, 20 Apr 2021 13:46:49 +0200
X-MC-Unique: a2cke583PJiKrIxQcdFxGQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aUwA2M287NHc2uMNmEPZMBmuK/QQCRJ6Dwd2fQbOveGtq57ckl7GbFVeqmmMalSQeXlRrQfE22hL8nP+gOq794nBbrf/hp3MdkC7aLmQrcZaSqnOlF272FlJNBQZtuoPiGUBtBXzwcTocUPYazwkZ1CsA5rrn6lJekXVLaNPlbAIpfdkX9HHD3bEOC3oXzYbaqJUy3CqX8SEkvGApaowfYiE4b5fQ9Rmvw0GWmuCioVLtR4DQBgGRrGzOya0U2dZr/6fDgAuJGPBfH0dIrm83oDc5L4SrAlkiIGF0HWTN7xtg6gaEIbj5/LshCUvGdJo5nwLNn+txXUh66zcqDsuAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QYPg6NNKVBlfib8lQxDhAQ/uIaOBLSCAB1tK1dJ8hEc=;
 b=BF56ymmq+vcsvnbm8cC4gO+X8oBMhRo2Z3fRLwHownodT8Gyd25FhvxNLppTeDTOQna7Y7D8Re0YfJPi8jWJi0uHD1WiFjA3MK7rGXWFXDLkZHFM7OEnK+ayk37yVtqfw1D2p9KTGlOClNkaxHI8ec3EqCap0nhAR+d6AOYDyomCcVAjNsRablO6163VYk0DTaycQ1NGH8Ts60J5EIVLvwfCUQH6Q69kaaTs3O1b9d6k0E/IeyZYlA8ODlUF1VDtjADWzZJ7ADM6PJt5h0rRTac+Jh4a33rdLUchklO1EodDw+Nlv1IwDogiAZQKS5gDOcFsh8Mnyn3CTGqoZwaOlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=suse.com;
Received: from AM0PR04MB5650.eurprd04.prod.outlook.com (2603:10a6:208:128::18)
 by AM0PR04MB4995.eurprd04.prod.outlook.com (2603:10a6:208:c4::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.19; Tue, 20 Apr
 2021 11:46:46 +0000
Received: from AM0PR04MB5650.eurprd04.prod.outlook.com
 ([fe80::756a:86b8:8283:733d]) by AM0PR04MB5650.eurprd04.prod.outlook.com
 ([fe80::756a:86b8:8283:733d%6]) with mapi id 15.20.4042.024; Tue, 20 Apr 2021
 11:46:46 +0000
To:     Ben Boeckel <me@benboeckel.net>
CC:     linux-crypto@vger.kernel.org, dhowells@redhat.com,
        herbert@gondor.apana.org.au, davem@davemloft.net, vt@altlinux.org,
        tianjia.zhang@linux.alibaba.com, keyrings@vger.kernel.org,
        linux-kernel@vger.kernel.org, jarkko@kernel.org,
        James Morris <jmorris@namei.org>,
        "Serge E. Hallyn" <serge@hallyn.com>,
        "open list:SECURITY SUBSYSTEM" 
        <linux-security-module@vger.kernel.org>
References: <20210408141516.11369-1-varad.gautam@suse.com>
 <20210408141516.11369-19-varad.gautam@suse.com> <YHBhlNsMTrOq0POE@erythro>
From:   Varad Gautam <varad.gautam@suse.com>
Subject: Re: [PATCH v2 18/18] keyctl_pkey: Add pkey parameters slen and
 mgfhash for PSS
Message-ID: <3cb6b04c-3a17-44e0-2609-30ccbfc4d1dd@suse.com>
Date:   Tue, 20 Apr 2021 13:46:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <YHBhlNsMTrOq0POE@erythro>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [95.90.93.216]
X-ClientProxiedBy: AM0PR04CA0111.eurprd04.prod.outlook.com
 (2603:10a6:208:55::16) To AM0PR04MB5650.eurprd04.prod.outlook.com
 (2603:10a6:208:128::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.77.179] (95.90.93.216) by AM0PR04CA0111.eurprd04.prod.outlook.com (2603:10a6:208:55::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.20 via Frontend Transport; Tue, 20 Apr 2021 11:46:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 374bafe8-8da5-4d25-abd9-08d903f1f9c1
X-MS-TrafficTypeDiagnostic: AM0PR04MB4995:
X-Microsoft-Antispam-PRVS: <AM0PR04MB49953EB1C86E29F14A81710CE0489@AM0PR04MB4995.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /bsR9NENyBWFnbic/plDt3Hc8Z7MLQL6fqBkBEkli+MDfsTGlAAbur4/LMqeXSOu/4m+PIvHU3wu8J66h0xRkI3lw+ZB355nAwPn5+rF//l4LnJO2dclJw9CstfRrBBv9owGm3hQKDEUXiXNfvRrbRdJLSXGjZ9FErnXHDbrU8bKrfa2QJwwXAgx1GMjpuLgSyf4ElPn7cwUuA6kLyFZtNHsLeJdsLXQk1qsolFnCHGti93dZsN4WHo4oLEhJgGcltRtEmeDOOeEliHIMOD3MTJaY5F2vytZwxKVfmPVsxdMDcOZJPx+IoBvrWmQBLt5F6N67wqksJHIWYnEVW8ZCru8gOZVwK9+TNO4pSKuPGSD95PQX/MOiBGiHJWMqBgKuN4DIIg5dO9p8TqiNJWElvT4bvOdTyO9YEaSQyvv1tn+uIwZMKxltdq4+6h4r7JMn0PGWQYO/fNhO3otWu4ijBlO78rwtV0Zl8X6R2zfKBqDfucgRE4TTdk/FWOd4gB/QjfBcFiNMman7xCoiCbHVd5pHa1pLXElKHHTrT1b2jF34RX743LaEHSxaMKqmBW+xiCLYtJ6BL2vmre5AEHua3McR+yCmw1obSHHbf8FXv5uN9eQSnRCuMANLs8EbfI+vMszaaxG0+tg2kQiO76dbFXpgv6yJb0BuZ9InkswhhwBdU2aFEA5eKfIAEk+ZTUoe+zOKWPoFNX/0p4sOm6HRQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5650.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(346002)(376002)(39850400004)(366004)(136003)(316002)(16576012)(8936002)(31686004)(83380400001)(6486002)(52116002)(26005)(956004)(54906003)(53546011)(8676002)(16526019)(2616005)(7416002)(6916009)(478600001)(44832011)(66574015)(4326008)(38100700002)(186003)(2906002)(66556008)(86362001)(66476007)(38350700002)(5660300002)(66946007)(36756003)(31696002)(4744005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?aKLCX+1c3B4FCl8ARaSmD5zbgNR8ual7uRv4SA9C9+GWdjBSV09hrN/l1cBU?=
 =?us-ascii?Q?7z2oLpD+wDdqRz4u6eEbiWaqt6g6zAX1T4oztAiQcZnNfiO7fJs1Z1wtccAs?=
 =?us-ascii?Q?ROKt4cNvLfRBHgLVolZqOGYIsnV4BB1Tz9f6G9KJW5z4AVdfaPpJ/OgFlsPV?=
 =?us-ascii?Q?mudo0/lT0dvG8uGVSU37F/8cvYK8cXdzz4JIux3FDTRERcZfXfUAkc8unXhU?=
 =?us-ascii?Q?BximXwdUn9QJvFCBUCbi7+J1CGeHOXxYavKe56Zh2nLLETKumAngyQOQC25G?=
 =?us-ascii?Q?fH3E8Gr4S7yiPDch+xJdM7jrcg3DNmQnFVJ9ZbXsB3O8167QeY95caY5gqv+?=
 =?us-ascii?Q?/62psZEeInk1wDCUwIIFeu5JAm9j4/ev0C0wTAQ4EJ11judHxqZkNvZjnTm+?=
 =?us-ascii?Q?cZEprtOv/+qFSEeFbinQMYC6NlCLc44jbRzMrhcrZheefJB/UIulPue9pq/K?=
 =?us-ascii?Q?X+VjgSOiallwa1rV9GYX3R7P2nc3Ygt/xgPNtDxV8iFxLJnSy0hEoIfWWUu/?=
 =?us-ascii?Q?PfpaoR4m9/B+iyEyQ8/LctQyaX393sL+oN0YeeiFInBjeTD0Ad5sQpq3bJAz?=
 =?us-ascii?Q?khQUCcBtLgTdzQVfdLOciE3eijEll/UzGMr0Tb/8X8TRF2TwsKJ3QxaiFruk?=
 =?us-ascii?Q?UyCw6Kz8XNr7ZWWeL0xY+Sg9rdrWGJ/j0pqSmU45eJx6avfPVpiXGu0/Bun5?=
 =?us-ascii?Q?nIhZaw8VRF7tDsofHDasV8dtr6WDrb4Av8pKC+hsE0K9skdKumLbQ37LP991?=
 =?us-ascii?Q?uSSMFvQB/XDzYS3nMafhJm5RUWhYp6zOX+/vcGG9+zDPRa1sRjEvLXwKYMKn?=
 =?us-ascii?Q?yBI6QrKB2rQnZubhoAXWReyneTPavrJ6Zhi/y18sp1R5cmIz+HxDKT+wPV9K?=
 =?us-ascii?Q?7Gl7NcdystYCWud7PclN8KU2lw6bOAwjWOi2jF8OSXmqpNIBidlbFv2e2fIO?=
 =?us-ascii?Q?WnOR2ZiYrFKYRmlIcX5So6rl2bdyIu98tF07li+7Cg26isddijwK2yEJl0DZ?=
 =?us-ascii?Q?fTMja3FGQFUC7ezCnZWXo47Yu+YmDV40Z+ZGzJKZv71fm+JlP21xqIHA90t+?=
 =?us-ascii?Q?pwoXAbvd+HXnrvsn1ksPkUBXksHignCmtuXKgqDsxMS7ITMSgMpW+jnu/cbR?=
 =?us-ascii?Q?eXUAZboYITjyYBr0U4gr0/l6qPTDFFI2d7ZAV245zLCTUgmsYMw1iNSpg0Fv?=
 =?us-ascii?Q?nIJNMFseHQFMirFPVuS8rLzGr1cBkzAKmDxEeCFy2Pe4kYZswnMW1/DJKzwN?=
 =?us-ascii?Q?kjEIVvKmAFj1ESCLAqs9jcgdOZoJK30YIizQyN6w1khzYeCuUVzEdTzTDsp0?=
 =?us-ascii?Q?NmPWHmSKi3NYcxEOZnAgj6W0?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 374bafe8-8da5-4d25-abd9-08d903f1f9c1
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5650.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2021 11:46:46.5554
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3VMsX91coGt5/7wUR9mydN+QB7Pow2AolyxXZKxPAtc+6r0+bojoDP6D785IxXGeqpiQ/3RiTDO9smbVsX6Hjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4995
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On 4/9/21 4:15 PM, Ben Boeckel wrote:
> On Thu, Apr 08, 2021 at 16:15:16 +0200, Varad Gautam wrote:
>> keyctl pkey_* operations accept enc and hash parameters at present.
>> RSASSA-PSS signatures also require passing in the signature salt
>> length and the mgf hash function.
>>
>> Add parameters:
>> - 'slen' to feed in salt length of a PSS signature.
>> - 'mgfhash' to feed in the hash function used for MGF.
>=20
> Could `Documentation/security/keys/core.rst` be updated to mention these
> new parameters? Statements on what values are allowed would be
> appreciated as well (e.g., that `saltlen` (a far better name IMO) is
> unsigned 32-bits and where valid algorithm names could be found as
> well).
>=20

Thanks, I've added these to v3.

> Thanks,
>=20
> --Ben
>=20

--=20
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5
90409 N=C3=BCrnberg
Germany

HRB 36809, AG N=C3=BCrnberg
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer

