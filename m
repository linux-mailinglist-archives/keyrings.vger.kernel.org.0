Return-Path: <keyrings+bounces-3981-lists+keyrings=lfdr.de@vger.kernel.org>
Delivered-To: lists+keyrings@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UBMKH0QnfmmLWAIAu9opvQ
	(envelope-from <keyrings+bounces-3981-lists+keyrings=lfdr.de@vger.kernel.org>)
	for <lists+keyrings@lfdr.de>; Sat, 31 Jan 2026 17:01:08 +0100
X-Original-To: lists+keyrings@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 85B1AC2DD2
	for <lists+keyrings@lfdr.de>; Sat, 31 Jan 2026 17:01:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 27C1D300682A
	for <lists+keyrings@lfdr.de>; Sat, 31 Jan 2026 16:00:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C0372765D4;
	Sat, 31 Jan 2026 16:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="gUSQHWWA"
X-Original-To: keyrings@vger.kernel.org
Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazolkn19010003.outbound.protection.outlook.com [52.103.20.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E046219E8;
	Sat, 31 Jan 2026 16:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.20.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769875218; cv=fail; b=a8UmOBXylFGoQQf1cSyjqr6mE+Clc/Hh+eNF0DnFl9Mt8Pyg8zLeYL8mF510Cyo866NlKc2LMrGRszgGEC49L5nMwaljYkxlZ4etr93o/1lkEFmPAF3EUO8mzUovC1wxdXT4TvDABEuM5TMdJgk29r/fMCCOOC1YoNJ2ouPukqI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769875218; c=relaxed/simple;
	bh=ybnyXL0VSRYys0nw3LtUMe7e/+A2/MaRXkDslH1X9Ng=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=YBWNmua4lV8WLCMB5Mk4jqTHIrhHasVKV5amLTWUpucWREHy02IgC/G6lcgIEYwqzDRdZ370V4sKHkq0V+BdcAbtzqcD1jFOh1NU9ogPREvWY9Hmly0mUFq9/BU2/HGN8YN125SrIxxchunsg1LtenL7/EEaHvOoh8C/R1xMbC0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=gUSQHWWA; arc=fail smtp.client-ip=52.103.20.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l/eLMKnZuq6gUqLXyQ3YW31T/0uXbyRbZrOehYGZFsYrqNY4Ksev92HWG6bm91EeMsPdPhTfR2lZbK1YXJcw9FA5ffBzdtlwfcwuh8GSeXieT5QdPwgJy8NocIFZiSNP6nxpeNwObIsQhk/r7Vvb5YpocpfWcVfFSWPxQUwv8umNjybHAO0iBG9loCKuRalfHZD38PAdXA9k59HOSEQ1eNUuHZo/ISk/FlBhm5Wbj567C0oBIeaqmH32SMyrpZmgh8H4m6rq66xUaIHjuwNA1zCiP7Y5WvmDKyZ4a4TBPf3VhhmjoXmnB3+jmOMpgFubW9mDkdrYJZ7reLagXkaF6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xPIjGbz/YfEvYQ4WSjm/YLx9Hn6jfLzJVgxwePzmeUw=;
 b=yBzrusrcoMooPvN3fYTKdkLok4xhaQ+IOaiCAuDNPPTxCaduc141PUJIDn5AsYUi6q2K1sMNLSxOgLXs3Bb3c7PvqWTZKosvkYCY5vEC9Da/7fyb8nwqrAq27/8f+2mpcWrsjDnBI5vjFJOr35n0dPU3e/0oQ3brAvkW9B7Kah5rKHH20Ct3IAkkd4Cs6UvgSxN3JnV7tJXam2Jp7eYbw3j8bNnLZR5GmEa/PJQuKsEzqIgf9TjxPuqBPzrQ38Qcppl9ADNoJN/3/cVYXRln3k6v3YeNLoPDM3fv5+vA4ymitu9cNbbqxLZNEcKv4zVVRVQNrylBuB37QYRkdVi0iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xPIjGbz/YfEvYQ4WSjm/YLx9Hn6jfLzJVgxwePzmeUw=;
 b=gUSQHWWAmQUiMDDXLiGaqQWXyatLMq/tWjIfYZEI1Y7j4MronZA6Qlz8EL884qtjXuJQbx6/0QSbDyHjjyUGz/Mna9vMFGyNAQAY7jCYJFZyTp3hdnTm/WCv1gt6I8IoiVltBiWlgfHYnpcb8/v8ZDhAaOopoHR5URc/1H+4RZAug+cNs08oT2xqmwRxF+XrHw0KE3bxRTC1NrjpVNX0ceOrNB1LsK6fQ/f3RJx/Z+LPYBjQfjNgWxItgBi40NUvDQAV4mopc9XCKvCOxDutXriqmdvxVjt8b7r93fMR1+uChgObUs8oEsFcWpGnGqb142FfVVS3kghmCr7FGvIQaQ==
Received: from SN6PR02MB4157.namprd02.prod.outlook.com (2603:10b6:805:33::23)
 by SA1PR02MB9831.namprd02.prod.outlook.com (2603:10b6:806:376::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.8; Sat, 31 Jan
 2026 16:00:14 +0000
Received: from SN6PR02MB4157.namprd02.prod.outlook.com
 ([fe80::900:1ccf:2b1e:52b6]) by SN6PR02MB4157.namprd02.prod.outlook.com
 ([fe80::900:1ccf:2b1e:52b6%6]) with mapi id 15.20.9564.014; Sat, 31 Jan 2026
 16:00:13 +0000
From: Michael Kelley <mhklinux@outlook.com>
To: David Howells <dhowells@redhat.com>, Lukas Wunner <lukas@wunner.de>, Ignat
 Korchagin <ignat@cloudflare.com>
CC: Jarkko Sakkinen <jarkko@kernel.org>, Herbert Xu
	<herbert@gondor.apana.org.au>, Eric Biggers <ebiggers@kernel.org>, Luis
 Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, Daniel
 Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, "Jason
 A . Donenfeld" <Jason@zx2c4.com>, Ard Biesheuvel <ardb@kernel.org>, Stephan
 Mueller <smueller@chronox.de>, "linux-crypto@vger.kernel.org"
	<linux-crypto@vger.kernel.org>, "keyrings@vger.kernel.org"
	<keyrings@vger.kernel.org>, "linux-modules@vger.kernel.org"
	<linux-modules@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v15 6/7] modsign: Enable ML-DSA module signing
Thread-Topic: [PATCH v15 6/7] modsign: Enable ML-DSA module signing
Thread-Index: AQHcjtC3xUDRE8Ho5kej8+vCQMw4IrVsc8pg
Date: Sat, 31 Jan 2026 16:00:13 +0000
Message-ID:
 <SN6PR02MB415708C0A6E2EB1B5C7BBFB0D49CA@SN6PR02MB4157.namprd02.prod.outlook.com>
References: <20260126142931.1940586-1-dhowells@redhat.com>
 <20260126142931.1940586-7-dhowells@redhat.com>
In-Reply-To: <20260126142931.1940586-7-dhowells@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN6PR02MB4157:EE_|SA1PR02MB9831:EE_
x-ms-office365-filtering-correlation-id: 92177fcc-b657-423c-c022-08de60e1d1dd
x-ms-exchange-slblob-mailprops:
 YfhX3sd/0TXC3SDMOKasxb1Truxn0Xe/oumTv5Y4oWH+ckW6aHTm+j58isAPEIQ6qr+mYGZNc1XRWgDlDL3NCVCc5chbdVk4C+pVzii8vswYQzOpSSV8EYiBteMvaU5ocB0FMHetYzBh9gTMHnH1Ddc88x6xOlASDA4OArj9JhqmnAjVwP0iORpWaK6CzNIdV8vvcPkhahXh3y6qOyRcIf/KJQy9yD3JMBzqnERKyKBM5hwBScVsCErGLBbIQBSiWtCiciP+LraAQGWMejgVXJqQHrWWYrS2MLRjpYzZn4dILWfwgJ0dCOy48cuChdkVOSHQGJN4KqhVrtCDMMXWnL16F/VTDVcDJv4ouTbkIX33q+ulNEz9kxG4WNW1cKiPcWDwG9ElqXc7WE7a26eFhFlNP5WsxhHXITSXXZxuNuQ8IkWNzEhPzVSKE31nrxbwwBN6bEm5qGERsmy3jcGqWcI58trbfUB4E0VRvRtANGcEBDMq5eabIXYqBKIYjCzbZefS9SZTunhduubYc6p9GqsREFezOSuKmGTXaGJp12kTOt/eIrijo8+WN+URR6exGpDMhDnk7DtlBeWjWr8dbkVKQnnTLZxTTl9jalZhglgpsm8g+liX96z5q8u5TkBBLzmpYn5jFMkJ+DT6KDLvmW5N1zAJCBoLkZFm2GdoVCpjhQiVH2Oj7qHR4bCiZ4ISznX9mT8PQUKGUzflVMifLQOW+jafPtfVqIh2TeBgcQjPMlzNI3uOOy+Gg/iZFrXCLU/tvt0d/rcMuc0MmuDozbE+M2VpypJQwMhxl/4QU0g=
x-microsoft-antispam:
 BCL:0;ARA:14566002|13091999003|39105399006|8062599012|8060799015|15080799012|31061999003|461199028|19110799012|41105399003|40105399003|3412199025|440099028|10035399007|102099032|19111999003;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?dmI88FgMvZN5UVOT08StMmpnBMf3d25VOH6Wh0INp4tHfXGHs3p+GBfi/FJW?=
 =?us-ascii?Q?f62xh6Ds/IaW//oaPUN3zd9DLxkEsHMcrGpf7ydoWGmvPvZ/EwG4++zkgXKO?=
 =?us-ascii?Q?MFrCs5IrsaWf8wF0B6wreYxEa7bh0qXW3numIb8dznUwHXZwezp6lZGRKw7V?=
 =?us-ascii?Q?2P/aWlfVVPMlT138CoUcvQrnVAmvUXlW+gln1yTbSF4lDBRvmhETuLmhC3HX?=
 =?us-ascii?Q?OEP2rKwMIuqSh9M68HMFZsTXvVtR4qohoioFqcvpnU2SR1f0WhJVPZPzKpHg?=
 =?us-ascii?Q?NAenpV9nIOEl1XItciQ8BxZlldwubZn0eJq8r8AFv08323d9JBd2gETz7W/2?=
 =?us-ascii?Q?ZT/4YYe1lR5ZOJhwHtjMBuhebgyKXlpsbBESnFwUnyStQhYOVUF2ViS30Hgd?=
 =?us-ascii?Q?7buRtHaSRP5bgy9Wy5zQEqRP12e5MgIk2eioqlDSy/MsoQUMaP0Wd7Qo8ics?=
 =?us-ascii?Q?21lY2AMu6IMMDe0+lQPJH/z5R+Cye6+rKsX6lKzBGlmKu9vqDAZI/1tiHXEg?=
 =?us-ascii?Q?yNahCanOR+FGXtjghqLzR6DFIJaV+9iyg8w6qG3Rn99LgB0yfiY3Cqy6OtbI?=
 =?us-ascii?Q?cfRYIbCUYNL34CP0AYN2nKA+SRnrPirUxW+KnpqMryVnYfK7T95QXncS4H5+?=
 =?us-ascii?Q?WFRAqUrYBqhnCG3/gpt/mXoiYJYmS5fSB5TsFOC6z6JhaAe+RJ5sIR+vNCyQ?=
 =?us-ascii?Q?WHCczS0qtDkLA6q6lOYCqX78oldOW+2JwdJDaAgCwmNaY+s0admKZACupy9K?=
 =?us-ascii?Q?ryTkd0RqEKEVzlNPHO1SeAQslkOxqcP1MPyCbXuvBkRJjr+RpIvomAyi4dg7?=
 =?us-ascii?Q?U3I49sxtB5/dCPhbXFDVYcAlJqqng7Vc05Q4f7EI8t06De3TNB1kfmWGqz2Z?=
 =?us-ascii?Q?pQNDP+J+v5PJGYRrJaTd/QbqfWgh8jcejfupeSNCzbEPx238eeS5fG0KJIVf?=
 =?us-ascii?Q?iJCmBGk2Ed7Tr+9g4Q2rifgEoDrIFXrkyr5hV7zEbt9OFADxg1MAzI7SBpKY?=
 =?us-ascii?Q?iKyz+7b3sSFwTnyGFU+OqL2NLuknt1AFp4xpcA5RvBUV1B+fxuWGE8JeOe9Q?=
 =?us-ascii?Q?nNpnJFHMO8ipXSpSzEj5mj3ltqsBs3DrEczlw0/zzhRQtwRGxWJwnaHH4T2+?=
 =?us-ascii?Q?mRk1H71CCvrc7JULyvFaECBDIZFPsylWQErAvVuO9Pos3eKSs+hIx4KRqoVz?=
 =?us-ascii?Q?LlKt7owRW6fN8IJycy/Yq0OuMOjx5ksIPBKfbu1dfdETlFbO62p4OPkbYvtS?=
 =?us-ascii?Q?JNA/QgF/t5yrGIhGyIZ98yQZ6f+K+c2yZA7JUktvLWixJ3iwsAv4DJFKQMYs?=
 =?us-ascii?Q?woY=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?6hG93AT6OtzEi058fiu1lhe86w7qtWEVblkTqC+/vK6I+nR8BgIeEFLo/L/C?=
 =?us-ascii?Q?GISUFQo5XBs5De7ui6JBQX7Da0LKcBsPGDcGjVsDJZt6Q6FjNYKImgpDwWm7?=
 =?us-ascii?Q?p6k0LfVRop/Hb2hY2JlerCrHkKFqRcwrvgKFfc+8SOPm/LL1UCnpnG6cebyt?=
 =?us-ascii?Q?7dNJCwO9du7emHes9Vjf9AIfDBbdmwqgcmfTWHcwxI3DSQ7oT3UPsQ77FMuD?=
 =?us-ascii?Q?osuhYYEJAE/gYM40IOW9B1qGU/podycMF/1ZwxmlVDzLFkrdYN154OS+gCco?=
 =?us-ascii?Q?QyOygjrrU6aEnC7UaoKkf++cUH+LPZeSwnzqMUQaGVRvKikJ8iR7NoBlv6tX?=
 =?us-ascii?Q?GjSY+8Z/9kDfw59UwSAdpAmbbddM0PovsRvtebZ/JMftkyc+Vg5Gl3T++mw/?=
 =?us-ascii?Q?aqsns/CkgDvLMZ+G5p9ZoEgnpI+xw1sFFHTiK6vc8HnnJLfKdUTU1CbkBJg0?=
 =?us-ascii?Q?RFV6b+CBJ/YUid3tWDAqbHp3FC07n7gRXrOGv+F2KrsoZ8lFbCstwOq3BfB6?=
 =?us-ascii?Q?OreJwIcFWI126YrBMQ0PxjPfn2KMNmfvmtiX0/dJ5NVAtH43CiRrGRqShGkZ?=
 =?us-ascii?Q?2AzzxPNg4578rPZHu5NE28JTcy7cQ3mwoApQzszvy+ukscadbVssJ1U2/4Tt?=
 =?us-ascii?Q?ZbsdxNZIwt0GOjJQwoi6mn27iOrvdKr85qSA7NFUI3PmwcfV6aDwZgeMVGCV?=
 =?us-ascii?Q?3s+UrDI0zgQI5a5Lla0Xds6SV+tF9WLYgzb2xDgKZiLgvOtFeHID7iHQ9Fg/?=
 =?us-ascii?Q?l8iklTNxplWWoPKJEDzsEIHGYriMRB/lYmefit+53kkna4Ph99aNGDPHCf/h?=
 =?us-ascii?Q?PG3S8fHHKamzelVs7BaoPvXB2oTGHd8e9fIanhtsgKWmaiOnZdJlYAP+p0cm?=
 =?us-ascii?Q?p+jJmjS/KltiTgh3ts1WaFRTmy7rTNEbLsjp6/+Ice45etNaiT2BrG2T+v9W?=
 =?us-ascii?Q?f+VbPb/m5EzVnI6Uu6lXkI6F2fJv4gwuLiBXfJmBuXr0WCMA8OLgDIQm7mIH?=
 =?us-ascii?Q?PYKkKYTAZV/RywxPSMnPgHoXhAaulSFBXAXXdHyapPZtFhMWMhfmGBgRupwp?=
 =?us-ascii?Q?uMhMUiPV+lManZ4OFF5fZpeIfQH9RAXY6Z3WajtUulWmW/rSsmsfCUb6CJxk?=
 =?us-ascii?Q?aXHJbO/rQmqlGtqlYMfpBzy2p3e1V8txwRvtG12Txq+Fpt97NB6i5R+ex9Jn?=
 =?us-ascii?Q?0B8J7qRvpWb7mU3vXuMk/RfomhLMu19XaCoytGadCoWwEWsNK4A1Q1QGHUha?=
 =?us-ascii?Q?jsLIfAAqOyjVDljL1D6Tms9T/PIaMR+7Yi1etvj4XEJF4AcGPaHAaK8GNrRf?=
 =?us-ascii?Q?X9mfgZ73kkoxPOkqS8OazED7P51N1pjZRO26ScIZJTk3IsaaqeoTgOP6O0Zy?=
 =?us-ascii?Q?zAUvrZc=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR02MB4157.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 92177fcc-b657-423c-c022-08de60e1d1dd
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jan 2026 16:00:13.7413
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR02MB9831
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[outlook.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[outlook.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-3981-lists,keyrings=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_FROM(0.00)[outlook.com];
	RCPT_COUNT_TWELVE(0.00)[17];
	DKIM_TRACE(0.00)[outlook.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mhklinux@outlook.com,keyrings@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[keyrings];
	DBL_BLOCKED_OPENRESOLVER(0.00)[outlook.com:dkim,cloudflare.com:email,SN6PR02MB4157.namprd02.prod.outlook.com:mid]
X-Rspamd-Queue-Id: 85B1AC2DD2
X-Rspamd-Action: no action

From: David Howells <dhowells@redhat.com> Sent: Monday, January 26, 2026 6:=
29 AM
>=20
> Allow ML-DSA module signing to be enabled.
>=20
> Note that OpenSSL's CMS_*() function suite does not, as of OpenSSL-3.6,
> support the use of CMS_NOATTR with ML-DSA, so the prohibition against usi=
ng
> signedAttrs with module signing has to be removed.  The selected digest
> then applies only to the algorithm used to calculate the digest stored in
> the messageDigest attribute.  The OpenSSL development branch has patches
> applied that fix this[1], but it appears that that will only be available
> in OpenSSL-4.
>=20
> [1] https://github.com/openssl/openssl/pull/28923
>=20
> sign-file won't set CMS_NOATTR if openssl is earlier than v4, resulting i=
n
> the use of signed attributes.
>=20
> The ML-DSA algorithm takes the raw data to be signed without regard to wh=
at
> digest algorithm is specified in the CMS message.  The CMS specified dige=
st
> algorithm is ignored unless signedAttrs are used; in such a case, only
> SHA512 is permitted.
>=20
> Signed-off-by: David Howells <dhowells@redhat.com>
> Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>
> cc: Eric Biggers <ebiggers@kernel.org>
> cc: Lukas Wunner <lukas@wunner.de>
> cc: Ignat Korchagin <ignat@cloudflare.com>
> cc: Stephan Mueller <smueller@chronox.de>
> cc: Herbert Xu <herbert@gondor.apana.org.au>
> cc: keyrings@vger.kernel.org
> cc: linux-crypto@vger.kernel.org

I'm building linux-next20260130, which has this patch, and get the followin=
g errors:

  HOSTCC  scripts/sign-file
scripts/sign-file.c: In function 'main':
scripts/sign-file.c:282:25: error: 'CMS_NO_SIGNING_TIME' undeclared (first =
use in this function)
  282 |                         CMS_NO_SIGNING_TIME |
      |                         ^~~~~~~~~~~~~~~~~~~
scripts/sign-file.c:282:25: note: each undeclared identifier is reported on=
ly once for each function it appears in
scripts/sign-file.c:285:22: warning: implicit declaration of function 'EVP_=
PKEY_is_a'; did you mean 'EVP_PKEY_sign'? [-Wimplicit-function-declaration]
  285 |                 if ((EVP_PKEY_is_a(private_key, "ML-DSA-44") ||
      |                      ^~~~~~~~~~~~~
      |                      EVP_PKEY_sign
scripts/sign-file.c:288:21: error: 'OPENSSL_VERSION_MAJOR' undeclared (firs=
t use in this function); did you mean 'OPENSSL_VERSION_NUMBER'?
  288 |                     OPENSSL_VERSION_MAJOR < 4) {
      |                     ^~~~~~~~~~~~~~~~~~~~~
      |                     OPENSSL_VERSION_NUMBER

The problem is that I'm running on Ubuntu 20.04, with this openssl:

# openssl version
OpenSSL 1.1.1f  31 Mar 2020=20

The symbols CMS_NO_SIGNING_TIME, EVP_PKEY_is_a() and OPENSSL_VERSION_MAJOR
don't exist in the include/openssl/* files for that old version.

Yes, I'm running on an old distro version which has been out-of-support for=
 9 months
now. But I suspect this patch is not intending to raise the kernel build re=
quirements
to be openssl 3.0 or later -- at least there's no mention of that larger im=
pact in the
commit message.

Thoughts? Can this patch be enhanced to handle openssl 1.1.1 appropriately?

Michael

> ---
>  Documentation/admin-guide/module-signing.rst | 16 +++++----
>  certs/Kconfig                                | 30 +++++++++++++++++
>  certs/Makefile                               |  3 ++
>  scripts/sign-file.c                          | 34 +++++++++++++++-----
>  4 files changed, 68 insertions(+), 15 deletions(-)
>=20
> diff --git a/Documentation/admin-guide/module-signing.rst b/Documentation=
/admin-
> guide/module-signing.rst
> index a8667a777490..7f2f127dc76f 100644
> --- a/Documentation/admin-guide/module-signing.rst
> +++ b/Documentation/admin-guide/module-signing.rst
> @@ -28,10 +28,12 @@ trusted userspace bits.
>=20
>  This facility uses X.509 ITU-T standard certificates to encode the publi=
c keys
>  involved.  The signatures are not themselves encoded in any industrial s=
tandard
> -type.  The built-in facility currently only supports the RSA & NIST P-38=
4 ECDSA
> -public key signing standard (though it is pluggable and permits others t=
o be
> -used).  The possible hash algorithms that can be used are SHA-2 and SHA-=
3 of
> -sizes 256, 384, and 512 (the algorithm is selected by data in the signat=
ure).
> +type.  The built-in facility currently only supports the RSA, NIST P-384=
 ECDSA
> +and NIST FIPS-204 ML-DSA public key signing standards (though it is plug=
gable
> +and permits others to be used).  For RSA and ECDSA, the possible hash
> +algorithms that can be used are SHA-2 and SHA-3 of sizes 256, 384, and 5=
12 (the
> +algorithm is selected by data in the signature); ML-DSA does its own has=
hing,
> +but is allowed to be used with a SHA512 hash for signed attributes.
>=20
>=20
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> @@ -146,9 +148,9 @@ into vmlinux) using parameters in the::
>=20
>  file (which is also generated if it does not already exist).
>=20
> -One can select between RSA (``MODULE_SIG_KEY_TYPE_RSA``) and ECDSA
> -(``MODULE_SIG_KEY_TYPE_ECDSA``) to generate either RSA 4k or NIST
> -P-384 keypair.
> +One can select between RSA (``MODULE_SIG_KEY_TYPE_RSA``), ECDSA
> +(``MODULE_SIG_KEY_TYPE_ECDSA``) and ML-DSA
> (``MODULE_SIG_KEY_TYPE_MLDSA_*``) to
> +generate an RSA 4k, a NIST P-384 keypair or an ML-DSA 44, 65 or 87 keypa=
ir.
>=20
>  It is strongly recommended that you provide your own x509.genkey file.
>=20
> diff --git a/certs/Kconfig b/certs/Kconfig
> index 78307dc25559..2b088ef58373 100644
> --- a/certs/Kconfig
> +++ b/certs/Kconfig
> @@ -39,6 +39,36 @@ config MODULE_SIG_KEY_TYPE_ECDSA
>  	 Note: Remove all ECDSA signing keys, e.g. certs/signing_key.pem,
>  	 when falling back to building Linux 5.14 and older kernels.
>=20
> +config MODULE_SIG_KEY_TYPE_MLDSA_44
> +	bool "ML-DSA-44"
> +	select CRYPTO_MLDSA
> +	help
> +	  Use an ML-DSA-44 key (NIST FIPS 204) for module signing.  ML-DSA
> +	  support requires OpenSSL-3.5 minimum; preferably OpenSSL-4+.  With
> +	  the latter, the entire module body will be signed; with the former,
> +	  signedAttrs will be used as it lacks support for CMS_NOATTR with
> +	  ML-DSA.
> +
> +config MODULE_SIG_KEY_TYPE_MLDSA_65
> +	bool "ML-DSA-65"
> +	select CRYPTO_MLDSA
> +	help
> +	  Use an ML-DSA-65 key (NIST FIPS 204) for module signing.  ML-DSA
> +	  support requires OpenSSL-3.5 minimum; preferably OpenSSL-4+.  With
> +	  the latter, the entire module body will be signed; with the former,
> +	  signedAttrs will be used as it lacks support for CMS_NOATTR with
> +	  ML-DSA.
> +
> +config MODULE_SIG_KEY_TYPE_MLDSA_87
> +	bool "ML-DSA-87"
> +	select CRYPTO_MLDSA
> +	help
> +	  Use an ML-DSA-87 key (NIST FIPS 204) for module signing.  ML-DSA
> +	  support requires OpenSSL-3.5 minimum; preferably OpenSSL-4+.  With
> +	  the latter, the entire module body will be signed; with the former,
> +	  signedAttrs will be used as it lacks support for CMS_NOATTR with
> +	  ML-DSA.
> +
>  endchoice
>=20
>  config SYSTEM_TRUSTED_KEYRING
> diff --git a/certs/Makefile b/certs/Makefile
> index f6fa4d8d75e0..3ee1960f9f4a 100644
> --- a/certs/Makefile
> +++ b/certs/Makefile
> @@ -43,6 +43,9 @@ targets +=3D x509_certificate_list
>  ifeq ($(CONFIG_MODULE_SIG_KEY),certs/signing_key.pem)
>=20
>  keytype-$(CONFIG_MODULE_SIG_KEY_TYPE_ECDSA) :=3D -newkey ec -pkeyopt
> ec_paramgen_curve:secp384r1
> +keytype-$(CONFIG_MODULE_SIG_KEY_TYPE_MLDSA_44) :=3D -newkey ml-dsa-44
> +keytype-$(CONFIG_MODULE_SIG_KEY_TYPE_MLDSA_65) :=3D -newkey ml-dsa-65
> +keytype-$(CONFIG_MODULE_SIG_KEY_TYPE_MLDSA_87) :=3D -newkey ml-dsa-87
>=20
>  quiet_cmd_gen_key =3D GENKEY  $@
>        cmd_gen_key =3D openssl req -new -nodes -utf8 -$(CONFIG_MODULE_SIG=
_HASH) -
> days 36500 \
> diff --git a/scripts/sign-file.c b/scripts/sign-file.c
> index 7070245edfc1..547b97097230 100644
> --- a/scripts/sign-file.c
> +++ b/scripts/sign-file.c
> @@ -315,18 +315,36 @@ int main(int argc, char **argv)
>  		ERR(!digest_algo, "EVP_get_digestbyname");
>=20
>  #ifndef USE_PKCS7
> +
> +		unsigned int flags =3D
> +			CMS_NOCERTS |
> +			CMS_PARTIAL |
> +			CMS_BINARY |
> +			CMS_DETACHED |
> +			CMS_STREAM  |
> +			CMS_NOSMIMECAP |
> +			CMS_NO_SIGNING_TIME |
> +			use_keyid;
> +
> +		if ((EVP_PKEY_is_a(private_key, "ML-DSA-44") ||
> +		     EVP_PKEY_is_a(private_key, "ML-DSA-65") ||
> +		     EVP_PKEY_is_a(private_key, "ML-DSA-87")) &&
> +		    OPENSSL_VERSION_MAJOR < 4) {
> +			 /* ML-DSA + CMS_NOATTR is not supported in openssl-3.5
> +			  * and before.
> +			  */
> +			use_signed_attrs =3D 0;
> +		}
> +
> +		flags |=3D use_signed_attrs;
> +
>  		/* Load the signature message from the digest buffer. */
> -		cms =3D CMS_sign(NULL, NULL, NULL, NULL,
> -			       CMS_NOCERTS | CMS_PARTIAL | CMS_BINARY |
> -			       CMS_DETACHED | CMS_STREAM);
> +		cms =3D CMS_sign(NULL, NULL, NULL, NULL, flags);
>  		ERR(!cms, "CMS_sign");
>=20
> -		ERR(!CMS_add1_signer(cms, x509, private_key, digest_algo,
> -				     CMS_NOCERTS | CMS_BINARY |
> -				     CMS_NOSMIMECAP | use_keyid |
> -				     use_signed_attrs),
> +		ERR(!CMS_add1_signer(cms, x509, private_key, digest_algo, flags),
>  		    "CMS_add1_signer");
> -		ERR(CMS_final(cms, bm, NULL, CMS_NOCERTS | CMS_BINARY) !=3D 1,
> +		ERR(CMS_final(cms, bm, NULL, flags) !=3D 1,
>  		    "CMS_final");
>=20
>  #else
>=20


