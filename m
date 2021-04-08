Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 12AAD3586EB
	for <lists+keyrings@lfdr.de>; Thu,  8 Apr 2021 16:18:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232156AbhDHOSa (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 8 Apr 2021 10:18:30 -0400
Received: from de-smtp-delivery-102.mimecast.com ([194.104.109.102]:20947 "EHLO
        de-smtp-delivery-102.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232168AbhDHORo (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 8 Apr 2021 10:17:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
        t=1617891452;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=GnrmaZwbgXiIv/rOu4TL6GUmzZbQVWq/QF975uCU+sE=;
        b=dilT9pfcIr2QbDWC154jGRfO6iNoSdxGD555ErI21vs4ahTHBxQx9ejVDhbfnpvO8c4+Sy
        grJNV4KRlk+p2QkeubDEg8YdQiUvMs4qVjFdgxORty5JYPn1s9rDDfJJKZ8bhMsvUBQuD4
        wyXD7XiNjyGwEpI/G0oYi+Q2MqmLly4=
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2111.outbound.protection.outlook.com [104.47.17.111])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-17-mwAIHhIrPtuF02ZRB0HTNA-5; Thu, 08 Apr 2021 16:17:16 +0200
X-MC-Unique: mwAIHhIrPtuF02ZRB0HTNA-5
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RAEmlPK8h90VVuqjeWOz2cVxYHFpVzXj0B6HCldgDypaxsfHl7noaCRseB4YtrskPjOyvuuE2tGxwg4/XNsLRdaIzxu3EgyzPqv27tY6enTofd1R/YFPhFK9TJj5BTpe2HDQX2Mww2YAq7VZfszZnJOEr30TLdr4zI58FeN90teqI+bSdWR4I1TG8mRfaBX3gk6XkQmf1MPGB384wr3Scsh/1YHC++FZbBZamBcTRmNHzY0syzb0abcJQIAbUkJ0JO0TvkP20of1pgpbRoAKVyW2+Z7LvrJOZXHKTmBypwWM79pT2dHi96cmpfXXhqzMXpumnxx+TBSzb/54ouuL9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N9fhs+zp4NcPCPGfLKrmGHO+qpgcx6wUB4XRLs0IAoo=;
 b=RYl35YT//oPvratuWJ2KakkSWG3BirExb8oGu5o3iPQfNylfzuH1L57x+5CDpBPs5QEudV8zQcXhedAe+DAgejBLSVCWEKgJMg0hV68+TNkV5wBzUSB0wEXQvGCjrYkeuV5lX5oshWKy7UtDNQu2hzZQK2OyDuDsQaoq82LcxjNBogjykm4zocCb+VS0VINePJPYrZXwtCTk7hQiT6tnfGmtVoQjagLjDnnnM6Qh/Cx+lbmCPciV9XZXtVrjuqOXvAHvMbSeE1fU/U/UDSygbemft/7LB8RFfA+L5HlCQK45/Zh+xrxjyQNODFt2guK04Uy1eaoynA4MWZ4XIKD6CA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=suse.com;
Received: from AM0PR04MB5650.eurprd04.prod.outlook.com (2603:10a6:208:128::18)
 by AM0PR0402MB3572.eurprd04.prod.outlook.com (2603:10a6:208:22::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.29; Thu, 8 Apr
 2021 14:16:55 +0000
Received: from AM0PR04MB5650.eurprd04.prod.outlook.com
 ([fe80::756a:86b8:8283:733d]) by AM0PR04MB5650.eurprd04.prod.outlook.com
 ([fe80::756a:86b8:8283:733d%6]) with mapi id 15.20.3999.032; Thu, 8 Apr 2021
 14:16:55 +0000
From:   Varad Gautam <varad.gautam@suse.com>
To:     linux-crypto@vger.kernel.org
CC:     varad.gautam@suse.com, dhowells@redhat.com,
        herbert@gondor.apana.org.au, davem@davemloft.net, vt@altlinux.org,
        tianjia.zhang@linux.alibaba.com, keyrings@vger.kernel.org,
        linux-kernel@vger.kernel.org, jarkko@kernel.org,
        James Morris <jmorris@namei.org>,
        "Serge E. Hallyn" <serge@hallyn.com>,
        linux-security-module@vger.kernel.org (open list:SECURITY SUBSYSTEM)
Subject: [PATCH v2 18/18] keyctl_pkey: Add pkey parameters slen and mgfhash for PSS
Date:   Thu,  8 Apr 2021 16:15:16 +0200
Message-ID: <20210408141516.11369-19-varad.gautam@suse.com>
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
Received: from xps13.suse.cz (95.90.93.216) by ZR0P278CA0137.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:40::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.16 via Frontend Transport; Thu, 8 Apr 2021 14:16:54 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e623a562-3742-4eec-f9a2-08d8fa98f6b3
X-MS-TrafficTypeDiagnostic: AM0PR0402MB3572:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM0PR0402MB357278367423FE175DF31558E0749@AM0PR0402MB3572.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:972;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: s52Pi7UpXJRp6WWS6WAwLFbfr2B4yxuyzJULYHHZ+VCEW0SP02jBTKZl2p+xyNeQPgJKy89Pymc4/m+Y00kCjSV7ITBSaDzQQqKCXEjqPZstT4D/AVCq12J8/n6rqMPRaEpIHb0eyVM19N6HIyGmKVjTHVc1qDFS/vcYXFMlqgPfHr+DZNQ3i/bWqq4oSU+rCV0LAvhE6f9fmRfL+H0ZYKkfgGy/ZGoxBsHzr3Wu/CkhCk/hSvldRKR6WiQ/Juw7HIcrT9So2a0kk5ZGMfvBSX1us5PELk0gIxcUXmmdtZMcFtnlsexajrVe04u67nsdoebl4m5qSSoz2O65AyEEuQ33f0CSaTtHtAuA+jaWUHv3+hetf4pvh6jrANXp9bzj/9e7x67oJGkkZdqEKe5rrBLcbgZv2kZaejVX9wLOzEj8mi9uSFUf62lT0kEm7DESWd4emQoeG6keAALP3IViFy+pe6VddThqlsNUHdIYGi83j97HMW+uUSRNsfbG3kH7/wW057bhb9nPhqhQ2wRiGLD/t3Wot+YNtpUjVjqyh/dJjWE3KqIO0vCQvSgPvW1+McewcVQBd6PJPQWGqnDwrswG4nBLhdGVi05WQI4mqCsQVUqgANw6/669tnyc+9mV41kRzlQ0ymtaUlM0D9RD29QQmM/tu0KLDfBgNp+KcWg2GTT4v1T0030Jx07Bt0Bh
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5650.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(39860400002)(136003)(396003)(376002)(346002)(366004)(16526019)(186003)(38100700001)(2616005)(956004)(38350700001)(54906003)(52116002)(6512007)(2906002)(36756003)(44832011)(6916009)(83380400001)(6666004)(8936002)(26005)(66476007)(66556008)(66946007)(4326008)(316002)(1076003)(6506007)(6486002)(478600001)(5660300002)(86362001)(8676002)(7416002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?6phw9izw0jEpewr6e+v+luN6tEbtsz/sgj2WYxwPBYXO4lwQuhYyCxM1jHnn?=
 =?us-ascii?Q?geosy2e4XHX/vp+NXnDaoGw+VQOuX1L4SiQGyEb932iqe3hcExXA4GzQSb0O?=
 =?us-ascii?Q?CCSWEdCjdRFE7fTMBl8tCY8mI8QX5nKDAQz5GCZ2cQJMKnB+ME7EasyF5WzE?=
 =?us-ascii?Q?bIETo1q/uzY58N2Ojyes/mr2MNnOOwOV5/EALVEOGRIw/PS/EJd08PRkGqTk?=
 =?us-ascii?Q?QLSpOM0yRDsb7FS8QWnHdOCr6Gkw6lsmhEXOyxJoiitb6fi0NclOCabIOSOf?=
 =?us-ascii?Q?rIGzPNAUiDAUfrXNSRWTkZ55sOQX8eOa6FJcbF0m7ME3rosE/1FgJZTILds3?=
 =?us-ascii?Q?MKm8mUcOVg2tUsodQDzx6hAxv6/ArqiprymxKbkpJTrnCqsLlAD5IwvKVrcS?=
 =?us-ascii?Q?1BhTZR8jr8DayqO5wtLVyEzBgcIPo9RUu1kPxWsYlyXf5iof37EgPnhYmaMc?=
 =?us-ascii?Q?UPP8pMcJvpim1eBZfxCRq1sk3gXFEHD89g8cjJ4PZ+RDsGKJdQlT1QszD6Ee?=
 =?us-ascii?Q?TniGmWxH0cm8ocXXTeDJhgRw+TKshBD/aL+/xLd9A/oZrkba33zTJTdIdTaI?=
 =?us-ascii?Q?glFxMYosybVEywOJUQZp8k5oVBW9Yu3FoSVBigPIJOn7bGJFlKBrJYVLIOfM?=
 =?us-ascii?Q?RyNgOJdlYnS1ZUP1NfgUpCO4ipnYlcF4PM6MOi25gAGez9XFIClTRv9yYYHQ?=
 =?us-ascii?Q?yPvdc+ox/3dW1eBTV1GXs9jzSgiRSfJ9iQvkpujyZuYODdyCBeMBCkVaV9Q/?=
 =?us-ascii?Q?urEr4o7YQ0XZ2cOBd47UTJzRjiFj8ReX0ofA7kisGgmOPngPfx8se20l7C9V?=
 =?us-ascii?Q?FeNI8ADgoYUa1ISQRnW5PZLFT9NvIsQM/OpkEFmgGBjrCaXyfe0Ghp9vwt64?=
 =?us-ascii?Q?L+/IrmjuhyxE2J651yA13t5F/HKRTOe8emizS17jLz66faz2SnjzGyQlqsXm?=
 =?us-ascii?Q?CwpLTYghDmYJ7POIRfJSA05yLqiwx0gQhdz2dX2S4EuWta01MOh/yUR3YD+N?=
 =?us-ascii?Q?hHby+g6x80AvEUIkzb/P+XoyHiyYY+G4Yz6YEenk4YdtN6sA0SqlNJlSemTR?=
 =?us-ascii?Q?U06bixFSqlk5BB+8mFHNP+FClLiURqpBX0GsRQPodEEpZaU7tI6bQurlE2Pf?=
 =?us-ascii?Q?G6fPR9BsvzgNnCmNo3/rjYrKBC3HCqpXaEgUVdxORMqGyItHoUWF8U/7D7iH?=
 =?us-ascii?Q?m8sonfax6iU3LbX44Xdn/h3eJnit4yLFE8bhSDhaHtH8oPRDRAnjiVDaBdzn?=
 =?us-ascii?Q?cBbzr+ApFppPSkkuglxe+pqvoN1iQT1vL86pD13DMKTDW8vDcmGNW0naLj8R?=
 =?us-ascii?Q?EgYEpF29I0k3RWqVFrspJqn1?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e623a562-3742-4eec-f9a2-08d8fa98f6b3
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5650.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2021 14:16:55.5247
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A0iuqT2y/54YgdH1AYpKrWiLvWF93qyve1tVV2kSAIxO8h3oe7vJaHP8y4hMqnpsDUqevmsSasSK5kBdDvLoGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR0402MB3572
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

keyctl pkey_* operations accept enc and hash parameters at present.
RSASSA-PSS signatures also require passing in the signature salt
length and the mgf hash function.

Add parameters:
- 'slen' to feed in salt length of a PSS signature.
- 'mgfhash' to feed in the hash function used for MGF.

Signed-off-by: Varad Gautam <varad.gautam@suse.com>
CC: Jarkko Sakkinen <jarkko@kernel.org>
---
v2: Accept 'mgfhash' as a parameter. v1 assumed this to be the same
  as the digest hash.

 crypto/asymmetric_keys/asymmetric_type.c |  2 ++
 include/linux/keyctl.h                   |  2 ++
 security/keys/keyctl_pkey.c              | 13 +++++++++++++
 3 files changed, 17 insertions(+)

diff --git a/crypto/asymmetric_keys/asymmetric_type.c b/crypto/asymmetric_k=
eys/asymmetric_type.c
index ad8af3d70ac04..72c1bf964826f 100644
--- a/crypto/asymmetric_keys/asymmetric_type.c
+++ b/crypto/asymmetric_keys/asymmetric_type.c
@@ -571,6 +571,8 @@ static int asymmetric_key_verify_signature(struct kerne=
l_pkey_params *params,
 		.hash_algo	=3D params->hash_algo,
 		.digest		=3D (void *)in,
 		.s		=3D (void *)in2,
+		.salt_length	=3D params->slen,
+		.mgf_hash_algo	=3D params->mgf_hash_algo,
 	};
=20
 	return verify_signature(params->key, &sig);
diff --git a/include/linux/keyctl.h b/include/linux/keyctl.h
index 5b79847207ef2..753d004d76ece 100644
--- a/include/linux/keyctl.h
+++ b/include/linux/keyctl.h
@@ -37,6 +37,8 @@ struct kernel_pkey_params {
 		__u32	in2_len;	/* 2nd input data size (verify) */
 	};
 	enum kernel_pkey_operation op : 8;
+	__u32		slen;
+	const char	*mgf_hash_algo;
 };
=20
 #endif /* __LINUX_KEYCTL_H */
diff --git a/security/keys/keyctl_pkey.c b/security/keys/keyctl_pkey.c
index 5de0d599a2748..ae3a81c726322 100644
--- a/security/keys/keyctl_pkey.c
+++ b/security/keys/keyctl_pkey.c
@@ -24,11 +24,15 @@ enum {
 	Opt_err,
 	Opt_enc,		/* "enc=3D<encoding>" eg. "enc=3Doaep" */
 	Opt_hash,		/* "hash=3D<digest-name>" eg. "hash=3Dsha1" */
+	Opt_slen,		/* "slen=3D<salt-length>" eg. "slen=3D32" */
+	Opt_mgfhash,		/* "mgfhash=3D<digest-name>" eg. "mgfhash=3Dsha1" */
 };
=20
 static const match_table_t param_keys =3D {
 	{ Opt_enc,	"enc=3D%s" },
 	{ Opt_hash,	"hash=3D%s" },
+	{ Opt_slen,	"slen=3D%u" },
+	{ Opt_mgfhash,	"mgfhash=3D%s" },
 	{ Opt_err,	NULL }
 };
=20
@@ -63,6 +67,15 @@ static int keyctl_pkey_params_parse(struct kernel_pkey_p=
arams *params)
 			params->hash_algo =3D q;
 			break;
=20
+		case Opt_slen:
+			if (kstrtouint(q, 0, &params->slen))
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

