Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6FD19323970
	for <lists+keyrings@lfdr.de>; Wed, 24 Feb 2021 10:30:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234448AbhBXJ3R (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 24 Feb 2021 04:29:17 -0500
Received: from de-smtp-delivery-102.mimecast.com ([62.140.7.102]:23429 "EHLO
        de-smtp-delivery-102.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234230AbhBXJ3O (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 24 Feb 2021 04:29:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
        t=1614158881;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=HRH548zVPjozLlJnewmrztGq4PzSf4IpzoyLwQ0wrdc=;
        b=jZboxSCdRU8T7WBThiykZX29Y90P3g0j/Z2QVh60xhzGsA1Nd9y8BMCZOFWSEUfAu8JtcB
        FsKyBQ3MQ2ktAmfvr5NO2vM3Vh64K6vUAk+iQwS7zQBsD89kC7DztQRaWIQhLqhmeZBGZ/
        HWq0J8cIF7WowdQePyCjbiOTw2OqA/U=
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2054.outbound.protection.outlook.com [104.47.6.54]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-38-kveQz6QNNYObAQE9LDjtpw-1; Wed, 24 Feb 2021 10:28:00 +0100
X-MC-Unique: kveQz6QNNYObAQE9LDjtpw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LG+GT9DeIWRDGkFYXRUgakHW32NyHsUrPjofs0m+JuQkwjiGzXhSmGWTliCE9ydNO9pr8cgq9g8mkEnn6QHwXSCsPXKHTyRoMrNVxygz27RRIeUzhdHZ+ZwAN8i3pmRs51qQOr0cs1Apx7IzW7RT5+ozXxxeSWzREaYk8WBQomqpagnPBH1voxZJ6oOUSP5shTnuSltD2VziskMUM8irfvo1m2oZVxfDSAtPUEi4kDPj+eqfOUE6umLtZXtemy3vAtadwGKf0hrieaWSqqqR2rQqqiMVTBsZEQvsNmYGDYjSO+zsBcPSNzxgcKwncAYdIFbwVCoy0KTsom7pd8b9rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HRH548zVPjozLlJnewmrztGq4PzSf4IpzoyLwQ0wrdc=;
 b=WijnuXaQLgBGOFhF1A/4KQ9G5FscUXn2uJVGgZwBhjErTgrrWBxapuBiw5kds1v05rEB6IcWN5A6j4EB65eQExe6A1UT9MiXVr/4xU/2hu6A5VuWOIElZaRf+DTFeSP7yIGlSNtdrJz/ByrVmc8OopaKrQrWT9O37rJoc0ja/KLSwm6niLNwQNqJSWZdKifsu5hlLaKK1O99Cw9CMh7RNjbRXPHpId/0oc8r0UFw8xtvmj6Z0Eft9kioe1NgIvslXVmj9TuTIxzqIFOSl9BM1XQN+vkZNayPYHebSDoooDPBAuQC/qa+cTX8WKIDeb3/WjOGhd5YxwLto7Vr0GlyKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: infradead.org; dkim=none (message not signed)
 header.d=none;infradead.org; dmarc=none action=none header.from=suse.com;
Received: from DB8PR04MB7097.eurprd04.prod.outlook.com (2603:10a6:10:12a::11)
 by DB8PR04MB6843.eurprd04.prod.outlook.com (2603:10a6:10:11b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.27; Wed, 24 Feb
 2021 09:27:58 +0000
Received: from DB8PR04MB7097.eurprd04.prod.outlook.com
 ([fe80::9833:3fa2:6d22:6586]) by DB8PR04MB7097.eurprd04.prod.outlook.com
 ([fe80::9833:3fa2:6d22:6586%9]) with mapi id 15.20.3868.033; Wed, 24 Feb 2021
 09:27:58 +0000
Date:   Wed, 24 Feb 2021 17:27:45 +0800
From:   joeyli <jlee@suse.com>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     "Lee, Chun-Yi" <joeyli.kernel@gmail.com>,
        David Howells <dhowells@redhat.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S . Miller" <davem@davemloft.net>,
        Ben Boeckel <me@benboeckel.net>,
        Malte Gell <malte.gell@gmx.de>, keyrings@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] Documentation/admin-guide/module-signing.rst: add
 openssl command option example for CodeSign EKU
Message-ID: <20210224092745.GS20347@linux-l9pv.suse>
References: <20210222064251.13374-1-jlee@suse.com>
 <20210222064251.13374-5-jlee@suse.com>
 <a6eb68cc-7815-daf7-8cc5-0757be502fee@infradead.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a6eb68cc-7815-daf7-8cc5-0757be502fee@infradead.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Originating-IP: [124.11.22.254]
X-ClientProxiedBy: HKAPR03CA0033.apcprd03.prod.outlook.com
 (2603:1096:203:c9::20) To DB8PR04MB7097.eurprd04.prod.outlook.com
 (2603:10a6:10:12a::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from linux-l9pv.suse (124.11.22.254) by HKAPR03CA0033.apcprd03.prod.outlook.com (2603:1096:203:c9::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.10 via Frontend Transport; Wed, 24 Feb 2021 09:27:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2ebd3c18-f5ff-4437-bcc6-08d8d8a678fc
X-MS-TrafficTypeDiagnostic: DB8PR04MB6843:
X-Microsoft-Antispam-PRVS: <DB8PR04MB6843A0D731FD2F2F07D5C3F9A39F9@DB8PR04MB6843.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aMu+re52pB/pCLfWqm1rc8QJBwCRG915r8IQRXv7TcIidAnNbN69ZoNwSfBtpeuyt2zG/5N5tE39VGg5CACy5UiKLjHt7yR+48tMS43eyOTP4xYo1zsgQKm97JGvqIAvJM7LnbHhU5Mxqe+EeCqYp82nB7p9xNiHAPPUPQHOlTjwwRSItlOmPlQL24U4eAlXYahCdF3m2cRJaUkdzzeU7ohuC0n3Ax4h8l7adl6nkoXR3+DxBhFIr3LMqPCFDmgpb9wnqi0+N+X4ZppZFPGMgqsylDpZWgus5R1gxzutipgbmJLfXuR8mzPRDj9CWyJO8sCUN/V1Ca+/9pBeLaQGmb+uuRBUSuD2OCWO8yvCKiQ3Wb2h/OYVEI/tsS7zeArUUcKD+sp78YvVGls6u12tL9gMj+YrA5gKmWvF8nEE72T/kx4xhFDYd4ZP6E9jr2AEEFUWY8ayPcCi4V2JHhEUhORgB8RgpccO3jetT21U0XVAnIthvKk/5EoVKNKcQhfTxp2+GbD81abz80RwG3dRfbEhSHnYw3HVYVxi7/6VqyXbiwyM7L6XNgO7zkxGpmzN
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB7097.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(39860400002)(396003)(366004)(376002)(346002)(7416002)(5660300002)(1076003)(53546011)(54906003)(36756003)(26005)(316002)(2906002)(8676002)(66476007)(66556008)(4326008)(83380400001)(956004)(6506007)(7696005)(55016002)(16526019)(52116002)(8936002)(186003)(66946007)(478600001)(86362001)(9686003)(33656002)(6666004)(8886007)(6916009)(43062004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?nw4LyLlHbW1sV2tt4afOt/ZW6LteKRKU91snP69DSQKwy2hE6DvQKbqqX9y3?=
 =?us-ascii?Q?6o3z1SMS9fbu0OJINLr+Z7tsXf5SLQKmaoQn9MxGlQ/PGht4lK8cUO16Tuj5?=
 =?us-ascii?Q?szNJpK5/OOtCQ4vgYCW/taNu9hay3WUvKxOAWa/BuLGBgPjrOtOf1IPV4Dkr?=
 =?us-ascii?Q?BnP7AUSCNdikYuU5zIJWyDAVyD8OMAaWF95AEKy2ttzraOj1RHrthxtRX9cX?=
 =?us-ascii?Q?24cU/cmhCjomqyOQlgXVrB1yPQYnH2qwAUCZhTsVLneaCkMrCrwrT5ZzUj+f?=
 =?us-ascii?Q?6wB0KIx2G7e31m+QiM+MBpjAxMCpnM1wenVHg321z5JFsqlkMrUQ+5H75kIM?=
 =?us-ascii?Q?GyUl6SEUTVh2y23uyaBa7LnDW4jfkxGKeKfVoA6N6h8blMJzjQ6dGXHfotzf?=
 =?us-ascii?Q?rZMw6jng66ReYyaOtIBGFRKKIsYUCP+5M809pfpVYsAlDvNBi/o5ROOcSpJb?=
 =?us-ascii?Q?vOrIHSBjAwIKK28s/H33ymrksyq7fGSBq8T7I1Ti+h8aWZnEorRY2dgRlnDx?=
 =?us-ascii?Q?vg1ogeGWzJ/Z8dRt7ga/AiQuowWt6tYhSADWlV4JRfhumMHRfsKOaRRp8CbZ?=
 =?us-ascii?Q?42QnwE8gQYa7VbWlyZJSj6fvOtt7ORxkZelHUgEdfuNHGP4lgAOTxAYLCCNn?=
 =?us-ascii?Q?RzXMl5oYnRsKAHMtJGwuL2cxtBzimOk1kD7d96K83ZQDAOK4tyWaS242I6cv?=
 =?us-ascii?Q?mooUiATgyG0kYyF5ymjTQRk5BsFpFJ2iTgOCJ3Y+KwMmfpaESAJYxafzyJT5?=
 =?us-ascii?Q?7L4bC4uQMdJsv2HrL8ex5tsdJjxqkWaHisndAZPXktDc3nLMF/bLHjNs73TI?=
 =?us-ascii?Q?R3K5U+zRwrOcfbU05QFweKd5wVhMmnN01gXLS756P7sVNJLcHtknRd4B0Ryh?=
 =?us-ascii?Q?xaabbrAFe6ze2aD2tbafrB91pcuPzkjOmPG2hXb1PVmcivGCjUAZPnAymK/f?=
 =?us-ascii?Q?hi61DQGrlH9UuVFmKioJ58expGk3QXF0F/dewVLQHC50BqChQ3QtDZ1S66E/?=
 =?us-ascii?Q?6Lewy7czrQx3TNdRKQNtWYY697Ta56P0xl4GKAh1jMamDDA+qldNOdRqsMNR?=
 =?us-ascii?Q?GJajKZMjUiqwRb6hGeW2n7w0I5v520wqZODrgg9BKWvS1tupxRFw7lZnSPIs?=
 =?us-ascii?Q?o2EMI42yjB/rgcH3GRZ6usimrjtiW2XCzBRxrpj/szuduxK5t1bmBeO/G0yD?=
 =?us-ascii?Q?eiv2KwvRitzEkzAZOE+vniOS2SKbIBAKiyuGW69jvxYNSVrEQlG1FY9zkfQU?=
 =?us-ascii?Q?6AP521NWM6cVgzF9g1Q5hqnbMVOTSRGt0Hj832RcOjKOcxGur6/n9jnrfUY0?=
 =?us-ascii?Q?DfI9VPsLTnF/cScXPSgbQhXG?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ebd3c18-f5ff-4437-bcc6-08d8d8a678fc
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB7097.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2021 09:27:58.0458
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w0CzshBtTgQUWgKw5poFrdKtzwBR20Dr4vHe7bPmpG+doSHJ9HejKpindhpwAlRU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6843
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Hi Randy,

On Mon, Feb 22, 2021 at 08:48:42AM -0800, Randy Dunlap wrote:
> Hi,
> 
> On 2/21/21 10:42 PM, Lee, Chun-Yi wrote:
> > Add an openssl command option example for generating CodeSign extended
> > key usage in X.509 when CONFIG_CHECK_CODESIGN_EKU is enabled.
> > 
> > Signed-off-by: "Lee, Chun-Yi" <jlee@suse.com>
> > ---
> >  Documentation/admin-guide/module-signing.rst | 6 ++++++
> >  1 file changed, 6 insertions(+)
> > 
> > diff --git a/Documentation/admin-guide/module-signing.rst b/Documentation/admin-guide/module-signing.rst
> > index 7d7c7c8a545c..b57b30c7125f 100644
> > --- a/Documentation/admin-guide/module-signing.rst
> > +++ b/Documentation/admin-guide/module-signing.rst
> > @@ -170,6 +170,12 @@ generate the public/private key files::
> >  	   -config x509.genkey -outform PEM -out kernel_key.pem \
> >  	   -keyout kernel_key.pem
> >  
> > +When ``CONFIG_CHECK_CODESIGN_EKU`` option be enabled, the following openssl
> 
>                                              is enabled,
> 
> > +command option should be added for generating CodeSign extended key usage in
> 
>               should be added <where>?
> 
> > +X.509::

Thanks for your review! I will update to next version.

Joey Lee

