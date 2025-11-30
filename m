Return-Path: <keyrings+bounces-3480-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E5F5C94BDD
	for <lists+keyrings@lfdr.de>; Sun, 30 Nov 2025 08:15:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E4F693A4A72
	for <lists+keyrings@lfdr.de>; Sun, 30 Nov 2025 07:15:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08E93219319;
	Sun, 30 Nov 2025 07:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.co.uk header.i=@amazon.co.uk header.b="eRgYXS0Q"
X-Original-To: keyrings@vger.kernel.org
Received: from fra-out-013.esa.eu-central-1.outbound.mail-perimeter.amazon.com (fra-out-013.esa.eu-central-1.outbound.mail-perimeter.amazon.com [63.178.132.221])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F77118E025;
	Sun, 30 Nov 2025 07:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=63.178.132.221
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764486948; cv=fail; b=dCRXV8ZD7qUEEDjIjwlbwLUYl/egJywHzWTFDIKPuI9utQ2rZJhCQ10QKSiSxC4vSgvJFlCjo7E+qlRtsEwfF+u2Qk4u5TkyNQYONt8H8A1P0ZF5X9reHBtbOmAfy1Z9Zj2wPkDZgda6EnQwBdWDOtIlwG7EavZB1Qyk3J2qiww=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764486948; c=relaxed/simple;
	bh=TX2YtU/7d+cAvO/lwFK8lXFvxOnvpR8SYOLGR+8XxG4=;
	h=Subject:From:To:CC:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=s/C+AyeP62C/A7UqIE/K0OZEZKZLzzYQH+VeSCFZ9uCJL2phmnwyD9+SRfYz9ZKWs2vWiHjJ4YzhCchqH4hGIEARJK3zaPvQKfNTBI6rRxGUV+l1wFcT9c1jcIYUgcqumiwvOdN62lMmpCnIVmEt6VaY6n1jhv03YqqNfoq1AF4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.co.uk; spf=pass smtp.mailfrom=amazon.co.uk; dkim=pass (2048-bit key) header.d=amazon.co.uk header.i=@amazon.co.uk header.b=eRgYXS0Q; arc=fail smtp.client-ip=63.178.132.221
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.co.uk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
  s=amazoncorp2; t=1764486946; x=1796022946;
  h=from:to:cc:date:message-id:references:in-reply-to:
   content-id:content-transfer-encoding:mime-version:subject;
  bh=TX2YtU/7d+cAvO/lwFK8lXFvxOnvpR8SYOLGR+8XxG4=;
  b=eRgYXS0Qv3qkvowz04742OrCAjjpf9HzPRdREAbDuyYDYgD9qBrUOrbs
   EjEDjtm+CB52WXuea9ykGiigZCM5bO9aZXKMoMH2L/oB2JImrw9ixPVxt
   Z86LBNlziTPyot+o2DGRSJuuSsQY+i3vfF0bZmbVIbuJWg93TsNKC9xUn
   8d5Hh6CZLwe8Ksms53nWouQ2ELx1i5w7jVswqUJoK9sb63IacybZyHSvl
   +/FfkXAAzSPdLJOTeNCFqYXdHUROQt6Hr2ElKAfkcdb+lKFTHOPDQtLbM
   6HM6IYtGjybhfSesyA2Vsxn+7O9CpxvPlrzD19voQkE65VS4aeU+Cj1x7
   A==;
X-CSE-ConnectionGUID: mMjH2IojS0qeFtaCNyWJrw==
X-CSE-MsgGUID: yCcB3bimTR++di+plafFqQ==
X-IronPort-AV: E=Sophos;i="6.20,238,1758585600"; 
   d="scan'208";a="5898861"
Subject: Re: [PATCH 1/4] lib/crypto: Add ML-DSA verification support
Thread-Topic: [PATCH 1/4] lib/crypto: Add ML-DSA verification support
Received: from ip-10-6-11-83.eu-central-1.compute.internal (HELO smtpout.naws.eu-central-1.prod.farcaster.email.amazon.dev) ([10.6.11.83])
  by internal-fra-out-013.esa.eu-central-1.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2025 07:15:28 +0000
Received: from EX19MTAEUA002.ant.amazon.com [54.240.197.232:8616]
 by smtpin.naws.eu-central-1.prod.farcaster.email.amazon.dev [10.0.27.255:2525] with esmtp (Farcaster)
 id f138c187-5966-408d-978a-f35b8bda1ba4; Sun, 30 Nov 2025 07:15:28 +0000 (UTC)
X-Farcaster-Flow-ID: f138c187-5966-408d-978a-f35b8bda1ba4
Received: from EX19EXOEUA002.ant.amazon.com (10.252.50.139) by
 EX19MTAEUA002.ant.amazon.com (10.252.50.126) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.29;
 Sun, 30 Nov 2025 07:15:27 +0000
Received: from CWXP265CU010.outbound.protection.outlook.com (10.252.50.44) by
 EX19EXOEUA002.ant.amazon.com (10.252.50.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.29
 via Frontend Transport; Sun, 30 Nov 2025 07:15:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F55IWzC+R/Fn2Im05FZcsWH4rWziywF+A23qp71hG9FwrR0e7veWFSZUQmDXgbmxElHhNsdnaOEeM/o8ActV+5eL7Fc5F8Lfeat9Cn7GYjiN7ZFoTpLu01UDHa8iworimQ+ctaPy86t6IQRzTDv/RlLOC81l8ePn42XynMkuNbIn7buMwnVmh8k1s1h2VJ9H14T22FvBtLeN4BAraPsFYzG79aSmiImavxOZO5yjPkmAqvzExiNrrF14LPdO8lP8mKE2YlZvRnoxZMbVxysAJ1MrhER6NFImd9jFhIh0RTVM5LWOXOaFWJ5GgiG6/KnvQ6jO+thli+wGeKjuyolRAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TX2YtU/7d+cAvO/lwFK8lXFvxOnvpR8SYOLGR+8XxG4=;
 b=BRdH4dN0/gZJDxBDGvsoBiqLsDwNEzvMDHf0MIoquYyn/DipskxKcIzefujh4GoZ9PrrD8utQ9WuZ84Ant59esUxx7FzpDInOBoClis91EJh2lRaXB8/H4FTTz7ub3yMbl07CwQKymrD0u1uDVHmZv0uPyrB5a91voXZ9Xi+JpqTvQt7ksoESHj3RKWvWOHJ8vgMpS3UmrTUHUs+8pYTuJ1ESa3uqT8Gklzm4dbJclAJd3oCneRumMAgt5kzghwclSc7giPxsrtmhIbRTS5EWKwJh/kFpyTHrvz3ejpBMk9XcH8iVbSdZ1zVyMWilHjfXmRSgcvXidZCAH9TwBGAAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amazon.co.uk; dmarc=pass action=none header.from=amazon.co.uk;
 dkim=pass header.d=amazon.co.uk; arc=none
Received: from LO4P123MB5121.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:1f4::8)
 by CWLP123MB6362.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:1cc::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Sun, 30 Nov
 2025 07:15:22 +0000
Received: from LO4P123MB5121.GBRP123.PROD.OUTLOOK.COM
 ([fe80::bbde:f164:4dc2:7b98]) by LO4P123MB5121.GBRP123.PROD.OUTLOOK.COM
 ([fe80::bbde:f164:4dc2:7b98%6]) with mapi id 15.20.9366.012; Sun, 30 Nov 2025
 07:15:22 +0000
From: "Becker, Hanno" <beckphan@amazon.co.uk>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>, Eric Biggers <ebiggers@kernel.org>
CC: "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>, "David
 Howells" <dhowells@redhat.com>, Herbert Xu <herbert@gondor.apana.org.au>,
	"Luis Chamberlain" <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>,
	"Daniel Gomez" <da.gomez@kernel.org>, Sami Tolvanen
	<samitolvanen@google.com>, "Ard Biesheuvel" <ardb@kernel.org>, Stephan
 Mueller <smueller@chronox.de>, "Lukas Wunner" <lukas@wunner.de>, Ignat
 Korchagin <ignat@cloudflare.com>, "keyrings@vger.kernel.org"
	<keyrings@vger.kernel.org>, "linux-modules@vger.kernel.org"
	<linux-modules@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "matthias@kannwischer.eu"
	<matthias@kannwischer.eu>
Thread-Index: AQHcYY9nSDSOXzRbZ0C/K/FInZEGA7UKZ6wAgABnYoA=
Date: Sun, 30 Nov 2025 07:15:22 +0000
Message-ID: <1CB2640E-B918-4C90-933D-61D5B1954E6C@amazon.co.uk>
References: <20251120003653.335863-1-ebiggers@kernel.org>
 <20251120003653.335863-2-ebiggers@kernel.org>
 <A7135B59-BAB5-451E-AD71-971F828054F0@amazon.co.uk>
 <20251130001911.GA12664@sol> <aSuYUDdlZvZrXuUo@zx2c4.com>
In-Reply-To: <aSuYUDdlZvZrXuUo@zx2c4.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels: MSIP_Label_19e68092-05df-4271-8e3e-b2a4c82ba797_Enabled=true;MSIP_Label_19e68092-05df-4271-8e3e-b2a4c82ba797_SetDate=2025-11-30T07:04:37Z;MSIP_Label_19e68092-05df-4271-8e3e-b2a4c82ba797_ContentBits=0;MSIP_Label_19e68092-05df-4271-8e3e-b2a4c82ba797_Enabled=true;MSIP_Label_19e68092-05df-4271-8e3e-b2a4c82ba797_Tag=50,
 3, 0,
 1;MSIP_Label_19e68092-05df-4271-8e3e-b2a4c82ba797_Name=Confidential;MSIP_Label_19e68092-05df-4271-8e3e-b2a4c82ba797_ActionId=b65c763c-ef11-4603-9e0e-533393abbfc5;MSIP_Label_19e68092-05df-4271-8e3e-b2a4c82ba797_SiteId=5280104a-472d-4538-9ccf-1e1d0efe8b1b;MSIP_Label_19e68092-05df-4271-8e3e-b2a4c82ba797_Method=Standard;
user-agent: Microsoft-MacOutlook/16.102.25101223
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amazon.co.uk;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LO4P123MB5121:EE_|CWLP123MB6362:EE_
x-ms-office365-filtering-correlation-id: d1f41ff8-acc6-44fa-dfbc-08de2fe039e1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|10070799003|7416014|366016|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?WkJQb01aRWpRRk1YRTFYVXJzMjdkZkJKanRBbEpMeUI2OXFaK28zWCtrVHJ2?=
 =?utf-8?B?ZVRyQ08xZ0NRV1ZDVnAvUmprOWtEa0xKelI4d05rTnZma3NCTXJobkd6RGFJ?=
 =?utf-8?B?M3ZTQ0pPZEg0czUzbDhSMWdVbzB5UlBRR3ZlaWwvZTBXWXJPckVVQ2xJdTNM?=
 =?utf-8?B?SXdHU3M5NGdzcS9vSUlGNkFKaVBvNG9FS0gxS05XbUc5Y000bVQwOUNlbGND?=
 =?utf-8?B?YUNJT2tlRzF2Z0RpK052RXVOODFjTERwNEF5L0RLNW9jTTlhbDIrdCtXVEli?=
 =?utf-8?B?WUQ2bGhveGxJdERsR1JiMFhyMlJXZGh5SHdNZktLK2hoQWsxcUd5YURGU2gz?=
 =?utf-8?B?eTgzcFJZQmtLTlpVZ05vRXUvV1gwczRmeHVBaDBWeFZIdm91Qi94VmgwcVpR?=
 =?utf-8?B?bjFJZzRqUDhUTjM4ZXJKZkt4ODYwR1hDeVVDR1hOYndpNkU2K21QWGxRbTBv?=
 =?utf-8?B?WEdFajgzbDF1OXNsZndQVGJ5UGl5alB2N3ZGZzZSQ0dKS25rWXozNGhnYW02?=
 =?utf-8?B?eC9udjRnN1ozMWF5cEo4MkJlNEhiV2drb3lPK0RtdW5uNTV0dnFsOUtmRHhH?=
 =?utf-8?B?d2QxV1JOZkdFNW5xSUo1TjdhTll1OWtBZmpHdGtnMDZnUG8wKy9pOU1kU284?=
 =?utf-8?B?V0NuQmZMb1dzN1ZiOE02RlhTRVFwcnRHcmVoT3lhelhuM1FINzBRcWZyeTJR?=
 =?utf-8?B?LzdRQmIydUhkY05XNnhrZVpjK3d3all4M0I0LzNOVGZkRlByWTI4UUQzbXg5?=
 =?utf-8?B?QTExckRIWWtkNGxBTFhZTzBIT2ZRV1djZG92S2VkNHdhK3ZQdTNoTjg5eWVz?=
 =?utf-8?B?MWlidi9xVlYxeWUzblloaDlYd1M2OC9QbUhYdkNtZmo0UW5NN242VVdWS3JB?=
 =?utf-8?B?WjdnVEd1U0Z2akE0aVZMZ3hSZ09BRng2ck9adnIzQlJwUjRLdjJmMkZSN0Ez?=
 =?utf-8?B?QjRWSXh3dnV4Ky94RGFHWlRrc1BVS3IyWlh3MHdDbWpqZjl2U3ZnUDRuOURU?=
 =?utf-8?B?Nzd5RmdweUsvV1cwWW8vR2VydkUxNHpSaC9HSlFXQWFEajdmZ2pZaFZac1VQ?=
 =?utf-8?B?NGVOQnEyTE5oaTJyRExZM1o4VngrRzVOTnBsdVRYOC90bmd2bGhHTUZRZ1BW?=
 =?utf-8?B?T0ZMV3lia0RLeFVodEZJb3pFQmwvMjZxMjM4MjE1eTdMeVVJWXU2eldZQ09h?=
 =?utf-8?B?QTNQZ2k4OTR0eDZ6NGZYQjNlUWNmME1kL0d2Q3ptTUwyT0hWL1M1RkpiQzhV?=
 =?utf-8?B?cEt0djNKdm5xVVptUS9QbC9qZW9WSkZpcVd1cEtqZEdoV2ZveDVOMHU4Y3pQ?=
 =?utf-8?B?QVdoQ2hzbnFqQkNFYXpwa1llaVgyb3NaY1B3M0diNkFQSDhhcDluK1RURTE5?=
 =?utf-8?B?cy9kQnVOSWg0VlRvVU01a3JWQ0NaemhuajMyZHR2bEE0RzIvRWFmOS9SZm10?=
 =?utf-8?B?TVF6TkVQL0NhNzJXLzU2UVNtYmJxRXFQWTMzOVJETEd6T2p2YXlaU3V1N05K?=
 =?utf-8?B?RnA3ZDhySEcyek5uWjZrMkQrb2Y4MWNRYWRzSlYrUDltOVV0TVNaYmMwQnBl?=
 =?utf-8?B?aXdacWJ1TVJqTDl6NGtIcFpsRWYwWXlYN2E0b2NuejlIcVNzejNEOFR3T1ZO?=
 =?utf-8?B?OTJsbzA3cVJLUW04VGFXc3lkeG1nYno4SkoydGR6Q0JBU2N3ODA4ZmhVTm8y?=
 =?utf-8?B?N3o3T1NuenYzdzNRRURkOTMwMTNxV0NXVzRrYlYzMnhZVk84TjZBTmVUUjVI?=
 =?utf-8?B?b2VDMkJ0RHUzQTBjc3RYRzY3YjJab1lsdDJYaXJUVWJ4aWRURHYrZkxmbTNT?=
 =?utf-8?B?aGFYcmFWbmQ3WnJSZjBLbzdBY3ByNVVtWW16NGNPNlpWUmVNTkJNdGZBTmxh?=
 =?utf-8?B?UlJFVDVLdnJRVTVCdlN6TXpoZy80bzRWbFI3MS9xY09QVjlBNzZxeGtJOC8r?=
 =?utf-8?B?NWVlc0F5OUFySTgyN285NzhxOXNQWHpWQ1lrbWFJWU1TREpOMUtTSzFlT25K?=
 =?utf-8?B?dFQ3dndSMkptRTBKbmxGRFpCRjBuQkZ0K0twUjlITndXNnA3V2IwbkJSeHNY?=
 =?utf-8?B?emRXcmZHUG5ZZHVHMFNPSG1qTXFrM2dCc2NIQT09?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LO4P123MB5121.GBRP123.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(10070799003)(7416014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?a0U1NmMzWXFsdU1HaktHZTl3MzZQc2wraG15NC9vTStWSVk0MDR5bFpIZ3Q3?=
 =?utf-8?B?bWNlYmFtTU92RUxKbzVERGNJd0dHZU5kcktqaEs0QXpDMCszdXF2OWEvS1hF?=
 =?utf-8?B?ZUc2UHgyMFQ2eUthOFpLb3lXaHZzMExjbUtGT0JxOWJXQjZBcVhXUXl5Z25Q?=
 =?utf-8?B?VUl0R3krM2dxc2NKSzlNWTlidUhwVFU3VmUzUFBkRmlpK2xUUEEvK01FNm5Q?=
 =?utf-8?B?RE1FMU1CWFpXZ0Q5UjdWcy9zaUFnaEwyL1NWeGwzamczOXcwMlNPMGR6NkRQ?=
 =?utf-8?B?ZzUxM0hVeEhTdE1IK2paSFoyUlNCZXh1N0k2ZmgvZWYybXhpdy95T0NpTW1K?=
 =?utf-8?B?TUxsdXZtb2Uwb3k3WGRnLzJHai8wNnJ4VkhVL20zdHN5UklxeHJBUTloQSsr?=
 =?utf-8?B?QlVqSWdMNFZPY0swTVUzaXY3NXFEUkg3Tzd3TEYyZVV1eGFZT1BFdndLNDBD?=
 =?utf-8?B?ZjFkaWY3UHJoM21qUnFOS1c1TFRqcStqS1g1T3E2MDFMSW1YeC9aem5RenAy?=
 =?utf-8?B?WnFWTHFQd2VoSEpXVm0ybTAxaGxLZVZkNFhuNDRMQzIyWTZRZzBQbnBOYmw2?=
 =?utf-8?B?ZDJ1QzRrZFRvbmc1MU81ejJzMFRqa0lXdlhZMU9XZitzcUY5cmswTTVHZXRr?=
 =?utf-8?B?NWJVN29rRzN0SDFRTVJhMmhjYy9pZjhORHl3ajVMc1hHOWp5alpvUHZpdGIz?=
 =?utf-8?B?RS91MHp2VFlGQ0lQMlBVTVR3dkdkTnVycThPS1JLWnNmQi9PSEY1dTcxazJS?=
 =?utf-8?B?NFlBVkg4Mkdjc0w0NUdoeG9mY3RyZFgwVG5ac1hUZ1hZY3BKcUh3UnFCeGJz?=
 =?utf-8?B?Nk9EaFF3VTJuUklwQ056L09Jb1hqV2haMTlxc3NLVTBMN1U0dHp3NU4rTUpa?=
 =?utf-8?B?Y2oxblgrTFhlbXpUOU56MkVQWFplOGlteCtndEE0QkFySTdiZzJtNTM1QWNW?=
 =?utf-8?B?R2NJQmQrWjh4eFdlQUdMSjBMT3lyV24yTStxY25NZVJYa2dhQ0g0bXFDTHN5?=
 =?utf-8?B?dDhQd09kRlhXTFZLeXJubWpkS2NuUFdvaTAzYkRXeEY4RDhRclFHTHpFLzV2?=
 =?utf-8?B?SGZmcVFObGMwU2EvMHNjNkoyTkJVYURUdHRUVzY4RGpwV25vdGZwVUNRMEFF?=
 =?utf-8?B?bjBtOGZpQlN5aTRpTUFEOSt3eEhiOGpxRk0wVzhxQmVwSHRjVXhsSkpzdkFo?=
 =?utf-8?B?bWZsSHNKNWU2dFI0c0FIc20zZmZWQW5uVDRROFJlQ1hLeDR4Nnp4VEJvMTQz?=
 =?utf-8?B?b1gyblhQc2x5WGdmN3pxSWcwTDdSV09ZaG1MaHYrWTRuUnZFYXZUZGltSkpY?=
 =?utf-8?B?S1NLMlMzWnF6enRXMEtOVEtZVTVoYldCY2xkRkpmbWFxOFlhcFNMSWZ4VlF4?=
 =?utf-8?B?dlhRNE1VWGQxWTFpWXMxRTZGMzRJUmVOOStoTXcza25BNlRPMEVwU21Ub3ZH?=
 =?utf-8?B?SS9LSkx1Yk9vYVQzcUtLTTdsaUQzcTJVZG1tTDVwcFFZR1hObDhVbnYvWjBO?=
 =?utf-8?B?UUJieGxLbVdnSHBDYTNFZXFmREQvejJtZ2hiMnFiNGVnd3JYbDRBUTFiamdE?=
 =?utf-8?B?dWJnTlBXaTZVUEMrMjloYU1aSW02TW9KNkVML2N6SUY3VWtabm9kc0hoUmtw?=
 =?utf-8?B?UnJMaCtZZGlPaGVHeCs2UVk0bmh1dXZXSUlRQXR5N2Z0UkpDak0wSmtLV1hs?=
 =?utf-8?B?YW54TVdTTjkva3g1VUR6eHVWbXB3WnpUOEVyZjJxK1hTOW5VRDcyUHNacUt2?=
 =?utf-8?B?UW04T0VKTHkvRlQ1WXpTQk5JU0RlTjdlall5NzRkSXI5M1pJUjNRWXhaajVW?=
 =?utf-8?B?cGVEMENMWlo0TFNRVkphZHJSNUsxOUM2S3c0VVcwNHg1cFhtN3BoZ2ZZZUNP?=
 =?utf-8?B?Y0ZiUW1wOHlBMVFGLytVZmtUcmZOb2lrR3IwYmJ0d3g0d0xBakpGWk5BK0RR?=
 =?utf-8?B?czRFYjZuL1hkZ2x1d0wxL2pSQUV1RG5oTWQzSk8zd3pPWkVDUjF0OVFDR21B?=
 =?utf-8?B?SWxGaER5VDNxQThpcVB4RXR0TW5xSWRPZW9OSy95ZjVNS1Fnd2taeGlJb2ln?=
 =?utf-8?B?dmxFeGpTb0lBbmdnTm1iaDBxMktVNlY2TEkxdU83YzAwaGVLdkNrWmJyTnRV?=
 =?utf-8?B?cnhYYndBejlqN3dwdkFSOXQ0NHNRcVBoZ3ltdnRORlNPVVlUc0lFdThXc21n?=
 =?utf-8?B?OVF3ZjEyN2RUN3VjWUlSTTRxUmhEdUI0K21pbCtDanhqVUpiL2JRMWJ0b1Yz?=
 =?utf-8?B?dzNHM3l6Y3dhLzhKdkhMd2FtN2VnPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1A290D862A1B7E46A380034FCFFB46B0@GBRP123.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LO4P123MB5121.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: d1f41ff8-acc6-44fa-dfbc-08de2fe039e1
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Nov 2025 07:15:22.3266
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5280104a-472d-4538-9ccf-1e1d0efe8b1b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HFFTURYqgx0UFVxR5QUd7ar/g0GuU7S9lB76lwcN1UoPwRngvq1W//+qa52rNICqFRMxRoI4Lh5L5acRo1p4Gg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP123MB6362
X-OriginatorOrg: amazon.co.uk

RXJpYywgSmFzb24sDQoNClRoYW5rcyBmb3IgdGhlIGZhc3QgcmVwbGllcyENCg0KT24gMzAvMTEv
MjAyNSwgMDA6MjIsICJFcmljIEJpZ2dlcnMiIDxlYmlnZ2Vyc0BrZXJuZWwub3JnDQo8bWFpbHRv
OmViaWdnZXJzQGtlcm5lbC5vcmc+PiB3cm90ZToNCj4gSSB0aGluayB5b3UgbWF5IGJlIHVuZGVy
ZXN0aW1hdGluZyBob3cgbXVjaCB0aGUgcmVxdWlyZW1lbnRzIG9mIHRoZQ0KPiBrZXJuZWwgZGlm
ZmVyIGZyb20gdXNlcnNwYWNlLg0KDQpUaGVyZSBpcyBubyBkb3VidCB0aGlzIGlzIHRoZSBjYXNl
IC0tIEkgYW0gbm90IGEga2VybmVsIGd1eSAtLSBzbyB0aGUNCnBvaW50cyB5b3UgcmFpc2UgYXJl
IHZlcnkgdmFsdWFibGUuDQoNCkVxdWFsbHksIHlvdSBtYXkgYmUgdW5kZXJlc3RpbWF0aW5nIGhv
dyBtdWNoIHdvcmsgaXQgaXMgdG8gZ28gZnJvbSBhDQpzdGF0aWMgdmVyaWZpY2F0aW9uLW9ubHkg
Y29kZSB0byBzb21ldGhpbmcgdGhhdCB0aGUgY29tbXVuaXR5IHdpbGwgYmUNCmFibGUgdG8gd29y
ayB3aXRoIGFuZCBleHRlbmQgaW4gdGhlIGZ1dHVyZS4NCg0KVGhlcmUncyBjbGVhcmx5IG9wcG9y
dHVuaXR5IHRvIGxlYXJuIGZyb20gZWFjaCBvdGhlciBoZXJlLiBJZiB0aGlzIHBhdGNoDQpmb3Jt
cyB0aGUgJ21sZHNhLXYxJyBmb3IgdGhlIGtlcm5lbCwgaXQgd291bGQgYmUgZ3JlYXQgdG8gd29y
ayB0b2dldGhlcg0KdG8gc2VlIGlmICdtbGRzYS12MicgY291bGQgY29tZSBmcm9tIG1sZHNhLW5h
dGl2ZS4NCg0KPiBJbiBub25lIG9mIHRoZW0gaGFzIHRoZSBrZXJuZWwgY29tbXVuaXR5IGJlZW4g
c3VjY2Vzc2Z1bCB3aXRoDQo+IGludGVncmF0aW5nIGEgcHJvamVjdCB3aG9sZXNhbGUsIHZzLiBq
dXN0IHRha2luZyBpbmRpdmlkdWFsIGZpbGVzLg0KDQpJIHRha2UgdGhhdCBhcyBhIGNoYWxsZW5n
ZS4gV2l0aCBBV1MtTEMgd2Ugd2VyZSBhbHNvIHRvbGQgdGhhdA0KbWxrZW0tbmF0aXZlIHdvdWxk
IG5ldmVyIGJlIGFibGUgdG8gaW50ZWdyYXRlIHdob2xlc2FsZSAtLSBhbmQgbm93IGl0DQppcy4g
SXQncyBhIG1hdHRlciBvZiBnb29kd2lsbCBhbmQgY29sbGFib3JhdGlvbiwgYW5kIG5vdCBhIGJp
bmFyeQ0KeWVzL25vIC0tIGlmIHNlbGVjdGVkIGJ1dCBtaW5pbWFsIHBhdGNoZXMgYXJlIG5lZWRl
ZCwgdGhhdCdzIHN0aWxsDQpiZXR0ZXIgdGhhbiBhbiBlbnRpcmVseSBzZXBhcmF0ZSBpbXBsZW1l
bnRhdGlvbiwgaW4gbXkgbWluZC4NCg0KPiAtIEtlcm5lbCBzdGFjayBpcyA4IEtCIHRvIDE2IEtC
LiAuLi4NCg0KWWVzLCBhcyBtZW50aW9uZWQgd2Ugc3RhcnRlZCB3b3JraW5nIG9uIGEpIGJyaW5n
aW5nIHRoZSBtZW1vcnkgdXNhZ2UNCmRvd24sIGFuZCBiKSBtYWtpbmcgdGhlIHVzZSBvZiBoZWFw
L3N0YWNrIGNvbmZpZ3VyYWJsZS4NCg0KPiAtIFZlY3RvciByZWdpc3RlcnMgKGUuZy4gQVZYKSBj
YW4gYmUgdXNlZCBpbiB0aGUga2VybmVsIG9ubHkgaW4gc29tZQ0KPiAgY29udGV4dHMsIGFuZCBv
bmx5IHdoZW4gdGhleSBhcmUgZXhwbGljaXRseSBzYXZlZCBhbmQgcmVzdG9yZWQuICBTbw0KPiAg
d2UgaGF2ZSB0byBkbyBvdXIgb3duIGludGVncmF0aW9uIG9mIGFueSBjb2RlIHRoYXQgdXNlcyB0
aGVtIGFueXdheS4NCj4gIFRoZXJlIGlzIGFsc28gbW9yZSBvdmVyaGVhZCB0byBlYWNoIHZlY3Rv
ci1vcHRpbWl6ZWQgZnVuY3Rpb24gdGhhbg0KPiAgdGhlcmUgaXMgaW4gdXNlcnNwYWNlLCBzbyB2
ZXJ5IGZpbmUtZ3JhaW5lZCBvcHRpbWl6YXRpb24gKGUuZy4gYXMgaXMNCj4gIHVzZWQgaW4gdGhl
IERpbGl0aGl1bSByZWZlcmVuY2UgY29kZSkgZG9lc24ndCB3b3JrIHRvbyB3ZWxsLg0KDQpUaGF0
J3MgdmVyeSB1c2VmdWwsIGNhbiB5b3Ugc2F5IG1vcmU/IFdvdWxkIG9uZSB3YW50IHNvbWUgc29y
dCBvZg0KY29uZmlndXJhYmxlIHByZWFtYmxlL3Bvc3RhbWJsZSBpbiB0aGUgdG9wLWxldmVsIEFQ
SSB3aGljaCB0YWtlcyBjYXJlIG9mDQp0aGUgbmVjZXNzYXJ5IHNhdmUvcmVzdG9yZSBsb2dpYz8N
Cg0KV2hhdCBpcyB0aGUgcGVyLWZ1bmN0aW9uIG92ZXJoZWFkPw0KDQo+IC0gVGhlIHZlY3RvciBp
bnRyaW5zaWNzIGxpa2UgPGltbWludHJpbi5oPiBjYW4ndCBiZSB1c2VkIGluIHRoZQ0KPiAga2Vy
bmVsLCBhcyB0aGV5IGRlcGVuZCBvbiB1c2Vyc3BhY2UgaGVhZGVycy4gIFRodXMsIHZlY3Rvcg0K
PiAgaW5zdHJ1Y3Rpb25zIGNhbiBnZW5lcmFsbHkgYmUgdXNlZCBvbmx5IGluIGFzc2VtYmx5IGNv
ZGUuICBJIGJlbGlldmUNCj4gIHRoaXMgcHJvYmxlbSBpcyBzb2x2YWJsZSB3aXRoIGEgY29tYmlu
YXRpb24gb2YgY2hhbmdlcyB0byBHQ0MsIGNsYW5nLA0KPiAgYW5kIHRoZSBrZXJuZWwsIGFuZCBJ
J2QgbGlrZSB0byBzZWUgdGhhdCBoYXBwZW4uICBCdXQgc29tZW9uZSB3b3VsZA0KPiAgbmVlZCB0
byBkbyBpdC4NCg0KVGhlIHVzZSBvZiBpbnRyaW5zaWNzIGlzIG9uIHRoZSB3YXkgb3V0OyB0aGUg
a2VybmVsIGlzbid0IHRoZSBvbmx5DQpwcm9qZWN0IHdobyBjYW4ndCB1c2UgdGhlbS4NCg0KVXNp
bmcgYXNzZW1ibHkgaXMgYWxzbyBtb3JlIHN1aXRhYmxlIGZvciBvdXIgb3B0aW1pemF0aW9uIGFu
ZA0KdmVyaWZpY2F0aW9uIGFwcHJvYWNoIGluIG1sa2VtLW5hdGl2ZSBhbmQgbWxkc2EtbmF0aXZl
OiBXZSBzdXBlcm9wdGltaXplDQpzb21lIGFzc2VtYmx5IHVzaW5nIFNMT1RIWSAoaHR0cHM6Ly9n
aXRodWIuY29tL3Nsb3RoeS1vcHRpbWl6ZXIvc2xvdGh5LykNCmFuZCB0aGVuIGRvICdwb3N0LWhv
YycgdmVyaWZpY2F0aW9uIG9mIHRoZSBmaW5hbCBvYmplY3QgY29kZSB1c2luZw0KdGhlIEhPTC1M
aWdodC9zMm4tYmlnbnVtIChodHRwczovL2dpdGh1Yi5jb20vYXdzbGFicy9zMm4tYmlnbnVtLykN
CmluZnJhc3RydWN0dXJlLiBJbiBtbGtlbS1uYXRpdmUsIGFsbCBBQXJjaDY0IGFzc2VtYmx5IGlz
IGRldmVsb3BlZCBhbmQNCnZlcmlmaWVkIGluIHRoaXMgd2F5OyBpbiBtbGRzYS1uYXRpdmUsIHdl
IGp1c3QgY29tcGxldGVkIHRoZQ0KdmVyaWZpY2F0aW9uIG9mIHRoZSBBVlgyIGFzc2VtYmx5IGZv
ciB0aGUgYmFzZSBtdWx0aXBsaWNhdGlvbiBhbmQgdGhlDQpOVFQuDQoNCj4gTm90ZSB0aGF0IHRo
ZSBrZXJuZWwgYWxyZWFkeSBoYXMgb3B0aW1pemVkIEtlY2NhayBjb2RlLiAgVGhhdCBhbHJlYWR5
DQo+IGNvdmVycyB0aGUgbW9zdCBwZXJmb3JtYW5jZS1jcml0aWNhbCBwYXJ0IG9mIE1MLURTQS4N
Cg0KTm8sIHRoaXMgd291bGQgbmVlZCBfYmF0Y2hlZF8gS2VjY2FrLiBBbiBNTC1EU0EgaW1wbGVt
ZW50YXRpb24gdXNpbmcNCm9ubHkgMXgtS2VjY2FrIHdpbGwgbmV2ZXIgaGF2ZSBjb21wZXRpdGl2
ZSBwZXJmb3JtYW5jZS4gU2VlDQpodHRwczovL2dpdGh1Yi5jb20vcHEtY29kZS1wYWNrYWdlL21s
ZHNhLW5hdGl2ZS9wdWxsLzc1NCBmb3IgdGhlDQpwZXJmb3JtYW5jZSBsb3NzIGZyb20gdXNpbmcg
dW5iYXRjaGVkIEtlY2NhayBvbmx5LCBvbiBhIHZhcmlldHkgb2YNCnBsYXRmb3JtczsgaXQncyA+
MnggZm9yIHNvbWUuDQoNCkluIHR1cm4sIGlmIHlvdSB3YW50IHRvIGludGVncmF0ZSBiYXRjaGVk
IEtlY2NhayAtLSBidXQgcGVyaGFwcyBvbmx5IG9uDQpzb21lIHBsYXRmb3Jtcz8gLS0geW91IG5l
ZWQgdG8gcmV3cml0ZSB5b3VyIGVudGlyZSBjb2RlIHRvIG1ha2UgdXNlIG9mDQppdC4gVGhhdCdz
IG5vdCBhIHNpbXBsZSBjaGFuZ2UsIGFuZCBwYXJ0IG9mIHdoYXQgSSBtZWFuIHdoZW4gSSBzYXkg
dGhhdA0KdGhlIGNoYWxsZW5nZXMgYXJlIGp1c3QgZGVmZXJyZWQuIE5vdGUgdGhhdCB0aGUgb2Zm
aWNpYWwgcmVmZXJlbmNlIGFuZA0KQVZYMiBpbXBsZW1lbnRhdGlvbnMgZHVjayB0aGlzIHByb2Js
ZW0gYnkgZHVwbGljYXRpbmcgdGhlIGNvZGUgYW5kDQphZGp1c3RpbmcgaXQsIHJhdGhlciB0aGFu
IGxvb2tpbmcgZm9yIGEgY29tbW9uIHN0cnVjdHVyZSB0aGF0IGNvdWxkIGhvc3QNCmJvdGggJ3Bs
YWluJyBhbmQgYmF0Y2hlZCBLZWNjYWsuIEkgYXNzdW1lIHRoZSBhbW91bnQgb2YgY29kZSBkdXBs
aWNhdGlvbg0KdGhpcyBicmluZ3Mgd291bGQgYmUgdW5hY2NlcHRhYmxlLg0KDQpPbiAzMC8xMS8y
MDI1LCAwMTowNiwgIkphc29uIEEuIERvbmVuZmVsZCIgPEphc29uQHp4MmM0LmNvbQ0KPG1haWx0
bzpKYXNvbkB6eDJjNC5jb20+PiB3cm90ZToNCg0KPiBJJ3ZlIGFkZGVkIGEgYml0IG9mIGZvcm1h
bGx5IHZlcmlmaWVkIGNvZGUgdG8gdGhlIGtlcm5lbCwgYW5kIGFsc28NCj4gcG9ydGVkIHNvbWUg
dXNlcnNwYWNlIGNyeXB0by4gSW4gdGhlc2UgY2FzZXMsIEkgd291bmQgdXAgd29ya2luZyB3aXRo
DQo+IHRoZSBhdXRob3JzIG9mIHRoZSBjb2RlIHRvIG1ha2UgaXQgbW9yZSBzdWl0YWJsZSB0byB0
aGUgcmVxdWlyZW1lbnRzDQo+IG9mIGtlcm5lbCBzcGFjZSAtLSBldmVuIGRvd24gdG8gdGhlIGZv
cm1hdHRpbmcgbGV2ZWwuIEZvciBleGFtcGxlLCB0aGUNCj4gSEFDTCogcHJvamVjdCBuZWVkZWQg
c29tZSBjaGFuZ2VzIHRvIEtSZU1MaW4gdG8gbWFrZSB0aGUgdmFyaWV0eSBvZg0KPiBjb2RlIGZp
dCBpbnRvIHdoYXQgdGhlIGtlcm5lbCBleHBlY3RlZC4gQW5keSBQb2x5YWtvdidzIGNvZGUgbmVl
ZGVkDQo+IHNvbWUgaW50ZXJuYWwgZnVuY3Rpb25zIGV4cG9zZWQgc28gdGhhdCB0aGUga2VybmVs
IGNvdWxkIGRvIGNwdQ0KPiBjYXBhYmlsaXR5IGJhc2VkIGRpc3BhdGNoLiBBbmQgc28gb24gYW5k
IHNvIGZvcnRoLiBUaGVyZSdzIGFsd2F5cw0KPiBfc29tZXRoaW5nXy4NCg0KMTAwJS4gVGhpcyBp
cyB3aGVyZSB3ZSBuZWVkIHN1cHBvcnQgZnJvbSBzb21lb25lIGluIHRoZSBrZXJuZWwgdG8gZXZl
bg0Ka25vdyB3aGF0IG5lZWRzIGRvaW5nLiBUaGUgY2F2ZWF0IHJlZ2FyZGluZyBTSU1EIHVzYWdl
IEVyaWMgbWVudGlvbmVkIGlzDQphIGdvb2QgZXhhbXBsZS4gVGhlIENQVSBjYXBhYmlsaXR5IGJh
c2VkIGRpc3BhdGNoLCBmb3IgZXhhbXBsZSwgd2FzDQpzb21ldGhpbmcgd2UgZmx1c2hlZCBvdXQg
d2hlbiB3ZSBkaWQgdGhlIEFXUy1MQyBpbnRlZ3JhdGlvbjogZGlzcGF0Y2ggaXMNCm5vdyBjb25m
aWd1cmFibGUuDQoNCj4gSWYgdGhvc2UgYXJlIGVmZm9ydHMgeW91J2QgY29uc2lkZXIgdW5kZXJ0
YWtpbmcgc2VyaW91c2x5LCBJJ2QgYmUNCj4gaGFwcHkgdG8gYXNzaXN0IG9yIGhlbHAgZ3VpZGUg
dGhlIGNvbnNpZGVyYXRpb25zLg0KDQpXZSBhcmUgdGFraW5nIG1sa2VtL21sZHNhLW5hdGl2ZSBz
ZXJpb3VzbHkgYW5kIHdhbnQgdG8gbWFrZSB0aGVtIGFzDQp1c2FibGUgYXMgcG9zc2libGUuIFNv
LCByZWdhcmRsZXNzIG9mIHdoZXRoZXIgdGhleSdkIHVsdGltYXRlbHkgZW5kIHVwDQppbiB0aGUg
a2VybmVsLCBhbnkgc3VwcG9ydCBvZiB0aGUgZm9ybSAiSWYgeW91IHdhbnRlZCB0byBpbnRlZ3Jh
dGUgdGhpcw0KaW4gZW52aXJvbm1lbnQgWFhYIFtsaWtlIHRoZSBrZXJuZWxdLCB0aGVuIHlvdSB3
b3VsZCBuZWVkIC4uLiIgaXMgdmVyeQ0KdXNlZnVsIGFuZCB3ZSdkIGJlIGdyYXRlZnVsIGZvciBp
dC4NCg0KSSBkb24ndCBleHBlY3QgdGhpcyB0byBiZSBzb21ldGhpbmcgd2UgY2FuIHJ1c2ggdGhy
b3VnaCBpbiBhIGNvdXBsZSBvZg0KZGF5cywgYnV0IHNvbWV0aGluZyB0aGF0J3MgYWNoaWV2ZWQg
d2l0aCBzdGVhZHkgcHJvZ3Jlc3MgYW5kDQpjb2xsYWJvcmF0aW9uLg0KDQo+IEFueXdheSwgdGhl
IGJpZ2dlciBwaWN0dXJlIGlzIHRoYXQgSSdtIHZlcnkgZW50aHVzaWFzdGljIGFib3V0IGdldHRp
bmcNCj4gZm9ybWFsbHkgdmVyaWZpZWQgY3J5cHRvIGluIHRoZSBrZXJuZWwsIHNvIHRoZXNlIHR5
cGVzIG9mIGVmZm9ydHMgYXJlDQo+IHJlYWxseSB2ZXJ5IGFwcHJlY2lhdGVkIGFuZCB3ZWxjb21l
ZC4gQnV0IGl0IGp1c3QgdGFrZXMgYSBiaXQgbW9yZQ0KPiB3b3JrIHRoYW4gdXN1YWwuDQoNClRo
YW5rIHlvdSwgSmFzb24sIHRoaXMgaXMgZ3JlYXQgdG8gaGVhciwgYW5kIGlmIHlvdSBoYWQgdGlt
ZSB0byB3b3JrIHdpdGgNCnVzLCB3ZSdkIHJlYWxseSBhcHByZWNpYXRlIGl0Lg0KDQpUaGFua3Ms
DQpIYW5ubyAmIE1hdHRoaWFzDQoNCg==

