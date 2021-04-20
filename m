Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5AE2436524E
	for <lists+keyrings@lfdr.de>; Tue, 20 Apr 2021 08:22:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230018AbhDTGX2 (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 20 Apr 2021 02:23:28 -0400
Received: from de-smtp-delivery-102.mimecast.com ([62.140.7.102]:28597 "EHLO
        de-smtp-delivery-102.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229577AbhDTGX1 (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Tue, 20 Apr 2021 02:23:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
        t=1618899775;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=gmhP26c5BQG/IIlFNv+rGGfYsYFJk0P5XKHdAJmWdZA=;
        b=NwtjY4Twi4vUMJtz23HjdVtHSzjvHOyTJr0pGwehp8Q5an6ARGcA15oG4kC1qhH6SMWHq/
        pFwrXjafR/ta+mvS7NqVVyXnuNcj659ZCKM60rRt8NT905hpMnTslIQdFwEb0b1cRbeJqp
        D270pSscg/p/IbUIUKJrx+Zw/w+X3hQ=
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2059.outbound.protection.outlook.com [104.47.14.59]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-40-lO70_3L5P8qzZECy7WyM7A-1; Tue, 20 Apr 2021 08:22:54 +0200
X-MC-Unique: lO70_3L5P8qzZECy7WyM7A-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CZ/NDxDAHS8tNK/Shh811+WA10i7Fno9fYUNxNqOCVAXm2o73qn4GT/QGd2ZdPRcgvibFGVUWCFG0cdUtngQ3s7v7Lgt6O7Uz/YgX7ELZA2Wu3m/a6Om6E1XEE/zfuTNVUyt7CHwzgwhjrCT3rKWh+PyOOsrtYsangXH410ziHyEOseYHQj6euvwDptBddVUkaSEHf83X6aRx3gvByQHUMrVHCjSwhEwzYLFbppm3cw+SpdBtwq10V7owGOQrm/zjEUA9I/IR7W+0kwfEUEKkTNK5G9WV7dQPnrrPqaC4FFKvWGYmBq9GNwrUHg6BMbeP/KpvLfyRr7Wc8gKvj2Nmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8XXLxCf4Fw7KoG+J7uc7wyvzDm3plQbPa6uNu6rCpuA=;
 b=EO4MjRgZS8sp8G49cUsicJU5SSqfTEwpxipDqH3bIwj27E5HN3/AL1vn5qPg8hNi0rSnRBxRBBNlgHYdk3ZDNQiW33Wln2Q/rIGMRxIxF2h9LIdrNgPNcHhGz4hPF6xLhHNufq4pH8YMzn+EmBKdvUVfycJj/KUeyGVJAt6JQFkdngHZbRib/XIcHinIw42s0GQuxPvEM9LFGpWFNChQ9mx7csK0TkSHS+jvzhAcogkjhyYKqf8U5TDeQsl1h8bDGe5yo6uLl5MHt4dLJdNRxHfWUYV00x9PAY+0wiUr4ZH6uw2xldCnxf4fYrGxPb9zSFoFMl6RX4M/v1U78S67yA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=suse.com;
Received: from VI1PR04MB7102.eurprd04.prod.outlook.com (2603:10a6:800:124::12)
 by VI1PR04MB6064.eurprd04.prod.outlook.com (2603:10a6:803:f4::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.19; Tue, 20 Apr
 2021 06:22:52 +0000
Received: from VI1PR04MB7102.eurprd04.prod.outlook.com
 ([fe80::8c04:f8bc:87d0:f511]) by VI1PR04MB7102.eurprd04.prod.outlook.com
 ([fe80::8c04:f8bc:87d0:f511%9]) with mapi id 15.20.4065.020; Tue, 20 Apr 2021
 06:22:52 +0000
Date:   Tue, 20 Apr 2021 14:22:28 +0800
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
Subject: Re: [PATCH 2/4] PKCS#7: Check codeSigning EKU for kernel module and
 kexec pe verification
Message-ID: <20210420062228.GA19927@linux-l9pv.suse>
References: <20210409024656.8083-1-jlee@suse.com>
 <20210409024656.8083-3-jlee@suse.com>
 <27e7e83b-5754-956c-c314-9d4d0ae605b0@suse.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <27e7e83b-5754-956c-c314-9d4d0ae605b0@suse.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Originating-IP: [124.11.22.254]
X-ClientProxiedBy: HK2PR0401CA0001.apcprd04.prod.outlook.com
 (2603:1096:202:2::11) To VI1PR04MB7102.eurprd04.prod.outlook.com
 (2603:10a6:800:124::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from linux-l9pv.suse (124.11.22.254) by HK2PR0401CA0001.apcprd04.prod.outlook.com (2603:1096:202:2::11) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16 via Frontend Transport; Tue, 20 Apr 2021 06:22:48 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 94b5b572-b61b-4e38-7f34-08d903c4ba14
X-MS-TrafficTypeDiagnostic: VI1PR04MB6064:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB606487D8DCCB5CCE73ECBCB4A3489@VI1PR04MB6064.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uBmigwXjeex6e2yq8DUVJD8FprhJ6puQDgJe5Ujvoszfs3tr805kA/iyJTPaaJLg0SsRYGJQoP039egEd0xE5zbkbmeNiZdY21/rRazR3ULMGOZqgXE09GWukya1tBQNPGQbmjVUbGVY5vKhoqPNauovYzxGU4STCKL5YlnkfuvsMe1XDHfmOBEV2S6QUuVZo3D3nSbrNQG5oKgzhGS6E+ruSK62Q8rqx7fT90P99+BWfOVQqk7LmX8f8Z0llBeOj9R19pQmuYBAlvQO0NXCcFskpBdTyW8HdfWvsptukwhYOky7JVExbZrLp0QDVBUlUfLGrq5KVEUb3NzffzYBJ2BJmWgq1W5wtsbN/TTq8WZtMl5tfUksUSwAAJWBAixJQn1gJb0gmZhTdUw5SDuKZgxNYpbYOsOO17GrKNGxf2l2QJjkeOC6fdX8SrBhXrVSyA/XGZuiS1Ku753iFf5kH2VvXZgKU/sflYCdZjpajYYU8ZEy53QbV2/RqtXV4BM9YrA1KNYGJRwV6X+ST6GL36LnS6QAhRKeXF7uRPW5sTtfCf21OdX460q74wXtPkC9E138d0C9DdXjkl6efQeKmGr6cLpREd+8efI9bWV7CMvwWhJk809dCogMQVdhMSRkesHO5Pr59ku7Iq+GLyUWlSZz4/wMmiQwU8FnP8TohU9Lbu31ILt370lR2boLgtSQ
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB7102.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(376002)(39850400004)(366004)(136003)(396003)(38350700002)(316002)(66946007)(1076003)(38100700002)(6862004)(9686003)(66556008)(33656002)(7696005)(478600001)(83380400001)(6506007)(66476007)(52116002)(5660300002)(7416002)(54906003)(36756003)(66574015)(15650500001)(956004)(2906002)(16526019)(186003)(53546011)(86362001)(55016002)(6666004)(8936002)(8676002)(6636002)(4326008)(26005)(8886007)(43062005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?7MGB8lyP5vFkY5/Awj7IWTFR+0eHyRH0Gy+OrL0qxG2BVEtzqnO+UbtnPlmk?=
 =?us-ascii?Q?H9R7ZAtv2lN6JIhjJkR7n5H4g5gwsAe7sZFlDenIr/f8F3DbHIiox8xo9LQg?=
 =?us-ascii?Q?qnK8gbbOqK2U6j6YB1xXNOMul92NkMkKLCIaSw73VDyN6u71AlgrwjRTJG9i?=
 =?us-ascii?Q?jKcDcG5enDJ7F71RGjf/ygrN8pGix3m1Lg2E41gZxoNQd46Ie0QznR9h9aul?=
 =?us-ascii?Q?1TZESaqxH1hjahdHeCD3kumgMy6uElowx3XS4/9M+SY/FoRcOsmA89kpas8p?=
 =?us-ascii?Q?6n8+0/LodD44qNd9e8jMCh4rEr+GnxQupeVuqHF2pngOU5hgoS3NVSnF5TPi?=
 =?us-ascii?Q?yrx0bgqPrN/CcAloxb5UhBvkI0kOI3VprAnypp5m9UgYLzxuASEIDnKtlArB?=
 =?us-ascii?Q?rzIqOpv2aPT8QS1squOwWoCOFrjIfmN1jYeV5dMbl6jTb3RIOBd0dMFOXk7C?=
 =?us-ascii?Q?2UoMc8934IUxXkYN/9Cjde2v/aTo5c/bAe+kBDgaAxH2mLWosQx55dfQCxkW?=
 =?us-ascii?Q?PzlyDK/Y0tqYikjDuzGnUcL+elxrt/UL4YkM/xlHwcoVTrh8gNGQEDAIfdTV?=
 =?us-ascii?Q?c0gmi9AxCY+w6SoLPFCsX2qdDznTLG2l37vB5wXqw6eSPfCEcPfNno54l0hM?=
 =?us-ascii?Q?lKAggGFlzYlogKgW1oEKJRXdq4qDQQz4Gn+xTXcnm0rcSmWnS1xTZ/V98/V0?=
 =?us-ascii?Q?fE9C4wsi7UzeVvUERcntVrqYFGOZMY20Htxni4b6FWqcI0SB0REmwaDP17tD?=
 =?us-ascii?Q?1zP1DQe2orIR8qp9RFHomsHtaEWmkk7CPa1PvFUwnbqXgp9W4jBfpZ1G7fkW?=
 =?us-ascii?Q?+d7lKMMERS1NgDwEY3s/idSvx20VhVQ5GynrGwQwrXN7hyW+wVooA4WO7uoX?=
 =?us-ascii?Q?76+SompwZleqKFcW4XspJTt/5aqw0pzf2tmUjpm3bk8dA8a2GxB/NcApLTWu?=
 =?us-ascii?Q?fvSL9PjS3l50xvS+teDk54S4za8Vwml6iTLvAHrnq3vbTubNsAytbBwoB6xm?=
 =?us-ascii?Q?yDhlv7D9eCLCMc6LYLfL7OWGma1qM4qgkxpzTOKgagahVFprJdILd56n50CZ?=
 =?us-ascii?Q?wDzo+tYTLOwJkcLqSFpjm8CqOuYBLWKo6eemWQW79MNA1qpX9hRdVHR8tREC?=
 =?us-ascii?Q?UaGMvvFVirIQk4LXTJJsb45410+tPhHBvhgK+ttqxjN08JNFOJ7XCKA24fNW?=
 =?us-ascii?Q?lpF1mGpSB5Q8DiRFnUGocLeGxNZwhR74Iu0bsFZNHC5F69IqyudKov3IqtWo?=
 =?us-ascii?Q?D4DZ+dNqVi2lw1uCd1kno9pQccEhu1kXEdTsZqnL+5fxpbdcTRYkH3d7rW/q?=
 =?us-ascii?Q?Ii0xfP7Z5y7LSaemuwo0wtlI?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94b5b572-b61b-4e38-7f34-08d903c4ba14
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB7102.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2021 06:22:52.2862
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6MYpBMdjm9Y6O84T5/Zp2moFzbSjNDXtomWxb7zA6ZC/p6NWAj5zZ9Cyb6XP0SXy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6064
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Hi Varad,

Thanks for your review!

On Thu, Apr 15, 2021 at 02:08:32PM +0200, Varad Gautam wrote:
> Hi Joey,
>=20
> On 4/9/21 4:46 AM, Lee, Chun-Yi wrote:
> > This patch adds the logic for checking the CodeSigning extended
> > key usage when verifying signature of kernel module or
> > kexec PE binary in PKCS#7.
> >=20
> > Signed-off-by: "Lee, Chun-Yi" <jlee@suse.com>
> > ---
> >  certs/system_keyring.c               |  2 +-
> >  crypto/asymmetric_keys/Kconfig       |  9 +++++++++
> >  crypto/asymmetric_keys/pkcs7_trust.c | 37 ++++++++++++++++++++++++++++=
+++++---
> >  include/crypto/pkcs7.h               |  3 ++-
> >  4 files changed, 46 insertions(+), 5 deletions(-)
> >=20
> > diff --git a/certs/system_keyring.c b/certs/system_keyring.c
> > index 4b693da488f1..c9f8bca0b0d3 100644
> > --- a/certs/system_keyring.c
> > +++ b/certs/system_keyring.c
> > @@ -243,7 +243,7 @@ int verify_pkcs7_message_sig(const void *data, size=
_t len,
> >  			goto error;
> >  		}
> >  	}
> > -	ret =3D pkcs7_validate_trust(pkcs7, trusted_keys);
> > +	ret =3D pkcs7_validate_trust(pkcs7, trusted_keys, usage);
> >  	if (ret < 0) {
> >  		if (ret =3D=3D -ENOKEY)
> >  			pr_devel("PKCS#7 signature not signed with a trusted key\n");
> > diff --git a/crypto/asymmetric_keys/Kconfig b/crypto/asymmetric_keys/Kc=
onfig
> > index 1f1f004dc757..1754812df989 100644
> > --- a/crypto/asymmetric_keys/Kconfig
> > +++ b/crypto/asymmetric_keys/Kconfig
> > @@ -96,4 +96,13 @@ config SIGNED_PE_FILE_VERIFICATION
> >  	  This option provides support for verifying the signature(s) on a
> >  	  signed PE binary.
> > =20
> > +config CHECK_CODESIGN_EKU
> > +	bool "Check codeSigning extended key usage"
> > +	depends on PKCS7_MESSAGE_PARSER=3Dy
> > +	depends on SYSTEM_DATA_VERIFICATION
> > +	help
> > +	  This option provides support for checking the codeSigning extended
> > +	  key usage when verifying the signature in PKCS#7. It affects kernel
> > +	  module verification and kexec PE binary verification.
> > +
> >  endif # ASYMMETRIC_KEY_TYPE
> > diff --git a/crypto/asymmetric_keys/pkcs7_trust.c b/crypto/asymmetric_k=
eys/pkcs7_trust.c
> > index b531df2013c4..077bfef928b6 100644
> > --- a/crypto/asymmetric_keys/pkcs7_trust.c
> > +++ b/crypto/asymmetric_keys/pkcs7_trust.c
> > @@ -16,12 +16,36 @@
> >  #include <crypto/public_key.h>
> >  #include "pkcs7_parser.h"
> > =20
> > +#ifdef CONFIG_CHECK_CODESIGN_EKU
> > +static bool check_codesign_eku(struct key *key,
> > +			     enum key_being_used_for usage)
> > +{
> > +	struct public_key *public_key =3D key->payload.data[asym_crypto];
> > +
> > +	switch (usage) {
> > +	case VERIFYING_MODULE_SIGNATURE:
> > +	case VERIFYING_KEXEC_PE_SIGNATURE:
> > +		return !!(public_key->eku & EKU_codeSigning);
> > +	default:
> > +		break;
> > +	}
> > +	return true;
> > +}
> > +#else
> > +static bool check_codesign_eku(struct key *key,
> > +			     enum key_being_used_for usage)
> > +{
> > +	return true;
> > +}
> > +#endif
> > +
> >  /*
> >   * Check the trust on one PKCS#7 SignedInfo block.
> >   */
> >  static int pkcs7_validate_trust_one(struct pkcs7_message *pkcs7,
> >  				    struct pkcs7_signed_info *sinfo,
> > -				    struct key *trust_keyring)
> > +				    struct key *trust_keyring,
> > +				    enum key_being_used_for usage)
> >  {
> >  	struct public_key_signature *sig =3D sinfo->sig;
> >  	struct x509_certificate *x509, *last =3D NULL, *p;
> > @@ -112,6 +136,12 @@ static int pkcs7_validate_trust_one(struct pkcs7_m=
essage *pkcs7,
> >  	return -ENOKEY;
> > =20
> >  matched:
> > +	if (!check_codesign_eku(key, usage)) {
>=20
> Perhaps this can be a generic check_eku_usage() call, with codesigning as=
 one of the
> things it can check for.
>

Because only codesign EKU be checked now. So I prefer to keep it
as my current implementation until there have other EKU requirement.=20
=20
> > +		pr_warn("sinfo %u: The signer %x key is not CodeSigning\n",
> > +			sinfo->index, key_serial(key));
> > +		key_put(key);
> > +		return -ENOKEY;
> > +	}
> >  	ret =3D verify_signature(key, sig);
> >  	key_put(key);
> >  	if (ret < 0) {
> > @@ -156,7 +186,8 @@ static int pkcs7_validate_trust_one(struct pkcs7_me=
ssage *pkcs7,
> >   * May also return -ENOMEM.
> >   */
> >  int pkcs7_validate_trust(struct pkcs7_message *pkcs7,
> > -			 struct key *trust_keyring)
> > +			 struct key *trust_keyring,
> > +			 enum key_being_used_for usage)
>=20
> Please also update the comment above to mention the `usage` parameter.
>=20
> Regards,
> Varad

I will update it to the comment. Thanks!

Joey Lee

>=20
> >  {
> >  	struct pkcs7_signed_info *sinfo;
> >  	struct x509_certificate *p;
> > @@ -167,7 +198,7 @@ int pkcs7_validate_trust(struct pkcs7_message *pkcs=
7,
> >  		p->seen =3D false;
> > =20
> >  	for (sinfo =3D pkcs7->signed_infos; sinfo; sinfo =3D sinfo->next) {
> > -		ret =3D pkcs7_validate_trust_one(pkcs7, sinfo, trust_keyring);
> > +		ret =3D pkcs7_validate_trust_one(pkcs7, sinfo, trust_keyring, usage)=
;
> >  		switch (ret) {
> >  		case -ENOKEY:
> >  			continue;
> > diff --git a/include/crypto/pkcs7.h b/include/crypto/pkcs7.h
> > index 38ec7f5f9041..b3b48240ba73 100644
> > --- a/include/crypto/pkcs7.h
> > +++ b/include/crypto/pkcs7.h
> > @@ -30,7 +30,8 @@ extern int pkcs7_get_content_data(const struct pkcs7_=
message *pkcs7,
> >   * pkcs7_trust.c
> >   */
> >  extern int pkcs7_validate_trust(struct pkcs7_message *pkcs7,
> > -				struct key *trust_keyring);
> > +				struct key *trust_keyring,
> > +				enum key_being_used_for usage);
> > =20
> >  /*
> >   * pkcs7_verify.c
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

