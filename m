Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 12A492C4F0D
	for <lists+keyrings@lfdr.de>; Thu, 26 Nov 2020 08:01:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388217AbgKZG6r (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 26 Nov 2020 01:58:47 -0500
Received: from de-smtp-delivery-102.mimecast.com ([51.163.158.102]:41341 "EHLO
        de-smtp-delivery-102.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2388234AbgKZG6r (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 26 Nov 2020 01:58:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
        t=1606373923;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=/pIkZcjHygksoYbODL2YROOusTjyTshQSE5cAkOmGk8=;
        b=ZmUAluA7RLHE2EmpWrtpRQUcTVQmPVp0hfByQiOeBLOXwJGjbvAD9uLSOnMaywmY33T1MI
        wVoGm6jLwxmeaKI5AVrMpw6j0uXfg8XIqFMWPiIgeGw5LyOUN4Im7Pjbj6365yH2DQEIGE
        eazMXIrydIZ0ZpoR7mGKJ+nGFbgKJ84=
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2059.outbound.protection.outlook.com [104.47.13.59]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-7-z_YrMqBmMJ2gNDEifVAb8Q-1;
 Thu, 26 Nov 2020 07:58:41 +0100
X-MC-Unique: z_YrMqBmMJ2gNDEifVAb8Q-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iC3xQ/SfGiES5cvbxm4goUZechV/m5hbpYUmYd14A3VnIj8WyPWEIfB3UtzAgJCEfPdLA1npxCNNJ1jBlSfPduz4G9fAtGxqlSV0O497La1JISgsCsR3fbcEt0y61ODnTQSXrJl/WG52g5q6p72cqeTLHmNFEoaVtxFaDUM0xDgjyM/VBb7+ThiYyAKdgSUjBWiKzQ7ZJjGqVAmqeMWYU2OzV5DxgA5d8u24TLXHDWmJRRoYNpDFCdlZJgTLgIzzMKV/XxOuvLFsspN8q29389HwcJLkztOoAOSMH6oz+Vko+XL9m4VSG+DZdaGA8LUDM6NLB5rcZGtLgmWzmMPeVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/pIkZcjHygksoYbODL2YROOusTjyTshQSE5cAkOmGk8=;
 b=hZgYaDU50PvE/bD8yUs672Ew9ja3Db+yAco1UcES6jYwwyW9uXC0qOBduHQVVMLmmBoPGwMJtqw1CUOoTw/7T1PGQUdPtEjniUNoajXNtWHDiFQpD/tdn7/3B2NLTxwgh1KRecVv1j4LeymOYVaDVXU21wiqW+wy3i0RjMJLOgCfEmtfDgYfbj/dBwPYXlZRWEwnCC+jVRWelgOE0lM7EkWy4MeSeKbmzodIp3/hmnP/x8R8PzgrIHi4njc7BVlCXdMLlw/sbWkhJ2LjxV2t8oeTorGUkqkNYPIbunWWVWxf2Cm56XS9O6BWQ2q3SWVXN4DwPuvZM+i7csxIfzkGHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: infradead.org; dkim=none (message not signed)
 header.d=none;infradead.org; dmarc=none action=none header.from=suse.com;
Received: from VI1PR04MB7102.eurprd04.prod.outlook.com (2603:10a6:800:124::12)
 by VI1PR04MB6061.eurprd04.prod.outlook.com (2603:10a6:803:f2::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.23; Thu, 26 Nov
 2020 06:58:38 +0000
Received: from VI1PR04MB7102.eurprd04.prod.outlook.com
 ([fe80::a9d9:de53:99f5:5ba5]) by VI1PR04MB7102.eurprd04.prod.outlook.com
 ([fe80::a9d9:de53:99f5:5ba5%9]) with mapi id 15.20.3611.021; Thu, 26 Nov 2020
 06:58:38 +0000
Date:   Thu, 26 Nov 2020 14:58:26 +0800
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
Message-ID: <20201126065826.GH31356@linux-l9pv.suse>
References: <20201125072653.15657-1-jlee@suse.com>
 <20201125072653.15657-5-jlee@suse.com>
 <aa6e405c-ef6a-e9eb-4431-cb5629fcfc73@infradead.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aa6e405c-ef6a-e9eb-4431-cb5629fcfc73@infradead.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Originating-IP: [124.11.22.254]
X-ClientProxiedBy: HK2PR02CA0205.apcprd02.prod.outlook.com
 (2603:1096:201:20::17) To VI1PR04MB7102.eurprd04.prod.outlook.com
 (2603:10a6:800:124::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from linux-l9pv.suse (124.11.22.254) by HK2PR02CA0205.apcprd02.prod.outlook.com (2603:1096:201:20::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.20 via Frontend Transport; Thu, 26 Nov 2020 06:58:35 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cb0de80b-aacc-4a5a-af00-08d891d8b34b
X-MS-TrafficTypeDiagnostic: VI1PR04MB6061:
X-Microsoft-Antispam-PRVS: <VI1PR04MB6061C59790330D7E5904E138A3F90@VI1PR04MB6061.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8r5fIvPRhAEioqW0Zbdz0zFPtD6lRHjQEy+NerALoFSgrTrhiwDONa4un38M1n43rY8MsGG7MzUqzshcQTPCHMHttKZpmVM+SQlNehN3b7rHf1DOGXXtEve8+K2V5ZUMRudCHlKmJ5qxR6wFAX0ILNvK5TGeqFCxVwG+8yEYO1EnwOekbEe/jBs/1IA/Ua0n3QZURsaj+IFR4l/nANLbE3cESvj+1g1ccWcyJqGHW/rKOsal3shba16YQWv7gVNcNRtzkrxefWs+Wtgeg77BE8sRKAjkq5XDVUtJcLRSfyIdMMEjfimatXmsJYov+alFWeT5PfIQvYY6Wg9Tk2dvIE0T1gw/kbAnpID/+Q4pdqmCtu0e9mH6lNiYgtLWP/cE
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB7102.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(39860400002)(366004)(376002)(136003)(346002)(396003)(8886007)(2906002)(83380400001)(7696005)(52116002)(86362001)(6666004)(8676002)(1076003)(36756003)(5660300002)(54906003)(186003)(26005)(66556008)(478600001)(55016002)(66476007)(8936002)(9686003)(316002)(66946007)(956004)(7416002)(6916009)(4326008)(33656002)(6506007)(53546011)(16526019)(43062003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: qcT2fsXhgi09cZrsjyYiFeLXOIGteBXedO0qoIsE+6yJrQKFhbE+E1DZN5OCCtEZwZjiLqSf+QDjxlxrwLmHOkV1u0yxdnVassCTSfkVEiAENzOrqlWlV7xnVBebLdau6NDUjdpsTVfnHarwj2Tf9ByBKWjBCk/fv9tiZvejV4PcPp3O7Q+HJ0VuYyd7HItcrS0Qy9sWXYBzwdnCR5gJ4MZnTtwLCwOuoMX84nbOdPdojHvQaJSut1do16aPv2Jl6/8oSLIdAC1HuYWrcRkFr4WzcjbEUSZnQaT9Q5kgIH1Lzog0MypNyFqXzVkxHDzlt1W4j40CwHWp5EYNP8BcwS6nG8KLKDOLdRc+cZDmEpVNeuhoDSDaf2HbmSFlnEcuUeNcOe2QWlXjOQMpwuhnwUmRaB3IzJwkFWBNWAUxRPlnq7Tu2SL1l5lJDx4c0j45RAQ5zO4CqD7QCjbT4vOn7VerTa/a9lLS1I0gLE+UmGjkdtCsbHjeeI3xeJo8ktca5Plr2zjTJGRylkqo4hMDpGW+u+pc/6+R68TNS77FwQVpu94vzCN369VNSrJvH/Y8k+PLXYN7a/UVIL0T48bf1aygqegWXSMmLRV8J5ZpEetxtC6jCelsz/U7gYVXuk7FpeVYdZFWqeA1rCYShe8DBpsQKN9dP6Ut4zSLwDL4WlmxFrT1wNB9TTyMTBGZZUb2zvxrY2VlFp1Ef2q3rnXZl/8emashUsc/jz7EZ+KG7POD+pHARUaC0idvhWLBARuEoduCO5q2VFDIdnnz4tPucp9zqpWn7pRO2/YZsIUl19Qg3eKe9N+SvitFCWo6iNoZOu5Yrlc6kn5CYrJOILpydAg/Ip1zdJJ5CjwY02PUa6LFmqyCODhQ9OwZUAd+5c+LoPQcPTcOQVZRJaDytB2ASA==
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb0de80b-aacc-4a5a-af00-08d891d8b34b
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB7102.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2020 06:58:38.4390
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eTFictZzpvryeI6Eh4XoVUX3k4YbHeuB+BH77umaauWKyIFfMJcHkio7/7ouMPyW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6061
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Hi Randy,

Thanks for your review! I will update it in next version.

Joey Lee

On Wed, Nov 25, 2020 at 09:25:51AM -0800, Randy Dunlap wrote:
> Hi--
> 
> On 11/24/20 11:26 PM, Lee, Chun-Yi wrote:
> > Add an openssl command option example for generating CodeSign extended
> > key usage in X.509 when CONFIG_CHECK_CODESIGN_EKU be enabled.
> 
>                                                     is enabled.
> 
> > 
> > Signed-off-by: "Lee, Chun-Yi" <jlee@suse.com>
> > ---
> >  Documentation/admin-guide/module-signing.rst | 6 ++++++
> >  1 file changed, 6 insertions(+)
> > 
> > diff --git a/Documentation/admin-guide/module-signing.rst b/Documentation/admin-guide/module-signing.rst
> > index f8b584179cff..bc184124d646 100644
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
> > +X.509::
> > +
> > +        -addext "extendedKeyUsage=codeSigning"
> > +
> >  The full pathname for the resulting kernel_key.pem file can then be specified
> >  in the ``CONFIG_MODULE_SIG_KEY`` option, and the certificate and key therein will
> >  be used instead of an autogenerated keypair.
> > 
> 
> 
> -- 
> ~Randy

