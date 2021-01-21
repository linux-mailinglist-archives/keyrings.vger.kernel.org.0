Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 009852FEE85
	for <lists+keyrings@lfdr.de>; Thu, 21 Jan 2021 16:26:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732493AbhAUPZT (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 21 Jan 2021 10:25:19 -0500
Received: from de-smtp-delivery-102.mimecast.com ([194.104.109.102]:29276 "EHLO
        de-smtp-delivery-102.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1732449AbhAUPYg (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 21 Jan 2021 10:24:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
        t=1611242605;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=flD0vpoXLj5gwXc7A84j+ONP651k+IZ/ktCOh64cx5U=;
        b=YO1rfsTwjX4EHuAXw/cnYlaCJxxa8fmheisEo7XCyBZJtxLQnue9o9Zkx4Tvtv5C0I4Mqq
        NzgJVZYEbB8pf85c+7SxGiGjyCBlAGznIzsFQsZVsHtbbx0a6JFGG1KSb5fdxiTSRHXqnG
        VOWrV+uNSdxM7ndAKTV7hru2Mt0cG54=
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2053.outbound.protection.outlook.com [104.47.13.53]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-39-dM5RyHxEO6-9ABrLR8jknQ-1; Thu, 21 Jan 2021 16:23:23 +0100
X-MC-Unique: dM5RyHxEO6-9ABrLR8jknQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U6juf12sRbMHTzzliWvjWgJFZrHOwZZQTiEsYwJX7hsU7hQKJCu+JxYqNwS3UIB2XOET06vNTAXGoWouc9VoBrbDF4+DV4yF4Q7HXsC+FBlesxRoCDBX1ALRw5C/h1lDBqws7bHfTwT7iDE6iSCF8zwRgCTttYZaLwDZjk26a6XjRTFyYShllMxXeCnMT4eidiXCvZ5AHh/ZOyArazoAqKRTxVM68VriQGrvuaztA2wsiZzvexqxYMA9lrhxUfdad2IqVpxM8pO3+8wZ+zg1EzTIJ2RPTxMFX+BzDbb5Sj1DySSoHyZve4BDNgy78UyNWhmTgfkJPiSoo2qj7euGbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=flD0vpoXLj5gwXc7A84j+ONP651k+IZ/ktCOh64cx5U=;
 b=NMtPn6Ax/v0614UKozLWJ0Zc+Ml2WI1k4/eg8V9QNvUQ2WlPc+EuYtZ2RBPitRxxI/u5CGqFl6Bcacdc9SXpcwbZtC7A46+ghPLXTsKOU3Pm6HCQa66Co/1R8MHWmtgQfZ/XEm+K7uWYpQa4VLUDjd8MT7swkP5E0p+ahJuKpi+zt993CBYUJdfgyPn2JAWt8a5q7jZkAwZrAbxdCHm3/tLLzSAbjALPAIGEsHJsRW7MQoI9c0RB1Hn7svCFF7Kp76Kt8iiZ5r/tRfDwmLIKVwzOAaauJMiM22dHOJlFfTpgIqU1Qm89s7Vjj7yceqryneAA06GCBaFmMUrut6Wcww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=suse.com;
Received: from VI1PR04MB7102.eurprd04.prod.outlook.com (10.186.156.204) by
 VE1PR04MB7310.eurprd04.prod.outlook.com (20.181.176.137) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3784.11; Thu, 21 Jan 2021 15:23:21 +0000
Received: from VI1PR04MB7102.eurprd04.prod.outlook.com
 ([fe80::a9d9:de53:99f5:5ba5]) by VI1PR04MB7102.eurprd04.prod.outlook.com
 ([fe80::a9d9:de53:99f5:5ba5%9]) with mapi id 15.20.3784.011; Thu, 21 Jan 2021
 15:23:21 +0000
Date:   Thu, 21 Jan 2021 23:23:06 +0800
From:   joeyli <jlee@suse.com>
To:     Jarkko Sakkinen <jarkko@kernel.org>
Cc:     "Lee, Chun-Yi" <joeyli.kernel@gmail.com>,
        David Howells <dhowells@redhat.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S . Miller" <davem@davemloft.net>,
        Ben Boeckel <me@benboeckel.net>,
        Randy Dunlap <rdunlap@infradead.org>,
        Malte Gell <malte.gell@gmx.de>, keyrings@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] X.509: Add CodeSigning extended key usage parsing
Message-ID: <20210121152306.GE4730@linux-l9pv.suse>
References: <20210120090517.23851-1-jlee@suse.com>
 <20210120090517.23851-2-jlee@suse.com>
 <YAi/gERomykYZqKZ@kernel.org>
 <20210121042353.GA4730@linux-l9pv.suse>
 <YAmQeiM0EHNrjyES@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YAmQeiM0EHNrjyES@kernel.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Originating-IP: [124.11.22.254]
X-ClientProxiedBy: HK2PR02CA0166.apcprd02.prod.outlook.com
 (2603:1096:201:1f::26) To VI1PR04MB7102.eurprd04.prod.outlook.com
 (2603:10a6:800:124::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from linux-l9pv.suse (124.11.22.254) by HK2PR02CA0166.apcprd02.prod.outlook.com (2603:1096:201:1f::26) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.12 via Frontend Transport; Thu, 21 Jan 2021 15:23:17 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9eb7a0b1-5950-4646-c02a-08d8be207c8c
X-MS-TrafficTypeDiagnostic: VE1PR04MB7310:
X-Microsoft-Antispam-PRVS: <VE1PR04MB7310EFC7F392D43DE04DD104A3A10@VE1PR04MB7310.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JUYGCAze2yFtrxdG2wIQ6QcDo2zo48xeqm7CRLU/VuIFw9zrD9AnUrOEZRhO13QlaVdDTR5MtaazthduCgpyCjhx3Btq/tu8pahuCPTerYD6Ju0oXzLFQcP5pyqeNyUThqKppbU2uFO+r05OpJ4WuHhggTAy60qPIkTV9VaJ1hCxHFIqR5QiJMSGxJYIRHhdb8Nyzha3uSDpBCZExgm3nd/pDN9kE/UwhHq+G613rilD9ANci1HEeay+vRetyl/gIxjdiPbMFh95f+72UJ0dI5rq4TQrx+XByq8964UyF9l/TA7G4X8ozwa7tmS1iZac1D3vwXRLWLwZzKQs7w5oWZAEfJrtQkswBi4Ssj65UIy9lG39ynrcg/CTVGypkfHaR++S3mU9+R5lcl79BKdaiAfN4ViLOV3DG4PHlh4ZFGFFAdZo0skoqh49Qw1ZjW8fuKV9Z5qr1i1XbWueeCstlX1PTt/dE/TeSpJCUC5m8Rh82RqoFGCaY4mT0ZQAF41lgZdeM9mscoti8s0dq0uMI9TtPH2MIBKULkeDlGXJ1wpKaZgb6tYbxeCk5mmhDiDS
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB7102.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(136003)(39860400002)(396003)(346002)(366004)(66556008)(7696005)(66476007)(52116002)(26005)(8886007)(54906003)(956004)(1076003)(33656002)(66946007)(55016002)(6666004)(316002)(9686003)(4326008)(2906002)(7416002)(83380400001)(36756003)(186003)(16526019)(8936002)(6916009)(86362001)(8676002)(478600001)(5660300002)(6506007)(43062004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?sK/ZDYP65tByYA+PYSQ8JscInPcvb3Bw4qiBCHRwpJ3idarI2CH2w4ES2r87?=
 =?us-ascii?Q?ZDVrGryX9xLTRWu6/Hs1o3vUCmC9wt8JJy1TAU90d57Zh/dWVL5NYOT6PsDB?=
 =?us-ascii?Q?NND3G00yTSGrXINWb94pkozZ605xYCnftE6POnhv4vkw+Mf912lNN+jufdAq?=
 =?us-ascii?Q?NBF+MTOyTo7HSajlqahbTTMh9NOcGGXjqcO3pCEamagN99Wj6hv2H2ck9k61?=
 =?us-ascii?Q?Trmumkudx1/NmSHLU3K403bXzbe5HPYHMzb7kDWB188k+F4tWX/mcYnEyZGu?=
 =?us-ascii?Q?Sf0qxAWBN2Z5GqQJI5blkU8wuFnOLOujQNWS9ODYnq5qT6n6nZQrfGPxVTpp?=
 =?us-ascii?Q?XqWBLXg6MQKn18xCGkJWxFeXPYHwd7pdYmH2/NLAUon9tHRZwWlKXW9SsSvj?=
 =?us-ascii?Q?6N+fnj4WeuPKRc9f8wJcYAWLzEBWHh37Bomhlun1jXTxyr0Sw91Eg9vyF20M?=
 =?us-ascii?Q?U8LHt7dXD5vDBp1UItE8ZgfjKmNvHizswrSe9+dRsLPCXotJFX9MY8GO6Em2?=
 =?us-ascii?Q?RXuglMu1DyhaRb47mwVySjsrLxLIoHt+jRImX5fS1PwOAPw0ngzaXcz3jy35?=
 =?us-ascii?Q?FgJ2B3ES1zU5Vx410suWRyKGCWN6mNRxyUt4Rs5NPwOcGj2dvfqpPGnjme9+?=
 =?us-ascii?Q?nZaDOKAehQMZoY6TuLeTcALXiOu08mRhEKXWUcwZULg/WG1iXEqMAC4DIAoW?=
 =?us-ascii?Q?jq/hS+f/q3FrDTXZlGD//uB0A2tGktEc45eGM99rAkzJR5yg3dJN+fkcsf3X?=
 =?us-ascii?Q?kWab5eiT8NX8kFQ/pZyQ4FgdgoeYol+5kP3VQkKm0m2e0/KbD4vQDObmswPB?=
 =?us-ascii?Q?68basOL0DwGMOyPMRvi2dDLxxvkUxjOGhW96dUCmXwlWNcdR1yaz3Y72SGLF?=
 =?us-ascii?Q?yflaDoVq4KVZLUw6+D7Gfvq2WnKwQrJqM6zmkEqvo9WBYOBY28VvDaNP7Fc8?=
 =?us-ascii?Q?I9ykA9HygORYABNgLYnOy5h5/nMHfTpJw9bZSfZkNBZIU7tXVEhsWaQoMR9i?=
 =?us-ascii?Q?7JuP?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9eb7a0b1-5950-4646-c02a-08d8be207c8c
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB7102.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2021 15:23:21.2995
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k45adt6q97BD7Zpz8hVhodryXixGCC1Gyc7paxCNaBrzXMRudYIsZImrG302oAI1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7310
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Thu, Jan 21, 2021 at 04:32:26PM +0200, Jarkko Sakkinen wrote:
> On Thu, Jan 21, 2021 at 12:23:53PM +0800, joeyli wrote:
> > Hi Jarkko,
> > 
> > On Thu, Jan 21, 2021 at 01:40:48AM +0200, Jarkko Sakkinen wrote:
> > > On Wed, Jan 20, 2021 at 05:05:14PM +0800, Lee, Chun-Yi wrote:
> > > > This patch adds the logic for parsing the CodeSign extended key usage
> > > > extension in X.509. The parsing result will be set to the eku flag
> > > > which is carried by public key. It can be used in the PKCS#7
> > > > verification.
> > > > 
> > > > Signed-off-by: "Lee, Chun-Yi" <jlee@suse.com>
> > > > ---
> > > >  crypto/asymmetric_keys/x509_cert_parser.c | 24 ++++++++++++++++++++++++
> > > >  include/crypto/public_key.h               |  1 +
> > > >  include/linux/oid_registry.h              |  5 +++++
> > > >  3 files changed, 30 insertions(+)
> > > > 
> > > > diff --git a/crypto/asymmetric_keys/x509_cert_parser.c b/crypto/asymmetric_keys/x509_cert_parser.c
> > > > index 52c9b455fc7d..65721313b265 100644
> > > > --- a/crypto/asymmetric_keys/x509_cert_parser.c
> > > > +++ b/crypto/asymmetric_keys/x509_cert_parser.c
> > > > @@ -497,6 +497,8 @@ int x509_process_extension(void *context, size_t hdrlen,
> > > >  	struct x509_parse_context *ctx = context;
> > > >  	struct asymmetric_key_id *kid;
> > > >  	const unsigned char *v = value;
> > > > +	int i = 0;
> > > > +	enum OID oid;
> > > >  
> > > >  	pr_debug("Extension: %u\n", ctx->last_oid);
> > > >  
> > > > @@ -526,6 +528,28 @@ int x509_process_extension(void *context, size_t hdrlen,
> > > >  		return 0;
> > > >  	}
> > > >  
> > > > +	if (ctx->last_oid == OID_extKeyUsage) {
> > > > +		if (v[0] != ((ASN1_UNIV << 6) | ASN1_CONS_BIT | ASN1_SEQ) ||
> > > > +		    v[1] != vlen - 2)
> > > > +			return -EBADMSG;
> > > > +		i += 2;
> > > > +
> > > > +		while (i < vlen) {
> > > > +			/* A 10 bytes EKU OID Octet blob =
> > > > +			 * ASN1_OID + size byte + 8 bytes OID */
> > > > +			if (v[i] != ASN1_OID || v[i + 1] != 8 || (i + 10) > vlen)
> > > > +				return -EBADMSG;
> > > > +
> > > > +			oid = look_up_OID(v + i + 2, v[i + 1]);
> > > > +			if (oid == OID_codeSigning) {
> > > > +				ctx->cert->pub->eku |= EKU_codeSigning;
> > > > +			}
> > > > +			i += 10;
> > > > +		}
> > > > +		pr_debug("extKeyUsage: %d\n", ctx->cert->pub->eku);
> > > 
> > > With eBPF around, does this make any sense?
> > >
> > 
> > I think that the dynamic debug log is still easier for checking the EKU
> > setting.
> 
> Why?

There have some certificates may loaded when system boot. In booting stage,
using dynamic debug log for checking EKU is easier than eBPF. 

I am not good on eBPF. Correct me if I missed anything, please!

Thanks a lot!
Joey Lee 

