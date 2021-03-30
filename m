Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6308F34F24E
	for <lists+keyrings@lfdr.de>; Tue, 30 Mar 2021 22:36:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231743AbhC3UgS (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 30 Mar 2021 16:36:18 -0400
Received: from de-smtp-delivery-102.mimecast.com ([62.140.7.102]:59295 "EHLO
        de-smtp-delivery-102.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232333AbhC3UgE (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Tue, 30 Mar 2021 16:36:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
        t=1617136563;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=9zKKEj6MKz/JIXNozOfbnLGlLfXIRj4Xfb3E1WrMoKc=;
        b=QoIRLP+Gz1Z/XJj0zaesd070/ZI+VjhJBkN6VLPoy7oqrrcj/6bLIF3a7uokpD8JhRDwyt
        LpWhd+7+/MUpxutVXeZnIf7FrQQeQu46OY+NDKz3y13ThOBx0qDrIM8F8lN0a/3dFjGhb1
        HRmBIN7IdvcTIpZWmO0gegx7SDtflTQ=
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2059.outbound.protection.outlook.com [104.47.13.59]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-2-1T9VMgkXOxK41rOU3XVbkQ-5;
 Tue, 30 Mar 2021 22:29:52 +0200
X-MC-Unique: 1T9VMgkXOxK41rOU3XVbkQ-5
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M9RUYUPo9OYm9Oyn1GvKp2/kmgv+ixw27L5yvljB4YwVZWF9T7K3W3UqQXga5EVnIBumqbsOg9gnKca4u9/4OgneGB+18n+rqMk8AwJx+RTGoLCcevqp6maFl3DbCBzDpH+h3P6C7Hn4Db3l1NW081A4ff++yurx0c3TkOPmkdFna0IVEk5EPc1DUjUDbyqC1vdzh3E+7i+qbsUq14Kg/RAu6RlZX+XCEmAUpJKzfUmRSSnur0RvuVOj2iWGSHVsvz7sZ6G3CLzuM+X3e+wTPv0IG9PL6iwVjeBeDvSIXlbNdsuOEU+IM2+a46ArO4/NsoP5QzZpmvFHobR0R077WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0PGs18I+TKe1h2xOALY1QG3g4J+7kNSWv6sCbnQ4WQ4=;
 b=A7TrO2Eut/GSeDfgTdDda2tw3c9WJL5OPxwBgklTpp83RsJcQV96y/ozrJWvad3aOq8v83vOhwI4wcWq8tjCecj8CWlAUzH3s0g012TestlCMKTzGokkD8ZOQ1aArqtxDbc7THIe0dzC/NtlY1vMdRPp20H0XKVNbexVziedjRVjQQ63QxsfY57TbgRKl7qEVTjOkD2NjY7spvyv+ebLbbi5qyHima6LS4l4zI6dUUO+X8pmP2yL2Cu8uS5osjx5/BA598hQItyVWmc59vE8IhjSpGqKrmFi1au2pLgyRhol9JS6Of9R67L+qkp+6O1PQPk/wIe9G4csaymJ6H4hlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=suse.com;
Received: from AM0PR04MB5650.eurprd04.prod.outlook.com (2603:10a6:208:128::18)
 by AM4PR0401MB2321.eurprd04.prod.outlook.com (2603:10a6:200:4e::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.29; Tue, 30 Mar
 2021 20:29:50 +0000
Received: from AM0PR04MB5650.eurprd04.prod.outlook.com
 ([fe80::40bd:b7d7:74a7:5679]) by AM0PR04MB5650.eurprd04.prod.outlook.com
 ([fe80::40bd:b7d7:74a7:5679%3]) with mapi id 15.20.3977.033; Tue, 30 Mar 2021
 20:29:50 +0000
From:   Varad Gautam <varad.gautam@suse.com>
To:     linux-crypto@vger.kernel.org
CC:     Varad Gautam <varad.gautam@suse.com>,
        David Howells <dhowells@redhat.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Jarkko Sakkinen <jarkko@kernel.org>,
        James Morris <jmorris@namei.org>,
        "Serge E. Hallyn" <serge@hallyn.com>,
        keyrings@vger.kernel.org (open list:ASYMMETRIC KEYS),
        linux-kernel@vger.kernel.org (open list),
        linux-security-module@vger.kernel.org (open list:SECURITY SUBSYSTEM)
Subject: [PATCH 18/18] keyctl_pkey: Add pkey parameter slen to pass in PSS salt length
Date:   Tue, 30 Mar 2021 22:28:29 +0200
Message-ID: <20210330202829.4825-19-varad.gautam@suse.com>
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
Received: from xps13.suse.de (95.90.93.216) by AM3PR03CA0066.eurprd03.prod.outlook.com (2603:10a6:207:5::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.25 via Frontend Transport; Tue, 30 Mar 2021 20:29:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 15ccd719-31f2-4bed-73b9-08d8f3ba91a2
X-MS-TrafficTypeDiagnostic: AM4PR0401MB2321:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM4PR0401MB23210F24916B0CC9D262E867E07D9@AM4PR0401MB2321.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:366;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CnLOumaz7PKgFVT5rwTmttS6CsR/9KTjcBVagzaidQr2+Lr478SDYx5/drqm9gTkef3dQTfCVLU5dZ2dKstUhp5i5OjY+WKrNRU6syyEojSv88WP0gBfQf3fSOs48cCalyq3Ou++xKAArLjMGTjDriW/xR3GTyL3G4+eq9iVQeQ5wU2BEfFBw5yqmCF/aT24xlJN58tTDxBOOG8k0tUFAEkn5EJfdX0BXoRyXUwIiyTD/Kg8+ie2cvfOVukU+rDdEejC2tjXN9pR4EvVRZe3r2jXQzJu6Y0c0qSS80wLOMtoW/WwqFmQOmh+lkAGt9m/hPXRhQWJWwFDpchQ6nsXQ/psolaQ2J9G6FaWxNcmUfK08M6PLimNOus1JlRVFU4b6sVzUpjzqm9sNh9JPR7OeE2910tpHsJES613msjvJIzBvSp2VKMMx3Hs4d4WzOIbKz3MKPKunppFzkfuVMlt2su13wUP3wQLAbTLW+KruSiCa7u/ZfFJ/KijP09EoJBZLd2Ij8jj622W/8T1RxuM0BRVDC1PPpVE8N5LVWmJ0P4JySVBALncf1XOOTCiFVSx/CXiyY2axKQuqXt5li76dH3bJ+NF2+RONocQwF98RcXwN4ch5fNIWm0rTIhv4os0K4Lq8sQHefFbpp9uYlUV0Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5650.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(346002)(136003)(376002)(366004)(39850400004)(478600001)(4326008)(8676002)(36756003)(186003)(6916009)(7416002)(38100700001)(66476007)(26005)(66556008)(8936002)(6666004)(66946007)(5660300002)(86362001)(54906003)(316002)(6512007)(1076003)(16526019)(52116002)(83380400001)(44832011)(2906002)(956004)(6486002)(2616005)(6506007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?IgddJZYhEEWDrsRka/46BTacDL53UkVauxk67rtWsZEO1uyoN3vP735hhIpl?=
 =?us-ascii?Q?Cq2c18whlE6CUUm9185CyKDpii8gICdpeUyDxJSof8EQlSMngirHaSJC30Bz?=
 =?us-ascii?Q?BTfEws9KHGVvK9cBusxIgdLT35EmV9V/gFGQAKU9D6ceNAF8V8nYcqvBcuKN?=
 =?us-ascii?Q?baInfH7ipoB8kamlO2boR81H5stfNe0I1RhT3y3GMPpTZxbc9BvG7g+qUrQt?=
 =?us-ascii?Q?SmmYqUU0WXpFcEARUPYV29JjdjnnkuEAPB0OCVmhS9p0zR6EEfqN1u+sn7WE?=
 =?us-ascii?Q?k3Z0M7DAJ14LxZBIL1XMmvWHs5SMTfGCG8BP0wFh4j6LaDLMLPq2EdH+7DtV?=
 =?us-ascii?Q?sXPhA5MLAtsCMseMVoKjcRxNsPqT718mhtdKWrR+vXM2ccH16PHI8QuM9lR/?=
 =?us-ascii?Q?rvCx/RDRNAr13O+Bdo4Jc66MuJiAOnU+S9gBctExcnrh3CDimlFQc+x45BKH?=
 =?us-ascii?Q?ss7DJKIKpn1N2Ro24/jyFA3zSRVnDRaewJpiQsQV6YCd3qE12BUSDED+9nYY?=
 =?us-ascii?Q?Ap3mtwC8rrBLCM2rMSyJs5+MiYwqLi2V2/ZC22cla8jpS1sD/V9OvOQSKZM6?=
 =?us-ascii?Q?yoBZulTbXfu1I0qT3sJaF5Af6BxG9TVdafmoSotBcvul1FnE9Bs5ySlLEdx4?=
 =?us-ascii?Q?aMIFGaxaJ4rgOxAAW8/jrrdpoz9qu+/uhTQhTDi3t5Wwk254y+H/0SkuDKFE?=
 =?us-ascii?Q?Tdy+3UBGG9Zi3nMkC6VbWSmiwVc4fF1wyrxoo97JoW4R8+wYLEfwhxNNvx2W?=
 =?us-ascii?Q?w+xVLSj/CTol3iRUyMGR0xX4zkjiJ23e2LfvZM0pFvRVe0seh+6+kOqV+KDL?=
 =?us-ascii?Q?ShwXEFv4D3umxmBpxlXpdPqGIUj0jIZlW1VfQgdR733AnxyV0RE32XSwp68Z?=
 =?us-ascii?Q?mkXOAgRsUVfCQn/111PRLN3GJ8CuPcthWc9LynqkA/fT+ctm5KbwEdKv/WAR?=
 =?us-ascii?Q?lvfJLU9V/oqHaTezZosxYFSYGK6lcoW3Al3yK8uJl+2lQRPf6L49t4Af3AW4?=
 =?us-ascii?Q?z++68y7y6kes9SjDbPvLgiTSwxCmbzhhJUIvxlmmjw9MZZP6Qm3YpFnQCy/E?=
 =?us-ascii?Q?5XmVHfTqOvyxZjgPlgjN/XmgPFtJZHAeLZifWYe0QPYNVNd9XpwhFIuc/Tpg?=
 =?us-ascii?Q?BkCAZWFUWpFYfVfPfp/ZEqHZCg38KsysYejR3Y30KUp3jMwlMUu59des4XZc?=
 =?us-ascii?Q?wgHchAAKTw95khXZ+dciOiAWrJ7wZdZGR2/xqVkJM+96ZneeoZe8/9ee5/Ph?=
 =?us-ascii?Q?CQdK4enEZmB0Xl1jwmx3sc7E45yRnMKbyOxwXEiaWresYqXbgm/hqfTgqbFj?=
 =?us-ascii?Q?Rrcv0A7CMvH/sprxcdYTWAuG?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15ccd719-31f2-4bed-73b9-08d8f3ba91a2
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5650.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2021 20:29:50.7613
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: STsh3HwcwDOQGFS8jMo1y5V4njnoPk7L7djVQks0ZqXw97i+4UsB1GwDH0r7cO+9k+J+pFsPbRv/PtxaT7Tw0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR0401MB2321
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

keyctl pkey_* operations accept enc and hash parameters at present.
RSASSA-PSS signatures also require passing in the signature salt
length.

Add another parameter 'slen' to feed in salt length of a PSS
signature.

Signed-off-by: Varad Gautam <varad.gautam@suse.com>
---
 crypto/asymmetric_keys/asymmetric_type.c | 1 +
 include/linux/keyctl.h                   | 1 +
 security/keys/keyctl_pkey.c              | 6 ++++++
 3 files changed, 8 insertions(+)

diff --git a/crypto/asymmetric_keys/asymmetric_type.c b/crypto/asymmetric_k=
eys/asymmetric_type.c
index ad8af3d70ac0..eb2ef4a07f8e 100644
--- a/crypto/asymmetric_keys/asymmetric_type.c
+++ b/crypto/asymmetric_keys/asymmetric_type.c
@@ -571,6 +571,7 @@ static int asymmetric_key_verify_signature(struct kerne=
l_pkey_params *params,
 		.hash_algo	=3D params->hash_algo,
 		.digest		=3D (void *)in,
 		.s		=3D (void *)in2,
+		.salt_length	=3D params->slen,
 	};
=20
 	return verify_signature(params->key, &sig);
diff --git a/include/linux/keyctl.h b/include/linux/keyctl.h
index 5b79847207ef..970c7bed3082 100644
--- a/include/linux/keyctl.h
+++ b/include/linux/keyctl.h
@@ -37,6 +37,7 @@ struct kernel_pkey_params {
 		__u32	in2_len;	/* 2nd input data size (verify) */
 	};
 	enum kernel_pkey_operation op : 8;
+	__u32		slen;
 };
=20
 #endif /* __LINUX_KEYCTL_H */
diff --git a/security/keys/keyctl_pkey.c b/security/keys/keyctl_pkey.c
index 5de0d599a274..b54a021e16b1 100644
--- a/security/keys/keyctl_pkey.c
+++ b/security/keys/keyctl_pkey.c
@@ -24,11 +24,13 @@ enum {
 	Opt_err,
 	Opt_enc,		/* "enc=3D<encoding>" eg. "enc=3Doaep" */
 	Opt_hash,		/* "hash=3D<digest-name>" eg. "hash=3Dsha1" */
+	Opt_slen,		/* "slen=3D<salt-length>" eg. "slen=3D32" */
 };
=20
 static const match_table_t param_keys =3D {
 	{ Opt_enc,	"enc=3D%s" },
 	{ Opt_hash,	"hash=3D%s" },
+	{ Opt_slen,	"slen=3D%u" },
 	{ Opt_err,	NULL }
 };
=20
@@ -63,6 +65,10 @@ static int keyctl_pkey_params_parse(struct kernel_pkey_p=
arams *params)
 			params->hash_algo =3D q;
 			break;
=20
+		case Opt_slen:
+			if (kstrtouint(q, 0, &params->slen))
+				return -EINVAL;
+			break;
 		default:
 			return -EINVAL;
 		}
--=20
2.30.2

