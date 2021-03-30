Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CCC8234F225
	for <lists+keyrings@lfdr.de>; Tue, 30 Mar 2021 22:30:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232490AbhC3U3x (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 30 Mar 2021 16:29:53 -0400
Received: from de-smtp-delivery-102.mimecast.com ([194.104.109.102]:23603 "EHLO
        de-smtp-delivery-102.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232388AbhC3U3T (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Tue, 30 Mar 2021 16:29:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
        t=1617136158;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=qdem7GtNQJjxheN5+rkLdDitmma+4OvEEv1YRqVbfm0=;
        b=aFoCxQLvWYc7B+CuXN0fwG1ZdEqMEIlmJd8NDzHkwGxyfdMDH1ih0/RNAcm1ElY1fRjEwU
        KbkBD0465CUNAZqBfZNOUNdABr8/ODkvPZwyJvZ3phgZooYpcFeCeOY2vr1N+2SHYdU2Xf
        ipfcbKqSgC5YeuIkudkmy3V04hknQ6E=
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2171.outbound.protection.outlook.com [104.47.17.171])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-19-Hb5A568aOI28vK-dLy0YvA-1; Tue, 30 Mar 2021 22:29:17 +0200
X-MC-Unique: Hb5A568aOI28vK-dLy0YvA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XLURc1z8hYkbgMzQfwkSdnk6x9n05gzac14lTq9KsMuS8ppZIOo4GgkDkrrROyezDH9Px9zPV47305eZh3xr4dFhueSUr4B8cOQd83SxzYktaF2nFnoSIwIG2e5kDv1NT9gDLCyKZho68O6WldnbFjcbaqPI629YwWF1ZViN9UDQBtrSl5XNep4vM0LUezbcFDiwbGtgpgf9XEKC3YMkyI+/rrOzZHxzOr3BuRwlfUKxdKXhMr54ogbYNBaG0agZ8h3G1ma/b6sGxyvndbVivEN+Ab+N3owsK4/vBCtRSvOVdOJ6ZoRrqyxtgJiwxUwEDv3s/+mZRJqqq8yQ7EyKFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hW4LGOtzXaKr/7M6mGxIocq0Qm+7pVnmjJ8Jl2t662s=;
 b=MJhWNZqyma9+9SCPbLOxBGjmlN/CfpgLP6Fk6DFtX41APUwk2gH7eKCcUYyu8+ADogBRwkh+eMXRXr8/8J3VDPqCO4yDl91uPm78ymKdZMZ1vgG5eVSLne4yYfSkt8ACCkW5i9H+rqmBz7MyqE3BHctNEQkCaWiHqioMJIF6XS3/csiFHafvbjiHN4O/LaURo+4tJ9eWAzTAxysYlsa1t6bhyok8JxGUXdZPmczupLz/XG35wdhPHR7HxpX1MyLDxyih8bhyaWZp5XBZXoLS40OO7HJF4WnJr4Z99JLPaR/Xqgs+Yl+lHk0ZeRdXtIxhe2TsbT5tHN59roEtx9D1UA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=suse.com;
Received: from AM0PR04MB5650.eurprd04.prod.outlook.com (2603:10a6:208:128::18)
 by AM0PR0402MB3393.eurprd04.prod.outlook.com (2603:10a6:208:21::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.33; Tue, 30 Mar
 2021 20:29:15 +0000
Received: from AM0PR04MB5650.eurprd04.prod.outlook.com
 ([fe80::40bd:b7d7:74a7:5679]) by AM0PR04MB5650.eurprd04.prod.outlook.com
 ([fe80::40bd:b7d7:74a7:5679%3]) with mapi id 15.20.3977.033; Tue, 30 Mar 2021
 20:29:15 +0000
From:   Varad Gautam <varad.gautam@suse.com>
To:     linux-crypto@vger.kernel.org
CC:     Varad Gautam <varad.gautam@suse.com>,
        David Howells <dhowells@redhat.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Vitaly Chikunov <vt@altlinux.org>,
        Tianjia Zhang <tianjia.zhang@linux.alibaba.com>,
        keyrings@vger.kernel.org (open list:ASYMMETRIC KEYS),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 01/18] X.509: Parse RSASSA-PSS style certificates
Date:   Tue, 30 Mar 2021 22:28:12 +0200
Message-ID: <20210330202829.4825-2-varad.gautam@suse.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210330202829.4825-1-varad.gautam@suse.com>
References: <20210330202829.4825-1-varad.gautam@suse.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [95.90.93.216]
X-ClientProxiedBy: AM3PR03CA0066.eurprd03.prod.outlook.com
 (2603:10a6:207:5::24) To AM0PR04MB5650.eurprd04.prod.outlook.com
 (2603:10a6:208:128::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from xps13.suse.de (95.90.93.216) by AM3PR03CA0066.eurprd03.prod.outlook.com (2603:10a6:207:5::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.25 via Frontend Transport; Tue, 30 Mar 2021 20:29:14 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a1f8350b-aef2-4977-3634-08d8f3ba7c9e
X-MS-TrafficTypeDiagnostic: AM0PR0402MB3393:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM0PR0402MB3393653676B7CE18D63002A8E07D9@AM0PR0402MB3393.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:663;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZrSapY6feWT5Mx1XXzbaJo1wr9MsWsN64iDoA3TjMuBV8zHvYimb7BS2zV3nGGgGI4TCIOzaiirHuUxRNDZ0p3hDHfTcMjPHkuk6gv8JWcGdJ3oVWv8CqKrRgFPzF9MoBq97G1aqyat2DWrSHHqBTg0eqB1lfWd3QOpi5mca7UJ71MX2pgFQzftE+HslcpAB2m934SbILKQXo/cdBWo4qukkxpgTUNSgsNsVhV2P0axBQCmQ1sM1aHe/KwntECyxfLA5UAPuBYNXH2Id7K4Rj3EjoXHudVvdSJ7atNVH/yXUR4RrRkg2Z/rMQY0lRpqcayMdPPKuyAYdsJ+3399LFHaRfi46gsCRUfa1cTtFUTZd93+mWGu0UrOTCLZdq2T93clzeJ+t6vow2jUR7WYVa//k75hwG+8eZKph7K9pwbUUHdznwjrqeBcE42WW17k1eJ+cqT/3Z2M2xTqFoYniOCyX+VF+VyXRr62jP4vairHOqWtu/drsu/H3MxMlyP38JqHp2ztrvbmviK2IgufSD9IjRP/+C+WngES5f7Ql6OAIBZxBxcstxj/7Mc+m7A4ui8cyaDC09c8rXlwnB+VubvqvfxhOMuvlqzIMuHF13juuwEzP65jSJY4hYyYcFJeWTvBqOqm7ExQeElfONtNIBrc0QFADWoQ4VBLy9t7RKg5uqQNXez6OHJTX17WxN/tNyATa0rYKVbCY7MMRoXolSyhoF7HfM4pySPZH8gk8750=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5650.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(39850400004)(396003)(136003)(346002)(366004)(376002)(66476007)(66556008)(54906003)(66946007)(83380400001)(8936002)(316002)(6506007)(6486002)(966005)(1076003)(52116002)(478600001)(6512007)(5660300002)(38100700001)(36756003)(4326008)(86362001)(6916009)(8676002)(2906002)(16526019)(2616005)(956004)(186003)(26005)(44832011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?0mfEArq4qmI23MBiwIxUbuMrlHSRGtW2tzeZ4HZq9wujMTJtkIN3zhLCUdS3?=
 =?us-ascii?Q?u5D7P2k/wPs6MqmwXGK91jlIdKcOZGf60pmeevwoPKfRQZRyNug8VJOBE2aQ?=
 =?us-ascii?Q?7SEOoYY+6SA2wgEEDOIOPcdRy3FVD3AGp3CRV6FNwr93js5kIS4RJOSWKNPr?=
 =?us-ascii?Q?UtPRquOh8OixviipxJmGhxpj5Yb40E4+x1j1cGGV8mzN3Axgm3cYNccOjNBG?=
 =?us-ascii?Q?9jTZBDGEuNi3JOxbKUjyjCI3KKI3crUV3Gf1zAfR6RYH5bl1D7LxwnX4kp0O?=
 =?us-ascii?Q?zjsdZeeanHro8BNIAKswoDty8WERQEeb9HOf5eq0c9dccnWwB/HbUHVHImvz?=
 =?us-ascii?Q?dZChdEU/bkHoIh3mnvLRNj5TuxPeM1+oTESxEZow3AZGtsopovw0xUqqEf3v?=
 =?us-ascii?Q?fFbiXP4csCWY3zTAbkYfpHCMP6rbbhIZIHUAu9QV2qMCIxcohHhF0ez1Sk9v?=
 =?us-ascii?Q?ULM+xP5vY05auZoNhuwU0OzIOncVpmsT+cZo4rmucPKCobdsEkhI6oxrYbzO?=
 =?us-ascii?Q?WlmMOvP7chHya/L8QK5IhCQXXuxTcZbt5ghk/+U1Rpj+AT2qFpSYSE1gpbRp?=
 =?us-ascii?Q?7BhDGf8yfyppZBNJKu0jaskjTE1NquhwK1vP5HGRE/aqdVIL6Our6JrZ9IuB?=
 =?us-ascii?Q?njYRTuruIK9PsLSGxgYdTMVA2tP7kQclNmYF1EMXMjFMeKs/o7kaBuG+y4p8?=
 =?us-ascii?Q?rl8WD3v8+VML8EImBH888slnWXef7JTBCwRDMmoyvg4/7zmcobPKA8AU2EJO?=
 =?us-ascii?Q?0hGgpVVHwYAa68bcssBW7S1OAFlzrNnyayEnwK5ssH/Q3lVwCF+COSew3tl6?=
 =?us-ascii?Q?1OVsofn1s2Md+/LGXiA5z27QeTZVrQ9C3DekTb7T5S7z+KsmQBPlGizx8xVw?=
 =?us-ascii?Q?gLl3/6fnjUmMPpEAr7MIL4UGBfAZLdcM/GW6VCAxZbTVI81UEkS1kWUhM+bv?=
 =?us-ascii?Q?m2DH6qDApZHKOHugseuOD+r5RqB+aNBsQuaK6mm5+N3huSN9+WZm8xgHnvsq?=
 =?us-ascii?Q?G3MZF+lseykpqFPeaf6HrY3sOHvIuNcgqaNn94O4X2hz7nvYQIzcQ4MMb+pv?=
 =?us-ascii?Q?NUOC9nsGDtULYsO8IJcmSnonN2kv1HaJs0U04IdpONhkr0dGS8Y0FI6p0+0C?=
 =?us-ascii?Q?kad03uBGptnU34c9k63MRFzPAD0GRZ76/OEO7FCejZ2GewDUlKr4T3rDefIM?=
 =?us-ascii?Q?RaVOO4NsaCPUrRmQCVT5iVK+4V73eqyconRBctLV+vw6sruD1G7XTIpJaFn1?=
 =?us-ascii?Q?FZVKOzwWs/Sz+7hCpGChEWTtGiVl4vqtut+a3zSsFJ4+dRUEIplyPM09j4vN?=
 =?us-ascii?Q?rHovy+iBxoFssmw8i/cGbvNu?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1f8350b-aef2-4977-3634-08d8f3ba7c9e
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5650.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2021 20:29:15.8212
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Za/+4RLFtrtQa+K1YaiOFOd9kprfVZ/gWWCHIBZLhv6q+zRKfPM7772IyDnMqtIZ1VeEgpRb3eqUxGstLjgjDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR0402MB3393
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

An X.509 wrapper for a RSASSA-PSS signature contains additional
signature parameters over the PKCSv.15 encoding scheme. Extend the
x509 parser to allow parsing RSASSA-PSS encoded certificates, with
the defaults taken from RFC8017.

A certificate is rejected if the hash function used for the MGF is
different from the hash function used for signature generation,
although this is allowed in RFC8017.

References: https://tools.ietf.org/html/rfc8017#appendix-C
Signed-off-by: Varad Gautam <varad.gautam@suse.com>
---
 crypto/asymmetric_keys/Makefile           |   5 +-
 crypto/asymmetric_keys/x509_cert_parser.c | 152 ++++++++++++++++++++++
 crypto/asymmetric_keys/x509_rsassa.asn1   |  17 +++
 include/crypto/public_key.h               |   4 +
 include/linux/oid_registry.h              |   3 +
 5 files changed, 180 insertions(+), 1 deletion(-)
 create mode 100644 crypto/asymmetric_keys/x509_rsassa.asn1

diff --git a/crypto/asymmetric_keys/Makefile b/crypto/asymmetric_keys/Makef=
ile
index 28b91adba2ae..f79ed8e8ef8e 100644
--- a/crypto/asymmetric_keys/Makefile
+++ b/crypto/asymmetric_keys/Makefile
@@ -20,15 +20,18 @@ obj-$(CONFIG_X509_CERTIFICATE_PARSER) +=3D x509_key_par=
ser.o
 x509_key_parser-y :=3D \
 	x509.asn1.o \
 	x509_akid.asn1.o \
+	x509_rsassa.asn1.o \
 	x509_cert_parser.o \
 	x509_public_key.o
=20
 $(obj)/x509_cert_parser.o: \
 	$(obj)/x509.asn1.h \
-	$(obj)/x509_akid.asn1.h
+	$(obj)/x509_akid.asn1.h \
+	$(obj)/x509_rsassa.asn1.h
=20
 $(obj)/x509.asn1.o: $(obj)/x509.asn1.c $(obj)/x509.asn1.h
 $(obj)/x509_akid.asn1.o: $(obj)/x509_akid.asn1.c $(obj)/x509_akid.asn1.h
+$(obj)/x509_rsassa.asn1.o: $(obj)/x509_rsassa.asn1.c $(obj)/x509_rsassa.as=
n1.h
=20
 #
 # PKCS#8 private key handling
diff --git a/crypto/asymmetric_keys/x509_cert_parser.c b/crypto/asymmetric_=
keys/x509_cert_parser.c
index 52c9b455fc7d..3738355618cd 100644
--- a/crypto/asymmetric_keys/x509_cert_parser.c
+++ b/crypto/asymmetric_keys/x509_cert_parser.c
@@ -15,6 +15,7 @@
 #include "x509_parser.h"
 #include "x509.asn1.h"
 #include "x509_akid.asn1.h"
+#include "x509_rsassa.asn1.h"
=20
 struct x509_parse_context {
 	struct x509_certificate	*cert;		/* Certificate being constructed */
@@ -38,6 +39,8 @@ struct x509_parse_context {
 	const void	*raw_akid;		/* Raw authorityKeyId in ASN.1 */
 	const void	*akid_raw_issuer;	/* Raw directoryName in authorityKeyId */
 	unsigned	akid_raw_issuer_size;
+	const void	*raw_sig_params;	/* Signature AlgorithmIdentifier.parameters *=
/
+	unsigned	raw_sig_params_size;
 };
=20
 /*
@@ -101,6 +104,15 @@ struct x509_certificate *x509_cert_parse(const void *d=
ata, size_t datalen)
 		}
 	}
=20
+	if (strcmp(ctx->cert->sig->encoding, "pss") =3D=3D 0) {
+		pr_devel("rsa enc=3Dpss hash=3D%s mgf=3D%s mgf_hash=3D%s salt=3D0x%x tf=
=3D0x%x\n",
+			 ctx->cert->sig->hash_algo,
+			 ctx->cert->sig->mgf,
+			 ctx->cert->sig->mgf_hash_algo,
+			 ctx->cert->sig->salt_length,
+			 ctx->cert->sig->trailer_field);
+	}
+
 	ret =3D -ENOMEM;
 	cert->pub->key =3D kmemdup(ctx->key, ctx->key_size, GFP_KERNEL);
 	if (!cert->pub->key)
@@ -194,6 +206,7 @@ int x509_note_pkey_algo(void *context, size_t hdrlen,
 			const void *value, size_t vlen)
 {
 	struct x509_parse_context *ctx =3D context;
+	int ret =3D 0;
=20
 	pr_debug("PubKey Algo: %u\n", ctx->last_oid);
=20
@@ -238,6 +251,39 @@ int x509_note_pkey_algo(void *context, size_t hdrlen,
 	case OID_SM2_with_SM3:
 		ctx->cert->sig->hash_algo =3D "sm3";
 		goto sm2;
+
+	case OID_rsassaPSS:
+		/* For rsassaPSS, the hash algorithm is packed as a mandatory
+		 * parameter in AlgorithmIdentifier.parameters.
+		 */
+		if (ctx->raw_sig_params =3D=3D NULL && ctx->raw_sig_params_size !=3D 1)
+			return -EBADMSG;
+
+		ctx->cert->sig->pkey_algo =3D "rsa";
+		ctx->cert->sig->encoding =3D "pss";
+		ctx->algo_oid =3D ctx->last_oid;
+		if (ctx->raw_sig_params) {
+			ret =3D asn1_ber_decoder(&x509_rsassa_decoder, ctx,
+					       ctx->raw_sig_params,
+					       ctx->raw_sig_params_size);
+			if (ret < 0)
+				return ret;
+		}
+
+		/* Fill in RSASSA-PSS-params defaults if left out. */
+		if (!ctx->cert->sig->hash_algo)
+			ctx->cert->sig->hash_algo =3D "sha1";
+		if (!ctx->cert->sig->mgf)
+			ctx->cert->sig->mgf =3D "mgf1";
+		if (!ctx->cert->sig->mgf_hash_algo)
+			ctx->cert->sig->mgf_hash_algo =3D "sha1";
+		ctx->cert->sig->trailer_field =3D 0xbc;
+
+		/* Reject if digest and mgf use different hashalgs. */
+		if (strcmp(ctx->cert->sig->hash_algo, ctx->cert->sig->mgf_hash_algo) !=
=3D 0)
+			return -ENOPKG;
+
+		return 0;
 	}
=20
 rsa_pkcs1:
@@ -439,6 +485,18 @@ int x509_note_params(void *context, size_t hdrlen,
 {
 	struct x509_parse_context *ctx =3D context;
=20
+	if (ctx->last_oid =3D=3D OID_rsassaPSS && !ctx->raw_sig_params) {
+		/* Stash AlgorithmIdentifier.parameters for RSASSA-PSS. */
+		ctx->raw_sig_params_size =3D vlen + hdrlen;
+		if (ctx->raw_sig_params_size) {
+			ctx->raw_sig_params =3D value - hdrlen;
+		} else {
+			ctx->raw_sig_params =3D NULL;
+			ctx->raw_sig_params_size =3D 1;
+		}
+		return 0;
+	}
+
 	/*
 	 * AlgorithmIdentifier is used three times in the x509, we should skip
 	 * first and ignore third, using second one which is after subject and
@@ -705,3 +763,97 @@ int x509_akid_note_serial(void *context, size_t hdrlen=
,
 	ctx->cert->sig->auth_ids[0] =3D kid;
 	return 0;
 }
+
+int x509_note_hash_algo(void *context, size_t hdrlen,
+			unsigned char tag,
+			const void *value, size_t vlen)
+{
+	struct x509_parse_context *ctx =3D context;
+	const char **ptr =3D NULL;
+
+	if (ctx->last_oid !=3D OID_rsassaPSS)
+		return -EBADMSG;
+
+	if (ctx->cert->sig->mgf)
+		ptr =3D &ctx->cert->sig->mgf_hash_algo;
+	else
+		ptr =3D &ctx->cert->sig->hash_algo;
+
+	switch (look_up_OID(value, vlen)) {
+	case OID_sha224:
+		*ptr =3D "sha224";
+		break;
+	case OID_sha256:
+		*ptr =3D "sha256";
+		break;
+	case OID_sha384:
+		*ptr =3D "sha384";
+		break;
+	case OID_sha512:
+		*ptr =3D "sha512";
+		break;
+	case OID_sha1:
+	default:
+		*ptr =3D "sha1";
+		break;
+	}
+
+	return 0;
+}
+
+int x509_note_hash_algo_params(void *context, size_t hdrlen,
+			       unsigned char tag,
+			       const void *value, size_t vlen)
+{
+	return -EOPNOTSUPP;
+}
+
+int x509_note_mgf(void *context, size_t hdrlen,
+		  unsigned char tag,
+		  const void *value, size_t vlen)
+{
+	struct x509_parse_context *ctx =3D context;
+
+	if (ctx->last_oid !=3D OID_rsassaPSS)
+		return -EBADMSG;
+
+	/* RFC8017 PKCS1MGFAlgorithms */
+	if (look_up_OID(value, vlen) !=3D OID_mgf1)
+		return -EINVAL;
+
+	ctx->cert->sig->mgf =3D "mgf1";
+
+	return 0;
+}
+
+int x509_note_salt_length(void *context, size_t hdrlen,
+			  unsigned char tag,
+			  const void *value, size_t vlen)
+{
+	struct x509_parse_context *ctx =3D context;
+
+	if (ctx->last_oid !=3D OID_rsassaPSS)
+		return -EBADMSG;
+
+	if (!value || !vlen || vlen > sizeof(ctx->cert->sig->salt_length))
+		return -EINVAL;
+
+	ctx->cert->sig->salt_length =3D (vlen =3D=3D 2) ?
+		be16_to_cpu(*((u16 *) value)) : *((u8 *) value);
+
+	return 0;
+}
+
+int x509_note_trailer_field(void *context, size_t hdrlen,
+			    unsigned char tag,
+			    const void *value, size_t vlen)
+{
+	struct x509_parse_context *ctx =3D context;
+
+	if (ctx->last_oid !=3D OID_rsassaPSS)
+		return -EBADMSG;
+
+	/* trailerField 0xbc per RFC8017 A.2.3 regardless of if
+	 * specified. */
+	return 0;
+}
diff --git a/crypto/asymmetric_keys/x509_rsassa.asn1 b/crypto/asymmetric_ke=
ys/x509_rsassa.asn1
new file mode 100644
index 000000000000..e524b978856d
--- /dev/null
+++ b/crypto/asymmetric_keys/x509_rsassa.asn1
@@ -0,0 +1,17 @@
+-- RFC8017
+RSASSA-PSS-params ::=3D SEQUENCE {
+	hashAlgorithm      [0] HashAlgorithm DEFAULT,
+	maskGenAlgorithm   [1] MaskGenAlgorithm DEFAULT,
+	saltLength         [2] INTEGER DEFAULT ({ x509_note_salt_length }),
+	trailerField       [3] INTEGER DEFAULT ({ x509_note_trailer_field })
+}
+
+HashAlgorithm ::=3D SEQUENCE {
+	algorithm		OBJECT IDENTIFIER ({ x509_note_hash_algo }),
+	parameters		ANY OPTIONAL ({ x509_note_hash_algo_params })
+}
+
+MaskGenAlgorithm ::=3D SEQUENCE {
+	mgf	OBJECT IDENTIFIER ({ x509_note_mgf }),
+	parameters	HashAlgorithm
+}
diff --git a/include/crypto/public_key.h b/include/crypto/public_key.h
index 47accec68cb0..f36834c8bb13 100644
--- a/include/crypto/public_key.h
+++ b/include/crypto/public_key.h
@@ -46,6 +46,10 @@ struct public_key_signature {
 	const char *encoding;
 	const void *data;
 	unsigned int data_size;
+	const char *mgf;
+	const char *mgf_hash_algo;
+	u16 salt_length;
+	u16 trailer_field;
 };
=20
 extern void public_key_signature_free(struct public_key_signature *sig);
diff --git a/include/linux/oid_registry.h b/include/linux/oid_registry.h
index 4462ed2c18cd..c247adc8a41e 100644
--- a/include/linux/oid_registry.h
+++ b/include/linux/oid_registry.h
@@ -113,6 +113,9 @@ enum OID {
 	OID_SM2_with_SM3,		/* 1.2.156.10197.1.501 */
 	OID_sm3WithRSAEncryption,	/* 1.2.156.10197.1.504 */
=20
+	OID_mgf1,			/* 1.2.840.113549.1.1.8 */
+	OID_rsassaPSS,			/* 1.2.840.113549.1.1.10 */
+
 	OID__NR
 };
=20
--=20
2.30.2

