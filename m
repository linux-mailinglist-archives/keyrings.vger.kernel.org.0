Return-Path: <keyrings+bounces-4002-lists+keyrings=lfdr.de@vger.kernel.org>
Delivered-To: lists+keyrings@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aKwzOq3IgGl3AgMAu9opvQ
	(envelope-from <keyrings+bounces-4002-lists+keyrings=lfdr.de@vger.kernel.org>)
	for <lists+keyrings@lfdr.de>; Mon, 02 Feb 2026 16:54:21 +0100
X-Original-To: lists+keyrings@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 60047CE778
	for <lists+keyrings@lfdr.de>; Mon, 02 Feb 2026 16:54:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 49C3A304FC1C
	for <lists+keyrings@lfdr.de>; Mon,  2 Feb 2026 15:45:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C10E23504B;
	Mon,  2 Feb 2026 15:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="I20ViwaL"
X-Original-To: keyrings@vger.kernel.org
Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azolkn19010017.outbound.protection.outlook.com [52.103.12.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3153E21D3F8;
	Mon,  2 Feb 2026 15:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.12.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770047133; cv=fail; b=rmB9aJ9MlyhIp9+rNrD1XDV1Sv5Mh6Jpt/K1+jyNe53h+XXO2juSmVCOUgtsN5M0ob/7n2JcA3ew7es74cfc/uGhLGXqFzh77kdx46J2D7L2XwSd8lTR5pvDJzjqxy6+Z+aux3ezannj26bsm0QXpih06fAOQsN1k2GDeYm8uDA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770047133; c=relaxed/simple;
	bh=0JYV3GvpzWasjsUVSuMJTczibjNSzbp5NtZRTu3lUb0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=bygis5CkDz6ZUM3je1XFbOMYqEXsqTvL+Bmoi6LOyB0Exzl7iZBfGyYpMAxGjAMN+62R6kmiqgr+NRfzWgXVNQbfnUO6KmCbmRbYBQ/xm9Q/Hfn1S+lCDXdWe3kKHUWMRkpNlyn1aKCn/AVd6vwgM5muBTw55q7AeKHoVT+0Q2E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=I20ViwaL; arc=fail smtp.client-ip=52.103.12.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oGG0zFKzQNjqycdB0NTtfedn3yTmpQhL3p7N0LhioRbYCHMOEbLZoNMhnRTcSx51uVhiaxHZD9LRsS862oioUGZ1SBizIAUerkM8Eqd7RcQLWgGRWNMFvOnY2DrDvMMbZU9beQ7J2Iu92wfWTFj2xHX28+42g+hAcRyaEtA4B/eWO3LfdtQsXNU1YQ6x7R8j5OVe/qcPeNt1rfgWwOnpFqaxMT+SdHujjbTaGPpTWme5HVt6araqxOr57cmeDYQIs0/xQ51fV3fOk6E2A/ZyENfL2YdVQnvOrIoLACzEPPnpZFvNlMSeUAOUKrHOlmxzmrUIylUSgrWNMfBTCvms/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KQr1ghCfc2rSxDYm3n+C5DAjdt9Y1bqCGxhRC/JkPk0=;
 b=nnKesHCd9ihmGpsBHx6a+gJWC+HwHKaBOylexrT/T1z+R5dx47LoDDOS8HGS+SxUtK8U6fpx602qAhixowOqzV61dRhB1tnHAF0cRJveBOrj/9+rcO7EeCSHeAAShD/etKS98ZfcbY4+/LwMppspAZHAViuAt30BeXJMr6vowV0YDfJx1XyYrtDS8vHyV7+nTX49wknFjavNDheCDnRWAuoG4ovlsLJgUSDeRFwUkFgs5ZfmNBvmZyk9MT9biXEwdDiqBdP3UoF6wdJrVC7PFv9UE08cjOwGM6v3QxYWVz0TlVjCsRW18DJwJ+L4/dc0YMJ4fIINzcGplDDPtnSTpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KQr1ghCfc2rSxDYm3n+C5DAjdt9Y1bqCGxhRC/JkPk0=;
 b=I20ViwaLRl/Kk1FEEAblP42i93zQ+JDcnWU0fiN2wkF8MISG8O1WNumJv9puihUKU5JQxyh7YKMgW9o+Fmgqgx899zV7MZXhNg6AfkB8wOTEsGIrAjPBkZLrmoHcVn/laku5kTwLMdB7xd/AOds2XaNbYNtBjngLn2ZI5+FGRcoT4/5H2dolx3x+/3OaHjm0c+tmvLS+HP3FZ5GNWU9iXf5ZURFge+a8eyC0pYV/LyM6HTyh+BKpVriZ783/xdU+fhgC9j6atEXwMm2suFlec8I8oNTwbitWOupLardzUA1sFyUtzC9IbZMlpl4dXGAmxaGwYzjAixF4yLb2NiddjQ==
Received: from SN6PR02MB4157.namprd02.prod.outlook.com (2603:10b6:805:33::23)
 by CY8PR02MB9594.namprd02.prod.outlook.com (2603:10b6:930:79::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Mon, 2 Feb
 2026 15:45:28 +0000
Received: from SN6PR02MB4157.namprd02.prod.outlook.com
 ([fe80::900:1ccf:2b1e:52b6]) by SN6PR02MB4157.namprd02.prod.outlook.com
 ([fe80::900:1ccf:2b1e:52b6%6]) with mapi id 15.20.9564.016; Mon, 2 Feb 2026
 15:45:28 +0000
From: Michael Kelley <mhklinux@outlook.com>
To: David Howells <dhowells@redhat.com>
CC: Sami Tolvanen <samitolvanen@google.com>, Lukas Wunner <lukas@wunner.de>,
	Ignat Korchagin <ignat@cloudflare.com>, Jarkko Sakkinen <jarkko@kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>, Eric Biggers <ebiggers@kernel.org>,
	Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>,
	Daniel Gomez <da.gomez@kernel.org>, "Jason A . Donenfeld" <Jason@zx2c4.com>,
	Ard Biesheuvel <ardb@kernel.org>, Stephan Mueller <smueller@chronox.de>,
	"linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
	"keyrings@vger.kernel.org" <keyrings@vger.kernel.org>,
	"linux-modules@vger.kernel.org" <linux-modules@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v15 6/7] modsign: Enable ML-DSA module signing
Thread-Topic: [PATCH v15 6/7] modsign: Enable ML-DSA module signing
Thread-Index: AQHcjtC3xUDRE8Ho5kej8+vCQMw4IrVsc8pggAGitACAACfKkIABF8UAgABBlaA=
Date: Mon, 2 Feb 2026 15:45:28 +0000
Message-ID:
 <SN6PR02MB4157C511E3335A5020EE70AED49AA@SN6PR02MB4157.namprd02.prod.outlook.com>
References:
 <SN6PR02MB4157EE01F25375784EB7C507D49DA@SN6PR02MB4157.namprd02.prod.outlook.com>
 <SN6PR02MB415708C0A6E2EB1B5C7BBFB0D49CA@SN6PR02MB4157.namprd02.prod.outlook.com>
 <20260126142931.1940586-1-dhowells@redhat.com>
 <20260126142931.1940586-7-dhowells@redhat.com>
 <2315764.1769964282@warthog.procyon.org.uk>
 <2416273.1770032906@warthog.procyon.org.uk>
In-Reply-To: <2416273.1770032906@warthog.procyon.org.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN6PR02MB4157:EE_|CY8PR02MB9594:EE_
x-ms-office365-filtering-correlation-id: 502ae00c-57cf-4f31-2265-08de62721732
x-ms-exchange-slblob-mailprops:
 laRBL560oLS7IWERjHonlu/qsKr3Bu1Zv/IyVf7GeOWxe2uknoJ/xPPU+HN6DWUksShCdG25hSwgVLYNaEjh72qD4g6+LTyIyll2E4dGBxVcUgxV57wSPkUPe3yDjTMuIliNC6+LVkfaKDOXr2FLntonYjUOxsCrzimVX5T+NA7wl1/pDZPnPifPOpny8XTXe8smakrvlmOyJfacsxOjS8taL/T5ohGfD8eSzSBjbW6p7H6vqkzqMwE3BhSCAOok3bZt4+HzpHkbIVsM9etYmIb24lEJWcryMI3cZ1SXmOyR9AHWY5wqZjQUMpDvUuEJCA0xzhX1S/anvQF6AdiuGu3pAYFhVFVkl7lDr/2Zb8L7/yzD2lT5bT/ulSTq1npmW+ukNmiyi8EYuVn66EARkvelhUU4QLv3NEFV42+BRsPUpbsZCnZO0DXzIaaHnqDdvzVjC2nHVl2w7DtmODuwKasyEolVrM72wdUlhCLHd7jby2nV/aiHdTd9d0jytdRKTLm2GOgh/ltGhDUdJIiQD0A1bZtKymWX4cN568rHQ+Bum85GLb482Z/7K+5q1WrdAiDX6DjsdjA8gl5A+FVN+hdoJRvwxhdKi61BYIX3kwbzWe4In0KFsLTmTtqVzCgALi8n0OGnQPZ/rVigf6ES6XhohXTxWgoZgnb+B3n1MQ+mpK6qJaVEvn9dHG/P732BJiJXNML08qjxDNJuPaa7wFxaYMGsmoDtHfkc2iG4qRDxiLQRPV204o3HBFHyNBvZVn9ZW1hCTMqHk4s7wqUP4wTZEz6K8Xvp
x-microsoft-antispam:
 BCL:0;ARA:14566002|19110799012|51005399006|8062599012|8060799015|13091999003|461199028|15080799012|31061999003|3412199025|440099028|40105399003|102099032;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?0BAUwOmKJCkf6RYz7W4EKY5ni439r5yG+EDCDi6ybQLJzDipZX2kMCrI0Gsj?=
 =?us-ascii?Q?NjxjsLULMfScVJRPmREQgZrXhFU/WITjGrffgna/+XJCs1qYATroZ3DFT3Cc?=
 =?us-ascii?Q?+ENeVZXb6jKM1kqeAZIDmmIz2FF2vphh4z6AgPovOiHY71cEnKj8picK8Wky?=
 =?us-ascii?Q?2sEG1aO76toIjY6EiiD4q3hnA9wlAxtk+CqTVOkOuYrzA/jHDAa01orsvWBB?=
 =?us-ascii?Q?qDr/RA84FKCKR9YnocnT7STwkUANGpsiodpxKwnguZvpPGIitxW2crsWAVOp?=
 =?us-ascii?Q?qlTJnaPtH7WUbVYT2ctX7keuX+oux3Yqx2lOxZsb+kbIUoTlRti5kfuuqrm1?=
 =?us-ascii?Q?hTJEdBnV67Cgi0nJ4NnIffznbxrSfSVgAtIyCX0yWajMsjmM3pvLJtb69QBk?=
 =?us-ascii?Q?xthHAf8qAzoX2fABOc87ukFdPHwXOF+u7Qo6wSkTJSmWQfme+hV5DS/fZZWy?=
 =?us-ascii?Q?eUyEAt58T6ih8xZBO/TXCXiUSMiRKbXKnPHtv5NX614yL8DICgoNtN1m/4IN?=
 =?us-ascii?Q?+HZ0ciW8s6Efd/B+TKhfOmq1uodP9DI0YX6QLzhcSDco39UpmUf914wHka4n?=
 =?us-ascii?Q?KZc1UhKgQyrO240v51/xpoUR/4f2QkWLgErRivcC3mf7CMx2hoQkTfGBtP07?=
 =?us-ascii?Q?tOGwAXBPGBSp1tp9yXtDdtqcN6MQUcclw0tdYT9OOuWvG/mQ8QBsioFwzouE?=
 =?us-ascii?Q?X7epvyBHx+01OgGd1d38+69KJNEONfSFLC2Jo21GwVZez0F+C3nH9BiQ0VnH?=
 =?us-ascii?Q?PLS+aNyKNgkazx2v4GHrrnnY14rfe4TfMKGrKndPl2BVSmdksPmDWYb6Xe7w?=
 =?us-ascii?Q?v19fwH/dDvXG5ca/TjBaRFV02nIgX/WjW61b4DOzctMWbQ2SziL7CMMJPKIU?=
 =?us-ascii?Q?oONqVtot0jCo8+N+RZr11CM6IVNC+/9vaUQBTixRGWka6LS4C53o58e8KJQT?=
 =?us-ascii?Q?cNJIXfOps/tH2pOwWYNFtgsx5YXlqRzq+zh2dyduA1qaW91reyrntCTzuO7D?=
 =?us-ascii?Q?WEGKj3ed+Got8Xy4JMOJgQtXiG8bXEf+V5Ww2lkHGKYHr1CF3Ydua70CaphX?=
 =?us-ascii?Q?xCf68wBL0RByEc4xI+UGctdkMOy3yxjlMaS4GiMVnVn3tcWaEA+SH7RxOkTn?=
 =?us-ascii?Q?2jZXJIUrGI7O2X/jNs+dUyTf2ONdMgG9H9eX9YhxoixeBLpl0tjUhw2j1SDu?=
 =?us-ascii?Q?FXQW/odUYgqhJp+ESegCN8fxO50P3XsqxscC3A=3D=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?JkmQhIAqBUC6MprfSebigq3wWcfTBYKWlGsOSjks71lz6TKy+0xJJ5fRv5Tf?=
 =?us-ascii?Q?lws5Qr6K0HymiIHOtqmBJmqlU9sNfEb3vONuivjliGpZLdLOpFo3eHEFcy8k?=
 =?us-ascii?Q?GSSpVvcBojtoIQJjwh2aKHcHSZ2wx/xzIANlg9vMw2Wf6bbRULeFeiJZHGrb?=
 =?us-ascii?Q?ZtuBiwOLDkE4GXQZ2wBym5kbkmRpkM8dJcttWYrvFco7doIadKqgmFtRiCBP?=
 =?us-ascii?Q?S38+vQrcZAkatc8Me+lrKxu4tnvOoylUyP16zHnE3k/rdk2yUg5o82x9p8Rk?=
 =?us-ascii?Q?CvO6CHdUYD4/29ab0qNkZnp0wR16Y3oon93sdACAztIZDQOUXPD+lMzv5YIB?=
 =?us-ascii?Q?2eCcpfcMiDAKXAAs6VXJLEbm66V5gI4K2FiI8vpeoQ7xmTjLRq1yGOZXlyI6?=
 =?us-ascii?Q?DpfFw8vl68VoC1LAOL72w3nD6wuFbppnUsL/qbNRQrdBOo+82JK8y6V+M7jS?=
 =?us-ascii?Q?6hPHLdCHUrgUTOzXWHPckvQo1x3SSElfM/XPDB2fhtfpZKn47XO+f0A4diT3?=
 =?us-ascii?Q?/XFDf6fpaYyWoBK3CRGuseTLl3X/M7gQP6aFfgUOBht3pmfiVskyLP+5Mnrz?=
 =?us-ascii?Q?uft5GHC0ImHoZdfyPbQL/hyKCiyjvxl+ecfpTSXHAmVumRbnAyR51h7qLgnS?=
 =?us-ascii?Q?228pfzvi9hFHn7nLaiorIIIdPfryzuNC1bFspDIGbA1uPhzPWoXUKUSefnG0?=
 =?us-ascii?Q?brh4DB/59czfSE7+1wj+sojI9u8ko68YhU00ZDIfxLOqLEjWHkj4FtY0kCpm?=
 =?us-ascii?Q?co1E5BxjdSkm99Tdax0ANRXTWiscFIV3m5SYEITQjLMgEM5NEHcyj6bnQWHO?=
 =?us-ascii?Q?3SvtZBXYHHJNm/o5tYlmFsRZAQYhp8ABx+F5YnX4Nnll0B1QQfHOayKmX/8/?=
 =?us-ascii?Q?qLKANp1ivuGBly0rXu2A54jidvCJKnARKarRpIrIZvxWQEacteMGgnjWJ1Fu?=
 =?us-ascii?Q?VPIdBE/3K+ppKPlKmAvs/lW3jFijPJQtB1Gx2YUv/+8ZsZm4cOn/82mRltot?=
 =?us-ascii?Q?AS52egXwQKtieSrl4d2LbzNk4BiVfrdmIwWNImOulPu+Azh2L+uxiwoKt+1y?=
 =?us-ascii?Q?mbhw7I4PTQ955UIi0kLV0dIkcwfsVbvtLjAWV1VB3kFI3ZR1BPuPWAbrg8hM?=
 =?us-ascii?Q?xOVH5+iRXvI7rwEmIdAApWdprPxc+wIsQys8xNX+ozvRm4yolYlzBPy9AleF?=
 =?us-ascii?Q?ajXPdbc4fU9Cavzk1dTaFedNpvZDWgGHa8kWRb8HvkMY5lUEd8Lkz/6P6U3m?=
 =?us-ascii?Q?CHQhr7vw+CMkB2az9lB1Ia9+5+LWlTzzA6OGQ6RZWKL+mq0Rm/Qx2GpKcUW8?=
 =?us-ascii?Q?HfCDzZzrlRT1y45X9IHqvUcsHCvLWtF+4gfCn5n1cQtoIqZ+4P/2ls3S+z3C?=
 =?us-ascii?Q?m9SDrGE=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 502ae00c-57cf-4f31-2265-08de62721732
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Feb 2026 15:45:28.7702
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR02MB9594
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[outlook.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[outlook.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-4002-lists,keyrings=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[keyrings];
	DBL_BLOCKED_OPENRESOLVER(0.00)[outlook.com:email,outlook.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 60047CE778
X-Rspamd-Action: no action

From: David Howells <dhowells@redhat.com> Sent: Monday, February 2, 2026 3:=
48 AM
>=20
> Michael Kelley <mhklinux@outlook.com> wrote:
>=20
> > Pardon my ignorance of the signing details, but I don't see an indicati=
on
> > of having selected PKCS#7 with SHA1 in my .config. What am I looking fo=
r?
>=20
> Actually, if you have openssl >=3D 1.0.0 then it sign-file will be built =
to use
> CMS rather than PKCS#7, and will use the configured hash algo, so you can
> ignore this.
>=20
> > The symbols CMS_NO_SIGNING_TIME,
>=20
> I can probably just not add that.
>=20
> > EVP_PKEY_is_a()
>=20
> I guess I can probably make this contingent on >=3D 3.0.0.
>=20
> > and OPENSSL_VERSION_MAJOR don't exist in the include/openssl/* files fo=
r
> > that old version.
>=20
> I should probably use OPENSSL_VERSION_NUMBER instead - though we already =
use
> it for selecting #includes (I guess #if doesn't complain).
>=20
> Do the attached changes work for you?

Yes, these changes work in my environment. A full kernel build succeeds wit=
h
no errors, and the resulting kernel runs as expected.

Thanks!

Michael

>=20
> David
> ---
> diff --git a/scripts/sign-file.c b/scripts/sign-file.c
> index 547b97097230..78276b15ab23 100644
> --- a/scripts/sign-file.c
> +++ b/scripts/sign-file.c
> @@ -27,7 +27,7 @@
>  #include <openssl/evp.h>
>  #include <openssl/pem.h>
>  #include <openssl/err.h>
> -#if OPENSSL_VERSION_MAJOR >=3D 3
> +#if OPENSSL_VERSION_NUMBER >=3D 0x30000000L
>  # define USE_PKCS11_PROVIDER
>  # include <openssl/provider.h>
>  # include <openssl/store.h>
> @@ -323,18 +323,21 @@ int main(int argc, char **argv)
>  			CMS_DETACHED |
>  			CMS_STREAM  |
>  			CMS_NOSMIMECAP |
> +#ifdef CMS_NO_SIGNING_TIME
>  			CMS_NO_SIGNING_TIME |
> +#endif
>  			use_keyid;
>=20
> -		if ((EVP_PKEY_is_a(private_key, "ML-DSA-44") ||
> -		     EVP_PKEY_is_a(private_key, "ML-DSA-65") ||
> -		     EVP_PKEY_is_a(private_key, "ML-DSA-87")) &&
> -		    OPENSSL_VERSION_MAJOR < 4) {
> +#if OPENSSL_VERSION_NUMBER >=3D 0x30000000L && OPENSSL_VERSION_NUMBER < =
0x40000000L
> +		if (EVP_PKEY_is_a(private_key, "ML-DSA-44") ||
> +		    EVP_PKEY_is_a(private_key, "ML-DSA-65") ||
> +		    EVP_PKEY_is_a(private_key, "ML-DSA-87")) {
>  			 /* ML-DSA + CMS_NOATTR is not supported in openssl-3.5
>  			  * and before.
>  			  */
>  			use_signed_attrs =3D 0;
>  		}
> +#endif
>=20
>  		flags |=3D use_signed_attrs;
>=20

