Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 99D61294B2A
	for <lists+keyrings@lfdr.de>; Wed, 21 Oct 2020 12:20:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2409947AbgJUKU1 (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 21 Oct 2020 06:20:27 -0400
Received: from de-smtp-delivery-102.mimecast.com ([51.163.158.102]:31327 "EHLO
        de-smtp-delivery-102.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2409928AbgJUKU0 (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 21 Oct 2020 06:20:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
        t=1603275623;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=lvA6JH2s+U6ObZG8b4tCXCs08lgAevTFwjtqnmIE4ig=;
        b=i04+RrcMM80s2/1iad+f0abiziMmIkne/DQV5tipoDa45pJg1TctXXE3+x9aILCf840jb0
        TglfAvgBMr7hbitI40ji0Uj1S+kqUkdX3Gu+tE5of4qsSnRkOaCUogxTVPt3R2ENbm5Ab1
        lBG1tbM0uB2K93ZZurGBFVnHE9WHAFs=
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2054.outbound.protection.outlook.com [104.47.13.54]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-15-Zz5w17R4NpOzeD96Hjkj_Q-1; Wed, 21 Oct 2020 12:20:21 +0200
X-MC-Unique: Zz5w17R4NpOzeD96Hjkj_Q-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OwHqKIoGhw+9/ax4VP4g6Wvu6xIbwEkSP8rWCdeJCWma6/hbCyA4eOMqfRa6Vn5tyx/xxXQpQRQcat8+0UW0WCFXUXpFUtuj4ER+QAsJs+vD7InAOhWq5fsWusoUVtO73HCVcAWmcszOTGAvBeHJ2zzbym/H5lJK1fA9DzAC1U/hdZ3c8EVaJqYsmWVk3NawxRBIF+YQQssCQCLUTAyD05K5ORYP85ooZoYU2BlM6szL0k5Q7ltxyKf6jaabJ8jdtdwVqyiXMFjT+Eq0YovFIdFvz6vEvxD6wf76z0kFmiP/S66A71YvUqRl4xvcxSoXDmrfPQrGSGEKbud5ru6+kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lvA6JH2s+U6ObZG8b4tCXCs08lgAevTFwjtqnmIE4ig=;
 b=adXdfJeE27HdLgUoLKCH2/JCDdvNaCTp3hb0vhIz4cx/GwnIlCoUvZTNtfq1LOy18dl5WGEiYwYA9+uJ+qfN2A0ln2i2d9RFId/h+iosMEog5frdpiXRG6Go8AdAjSdFB2siRuyRp2rGR+0ad8eNf82mINyr/d1eziJoLVUNzV6f7ZXrTA317VcyekwrlR3gxrtOKFbBTmhX4TnZDA96mWzQpek7j2+SRS5amBjlTI1MRuMPp/DlBTMNqWTwv6DZvyEmdco3De3k1hCCJY2jGbRzP6IsvFaEpoxAQj4ohiBW3aheDd19ZmRd0Q4rcNN8Bn+67eIexbconpOxkw/9jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: infradead.org; dkim=none (message not signed)
 header.d=none;infradead.org; dmarc=none action=none header.from=suse.com;
Received: from VI1PR04MB7102.eurprd04.prod.outlook.com (2603:10a6:800:124::12)
 by VI1PR04MB5247.eurprd04.prod.outlook.com (2603:10a6:803:55::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.25; Wed, 21 Oct
 2020 10:20:19 +0000
Received: from VI1PR04MB7102.eurprd04.prod.outlook.com
 ([fe80::4850:c5a:699b:e466]) by VI1PR04MB7102.eurprd04.prod.outlook.com
 ([fe80::4850:c5a:699b:e466%9]) with mapi id 15.20.3499.018; Wed, 21 Oct 2020
 10:20:19 +0000
Date:   Wed, 21 Oct 2020 18:20:07 +0800
From:   joeyli <jlee@suse.com>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     list.lkml.keyrings@me.benboeckel.net,
        "Lee, Chun-Yi" <joeyli.kernel@gmail.com>,
        David Howells <dhowells@redhat.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S . Miller" <davem@davemloft.net>, keyrings@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 2/2] PKCS#7: Check codeSigning EKU for kernel module
 and kexec pe verification
Message-ID: <20201021102007.GB13854@linux-l9pv.suse>
References: <20201020065001.13836-1-jlee@suse.com>
 <20201020065001.13836-3-jlee@suse.com>
 <20201020134208.GA297878@erythro.dev.benboeckel.internal>
 <885f1b81-6141-a3be-1dc0-92c1fc825e3c@infradead.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <885f1b81-6141-a3be-1dc0-92c1fc825e3c@infradead.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Originating-IP: [124.11.22.254]
X-ClientProxiedBy: HKAPR04CA0009.apcprd04.prod.outlook.com
 (2603:1096:203:d0::19) To VI1PR04MB7102.eurprd04.prod.outlook.com
 (2603:10a6:800:124::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from linux-l9pv.suse (124.11.22.254) by HKAPR04CA0009.apcprd04.prod.outlook.com (2603:1096:203:d0::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18 via Frontend Transport; Wed, 21 Oct 2020 10:20:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a404e30a-304b-4c7a-0778-08d875aae989
X-MS-TrafficTypeDiagnostic: VI1PR04MB5247:
X-Microsoft-Antispam-PRVS: <VI1PR04MB52478D6737E1F3C6BEC6962AA31C0@VI1PR04MB5247.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +S7nLE7YfTHR2aoOgWFXiBH6p5hrOuA4M3DJ078FMiqbqIXniSL5EZOmW6S16u5REZKoQ0laHyokIuCRp/8ofkaCbqVR93ohQAomcoCbplwPl2GM2F4RPP15bh2j0CZPufaaHUsts1RIYZg8kdYbBBQIviqqYSXptPYPQzdMzBOYmcZONVEYn1CkIRBgcAfDNSt+FQMY8a5yyLp1IdNoiJn0STKlvNmp9WLCfOIJQpHc7xydenLKpU2QRvTWR56PLVSD0Tr3Qw2etr2o/Irlkl3rK3mYYVF2/pXArijSAIwAj/lGUEuikFDCJqpI17K6i/nvMlJtUjFtFaLEjWCp9lBnsQWYPJZAjJeB6EbvGdQ68T1zXQ0mPUR7EU821AKL
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB7102.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(376002)(39860400002)(396003)(346002)(136003)(316002)(66556008)(36756003)(8886007)(186003)(52116002)(956004)(26005)(8936002)(7696005)(66946007)(66476007)(33656002)(83380400001)(16526019)(9686003)(478600001)(1076003)(15650500001)(4744005)(54906003)(86362001)(55016002)(6916009)(2906002)(5660300002)(8676002)(53546011)(4326008)(6506007)(6666004)(43062003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 4tS76mOfTlFjlg/1VDLIi/ukv/nzz/QfYLZS4rMRGfRz+pQzMN+WFzSFzXcq3PAGUz8FBtx82mX6kUNz7UwqR3NMA55Z8m9NYW1kQAJY+zs6OLQesc554PtFzyjurxfm64CB7oV4wehK37eJHJUAYWYtqX8SQ/C0aBqWbWF325138diND0F8joJEbqWd4TnRXGaf6NH5SUVz3ulQfoq3oeDStvYgn/AfTPVMk2nbin0KYvL+u3q30/hXW5KL+UE8Bc/1Mn4wJJdvS+82n3cqSV17DxoJpuNG5IhKi1WEeLNeZcyPiKqH/Am3NvUwPDQP+Yrr5PCkql0oQMLXDPR17xAfWWfGXlyjVA9GIj3E3YjIR8i7f474QOZuruKV3dhZYUEkgmMknK3bt8DMQAgghcFGjcq0i3E5elRK5D5M9C5hRPrVcNQ4biHCa+6UEdyz3sGeGHNbmCmhnF2wfCqAgAbf7zPVJpxrAAyc/f1omE92pNd6IDH1IjPs90/UZaPsyhOZOmlXkLaNZFAkr1eRP7yaOXwlWYzsmMtQl4zEOE4H1VEudBhu09VldkPoc1G3t8V86fJY/1CRMm8pDHx2Xb6eKncB1Fx/qdc0xSSCrDpyqQsQGwI0fEZmL2WzUQo7y1PTq5bLM9exXLX+Se72jQ==
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a404e30a-304b-4c7a-0778-08d875aae989
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB7102.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2020 10:20:19.7022
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gsZsrSK9bowhHqamB3wjrbGRtg98iFIQLgUV8FflxjzOVflNwLYmaOyRA040DZe+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5247
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Hi Randy,

On Tue, Oct 20, 2020 at 07:56:29AM -0700, Randy Dunlap wrote:
> On 10/20/20 6:42 AM, Ben Boeckel wrote:
> > On Tue, Oct 20, 2020 at 14:50:01 +0800, Lee, Chun-Yi wrote:
> >> +config CHECK_CODESIGN_EKU
> >> +	bool "Check codeSigning extended key usage"
> >> +	depends on PKCS7_MESSAGE_PARSER=y
> >> +	depends on SYSTEM_DATA_VERIFICATION
> >> +	help
> >> +	  This option provides support for checking the codeSigning extended
> >> +	  key usage extension when verifying the signature in PKCS#7. It
> 
> 	  extended ... extension.
> Can we drop one of those or reword it?

I will remove the _extension_ word in next version. Thanks for your review!

Joey Lee

