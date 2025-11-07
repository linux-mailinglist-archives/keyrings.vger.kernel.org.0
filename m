Return-Path: <keyrings+bounces-3310-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 207D3C420BA
	for <lists+keyrings@lfdr.de>; Sat, 08 Nov 2025 00:50:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 68D273A209C
	for <lists+keyrings@lfdr.de>; Fri,  7 Nov 2025 23:47:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43426239E88;
	Fri,  7 Nov 2025 23:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b="Acvn5dKF"
X-Original-To: keyrings@vger.kernel.org
Received: from mx0a-002e3701.pphosted.com (mx0a-002e3701.pphosted.com [148.163.147.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 353E8289E13;
	Fri,  7 Nov 2025 23:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.147.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762559243; cv=fail; b=d5OiG98N+/4x+TSIiDGerpWAry9hzphkAkfkuOA0K1gMvjSNlk70RbvSUEFdOevysXet+OBevMd+vOhFoCs7bnUb+Gdf2jomGk7i3j47yh1P2miHblWSE/PvswFjRImAobH+fjzCYucaAm+EA7R0E1aAmVpRMxxIIJc0iUmXnmQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762559243; c=relaxed/simple;
	bh=i00g1TKSlP01ja103RMiDSn2/80ZrtW7pbhrLEDAss0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=A/dVeAUUGw/Kwj9BnN3/KjP72qR+XzOYwJFeIbO7aMOHrChhpfvqAQgij+6outpMj+xZn7W+D12ppYukz+SAxg6ZafmxthZvX4LKs0sJLHcSz2LZKHEUIHwapsGhMdbYEx9b0rC9ShrZveuLd8spQ1yql25KGjeCdj96Y8OyUr4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com; spf=pass smtp.mailfrom=hpe.com; dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b=Acvn5dKF; arc=fail smtp.client-ip=148.163.147.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hpe.com
Received: from pps.filterd (m0134420.ppops.net [127.0.0.1])
	by mx0b-002e3701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5A7L31hc029235;
	Fri, 7 Nov 2025 23:10:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps0720; bh=i0
	0g1TKSlP01ja103RMiDSn2/80ZrtW7pbhrLEDAss0=; b=Acvn5dKF0JeuIjVj7X
	HHPEcBKjBOg38NhypApce9VKydUSrPnAx3jJ8dGEvw67y4PUyy86Aw9YXBQ5dm1Y
	4w/T+cCMRysjV1seuNjufuEF6eQXZBADsqzhIxh0I6byh2DrjJpxCDvCSv3uGPGa
	ZTwGQfGG0aKf6g1t6xHy4JQ436iQ/oTcIcI30HdjSTTEh01bHSUXx/Y9PDEV4DY/
	J/CNK+WhTgb7bzhDra6pDCo2IH8DNIskC0Gu8bDFUMRkkqfL3ZBgEe9Zz5MBtuVy
	z6ESqY67IuGC+cEoJKo4MrRYkdLYyvm8emds35S4ezA9fXqiqAUHFskU7xL4Lj8j
	tetg==
Received: from p1lg14878.it.hpe.com (p1lg14878.it.hpe.com [16.230.97.204])
	by mx0b-002e3701.pphosted.com (PPS) with ESMTPS id 4a9axfa7rj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 07 Nov 2025 23:10:40 +0000 (GMT)
Received: from p1wg14926.americas.hpqcorp.net (unknown [10.119.18.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by p1lg14878.it.hpe.com (Postfix) with ESMTPS id C13A612EBE;
	Fri,  7 Nov 2025 23:10:38 +0000 (UTC)
Received: from p1wg14924.americas.hpqcorp.net (10.119.18.113) by
 p1wg14926.americas.hpqcorp.net (10.119.18.115) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 7 Nov 2025 11:10:29 -1200
Received: from P1WG14918.americas.hpqcorp.net (16.230.19.121) by
 p1wg14924.americas.hpqcorp.net (10.119.18.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Fri, 7 Nov 2025 11:10:29 -1200
Received: from CH4PR07CU001.outbound.protection.outlook.com (192.58.206.38) by
 edge.it.hpe.com (16.230.19.121) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 7 Nov
 2025 23:10:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rIN4bopL59RrXMhwQkAP6xj5ptOtUmssqCDKqmXfW0GprWMNDuupmK89xmTPWzNv5oYRIuF8QXG75Ot9C5cYY6QXP18/P4aoAK0Ri6l1337T90a573AfRlWcwNyyvfBiiu4kMObVfC0+n6DXFrNV5/xRuMGTScYmAuUWaFSY4Dfpf9aFpH3lN+6cWJvKXvBxLYPZygnj10vwppfCmQbu9UzJwusi9Sc0Q3PFYMY8jOhQEUaagz6Td1eKgEX/u700QExW9haSMFGPgYzNpetT03cJtFHHLjaPPTIsxQz5GqzPKK7OM344NcsZUo6/Z/tZka3T7Z8m5tBEF0NP4vFf2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i00g1TKSlP01ja103RMiDSn2/80ZrtW7pbhrLEDAss0=;
 b=VZR9TZ4f8EN/mwB9y+GqQk0uSG2YLEzcCdr/6v/Dwv+bV7tl7+a0PakdilOZg+Sz9o1Fym9noZp7Xcqna1Zpk+Hg/uHOAQG9XTU320EAGdmUaM0RMggnx8/Z//bXE7PGesyL9zNEkBvwepzzI682wx1UT0Q/XYAznHn8jGUlQo8cmVKyhOOx7y0RntC4xk6yI1otDiiLJImCGkGe0XAlrsXyRHvra5Y7f37dSHkhojT3ggF7wk21eDbuC0OFC5tijAaMZ0kfvsi+8vXIxejRwQw7NpfCznr7H0yMxw5g6936uH40xmKe/WUs0/yVH0d8ZYas7NKNdo2FEkf3XD1IYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Received: from IA4PR84MB4011.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:208:54f::12)
 by SN7PR84MB3155.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:806:271::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.13; Fri, 7 Nov
 2025 23:10:25 +0000
Received: from IA4PR84MB4011.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::766:753d:9ff8:1c8b]) by IA4PR84MB4011.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::766:753d:9ff8:1c8b%4]) with mapi id 15.20.9298.012; Fri, 7 Nov 2025
 23:10:25 +0000
From: "Elliott, Robert (Servers)" <elliott@hpe.com>
To: Simo Sorce <simo@redhat.com>,
        James Bottomley
	<James.Bottomley@HansenPartnership.com>,
        Ignat Korchagin
	<ignat@cloudflare.com>,
        David Howells <dhowells@redhat.com>
CC: Herbert Xu <herbert@gondor.apana.org.au>,
        Stephan Mueller
	<smueller@chronox.de>,
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
Thread-Index: AQHb3HNTlYDMsKlX1km5UjM1JDpJhbQBNMyAgAAk+ACAAASaAIAEd10AgAAUKACAACUOAIDiqN2w
Date: Fri, 7 Nov 2025 23:10:25 +0000
Message-ID: <IA4PR84MB4011FE5ABA934DEF08F1A263ABC3A@IA4PR84MB4011.NAMPRD84.PROD.OUTLOOK.COM>
References: <501216.1749826470@warthog.procyon.org.uk>
		 <CALrw=nGkM9V12y7dB8y84UHKnroregUwiLBrtn5Xyf3k4pREsg@mail.gmail.com>
		 <de070353cc7ef2cd6ad68f899f3244917030c39b.camel@redhat.com>
		 <3081793dc1d846dccef07984520fc544f709ca84.camel@HansenPartnership.com>
		 <7ad6d5f61d6cd602241966476252599800c6a304.camel@redhat.com>
	 <69775877d04b8ee9f072adfd2c595187997e59fb.camel@HansenPartnership.com>
 <3d650cc9ff07462e5c55cc3d9c0da72a3f2c5df2.camel@redhat.com>
In-Reply-To: <3d650cc9ff07462e5c55cc3d9c0da72a3f2c5df2.camel@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA4PR84MB4011:EE_|SN7PR84MB3155:EE_
x-ms-office365-filtering-correlation-id: 0eae2505-807c-40dc-2050-08de1e52d5a5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?dmM3SHdvRG5xUjRvMTR0MnAwMjYwWlpPRUJoSjV0YzJoODlGenAvdmh5UE5T?=
 =?utf-8?B?bDF3VlFLb2xma25CQ2dOSVpidUhwb2ZhQlVXUEgvNEsxWXordEZ3ME90NDZ5?=
 =?utf-8?B?eVFXZWo4bHRPdDRkR1JNL1ZqMklHSkU0WnYrY0FIbm16Y05NbXZycUYxS1Vy?=
 =?utf-8?B?a3hZWWlrb1puTTZyVk1xNWFGd29meTlRMmhUVDNsK2pEbGQyak1aNFBNNkJM?=
 =?utf-8?B?MkkvZkVmYnZYbDBqLzcxWW9BeFA0WEtXeFZtb0tudFE4eTBQWm9tdjJhOFZQ?=
 =?utf-8?B?ZjVLV01KTHIwdDEyVGNuUGJ4dE5vRWhnM3pqdTVPbjVuUi9ITVJscVdMdjNE?=
 =?utf-8?B?RFp0clZnOEpMVlBkajZPc0g4dTJaWHlTanBob1AxbHBGQWQwQ2R3L1d0KzVi?=
 =?utf-8?B?amhaQXBLVGo1Y0I0RDBuR0M1WVZBbWkwZUdRdzh3UWtRVnZRRWJieW5vV25y?=
 =?utf-8?B?dW0xTzRLNGQyc0JTVW5VdHdkNmtRemkyeVhURmh6RWF1V3lzSHpxb3RST25U?=
 =?utf-8?B?NW9BRlNtRXU5ZmZOTjliZ0J6TEwwa1A0ZkNJNDZ2TWtDeFpUbmVwbm1ib1ly?=
 =?utf-8?B?NjM4ODFkeTBVWDRLVjlLSXYwUURaUk1yR3ZqU1lvYlVlY0JDVVM3eXQvT0Jp?=
 =?utf-8?B?ZHZ1eUJIZS82d3BQYy9XVnpHN0dxR1BzL29HOEY1NXNUZlNjaE1BQVdJbk5O?=
 =?utf-8?B?OVlGZUJDQitGTWpMa2wzd3lSYzNYZlNkNk13dFpjemlXRVh6bnhOdkJBcjM3?=
 =?utf-8?B?KzZoWE9WM01hN2Y5T1lPeFVza3U0N3hybFNZOVpqOHFwWEZBU3FCWmhpOUpG?=
 =?utf-8?B?RzRFeWI5ZDE2QVQrQTlJL1N4VUUvemI4SnR1R3hNeFpYOWpjRld6RUplVWov?=
 =?utf-8?B?bVQ5SWlmSnlsQnFqbXUzSWRVTlRtL3J4K3BNbTlqd2dSMDJ6SVdoQ0ZQUFRT?=
 =?utf-8?B?ZStYb2JUem1rYWhyRzBTaVgvRnVnTndjK28xelBNSUdoTjhvaW1lWEZ3QjRy?=
 =?utf-8?B?WGd2dkw5REJaNWlCSTB6Q2RxNmtFV1VyTnY1UEtiVGJtYU9hSGNrZG50MUhm?=
 =?utf-8?B?WEJlQlFaN1RPemtkamppWjgvbTdIOUNEMDVEUEZZeUJlV1FybmJLQjQ3Wita?=
 =?utf-8?B?V2ZhQVJQN1pYZE1xNFNBc0w2WnZsUE43S2xtNTh1OUtDbCt3THN5UGNzRWE3?=
 =?utf-8?B?QW5ZVFBNSFdrR1g4LzJNQTBtTnlwRHE3VVcwTWgwRVZpdzFGQitHNkJoMHAv?=
 =?utf-8?B?dmNYTzc5VkxVc2pvMjk0Nnp6aWJjamdaSFh0ZmxZWENTbk1Ed3dXdUJZSVF4?=
 =?utf-8?B?SFdQelU1R1d3ZlBNc0NJVjB2ckhGV2NQeWhxdXArSHhCcjNPMXNBSGQzbm82?=
 =?utf-8?B?eWRWR2I1R0lVOHpWQ2FyVmFlNzh1ek9NbG5GNDd3NnAyMWlSWEIwT1pHeVpW?=
 =?utf-8?B?SlVobk5TNE1nM3dqOURzQVFGYitoaXYwOHFjM2UxQlVnZ0EycDYvaHB2Mysv?=
 =?utf-8?B?VlhVUkpQNWJBdk51ZXFyTHI3TlRleThsR3F0SG0vRjNsOTZIdGRFQ0cwaUd6?=
 =?utf-8?B?WklvQVZmbzRxN0RiVGdwakRkbHJVSzZNSGF0aHl3RHBYUHYzZjFyYmVBWFEz?=
 =?utf-8?B?eGZqYWlGRnQ5UGNDUDY3WEpRRnJhaXNZdG9JazhhVkhxcGs4MjFUTXF1OUlp?=
 =?utf-8?B?WWxQZXVYZmpwWXM0WGZHYzJlOFh0RzRnNHZneWpQU0lKcDVrWjFvVnp5Vksr?=
 =?utf-8?B?cFBRbnhQMVZZWFdjNVFtOXRWL25GUEc4QXVNWVI3ejVXTFViSDA3MW9rV2V0?=
 =?utf-8?B?ankwc0FvQnU4b0VYYStFNk5IVGFqQzluREtTc3l2UldlU1NHREROVWtGeGwz?=
 =?utf-8?B?Ynhubk5zUGE1ZXdOU1VXVnUzVXMrYWgrQkRhV290ajA3UUZYTVM4ZXFmcGJ2?=
 =?utf-8?B?VjdOSm91c2F5eUhYV2p3WkdsZ3VCQjE3Z1JwNXNMYTdMVCtlblRjUXlLaGJa?=
 =?utf-8?B?TUh3T294ZkVVQW9uQnowSG1NVFN6Wk5lL1FZMUpZZU14RlZmTno5ZzU4RzNN?=
 =?utf-8?Q?kz6Chv?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA4PR84MB4011.NAMPRD84.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VUNpNDFqekdZV2M1OWRLUTNPTXA4d3puQ2Zqa3FPZjBuaDYvMUxZeHlGL1dl?=
 =?utf-8?B?UHJJTGU2YWZYaU5ncmoyZW9Ea3pZT1AzZGh4WXU3ZHhxQUlLYkRzQk00QUVC?=
 =?utf-8?B?UW8vYU1mUHhncWs1R2w3NXRtbkltck80emVJYnNMR3V0VWdNV0c2SGROdGZn?=
 =?utf-8?B?aC9tM0F6WDg0VmhZQVlxVEFyUElXTTZVZFh0ZHlieHdYVEFIcVlKaEFUeGNN?=
 =?utf-8?B?L3lody9jbVlqUzQ0WVZIMjljSzlJYURGWFplN2l6RmdPY3hROFp5MGErY3Ay?=
 =?utf-8?B?QnE3SkRzdzJ4Qi9MY2FRZm92MCs2RHExenB5eFhYZTc5Zzk5RHQ0YnV5SXRS?=
 =?utf-8?B?ajhKTUxmRGxqRlJvdGg3QkpEbzRUSzhTdkNWVTZ3RUJIbzNIQlNWYnBnbmht?=
 =?utf-8?B?ajcyVGtYQ3pYRDVyTms5TDhRbmhhMFp3bnFLdDhzdm8yYnZGZmJxMjM3Z3Fx?=
 =?utf-8?B?VFVrZzgyRTkvazlXRHN5L2hJNkJ2aEJqelJybG1LQ0lTYi9mWWxzRi9QVWo5?=
 =?utf-8?B?Kzd0UTlsYUZkVjFzUWg4MXVjZkNLUkxKbUhsSEk0WWc4R3dlMjd4THRWalNu?=
 =?utf-8?B?QjV0MjBSK1lONGlSaEhXLzcrYXN4L3Z6NXZ2RHh3TURhK0xWWFJSMmszMHVN?=
 =?utf-8?B?QlJjY3N5QmJGMzRoQ0JOUjJXTVF4ZmZjOGZRNXNtNFhMMDdGdUp3V01HTzJs?=
 =?utf-8?B?OG9jb0VwbnFDSS84R2xEdXNOS3F0bURMZ3o3VSs2TGUvcHNjTkRod2UzQWFP?=
 =?utf-8?B?YTFDVk9yQlNPKzJxU29sMk9PQzRnOTZEOFY3eVEvc2VkVmxvWFBOMzloVVBx?=
 =?utf-8?B?ZzlHQXp1Z0VIYnhDeHNWR0ZWZ3VYWW43WTNKQlo2WUVGZFNPU1NCeUZGek95?=
 =?utf-8?B?WEVPYjRubUxhQzRmSW0wWVdZV1VHcTFyb2l2dm93aWZhamhWT3VIbXgvcmZs?=
 =?utf-8?B?elMxbCtzTm4zdkVJeWFuNFdGR0MrWG5oUE1Vb1hOSlY2VVRaS2hKOEpxcTFx?=
 =?utf-8?B?V3pLOWxMZ2hGajJLa000NldPaFFWZkVVRkdlTGZXSit0Z3daekd3cEx5d0lx?=
 =?utf-8?B?MUZIb2lkQXJlTUI5NVMzNFYzT1JhR0hiblJSUmZjR0NWbFBPT3Z6MS9mRFVD?=
 =?utf-8?B?UGQweTI3YzRSd3ViNG02R1BISXBHQ0N2Z0VRYWErTnFWWVZseHpWejhBRUg3?=
 =?utf-8?B?UmZmbC84ZmZjZGp2dExVY0JxUUg1N0NzY3dCTUhzQWNVR010WTcxRG1hUFFW?=
 =?utf-8?B?blR0T25vRlpTb3VrcVMvM0FnQlpYazgvRlZTR1hRbnZRMTVuWC95dzRBRDQv?=
 =?utf-8?B?UTV1R0VZanBSc29qejQ3cnF4VGFBVzBWUTBrSThxNHBFSUZ5TVptT091V3pD?=
 =?utf-8?B?UGt6T1NZZFFudFpqWDd6K2tGVkJiWWJwWnpVV1lPemt3ZmViSFQ5bkdvV3hT?=
 =?utf-8?B?YTNYNlVsWHNubGpBVFNkTys2b051YjR6TjNjWERrZXhIVnNuUUhxTXRJamVh?=
 =?utf-8?B?Rld1cFBZZlFIbHp2N2xSUXhGK2h1UUU4QW9lWUhNcHNIeEc2NU1yVGd2UmpF?=
 =?utf-8?B?WkNyK2xiTUo1MSs3eEk2L296eG1zTkdheTlCTnBKc3FZbHRsaGl3M21OSWxR?=
 =?utf-8?B?RTFkandaUzcvOVZPTjg2dXZUb3QzOGg3SmZ5YVczTWJoVjJ3SGtKaGUyR1ZT?=
 =?utf-8?B?a1ErZG44OVUwenIrdG1ydTZLVjNUK2pNY0pyNVUrcXV6WndvSDY4UlEva2lJ?=
 =?utf-8?B?QjNmbWkrMWVVTmliSllNL3oyNDJlWGZuTTVGMUhYcTZBMHpwQUIxc0MycnNo?=
 =?utf-8?B?N2FHSmJiZXo2MmsyZTd4aUNCRkJWb3R2Nmpxc0UvQWcwaTRzU0VGRkZsaU55?=
 =?utf-8?B?VWdkdmNobDIwUlg0SlVOYklFcTdNOU5OZkxGK1VzK1drVDZ3VGJCTzV2Z3RY?=
 =?utf-8?B?L3dYOWZFR0I3VHJqTVpzM0pMVlNMMk5xWkI2ZkFrMDI0QjlYbVlZbGVrekFz?=
 =?utf-8?B?MURDdmNXU21XeWdub2Z2dGFoSXhLL0NuN2JuWVFLSG9CdjNyZ3VvVkVmTTRr?=
 =?utf-8?B?SlhYTFlBbEdnM3piTkxRQVNQNVNXckk1UUk4eDdOOTdLZTFvb1Y0U1FYdENI?=
 =?utf-8?Q?y6WU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA4PR84MB4011.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 0eae2505-807c-40dc-2050-08de1e52d5a5
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Nov 2025 23:10:25.3414
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Nq1fEdYFHyOCZks5wxhQvOWxTBq2VtcIALxACzzvtggIYkJZmTQenKXaBQg+pkCl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR84MB3155
X-OriginatorOrg: hpe.com
X-Proofpoint-ORIG-GUID: svCl32Mu7qX6crPHkNGhWghLweIx46u3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA3MDA0NCBTYWx0ZWRfX4x+VebD7sMBY
 fNRcrh4X+GlGz33MbfngvK6Gvw4x7WeanYV/Ay72Rbe3Zd96x4TQFIi5g9LCXFluzC2ZoYw9MjQ
 JPd7+YoOibuy98VBHdHmWzEXf2NZjfBojTRba9uQEi+fUaw63m8B/lW4S0K8YvxyG6yiZHWHXXk
 5YcJGmDOQTUiDAvc/c1g7qL5a14khdqEKpQGZyaYyAqYKtaqDQPckKbJoqNd5czPN2Al7ExUjSK
 EnwtULrpwLbBLZGWOfJPfe0vVURh48zBzKD/p25//StBc6g6BQ0Zga09Ocfpscb276QyqW0smjH
 nxGBbJcepRXsMviBt5307K3Pj6A8uwjazMOhlSBZlJ8LGP0Ha+vT7X3yxXoVbvGSUYAgM5RTTAG
 tDhkApK8Er6nwFoiBzGbwLSqyLxQzQ==
X-Authority-Analysis: v=2.4 cv=D9BK6/Rj c=1 sm=1 tr=0 ts=690e7c70 cx=c_pps
 a=UObrlqRbTUrrdMEdGJ+KZA==:117 a=UObrlqRbTUrrdMEdGJ+KZA==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=20KFwNOVAAAA:8 a=vifE-i9Rby-CmiXn_oIA:9
 a=QEXdDO2ut3YA:10 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-GUID: svCl32Mu7qX6crPHkNGhWghLweIx46u3
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-07_07,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 suspectscore=0 clxscore=1011
 spamscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510240000 definitions=main-2511070044

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogU2ltbyBTb3JjZSA8c2lt
b0ByZWRoYXQuY29tPg0KPiBTZW50OiBNb25kYXksIEp1bmUgMTYsIDIwMjUgMTI6MjcgUE0NCj4g
U3ViamVjdDogUmU6IE1vZHVsZSBzaWduaW5nIGFuZCBwb3N0LXF1YW50dW0gY3J5cHRvIHB1Ymxp
YyBrZXkNCj4gYWxnb3JpdGhtcw0KPiANCi4uLg0KPiBPZiBjb3Vyc2Ugd2UgY2FuIGRlY2lkZSB0
byBoZWRnZSAqYWxsIGJldHMqIGFuZCBtb3ZlIHRvIGEgY29tcG9zZWQNCj4gc2lnbmF0dXJlIChi
b3RoIGEgY2xhc3NpYyBhbmQgYSBQUSBvbmUpLCBpbiB3aGljaCBjYXNlIEkgd291bGQgc3VnZ2Vz
dA0KPiBsb29raW5nIGludG8gc2lnbmF0dXJlcyB0aGF0IHVzZSBNTC1EU0EtODcgKyBFZDQ0OCBv
ciBNTC1EU0EtODcgKyBQLTUyMQ0KPiAsaWRlYWxseSBkaXNqb2ludCwgd2l0aCBhIGtlcm5lbCBw
b2xpY3kgdGhhdCBjYW4gZGVjaWRlIHdoaWNoIChvciBib3RoKQ0KPiBuZWVkcyB0byBiZSB2YWxp
ZC9jaGVja2VkIHNvIHRoYXQgdGhlIHBvbGljeSBjYW4gYmUgY2hhbmdlZCBxdWlja2x5IHZpYQ0K
PiBjb25maWd1cmF0aW9uIGlmIGFueSBvZiB0aGUgc2lnbmF0dXJlIGlzIGJyb2tlbi4NCj4gDQo+
IFRoaXMgd2lsbCBhbGxvdyBmb3IgZmVhcnMgb2YgTGF0dGljZSBub3QgYmVpbmcgdmV0dGVkIGVu
b3VnaCB0byBiZQ0KPiBtYW5hZ2VkIGFzIHdlbGwgYXMgaW5jcmVhc2luZyB0aGUgc3RyZW5ndGgg
b2YgdGhlIGNsYXNzaWMgb3B0aW9uLCB3aGlsZQ0KPiBtYWludGFpbmluZyBrZXkgYW5kIHNpZ25h
dHVyZSBzaXplcyBtYW5hZ2VhYmxlLg0KDQpJIGxpa2UgdGhlIE1MLURTQS04NyArIEVkNDQ4IGNv
bWJpbmF0aW9uLg0KDQpDb25zaWRlciBzaWduaW5nIHdpdGggdHdvIHNpZ25hdHVyZXM6IHRyYWRp
dGlvbmFsIGFuZCBjb21wb3NpdGUuDQoNClRoZSB0cmFkaXRpb25hbCBzaWduYXR1cmUgd291bGQg
dXNlIHdoYXRldmVyIGFsZ29yaXRobSBpcyB1c2VkIHRvZGF5Lg0KTGVnYWN5IHZlcmlmaWVycyB3
b3VsZCBvbmx5IGNoZWNrIHRoYXQuDQoNClRoZSBjb21wb3NpdGUgc2lnbmF0dXJlIHdvdWxkIHVz
ZToNCiAgICBNTC1EU0EtODcgKyBFZDQ0OCAoKyBTSEFLRTI1NiBpZiB1c2luZyB0aGUgQ01TIGNv
bXBvc2l0ZSBjb25zdHJ1Y3Rpb24pDQoNCk5ldyB2ZXJpZmllcnMgd291bGQgb25seSBjaGVjayB0
aGUgY29tcG9zaXRlIHNpZ25hdHVyZSAod2hpY2ggcmVxdWlyZXMNCmNoZWNraW5nIGJvdGggb2Yg
aXRzIHBhcnRzKS4NCg0KVGhhdCBjb21wb3NpdGUgd291bGQgYmUNCiogRklQUyBjb21wbGlhbnQg
KGFsbCB0aGUgYWxnb3JpdGhtcyBhcmUpDQoqIENOU0EgY29tcGxpYW50IChNTC1EU0EtODcgbWFr
ZXMgaXQgc287IHRoZSByZXN0IGlzIGp1c3Qgbm9pc2UpDQoqIGNvbXBsaWFudCB3aXRoIGFueSBF
dXJvcGVhbiByZXF1aXJlbWVudHMgb3IgcHJlZmVyZW5jZXMgZm9yIHVzaW5nIGh5YnJpZHMNCiog
Y29tcGxpYW50IHdpdGggYW55IHJlcXVpcmVtZW50cyBvciBwcmVmZXJlbmNlcyBmb3IgaGlnaCBz
ZWN1cml0eSBzdHJlbmd0aHMNCiogZXZlbiB3aXRoIHR3byBhbGdvcml0aG1zLCBmYXN0ZXIgdGhh
biB0aGUgdHJhZGl0aW9uYWwgY2hvaWNlcyBmb3Igc2lnbmluZywNCiAgYW5kIGZhc3RlciB0aGFu
IEVDRFNBIGJ1dCBzbG93ZXIgdGhhbiBSU0FTU0EgZm9yIHZlcmlmaWNhdGlvbi4gQnkgYnJpbmdp
bmcNCiAgaW4gRWQ0NDgsIGl0IG1pZ2h0IGJlIHZpZXdlZCBhcyBhbiBpbXByb3ZlbWVudCBldmVu
IGJ5IFBRQyBza2VwdGljcy4NCg0KSXQnZCBiZSBuaWNlIGlmIHNpZ25lZCBrZXJuZWwgbW9kdWxl
cyBhbmQgcGFja2FnZXMgdXNlZCB0aGUgc2FtZSANCmFsZ29yaXRobXMuIEJvdGggb2YgdGhlc2Ug
ZGVmaW5lIE1MLURTQS04NyArIEVkNDQ4IGNvbXBvc2l0ZXM6DQoqIGRyYWZ0LWlldGYtbGFtcHMt
cHEtY29tcG9zaXRlLXNpZ3MNCiAgKiBpZC1NTERTQTg3LUVkNDQ4LVNIQUtFMjU2IHdpdGggT0lE
OiAxLjMuNi4xLjUuNS43LjYuNTENCiogZHJhZnQtaWV0Zi1vcGVucGdwLXBxYw0KICAqIE1MLURT
QS04NytFZDQ0OCBhcyBwdWJsaWMga2V5IGFsZ29yaXRobSBJRCAzMQ0KDQoNCg==

