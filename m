Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 121A0351047
	for <lists+keyrings@lfdr.de>; Thu,  1 Apr 2021 09:43:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233195AbhDAHnR (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 1 Apr 2021 03:43:17 -0400
Received: from de-smtp-delivery-102.mimecast.com ([194.104.109.102]:56037 "EHLO
        de-smtp-delivery-102.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233479AbhDAHnG (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 1 Apr 2021 03:43:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
        t=1617262985;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=GXrJPW/AsDZnRC/FvT/skpSDRbx0PEK0dPmIEIL0PFQ=;
        b=m87dDY5XEm7HvJ89QfH51IQMsMq8lHddfAD8CQ+2mnyWxYblgbmOXoiigglyugb8YQSjPo
        975Kj5rIEs9qd3IKPsyZl0OMu236AJPLmO1K63xfCk2MtLyVADtmplhNq6Y2+i2WwG4gmg
        iNxt9eeTB86NI89y78mBmQjizDLgpT0=
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2055.outbound.protection.outlook.com [104.47.8.55]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-1-et6HvwPoOLOC4CgGRHm_Xg-1;
 Thu, 01 Apr 2021 09:43:04 +0200
X-MC-Unique: et6HvwPoOLOC4CgGRHm_Xg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dWUizPBnejDsekB9jT+cvIwuHLwg9qstkkbE1EGmePmmcRpPctvVRTzm4azOYOyMDdYJqwbiSqiNCHz0VUBH1loe+m1AUWDlmBSl3CWAR3t2URc1gKC/PdpPrHXQtJXykTgtxZ6GeONaQdsYJs4qoR/MSnpitRt4NOExRlfnAvooxUi3uv1eYdhJtxjlZbHJ6iUD9DnGyPTl4nvFgo1IWUb8XoCh1cV04HxvrVFhyhmbNLXO/ZvwdOYeVAjH598XQrwDIemyHVISjroAe+UjxSxJiSlsh4jbsx927KDH1H45+ctL+JTkn3OkWUIvKuJeAlE/7qw+UvydBBpOtmDAVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fTsWLJbSZPHlgCAb8YOYsd2AB471hmJt1thIr2On7KU=;
 b=a3L9CGM+Xi7WyF16q6HObGm2EL4xlbc0zkHdJbeJD4XsUIuZnT+8CmexofX3nQlp+j2+oUYrb67UvoiLhIn2fD4bUthN+TRs7vK6Yf/iYnqTTWaAvbJyXgxuKmDP4W9xTlB21dnF/+uYpZ7gqnVD0+AOYPjFAB97AMWjqOFR8HMjQ9nBcFa/6REITQSTNFxY76AMD2esYnHZ727Jq22VLi2oepu7uOofYKfjSinwNZMm9imgSp50fg8yZ1N6vMsTV0Z9HkYGjR+vlYdz60bOG7vHHveOwJ1aHrxhbwXSa7xIzs9eP8icSG8KzV9ArU43sLbnJRZrNrpfq6GAbaQ3eA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=suse.com;
Received: from AM0PR04MB5650.eurprd04.prod.outlook.com (2603:10a6:208:128::18)
 by AM8PR04MB7348.eurprd04.prod.outlook.com (2603:10a6:20b:1db::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.28; Thu, 1 Apr
 2021 07:43:03 +0000
Received: from AM0PR04MB5650.eurprd04.prod.outlook.com
 ([fe80::40bd:b7d7:74a7:5679]) by AM0PR04MB5650.eurprd04.prod.outlook.com
 ([fe80::40bd:b7d7:74a7:5679%3]) with mapi id 15.20.3977.033; Thu, 1 Apr 2021
 07:43:02 +0000
To:     Herbert Xu <herbert@gondor.apana.org.au>
CC:     linux-crypto@vger.kernel.org, David Howells <dhowells@redhat.com>,
        "David S. Miller" <davem@davemloft.net>,
        Vitaly Chikunov <vt@altlinux.org>,
        Tianjia Zhang <tianjia.zhang@linux.alibaba.com>,
        "open list:ASYMMETRIC KEYS" <keyrings@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20210330202829.4825-1-varad.gautam@suse.com>
 <20210330202829.4825-2-varad.gautam@suse.com>
 <20210401010947.GA4349@gondor.apana.org.au>
From:   Varad Gautam <varad.gautam@suse.com>
Subject: Re: [PATCH 01/18] X.509: Parse RSASSA-PSS style certificates
Message-ID: <221f1366-3ce4-688b-727f-4d35ce1c135d@suse.com>
Date:   Thu, 1 Apr 2021 09:43:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <20210401010947.GA4349@gondor.apana.org.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [95.90.93.216]
X-ClientProxiedBy: AM0PR04CA0116.eurprd04.prod.outlook.com
 (2603:10a6:208:55::21) To AM0PR04MB5650.eurprd04.prod.outlook.com
 (2603:10a6:208:128::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.77.50] (95.90.93.216) by AM0PR04CA0116.eurprd04.prod.outlook.com (2603:10a6:208:55::21) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.26 via Frontend Transport; Thu, 1 Apr 2021 07:43:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3400eec9-410b-41f8-2fb1-08d8f4e1c7a8
X-MS-TrafficTypeDiagnostic: AM8PR04MB7348:
X-Microsoft-Antispam-PRVS: <AM8PR04MB7348D6DEFC286D09214D53EDE07B9@AM8PR04MB7348.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CmncA6rCuoahuRzqVhblh065IzQG0MYS6glNNtHhnz84mt1c7GStjcJej42Wgz660XJpV+5Svv03DPY6DOdM8vcmZtgkM5xPhbZeFdjaXnCMXbA15OiVYlEVy3p6BNQJ8zg4F3mqPOdm8OhxYquyQ/upYYgpgQYo6bDp0rvXgZ8RU44krQMd1V4w87iqQ+JzMCuJkE9LAuTaMFbL89wOE3lkIAgS0fXP7v2B7bsFxKTWam+I5YNOqSHLjn52ATw3nzY15X54Fu/1XPk7BuAbsUmuIe3rLDs3LeFdJts2OfmCAcLoHSlmNL7TKjfDzTHb0VG5FK2x6IVCWV5Z1vODZOTMKkAVQMq4yA5eaNX0K135rQ45ZQcIcgnoT+GwB7VEaUAB+SF1AsdgP648ld/G1SeKL8efj577gHsXm+gIjqpi97oG7gQ9yv5NmWtk5l4fNtEx7exuGYVIIBedwxN+Mk0qepgNnCYIsYdDYuylQj1WuYgYp8IqeXM+SEeP/dOootJHWCIhfVvOZVhcXTDexQva0JDZaQTnNVD5U8M4evppqcBJ+CUz4vjcaz69qf/8RLUAvEYoxwmGMvbMFAtwzYYOJCi+VLlqLXiuGMNfMMvPy8VqyfUZunRKj0KpVlWelH/JW0c2D1IbHOzltJ0fHxpawBZYFM614F/R+q4xUdWuXJZOFyaUQ4yYeqPvzsGmeeHWZPj9mbrZkTifN8EWSZk5+cF5ULBQ9rZzAj1CBHZR3/iWleefol5AJu4HdgEnV/XHJlxg4EgRsV/ZPwZlZsLTNG4vqw7OSyzIV2IcFHcCnUVxSLqE6VFcmq1TmO9q
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5650.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(39850400004)(136003)(346002)(376002)(396003)(366004)(4744005)(38100700001)(2906002)(2616005)(4326008)(83380400001)(31686004)(316002)(53546011)(966005)(66556008)(26005)(8936002)(6916009)(6486002)(16576012)(66946007)(52116002)(86362001)(66476007)(36756003)(54906003)(478600001)(31696002)(186003)(956004)(44832011)(16526019)(5660300002)(8676002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?rHolk60XS5nQvlaYwWNzxrmWdOSHy9eZVWWO6Ibr/GoR56fS4Kr3yvutAeNw?=
 =?us-ascii?Q?LTDw6fYfYxOJPNk38cMfPrJwXDoe/QV2UjQzsSw5I6My7bd1Ejspjj79lg9O?=
 =?us-ascii?Q?9eTlg1fOxUTPiAYBzK+nQ+0oEu0AOikWG9TjAJTm8QbWy2b2DXsV3wPxl1PS?=
 =?us-ascii?Q?tZmedrRWmwMJutyfdgB9BkiaK226jHgBDrpzTPjjdIiccmKcI5QSdtGF/+6W?=
 =?us-ascii?Q?T/oyK8BrB2XdrmWtXRngwwpZpcAfZL9W3KxBNcLPS+NZptPXZV2c6GsKEwql?=
 =?us-ascii?Q?zRHpaw4y61DICpj/dFcKoBQmIy3hoDn4VM99rxneFY6TAs8HN13kdx3ClPPQ?=
 =?us-ascii?Q?LtXpOGX8ZG/7uviR8uwjZUsSghC334kebUBIR8KjOX/J08yenU6x9NpVpcRO?=
 =?us-ascii?Q?S82OdnXQKCjsBoPUnzPU6Q5BUwxXIzuOV3Aksb+KHjoYyfFZVKrANggvFeY4?=
 =?us-ascii?Q?NLJTNFeTggvum2ORjBrLmHd9jc+55liu4XjZuDHOMGBo5fTU4qYXyWFnOKxp?=
 =?us-ascii?Q?2BqfBliujzWXWLbdYwqsf3f0rhX6ikQq3RYElWIY2K/zbdVM3an468rvHFc6?=
 =?us-ascii?Q?Suv6ZeJnnrUZJNTarz2DFpEdavz/GnrxBZFFqlPRDQSwweVMw5Pw71Y6DDof?=
 =?us-ascii?Q?Lgk+hnP4rp1JtYUEA0B90Pq5Uy7wnf0VzoUFWOiZ+IF3pEFQh2gl6rJ8S7rd?=
 =?us-ascii?Q?6KXv+cLqGVTisZZcw9SJOyHhDUIH0/yOyO1PLGk+M4o0MeklIvxfk4f+UWRS?=
 =?us-ascii?Q?bBtRUkF2QH5gMTo08qEtiXWITgIZDjY+WdYOcSSmeKe8X9PfeWOCWOXfcjSv?=
 =?us-ascii?Q?VY6mXaSD/wOACi2lJGRHIlKjElTYKw/bO3rx/awxb2KmP704gSf3kBJkevln?=
 =?us-ascii?Q?N110LCrwxHnEw4DojihFyRZ7vR1735R6AYWqRVfUPjVlDpKYoeU+vbfI7oHp?=
 =?us-ascii?Q?TrtjAAca2GUhElfbNxkDuM87l5GGm0U7bz22ok74cOjx9J4Op+piH2IH2oIZ?=
 =?us-ascii?Q?nhI6wT1fIYKTO3mEyuENMXTa7Lr1shrs2gZKcP0oMry30rsS6RoOVLWf7oaE?=
 =?us-ascii?Q?2u3hf6F3rsrnPLuI/6LpeXIAo03jSOReuBPy4wuBnBOpfItfqXVP5iu9wam+?=
 =?us-ascii?Q?X1hklW666hpHSfCJxL17FRkG2PRUMdrC6L4+ZzzKduo7d74IoRl5v9YYyTsD?=
 =?us-ascii?Q?KTNrh/i5WhwSnuY4K9cOhhcGWAHYAKfhtcUNM5SdCnAd1fcOGER1VpwT4Pg0?=
 =?us-ascii?Q?K5keIvnVb1ggMxuoHwWfw/l7sXAWemlUntUwI7PSqwa1EL8s4eT7d1si3ki7?=
 =?us-ascii?Q?7TLTabkOnV1GIQeroYcv+VhH?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3400eec9-410b-41f8-2fb1-08d8f4e1c7a8
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5650.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2021 07:43:02.8711
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7RgGooImTjO8HQ8cI6UxHH1cPs2z4qxXvTAVtR1onbBy6d+hTNMm8/GgTVz5hVygvSZeNAsGdJ2zOXpR8/uz/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7348
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On 4/1/21 3:09 AM, Herbert Xu wrote:
> On Tue, Mar 30, 2021 at 10:28:12PM +0200, Varad Gautam wrote:
>> An X.509 wrapper for a RSASSA-PSS signature contains additional
>> signature parameters over the PKCSv.15 encoding scheme. Extend the
>> x509 parser to allow parsing RSASSA-PSS encoded certificates, with
>> the defaults taken from RFC8017.
>=20
> Where is the cover letter for this series?
>=20

I realized the cover letter initially only went to linux-crypto@.
I've resent it to the missing destinations with the original Message-ID
to plug it back into the series [1].

[1] https://lore.kernel.org/lkml/20210330202829.4825-1-varad.gautam@suse.co=
m/

Thanks,
Varad

> Thanks,
>=20

--=20
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5
90409 N=C3=BCrnberg
Germany

HRB 36809, AG N=C3=BCrnberg
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer

