Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE44638FF56
	for <lists+keyrings@lfdr.de>; Tue, 25 May 2021 12:36:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231981AbhEYKiA (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 25 May 2021 06:38:00 -0400
Received: from de-smtp-delivery-102.mimecast.com ([194.104.111.102]:55553 "EHLO
        de-smtp-delivery-102.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231899AbhEYKhh (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Tue, 25 May 2021 06:37:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
        t=1621938930;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=ng6qFt1NkmwomrGq3+v+WldxvMxnLBTGsTINBOuSv7k=;
        b=gJfr8YkAo1nZwjAU4QQ4v1Yk5lRpdQ9qP0Z7Tr/pxZKQuxOBSX7r+2P+G+tslLtgIp6/eD
        JH/6Q9KcOBaZO/OeZ5xJyN5OYY4c6XtySQSQPvKtNGV5csLXpNTE5GFMMdRo8uH8K26QIz
        CAKx4lN/XijxMavKpmiTs7nVc8Vtws0=
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2056.outbound.protection.outlook.com [104.47.12.56]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-24-IwCZkctoMMCWkLuL8Zu8tQ-1; Tue, 25 May 2021 12:35:29 +0200
X-MC-Unique: IwCZkctoMMCWkLuL8Zu8tQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g4FRRTZU1dd9AHB3xy/pj2zxgGRBWF0+uupLbs/7sI2VeZW2SDHhKSJXULCaBPyQi20TMEoeNNrGT5btcjMYqwAB6xkOqB5gYi1ZjUcaoA7F9ZVaRcGlBLNusZXO49AJJosbvUaVgxPHkWozkVNOFzwwXOts9R0T4N0sAaPfvKc3q2/QEzzOq0UbfD1v0pLycmnzMa0oJ/1rwVhW5dToj7Ketoe2RZHsTKENpIcXTKUlzsx8fKgof1KJWDMkDrKAvjidcmStNsZb21SmAuXwnRMXOSPj3Vja0czmenlab/J8rkzdQoT+PlF85OocOJ+xObgV0nQlF9V/8I/s43ogkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ng6qFt1NkmwomrGq3+v+WldxvMxnLBTGsTINBOuSv7k=;
 b=UCmuqV6zrtg/oU8x1E8K78mKmXnwa48DjzH7oYr/d12GR0xfca6SXsIKNzPyeXJLKLxoV/zreKvtrY6aCAbKZSzwAeuSHsjTZHQVo6JG2c8y8NhZVbdbrXpoxfgTmg1qcVlVThogt3WqVcJenj0qRHkfBv6YteTutaSv8iMktErumWH0CqCs1vlLH1ReOAuMgbptAbt6HgjmUdu/+VCa4iism3LRJS14RDTaOIdhb7eo7rK2NtTm2cHlusWKQBhlI7E+x1L3wJjNPSVilwJhU7Hu5H1L0z2GLr5ixONn2p5kXv8jIZTNRNsKMhwJHVpFQ72b6o10MdSMAPbSs8gqPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=suse.com;
Received: from VI1PR04MB7102.eurprd04.prod.outlook.com (2603:10a6:800:124::12)
 by VI1PR04MB7023.eurprd04.prod.outlook.com (2603:10a6:800:12f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.23; Tue, 25 May
 2021 10:35:26 +0000
Received: from VI1PR04MB7102.eurprd04.prod.outlook.com
 ([fe80::e0f8:e927:79f:232a]) by VI1PR04MB7102.eurprd04.prod.outlook.com
 ([fe80::e0f8:e927:79f:232a%3]) with mapi id 15.20.4150.027; Tue, 25 May 2021
 10:35:26 +0000
Date:   Tue, 25 May 2021 18:35:14 +0800
From:   joeyli <jlee@suse.com>
To:     Jarkko Sakkinen <jarkko@kernel.org>
Cc:     "Lee, Chun-Yi" <joeyli.kernel@gmail.com>,
        David Howells <dhowells@redhat.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S . Miller" <davem@davemloft.net>,
        Ben Boeckel <me@benboeckel.net>,
        Randy Dunlap <rdunlap@infradead.org>,
        Malte Gell <malte.gell@gmx.de>,
        Varad Gautam <varad.gautam@suse.com>, keyrings@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8,1/4] X.509: Add CodeSigning extended key usage parsing
Message-ID: <20210525103514.GA32436@linux-l9pv.suse>
References: <20210524021540.18736-1-jlee@suse.com>
 <20210524021540.18736-2-jlee@suse.com>
 <YKwbrlXGePkinTHb@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YKwbrlXGePkinTHb@kernel.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Originating-IP: [124.11.22.254]
X-ClientProxiedBy: HK2PR02CA0211.apcprd02.prod.outlook.com
 (2603:1096:201:20::23) To VI1PR04MB7102.eurprd04.prod.outlook.com
 (2603:10a6:800:124::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from linux-l9pv.suse (124.11.22.254) by HK2PR02CA0211.apcprd02.prod.outlook.com (2603:1096:201:20::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.23 via Frontend Transport; Tue, 25 May 2021 10:35:22 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6f9e1484-d835-4cfb-fbae-08d91f68cee2
X-MS-TrafficTypeDiagnostic: VI1PR04MB7023:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB70232B94E32F2A366CCC8DB3A3259@VI1PR04MB7023.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 61tr1nMjD3BIEATGcTpsffjHacBvriy7cgJK2UySOS7B5CRBGOKqMTnQF+NeCjrsFe+Jr2c/Eat17a/0y4PuW5ZyraHxcUpwRZQPK3eQpHxkOaIjC+mEfXFLSJQY/WhzkZwQQ78bGGYMBFdBmTqIbhCtRITylC0fuWFJOtcNz8C+CArEhoA5edvlDyZT4eR4FAkDc2tixZg41qcNHZaXhhxV+KKHAWCY9tVxDkycQMSWNxZheFVE1D3axuUMg28TS7/NDBAeZrLcP6+lgE/RD7EK2AnLkq9rfMrazrrlFOtI/7Xky49kSKmvGyETe8apRtETAiWhTlHBnQllOcIram6WudSYPPaQu8K/4dPaZIAp80uZbw9/4k74HAKlAaXN2xCbNbUZ0QZcXt0QCLzncz3/SBxaR7yGSlsJXJU0BH95RdnBGn5xEQN71YBoCC48eUB5ruicglPTYStxo3q7Xtd/x+9I4Sah+jf75iDcxr7sHpkb7QdAiVLrp9ZvMxrx8PXr6EAl/PorIGIM+fODDeFc9FwDZT7gSjx2qNnLP8gZZABKqlhbZ/NhRKIlTQ0ee9zawmpI2fyhAO4KyyUrDejGSrcUqKRWPX0+GBvMYAJBKQRFiHLaTou5Ug2dRBqbXUilHQRmQ1LYy4/yhu4mctdP+TfRp3tKMm2YWbS7cpY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB7102.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(366004)(39860400002)(376002)(136003)(396003)(8886007)(8936002)(8676002)(478600001)(38100700002)(86362001)(55016002)(6666004)(66476007)(83380400001)(7416002)(26005)(9686003)(38350700002)(956004)(66946007)(36756003)(66556008)(186003)(54906003)(6916009)(4326008)(2906002)(52116002)(7696005)(6506007)(316002)(1076003)(33656002)(16526019)(5660300002)(43062005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?YYTH0UEWsYtL24LsXDFPmJpCb5XeRodyP2kgGOxN5W2P/eOXYboYkyhk58eI?=
 =?us-ascii?Q?nJXRe8JQPTs1Gw9ewIOydz9BGEV8jt4Yp9oTAoJhSnfUsWTICGMVP0Clt0aH?=
 =?us-ascii?Q?YIW6cMaZAfLrv2v5MpxP7fFHNBBfU0pQCetxI/YRjJgxnpdADL9Uqi70PUY6?=
 =?us-ascii?Q?NOqYamwJapfQX3JFG4AWZdxh+Tjp8aOb3eHwbvAKaYP5ZFF31OjUVoFnsdge?=
 =?us-ascii?Q?RXHuIUO85ZIIIzxMOVQjYigdCx+sFEZifw2aE27n0FSibEtvv6nFidoIhrWj?=
 =?us-ascii?Q?pOBsdDSgSmJmedOP5HLhCaUUfbF59U7/sSwxvMIOliHtK1prHEW0I6/KjNg4?=
 =?us-ascii?Q?iiXZIRHl5Cn9RAex3PaKe0nIWtna5Z1mjCQOgKpKRlSYJsbYVAZ4bfRn26cO?=
 =?us-ascii?Q?eWf2gqKJ/4oXyf12ZNj+UoRZVMYqzo9l1frcsWKDKJLp3QKcz9eQOIVihSrG?=
 =?us-ascii?Q?UC8g7pJYst9xBeZFP8qajC3Htt1M9gbkEE8Ram9apDarzGSJHGRF/+zsdL8m?=
 =?us-ascii?Q?XDKIdjQWN/1UGU25VbinjnaWfy4k22LYqZeEed+WOID7WdtUEalxU+oJ8Y5G?=
 =?us-ascii?Q?qpzho5Aj/pNcJCTQxqLeNEfzNeROxInX+Qa9oQhvYRpNBOLAnJSfs652VkaJ?=
 =?us-ascii?Q?7gnPiJAF3+VApIynCJclmDoivoCFzWV4nFHDbOgdoxeA+WCdcalr/DfRGAY3?=
 =?us-ascii?Q?z1Fs+46RLBv1bDwcjejNBW2TkuLtK3sp1bTOzkVDLkdXj+PubK3vP0+3TK9B?=
 =?us-ascii?Q?PcM/I2ABoNHxuuCT25N9p+5kLAt6joMtxlo0mZ5QZMhpMpzCz65Kd9gmCp/r?=
 =?us-ascii?Q?ObWgDF5e8FFGwoZa1IBkBpzKtmifQCmNPnJc/+9nUz7A7ju6fYzR+CL7VqD1?=
 =?us-ascii?Q?uyiFdv8UiGW5JSjkaHhuHAIIc99Qfl+nN3BAemcqsVJ/d3ijAJRJLx8eS5zY?=
 =?us-ascii?Q?BY07hE4KPnZMojLWe4ERw9Oo/hhWbsFP8LOB+x0/5PsiqHT1GvDFAOQ2q0M9?=
 =?us-ascii?Q?cvlWal+4k96DfqpjT2TU1Ehwya0AacSd7u8NmbC+UAPq6mWUbmUDnEMDpYHP?=
 =?us-ascii?Q?31i85ZTcf4x4zsY0AlsRfreLwJW1KD9QDqOv73apI3ixAvvPD6BAK/6M2hLj?=
 =?us-ascii?Q?zLnS/WLVQR0+Ko7+mNHA/jaLZ7fGuuniHZqKhN4GuoASWYqdcoqU2pPPICK5?=
 =?us-ascii?Q?aGNA181/3Qxg28cveiPfLjPt/vP9E44qOEhxt3LkotqPL9oJMPg+ppSF7atv?=
 =?us-ascii?Q?XIwAibmtq6m9aag05opwie2HGBx8d5fEhiULxb8PkMfVnp01fcJriucYVtNd?=
 =?us-ascii?Q?GhpEJ3gu3ioJwV1c32RNIcQD?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f9e1484-d835-4cfb-fbae-08d91f68cee2
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB7102.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2021 10:35:25.9479
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R3psW3emyl5bdpQHLQPdg8iCSBNmAcYs3IazQsY4DMQOLUTQihGoejcyqrqTxRm0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7023
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Hi Jarkko,

On Tue, May 25, 2021 at 12:33:34AM +0300, Jarkko Sakkinen wrote:
> On Mon, May 24, 2021 at 10:15:37AM +0800, Lee, Chun-Yi wrote:
> > This patch adds the logic for parsing the CodeSign extended key usage
> > extension in X.509. The parsing result will be set to the eku flag
> > which is carried by public key. It can be used in the PKCS#7
> > verification.
> > 
> > Signed-off-by: "Lee, Chun-Yi" <jlee@suse.com>
> > ---
> >  crypto/asymmetric_keys/x509_cert_parser.c | 25 +++++++++++++++++++++++++
> >  include/crypto/public_key.h               |  1 +
> >  include/linux/oid_registry.h              |  5 +++++
> >  3 files changed, 31 insertions(+)
> > 
> > diff --git a/crypto/asymmetric_keys/x509_cert_parser.c b/crypto/asymmetric_keys/x509_cert_parser.c
> > index 6d003096b5bc..996db9419474 100644
> > --- a/crypto/asymmetric_keys/x509_cert_parser.c
> > +++ b/crypto/asymmetric_keys/x509_cert_parser.c
> > @@ -542,6 +542,8 @@ int x509_process_extension(void *context, size_t hdrlen,
> >  	struct x509_parse_context *ctx = context;
> >  	struct asymmetric_key_id *kid;
> >  	const unsigned char *v = value;
> > +	int i = 0;
> > +	enum OID oid;
> >  
> >  	pr_debug("Extension: %u\n", ctx->last_oid);
> >  
> > @@ -571,6 +573,29 @@ int x509_process_extension(void *context, size_t hdrlen,
> >  		return 0;
> >  	}
> >  
> > +	if (ctx->last_oid == OID_extKeyUsage) {
> > +		if (vlen < 2 ||
> > +		    v[0] != ((ASN1_UNIV << 6) | ASN1_CONS_BIT | ASN1_SEQ) ||
> > +		    v[1] != vlen - 2)
> > +			return -EBADMSG;
> > +		i += 2;
> > +
> > +		while (i < vlen) {
> > +			/* A 10 bytes EKU OID Octet blob =
> > +			 * ASN1_OID + size byte + 8 bytes OID */
> > +			if ((i + 10) > vlen || v[i] != ASN1_OID || v[i + 1] != 8)
> > +				return -EBADMSG;
> > +
> > +			oid = look_up_OID(v + i + 2, v[i + 1]);
> > +			if (oid == OID_codeSigning) {
> > +				ctx->cert->pub->eku |= EKU_codeSigning;
> > +			}
> > +			i += 10;
> > +		}
> > +		pr_debug("extKeyUsage: %d\n", ctx->cert->pub->eku);
> > +		return 0;
> > +	}
> > +
> >  	return 0;
> >  }
> >  
> > diff --git a/include/crypto/public_key.h b/include/crypto/public_key.h
> > index 47accec68cb0..1ccaebe2a28b 100644
> > --- a/include/crypto/public_key.h
> > +++ b/include/crypto/public_key.h
> > @@ -28,6 +28,7 @@ struct public_key {
> >  	bool key_is_private;
> >  	const char *id_type;
> >  	const char *pkey_algo;
> > +	unsigned int eku : 9;      /* Extended Key Usage (9-bit) */
> 
> Why no just name it ext_key_usage? I get the use of "EKU" elsewhere
> but not in the variable name. Now you have to remember too much
> context when just looking at this (and it's even undocumented to
> add that).
>

Thanks for your suggestion. I will use a better name in next version.

Joey Lee
 
> >  };
> >  
> >  extern void public_key_free(struct public_key *key);
> > diff --git a/include/linux/oid_registry.h b/include/linux/oid_registry.h
> > index 461b7aa587ba..8c8935f0eb73 100644
> > --- a/include/linux/oid_registry.h
> > +++ b/include/linux/oid_registry.h
> > @@ -125,9 +125,14 @@ enum OID {
> >  	OID_TPMImportableKey,		/* 2.23.133.10.1.4 */
> >  	OID_TPMSealedData,		/* 2.23.133.10.1.5 */
> >  
> > +	/* Extended key purpose OIDs [RFC 5280] */
> > +	OID_codeSigning,		/* 1.3.6.1.5.5.7.3.3 */
> > +
> >  	OID__NR
> >  };
> >  
> > +#define EKU_codeSigning	(1 << 2)
> > +
> >  extern enum OID look_up_OID(const void *data, size_t datasize);
> >  extern int parse_OID(const void *data, size_t datasize, enum OID *oid);
> >  extern int sprint_oid(const void *, size_t, char *, size_t);
> > -- 
> > 2.16.4
> > 
> >005diaq6539262 
> 
> 
> /Jarkko

