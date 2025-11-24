Return-Path: <keyrings+bounces-3428-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D47FBC81C2B
	for <lists+keyrings@lfdr.de>; Mon, 24 Nov 2025 18:01:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 95AA43A90BE
	for <lists+keyrings@lfdr.de>; Mon, 24 Nov 2025 16:59:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D54D3168F7;
	Mon, 24 Nov 2025 16:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b="XSumWtZj"
X-Original-To: keyrings@vger.kernel.org
Received: from mx0b-002e3701.pphosted.com (mx0b-002e3701.pphosted.com [148.163.143.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF9153164AA;
	Mon, 24 Nov 2025 16:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.143.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764003577; cv=fail; b=KZTpxAJHJYjCF0xNdkbWasiaAdejJrhksnYvqs/hT7BEL7FKzjJ6Da1OgP8GPRT/S/DsbHA1+3VAZenSB934zdGHYzpha9XY/ZsyRTKPOt/g0k911qBslb/7XWvzkX+sjTAZNik0VNBgBpifuXCgjmhfbHxjER9CRO/djET9/2U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764003577; c=relaxed/simple;
	bh=uaMYzKxYpBOaJqM+fI4R+GfI0OrtCnqCcCjEPWkfp/M=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=dvDI5fuazmioDUvFfh8Sdm9vh8c1av1X4djcTPkonq3sIF2gF2s8eO3wWf2P6f2WfAiY5k5hcbxn3DsxYUAvwPvv8/y6ixnA6BReqB2l8LH6mNr6CjaQXRy72B8KrKtwSTK1E68zX/KdoDKJ2dQEyPHW7nUFprbIHAg8kfeZPwM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com; spf=pass smtp.mailfrom=hpe.com; dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b=XSumWtZj; arc=fail smtp.client-ip=148.163.143.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hpe.com
Received: from pps.filterd (m0134423.ppops.net [127.0.0.1])
	by mx0b-002e3701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AOFWh9F3057384;
	Mon, 24 Nov 2025 16:58:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps0720; bh=6y
	pipJ55nSRXVtLU1CpTAxfLvvg/tslKcVxUiSkzG1Y=; b=XSumWtZj+OghfgYNGk
	ncpo5bFHPgqnoJaFQPZC5iitgozGDUxJS4MQCo3iw+IaEYreNdvxjtLe1HoYEnal
	0Ujem8AxEQRPbE2j6TeU1qto50hBdhIxij+H5bx7gZaX4b3+ZteP6pYTV8KEbnAV
	YHQeBVasprBuNXk67vo0ex6hAZGqLZR+waYEkrutJSEoP8WUjwXo3IUakZOjxCSq
	svIBkkQMm0VR6TJvHyTeDQm6orUnuULJcpB88RaBxGdYonvueH5YrAp4W8+xb3Ic
	2fPgrLcoFgCwG6gLL67jb3WqaMe8a7mYqXXbQpe4B0sqKUfl2B8U/czRO0FpuMkd
	iXhA==
Received: from p1lg14879.it.hpe.com (p1lg14879.it.hpe.com [16.230.97.200])
	by mx0b-002e3701.pphosted.com (PPS) with ESMTPS id 4ampycb1x2-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 24 Nov 2025 16:58:54 +0000 (GMT)
Received: from p1wg14925.americas.hpqcorp.net (unknown [10.119.18.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by p1lg14879.it.hpe.com (Postfix) with ESMTPS id A0F6413072;
	Mon, 24 Nov 2025 16:58:51 +0000 (UTC)
Received: from p1wg14927.americas.hpqcorp.net (10.119.18.117) by
 p1wg14925.americas.hpqcorp.net (10.119.18.114) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 24 Nov 2025 04:58:41 -1200
Received: from p1wg14919.americas.hpqcorp.net (16.230.19.122) by
 p1wg14927.americas.hpqcorp.net (10.119.18.117) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Mon, 24 Nov 2025 04:58:41 -1200
Received: from PH0PR07CU006.outbound.protection.outlook.com (192.58.206.35) by
 edge.it.hpe.com (16.230.19.122) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 24 Nov
 2025 04:58:38 -1200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tO2y28a+xk2AQbjN5xMoRmNR6+gmsX2R2YvANYYcA2xmcXrhZ1de7Rv6C7Q1nLAiBjZX0eoFB68e6+gS7FKR2bd9Tg0QUS0g/6F1DwgUa9vEELKeByyMomdyyDz8TRKQrKRVSgOTKaSM39R1UyXRROxsPQorecqwOI7Fv5ccfJmuuV2VdRh+v1ddGVHj62gkl9H8aXbdyetPgWb84PkpBD1uTcKNa2iJf7jSZLh+eHVA55RFIyTtFIqJ0NRm+QVe6y+85kXofsmxCgQNLgtDHDr0I4Kj5VHrsiL/3ZpZaRXL0T8jxJ4rkB4pUpsO06SybQxIZ9xYoy1InSqRu7UuHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6ypipJ55nSRXVtLU1CpTAxfLvvg/tslKcVxUiSkzG1Y=;
 b=JY58tszoHbT76smRLA0sCcnQ+iShGqGlfIRJcYY0gW6ZqQEOoUVa6gkdrMyus7raIPD28GUp3Qe/R7rQVT6gtCShwvj+dxyh+/DKeylXKe71zLo73eV3S6TAqy1WR+sbIZN2AmlgNVja5T1e2ewzdGuTvABHYc40wqD7D1SI+aESPbavyTDqcoIvhvBmtyC+D6uQKYSNTlAHt4Ty3VOy0CbMl5tFGmwPZnMK+SPcFxp/7lVjb3I96fvun1pRyEP2YhJnQQ8I62GUr5qg13jYX1zjjtj8jv0ficvQB8dI0qn60FylPHv3W6xOXnRaInuqIKbXhaZZBcebeIn+QzIKJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Received: from IA4PR84MB4011.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:208:54f::12)
 by DM4PR84MB2119.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:8:4e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.17; Mon, 24 Nov
 2025 16:58:36 +0000
Received: from IA4PR84MB4011.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::766:753d:9ff8:1c8b]) by IA4PR84MB4011.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::766:753d:9ff8:1c8b%4]) with mapi id 15.20.9343.016; Mon, 24 Nov 2025
 16:58:36 +0000
From: "Elliott, Robert (Servers)" <elliott@hpe.com>
To: David Howells <dhowells@redhat.com>
CC: Herbert Xu <herbert@gondor.apana.org.au>,
        Eric Biggers
	<ebiggers@kernel.org>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Petr Pavlu
	<petr.pavlu@suse.com>, Daniel Gomez <da.gomez@kernel.org>,
        Sami Tolvanen
	<samitolvanen@google.com>,
        "Jason A . Donenfeld" <Jason@zx2c4.com>,
        "Ard
 Biesheuvel" <ardb@kernel.org>,
        Stephan Mueller <smueller@chronox.de>,
        "Lukas
 Wunner" <lukas@wunner.de>,
        Ignat Korchagin <ignat@cloudflare.com>,
        "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
        "keyrings@vger.kernel.org" <keyrings@vger.kernel.org>,
        "linux-modules@vger.kernel.org" <linux-modules@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v10 5/8] crypto: Add ML-DSA crypto_sig support
Thread-Topic: [PATCH v10 5/8] crypto: Add ML-DSA crypto_sig support
Thread-Index: AQHcWgsA/Ta3vqGsDEqJl2xmg9K4NLUBkPWAgAB+l8A=
Date: Mon, 24 Nov 2025 16:58:36 +0000
Message-ID: <IA4PR84MB40112676E313F24DCA0D31DFABD0A@IA4PR84MB4011.NAMPRD84.PROD.OUTLOOK.COM>
References: <20251120104439.2620205-6-dhowells@redhat.com>
 <20251120104439.2620205-1-dhowells@redhat.com>
 <3374841.1763975577@warthog.procyon.org.uk>
In-Reply-To: <3374841.1763975577@warthog.procyon.org.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA4PR84MB4011:EE_|DM4PR84MB2119:EE_
x-ms-office365-filtering-correlation-id: 1fe15357-10df-48fd-94a8-08de2b7ab5bc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?6KmEa8h5J+0Ci1IgiuEoS3NHGaVF7Mzj6m0uq3G1ZO13VXXxKotDKsGb1FDm?=
 =?us-ascii?Q?VKLa9tRScPZI/on72y5OOb6i8bU2Skd49YKjEOWDtwEXK3Gre6QXOXnhYUSu?=
 =?us-ascii?Q?0DhKkv7NdMvM1+7KLLwumDZkK7bw7I7L4MouamSNTkmfm1MOJ40zbHRC3Bv2?=
 =?us-ascii?Q?QzKFiqG6OK3sHYpGzK3B66SbuqVIIk09VtM8r2yjlFGmZN3VjevbIyjrNo4f?=
 =?us-ascii?Q?2luSltn59Ctzr488ETGN++h+ysStq9u2fVSYLIEExxM+obzfa5qjJKVMOZks?=
 =?us-ascii?Q?x/KtkDvoMyllqXMrBtCBQiY5c/qcSNn0KCORkEhcoSZBZC2XVFyfIrywh994?=
 =?us-ascii?Q?a68Dg+Y2954Jh1Pf2582U4E/3cBhNHJG5hnBO5f8yBQvbnWWOd6Syii2DD0O?=
 =?us-ascii?Q?6Wv1ShrEH4ADIqOIQJUznfhVRzmLH6uKtV5l0OGkTXDok+BpsqIctzamKG/e?=
 =?us-ascii?Q?09KMc2F7aB3NgcH6lzBjvzAIYx/aYdCe/svElqllwT/v+8JH6Y4QZRJ+y1qx?=
 =?us-ascii?Q?1qNhPyjQcOuXtRxN6mB2oLm9cYgmTP+X0B5sF4NYqtGAku0XmnqyYSmPA7I3?=
 =?us-ascii?Q?unnOQgMHfOCBZ3qh+/0VRrM1XEp9DnKeiiGncJDhSjRgfLU69wcy0+Gl6AWL?=
 =?us-ascii?Q?gab8Ib5MMqMBNTO8VL+gaeBRCsZrrgEV5T7C/OL6l0X9JcoMMrym4wA5Cfk7?=
 =?us-ascii?Q?Yttl+A3dpRRRU21Xj74m7vZSkzxtF1VM8ubuqjmoJtBEhbah6Br/ySmns8j1?=
 =?us-ascii?Q?RoelsyC3fFXaF9UgpyRBCesnttgKpZ7T9A8sjI/M0Re8cw/hr75c18xrKLUr?=
 =?us-ascii?Q?1AQ9RxN121Yz/oVe8lfPOoKMIyP7YAJ+LwiosAnxOJhZybmRCjxtXaJyUQQh?=
 =?us-ascii?Q?7RZslaCPq7uMLo6rKNf1yU9dUb1hWwKvzXE1HpZ1iuXK5vgP0WxDPZo+dRLC?=
 =?us-ascii?Q?Nat6pHtkXO1N2yJYskw0NQHiBLN9kCdX+c3pgEBttjJafv8z3HR/udMNoKbc?=
 =?us-ascii?Q?QeJPOMG9RjsDhlIYRaWU8XpYF6g4oMuYjIwpa1sIvC+Ci5zLZaT3FLKfR0o5?=
 =?us-ascii?Q?2oeibHHyTZ6LCT+T1UQ4dgbIFNChi6DilMICFGG0xyFXZdNl0lJLYYeKDMvs?=
 =?us-ascii?Q?DvVWEW7VaW003ZwcStc9zFvZUkxWlA6va7sGzvlVbKyPoysuG+2WnKz8DEkg?=
 =?us-ascii?Q?E3BmZvqHRC/ew93WWx+iQ7AbFgPE6DrS0A34HwxubO/iDEJAvjD42Cl0P/Lr?=
 =?us-ascii?Q?AsPgmW7nlTPLK5zbT1kkfwT64y2SQMPtxaAIEx2QXWTJju833wHdjKbYp/Wa?=
 =?us-ascii?Q?rVCmjTETVjQQL/G/Y9P2NyOpOdU4fQy5jSUpFHpmwAGEBMZ1ap4pnYKfuSzs?=
 =?us-ascii?Q?CvXBfSqotCeoei23f1qpGl6cHfoKfGQS0O7HwGi4AJkCXbphUpMLLS+Sboj5?=
 =?us-ascii?Q?ywpYnOIePZOaOP2benZ9a2XDKQrIs5CgVx4GfLW6pmIZe8KFC2+rjb94+dU3?=
 =?us-ascii?Q?nyYQem7qjw1VBATN9YW93iQ22a3jEIjWMzXz?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA4PR84MB4011.NAMPRD84.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ADI/IKFB7f+DULq2SvuqYdyn7n3uCyYuDr2LRiZcF87V0upUoCdlMPQjMvVU?=
 =?us-ascii?Q?E4qbtVYpbehvvQyFTZaBodpFR7ACztlZ3fzsZy8sm1ByO4HsMSTjq+t91UVV?=
 =?us-ascii?Q?XNSQ4ciMYnUfvnxid2zA0UUszOG7uze7AtF5wRTwh9tI8c0pisNYjFwYIJU+?=
 =?us-ascii?Q?hGZjuv3W7q0soodJX63JnexNlgFeHRYVDTbJKgdeLP4V2gFtAAw6UF2o77QD?=
 =?us-ascii?Q?Cn91utJcaH/tKTQl+06oCX3VzxhJwJm8XShayFJOfJyILT2Np4cOTiDZzx5t?=
 =?us-ascii?Q?Yc067vmpbltxkHGn9Y8r6Jrx6jgMRUfKg/Ynvue29TuuSwr3rxXwffrBtQde?=
 =?us-ascii?Q?tPSNesiVX74EMyMvdVrDLXn0zPocze6ijkhPN+5K+QQT7vfZWzwJek1e5rrh?=
 =?us-ascii?Q?ahsdXIpxCqvIKm6ubr82NQSRkaF4hWTyV59WBclynzelTpZLvDdDfdcU2amD?=
 =?us-ascii?Q?xadms0TYS6lXP4VxTBcAnbFwJUE8GXtGqpWor1e/DyyrgYrCnY7yQcXTBfqU?=
 =?us-ascii?Q?x2Ak+CJqgx7yO7LTCS19AVwSTLS5lrP9+kjuH3hygi90ZvHl0XZb3SyfCj3Q?=
 =?us-ascii?Q?kJ3VJjKM7C/ouzKgaxAzSVt7CB/RLETRxm0eH87SVuh4WIxlsZ3CaPCwP0km?=
 =?us-ascii?Q?uDYNqnvKx0Wzko076mEnl6GQ8Scp0+weZw0r0QRItV6PB8E0MZ6ZslqqvRx5?=
 =?us-ascii?Q?6EwvBT1zlQ4N3xyrRxhMUqTvTIYljDPvymep72dvkKP/vSQmCkSvDlv5OlmD?=
 =?us-ascii?Q?tAkf2MDPzHFaLu+L8iTVl52pzIS6GXkpseuE9k7obRYdb39fGNDy5Qknv1El?=
 =?us-ascii?Q?5zFE3dCBOZjDC6/DRUel3XypKGXhZUXVF0P5ZhyDUJZKcMg0C6m0h6Va9TUt?=
 =?us-ascii?Q?IcXMmYwPt0hTo4q4XxgZ4lnLKte72i1JM5FLxIhXTu8QelQGoEsGDFx9pryt?=
 =?us-ascii?Q?bI73tT/R3KE/G2qV4PBh2lqrW/vS43d2a8XV2pCvclT3sI3R7Gn0hPWu12tQ?=
 =?us-ascii?Q?oohZIMugzgPbtuURb1m0Nx1UAx7A0UpvKIEas3/58vwNE15LKiKYRTcUdoRf?=
 =?us-ascii?Q?PmGrOrikvJzXKxuvTyQ8a0l1W5lnvizoF0I+rIeQCDej7ETYHa099V+Oumrv?=
 =?us-ascii?Q?aNL5mcAd7n8idIb6s+j1wClD0lw7iyuioqFvaQcZE7ovh8XmNqp0X7l00glm?=
 =?us-ascii?Q?xhTgx3ROxLGxwSCX5UDEWZhjk3VanCUdWWOkhOsrR0LctXgEYKgs7gsBditO?=
 =?us-ascii?Q?NzQRClxNXPzfv0yrsG3FDh6+jLDF0yIGvYI7WxQGbIp1+fBAzAkMvr8EnEkK?=
 =?us-ascii?Q?DwjtcMFUKb2ArnwzOgBA+L8inPeNli08TwpuPgIjK1VJvuQY9mGK++LcQZW2?=
 =?us-ascii?Q?0+KoC7/OHxGXExt3W/uWVhBEp+b63NwsV8DXFnPuJ1uZODnIdFlZzlZvcict?=
 =?us-ascii?Q?0EBvOnral+onR1gjb+zFqoS2ZIsQl8T1f0uLC8SAKOPsLwYcVrgPapTxEKKZ?=
 =?us-ascii?Q?zA9Vkj9Bglkxpoy+TweKWoZgO24FKuIW3yMUVdzoCLzWFOlsYsZaFeAvxdbj?=
 =?us-ascii?Q?+7hhFVVHx+VV5erHcLY=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA4PR84MB4011.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fe15357-10df-48fd-94a8-08de2b7ab5bc
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Nov 2025 16:58:36.8016
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NqIUa5W2a1+fmtBt/oMRZfaV2B10OahJzLnR/uMmmXQWFbNZPomCD0Dx+wMfY3Bf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR84MB2119
X-OriginatorOrg: hpe.com
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI0MDE0OCBTYWx0ZWRfX/qO/7JIE9X0v
 tQ2/txigPF13TZhGR3x8+aSe+5+zkF0Qpw9UVFeG/pUa4nfjl5nAvJ4v0BwieqHoc/ZY6IXeRxh
 43nZ5RRSGw/o0vUsw5kA0lZ0HUORA/O8TtJAKm4O2pj6G2OxjKQScfQFhKxi70v9I40Lmgmtf7G
 T52/qKxwHATZvMXyvv7Jog7RnK93okxDc1C0O14hkhlJyZSI9x/c1C+4LQ4Y4osmQgzVeObh1fv
 jdP78gpZHmo1/mx5cIbwQTobkQVWR+6J0zcraLtl+bMA7z3fJl9dsGMqavPi0aG6r6BqLXI9lxQ
 8p/3h+gbYZKjaqE1+ktVLk8/0X0xiMwfkTUTkBEOw==
X-Proofpoint-GUID: FruMpRHzckE0Lh1na_Dw0UuLaux5cjmm
X-Authority-Analysis: v=2.4 cv=H5XWAuYi c=1 sm=1 tr=0 ts=69248ece cx=c_pps
 a=5jkVtQsCUlC8zk5UhkBgHg==:117 a=5jkVtQsCUlC8zk5UhkBgHg==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6UeiqGixMTsA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=20KFwNOVAAAA:8 a=QymhkicrzWL0Y4Y1XqQA:9
 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: FruMpRHzckE0Lh1na_Dw0UuLaux5cjmm
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-24_06,2025-11-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 adultscore=0 spamscore=0 phishscore=0
 malwarescore=0 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2510240001 definitions=main-2511240148

> -----Original Message-----
> From: David Howells <dhowells@redhat.com>
> Sent: Monday, November 24, 2025 3:13 AM
> Subject: Re: [PATCH v10 5/8] crypto: Add ML-DSA crypto_sig support
...
> +++ b/crypto/mldsa.c
...
> +static unsigned int crypto_mldsa_key_size(struct crypto_sig *tfm)
> +{
> +	struct crypto_mldsa_ctx *ctx =3D crypto_sig_ctx(tfm);
> +
> +	switch (ctx->strength) {
> +	case MLDSA44:
> +		return MLDSA44_PUBLIC_KEY_SIZE;
> +	case MLDSA65:
> +		return MLDSA65_PUBLIC_KEY_SIZE;
> +	case MLDSA87:
> +		return MLDSA87_PUBLIC_KEY_SIZE;
> +	default:
> +		WARN_ON_ONCE(1);
> +		return 0;
> +	}
> +}
...
> +static unsigned int crypto_mldsa_max_size(struct crypto_sig *tfm)
> +{
> +	struct crypto_mldsa_ctx *ctx =3D crypto_sig_ctx(tfm);
> +
> +	switch (ctx->strength) {
> +	case MLDSA44:
> +		return MLDSA44_SIGNATURE_SIZE;
> +	case MLDSA65:
> +		return MLDSA65_SIGNATURE_SIZE;
> +	case MLDSA87:
> +		return MLDSA87_SIGNATURE_SIZE;
> +	default:
> +		WARN_ON_ONCE(1);
> +		return 0;
> +	}

In case there's any way userspace can trigger those, I'd rather
not have any WARN stack dumps.


