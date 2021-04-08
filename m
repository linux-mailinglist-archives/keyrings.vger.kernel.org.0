Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 958443586B4
	for <lists+keyrings@lfdr.de>; Thu,  8 Apr 2021 16:16:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231901AbhDHOQW (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 8 Apr 2021 10:16:22 -0400
Received: from de-smtp-delivery-102.mimecast.com ([194.104.109.102]:43234 "EHLO
        de-smtp-delivery-102.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231819AbhDHOQT (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 8 Apr 2021 10:16:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
        t=1617891367;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=4UO531muU9PFWM7c62JXlneUKIoLMkzWaK0fMBqgWqA=;
        b=hx7nFLHZ1USqouZPDlxsnKdX2Qi/LrWQ2sR++9otmdPSeuHI29FDFZGKsHJLY/6HEOqlVA
        2NWc5eqkPrv6ILtfIShNberyjhiI+nMdKIbfruqx5Zu2aGcPHAWNfWnxO7R1KXgQEWkLIz
        nsDWVT3waIqXOCORdRJQeBpP3ECH5q8=
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2057.outbound.protection.outlook.com [104.47.13.57]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-27-ewTylNUtOQW7CNWuBvTWyg-1; Thu, 08 Apr 2021 16:15:55 +0200
X-MC-Unique: ewTylNUtOQW7CNWuBvTWyg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GUi5QtI0H8gT21OtDKJJyEXPhQbowpFBLv4sDXdLPCQBrSaPGGhN3rbYVutHueKV7NyXqSNNgkcb2KOF8pGssj7cp6uYFTVU0/4MbQRuQe0mKVzlMLTO7JYsOP762/gEFnsMkvZYPLl4ohHZfUO262RHIP/EzdK0l7c6kIisym6EzAwuxTSfb7MLux4S0MzfCPLiGuRAb4C1tOd07TVMUCT4eY8I4DU+EbkW5CdPWfcsymg1uWIc4vx3xrH/xcCkHcyo9qYtTrnlmtdK1tUDm3c21WUSPd8KpbQozVpl45eoSyZVK0+WIwTY+L0DSazwF3EaO9gAHnxQ8V4nLOKSaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rmU+FZ7o8j5qnfLP6lKhFRSQRV5jYbVL7Gi1NqlT7s4=;
 b=CiMhM+6Dr6ReciPPOUOIFwfh5VRzOZq98zhj81CbCk8SHCCcIyL9Q/VpHi35hgSdHPqjGjg1ZETodOc9X7CqQRzhQ30ihi06FMhODiebMtf67wjMACH1JSqQyxq+sZ6V7xp/Dp6/8Hu4EMfituGRy7EZ4Zj0sUx9Ll6cGIG7qI9CfXIEIieRdZ70qDB+AaIkgMrxH232JXWeonVtrxtyD8/ZR9G0Zi+/DVkvCP9qHrfNxLWs+FJfcqN+QIAIxyO0aBJPSxKzmu4+GoODQ6hbsuRPQdR3ZLPChM0bS0a10Xs3vwDbMoasmxmHqfkwsynNbZ2Okf6fQ4dIaL/IoYPgoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=suse.com;
Received: from AM0PR04MB5650.eurprd04.prod.outlook.com (2603:10a6:208:128::18)
 by AM0PR04MB6289.eurprd04.prod.outlook.com (2603:10a6:208:145::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.18; Thu, 8 Apr
 2021 14:15:54 +0000
Received: from AM0PR04MB5650.eurprd04.prod.outlook.com
 ([fe80::756a:86b8:8283:733d]) by AM0PR04MB5650.eurprd04.prod.outlook.com
 ([fe80::756a:86b8:8283:733d%6]) with mapi id 15.20.3999.032; Thu, 8 Apr 2021
 14:15:54 +0000
From:   Varad Gautam <varad.gautam@suse.com>
To:     linux-crypto@vger.kernel.org
CC:     varad.gautam@suse.com, dhowells@redhat.com,
        herbert@gondor.apana.org.au, davem@davemloft.net, vt@altlinux.org,
        tianjia.zhang@linux.alibaba.com, keyrings@vger.kernel.org,
        linux-kernel@vger.kernel.org, jarkko@kernel.org
Subject: [PATCH v2 01/18] X.509: Parse RSASSA-PSS style certificates
Date:   Thu,  8 Apr 2021 16:14:59 +0200
Message-ID: <20210408141516.11369-2-varad.gautam@suse.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210408141516.11369-1-varad.gautam@suse.com>
References: <20210408141516.11369-1-varad.gautam@suse.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [95.90.93.216]
X-ClientProxiedBy: ZR0P278CA0137.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:40::16) To AM0PR04MB5650.eurprd04.prod.outlook.com
 (2603:10a6:208:128::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from xps13.suse.cz (95.90.93.216) by ZR0P278CA0137.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:40::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.16 via Frontend Transport; Thu, 8 Apr 2021 14:15:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a2873a6b-b6ac-471a-c7da-08d8fa98d221
X-MS-TrafficTypeDiagnostic: AM0PR04MB6289:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM0PR04MB62890D3A06EECEF8C5C06018E0749@AM0PR04MB6289.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:597;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GWgV22iRMSWa53dUmrLzagse58Ku+WdC4o6uraZILvZnY1byjlGZrYznX2vKJRVpYB8/em8H9e3e6nqgGuo7+lsAn7r+BS6wmcyqpCQ+g+5MAA1+JlJyCRECEptyq1xAQrzboLIauWBGoIoN2pQgXQ4NVgH5eKzgTrG38TtjNz5LbxaeYpRJ5J1MDBGU8TpBQU1qYGacOqkNgqJspYFuwZeZR7k2QcSOY4JnjIGY9rjC2QwKl+QQqSwaxW5fEqL1H34LnarTDNzn1U3rHmhOBGZPePB3EiwhT3vGZCNpysk+6I8RVSR5/kdo/FHePCwB+pbbjjFsk0a47wb6k4qoa+TebBIsh7nSHNzLKZcXnzQE5/7pATrPUDAfTVNgc2bN/1V7uL3FMU6AqGxoxCb3PxAUwoeogZYIlmQJKuULe7GznAR0jL/72OKGNWl6skY4Y5yTO62FmmwdQsMsfOIxPDuC+3dHEWYTm2ZxugBFy/Ts6YAyuvt7Qv5a8XtpjK5luCtwNZM936JIxuEKLQW1b4n0B2jPe8KfkvAaqmYvEFvb7mwdLleALPCjfsYpPx4M8EZl0GiXkmVLfwSYKJvCU+DijvRT22Va3Li5R+qenImsk9OF68Tud96CUpLUojC+YnZrhj2r87Pq2eyava98jX91XtfuCAaxhK+obvFDKLjNFVw+WOQ4WN3IbFC5BhBjDNQCu876UQrmZ6ymSr38Ao6WDxsQnLsNpo24B2ifTNWQYeQKDVYLvU35v8PILfta
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5650.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(396003)(346002)(376002)(136003)(39860400002)(186003)(83380400001)(16526019)(478600001)(6486002)(38100700001)(36756003)(5660300002)(4326008)(6916009)(1076003)(66476007)(316002)(2906002)(66556008)(26005)(38350700001)(2616005)(966005)(956004)(8676002)(44832011)(8936002)(6506007)(86362001)(52116002)(66946007)(6512007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?c9qoR1W9bwDQzMG2HDrJGy7Pk4wvRyCuT4sm/dPqruaEOKr3GWOqaW0YeJK7?=
 =?us-ascii?Q?YxeepoYL4JcgkljH8Lp1rf1zuhb0vX/RZmrXujUtV92swDys7kA5nokPAaTZ?=
 =?us-ascii?Q?sk2UExVLkOUbeDBhCAX4ZcyzMspHtdy2gHAjjeX9zwFEqt/rlZuOuvaFKhzD?=
 =?us-ascii?Q?HHdX2QFstJX6FQnne5IBJ006tE32UM8VW7KlQtlz7FLUO7zX4/OVkIeh1vjY?=
 =?us-ascii?Q?su8q4g6NI8NOM/5L7RXj1Nbw7EHP+fDyCpJvKFCIhDAqa8VlftrMHJT+9k2B?=
 =?us-ascii?Q?uTbHKB7Z71gsGQj2wNo1ysA4K3ILJ4kzZYbLr3LbPnCU5pZu4rkDR0kWDNLJ?=
 =?us-ascii?Q?xuhyS71inTOy17+48czv4VY2hygQSL2j044PnpDhFEfH+f5bJTNow/Pnk8iJ?=
 =?us-ascii?Q?zeZ6dqtYYplSwHmAtpqZ4QoVXGcXqvE9aPAVWCiWxqJP0V2NBI3viJNz2DDN?=
 =?us-ascii?Q?wQmProzvB22jhoOCOS9Zc9vuhof/WEbBBVjCiO6lgeSdlNaaFqGVTl1obyEQ?=
 =?us-ascii?Q?SvRw275YMIdbcV6XB7vQI6HTDyUEbQ0x/6jnJRCQkSNpBQmjSESF42Yf+Yif?=
 =?us-ascii?Q?MFxXfr7+1978ccR4f6OavLYLvcCoRDaJEzIlv7wtCUZWC9szH6aDT4Q0oi9B?=
 =?us-ascii?Q?Lnc+lUPYA9A+wkpM6PNuWc8gB5ZyNGmVwRi7MYkGHGL4Lzuaw6WwYJT8Ldct?=
 =?us-ascii?Q?yb5P0RXntqO/vbfHS4wdKLSJq27CQPx/7dNoumV8qaQRsbHTSJKAykY13s3H?=
 =?us-ascii?Q?K0CWqes702qRwxeUi6X0H8UZcRJRQE07Xjd2wYE3Wo18RmYrsF9gp0NBoqvt?=
 =?us-ascii?Q?QEiLR1TcgysvISs5cf12bQ3/DsrRspbK5Ip+f2rPpU5CRCYHTp9NrFtdHrq8?=
 =?us-ascii?Q?evJwki7a5JaJ37APXvLUUW6JgxRgrJLr1JrIGCjlN+Hu1WsANnwavSUXl9dM?=
 =?us-ascii?Q?pxBZrxPhb6+6Bb5WiQnMoQz5mXz92XO3YVkdVci18DZ9X+3ApsN50FFNYoIZ?=
 =?us-ascii?Q?OFFF3LZZQNl2T6UybiOmBW+a6azBGkoilartEkyDpeNiMgCMJyXrAcs9/dDG?=
 =?us-ascii?Q?d1XlL9NkeTF0zMox5sp29UpISsR9etRtrctXeOhrDJGzvRZ4usAVgTzZcQLh?=
 =?us-ascii?Q?WnUZCFuKOPDzIHNoHU7rcc5VF842wm8YALlFwLPyD6BegzsYz/xwuJiDvF4w?=
 =?us-ascii?Q?X63kBpTvXakj/Fz7Y9nMW0Yj30BDTCCfQxEDaqVsKLXMKlPY96m3bKgjamAj?=
 =?us-ascii?Q?AnLQY0nUEYa4NtUWvBlpglWlCnEMOVBduuXOdd8b+I89QgknDwnfj2CtIsbj?=
 =?us-ascii?Q?J5Ch1Kka5sEkWK6UYtmhUvEg?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2873a6b-b6ac-471a-c7da-08d8fa98d221
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5650.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2021 14:15:54.1756
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xQf4cgCRLR8Hfo3NL0bX3Be/E7ckcC4JPCo5sNigdKC0Kq3jj8ec1czNM2FNtXhGkETSyn1ZPYISslL9UUxcCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6289
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

An X.509 wrapper for a RSASSA-PSS signature contains additional
signature parameters over the PKCSv.15 encoding scheme. Extend the
x509 parser to allow parsing RSASSA-PSS encoded certificates, with
the defaults taken from RFC8017.

References: https://tools.ietf.org/html/rfc8017#appendix-C
Signed-off-by: Varad Gautam <varad.gautam@suse.com>
---
v2: Remove check to reject certificates with differing mgf hash and digest
  hash algorithms from x509_note_pkey_algo.

 crypto/asymmetric_keys/Makefile           |   5 +-
 crypto/asymmetric_keys/x509_cert_parser.c | 148 ++++++++++++++++++++++
 crypto/asymmetric_keys/x509_rsassa.asn1   |  17 +++
 include/crypto/public_key.h               |   4 +
 include/linux/oid_registry.h              |   3 +
 5 files changed, 176 insertions(+), 1 deletion(-)
 create mode 100644 crypto/asymmetric_keys/x509_rsassa.asn1

diff --git a/crypto/asymmetric_keys/Makefile b/crypto/asymmetric_keys/Makef=
ile
index 28b91adba2aed..f79ed8e8ef8e2 100644
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
index 52c9b455fc7df..19cd162acdb06 100644
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
@@ -238,6 +251,35 @@ int x509_note_pkey_algo(void *context, size_t hdrlen,
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
+		return 0;
 	}
=20
 rsa_pkcs1:
@@ -439,6 +481,18 @@ int x509_note_params(void *context, size_t hdrlen,
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
@@ -705,3 +759,97 @@ int x509_akid_note_serial(void *context, size_t hdrlen=
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
+		be16_to_cpu(*((__force __be16 *) value)) : *((u8 *) value);
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
index 0000000000000..e524b978856d2
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
index 47accec68cb0f..f36834c8bb139 100644
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
index 4462ed2c18cdd..c247adc8a41e4 100644
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

