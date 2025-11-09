Return-Path: <keyrings+bounces-3315-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id C6B85C4464D
	for <lists+keyrings@lfdr.de>; Sun, 09 Nov 2025 20:43:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 20216345BCB
	for <lists+keyrings@lfdr.de>; Sun,  9 Nov 2025 19:43:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6885242D9B;
	Sun,  9 Nov 2025 19:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b="O8eKGWur"
X-Original-To: keyrings@vger.kernel.org
Received: from mx0b-002e3701.pphosted.com (mx0b-002e3701.pphosted.com [148.163.143.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36A811E1DF0;
	Sun,  9 Nov 2025 19:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.143.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762717388; cv=fail; b=k8yF1HWeePDdipYFPCj7jp/n2Pjkq2yoA2AqwcyOAp59M8ire9jSDB/TtyQwRK+DMHUYDdmIqs87SufHdt3DSz/lRYqN403865caJ+vQNBoS6ULZd95lcH0sGqAqaIsGPd6D+FC8warMeAxwKRWUp8h8STfOCkh0k84XYdOIEF8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762717388; c=relaxed/simple;
	bh=YDxhACrXRCSRXT5TSDHnEp/gMzGA9X7pMjP/RYsyZNE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=dKH1HcIiBySMs/CVg8RqvEcysk6DkJfXu3Tp5wXjdG0gqpE9bs+ePn/RzYkigF8dj1JKtpJ6E7UddI0uOkL3QaZb0Yua7HG/SEwmM/hAXUMU0V/09+f5aYCHq6msyuESyqWpHn5niZHvy9e7wujTyeTEj1oqYcE1bSB+BvJ3F3E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com; spf=pass smtp.mailfrom=hpe.com; dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b=O8eKGWur; arc=fail smtp.client-ip=148.163.143.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hpe.com
Received: from pps.filterd (m0150245.ppops.net [127.0.0.1])
	by mx0b-002e3701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5A92WYco026598;
	Sun, 9 Nov 2025 19:42:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps0720; bh=kH
	sxS8J5jWTahWJJyJMAoXqlrmCSNM58P3C75OjUHC8=; b=O8eKGWurg01B47Q9S9
	w8wwft/XuN0iyV5PVLzNXwjsfF/zS55s316oR+kj+aDqB+Ddh4R4yd3lqHpSSyRR
	MD3IP1w3/xbRxy17Ir8MFT4FLgcG7cana2OVArUM0+aUKBZ+X4BZRXUYVW2A3eNg
	N8to1z7Xfdbw5IHmnc+Vyk85T6XQx9Q8R+mHbDTbTrk31jZRIX7YjMF67/NRXA7i
	J6lqAa0ddXpw3ViQO0TqtXiiakA48UFDSE5WACiTjtw/6Qu3TNkNk6vOQVj2k5qJ
	6zvvZU5WoiYU7FhcgeIYznPM3N5HpR4cU4Ow/2lRr/SFAJNhI8ILnviWLNVTy/vL
	xy4w==
Received: from p1lg14881.it.hpe.com (p1lg14881.it.hpe.com [16.230.97.202])
	by mx0b-002e3701.pphosted.com (PPS) with ESMTPS id 4a9y2shusy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 09 Nov 2025 19:42:38 +0000 (GMT)
Received: from p1wg14925.americas.hpqcorp.net (unknown [10.119.18.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by p1lg14881.it.hpe.com (Postfix) with ESMTPS id 4645F8059F9;
	Sun,  9 Nov 2025 19:42:37 +0000 (UTC)
Received: from p1wg14924.americas.hpqcorp.net (10.119.18.113) by
 p1wg14925.americas.hpqcorp.net (10.119.18.114) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Sun, 9 Nov 2025 07:42:06 -1200
Received: from P1WG14918.americas.hpqcorp.net (16.230.19.121) by
 p1wg14924.americas.hpqcorp.net (10.119.18.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Sun, 9 Nov 2025 07:42:05 -1200
Received: from DM2PR04CU003.outbound.protection.outlook.com (192.58.206.38) by
 edge.it.hpe.com (16.230.19.121) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Sun, 9 Nov
 2025 19:42:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J652NgFhAKGPR7xA9Ney2/zscWXocKjJblei/8o4RmHn3f9D5BqBgpieqpK7CzuI0PU7BqWBGuAOI7xVJFIW4n3nVQWrhPCSAH3d/wjGhbzbP8J4FKCnbmtB+/MlaBVcfKyrMZ9TPs10w9cDb+Nc0xSRb7pJI2SbDA0ZoOCH9vBUyRxsezD214vSbFg9QekqTfyNsSJ2Ek/2HLvL6epo4b6qgCs8vbaF9P2SarpikoQD0qAIwm0vbDrp0E2DKDEucea0T5eXItfnt89nbv65Q7zghuswrRckXe91xq7XMAq3+Mpv1BM++ndRdDAE2Cv34l0VAg1csAIye0HrsVZsSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kHsxS8J5jWTahWJJyJMAoXqlrmCSNM58P3C75OjUHC8=;
 b=KA4IULNTt4aCmH5fYX54YAoZZ5pi0qIQLVVG/KLx4C4QskjT09/g/PKNwB8BYsNaq98JH2xvfeFqT+orY6VqtHwVUuFafWAYRez2Xb0PBpj3YqetV/btCl9eKDcxgX/qQPhdLi/r0TIDdziR1IqI875NV1Ms2e88dPgBeD4mGNBdSpSCd4UvAc9rli1wfY/n5HbZAhH3OBecMYr0AAKOyagUqHg8o+s4Nsu120adhU7/cw5krVsSavo6RmS/seXSKjqrNc1gHTuGxamXZ4CJKeLWBu2EGp4af22Gvfkn9yDtiGv6WBiWtrApjOBdsR6WSnhwCEVs0meKv7Qnpx15bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Received: from IA4PR84MB4011.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:208:54f::12)
 by LV3PR84MB3650.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:408:21a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Sun, 9 Nov
 2025 19:42:02 +0000
Received: from IA4PR84MB4011.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::766:753d:9ff8:1c8b]) by IA4PR84MB4011.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::766:753d:9ff8:1c8b%4]) with mapi id 15.20.9298.012; Sun, 9 Nov 2025
 19:42:02 +0000
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
Subject: RE: [PATCH v7 8/8] modsign: Enable ML-DSA module signing
Thread-Topic: [PATCH v7 8/8] modsign: Enable ML-DSA module signing
Thread-Index: AQHcT84xwrZ8ZuVsrEiVgpvi251joLTqoWlw
Date: Sun, 9 Nov 2025 19:42:02 +0000
Message-ID: <IA4PR84MB4011C832FD34CE55C3BA3258ABC1A@IA4PR84MB4011.NAMPRD84.PROD.OUTLOOK.COM>
References: <20251106174456.31818-1-dhowells@redhat.com>
 <61637.1762509938@warthog.procyon.org.uk>
In-Reply-To: <61637.1762509938@warthog.procyon.org.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA4PR84MB4011:EE_|LV3PR84MB3650:EE_
x-ms-office365-filtering-correlation-id: 309869c7-f8ff-4a96-4560-08de1fc80ded
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014|38070700021|7053199007;
x-microsoft-antispam-message-info: =?us-ascii?Q?+cvkFxvKnUrVBTHr4hJit9PVOnsVaRupud3+hBwNquHwbFDbSYmk+WXnNBCe?=
 =?us-ascii?Q?HkZLsf6P9BoDFJI8WKqBSQEv0tw0/NEEpn4G0aS8zO3xT7l4iKvnRBKn9Xn5?=
 =?us-ascii?Q?ctj9TfZe3P2k2EajuvVt/AiOeF+He2WHyiH4WfpUFfDostJd7bktwteJn3gU?=
 =?us-ascii?Q?gS1I5XVxCA+DWGQl+oe6SXIrAy5/xaTAHuNtD1Rtnq06ajJMz7hIAXmgdG3B?=
 =?us-ascii?Q?UuMXitoNkNk7wOyeLL9FpIMrFz8dS8atUikQQjIm7GD4K/nCbuYcuWbteZ37?=
 =?us-ascii?Q?u2rigNVttHE6tiEogE+q894EOoZTtMCbxmNj5oXP3ZdpUOOyXZCiH3uCt7Ez?=
 =?us-ascii?Q?if5M40M3EPvasFR3BEfd2Aq8yk4Gc2ZdhZo7DxCVAhFAUol+Vshr2UlaHShD?=
 =?us-ascii?Q?7XU9ONE60OJsHC1HuDwkUUcHRzylomyYI7oSnhYGMUCIqMZhvU/Cme1h6cqA?=
 =?us-ascii?Q?YuC7YmSLUO9bnHkWS1myg5Dtj5VhhRm3HCakLti0UTJPqhg/cZ1KLhx/n0j2?=
 =?us-ascii?Q?GC4Pw60WQrZh669Lcx29N/EAIz6oOco7egroCBqoTKTKQqGZ6dBcVI+hae6f?=
 =?us-ascii?Q?z6In5pnvV+XhmtpZE+0rTBtzuckIi+cOXN04cJHaL0HStHFu03h5RzjpJke1?=
 =?us-ascii?Q?BWdn9xIIycBkIUxDlMn0N9Lwk2inmq7TOX9Rc+/SjZcNzrIXqbLPyhvhHlth?=
 =?us-ascii?Q?OFRFqqinoE0Jdn08d8PNSvvG4QDKmG4o7dfJLnkgwbgQ+yVWiBQ/6dmbF5A4?=
 =?us-ascii?Q?CIM+xmvST1AF6RX+L/ctFHsBLUIo+ErPkEyhEFSzXyqfiV/SYlDZOMTKtt6y?=
 =?us-ascii?Q?Br8Ko6cwSHlbQoizJ3DqGrt9xdHiEeqE2sBKRbP4EXYMsWLComL/d83fzH55?=
 =?us-ascii?Q?wA5J0Oh0TpTsZn0To0CsTnmPtbohqD2GIthAB/moLCoyU4Ii9v9PiuEPloue?=
 =?us-ascii?Q?0hdHXgawaX1oyCekIdHqGg9LWZ8dnT1NLfCkdtJnZYuh8P2xfYicITb6O0gx?=
 =?us-ascii?Q?x+RQVxhdbfCNa/5ME4mcJ9P+GDWjWVS+kA+u7IAhqgAYFMZ0ZEI6UPoYndZp?=
 =?us-ascii?Q?BgWUAhvc85RSPbLzF+1ODuD+rpYR7XbMwG7brHttaxGBnyeJInS10k2jQtE4?=
 =?us-ascii?Q?mj/JquQUPaFyDtGH6BHlXrT2IxkX2lmQGIU9xzy6etneE0bLUgNVcCSZDIbJ?=
 =?us-ascii?Q?IjIjqz9oS8ONZ4uOEfRkvdEILzodCOnPQTIWOwvOuPrtye0tZ32T6wZaMpTD?=
 =?us-ascii?Q?ibc13WAay99dRJlX+391lRlzrZnwt7F+Qse5S4QuzRKjG3SDMTtzKCjqqZ/f?=
 =?us-ascii?Q?oY5dejl4ULi8WK1TRw0ojOz/0nLx4BxoSq2WfeRo6F3tfc4tyDl7IVI97W63?=
 =?us-ascii?Q?04cgFdSD5WwdSZmdzywUcVqgyHO08xmTRnUQ6o0O6JMEKZmyRowmMvsOhkgH?=
 =?us-ascii?Q?TtC9K2uLTGQf5PAq7hZ25rEsW6FeOEaEdDxJ3Gevdyp39zZwGmZDwNF5Gs5b?=
 =?us-ascii?Q?S/NuNUuIxdICI6o7XCK+whvgF9js/Y9aUVTh?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA4PR84MB4011.NAMPRD84.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700021)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?zbrI6adL85L1z21M+50XxKinTmOVcDLaJ+yO3ax0cJDjEYF+CvrvjrzKr25D?=
 =?us-ascii?Q?SrY1rRAUeUoym+PPXSeTyKSca/OOUaRfhQ8H2wHnvfcYU3nnemOih4RR6pHV?=
 =?us-ascii?Q?HA/bq5WdefGm8svZPJTRXkdDYBdXNniUkm5//EAPfgs0gEZwVZCZ2JllwzNO?=
 =?us-ascii?Q?SBmCOfv7lfEX7sjoufPrPTYL+yytuhW0ylys9xiii4x16o+I2i/8hOlg+V7l?=
 =?us-ascii?Q?zA8pUfUKiode4VFVgGNYGCPKMh+/qeo/GDhj8SCUDO5a1/XOyWS/uAGMaA4I?=
 =?us-ascii?Q?uKdkgM87TdrDK6tmvQKjtm6snB361Yef4q1TeMLAzaMIZPJgNRHjqj5sUIMK?=
 =?us-ascii?Q?AA0SS6s9iWjhrMqibY8etRqNCMs03/3TPb267Qnu4P7IZ+DEYN+pBVt0fP1G?=
 =?us-ascii?Q?eiBT8WwIh2ly3MoW+ZyA+JMlY1P0c8t87QplnTVMKMUQ8Gbq1nGPmiwizElv?=
 =?us-ascii?Q?3JKEzJ5RcrtDP5lHR1JzG+UDXF2Qg8I/sAxTZvRY3AMkXuV8Mbl+C2PuzLXI?=
 =?us-ascii?Q?NjjFhC07SYOI+jFyzmchRfNQqtXOmmLPkExdGQb9+iE7lNF2uco+SjU3iTpV?=
 =?us-ascii?Q?WwPYhm9kGP7mMRQK20rhQiQEnOmoT3TgxfN20Cha5/MOt4eCbNDYERZfgBsK?=
 =?us-ascii?Q?1PXBQBGYpLcCcJnKoNE18ZN6hUi6LDQ4CHkKg/bWndNRCUP53TuEw8JjM7l+?=
 =?us-ascii?Q?aEKxHneuntlG43hfiVRX6ojez5neyMawWjMR0cnZjLvXAJ2GkoQjXFFWRMEx?=
 =?us-ascii?Q?yLGm5ahl1aXNW0D+eSy+rBTVD83Rgiie9kRWeMqUmaunk07P6fRtVJynAsnj?=
 =?us-ascii?Q?a5NYoL8Er8q0rnbP0gIQ6uU4kMgIkFD4ClQ2s1QogDNYUET/Ly9osmPYHHD2?=
 =?us-ascii?Q?nFD+0czpBgU8qP6YgbrkFRhG+jAeRwHPhjeXmasmiNzrAXiqUlifsBwAsZOC?=
 =?us-ascii?Q?UqcfreWd4JtRFIVx1sakq0bXTPTjlF9+x5FEinZd3x7MOo+qtVR96MmPOmdd?=
 =?us-ascii?Q?3w+0ehxfG7/CTSPCz2t4bI2zpW9MekinjpVhySpWImZoP+EwbZhZJ6w+Wecy?=
 =?us-ascii?Q?E7+QaBHxrrqsoZvu66cxFJKGClXqqvWWS/XCaudeDLB5ud4wFeAXS3P9zZXk?=
 =?us-ascii?Q?hG8NVlMqXQDadiRee6dZStDElcHYdhNHJLXLxEGk2hUb2Ixr36XeNo++XLtJ?=
 =?us-ascii?Q?eqjmkvkf3N1iHlCVqbJ9g5oOaC3MpxhX6UskRAth0HzcH5t24K+ZBk0awjIM?=
 =?us-ascii?Q?ZBJUON8SEYiZ3rBSolZWYCezeohOB3RBU9eyjgLNP9qwKxp7hGRog+V4gT3y?=
 =?us-ascii?Q?taHBHrvdu1nIbKDSbQ0lC4RkDJUWEyIcrASAu63DEdHn7/etwJl+V7k6uFOg?=
 =?us-ascii?Q?sfyJG5iGFUOFMef/shN7v7Eh7jC/yRHBq104hzC7jusO58q2arnbqrDC4mNE?=
 =?us-ascii?Q?A+8EKgUZaEoFEBHHVgSPncJhEiVUuPb8LNfmJeIJ7SSktz8XfyZ476/s4nMi?=
 =?us-ascii?Q?kGXx52LAnvBIQRFcqvL8PlA+bmejGdtGVbH+v8tR9oZ7dNjFIK3X07l6ML5X?=
 =?us-ascii?Q?2Ip1qDNmX2TzVBkdfmU=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 309869c7-f8ff-4a96-4560-08de1fc80ded
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Nov 2025 19:42:02.0413
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vFCk4zTRMzk4RMR5dhNx2VxPSyMJ9oCMprTCeetmLwwsbOIg03j2Nvbv1DHIiLIw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR84MB3650
X-OriginatorOrg: hpe.com
X-Proofpoint-GUID: s9RtPRSRNuGk0LkHXtCVCX06fSZL_R7e
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA4MDAzNSBTYWx0ZWRfXyb53lG4H+4o5
 TtADniNIf6WunnFyfzD8yGdqzPLqYXO+XZAh5YX5XQa62xw/CEKOmFDZs7trVPzniNqMihaEhMo
 88WhUFO7/Wa4BQwJ9dqQ0/cv89sYUWjo7EcdMp44BLVyRZ/bw+CjmsCZSFjfA/UYthEguTwhcPN
 /wyckr3Gt99Tl4e6SrPv8I5LSElBXv9Y/wwMko6DT5quK2aPnB5AnCfdPb9J3QdUxqvTgyxYtZl
 j9cq2awayv5d57Orm0PK4Ytk1wIkMwwZSSlc/2mMA4Db11LMwG2q5xzqVg7nkgniJ0v8XJNsqPu
 /1kG2mkQE1WRzOpzFuTZGydK3GBhtPV939GPx7HMHQCKYMxqoHEv9zEPCn+AEJGEyN9BlfXal3k
 KQYt5URjiTUmtwF0xtRiSpD1mbmgzg==
X-Authority-Analysis: v=2.4 cv=OIgqHCaB c=1 sm=1 tr=0 ts=6910eeae cx=c_pps
 a=FAnPgvRYq/vnBSvlTDCQOQ==:117 a=FAnPgvRYq/vnBSvlTDCQOQ==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6UeiqGixMTsA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=20KFwNOVAAAA:8 a=FNyBlpCuAAAA:8 a=VwQbUJbxAAAA:8
 a=iox4zFpeAAAA:8 a=1XWaLZrsAAAA:8 a=UGG5zPGqAAAA:8 a=EG7W4yiQAAAA:8
 a=_tnN2M0omkfl4dxyM5QA:9 a=CjuIK1q_8ugA:10 a=RlW-AWeGUCXs_Nkyno-6:22
 a=WzC6qhA0u3u7Ye7llzcV:22 a=17ibUXfGiVyGqR_YBevW:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-ORIG-GUID: s9RtPRSRNuGk0LkHXtCVCX06fSZL_R7e
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-09_08,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 spamscore=0 priorityscore=1501
 suspectscore=0 adultscore=0 impostorscore=0 clxscore=1011 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510240000 definitions=main-2511080035



> -----Original Message-----
> From: David Howells <dhowells@redhat.com>
> Sent: Friday, November 7, 2025 4:06 AM
> Cc: dhowells@redhat.com; Herbert Xu <herbert@gondor.apana.org.au>; Eric
> Biggers <ebiggers@kernel.org>; Luis Chamberlain <mcgrof@kernel.org>;
> Petr Pavlu <petr.pavlu@suse.com>; Daniel Gomez <da.gomez@kernel.org>;
> Sami Tolvanen <samitolvanen@google.com>; Jason A . Donenfeld
> <Jason@zx2c4.com>; Ard Biesheuvel <ardb@kernel.org>; Stephan Mueller
> <smueller@chronox.de>; Lukas Wunner <lukas@wunner.de>; Ignat Korchagin
> <ignat@cloudflare.com>; linux-crypto@vger.kernel.org;
> keyrings@vger.kernel.org; linux-modules@vger.kernel.org; linux-
> kernel@vger.kernel.org
> Subject: [PATCH v7 8/8] modsign: Enable ML-DSA module signing
>=20
>=20
> Allow ML-DSA module signing to be enabled.
>=20
> Note that openssl's CMS_*() function suite does not, as of openssl-
> 3.5.1,
> support the use of CMS_NOATTR with ML-DSA, so the prohibition against
> using
> authenticatedAttributes with module signing has to be removed.  The
> selected
> digest then applies only to the algorithm used to calculate the digest
> stored in the messageDigest attribute.
>=20
> The ML-DSA algorithm uses its own internal choice of digest (SHAKE256)
> without regard to what's specified in the CMS message.  This is, in
> theory,
> configurable, but there's currently no hook in the crypto_sig API to do
> that, though possibly it could be done by parameterising the name of
> the
> algorithm, e.g. ("ml-dsa87(sha512)").
>=20
> Signed-off-by: David Howells <dhowells@redhat.com>
> cc: Lukas Wunner <lukas@wunner.de>
> cc: Ignat Korchagin <ignat@cloudflare.com>
> cc: Stephan Mueller <smueller@chronox.de>
> cc: Eric Biggers <ebiggers@kernel.org>
> cc: Herbert Xu <herbert@gondor.apana.org.au>
> cc: keyrings@vger.kernel.org
> cc: linux-crypto@vger.kernel.org
> ---
>  Documentation/admin-guide/module-signing.rst |   15 ++++++++-------
>  certs/Kconfig                                |   24
> ++++++++++++++++++++++++
>  certs/Makefile                               |    3 +++
>  crypto/asymmetric_keys/pkcs7_verify.c        |    4 ----
>  kernel/module/Kconfig                        |    5 +++++
>  scripts/sign-file.c                          |   26
> ++++++++++++++++++--------
>  6 files changed, 58 insertions(+), 19 deletions(-)
>=20
> diff --git a/Documentation/admin-guide/module-signing.rst
> b/Documentation/admin-guide/module-signing.rst
> index a8667a777490..6daff80c277b 100644
> --- a/Documentation/admin-guide/module-signing.rst
> +++ b/Documentation/admin-guide/module-signing.rst
> @@ -28,10 +28,11 @@ trusted userspace bits.
>=20
>  This facility uses X.509 ITU-T standard certificates to encode the
> public keys
>  involved.  The signatures are not themselves encoded in any industrial
> standard
> -type.  The built-in facility currently only supports the RSA & NIST P-
> 384 ECDSA
> -public key signing standard (though it is pluggable and permits others
> to be
> -used).  The possible hash algorithms that can be used are SHA-2 and
> SHA-3 of
> -sizes 256, 384, and 512 (the algorithm is selected by data in the
> signature).
> +type.  The built-in facility currently only supports the RSA, NIST P-
> 384 ECDSA
> +and NIST FIPS-204 ML-DSA (Dilithium) public key signing standards
> (though it is
> +pluggable and permits others to be used).  For RSA and ECDSA, the
> possible hash
> +algorithms that can be used are SHA-2 and SHA-3 of sizes 256, 384, and
> 512 (the
> +algorithm is selected by data in the signature); ML-DSA uses SHAKE256.
>=20
>=20
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> @@ -146,9 +147,9 @@ into vmlinux) using parameters in the::
>=20
>  file (which is also generated if it does not already exist).
>=20
> -One can select between RSA (``MODULE_SIG_KEY_TYPE_RSA``) and ECDSA
> -(``MODULE_SIG_KEY_TYPE_ECDSA``) to generate either RSA 4k or NIST
> -P-384 keypair.
> +One can select between RSA (``MODULE_SIG_KEY_TYPE_RSA``), ECDSA
> +(``MODULE_SIG_KEY_TYPE_ECDSA``) and ML-DSA
> (``MODULE_SIG_KEY_TYPE_ML_DSA``) to
> +generate an RSA 4k, a NIST P-384 keypair or an ML-DSA keypair.
>=20
>  It is strongly recommended that you provide your own x509.genkey file.
>=20
> diff --git a/certs/Kconfig b/certs/Kconfig
> index 78307dc25559..f647b944f5da 100644
> --- a/certs/Kconfig
> +++ b/certs/Kconfig
> @@ -39,6 +39,30 @@ config MODULE_SIG_KEY_TYPE_ECDSA
>  	 Note: Remove all ECDSA signing keys, e.g. certs/signing_key.pem,
>  	 when falling back to building Linux 5.14 and older kernels.
>=20
> +config MODULE_SIG_KEY_TYPE_ML_DSA_44
> +	bool "ML-DSA (Dilithium) 44"
> +	select CRYPTO_ML_DSA
> +	select LIB_SHA3
> +	help
> +	  Use an ML-DSA (Dilithium) 44 key (NIST FIPS 204) for module signing
> +	  with a SHAKE256 'hash' of the message.
> +
> +config MODULE_SIG_KEY_TYPE_ML_DSA_65
> +	bool "ML-DSA (Dilithium) 65"
> +	select CRYPTO_ML_DSA
> +	select LIB_SHA3
> +	help
> +	  Use an ML-DSA (Dilithium) 65 key (NIST FIPS 204) for module signing
> +	  with a SHAKE256 'hash' of the message.
> +
> +config MODULE_SIG_KEY_TYPE_ML_DSA_87
> +	bool "ML-DSA (Dilithium) 87"
> +	select CRYPTO_ML_DSA
> +	select LIB_SHA3
> +	help
> +	  Use an ML-DSA (Dilithium) 87 key (NIST FIPS 204) for module signing
> +	  with a SHAKE256 'hash' of the message.
> +

It'd be helpful to keep the names like "ML-DSA-44" together.

I would drop the Dilithium references altogether; that was used by some
pre-standard implementations that don't necessarily interoperate with the
final standard.

...

> diff --git a/kernel/module/Kconfig b/kernel/module/Kconfig
> index 2a1beebf1d37..4b5d1601d537 100644
> --- a/kernel/module/Kconfig
> +++ b/kernel/module/Kconfig
> @@ -327,6 +327,10 @@ config MODULE_SIG_SHA3_512
>  	bool "SHA3-512"
>  	select CRYPTO_SHA3
>=20
> +config MODULE_SIG_SHAKE256
> +	bool "SHAKE256"
> +	select CRYPTO_SHA3
> +
>  endchoice
>=20
>  config MODULE_SIG_HASH
> @@ -339,6 +343,7 @@ config MODULE_SIG_HASH
>  	default "sha3-256" if MODULE_SIG_SHA3_256
>  	default "sha3-384" if MODULE_SIG_SHA3_384
>  	default "sha3-512" if MODULE_SIG_SHA3_512
> +	default "shake256" if MODULE_SIG_SHAKE256

ML-DSA can sign any message, including a message that happens
to be a hash value already. It runs its own hash algorithm
(SHAKE256) on that message unless=20
* using the HashML variant that nobody likes
* using the "external mu" option, requiring confidence
  that it really was done, with the correct prefix
  (the context string, if any, is part of the prefix)

OpenSSL supports "external mu" with the OSSL_PARAM array
parameter OSSL_SIGNATURE_PARAM_MU, but that needs to be set
with EVP APIs.

(per the OpenSSL EVP_SIGNATURE-ML-DSA documentation page)

If the goal is to just avoid SHA-2 (e.g., running on
a CPU that only has SHA-3 acceleration), then the existing
SHA3 options accomplish that; I'm not sure offering
SHAKE256 in addition to SHA3-512 is useful.

If using a composite based on the CMS proposal, then
the message is hashed with an algorithm defined in that
proposal (for id-MLDSA87-Ed448-SHAKE256, it's
SHAKE256 truncated to 64 bytes) and then fed to each
of the signing algorithms (e.g., pure ML-DSA-87 and
pure Ed448).=20

That hash wouldn't qualify as an "external mu" offload for
ML-DSA since the hash output size doesn't match (ML-DSA
expects 114 bytes) and the right prefix wouldn't have been
included (Ed448 doesn't expect the message to hold the
ML-DSA prefix).


>  config MODULE_COMPRESS
>  	bool "Module compression"
> diff --git a/scripts/sign-file.c b/scripts/sign-file.c
> index 7070245edfc1..b726581075f9 100644
> --- a/scripts/sign-file.c
> +++ b/scripts/sign-file.c
> @@ -315,18 +315,28 @@ int main(int argc, char **argv)
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
> +		if (!EVP_PKEY_is_a(private_key, "ML-DSA-44") &&
> +		    !EVP_PKEY_is_a(private_key, "ML-DSA-65") &&
> +		    !EVP_PKEY_is_a(private_key, "ML-DSA-87"))
> +			flags |=3D use_signed_attrs;
>
>  		/* Load the signature message from the digest buffer. */
> -		cms =3D CMS_sign(NULL, NULL, NULL, NULL,
> -			       CMS_NOCERTS | CMS_PARTIAL | CMS_BINARY |
> -			       CMS_DETACHED | CMS_STREAM);
> +		cms =3D CMS_sign(NULL, NULL, NULL, NULL, flags);


For code signing, a desirable property is reproducible builds.

For RSASSA-PKCSv1_5 (and EdDSA), that is always true.

For ECDSA, OpenSSL defaults to deterministic signing, so
sign-file inherits that behavior.

For ML-DSA, the OpenSSL library defaults to hedged mode rather
than deterministic mode, so some additional steps will be
necessary to keep it deterministic.

OpenSSL supports deterministic mode with the OSSL_PARAM array
parameter OSSL_SIGNATURE_PARAM_DETERMINISTIC, but that needs to
be set with EVP APIs.



