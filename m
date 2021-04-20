Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE8903657FD
	for <lists+keyrings@lfdr.de>; Tue, 20 Apr 2021 13:47:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232364AbhDTLrk (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 20 Apr 2021 07:47:40 -0400
Received: from de-smtp-delivery-102.mimecast.com ([194.104.109.102]:26067 "EHLO
        de-smtp-delivery-102.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232277AbhDTLrS (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Tue, 20 Apr 2021 07:47:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
        t=1618919206;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=15vXHCaH+YxkEfgrwleV2XzhWAoSPQq0tNygd8qDnyQ=;
        b=jsRBdmJbGZLzJYJOXfqd1n8QcUbjIn+Dhc4qafVEydS4/ZR1aUaiPzZeuiB0ka9S6YYSI9
        av1vpH+OssJtaLrVh/wK132Kq4DJWyc9Ffu6W4qDXPN3HvrqulKIfQuAjqRvWOQtzXQ4SG
        jopM7XV+51mUxnS1d9f7Yry4+c5ZXuI=
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2110.outbound.protection.outlook.com [104.47.17.110])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-35-FwvRfpuENhuPFDjRU7qOpA-3; Tue, 20 Apr 2021 13:46:45 +0200
X-MC-Unique: FwvRfpuENhuPFDjRU7qOpA-3
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y/qJEbjJmljhtXuhBlriYsGFyylTEH8vdTq5sla0r2ZGSbCwfBHjhJzJf26VPxlZfQO3E33lJ6kuLf8j98oCkx1AVqy8t63y5t4TGSfwUvbNClJp3kSDv0QokMMo158uGxtH+FAEK85TYqtzJ0G93OYv9acMAkox800tL8SNBawP02knA6JkWIuzExaHYtQzwQOb+hsg+Mi+yDW2FJKjiWEGCvEIaL6BJysdho4KZqPdp0H8QRlcWxY80sPGw+64lvDfIKKZxbggS+feu9DLomp19khw+wPlGfZX3jJlsEGaz0dUB5JVtpk4Q4QExdjNNEOMBHQNHlQ1F+Uv1viPoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4kR0kbogPVyQdnEOdtWYnJSMAeXbwjz7KpE1s1gMeyo=;
 b=JC1L6I4YeZt924mYyEHM1Ef6A/CI+q7nf5F/LRi9fDBBIcbmVQ+txeQ6YGhdhFPXNlmUHvmZ0gFxJm0vSojmdv7yPmbVEHtGIVF9jDe0gw3U5Am87qn/EorWNUtCkaKybaF+lemRSMlc8xdv3iK2J34HRoDHL/vrPC9Sxd0nREOLfkbZZiZtkMf7Z79bh/fNuMYMvUY0Vi92Tl4E7QsfYEpKBk3nJmX7P+u0VFkazEcRkvHzdxj/3Wcc82muytGV169Ymb5PNtidqXr+/7gZ5UJeIPIzY3mWEWftPwl1RKPncFwuc5i/O9lf83Pyi8UxxYT/dAD2UrIGtpAFrbq6Ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=suse.com;
Received: from AM0PR04MB5650.eurprd04.prod.outlook.com (2603:10a6:208:128::18)
 by AM0PR04MB4995.eurprd04.prod.outlook.com (2603:10a6:208:c4::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.19; Tue, 20 Apr
 2021 11:46:43 +0000
Received: from AM0PR04MB5650.eurprd04.prod.outlook.com
 ([fe80::756a:86b8:8283:733d]) by AM0PR04MB5650.eurprd04.prod.outlook.com
 ([fe80::756a:86b8:8283:733d%6]) with mapi id 15.20.4042.024; Tue, 20 Apr 2021
 11:46:43 +0000
From:   Varad Gautam <varad.gautam@suse.com>
To:     linux-crypto@vger.kernel.org
CC:     varad.gautam@suse.com, dhowells@redhat.com,
        herbert@gondor.apana.org.au, davem@davemloft.net, vt@altlinux.org,
        tianjia.zhang@linux.alibaba.com, keyrings@vger.kernel.org,
        linux-kernel@vger.kernel.org, jarkko@kernel.org
Subject: [PATCH v3 16/18] crypto: rsa-psspad: Implement signature verify callback
Date:   Tue, 20 Apr 2021 13:41:21 +0200
Message-ID: <20210420114124.9684-17-varad.gautam@suse.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210420114124.9684-1-varad.gautam@suse.com>
References: <20210420114124.9684-1-varad.gautam@suse.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [95.90.93.216]
X-ClientProxiedBy: PR3P189CA0083.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:b4::28) To AM0PR04MB5650.eurprd04.prod.outlook.com
 (2603:10a6:208:128::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from xps13.suse.de (95.90.93.216) by PR3P189CA0083.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:b4::28) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16 via Frontend Transport; Tue, 20 Apr 2021 11:46:42 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 84e4983b-5885-45ef-df4b-08d903f1f7d3
X-MS-TrafficTypeDiagnostic: AM0PR04MB4995:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM0PR04MB4995D2291B4FA5F99D9CE4ECE0489@AM0PR04MB4995.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:473;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Yu2LnJhFqxAc7UbnnElsGlyhRcCv8C0vIGnNX1SrVTMLj8ShC469YmA5TdUhwLBOBz9OeJoxlZBxAmJ/36VE7PcGy310xvVX16TThJRV2OT9ibnLX1WEHSt0fzFJR5Z8FoARNBWT5VBOKZ+2zf+ACKVfuix9Ibkt/yQMJNWAy+OnTA/hP78vCL9sbqdEJTLS2pTCsjxs4QJCJ5CIReVS3ip+kuLnQnDVZ1X0SuHwUCrE8Mj5j7kmJyFXL0qjc6EjDCo/SH9uMr5fBfqy0YsgD40XKaki9HXNc7ATgg2bS+fgAY/jNQTU+eWnnWkeSfw0MdMv3GC2HBUytqHPn3BZhGCzLbn7Q+a/NHSfbvQHT3bd6W2ZNGfV3ACo+/CVMkkGiLCmC7rzdi81SdVGASkBFdmgIhyeuayayonvPIIiLkO8ngUGXlfuUTbxsBgzL1fSy0BWb5/ycGugM2fDbjdnaUcIvufKfDx7TWtJOf9HdW50DHtgDTnUmQqYgHPCPgLT7KJ8jI8s5ANdaQOUhssuuGIGUle+0jf3AmvSdrEhene8MZqUkfsovS7kPFfQikc55ES9yrZHQpkAiJD8hRIMx05SILCwGRV2b9kHyH482hxErW5ZfoYNVxmDB0XaHyjpS1g6rAOHw9bzmmBbnS3tP5Fl2JnZLo3L3IsIps853kExmfZDayayM90IHkon8sZD02rjWj5+OEn0d9unigtCMjcsTDnOGCDl+e+rPWQcGQk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5650.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(346002)(376002)(39850400004)(366004)(136003)(316002)(8936002)(83380400001)(6512007)(6486002)(52116002)(26005)(956004)(6506007)(8676002)(16526019)(2616005)(6916009)(478600001)(44832011)(4326008)(38100700002)(186003)(2906002)(66556008)(86362001)(66476007)(38350700002)(5660300002)(66946007)(966005)(1076003)(6666004)(36756003)(15650500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?+hsIeiRW99cVYdkeDdDL+aUwOHYoxJQg0N6kWDphu43PmcIlHLcaR8Tn5kqF?=
 =?us-ascii?Q?lqp18L6QGmzeJ8tynQoggpAV67SRhNbpM4H/Vja6rJONOhIOmYxBkdZEdVeU?=
 =?us-ascii?Q?JRX/Y2GqT3G5sg4i3ebHNdo/vtcxsQo83QEFYUzzP5ExTUtzsOqCNmDgtrjI?=
 =?us-ascii?Q?W6fKWVDPJUqPprbUQi96WtpiAiyq6Nmw7aMVAGcW7U6ULIgmzCG7/+tO0zjm?=
 =?us-ascii?Q?NNFHK3f3pl/vjepWUC5kdGd4vgEFxtsp1PI5iu6tIgoCLWtuLaYRhdT3i4WC?=
 =?us-ascii?Q?fd0XXHRQaXP1YgeM7vdlxkCNkmgnvO86nUMRgd0jN2muOt5Fv1gBNQGxiuhH?=
 =?us-ascii?Q?AoDCD7GixwFzYQWsy40wIRTEpRPZrw2mAnzG6juEKVuO+Ktr0H1oZxfhNCTF?=
 =?us-ascii?Q?0eMqBU2+W+4UdVbmMeDNwXy8Xhks7fPsOXaIpImYX8BR5Ov7w1dg92bYYOyj?=
 =?us-ascii?Q?Y4SY5GZdRP62+MeMfdIHguoz2fknQH/MpDf4+ZyFms/9lXhaYyFJV+Xa5qdG?=
 =?us-ascii?Q?8XesZ/SiDY745uktPpwdgf/p+so/yd5z2entbMIzD51YJVNXCVyATlsiEY0t?=
 =?us-ascii?Q?g4N0+eWE0XIhAC7Nw7mYuU29fZiT4sgd6p4bS/b0rr9rOmJiOie47Cx24stS?=
 =?us-ascii?Q?+jc8K8g7mdNwnw2C1ZZM3F1IDx0cAn5UUaKV/cRryMxJezB4pgqbOejZYwPO?=
 =?us-ascii?Q?XMCMISelAD2aMCmBEyrmjvzN0YmG5HtpkCHNbJrMV7/CR16Kbtkk2XWi+78I?=
 =?us-ascii?Q?godQ+nKQ4VocfsN6W5+ukFQF8PgKVWdCDHxXzpvC1ZKL+OA73IbfMyN1jLfo?=
 =?us-ascii?Q?R6PcUGOlJEMCtSg37hEUDYQgp94blbTW4wcEn2C3ZJpePHZ/I+83SlOuQahu?=
 =?us-ascii?Q?GRZyPo2iYwEN85kFXrAQRJGu5OCn34apcXXeRbx5IslpB2PeiY2BfNA2h5J1?=
 =?us-ascii?Q?PlvloUqvoPZjxgCkQpLiFVOZAaq5qUCyrfTsJyd8BECn9RnDfFkHH5PPvhO/?=
 =?us-ascii?Q?73LPnHBvuCcZ09BI2Dd0fQap/QjDKVHnemQKy/tLQm+O4Y/pwVjMrCikp0ml?=
 =?us-ascii?Q?erpGbihTalkmB6Xy8wiSOQe8ms/HTCPZHHni7wzxZ79KKDoCKGl55uxr6yn5?=
 =?us-ascii?Q?Td5VsWxzDlFoZ3PVkElU/exxm1f4eyRuq0lyhhPrxGUz4fFuIwsuyhgHT0nS?=
 =?us-ascii?Q?6/uqfrUXzL/heImdHBcA1t6t0EWdjK/YzIHSzSu8dgYxoYOPvhHsOgBHdzuM?=
 =?us-ascii?Q?0XEEA0TfzdVreqfZA+o4bW3nE9LIVSvkUo8Hq9L9tXMjnyhGifIMlZMuF+qE?=
 =?us-ascii?Q?r3L9G0m9Iv+cLQitGcFLbZuN?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84e4983b-5885-45ef-df4b-08d903f1f7d3
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5650.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2021 11:46:43.0544
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZVy2w3WCe7FSL+Dk2OTfWcRMQuJ0/q1wK5x0EdqhRxcgaAW2G3bEkTJVoQ+gMkv6mLv/mLWz2EsIy7eqlKlWnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4995
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

The RSA output must be processed as per the EMSA-PSS-VERIFY operation
from RFC8017, which forms the core of the PSS signature verification.

Implement the verification callback, which operates on the RSA output
buffer.

Reference: https://tools.ietf.org/html/rfc8017#section-9.1.2
Signed-off-by: Varad Gautam <varad.gautam@suse.com>
---
 crypto/rsa-psspad.c | 114 +++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 113 insertions(+), 1 deletion(-)

diff --git a/crypto/rsa-psspad.c b/crypto/rsa-psspad.c
index 4e8525d89172d..c6f8fb43cb01e 100644
--- a/crypto/rsa-psspad.c
+++ b/crypto/rsa-psspad.c
@@ -8,6 +8,7 @@
=20
 #include <crypto/hash.h>
 #include <crypto/internal/akcipher.h>
+#include <crypto/internal/rsa.h>
 #include <crypto/internal/rsa-common.h>
 #include <crypto/public_key.h>
=20
@@ -126,7 +127,118 @@ static int pkcs1_mgf1(u8 *seed, unsigned int seed_len=
,
=20
 static int psspad_verify_complete(struct akcipher_request *req, int err)
 {
-	return -EOPNOTSUPP;
+	struct crypto_akcipher *tfm =3D crypto_akcipher_reqtfm(req);
+	struct rsapad_tfm_ctx *ctx =3D akcipher_tfm_ctx(tfm);
+	struct rsapad_akciper_req_ctx *req_ctx =3D akcipher_request_ctx(req);
+	struct akcipher_instance *inst =3D akcipher_alg_instance(tfm);
+	struct rsapad_inst_ctx *ictx =3D akcipher_instance_ctx(inst);
+	const struct rsa_asn1_template *digest_info =3D ictx->digest_info;
+	struct crypto_shash *hash_tfm =3D NULL;
+	struct shash_desc *desc =3D NULL;
+	struct rsa_mpi_key *pkey =3D akcipher_tfm_ctx(ctx->child);
+
+	u8 *em, *h, *salt, *maskeddb;
+	unsigned int em_len, em_bits, h_len, s_len, maskeddb_len;
+	u8 *m_hash, *db_mask, *db, *h_;
+	static u8 zeroes[8] =3D { 0 };
+	unsigned int pos;
+
+	if (err)
+		goto out;
+
+	err =3D -EINVAL;
+	if (!digest_info)
+		goto out;
+
+	em =3D req_ctx->out_buf;
+	em_len =3D ctx->key_size;
+	em_bits =3D mpi_get_nbits(pkey->n) - 1;
+	if ((em_bits & 0x7) =3D=3D 0) {
+		em_len--;
+		em++;
+	}
+
+	h_len =3D req->dst_len;
+	s_len =3D ictx->salt_len;
+
+	if (em_len < h_len + s_len + 2)
+		goto out;
+
+	if (em[em_len - 1] !=3D 0xbc)
+		goto out;
+
+	maskeddb =3D em;
+	maskeddb_len =3D em_len - h_len - 1;
+	h =3D em + maskeddb_len;
+
+	if (em[0] & ~((u8) 0xff >> (8 * em_len - em_bits)))
+		goto out;
+
+	db_mask =3D kzalloc(maskeddb_len, GFP_KERNEL);
+	if (!db_mask) {
+		err =3D -ENOMEM;
+		goto out;
+	}
+
+	err =3D psspad_setup_shash(&hash_tfm, &desc, ictx->mgf_hash_algo);
+	if (err < 0)
+		goto out_db_mask;
+
+	err =3D pkcs1_mgf1(h, h_len, desc, db_mask, maskeddb_len);
+	if (err < 0)
+		goto out_shash;
+
+	for (pos =3D 0; pos < maskeddb_len; pos++)
+		maskeddb[pos] ^=3D db_mask[pos];
+	db =3D maskeddb;
+
+	db[0] &=3D ((u8) 0xff >> (8 * em_len - em_bits));
+
+	err =3D -EINVAL;
+	for (pos =3D 0; pos < em_len - h_len - s_len - 2; pos++) {
+		if (db[pos] !=3D 0)
+			goto out_shash;
+	}
+	if (db[pos] !=3D 0x01)
+		goto out_shash;
+
+	salt =3D db + (maskeddb_len - s_len);
+
+	m_hash =3D req_ctx->out_buf + ctx->key_size;
+	sg_pcopy_to_buffer(req->src,
+			   sg_nents_for_len(req->src, req->src_len + req->dst_len),
+			   m_hash,
+			   req->dst_len, ctx->key_size);
+
+	if (strcmp(ictx->mgf_hash_algo, digest_info->name) !=3D 0) {
+		psspad_free_shash(hash_tfm, desc);
+		err =3D psspad_setup_shash(&hash_tfm, &desc, digest_info->name);
+		if (err < 0)
+			goto out_db_mask;
+	}
+
+	err =3D crypto_shash_init(desc);
+	if (!err)
+		err =3D crypto_shash_update(desc, zeroes, 8);
+	if (!err)
+		err =3D crypto_shash_update(desc, m_hash, h_len);
+	if (!err)
+		err =3D crypto_shash_finup(desc, salt, s_len, m_hash);
+	if (err < 0)
+		goto out_shash;
+
+	h_ =3D m_hash;
+
+	if (memcmp(h_, h, h_len) !=3D 0)
+		err =3D -EKEYREJECTED;
+
+out_shash:
+	psspad_free_shash(hash_tfm, desc);
+out_db_mask:
+	kfree(db_mask);
+out:
+	kfree_sensitive(req_ctx->out_buf);
+	return err;
 }
=20
 static void psspad_verify_complete_cb(struct crypto_async_request *child_a=
sync_req,
--=20
2.30.2

