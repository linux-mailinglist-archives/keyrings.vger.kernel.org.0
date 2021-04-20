Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0505E365804
	for <lists+keyrings@lfdr.de>; Tue, 20 Apr 2021 13:49:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232417AbhDTLrt (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 20 Apr 2021 07:47:49 -0400
Received: from de-smtp-delivery-102.mimecast.com ([194.104.109.102]:20316 "EHLO
        de-smtp-delivery-102.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232296AbhDTLrV (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Tue, 20 Apr 2021 07:47:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
        t=1618919209;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Dtx1HpslgLwDNo+cZrr6/lfosvuJM0KIomZbB5ORQA8=;
        b=HkhJYVjC5qKjtK3f1fOySWwq0XVV5Mv+BFcsoXnkftbxI9BUqcLllXXwJ4Z4n11d/3PQgD
        baBDLB6wGna8pPgIuEA+8qCDDPIVaQfz3784UN+oLQ8dNkylxRaDUAajauOha8bt1bjf1W
        hwifVM8vCIM1C4cGxvZZKC6oLU6Iiww=
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2110.outbound.protection.outlook.com [104.47.17.110])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-35-JZg3QnJTPEubXxg26mwsqg-5; Tue, 20 Apr 2021 13:46:47 +0200
X-MC-Unique: JZg3QnJTPEubXxg26mwsqg-5
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DPOUozchl8cljvcVEVsRyOicRIKrJg+T24zDf5di82fqCedrSb2pOAejtcNXiMsFpUlh1MXeY/sGtpyzrzGNUqq7pJ+sPMkEECGvIxzRRtyOBvIFCi3s+cojVsqJN1CYUnWLTIHdkI2TckiDrGG25B3nNA02/AEuQbbyHZannJ0cp9aXZziteXD34JBdUMI57mk3luWU+W60CMtfcfBv9HVxGbh66U7AWHfgtTbM5pACW5zCrAjAUytVmd7SIrilGe7tr71nUahUL7ZgsGUdvJEsb7p41D89kLmO5nsvPQ0gZiQpTBwt0z7aq/HNvrYilk7il0UZDvsFiVAlt/djmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZXBTMCgIrSY1cHuJ/Qcn642Fg/21QQ2PFDUiHYMpMbc=;
 b=LkvrPewPDA6nlYK8IYhwR3PIOy07Y32udbZsINT4oVG9P3IqS9kNDizWE+sc/GHQJV2owwU7RhMKODOGFhNqabg3vMESN6oAcGRzzxC7Ll20bQfCuarQJCQi5kn6JceDAJDSe+wShDsLtIlNCETwQUSDCJdaT55kHpFDC6H0CL5akXodHthHXAUMZ3xo8jfxy+5kBi82NYt7o0Efvz5bBD21E8rGHFh9loJNwV3V2b8nDDGriGlbct202SXi8DWvecs/itgVEtwPIjQzKEiSTwDTjaJyg8slcvHgOL4MH1Tgm1WAUhjs3EXrhY/dREs3YsUqNz3Xtvt8f5buHY8GIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=suse.com;
Received: from AM0PR04MB5650.eurprd04.prod.outlook.com (2603:10a6:208:128::18)
 by AM0PR04MB4995.eurprd04.prod.outlook.com (2603:10a6:208:c4::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.19; Tue, 20 Apr
 2021 11:46:45 +0000
Received: from AM0PR04MB5650.eurprd04.prod.outlook.com
 ([fe80::756a:86b8:8283:733d]) by AM0PR04MB5650.eurprd04.prod.outlook.com
 ([fe80::756a:86b8:8283:733d%6]) with mapi id 15.20.4042.024; Tue, 20 Apr 2021
 11:46:45 +0000
From:   Varad Gautam <varad.gautam@suse.com>
To:     linux-crypto@vger.kernel.org
CC:     varad.gautam@suse.com, dhowells@redhat.com,
        herbert@gondor.apana.org.au, davem@davemloft.net, vt@altlinux.org,
        tianjia.zhang@linux.alibaba.com, keyrings@vger.kernel.org,
        linux-kernel@vger.kernel.org, jarkko@kernel.org,
        Ben Boeckel <me@benboeckel.net>,
        Jonathan Corbet <corbet@lwn.net>,
        James Morris <jmorris@namei.org>,
        "Serge E. Hallyn" <serge@hallyn.com>,
        linux-doc@vger.kernel.org (open list:DOCUMENTATION),
        linux-security-module@vger.kernel.org (open list:SECURITY SUBSYSTEM)
Subject: [PATCH v3 18/18] keyctl_pkey: Add pkey parameters saltlen and mgfhash for PSS
Date:   Tue, 20 Apr 2021 13:41:23 +0200
Message-ID: <20210420114124.9684-19-varad.gautam@suse.com>
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
Received: from xps13.suse.de (95.90.93.216) by PR3P189CA0083.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:b4::28) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16 via Frontend Transport; Tue, 20 Apr 2021 11:46:44 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8162cf49-5add-4cd2-0022-08d903f1f968
X-MS-TrafficTypeDiagnostic: AM0PR04MB4995:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM0PR04MB4995CFAFB7ABC6311669343AE0489@AM0PR04MB4995.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:765;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fuNmE30MKCe5WhlZc2k90IeNafgIFeNIRqFA88btmyhfpKhaOBfEUIHKH4BSyFo2HqLN/wrK005gwGqye8lVtaaDC387QH5/JP2Z5X/Pp2k6PG9nH+dO7xlBYqKNfTkynl7lQIZTUT2y7cmNjU/VfwqC/S5DMLWLDmezBuxPprEdi752PV4OzlREAjJ/jiSTnrfdO6d0Q2YMy3sEmAV7ixXvWd15ndQ1vnJpUilIfmeQaLiSBqh875XHrzToI4s/kZ6kfYN70w0VwGixboGhknSlVoKRU9xQtUQ3zAqktGdziFSFOeekO6ShjpYqZswZvA2ARQGdHvjgcfym8PfIJfCN1QeEKgzje2ymVHgZJSD69cCe+TWCd9h9B/BCewPcogvodKueg/7gfgtKeuSqCCqDFm8Y7ShvzR+L1RFATFzrAXoCfBHJDh8j3uYF6ucsfLAflfkOuE7Xs5o4WzF1+hZX01fnGYQChyDBGX7zgOYJzNKK8V1By6ZRBTz1AvgXUW0c1UeLHlHNDu4kk+Yj2r25imZLKQkHXOXb8qBAxL5GyjaxlG0zoWZUC1bGIcAnzQ/89zzwAA20vTaMz5razyMW6BukrUpikegrl7h6yUuljDd1Vh4J6lqItJJ9EIpItcUZGfiKWdvhsqKunPrA1g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5650.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(346002)(376002)(39850400004)(366004)(136003)(316002)(8936002)(83380400001)(6512007)(6486002)(52116002)(26005)(956004)(6506007)(54906003)(8676002)(16526019)(2616005)(7416002)(6916009)(478600001)(44832011)(4326008)(38100700002)(186003)(2906002)(66556008)(86362001)(66476007)(38350700002)(5660300002)(66946007)(1076003)(6666004)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?8D/zJbXtArmduRmpk9vkopRxsDcPL4JuRvXKvLjEgA18ukf6rOMd7OsZoIWj?=
 =?us-ascii?Q?iWkrshckotpuzxhXh1qLeTeR37iVo+EN1twxtBOxBzy/+PzJgHHdOVQV8u63?=
 =?us-ascii?Q?V6mNNtbsb7SsIz8ryeCwMFFqoRNOEGyNVnIdhSGlkfFNSEka/r30EZPC8jRB?=
 =?us-ascii?Q?Sb6GyEIOgS2COy4Wg980YrjIQJIiRcivG9GEUYWQAdgp0VHDE8inA8+49QAP?=
 =?us-ascii?Q?m+SzcejBWL+ZlrdXc3xKgSynl9XTfewQeAl9zbZryifB8mx+AZE+Mv/xa3kq?=
 =?us-ascii?Q?Cz37LeWt5IRa+tzWNN/dSUZtwQ2FQlP6aS+8aE0rw3TqpP8u+rwauO9Lkb+h?=
 =?us-ascii?Q?wRvZNqalsJPqa180yDOs5C6pbMgNaq/KcdPVEStXosOnZOrq6jiXREQsd96Q?=
 =?us-ascii?Q?qk0zHqijosny1BBA62NzgzSRpiSc/iSF9SniPZZ0vrAU2twIoe+Miskn2D1z?=
 =?us-ascii?Q?meby1otJaUvow6J5dzVGMLWhGu//xB+bCJySQh+alrY+JBnhix4qnxs1r9um?=
 =?us-ascii?Q?OQvmOR5oDxU8ELHYg2Ct/FPhim6dzNapTu6JpOEodKfzsYXLvazOfYv6F+xq?=
 =?us-ascii?Q?QeINwxZQeqQ0G8ccYbxeTK/DJsBtUM0tjjJGvGACx5iA7DMWxupOaXlFTUYV?=
 =?us-ascii?Q?TjKU6rbww/NE8wqkjkjTax5iO0Rpy6QrGx1GH4jKxOMI4UNpIactor/sZZkz?=
 =?us-ascii?Q?eiKlQzRj5kK5upL83p9QRXtnn16EPTU4vY8WsDj9PXumsmtrlMaIY94EpPS6?=
 =?us-ascii?Q?GaEQ0LR0nMoMc0oOCc/848QM7SDEBd4zMGDviQR6zdADTBd3r5j0TTuE4VsJ?=
 =?us-ascii?Q?Xe6OIxJrldBWRgl4I3oFvllXxGp9yEWcgEoKcx9VTgl9Iz1yl8CTiNcKw/IX?=
 =?us-ascii?Q?/3JeoquhD3/6PHAIQupxI9rIx5wjLa5P+uRaydMRSiNGXBBGBJZc+gj5XVIu?=
 =?us-ascii?Q?oSQJ16U116CnHB2TDXqrkrPj8H0KSsON7qVMkqy6LNBTSUWrDwvsIwOtNLHq?=
 =?us-ascii?Q?YLY3UNlMbmcmBu2YRelHUT3pUfGZho3KT2pWQUS/sp5HHMUTuVbHsXQtwfsW?=
 =?us-ascii?Q?PzqXunIcFBupozmHOtR8TMMJPcVsJMa4NwzPgisshqqi+vAszXPwohFpS/YL?=
 =?us-ascii?Q?k1KITDxzYd5KcJsb9Z80RBh0hpBHm4trIs/5Q8LdoziqrlQfLeRjN6I2cUjN?=
 =?us-ascii?Q?dj/hdf6LHCDNZF3SwHiyuQGktNDR2jiB+0F/6sYwGW2kCwGmupqB1c0TRnQL?=
 =?us-ascii?Q?B+ARgTfQPJQM+7OhX4BOp6Bt0FO9ABcVDQH/1hEW4T62f8HLUAsEB0Hgw3dL?=
 =?us-ascii?Q?abh63+OEtffHKGW9g89g0IXI?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8162cf49-5add-4cd2-0022-08d903f1f968
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5650.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2021 11:46:45.7009
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k31+wdv5d1mVNKQu2RNfaiKKgJnwDuHMRlNFXzI/XhugZZl2maVW92YAa7lSXgFey7ctSXBykdgOz+hhga48OQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4995
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

keyctl pkey_* operations accept enc and hash parameters at present.
RSASSA-PSS signatures also require passing in the signature salt
length and the mgf hash function.

Add parameters:
- 'saltlen' to feed in salt length of a PSS signature.
- 'mgfhash' to feed in the hash function used for MGF.

Signed-off-by: Varad Gautam <varad.gautam@suse.com>
CC: Jarkko Sakkinen <jarkko@kernel.org>
CC: Ben Boeckel <me@benboeckel.net>
---
v3: Rename slen to saltlen, update Documentation/security/keys/core.rst.

 Documentation/security/keys/core.rst     | 14 +++++++++++++-
 crypto/asymmetric_keys/asymmetric_type.c |  2 ++
 include/linux/keyctl.h                   |  2 ++
 security/keys/keyctl_pkey.c              | 13 +++++++++++++
 4 files changed, 30 insertions(+), 1 deletion(-)

diff --git a/Documentation/security/keys/core.rst b/Documentation/security/=
keys/core.rst
index b3ed5c581034c..4bd774c56899e 100644
--- a/Documentation/security/keys/core.rst
+++ b/Documentation/security/keys/core.rst
@@ -1022,6 +1022,15 @@ The keyctl syscall functions are:
 			which hash function was used, the hash function can be
 			specified with this, eg. "hash=3Dsha256".
=20
+	``mgfhash=3D<algo>`` In case of "RSASSA-PSS" ("enc=3Dpss"), this specifie=
s
+			the hash function used with the Mask Generation Function
+			to generate a signature, eg. "mgfhash=3Dsha256". Supported
+			hashes are: sha1, sha224, sha256, sha384, and sha512.
+
+	``saltlen=3D<salt_length>`` In case of "RSASSA-PSS" ("enc=3Dpss"), this
+			specifies the salt length as a u16, used to generate a
+			signature. Eg. "saltlen=3D32".
+
      The ``__spare[]`` space in the parameter block must be set to 0.  Thi=
s is
      intended, amongst other things, to allow the passing of passphrases
      required to unlock a key.
@@ -1700,6 +1709,8 @@ The structure has a number of fields, some of which a=
re mandatory:
 			__u32	in2_len;
 		};
 		enum kernel_pkey_operation op : 8;
+		__u16		salt_len;
+		const char	*mgf_hash_algo;
 	};
=20
      This includes the key to be used; a string indicating the encoding to=
 use
@@ -1707,7 +1718,8 @@ The structure has a number of fields, some of which a=
re mandatory:
      RSASSA-PKCS1-v1.5 or RSAES-PKCS1-v1.5 encoding or "raw" if no encodin=
g);
      the name of the hash algorithm used to generate the data for a signat=
ure
      (if appropriate); the sizes of the input and output (or second input)
-     buffers; and the ID of the operation to be performed.
+     buffers; the ID of the operation to be performed; salt length to be u=
sed
+     in case of RSASSA-PSS; and hash algorithm used with MGF for RSASSA-PS=
S.
=20
      For a given operation ID, the input and output buffers are used as
      follows::
diff --git a/crypto/asymmetric_keys/asymmetric_type.c b/crypto/asymmetric_k=
eys/asymmetric_type.c
index ad8af3d70ac04..2d3419509ec35 100644
--- a/crypto/asymmetric_keys/asymmetric_type.c
+++ b/crypto/asymmetric_keys/asymmetric_type.c
@@ -571,6 +571,8 @@ static int asymmetric_key_verify_signature(struct kerne=
l_pkey_params *params,
 		.hash_algo	=3D params->hash_algo,
 		.digest		=3D (void *)in,
 		.s		=3D (void *)in2,
+		.salt_length	=3D params->salt_len,
+		.mgf_hash_algo	=3D params->mgf_hash_algo,
 	};
=20
 	return verify_signature(params->key, &sig);
diff --git a/include/linux/keyctl.h b/include/linux/keyctl.h
index 5b79847207ef2..b0122ac6e11c9 100644
--- a/include/linux/keyctl.h
+++ b/include/linux/keyctl.h
@@ -37,6 +37,8 @@ struct kernel_pkey_params {
 		__u32	in2_len;	/* 2nd input data size (verify) */
 	};
 	enum kernel_pkey_operation op : 8;
+	__u16		salt_len;
+	const char	*mgf_hash_algo;
 };
=20
 #endif /* __LINUX_KEYCTL_H */
diff --git a/security/keys/keyctl_pkey.c b/security/keys/keyctl_pkey.c
index 5de0d599a2748..019f112474dcd 100644
--- a/security/keys/keyctl_pkey.c
+++ b/security/keys/keyctl_pkey.c
@@ -24,11 +24,15 @@ enum {
 	Opt_err,
 	Opt_enc,		/* "enc=3D<encoding>" eg. "enc=3Doaep" */
 	Opt_hash,		/* "hash=3D<digest-name>" eg. "hash=3Dsha1" */
+	Opt_saltlen,		/* "saltlen=3D<salt-length>" eg. "saltlen=3D32" */
+	Opt_mgfhash,		/* "mgfhash=3D<digest-name>" eg. "mgfhash=3Dsha1" */
 };
=20
 static const match_table_t param_keys =3D {
 	{ Opt_enc,	"enc=3D%s" },
 	{ Opt_hash,	"hash=3D%s" },
+	{ Opt_saltlen,	"saltlen=3D%u" },
+	{ Opt_mgfhash,	"mgfhash=3D%s" },
 	{ Opt_err,	NULL }
 };
=20
@@ -63,6 +67,15 @@ static int keyctl_pkey_params_parse(struct kernel_pkey_p=
arams *params)
 			params->hash_algo =3D q;
 			break;
=20
+		case Opt_saltlen:
+			if (kstrtou16(q, 0, &params->salt_len))
+				return -EINVAL;
+			break;
+
+		case Opt_mgfhash:
+			params->mgf_hash_algo =3D q;
+			break;
+
 		default:
 			return -EINVAL;
 		}
--=20
2.30.2

