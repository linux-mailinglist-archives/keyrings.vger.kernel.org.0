Return-Path: <keyrings+bounces-2129-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 80C3097F09F
	for <lists+keyrings@lfdr.de>; Mon, 23 Sep 2024 20:27:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C7606B20582
	for <lists+keyrings@lfdr.de>; Mon, 23 Sep 2024 18:27:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6037F18054;
	Mon, 23 Sep 2024 18:27:52 +0000 (UTC)
X-Original-To: keyrings@vger.kernel.org
Received: from dispatch1-us1.ppe-hosted.com (dispatch1-us1.ppe-hosted.com [148.163.129.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CC2F199BC
	for <keyrings@vger.kernel.org>; Mon, 23 Sep 2024 18:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.129.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727116072; cv=fail; b=UuhUvptAlbkF/o9OevVd9bNqiuKuw7l41QN+Xv+tvhEjQPKTwilPe1NGw3IgCtaF5vmIGkBH+CDUYYeA9+Q8WpTPy0exZvbOig4bM2nQPFCJtkTdllwYm0j+mtqAJbk3YsofcsMku90QQqeKQKB0Kr8rss5wyS4N4yhB5bz6IPo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727116072; c=relaxed/simple;
	bh=ZnOZavseYbFddeHH0MjxXOmkrmD2ULsHLSdXZIQYi74=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=MONVyFl+7wSZRK16iRNwXUJi4Wy4ZOZDUeDmF9fDjitTR9c0ZMRu7hJ4bGHMX08gm4Wic0iufSefkjpeJkaWI+vlsTtcBJ/CH4Ym7LZOW1K/T3Ab/8glH2XBxeqRPx1lZH9GpHkR+OK+CRylRGM7fmQLgQsuG25VyhPDTxGqf3o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=studentconnectivity.tech; spf=pass smtp.mailfrom=studentconnectivity.tech; arc=fail smtp.client-ip=148.163.129.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=studentconnectivity.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=studentconnectivity.tech
Received: from dispatch1-us1.ppe-hosted.com (ip6-localhost [127.0.0.1])
	by dispatch1-us1.ppe-hosted.com (PPE Hosted ESMTP Server) with ESMTP id 74971402A67
	for <keyrings@vger.kernel.org>; Mon, 23 Sep 2024 18:27:47 +0000 (UTC)
X-Virus-Scanned: Proofpoint Essentials engine
Received: from IND01-BMX-obe.outbound.protection.outlook.com (mail-bmxind01lp2240.outbound.protection.outlook.com [104.47.74.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1-us1.ppe-hosted.com (PPE Hosted ESMTP Server) with ESMTPS id 0B95DC40077
	for <keyrings@vger.kernel.org>; Mon, 23 Sep 2024 18:27:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jZC99aZ0Rx2CHtshAau+DpjIgqeLoooNz8TFXcOxXhFG1McLwPSD7r/UdcSY1loof8LZ3uvrYJwJhJx+JmVY/+ktsN3aQ2X4q/6fmFLgHjGYyDSc8hXqjpOh7AeJyLTSnTPsC72gqwsI7lUT4lvuW4cn0XcvKQ3O4Pr+MMHAvyQQ3wR/gS6/pTig4WqOtZlD1bbqoeFr0GCmLMVd332vQDUTE0DLr4nJFJKZXFRaofDLRa3/sfxuuCaejQWH+J5nvHwTPhnerOt6yVG/wKy0A1/S0G14XtKD+3dTvjAVJVXnWcXX9kweOA15i9bAAcdxqHNzjqPqBdop3YFY+/4h4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cO0TAV1FHsGZ1C/RigTu8HIN3cC5rYt4KVs0hJHf/XM=;
 b=j675JV109yYRYPW2EUhjt7YaRE08tzZqbYWijy53vkkrQu4dg6WJJlUs2DiSMzs/DqpCcad6H0CIu85QYkaE0KHNOrFVAMNcyuX81ed8Q9R569/4WOPbkvP0POmRh6xuK6vizh6fK27YYM+0XCXNc6ZYLYCTvRiN7R4xDcnqglF7skgrvnpmjfTFIJGelE4v+QuS3kvJMxPUTGiDisHqgID6p3KO2pxX+JUobwESB8cnyXG+bSih7bOOgLxGjT/P7kbfQUMwqpVxRvaDj1yjRHU/riEoj6PEfucJN2VpEoJwRRvuStPwkFxoqi/93eC9gKZisaiplDcF9VkbsCiuCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=studentconnectivity.tech; dmarc=pass action=none
 header.from=studentconnectivity.tech; dkim=pass
 header.d=studentconnectivity.tech; arc=none
Received: from PN0P287MB2953.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:225::22)
 by MA0P287MB0802.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:e2::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.25; Mon, 23 Sep
 2024 18:27:36 +0000
Received: from PN0P287MB2953.INDP287.PROD.OUTLOOK.COM
 ([fe80::a4eb:3288:9551:5b39]) by PN0P287MB2953.INDP287.PROD.OUTLOOK.COM
 ([fe80::a4eb:3288:9551:5b39%3]) with mapi id 15.20.7982.022; Mon, 23 Sep 2024
 18:27:36 +0000
From: Avery Harris <avery.harris@studentconnectivity.tech>
To: "keyrings@vger.kernel.org" <keyrings@vger.kernel.org>
Subject: Re_School Contacts List 2024
Thread-Topic: Re_School Contacts List 2024
Thread-Index: AdsNrwbrNubpaxDF3UWFw95wgMZBcg==
Disposition-Notification-To: Avery Harris
	<avery.harris@studentconnectivity.tech>
Date: Mon, 23 Sep 2024 18:27:36 +0000
Message-ID:
 <PN0P287MB2953A7770FD829A3F68781C2E66F2@PN0P287MB2953.INDP287.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=studentconnectivity.tech;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN0P287MB2953:EE_|MA0P287MB0802:EE_
x-ms-office365-filtering-correlation-id: 596780e2-3807-4b0a-51be-08dcdbfd6650
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|10070799003|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?rHSuNJ8XmdsrujE20aqq+HVNETHyzfM1wRHPvfAvYikyvk0mqD37dUTup5e4?=
 =?us-ascii?Q?zkQfhM4mrGTMqpdvjig0tq16x0TG0RXmhWNrYjKVsEOkuxq+8OKK17reGxUX?=
 =?us-ascii?Q?ouiqxmww6elDPcCmRUG1tZMH7UlE6K2O2GUvWmY40+iR0h1rW3VCDc4LuweR?=
 =?us-ascii?Q?8zzuHFgYkw95bdec94jsPynPrX74a6mtnbzof3T8TS0GIHHY9OjS0xNQ8DcY?=
 =?us-ascii?Q?TCYdoa1esZOwVbUC5PmD/UhDOynQ6BkdD44sRdeBM4tbAtS2nBqtqRzg3bdl?=
 =?us-ascii?Q?574/hL80lCX9uhVu9bhudhFpY3jF2lgZCM3I3Q1WEsrvJDfV9tCyNVNbtWOs?=
 =?us-ascii?Q?FlGLpG+1FPpNbjPPzYA/v9E4NxRENjj6zlE6WlzuDDozGKURan8VT7rw69M0?=
 =?us-ascii?Q?xDqSt/4iTvsVlwQJgotahn6M6cPk0FPGHO5qAN/JvvzfbqB3PkGJW7Bpdq43?=
 =?us-ascii?Q?bymbTlPXSP7/Vd/XC9C3seULaql6vwVdsnZriPFJ+WRHTA4+T2vb5F2WkdMG?=
 =?us-ascii?Q?74wC1WWxj4rfQpaQU761tjF+xyjd5QeXUBOkCjwpH40cjGdrQsH3uqYSCNjj?=
 =?us-ascii?Q?wm7n76QjUZ67lw2xxwfkJMLYrl7aQigxNW19XyJo11JiVkfBwpuWZfL79/j1?=
 =?us-ascii?Q?WRxr9YyszAunIysYr29LGHA9GzTbZQ1s8Mr/5MUzL8ZocJA6WMMt1F9Ac0/f?=
 =?us-ascii?Q?OCEz2EjAkUDvI6YtklKhvTg3vfPXdO2UihY+/UZrrbL9IOBRVMzSNxG0bz5h?=
 =?us-ascii?Q?Al5v+LIZBMMmZU4B5pIslGMg/pvpSMlzvRMfj0hBTfymjUYm9s5P8DxM9iKI?=
 =?us-ascii?Q?NmKC09RqvaZiUqtBbwyLzvEwOurU0+DyQr7UaME34/kNU7DddAvTU/lUmYVF?=
 =?us-ascii?Q?/aBvaRPJIg1kMGy1iw6QHUEYvOe0PiGY9oms/yQds6+HRW1Kgwv/O3jevRL3?=
 =?us-ascii?Q?HKG1/yE7/x/92PAIE2TaW0H2EJvwMAx6y/qYLs19WLVaANpJH2yGi51/V04r?=
 =?us-ascii?Q?Zo/oGqZIJ215RzA/fMrg6EerVkKPsHhNVfk4qPEyvsoji4RXl9hcbbPDoFd8?=
 =?us-ascii?Q?PEJXcWofUwiy1v8/AW92ZC+Ad9gM4+r8CbVl/EVM8I2RIqbScsLRCLWhhdte?=
 =?us-ascii?Q?X3hJbQx2h7QZohTe1RvQzFd6ke2T/saTPJw28odW1+FWc5+6FiOVf1tSFXRv?=
 =?us-ascii?Q?dN6aHF5zhGtVeQDG8mabhGPaJ9nSaXd3MQ1VWDXp8nYETlt57yp+BuTngZBp?=
 =?us-ascii?Q?I61sSH0HiRoDYVqbqaHrutzZMZW2sJ+ahEi41ehsO6dJQKw/urs8oF569MJW?=
 =?us-ascii?Q?5KkTFDMBe/Y0v/lbHUvDPWKvt4zpb42s1unADWuxeon5vg=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN0P287MB2953.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(10070799003)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?LaK6JYWDhdpdg9S5YVzfkPqqCAyMyTi0X0JhNcbtv2dJ8oM+J8+4nqusCUa5?=
 =?us-ascii?Q?wl9aUdgEGaBr3BshRImRiI5fj545V6gK8MpbYJ//fcM4QFpD7/fv+YIOwQtO?=
 =?us-ascii?Q?MWwL1lkEsQXb+t5ICz+z9xmAcHkhKCX7CZHZVHGA1NZ0JLNiw7fvZz1lzsZI?=
 =?us-ascii?Q?ZYfjVdjj71LEjE4X1uWKbb7ZqJGKUoO+gD/aL83R2HYbXEPZNeDopQuyG1Gl?=
 =?us-ascii?Q?h5FMygoACp/Y5y4+5OdmJGTe4aolBvgDgSzU04O6S2T553RO2Ap1jDTUNrkS?=
 =?us-ascii?Q?At0efCxhtauaOEXVgFmxdnkAS/A2WYC7fPP8UHtR66qr0W6XqZdpzmDCxrIF?=
 =?us-ascii?Q?A0eh+U3xkb4U/yFG/tul/AoSLQPS6hhSrAamAdkPLnFTjb/xWfIeOPAQbsWd?=
 =?us-ascii?Q?MtUoeOao43hQQzrtKw/Qj8F0c3PiDpatk76cKkHi+S5s4ejxG1n2Qwl7d92v?=
 =?us-ascii?Q?nJlNMs2hIBmZxsZFV1OelZ8SLVtujp52xlO32bO2FqTcd8mTZ1OcbaFIU/Pq?=
 =?us-ascii?Q?kZKpy+A+lwc22EI7l7yGfGpo3mgPIcetXIg+UPlMQC7KoKIcDRBu4Q1qU2FX?=
 =?us-ascii?Q?25vnluR/aCm1pmkidSuy2Wm1JUge6KrfQdtZEXiyvmrhH2Apov4pWVl+5OhV?=
 =?us-ascii?Q?0am/4Q95JeKDFPjmsfOFYQqLFnevf4i9tlrwg/W17GAaa36g/z8ypQbmTKd7?=
 =?us-ascii?Q?DLWrrX6gUwLcFI6EewYj0PTZ4fr7LnHZtjnq6SeeShj1t2d9sl0XsBN2clK1?=
 =?us-ascii?Q?YFOCrYsNF45ij5lAECGP4B4qg4bRXQUTJ3NiDJbaUoMEqbsMVSsJRymGaoK+?=
 =?us-ascii?Q?ztkPJ9gBohkjlcPhkhQJT2AseXcHmuXrxxVsuot8+9x8+4I+lispJfNynPxb?=
 =?us-ascii?Q?mwuH66B23u2QahgJKESeHU2qzQBoklq11I0TanzJU+YitmXJp/Tr3V+ELBen?=
 =?us-ascii?Q?39K2TP8lForVnx+4biHYUeYmAODU8cce3/nL7O7MX+2cjPhbfofY5+ni6K6W?=
 =?us-ascii?Q?rDRtW9NEYdoNMeOTQn9romK2OnvbCuoUjjKsICcz6/O7U/rp0kEVQUEgP73D?=
 =?us-ascii?Q?YBtaLsmCGqf9jwZbnwjgd780o8fmO46fwGc2y3Rfq2Fhfkt6VOHkcvIjgdFQ?=
 =?us-ascii?Q?UXukyxPzteLtfIZD4Qn820z5vXMCjcsMHYAQO98Y+Wwg2hQOTQAQ9Fop1WSS?=
 =?us-ascii?Q?cAsv835sKth4oDaFIzZQneHIIrmPMb9drovCux2z0RV4lDwzxf/UqeNmaq2w?=
 =?us-ascii?Q?COQM7tGvXl9bvvkz2USf6Vo96jokqqPKn/g7HM0AGYmssx4rHfMvjd5dhnKy?=
 =?us-ascii?Q?8GN+LH9JEE84rbLgAT3X8XjSLm2PNzTvy/ul8G0AOGCKBmA5aYfmrOqjj18H?=
 =?us-ascii?Q?dpZCqDPo9P1TpHFTXe3snjyJcY0hVtISseD+4jvsKF6c8vPKBJUb1CLjF1Df?=
 =?us-ascii?Q?WdLs1hEt8gyFylP4hWymgd8u6FdmR4Wra7py8XtQSTO8joby4O2MraIr7gHh?=
 =?us-ascii?Q?WvksvXPiHqZfnsVTRh3zCRZCUvJ7gZr/a7Ux3WjX6vN/ZoAEMr/twuc9yP+S?=
 =?us-ascii?Q?MCH4MG7zP/Bvrgtxwr4NOchLDWqnXNf2C8innv96mU0RNuZEaZVZeP9KblMF?=
 =?us-ascii?Q?LPgJ1L3M6ZBkuWBCn84z2VnpV1oaZtRAbPAVP9OnVq0lK5+wwF/KGHrMnle0?=
 =?us-ascii?Q?mVIuV3jNV+cofvG5bJDzlJF3Iak=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	GNLeKoXQ2rIowVK1xaWAt+2AXmPqEATN3pHFDq2TdaXUSdvlGZGHiEZsZ5QDfSb/AJXrt/c/YO8VqSi4LLDokp6wQgBo/20F86yoRVgWGYaDv/25l9bCjEwhygDrQcNeMvy1LCch8zmaptU2cf+XQLz6L7WJKWVC1cvcbANXlNTOWyB5q+OKDAoYG7TbLWZftq/PgW/dADvQL/HVlZA98S8hBIBobJqP7r86MZHR+SOQ5tyHHDPsS4GG8izhsXnVoeq44wVOBb6sbN7yKjf2ARuYDtluGqbJyCcO0dgm68OAyszaUFKQzhZrEnAyNwXCJ/GLBE6ZmYq/eIx2vz7gZbUOQrW8ciwriqcJ4gWlCnM8z8dpYQZRwLRXqvfH7ACy8RgPwyHJA8faU8W6ijD+6hoH2lWREmQlr5eyJhAx97nE5L6hA5r1UyQ/miq5GU1rUN8+rbBQBwXYwlQZ+C+C7cyYisdqyR8/fGHcws0rp1hCDWcvTfW99VnOF+cxp4q7BnfKlBBef7f6gcKriCwZBSQcZSi06UyMi+mg83RiFHH6/D0fS6IEX1iFj897EOzOmXpyyuysu59Qyw5jr0vIhVQMXtldUE3HZjLVKCsJGcs=
X-OriginatorOrg: studentconnectivity.tech
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PN0P287MB2953.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 596780e2-3807-4b0a-51be-08dcdbfd6650
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Sep 2024 18:27:36.8965
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 6f06dc3f-1d44-40c3-b040-812624058af8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xzLtT6HHcCbBWjViKTAsB/YAaPeNGHealxaOTcMcqHOx58KpJD04vBmYADDZN2/TT1V3y1FE89dVx/yVt7pnEjuMMxQRI4U8Jse3pX6xXRXMopIAQO9j/hp63D9b/UUU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0P287MB0802
X-MDID: 1727116060-Fiu48t8koYSi
X-MDID-O:
 us4;ut7;1727116060;Fiu48t8koYSi;<avery.harris@studentconnectivity.tech>;c0ae353f6c4151889dc407de97074788

Hi there,
=20
Want to expand your outreach to K-12 schools, colleges, universities? Our e=
mail list of principals, superintendents, and key decision-makers is ideal =
for you!=20
=20
Our List Includes:
=20
*	Principals
*	Superintendents
*	Board Members
*	Department Heads
=20
List Contains:- First Name, Last Name, Title, Email, Company Name, Phone Nu=
mbers, etc. in an Excel sheet..
=20
If you're interested, we would be happy to provide you with relevant counts=
, cost and a test file based on your specific requirements.
=20
Looking forward to hearing from you.
=20
Best regards,
Avery Harris
=20
To remove yourself from this mailing list, please reply with the subject li=
ne "LEAVE US."
=20
=20

