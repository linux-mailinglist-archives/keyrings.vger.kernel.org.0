Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C7883586E1
	for <lists+keyrings@lfdr.de>; Thu,  8 Apr 2021 16:18:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232113AbhDHOSI (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 8 Apr 2021 10:18:08 -0400
Received: from de-smtp-delivery-102.mimecast.com ([194.104.109.102]:60337 "EHLO
        de-smtp-delivery-102.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232116AbhDHORd (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 8 Apr 2021 10:17:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
        t=1617891441;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ENeoeGjztm6hP91FXe6TqkfYtzDzY/mPPZPgO97Y1Sg=;
        b=M2GdbIVgcigY/88HatemD6eDAlVXUbOcp722U4YfKZyFTLIdTBem1w77qMnPZazLEwsIam
        c2NF4nh2mgEIyc0rlChE+d/WiuIShmHaBTPgBOBLdHZ9WmBPHtkMUyQ9C7U5V3Pvdn8rbV
        5hRZwC5P6HuWhGoK3xX0JER45zj6gfg=
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2105.outbound.protection.outlook.com [104.47.17.105])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-5-AYv-Joj7P4-1LLRdqZg-oA-2; Thu, 08 Apr 2021 16:17:09 +0200
X-MC-Unique: AYv-Joj7P4-1LLRdqZg-oA-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VWZwEaUg3HYORrRIT+j+p8c0SstKlhPcXHNpXUx3DFenVsw2nroxs91kF9iTTQ9VzYuV+97R9xhoStzbKZ5SOubYNMqDRxlSuxwbAyc/j1u2Fc/6yUE8CH5afSH9ma/IByCcMOosRbUfbg79Kyh00vVHig3QxOhBOwPQKTG4keRQjR4fcL3JYTB2CVvPJSVYJQ1Q655nYHNtVbwFeIGJ+Yrk0tFR2hWhRMXtdN7RzZ1Z3wup63OeKzLS+kgH0Irq72iZmk2R6dXIiDnhEp1Oo3bLwuj/3CZ1vnj1H1v2hEZhrWL0THawxdVEvyaV+axoGpaKU9JLqNn9mkAgySKZeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kT8Pld7hTo+LQK3LxhFaGHsHTvl3EkbRAdrK4Z5Udv4=;
 b=CNGJyHb+EOoyBMyxxrkAOv4A22mDnfqqHLd1g/nuULMaQsyfhBdJmGMNZqBz3SiVhdXTLyzHsmVKHvXMioqf8Nfe8QtCsDGLBz8IM6ikBdQpbDdu77duA61Gcuv+rJIma5YsEAcv5YCwco7Mt77nlkTMXRBAr0h9rWskKL22wf7upPfJFk1ofaanpq70VrMJAxMA5k0PuTebanWuHk4I4zKojrp442rlsKFLmuBBAe6l+QXSIVlX34znbclLjIe1QQy6F2T2YyC78xjhAP9leT87Yva6jJP9j2RR7QFczvPyIBp60OxiCDKZx/4QnxpwaEuem29D+ACjhMPoAoDbCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=suse.com;
Received: from AM0PR04MB5650.eurprd04.prod.outlook.com (2603:10a6:208:128::18)
 by AM0PR0402MB3572.eurprd04.prod.outlook.com (2603:10a6:208:22::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.29; Thu, 8 Apr
 2021 14:16:50 +0000
Received: from AM0PR04MB5650.eurprd04.prod.outlook.com
 ([fe80::756a:86b8:8283:733d]) by AM0PR04MB5650.eurprd04.prod.outlook.com
 ([fe80::756a:86b8:8283:733d%6]) with mapi id 15.20.3999.032; Thu, 8 Apr 2021
 14:16:50 +0000
From:   Varad Gautam <varad.gautam@suse.com>
To:     linux-crypto@vger.kernel.org
CC:     varad.gautam@suse.com, dhowells@redhat.com,
        herbert@gondor.apana.org.au, davem@davemloft.net, vt@altlinux.org,
        tianjia.zhang@linux.alibaba.com, keyrings@vger.kernel.org,
        linux-kernel@vger.kernel.org, jarkko@kernel.org
Subject: [PATCH v2 15/18] crypto: rsa-psspad: Provide PSS signature verify operation
Date:   Thu,  8 Apr 2021 16:15:13 +0200
Message-ID: <20210408141516.11369-16-varad.gautam@suse.com>
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
Received: from xps13.suse.cz (95.90.93.216) by ZR0P278CA0137.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:40::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.16 via Frontend Transport; Thu, 8 Apr 2021 14:16:48 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5eadd5c3-ce5d-4fd3-7623-08d8fa98f35a
X-MS-TrafficTypeDiagnostic: AM0PR0402MB3572:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM0PR0402MB3572DA1F9BB9C67372900DF7E0749@AM0PR0402MB3572.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:332;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9gydYn2KDw8a499iS8lDOr9sXltPFuHmYiqxsI7tRTwuXK6rfReDhxWoQBj0URK183S3T0Z3zSmHYjM/US2913NPyeJwx0gOfIZm8ycLLS6IRxBehwAMLwUZkGQTiu/asZCOnf38CK3k659Jss8SyFtRJkCrT7g/EAgMLM7IoPXQUdcY0OJZPR9rbgJtqbkZdy8UtXqQ5Ttd5wN1hQHjUoCkVhTlVwhc2MNobkq7y3YakMRgv7EYZK5CXy2YheadbBVxYGnTDoLRpWfhFJDCBEHxtsNV+se4X+ptBdnIi5vKiQTgOgt5cIGOMUzQBs3q47OVdGYlHsfw4ywkpHpSEx2b9Ap1xfJkk7qDNkLeFpO6W7YiOnqlvPRVAL8A9obLT19j/jnvR0JUxqdcRKLtgGMeyULdP+u556+C5V1dAGh9g0cXfPqQQlnsQqfp4bPPBzVzzccL7/55V0xb/xKwHz6bO2bR8eERdQJi/ejIrGts675jMkiycWaoau5j2hfKYYHnJdLbHZa3Aw3RrOaTFLZCBa/Zf+/qtdP1fHzciNYlO4VgPL3zbKFodDkEQQJ66eUjtCtT33cgXv71916MfrgOeVgmCSDjtuXiDAEIUprtASaVkEaEzPFYOBICMRMaWvNZ6lVRBPPaYM5UllryZB6p1n4JHtpj3GflXfYsKpeuj+arRW6b3L9q/fWX2BiXmG5buXN1YNgAlWabfvXvIhLNFvvPiAbi3vBZewyEzaa/sw95bx3H/Q4wErfz5r2P
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5650.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(39860400002)(136003)(396003)(376002)(346002)(366004)(16526019)(186003)(966005)(38100700001)(2616005)(956004)(38350700001)(52116002)(6512007)(2906002)(36756003)(44832011)(6916009)(83380400001)(6666004)(8936002)(26005)(66476007)(66556008)(66946007)(4326008)(316002)(1076003)(6506007)(6486002)(15650500001)(478600001)(5660300002)(86362001)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?Nc1L5luD8tks8CzoKsbxKy9Fok1/fJhZcI7hIu1Kg/rIPccoSzt3e0Sr9Ck5?=
 =?us-ascii?Q?Ema1qfNMBNyvOrL9yglgjDMfmBi6KhvGpOD+Nb27SKAw4Z+BYAJ4GRSmn9lC?=
 =?us-ascii?Q?13jZiI4gHK5lIsgHGI67gzJ81I/F29DK0GWeFZQ51FWOICAmsawHOPgEZpiO?=
 =?us-ascii?Q?dw8GO1o2ffyyAnHWeP7k2TTnM4BucLHkvVAoih1NpYifrMsYLX9crFOO1rCS?=
 =?us-ascii?Q?NenEcY573DD5GDB2/kW86cR/im7zVpLdT3nGhNphGnC/7fyJjwGGIzSJNdzx?=
 =?us-ascii?Q?Vd921TOzwasqSbYfeEpZ5XVCUKfNFCie07eYRlo8lWTF77lPsSQqPPmHrlBZ?=
 =?us-ascii?Q?e1ECHJvLr6A8yYQf3ixjZsj2+AWk/cG1zIBYWcCmCMTAlMYNDKcSgxJz/+Ow?=
 =?us-ascii?Q?k/dbsraGsxUrIj4Zfc/OygN7mvMH0N8aAWgNmiJJlLujLcOckUNcuA9vmeHv?=
 =?us-ascii?Q?hS4j7vy2ZVcJL6Pq4Rw/pFp9wabTTX3G0ndWWF9s2YkdUarnPCLNBum8c3Zd?=
 =?us-ascii?Q?UN9CBjKjtl5rnbrsCZvyCTwPugwYdGwOUEI6eGAGzK4tNCT3PsLFDiaB7EVi?=
 =?us-ascii?Q?ojp9xgcihZeK583jKMWJxhQSjTP7GbMPpILPvnsafXjhWpAXvVqBX0+USQ3w?=
 =?us-ascii?Q?o3NRuHkBnexStvjceKROaMeSY6WAZZDX0CUKP0fi71d8P7KwJNwN3+C4O4Gw?=
 =?us-ascii?Q?twqHr1WX0HsX7IdUdB4W1J9v3PSbSIchdFCSFzj+JJaajlxLjVECX43CoOI9?=
 =?us-ascii?Q?BAOztCVqaPmANdMCtEAOiW8gP0zxGLP0NmSq/iaZD3mZfR5K51VP5EimScqQ?=
 =?us-ascii?Q?vwVQCbp51/oEd4rHSctl18zQpP9TRq7bw/9+HK8A63IapQPdiZ2tC5l2eGnx?=
 =?us-ascii?Q?W5wBna2zfgSQQ6Hx9vL622cH7hxJzrZLNSDwMVN2oI+JkkwjINHj3soxMAb+?=
 =?us-ascii?Q?kKh+oCPom+hG7GQrUkxlS3ZYod7eGWCnprPp3YrJG6R9TRsXmaWC8GBA+PM+?=
 =?us-ascii?Q?aZ4HhhACeM+2vV/+ruWSbXULfCmsp1xdBRmkbb2wmEUNUQvMPuu+Rk83oeU8?=
 =?us-ascii?Q?TfKLuV/+jp7F4UJ/YGinEgU10F9RQDhohAzBVIA2Nla5PoFk7AiCl7/yRwtS?=
 =?us-ascii?Q?smSwZF8Kh6lQYkb7QD6bJGZfJd24IDuGVIRBTFGYKBa5m/9txJb0Gkq5nxNK?=
 =?us-ascii?Q?UhdrJhunL6CYL7AIRDl/+B6X31umoBCJvet0sg3U5Tjx4xEr1UkwOL7WDq6D?=
 =?us-ascii?Q?hO7nnvyN1TJB241OdE6iB0zfBU3ZOI7o+QpjOGpHPd8jFMeNroVNH4iw0IBZ?=
 =?us-ascii?Q?VdYTcSahjXiJgBK5x5CdEeI9?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5eadd5c3-ce5d-4fd3-7623-08d8fa98f35a
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5650.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2021 14:16:49.9798
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EDTm0pS3AjkJwjo5IpX4hzsv3yJlVDbym8isDmc7qIsMMvzLUMb5+X9tD5iWmk/qhHJKc3AUlPntgQhli2/s+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR0402MB3572
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Trigger RSA transform on the signature being verified from
psspad_verify, to produce intermediary data which will be handled
in the psspad_verify_complete callback.

Reference: https://tools.ietf.org/html/rfc8017#section-8.1.2
Signed-off-by: Varad Gautam <varad.gautam@suse.com>
---
 crypto/rsa-psspad.c | 53 ++++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 48 insertions(+), 5 deletions(-)

diff --git a/crypto/rsa-psspad.c b/crypto/rsa-psspad.c
index ed5374c381513..4ba4d69f6ce17 100644
--- a/crypto/rsa-psspad.c
+++ b/crypto/rsa-psspad.c
@@ -105,7 +105,50 @@ static int pkcs1_mgf1(u8 *seed, unsigned int seed_len,
 	return ret;
 }
=20
-static int psspad_s_v_e_d(struct akcipher_request *req)
+static int psspad_verify_complete(struct akcipher_request *req, int err)
+{
+	return -EOPNOTSUPP;
+}
+
+static void psspad_verify_complete_cb(struct crypto_async_request *child_a=
sync_req,
+				      int err)
+{
+	rsapad_akcipher_req_complete(child_async_req, err,
+				     psspad_verify_complete);
+}
+
+static int psspad_verify(struct akcipher_request *req)
+{
+	struct crypto_akcipher *tfm =3D crypto_akcipher_reqtfm(req);
+	struct rsapad_tfm_ctx *ctx =3D akcipher_tfm_ctx(tfm);
+	struct rsapad_akciper_req_ctx *req_ctx =3D akcipher_request_ctx(req);
+	int err;
+
+	if (WARN_ON(req->dst) ||
+	    WARN_ON(!req->dst_len) ||
+	    !ctx->key_size || req->src_len < ctx->key_size)
+		return -EINVAL;
+
+	req_ctx->out_buf =3D kmalloc(ctx->key_size + req->dst_len, GFP_KERNEL);
+	if (!req_ctx->out_buf)
+		return -ENOMEM;
+
+	rsapad_akcipher_sg_set_buf(req_ctx->out_sg, req_ctx->out_buf,
+			    ctx->key_size, NULL);
+
+	/* Reuse input buffer, output to a new buffer */
+	rsapad_akcipher_setup_child(req, req->src, req_ctx->out_sg,
+				    req->src_len, ctx->key_size,
+				    psspad_verify_complete_cb);
+
+	err =3D crypto_akcipher_encrypt(&req_ctx->child_req);
+	if (err !=3D -EINPROGRESS && err !=3D -EBUSY)
+		return psspad_verify_complete(req, err);
+
+	return err;
+}
+
+static int psspad_s_e_d(struct akcipher_request *req)
 {
 	return -EOPNOTSUPP;
 }
@@ -114,10 +157,10 @@ static struct akcipher_alg psspad_alg =3D {
 	.init =3D rsapad_akcipher_init_tfm,
 	.exit =3D rsapad_akcipher_exit_tfm,
=20
-	.encrypt =3D psspad_s_v_e_d,
-	.decrypt =3D psspad_s_v_e_d,
-	.sign =3D psspad_s_v_e_d,
-	.verify =3D psspad_s_v_e_d,
+	.encrypt =3D psspad_s_e_d,
+	.decrypt =3D psspad_s_e_d,
+	.sign =3D psspad_s_e_d,
+	.verify =3D psspad_verify,
 	.set_pub_key =3D rsapad_set_pub_key,
 	.set_priv_key =3D rsapad_set_priv_key,
 	.max_size =3D rsapad_get_max_size,
--=20
2.30.2

