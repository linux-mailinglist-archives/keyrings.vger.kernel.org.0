Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 734E62FE0A0
	for <lists+keyrings@lfdr.de>; Thu, 21 Jan 2021 05:27:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729318AbhAUE0s (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 20 Jan 2021 23:26:48 -0500
Received: from de-smtp-delivery-102.mimecast.com ([194.104.109.102]:58925 "EHLO
        de-smtp-delivery-102.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1732678AbhAUEZs (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 20 Jan 2021 23:25:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
        t=1611203051;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=o2DpfVOuewCgSWx8wZGMQjL6xW/Db2gdOnP1F88VcqI=;
        b=YgKZOqVPV2RLGbG9bGeGQe2dbMFIC0R1lHH10xD5c5lAjHoWB5LbLwnG3ZY/eL10nRrtrq
        oMQyfN3ZpdhDZyQzi3Bb7MBg50IDibKOHyAOy1Qryoc1gve6cjFp8R4/3FAtkANMasWcbX
        o37GJDOH6chy9Un4J3BUa6P3l8aBssc=
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2050.outbound.protection.outlook.com [104.47.8.50]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-17-cEt-18StNduIfIo6HX7S0w-1; Thu, 21 Jan 2021 05:24:10 +0100
X-MC-Unique: cEt-18StNduIfIo6HX7S0w-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lQx/gdwSvZ4Nid9kKM5ufkmbcAjYid6zkrWUFU5IWi9uFZYDvOd5gMl9oJVAZA3KIdRmB8Ni2D0i7W0x7kOfxbduIhXScY4Lk4//1//cKgs+go5BD0YsJdx2yElTDqfC1KCkpwAkkvzniKgtIu7J/tnb1qT0yHRI0LJxa0hxnDh9/cz2rjSAmfmIGMQEMHXI5hk8As0R6HJOrg6Rhx7XgpoSWL/5AUBGNnvCODp8zUImw5kRW8xI1t16FgE/kyICBLgkcHLiJurEnvvJcgo3h95lhYZrrkf6ektLB1HwQGsDBqvlPeluEqDwAlctL3TOvyoe1ayV7g8yvbkSnVRRiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o2DpfVOuewCgSWx8wZGMQjL6xW/Db2gdOnP1F88VcqI=;
 b=nkwY2OS/ila7Ng2p+2ckBkFlSAUJCjNK2s8z2p9WVN2CikWZU6S3SHfiXYnvuCYVpn+4FNpcaS2ziMLCbReVGYILOzFkncSxeHjmDp1iEZnPBSjv2U3At19dkg4mYajyBKnep+sxGGppm82uzi102HAqGM5lvgnHbio/7dqhUYOzQQDt4MpSa54j9dmBaMNd5n24FidQCSt1yNaDdiSryt8/YOfiby8dZpQONzcou+0g6y4YkFkYfHqlIlgCIk7Bh3und9VlUOjwJn9/AlFp1nqkMYA6u4spcPqJkODsbteng0rKNqS+Qc/qVxIq62HP21aw2g+RL8OLWGxnek99Rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=suse.com;
Received: from VI1PR04MB7102.eurprd04.prod.outlook.com (2603:10a6:800:124::12)
 by VE1PR04MB6590.eurprd04.prod.outlook.com (2603:10a6:803:121::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.11; Thu, 21 Jan
 2021 04:24:08 +0000
Received: from VI1PR04MB7102.eurprd04.prod.outlook.com
 ([fe80::a9d9:de53:99f5:5ba5]) by VI1PR04MB7102.eurprd04.prod.outlook.com
 ([fe80::a9d9:de53:99f5:5ba5%9]) with mapi id 15.20.3784.011; Thu, 21 Jan 2021
 04:24:08 +0000
Date:   Thu, 21 Jan 2021 12:23:53 +0800
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
Message-ID: <20210121042353.GA4730@linux-l9pv.suse>
References: <20210120090517.23851-1-jlee@suse.com>
 <20210120090517.23851-2-jlee@suse.com>
 <YAi/gERomykYZqKZ@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YAi/gERomykYZqKZ@kernel.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Originating-IP: [124.11.22.254]
X-ClientProxiedBy: HK2PR06CA0019.apcprd06.prod.outlook.com
 (2603:1096:202:2e::31) To VI1PR04MB7102.eurprd04.prod.outlook.com
 (2603:10a6:800:124::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from linux-l9pv.suse (124.11.22.254) by HK2PR06CA0019.apcprd06.prod.outlook.com (2603:1096:202:2e::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.12 via Frontend Transport; Thu, 21 Jan 2021 04:24:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f75fa717-ef29-437e-2f5f-08d8bdc4653c
X-MS-TrafficTypeDiagnostic: VE1PR04MB6590:
X-Microsoft-Antispam-PRVS: <VE1PR04MB6590F703D0689B49B005147CA3A10@VE1PR04MB6590.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2733;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1l3A62C1nt5RoxSk4B1l5xa4+qOu0BcLGnhGqhQm0lDpi3aaJaU6Oldc33VQB8fpc1WM+Ay5o+iSogRoPGJkYOfXCh8sk+kIk2NWKKA6Pgv1yrIZMnxlytqveioCqNx6SP+ystm7o4WJ+PJ+4ILMw0kV9n1aCOWIlLwntwtSdJ8QBKearBNFDB0+JmdsN0qoNzwPgclRU8vJtYZnBiZUQfFZbKoWFlcp3HGsRdeMYQEAl4bQo20vXv2SQj56cZrm4f0O/Nrkexz5SX2IC7yhbJj20UhZJafgsHTCJkRj2bdUzy98/2Gf8SnpzWt1kTlskJ93UEQnybbYqhdFvx4pOjzt26CP41QsUazzJdEUuCuZbcJG2fobk7v876P5nU8+e8P0Svrc1bgeYFCR+Lu8+Npqj9dUDiZ5jU3UujJFzPanTXbbhj/xnULkMNK2qL04
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB7102.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(39860400002)(136003)(376002)(346002)(396003)(5660300002)(956004)(66556008)(8936002)(54906003)(55016002)(9686003)(66946007)(16526019)(6506007)(36756003)(26005)(66476007)(6666004)(186003)(86362001)(33656002)(83380400001)(7416002)(1076003)(2906002)(6916009)(316002)(8676002)(4326008)(478600001)(7696005)(8886007)(52116002)(43062004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?Un6lbOYarURIXISnfYZ5nOV/H6sTot//GWpjXdK9n3x3QiT3cViIt+dVwoEr?=
 =?us-ascii?Q?bUsJjaT9JjkMrpPxioM0KACpTYtn4P33pp1QJ1Z6oaylLuP8Xm7OkIBSiBJm?=
 =?us-ascii?Q?4m8irkEZi7zbjbTCjZlNjXvIW9kcSwavKqgxrRTWCvCkehWM2wrQUAhZrOdA?=
 =?us-ascii?Q?NdDSvqbAQnd65tXK/gMJAEHt18ynAfCspIMUtwcFZWuRoDG01TgN8j5ze87f?=
 =?us-ascii?Q?k9cBErypYhLJyv4kR/w8/41fCJSc+LZP78QBefq4dldjDpfz4SHyUcP7de/y?=
 =?us-ascii?Q?0KMoPTRPdhxeYwPw8/tvCaOGHvoV983mJgjC3TtgY5XVckgoHI7epm7cWhB0?=
 =?us-ascii?Q?7j450WfFOvWF7ekAMl/Tjzp7y6Oi1dMfuAyhd2lH5smEAqG2Z+fuYeUdR+HI?=
 =?us-ascii?Q?ISDwJf/U+Yeh9qwgrnYHwonidnU/gnVMok76tMmys4oaqbQA41ZzbecBUVSf?=
 =?us-ascii?Q?oIsGGOc/GxRQqALe6qn2UYvyQfI1GWPZk0IO9ZY8eAQA0UCxYIXCb7tDoaOh?=
 =?us-ascii?Q?41O1bLT6CuvyHBK45JeDLbW2G1AVg+nwZiuJSBIi7aZCNciRe8aeXmvtEJ+m?=
 =?us-ascii?Q?ODjk/XTOp2/u2rFWrKV0+P6locaSWKCs2tG1FAITgpgJnZzR9OroeBy0Z/Si?=
 =?us-ascii?Q?RL5Uqxg2Dt3kns3dkWsKoNZ93WEPKvZgXXdZ8N9GbxKfZnQd/+DbZQbT8am3?=
 =?us-ascii?Q?3OnmnazltHdqdTveUlGsihTx5V5DfcoiR9DTtfkdPuahcKvEfrP/m72boo3n?=
 =?us-ascii?Q?R/3+HcUotmI1UPdDpMKW6TtmgfAv5GeZHBvUc69pm7BLHPh/i7JK6mhCI4n7?=
 =?us-ascii?Q?QGleQArD9v7pKO3VWTemjethpoYM3Y+QWoq+z1oAEBn02lSr2I9HpmgJCTJc?=
 =?us-ascii?Q?NVWdsBo0l1y8IeIXSXzjYfmG72InnOlL1Jnqc8mcx4fYV1EvFTa3hmwJhlay?=
 =?us-ascii?Q?QKoqYiaAWHqi+iv5JSpZssvGCNcfjbZgBZRnNwO5hAeL038H8NSvevDdxCNT?=
 =?us-ascii?Q?kOfe?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f75fa717-ef29-437e-2f5f-08d8bdc4653c
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB7102.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2021 04:24:08.4370
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 61m0RZg5k56iQuG9D8Cs/HXNVGY8Lh3Yv3i7AG5Viu2Pq7Y0UfscFjnZ8swrzyzy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6590
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Hi Jarkko,

On Thu, Jan 21, 2021 at 01:40:48AM +0200, Jarkko Sakkinen wrote:
> On Wed, Jan 20, 2021 at 05:05:14PM +0800, Lee, Chun-Yi wrote:
> > This patch adds the logic for parsing the CodeSign extended key usage
> > extension in X.509. The parsing result will be set to the eku flag
> > which is carried by public key. It can be used in the PKCS#7
> > verification.
> > 
> > Signed-off-by: "Lee, Chun-Yi" <jlee@suse.com>
> > ---
> >  crypto/asymmetric_keys/x509_cert_parser.c | 24 ++++++++++++++++++++++++
> >  include/crypto/public_key.h               |  1 +
> >  include/linux/oid_registry.h              |  5 +++++
> >  3 files changed, 30 insertions(+)
> > 
> > diff --git a/crypto/asymmetric_keys/x509_cert_parser.c b/crypto/asymmetric_keys/x509_cert_parser.c
> > index 52c9b455fc7d..65721313b265 100644
> > --- a/crypto/asymmetric_keys/x509_cert_parser.c
> > +++ b/crypto/asymmetric_keys/x509_cert_parser.c
> > @@ -497,6 +497,8 @@ int x509_process_extension(void *context, size_t hdrlen,
> >  	struct x509_parse_context *ctx = context;
> >  	struct asymmetric_key_id *kid;
> >  	const unsigned char *v = value;
> > +	int i = 0;
> > +	enum OID oid;
> >  
> >  	pr_debug("Extension: %u\n", ctx->last_oid);
> >  
> > @@ -526,6 +528,28 @@ int x509_process_extension(void *context, size_t hdrlen,
> >  		return 0;
> >  	}
> >  
> > +	if (ctx->last_oid == OID_extKeyUsage) {
> > +		if (v[0] != ((ASN1_UNIV << 6) | ASN1_CONS_BIT | ASN1_SEQ) ||
> > +		    v[1] != vlen - 2)
> > +			return -EBADMSG;
> > +		i += 2;
> > +
> > +		while (i < vlen) {
> > +			/* A 10 bytes EKU OID Octet blob =
> > +			 * ASN1_OID + size byte + 8 bytes OID */
> > +			if (v[i] != ASN1_OID || v[i + 1] != 8 || (i + 10) > vlen)
> > +				return -EBADMSG;
> > +
> > +			oid = look_up_OID(v + i + 2, v[i + 1]);
> > +			if (oid == OID_codeSigning) {
> > +				ctx->cert->pub->eku |= EKU_codeSigning;
> > +			}
> > +			i += 10;
> > +		}
> > +		pr_debug("extKeyUsage: %d\n", ctx->cert->pub->eku);
> 
> With eBPF around, does this make any sense?
>

I think that the dynamic debug log is still easier for checking the EKU
setting.

Thanks
Joey Lee

