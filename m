Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D469F35F895
	for <lists+keyrings@lfdr.de>; Wed, 14 Apr 2021 18:08:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351273AbhDNQB4 (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 14 Apr 2021 12:01:56 -0400
Received: from de-smtp-delivery-102.mimecast.com ([194.104.109.102]:44309 "EHLO
        de-smtp-delivery-102.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1351193AbhDNQBy (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 14 Apr 2021 12:01:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
        t=1618416092;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=9R2Eq20W4H/jJEKkqxSEeuQxVkJtlKa3C8QJlyC9QvQ=;
        b=nWoBbnNZKRXQesWFIoLNzMypFPExnOCJsib3G4mn6KQBvfMQCqzFY49zIIukdZEV71R9VU
        HE3hBPnBgnmxhHDXcQrqKEsMXKX8NtTHKVyf5dyha3cPzqGId+t/d0rt8zmV88fgljAWBp
        EnZgxUgMenUPLYKcY1NIpHzHr4t2Ugo=
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2054.outbound.protection.outlook.com [104.47.13.54]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-3-0nAaMjtCNyKq2IG8LsJ-zA-1;
 Wed, 14 Apr 2021 18:01:30 +0200
X-MC-Unique: 0nAaMjtCNyKq2IG8LsJ-zA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fxMLGwc/bLr0m7TK0JyavUT4FmRJ/KYfpRgXfCa3I4To504g1zxBw7Lg3EMkChiALPbodBjx+iTtyCc4OPZjM9P+PpCSRbZjmSafdcX3wbm9rtEEcyi/LBUW3YreN02BcVn3XOU1rrjyIhNtSNHcNR0Et+ohTQH3qygiQrDP8NmXHNx+k7vKFbz/cuw6jqnZU1Yqbh555pssMAoiWYNBqMsWA8+lv6XoKTKcnwweXOf2l2+rcnE+Ng6H/yItYno6xYsvamIyp0lbWmffmiCSn00PXKpE18XgAZVkaxyk2plNltgra2QYO4jsh+OIOeyQyojNwRpRF5vjWumKoFDJbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X+x3xi0YyVskUpmagzI8jHwbNttwd68/H+gnCg3h+rk=;
 b=cuRvoFWstxU88ObEytbjLfMAoVI9ANi33EXQfU4/LKZS+r+L26mBNWlqE0mYwwaa4IUL1X+RA6cSjxPZqki65LNqunWfeS4MfHATfkxQoxg++BjTR9x6qmDcSnstQxKCyq3/+7di4MgrHe5H8DUfOnJHLUkjKg1FjMrDiurzf4U10HnKrnplfsIQRcSYBQywoMf8LzUHdzCkOyrMcBWOUgnEuhgXUu854dE6NgMVo5cPyz8Fu6qf4Ctr0cEjWwdkcvaCJ2MjCeqqrScTc0a+7LFoD2iPoH0gKnc2qGUT3TzmT56mDf6TxACzTn0PQB/qdR+Y613zNiVYByyCH64kug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=suse.com;
Received: from VI1PR04MB7102.eurprd04.prod.outlook.com (2603:10a6:800:124::12)
 by VI1PR0401MB2413.eurprd04.prod.outlook.com (2603:10a6:800:2a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.17; Wed, 14 Apr
 2021 16:01:28 +0000
Received: from VI1PR04MB7102.eurprd04.prod.outlook.com
 ([fe80::8c04:f8bc:87d0:f511]) by VI1PR04MB7102.eurprd04.prod.outlook.com
 ([fe80::8c04:f8bc:87d0:f511%8]) with mapi id 15.20.4020.022; Wed, 14 Apr 2021
 16:01:28 +0000
Date:   Thu, 15 Apr 2021 00:01:15 +0800
From:   joeyli <jlee@suse.com>
To:     Varad Gautam <varad.gautam@suse.com>
CC:     "Lee, Chun-Yi" <joeyli.kernel@gmail.com>,
        David Howells <dhowells@redhat.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S . Miller" <davem@davemloft.net>,
        Ben Boeckel <me@benboeckel.net>,
        Randy Dunlap <rdunlap@infradead.org>,
        Malte Gell <malte.gell@gmx.de>, keyrings@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] X.509: Add CodeSigning extended key usage parsing
Message-ID: <20210414160115.GC25844@linux-l9pv.suse>
References: <20210309091044.2298-1-jlee@suse.com>
 <20210309091044.2298-2-jlee@suse.com>
 <5eb3e055-8e41-80b5-8caf-c80bbf2f4068@suse.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <5eb3e055-8e41-80b5-8caf-c80bbf2f4068@suse.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Originating-IP: [124.11.22.254]
X-ClientProxiedBy: HK2PR0401CA0009.apcprd04.prod.outlook.com
 (2603:1096:202:2::19) To VI1PR04MB7102.eurprd04.prod.outlook.com
 (2603:10a6:800:124::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from linux-l9pv.suse (124.11.22.254) by HK2PR0401CA0009.apcprd04.prod.outlook.com (2603:1096:202:2::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16 via Frontend Transport; Wed, 14 Apr 2021 16:01:24 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 84a02f73-a04d-49f1-50c7-08d8ff5e8fc7
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2413:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0401MB2413C5A069B745203E6076E2A34E9@VI1PR0401MB2413.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3276;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xHiQYXnXMzggw7PVU4/X3KpgZx0cU1/L/VOUfiUFGylm3Wz7lTRSG6BzE7JcoRhiBW0djCpryVWhUn+7E/e8jveHClW3xmzGdNhrnwWIm6XS/FxUXj/2Oicdf9QFPL+6PCLWhkf5fbIWrdIEDDxn2yQnxmAgOx28yGq3qerctmin7H1HosXtkXIHw4oVJyF/0J5k79kafAXMlLcUyMbL96tZk4Pa/vzsICu8UlOvcCIdu+ARfpdaM/SqvuDzZwDGGgobjOVMVPw3Y3gUMKnHf15cs8occ9+92AdyYNOIyxo/a23maHooT/Cn+Kx9DK2AdSUPbV7d0hBYmz4tVY0pl8dEn2cFVJRh2al9r8zj8i+ysTMEbBS9/WzjSo7LCW1cuaetnwRt8wOUhJJQ9mMo+EfJh1kymQQ8oHTMuRfywsA9zdVeQutV5YPQLoajjO0LQnI7JlPBjHRPN1lf2Z0Ugk9Vf6xoq9IZo/gMwSDm66mWyIIAYv5YmcL8vMj47kxNWycw0pbFp2TbKfPvK9OtEyrds/pAOftaUi9CYqD2n/1tiircJSHgNpkKeBEpE5KRBL20/1+fQedX7vpNG0VTN2beXb+Wi841HiNLUbgZSnY+XPoq5aNsrT0P3m4bNmdOFmpIdOYKOc3Z6Zfme7k0j8baqxPfXrTJwUO8T1VUYZSpzwqIppKt6OHdQRbjz1q7
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB7102.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(39850400004)(136003)(366004)(396003)(376002)(54906003)(316002)(956004)(38350700002)(9686003)(36756003)(4326008)(53546011)(26005)(1076003)(52116002)(33656002)(7696005)(38100700002)(16526019)(83380400001)(8676002)(478600001)(6666004)(66574015)(6862004)(5660300002)(8936002)(66556008)(55016002)(6636002)(2906002)(6506007)(186003)(86362001)(66476007)(7416002)(8886007)(66946007)(43062005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?XdmeYVEwHP1HHgt6yssjRk77ck0enNu1QaSh64MjUrR8sHFKP5RcFk2lww2V?=
 =?us-ascii?Q?W7QgMled0PvGZ+k9MiW6hozcsqDForaAcFHCgquRnWPMcGWXPkfmZ00vazwy?=
 =?us-ascii?Q?Hl4yrrP8Vb9Xkt48Q/qi2lwQgoA+0z2hJhMKE2jcU3RvPWn3nRJ9QmzjJf6U?=
 =?us-ascii?Q?ndzoeqzdtbla0M5pDOVa++3DtA757QKWdg/6AtlZ5Gg7Hc2RS1fW7blf9p40?=
 =?us-ascii?Q?Rt+fm1mQsvKQAYX7GyAgdIiYCnpCMOVzRixWqn/KIBIhSBCldjHswjQFEDFD?=
 =?us-ascii?Q?lmFWRe2XPz5WQq2di5YsrL7A6+bfVTtGf5PKN0g/IHWXtMTfmEIsd0ynGeYt?=
 =?us-ascii?Q?MTqCm/sPaCdnyTIGuGZLnFwGSRElaKD5wTPxVDF1P0Udlkr6ry9mwXZrz7pP?=
 =?us-ascii?Q?KwYsnLdHez/cV/RrXTGDGkdnOprvY1WkBs9st1MXsEpPu0tQUla2iDSbpZwb?=
 =?us-ascii?Q?Vm3vS9Y3GuuXyCJos8Rkif+4Hr0f+sOVHiN5o2nQxNhwgMAoSp2EqIZ06IbY?=
 =?us-ascii?Q?RH2y9G9l0syQBp3ONrga16fiTRJUbDGFqO6NmC/2TDqIH8TpR2EfXFpG6KpI?=
 =?us-ascii?Q?uaBPNYDN+y0RUYSLj87KZHqU9NoGJ6ii42eMktWBFGKmRH55S2swxY6OF9CC?=
 =?us-ascii?Q?UE0MzFE6kdArAXSpdKdyDbnu11fvD9FehkN6kFbjwxkEGDrGXEHJP3wBYUk7?=
 =?us-ascii?Q?3vVP0UqlcWkPOFGFTiKHshOUVpe6rL/W9ZUqG+fPWMnX7kfqVd5hhag2LnWo?=
 =?us-ascii?Q?xKAXfL13nUJp6X4s9FPVLcQQYjH4+tnj7JUaoJi9sIzfpkVaIgZc/cnpKmhi?=
 =?us-ascii?Q?E/WfmnCOqJx03T6f4C/Ji1+jFZFARpcNCRPIt7oYVNPc++l8qDovLwIDeOfC?=
 =?us-ascii?Q?esW7NMcRw3eG4DWKoU+ztEuI/6Ny8x8fdArmfLN4MEkmIzUrXFJSKN8mJhhk?=
 =?us-ascii?Q?mO+WBIYZHrA4+MPpysPiEuKszwex/GHUzIZHqS6Q4LkTSNxcH3p/B97zlXcR?=
 =?us-ascii?Q?V9EdBxdKwN/bkWgQ9i19q0i+TCJdJh1xAsD04Pe2pNeISIejxMGrBs5Wbyx1?=
 =?us-ascii?Q?VQSaUbIjOMHV+7hGD19TCSjRNB6kfXopej9XrKfinLwHcFZowmqdB+iTIlk8?=
 =?us-ascii?Q?ToFRp4DNeY/PIxdoqh2nWWRZ7E1KvqQLKgJqv9U6q9++F2q4MC0/3JWgRuSm?=
 =?us-ascii?Q?nGcOsWuT6YdJTKOKS2A0drmaOZD7ryjJGPcsOHeqSFIhS0Vyuv4ahOwZN1QI?=
 =?us-ascii?Q?mHUhpHMAwzXcq5F2QqwqopkF1sD+D1Co0666WalMIKkiCoABZZHV4lZbUYy4?=
 =?us-ascii?Q?0HjStEXIGCHet8ZZwihEqtnf?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84a02f73-a04d-49f1-50c7-08d8ff5e8fc7
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB7102.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2021 16:01:27.9637
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0OYrxsPoLhsF5cJjCcL1NvkFaJTSNNqB91cLagvYhGktizUwr7lamOOC3isw/KDJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2413
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Hi Varad,=20

Thanks for your review!

On Tue, Apr 13, 2021 at 04:28:11PM +0200, Varad Gautam wrote:
> Hi,
>=20
> On 3/9/21 10:10 AM, Lee, Chun-Yi wrote:
> > This patch adds the logic for parsing the CodeSign extended key usage
> > extension in X.509. The parsing result will be set to the eku flag
> > which is carried by public key. It can be used in the PKCS#7
> > verification.
> >=20
> > Signed-off-by: "Lee, Chun-Yi" <jlee@suse.com>
> > ---
> >  crypto/asymmetric_keys/x509_cert_parser.c | 24 +++++++++++++++++++++++=
+
> >  include/crypto/public_key.h               |  1 +
> >  include/linux/oid_registry.h              |  5 +++++
> >  3 files changed, 30 insertions(+)
> >=20
> > diff --git a/crypto/asymmetric_keys/x509_cert_parser.c b/crypto/asymmet=
ric_keys/x509_cert_parser.c
> > index 52c9b455fc7d..65721313b265 100644
> > --- a/crypto/asymmetric_keys/x509_cert_parser.c
> > +++ b/crypto/asymmetric_keys/x509_cert_parser.c
> > @@ -497,6 +497,8 @@ int x509_process_extension(void *context, size_t hd=
rlen,
> >  	struct x509_parse_context *ctx =3D context;
> >  	struct asymmetric_key_id *kid;
> >  	const unsigned char *v =3D value;
> > +	int i =3D 0;
> > +	enum OID oid;
> > =20
> >  	pr_debug("Extension: %u\n", ctx->last_oid);
> > =20
> > @@ -526,6 +528,28 @@ int x509_process_extension(void *context, size_t h=
drlen,
> >  		return 0;
> >  	}
> > =20
> > +	if (ctx->last_oid =3D=3D OID_extKeyUsage) {
> > +		if (v[0] !=3D ((ASN1_UNIV << 6) | ASN1_CONS_BIT | ASN1_SEQ) ||
> > +		    v[1] !=3D vlen - 2)
>=20
> A bad cert might get here with vlen < 2, which would cause indexing into =
v to break.
> Please add a check for vlen >=3D 2 before this.
>

I will add the check, thanks for your suggestion!
=20
> > +			return -EBADMSG;
> > +		i +=3D 2;
> > +
> > +		while (i < vlen) {
> > +			/* A 10 bytes EKU OID Octet blob =3D
> > +			 * ASN1_OID + size byte + 8 bytes OID */
> > +			if (v[i] !=3D ASN1_OID || v[i + 1] !=3D 8 || (i + 10) > vlen)
>=20
> Same here, for i =3D=3D (vlen - 1), v[i + 1] would fetch outside of v. Or=
, does the
> ASN.1 layout protect against this?
>

I will move the "(i + 10) > vlen" to the front of "v[i + 1] !=3D 8". It can=
 avoid
that the last octet blob is less than 10 bytes.

Thanks!
Joey Lee
=20
> > +				return -EBADMSG;
> > +
> > +			oid =3D look_up_OID(v + i + 2, v[i + 1]);
> > +			if (oid =3D=3D OID_codeSigning) {
> > +				ctx->cert->pub->eku |=3D EKU_codeSigning;
> > +			}
> > +			i +=3D 10;
> > +		}
> > +		pr_debug("extKeyUsage: %d\n", ctx->cert->pub->eku);
> > +		return 0;
> > +	}
> > +
> >  	return 0;
> >  }
> > =20
> > diff --git a/include/crypto/public_key.h b/include/crypto/public_key.h
> > index 47accec68cb0..1ccaebe2a28b 100644
> > --- a/include/crypto/public_key.h
> > +++ b/include/crypto/public_key.h
> > @@ -28,6 +28,7 @@ struct public_key {
> >  	bool key_is_private;
> >  	const char *id_type;
> >  	const char *pkey_algo;
> > +	unsigned int eku : 9;      /* Extended Key Usage (9-bit) */
> >  };
> > =20
> >  extern void public_key_free(struct public_key *key);
> > diff --git a/include/linux/oid_registry.h b/include/linux/oid_registry.=
h
> > index 4462ed2c18cd..e20e8eb53b21 100644
> > --- a/include/linux/oid_registry.h
> > +++ b/include/linux/oid_registry.h
> > @@ -113,9 +113,14 @@ enum OID {
> >  	OID_SM2_with_SM3,		/* 1.2.156.10197.1.501 */
> >  	OID_sm3WithRSAEncryption,	/* 1.2.156.10197.1.504 */
> > =20
> > +	/* Extended key purpose OIDs [RFC 5280] */
> > +	OID_codeSigning,		/* 1.3.6.1.5.5.7.3.3 */
> > +
> >  	OID__NR
> >  };
> > =20
> > +#define EKU_codeSigning	(1 << 2)
> > +
> >  extern enum OID look_up_OID(const void *data, size_t datasize);
> >  extern int sprint_oid(const void *, size_t, char *, size_t);
> >  extern int sprint_OID(enum OID, char *, size_t);
> >=20
>=20
> --=20
> SUSE Software Solutions Germany GmbH
> Maxfeldstr. 5
> 90409 N=FCrnberg
> Germany
>=20
> HRB 36809, AG N=FCrnberg
> Gesch=E4ftsf=FChrer: Felix Imend=F6rffer

