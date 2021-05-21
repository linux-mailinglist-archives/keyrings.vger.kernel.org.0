Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7BF6938C3C4
	for <lists+keyrings@lfdr.de>; Fri, 21 May 2021 11:48:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234934AbhEUJtb (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Fri, 21 May 2021 05:49:31 -0400
Received: from de-smtp-delivery-102.mimecast.com ([194.104.111.102]:23499 "EHLO
        de-smtp-delivery-102.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234242AbhEUJtW (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Fri, 21 May 2021 05:49:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
        t=1621590476;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=8ZyAxvMFgWs6EJXFu+Zq2hdJYtyXyWr1IaGuLgafRf4=;
        b=hhJWB03Xm+BJFe7HUG22zVdO7PfI8gejGE9DTFkKFKrE7491Q30xjbW+Qa1cFeuFpEO8Sn
        7xOtlZgfntI9wHXcsPiXWSGcVMWxvRe3iFu0qYdftAKrZjCDzmi1nZSM0jVZ965SQTiKGE
        zJq2zBRV3AyRX6LtVFkXh0j/rwHLl48=
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03lp2054.outbound.protection.outlook.com [104.47.10.54]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-12-zSrJDQncOuqKnFmUIYRwjg-1; Fri, 21 May 2021 11:47:54 +0200
X-MC-Unique: zSrJDQncOuqKnFmUIYRwjg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sy5VhtnJuwaNg+putE9gK+hxgWcjM1KuCLDBMC3VWvEP/d5Sqw74CNVesRVrz3h9g0oLcDmN+ZyAJY3DX4ozNvmjKow+IwYfltOscqFGNNVR/mNJ+kJhQTHLjbyeeXq3euznR4HFEcvY6jojBY5R4slc1UXRLWJbVQcX+nr9+UMjrIu9NHDIdL7JkXgGfp1ZPWzFiCA3+sKLSeF5iyjYiRVazsbIB8L+zvZsZFl57AvWz0pG/MnlXAHhSIFRb2ffshsOe38c+T6r/GKfIg9DHZRRYuQJXRGRufkqVf8DJ/Sp00dwtHG0u5v9CxQA+qN2vluCXbEUjMddac1hilpOoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8ZyAxvMFgWs6EJXFu+Zq2hdJYtyXyWr1IaGuLgafRf4=;
 b=ItYWE2iiW2A3vBerjZkBnakxz/Hkl3q/TP743nkNdQwJL7xjEXj7Tvl+asgGxBayo03tszKYpgujHRXwUFo3LZV7fkGFzLEnIJ6R7GpQXUKZHocDhW3BLYQX3TDj6ieQdn777pDDpgRM+LfhJQh/Bdx/hJ0h4j/hD9oZddxKmRs1dKKiiPplPINUl6nLPRUuDtmrDL/sjdz4DyysBTbCuCJy9ILzSaFXfPCmChZCnWNFQlvx2Lihr7Zt0uO0jT0p9dJUFp6DHIC4scd1sMKJM0HXnHJbkHKUN4uDHjIkqbopy9k/+FHcF6/zWQcx8kswQweHn0kgucYYEWFRccDxzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=suse.com;
Received: from VI1PR04MB7102.eurprd04.prod.outlook.com (2603:10a6:800:124::12)
 by VI1PR0402MB3871.eurprd04.prod.outlook.com (2603:10a6:803:16::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.23; Fri, 21 May
 2021 09:47:52 +0000
Received: from VI1PR04MB7102.eurprd04.prod.outlook.com
 ([fe80::e0f8:e927:79f:232a]) by VI1PR04MB7102.eurprd04.prod.outlook.com
 ([fe80::e0f8:e927:79f:232a%3]) with mapi id 15.20.4129.033; Fri, 21 May 2021
 09:47:52 +0000
Date:   Fri, 21 May 2021 17:47:36 +0800
From:   joeyli <jlee@suse.com>
To:     Varad Gautam <varad.gautam@suse.com>
Cc:     "Lee, Chun-Yi" <joeyli.kernel@gmail.com>,
        David Howells <dhowells@redhat.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S . Miller" <davem@davemloft.net>,
        Ben Boeckel <me@benboeckel.net>,
        Randy Dunlap <rdunlap@infradead.org>,
        Malte Gell <malte.gell@gmx.de>, keyrings@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] PKCS#7: Check codeSigning EKU for kernel module and
 kexec pe verification
Message-ID: <20210521094736.GP32436@linux-l9pv.suse>
References: <20210409024656.8083-1-jlee@suse.com>
 <20210409024656.8083-3-jlee@suse.com>
 <27e7e83b-5754-956c-c314-9d4d0ae605b0@suse.com>
 <20210420062228.GA19927@linux-l9pv.suse>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210420062228.GA19927@linux-l9pv.suse>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Originating-IP: [124.11.22.254]
X-ClientProxiedBy: HKAPR03CA0028.apcprd03.prod.outlook.com
 (2603:1096:203:c9::15) To VI1PR04MB7102.eurprd04.prod.outlook.com
 (2603:10a6:800:124::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from linux-l9pv.suse (124.11.22.254) by HKAPR03CA0028.apcprd03.prod.outlook.com (2603:1096:203:c9::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.12 via Frontend Transport; Fri, 21 May 2021 09:47:48 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 14b127c6-a6fe-460b-7cfd-08d91c3d807a
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3871:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0402MB3871258852981529065B0A80A3299@VI1PR0402MB3871.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: t/zh6OxJRntjCHBDmpkp2kceC4yYx+C3gYZDqrP7Gr0o+s15RWMdRA10JIIQXpg4i54Atzpn9i2VsdZ7OeyhpT7cf+9YaNmqHQCIADGdBuunWNfDpb5rz/AlHuU9+lnV4/PviKxLVvLocd8dfFOFp55tBsfUDrGr6nN8u1P3NcyW304wpfguH8RN2fv65u5Uw4zHbAp5CLnpxS2JPmC8gIfyB6YZQgj5sDg2+U0WhNdNPn30UTNOznD+kToLvyoUhzRhUeWQpNfoMrXM4KW3oHtpKFo9FOA6yRG8SGvyxFn0qE4Rv/EeFcZd/Pv8VHlKaSIcat5hlJSaPEeGINqyob1V5mK/XXaSCHtz9ozdp9pxSI/y4vJI0OOXDyOZKICn1Oj31anTtA1wlR9v4zoyD9838/2QU+FSXkZCVz/jXFATTC/ViepElfZwJdadTIL9j0K98m0G2DO8/RxEiIkG2Re580i5y3G5UOg8zAWaYF3+NEoo9lhkLaodh8vE9NEgnigRkpTyuvEeCIGJqc3bwcxZtE1i46Jk802nQV8j0PeI9er8nz3tK5/bKOUENwgsQXRYPX6UzKJsXR7AgIwKAgD/TJZIbHtK6w4TCZ9eRYNrLCikOABmhFR5vk/Zu/JOxnrmQI4lEu40qc1T9aTahgu1JrgIruRX1aJ8cHxXNV0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB7102.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(366004)(136003)(39860400002)(376002)(346002)(6506007)(53546011)(83380400001)(7696005)(15650500001)(956004)(2906002)(86362001)(52116002)(33656002)(6666004)(7416002)(26005)(8886007)(6636002)(478600001)(55016002)(38350700002)(5660300002)(38100700002)(8936002)(36756003)(66556008)(16526019)(6862004)(316002)(186003)(54906003)(4326008)(9686003)(1076003)(66476007)(66946007)(8676002)(43062005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?w4swQ1Ca6LpYT8Re79Q4YCgWmbs1+ewe0+IxQiYsQXq5jKqmimrkjf4jrIZL?=
 =?us-ascii?Q?0B8JKTCwG4EPqebmA4znPOxt40M9a+he7FHl2zIDOCf/koNpqASqsLZsPpG0?=
 =?us-ascii?Q?T7a6Nq9muUcmocc5Nnk9VDmPvobgNoyEwWxg8o917OjSqbUnZyzMDabNpr+B?=
 =?us-ascii?Q?fbyQuBK78a8zBu8Fw7g39QH82pjxaIK0qb0ij3dM6WDOPTaxEe2NiO6Ut2OQ?=
 =?us-ascii?Q?FEj3y1yInIOpaG/2y0trmbjsITs7E55giRw3RwNSdreAutZsqkjn/vkgIO7n?=
 =?us-ascii?Q?sJjnAF6JeJJjfHfQvPoivM+OMZfjgOO4sheaA8XEfwyhZBA8+k5Ap+BTJLM8?=
 =?us-ascii?Q?FUQ86Er5oj3AXqVcPn8UgzeaZRXtDJtx9GeFx+xrgvsDlgRMgUjD6d9evtIQ?=
 =?us-ascii?Q?RLwCa1EtCocEZbFPfSNgLoCAsZgckuJB9UBpiMD1m1CnFF0ly8EUPIPOgAid?=
 =?us-ascii?Q?doAB9rQBREN2xTRBIYsu+klu831x6j1xKSpK0pWXZy0nvW1954G2Hy1nZFoM?=
 =?us-ascii?Q?28bfjk5mct87fqQZHe/ZW4glvWd50468SfVNHDp5OADhl4+zTCErCKLzNnUp?=
 =?us-ascii?Q?xOI3BoII2d3oLy2N9K95roPYACfIKjQYCHc6r5UfGn//C3vFwIcHKWS0Wqy6?=
 =?us-ascii?Q?SlEfih/JnHzRJ/yItAgeSsT8b4V7SdB5vw7RCvWwQaDwuKSzE/xWynI4ZGDp?=
 =?us-ascii?Q?SAoUWkknXzv46hF6uOl80fIhIAoviSqPzyYercT2IK3KnFnrvAsp2Cp3SVmZ?=
 =?us-ascii?Q?CCkY+v8xQUFTWih7Rot7U+kEygSGxikdcyicSDINuznOdK5kAVf0ozpeAINA?=
 =?us-ascii?Q?9mh9Nba/fvouDzyRSG7WHTSd7wunl5+7jYpVqltOV28FIL9B6XeI/uzn2rmN?=
 =?us-ascii?Q?d7j9DeVxAi6wS/umW10CdK2pIqHwUgRzSvdQwia4suTuJRt0zpdeXMBCIbKt?=
 =?us-ascii?Q?XC7k8tGkmEbytXfuBXS4zGnS1DHQVeHiUO/oViojw3qqhbWgt8wRaom89adU?=
 =?us-ascii?Q?ervzenVDUQwBOMIHNYniig2xJTvJnFzIyLAJIpuK1EfXcROt+Qew44VTWwDE?=
 =?us-ascii?Q?LLURI6tu+WgVifPY5MMxohd2f7bVnH9ilZLioJPoIgIViJDIrN+s3+K98afp?=
 =?us-ascii?Q?lIAC7n8+WsqmMjnn0WNVObj/e8LNmCPWgi/hZjPrAU3rzyCEG+/6D5HO+gyH?=
 =?us-ascii?Q?txeiL0Lc38hFPfQ5ol22IpB3v7gfdjIDn9iGuiPi5qGX4pZ3eW7DZZIxKyvz?=
 =?us-ascii?Q?WBFBY8VqqP/TlyQgnHZTq+F/N1GWMORex8Do4IbGLae/WNoxU7+YGSHiGibU?=
 =?us-ascii?Q?wpUKnuQ9Zmqm9bX9jedJChSo?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14b127c6-a6fe-460b-7cfd-08d91c3d807a
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB7102.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2021 09:47:52.5949
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WoQSY9pNt1kk1vMofHZ0neZ5aMbwLvAQGH9rtkLv1L/Qd7imUgwETGjSL/Ab/JJy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3871
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Hi Varad,

On Tue, Apr 20, 2021 at 02:22:28PM +0800, Joey Lee wrote:
> Hi Varad,
> 
> Thanks for your review!
> 
> On Thu, Apr 15, 2021 at 02:08:32PM +0200, Varad Gautam wrote:
> > Hi Joey,
> > 
> > On 4/9/21 4:46 AM, Lee, Chun-Yi wrote:
> > > This patch adds the logic for checking the CodeSigning extended
> > > key usage when verifying signature of kernel module or
> > > kexec PE binary in PKCS#7.
> > > 
> > > Signed-off-by: "Lee, Chun-Yi" <jlee@suse.com>
> > > ---
> > >  certs/system_keyring.c               |  2 +-
> > >  crypto/asymmetric_keys/Kconfig       |  9 +++++++++
> > >  crypto/asymmetric_keys/pkcs7_trust.c | 37 +++++++++++++++++++++++++++++++++---
> > >  include/crypto/pkcs7.h               |  3 ++-
> > >  4 files changed, 46 insertions(+), 5 deletions(-)
[...snip]
> > >  
> > >  matched:
> > > +	if (!check_codesign_eku(key, usage)) {
> > 
> > Perhaps this can be a generic check_eku_usage() call, with codesigning as one of the
> > things it can check for.
> >
> 
> Because only codesign EKU be checked now. So I prefer to keep it
> as my current implementation until there have other EKU requirement. 

I have reworked this patch for a bug be found by kernel test robot. I think
that your suggestion is good. So I change the function name to a more generic
name check_eku_by_usage() in my v7 patch set.

Thanks a lot!
Joey Lee

