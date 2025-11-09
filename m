Return-Path: <keyrings+bounces-3316-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B5F2C44677
	for <lists+keyrings@lfdr.de>; Sun, 09 Nov 2025 20:55:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 3708C343C08
	for <lists+keyrings@lfdr.de>; Sun,  9 Nov 2025 19:55:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC907224220;
	Sun,  9 Nov 2025 19:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b="n3GbSTdm"
X-Original-To: keyrings@vger.kernel.org
Received: from mx0b-002e3701.pphosted.com (mx0b-002e3701.pphosted.com [148.163.143.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4877820A5E5;
	Sun,  9 Nov 2025 19:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.143.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762718116; cv=fail; b=n6VMmVCosTfxfT5H33hfcziQikafVRCY2xMSluvV/6nf1fcWXVpTZBiZeaQH2fLCwb0111ZPk930olPKFCWm5kOsRlQ1KSooLQTGsPTgnpCchX/yE6NiO37g2glxGp6sQYtCvP9F3pjLkjCogZr5fVAAWuH94S6yUtkPxYU2JRY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762718116; c=relaxed/simple;
	bh=XoHcVDCrXdBjYM7pKegA1K+oXMwGnKOr+31RHo8ZHQo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=WqesYwhj83sRU9hKfPT/UMqLrDsPQkM4zxr7yGmMgNtpJGbF98xBriz1GS6iQHUE7A0IyK+vVH76VCUPiVM8PJrDbfSZGmBTzFnfb2jAihmt5GUvw5OzFIXU/XRHnY9wcoJEXtnaToLX7BYussFCePyphm3SBUqGM334ljU4NmY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com; spf=pass smtp.mailfrom=hpe.com; dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b=n3GbSTdm; arc=fail smtp.client-ip=148.163.143.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hpe.com
Received: from pps.filterd (m0134424.ppops.net [127.0.0.1])
	by mx0b-002e3701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5A9CX9js022058;
	Sun, 9 Nov 2025 19:30:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps0720; bh=tp
	jPBNHzUDO9no1xyrNr5MVBtYzKcNHwtDoYJFshIV8=; b=n3GbSTdm+7TrzVmOeI
	zrexGvVq+dYwOjnou/ivlZV+S/IgGgxVMIennNA2uzpUM8C+Lb14fi0L9C787bJv
	to/Oq48RiZAKj5gtIYNgF3p5qEmkiJ6ZNwc6ZPN30SXgGK0RQ+4hmKzm1Ag8rMLX
	vEQuLq16yOvl3hFLn2nEleH2RaEO1kQLbbqijXnh2nKt0pb72OtE9XOivN9SOumc
	aTm4NCjZXK6Rw2fBmSneqOFrPs0crLHBEoX8mSygBomnKdJBLZnVHF6F5eqTY62h
	f8wDXu1aBpQOVetZHK+AgyDoNpaaAxX3drhuSZBV5P6I9PuonRmhDkLFKCHWHAoG
	p00g==
Received: from p1lg14881.it.hpe.com (p1lg14881.it.hpe.com [16.230.97.202])
	by mx0b-002e3701.pphosted.com (PPS) with ESMTPS id 4a9vuyak30-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 09 Nov 2025 19:30:26 +0000 (GMT)
Received: from p1wg14924.americas.hpqcorp.net (unknown [10.119.18.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by p1lg14881.it.hpe.com (Postfix) with ESMTPS id 3A861805656;
	Sun,  9 Nov 2025 19:30:24 +0000 (UTC)
Received: from p1wg14923.americas.hpqcorp.net (10.119.18.111) by
 p1wg14924.americas.hpqcorp.net (10.119.18.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Sun, 9 Nov 2025 07:30:23 -1200
Received: from P1WG14918.americas.hpqcorp.net (16.230.19.121) by
 p1wg14923.americas.hpqcorp.net (10.119.18.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Sun, 9 Nov 2025 07:30:23 -1200
Received: from BYAPR08CU003.outbound.protection.outlook.com (192.58.206.38) by
 edge.it.hpe.com (16.230.19.121) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Sun, 9 Nov
 2025 19:30:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jIcKYZWhEMWhSWlmHZ7/XIUyQ/FP4sIp4JcYILmCeM0t+XctlGafu7ZorxJvMvtYjz4v7tJyoLw1IygMCJ2YfO7XUUJj5A1WW2PJCjfo5x0NzfRxPNTJ6Kp/Zka9dUUWi+J902kF65sFqyexcLrqLZlEMbiHdoxXjz1r4o9FftRHnEdG+qwY6zKLSRJavF4/Qt7OnAXdfMzhUk7kjTM9KUrfE84ok46XTUNdb82JqEY4ngdhk6jezURX85azn1o6OboXSQUqNwho1RjsaBJ4VzP7uxtdN5D6b7kvq2vSRV/1d9hp8xDIRgyAwEyRqn6y30ganEWUEdd90w11A1nicg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tpjPBNHzUDO9no1xyrNr5MVBtYzKcNHwtDoYJFshIV8=;
 b=oaYUteUOoB8PaaG/bRtNsaqY4BRxhSRAvNbjSOr2fJ4IMHYPFCyAAThkK1ikP7Ld9O2upQDCyXDfkWc6TxaGMmdkmyFVd3TtpqFuZQcwIR7dfvatzzy35tHdn06gy8VY6YZuBOnodQ3uJhh6TNQXAsyye32uXSwikS8f5IFQV2XBIB8N2LRwWRWRJEwGW+eitDudtnkd0ksOr0W2TRu8HcZjiyAHuN+0hStgVzSxXyaxzmPUp4YnIkqJboe5WDQ8SYJPuNJzD+8WH+jCUTJPmrBB306hEkSSB2UsTrpBPr37HeXx6+EZnFKAczmYJosomkhLN+879GbP9f6K4uE8bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Received: from IA4PR84MB4011.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:208:54f::12)
 by LV8PR84MB3771.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:408:1bd::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Sun, 9 Nov
 2025 19:30:07 +0000
Received: from IA4PR84MB4011.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::766:753d:9ff8:1c8b]) by IA4PR84MB4011.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::766:753d:9ff8:1c8b%4]) with mapi id 15.20.9298.012; Sun, 9 Nov 2025
 19:30:07 +0000
From: "Elliott, Robert (Servers)" <elliott@hpe.com>
To: David Howells <dhowells@redhat.com>
CC: Simo Sorce <simo@redhat.com>,
        James Bottomley
	<James.Bottomley@HansenPartnership.com>,
        Ignat Korchagin
	<ignat@cloudflare.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "Stephan
 Mueller" <smueller@chronox.de>,
        "torvalds@linux-foundation.org"
	<torvalds@linux-foundation.org>,
        Paul Moore <paul@paul-moore.com>, "Lukas
 Wunner" <lukas@wunner.de>,
        Clemens Lang <cllang@redhat.com>,
        David Bohannon
	<dbohanno@redhat.com>,
        Roberto Sassu <roberto.sassu@huawei.com>,
        "keyrings@vger.kernel.org" <keyrings@vger.kernel.org>,
        "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
        "linux-security-module@vger.kernel.org"
	<linux-security-module@vger.kernel.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: Module signing and post-quantum crypto public key algorithms
Thread-Topic: Module signing and post-quantum crypto public key algorithms
Thread-Index: AQHb3HNTlYDMsKlX1km5UjM1JDpJhbQBNMyAgAAk+ACAAASaAIAEd10AgAAUKACAACUOAIDiqN2wgACXAICAAhCuUA==
Date: Sun, 9 Nov 2025 19:30:07 +0000
Message-ID: <IA4PR84MB4011485C0EFFFF9F2820A1BFABC1A@IA4PR84MB4011.NAMPRD84.PROD.OUTLOOK.COM>
References: <IA4PR84MB4011FE5ABA934DEF08F1A263ABC3A@IA4PR84MB4011.NAMPRD84.PROD.OUTLOOK.COM>
 <501216.1749826470@warthog.procyon.org.uk>
 <CALrw=nGkM9V12y7dB8y84UHKnroregUwiLBrtn5Xyf3k4pREsg@mail.gmail.com>
 <de070353cc7ef2cd6ad68f899f3244917030c39b.camel@redhat.com>
 <3081793dc1d846dccef07984520fc544f709ca84.camel@HansenPartnership.com>
 <7ad6d5f61d6cd602241966476252599800c6a304.camel@redhat.com>
 <69775877d04b8ee9f072adfd2c595187997e59fb.camel@HansenPartnership.com>
 <3d650cc9ff07462e5c55cc3d9c0da72a3f2c5df2.camel@redhat.com>
 <534145.1762588015@warthog.procyon.org.uk>
In-Reply-To: <534145.1762588015@warthog.procyon.org.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA4PR84MB4011:EE_|LV8PR84MB3771:EE_
x-ms-office365-filtering-correlation-id: 7a00a607-27ed-464e-1836-08de1fc663db
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016|38070700021|7053199007;
x-microsoft-antispam-message-info: =?us-ascii?Q?6Zh8e2MXbQA6VHnU4ohC20wnOzW5G0vRy3oEURumAVAHERo2LyhO/OeZS8Am?=
 =?us-ascii?Q?55F54kuTSKQfTbNr77E+StWlOkVUMv6gBpu0n3fUXv9zTXFDoT9TfbtKUQCV?=
 =?us-ascii?Q?AfdjoYvU6l/SdD3prDuM48Ce5YODRQWRKk5NQt5Uyo71PWgLXWOB5Vcr8Gs+?=
 =?us-ascii?Q?qJ/PF34uuNUfMQUAMwmqaOM6F82eGctsCsq3JTzAO5i+NcxQSPUyDjCwCQKf?=
 =?us-ascii?Q?Neyw8Qji8Wr3qNeV0o+/qS+KVRRne39Q8sM+TCJGv9ewKd0AIvuIagTSHEvl?=
 =?us-ascii?Q?xrAMs9E5AmUkO36s5c5d5hXKvhUkZCQxzh5shOh7lATWckw6OfpsP+46XZL9?=
 =?us-ascii?Q?lv7+wahT/jgroC/4/KwBqaPeYPdJANp4iZH/qLZAXXJOxdcFVAZb39Dir0Bm?=
 =?us-ascii?Q?e6QrsmlOGGGYQiDocxivsyEhO1DvBqaa6+28wzwgSee5w3AVL9N/snmaFPg1?=
 =?us-ascii?Q?gBm6IfV7esvA44KLThCmkVkBtABD3YDx041Cil9lR3lAVbz5W5GWuXEWgixF?=
 =?us-ascii?Q?gplTPLlb111i5lGs1yPPfJ3tYREsJY7r6T0Og2ZcA4n3SeFYEmCJmGUHP5Uy?=
 =?us-ascii?Q?wQ+OQams7q2P3qSgxmslLg7xXqQOtTzOTYUzD9ulKuraf5nww2UAKVZjAcjw?=
 =?us-ascii?Q?WQrs3qt7F7pEkf2Uq008zH/xiI2PPxf1/AbTYa54uhUwwzUP9rQpHK/WLFVi?=
 =?us-ascii?Q?u5yGT8AgkDz4s4jzb9DApG/OD+vbeOuzFXZl2ZWh11FNRIuDPi2wbY64xzdV?=
 =?us-ascii?Q?ZzvMYys47TDTSfUPzdhmwT0fBYTCAlPw22Uy9DYV57bcslcqDM9yPmF4m2Ga?=
 =?us-ascii?Q?+zPS+hT9kj4B+hs/WLqyXOK+6se6JonMMg4rePoaO+Pd8/ZS+PGQM6XWQ6TC?=
 =?us-ascii?Q?Sz1oXQEzI0MBG5v0gYv4Ex8S6DOJGb4+Hq+0b5u3mLgWn2wYe0g3RFOTi651?=
 =?us-ascii?Q?qtr2dlRm637PUXr8LDoQurwvHMjY7RTzEgSlewyul8Z2O2kEcJkSciIzE83P?=
 =?us-ascii?Q?fEp4RXdsykLOlIX6cmFNbyjWYHopyK8wsV7dTzPpo1Kfrno/8it8B94oNUIo?=
 =?us-ascii?Q?Xc+dLeP2zzo3ZLhG2MWXCAW2LtyF8NsaH1oJtmIFPKSS/hEzwOXsz2MLJX92?=
 =?us-ascii?Q?rU3HyMNt9ZFc1VtCLj5gLaRHcSmwDHN6veTZnPdLziVWyYMrQv4D3GuFy8U6?=
 =?us-ascii?Q?x01NlVX6SF8GQiJu/tGqsEE29PIld+aS9RBdPoCFyKN2E711DEXGxWm6W+DI?=
 =?us-ascii?Q?CGyrOLuoqhTCnCrmaqlaFgFtl9O+4GQepFjkocmMacGDrRm4Hf+alYWp94oa?=
 =?us-ascii?Q?YrhLDEy+5djBDagY2CyepJ/mmTdnW0uivVbKIPP+BSgWAMIFF/uZvn5eHeN8?=
 =?us-ascii?Q?pG1xp300dw1EDqrXDWJV3J3G3C4ZHZy0m/4a9dBpSNYHK0y4S3ovRD0pBEVt?=
 =?us-ascii?Q?szUmdol/ZvN+gNS67pzR+n7+QmvYggGy/23wL+4KI9MYe+X6CxC3pKUTREVV?=
 =?us-ascii?Q?xexeld6hSixI3ofwiGzOY1CvHKUvbWMICXEY?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA4PR84MB4011.NAMPRD84.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700021)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Idb0XFjU8V/xuktZA5qfjsBqt5VEgUBK1wcMDkBMQuuKvyJga1SPWcusMIrY?=
 =?us-ascii?Q?a4wy67VEgJwElhECxefzuQrqVx7ZqKxKge7v+gu3T+fF144M1d3dxn0hKa13?=
 =?us-ascii?Q?7xLciAbNcmgFdEvC/rlKXsd2LSCjCtZARjj5D/5xTZAYuRjdOS4/Dn7CxpYW?=
 =?us-ascii?Q?z10hd2mip9keNuBmINoogIOCUuGEyQyTvZkJ5sfUrEB4ukO2Dzy36cG3nLWO?=
 =?us-ascii?Q?B3GhT9jNzKwqe0Im158hs+o2DxAuFaAyjtRLtmquy6cU4PNmRzc9odr1GEq7?=
 =?us-ascii?Q?9wFA2MqKsZlCMs1N3nKG/VU3o1diwOPv78CwKfAMiN3727MlRg8hofbKfkox?=
 =?us-ascii?Q?/VD5Oa2sDCNn6zk3HhNioO/1UkA58oy4BSXUEO58fhnjFOzLeW1u8fV5B2HE?=
 =?us-ascii?Q?qhPSUvYSafTc2bd3NC1DquO0kAotuOLiXP+DdU+KYO/2tZqQjk6Xa426FIMe?=
 =?us-ascii?Q?Uw2UROO/HOz13tfEddvxgVcRI4XNyaXQtp+unRyDj27OnvcKv0g1dJ3oSV4B?=
 =?us-ascii?Q?Cu3tChDJUTV9zw1dv3ZN5Je08idqX+OFMu4ASwN5OD/09NM0C9dtn3XCmPx1?=
 =?us-ascii?Q?Mp4JkYfubTW0xO/4xGh2hUQF85MQOdsx+gRBNwaNrEAYMiDJpVxD2vSO1IP5?=
 =?us-ascii?Q?wDcAYaWE4wuAqvAnr9qjAtnOGU+IJNG8Co+S89V6/x78Z9IIojuLJD57sce6?=
 =?us-ascii?Q?SSbLfhXcFIihBPtk/kykOBmGESfDKcFZ++BovwyIhccfjSqhT73nHVGRiCv/?=
 =?us-ascii?Q?ut3B0eWJuWgYCRexr3yraNsS3vfRkN4K6gPNe+8BtXxv3oAUeqcMN6y+A6ul?=
 =?us-ascii?Q?rnaIbSXwXEAdzrq3cXrQB755WkKxA9OhZhLG7HmWz8mWgpAUz85n/ghUmOrW?=
 =?us-ascii?Q?7uxRMR2pFva279Yz7iHDNgwO3qMCk5wXR1P6axUceL48BZq8rXyxFv0kAseZ?=
 =?us-ascii?Q?ebL2oTpWdFMVCwjv2SlctM99l3oUH1pnPcGQwVZyCZ2rEgqOApyMs6rPzYof?=
 =?us-ascii?Q?axUmSJyGwjXLLW+LUIILO7N6yG9wKeWG3p7L/RjXuBEW1i9ZY4qbZrE09S27?=
 =?us-ascii?Q?4/4vj5qLO2TKDg72BYccfHe2bd4KNLm6UKtgL4IXXdaB/4FiLu+xn8XpaW8z?=
 =?us-ascii?Q?o3R+s8HXHylxebczxBpmQSX2DTwsieSXQ1UuQr1qfvWn7/QfBMvdgivBYU+z?=
 =?us-ascii?Q?0xQuTQFF1ei64UK7EfJpMY3UXHRXXM2T0OiXGkNyewbNylBIXdQrFUyOafFl?=
 =?us-ascii?Q?Xhd5RIJbBUfvdmP3o4W0FLlQBCUuJjI0wzQD8zXGOkuhDTxMge+w8vm4VkQC?=
 =?us-ascii?Q?R3sYzvXRB7k+jQ6yS8Ni+CZEdIJshtqU7uqTdA5CKO5qXy91FQHB6wXBMG+2?=
 =?us-ascii?Q?dhwM0GTRiMPUMPqmgWa7mo64OfLb0vXJK8qjVpFq+kxx3qt9168rhSNB+LaI?=
 =?us-ascii?Q?Vfmq/gsiTYxFuAVGKMq2BVqYqnCEPCMuEotgyoZOFZFLoTS0B1mPxWPofCZD?=
 =?us-ascii?Q?uJht+jUDVAV+3NsDcCov8/46sZryvC65qNeIoNphps19vyMh2aTT/R2teaGy?=
 =?us-ascii?Q?ZadgWbQWSfOZ7FhVVBQ=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a00a607-27ed-464e-1836-08de1fc663db
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Nov 2025 19:30:07.2066
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3AcI6AIV+tO1La2NSILvRfsiSxT+m/Kc3CA2uKjrzTBt5985OS5iu7W7DfEGMRsY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR84MB3771
X-OriginatorOrg: hpe.com
X-Proofpoint-ORIG-GUID: WY7xzKvfox-179a2DERWmDz9BV7ZBgBA
X-Authority-Analysis: v=2.4 cv=YIWSCBGx c=1 sm=1 tr=0 ts=6910ebd2 cx=c_pps
 a=FAnPgvRYq/vnBSvlTDCQOQ==:117 a=FAnPgvRYq/vnBSvlTDCQOQ==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6UeiqGixMTsA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=20KFwNOVAAAA:8 a=MvuuwTCpAAAA:8 a=bLk-5xynAAAA:8
 a=EG7W4yiQAAAA:8 a=FNyBlpCuAAAA:8 a=Z4Rwk6OoAAAA:8 a=xVhDTqbCAAAA:8
 a=i0EeH86SAAAA:8 a=VwQbUJbxAAAA:8 a=Hv26kEhG5nPVLAUMyFEA:9 a=CjuIK1q_8ugA:10
 a=zSyb8xVVt2t83sZkrLMb:22 a=RlW-AWeGUCXs_Nkyno-6:22 a=HkZW87K1Qel5hWWM3VKY:22
 a=GrmWmAYt4dzCMttCBZOh:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-GUID: WY7xzKvfox-179a2DERWmDz9BV7ZBgBA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA4MDAxNiBTYWx0ZWRfX2GM1YpfKv9VT
 n9XO3sBnbTKsSbf71W7VDqhwDYwgP0QvkrDWQXsLAwNxBE20agGQFR5sZb8qDsslYWOO3ZO/iDl
 WGBZI12q66hBYFOjukbgTVzkogEMYzvTuYUTfq7w6Agoc3Sj2jiECYJJcQSMiVBeXtnKSb1o3zd
 KYYJ07E386MyWjmgZEsVJLG7MoVeuTfkqHERZdrlW67vT4T9x02Qy6+u8HF1zh/YUC8bF3vkkFg
 EUJ1IqyU4mJWpbAdMNbpXhVexlu3Gf6WhpwrFRsucynwaZvcQwLzY4bHbAQQkG1h8vhek/60RLL
 mEyjMYj9JzNj8rNRtP9GgUREYap01IjxvlzRWdA9o9eNIMN0SXkMh5j7iUJk3Vv9ZQZSsmkKOv0
 PCruy38lBb7icQG0u2FmK/i6bGYRdQ==
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-09_08,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 adultscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510240000 definitions=main-2511080016



> -----Original Message-----
> From: David Howells <dhowells@redhat.com>
> Sent: Saturday, November 8, 2025 1:47 AM
> To: Elliott, Robert (Servers) <elliott@hpe.com>
> Cc: dhowells@redhat.com; Simo Sorce <simo@redhat.com>; James Bottomley
> <James.Bottomley@HansenPartnership.com>; Ignat Korchagin
> <ignat@cloudflare.com>; Herbert Xu <herbert@gondor.apana.org.au>;
> Stephan Mueller <smueller@chronox.de>; torvalds@linux-foundation.org;
> Paul Moore <paul@paul-moore.com>; Lukas Wunner <lukas@wunner.de>;
> Clemens Lang <cllang@redhat.com>; David Bohannon <dbohanno@redhat.com>;
> Roberto Sassu <roberto.sassu@huawei.com>; keyrings@vger.kernel.org;
> linux-crypto@vger.kernel.org; linux-security-module@vger.kernel.org;
> linux-kernel@vger.kernel.org
> Subject: Re: Module signing and post-quantum crypto public key
> algorithms
>=20
> Elliott, Robert (Servers) <elliott@hpe.com> wrote:
>=20
> > The traditional signature would use whatever algorithm is used today.
> > Legacy verifiers would only check that.
>=20
> Would there be any legacy verifiers?  Kernel modules are generally tied
> to the kernel version for which they were compiled.  Granted there are
> things like the wifi regulatory stuff that are also signed.

If the system building and signing a module doesn't have OpenSSL 3.5 yet,
it can only provide a legacy signature. If the kernel is only looking
for a composite by default, a kernel command line allowing a legacy
signature to be accepted would help the transition.

Userspace tools can check signatures, but I don't know if that is done
in any non-developer situations. I did it manually while testing x86
optimized crypto module changes a few years ago.

If and when a distro is confident there are no userspace tools, it could
stop signing with legacy signatures.

> But note also, PKCS#7 supports multiple independent signatures in a
> single object.  The kernel will handle this already.  At least one
> signature must be verifiable and none must be blacklisted.

Yes, I think that makes multiple signatures viable.

> I assume that the main aim of using a composite algorithm is to share
> the result of the content hash - but in this case only the
> authenticatedAttributes are going to be hashed for the signature, and
> that's relatively small.

The composite motivation is to provide some protection if someone
discovers a basic flaw in the PQC algorithm. If quantum computers
haven't arrived yet to break the traditional algorithm, the
composite still proves validity.

The CMS and OpenPGP constructions ensure that the signatures are
non-separable; an attacker cannot strip off the strong one and leave
the broken one. The verifier always runs both algorithms (unlike
the current OR policy with multiple signatures).



