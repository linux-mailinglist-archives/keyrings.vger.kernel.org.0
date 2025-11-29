Return-Path: <keyrings+bounces-3476-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id BA99AC9477E
	for <lists+keyrings@lfdr.de>; Sat, 29 Nov 2025 21:00:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 3FD2E346689
	for <lists+keyrings@lfdr.de>; Sat, 29 Nov 2025 20:00:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05E7A24EF76;
	Sat, 29 Nov 2025 20:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.co.uk header.i=@amazon.co.uk header.b="caJKh6VL"
X-Original-To: keyrings@vger.kernel.org
Received: from fra-out-006.esa.eu-central-1.outbound.mail-perimeter.amazon.com (fra-out-006.esa.eu-central-1.outbound.mail-perimeter.amazon.com [18.197.217.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CB3F13957E;
	Sat, 29 Nov 2025 20:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=18.197.217.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764446441; cv=fail; b=LLYRC4AXPR4e2yoI2j/GY2pqTby2MNt8YLnYX5k63RWdGwGEEC//heNv4433Jy+EM4lCmpnm/vysLA4jw/Jn7pxeN5pEvsmc7XzQdtqFdNNa9YF75evYYPwFZp7Ev52IIixoXTXLr/gErFAGcrIC7+cQYp+i72S2GMV0VXaeefI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764446441; c=relaxed/simple;
	bh=mbG0ntM95AWZiKi5PifosMP6AF8gWub3F1LMYe61FhI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=kD1VOcGlwbKZ5nqzpNxgp8vRh8v0QDgMcemDzJYGAyeGoz31adtzkAUN1SgCh48VF1KhzPh6OnETOQknYC03eEp6Ha8eDSrSRGEDgw7wLCbB027uUL3WU5MDamtoiZbzb86lq5gCZgz6oeruWWk9LzNo3mLjSyqWnT2qedq18XU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.co.uk; spf=pass smtp.mailfrom=amazon.co.uk; dkim=pass (2048-bit key) header.d=amazon.co.uk header.i=@amazon.co.uk header.b=caJKh6VL; arc=fail smtp.client-ip=18.197.217.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.co.uk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
  s=amazoncorp2; t=1764446440; x=1795982440;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=mbG0ntM95AWZiKi5PifosMP6AF8gWub3F1LMYe61FhI=;
  b=caJKh6VL1QIGYv2dRvXkC2z4uBmb0g6Jn2n9mNhnhNvGbmNR9vme09WI
   yGX8qjSrFLR9gvlI9nzo55tlWOS/9iV4+XgaCR+rLBWvvFgmZmzy+tNSa
   Z2R39l/GNFqvIxVzkjuZAtZZuots7ZJn0L2KObxDQ3QPDBmzVMi6Ew9TQ
   +S+y44dc2SqISkuAnX9G47gU+sIRRXVSJyEnljmSApexofIsmkFc2jo98
   sXm5V4fqLguiWB+VkHhQjquT2nPprN7g4i9jj3lUnDYAFfWHty9qeW9/0
   95WxbG1+GFa1WRxa35itA61tzST0jF7DkZ6cTbiO+yydz1OlJFChWCpYE
   Q==;
X-CSE-ConnectionGUID: wH6Tee2UQomzrcPbIykbrw==
X-CSE-MsgGUID: +5x6yTmtSY64d9TYAjqT3A==
X-IronPort-AV: E=Sophos;i="6.20,237,1758585600"; 
   d="scan'208";a="5990945"
Received: from ip-10-6-3-216.eu-central-1.compute.internal (HELO smtpout.naws.eu-central-1.prod.farcaster.email.amazon.dev) ([10.6.3.216])
  by internal-fra-out-006.esa.eu-central-1.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2025 20:00:21 +0000
Received: from EX19MTAEUC001.ant.amazon.com [54.240.197.225:8425]
 by smtpin.naws.eu-central-1.prod.farcaster.email.amazon.dev [10.0.7.127:2525] with esmtp (Farcaster)
 id 6ea26fbd-6c37-4f3b-88a3-1cba2a3e010a; Sat, 29 Nov 2025 20:00:21 +0000 (UTC)
X-Farcaster-Flow-ID: 6ea26fbd-6c37-4f3b-88a3-1cba2a3e010a
Received: from EX19EXOEUB001.ant.amazon.com (10.252.51.80) by
 EX19MTAEUC001.ant.amazon.com (10.252.51.155) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.29;
 Sat, 29 Nov 2025 20:00:20 +0000
Received: from LO0P265CU003.outbound.protection.outlook.com (10.252.51.94) by
 EX19EXOEUB001.ant.amazon.com (10.252.51.80) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.29
 via Frontend Transport; Sat, 29 Nov 2025 20:00:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QVFu9mO/gp07c0OWYgzRBsYzWL6JfNC9/Nd6RRCcOo6OEu38sCc34DzNKT/Wnp1X7AMZuhGL8eyi8edwdw4TObfH3zq8FcMmq+MX6SGmge/EF5Axmm/teT2Hr+CcazBHENPOz1Z+/pqQQyb+fhrGJEUHl3NiU/7p8kbkMjhrZYCGQ2QvoEHuQf1uxKvbrndAKyoJi85WcFX9+ZQSeJaUa9voHtfDO0GpCZjJAUqSMXUkqN2zivG9n6hS1Avvf6KX/GuptG76BQ7N79gfCOpipxCMHt+mIEUbD9DQ30F5eADzdMcfJ/rWJHm4K4IzM+bFuwk1ct/gQNPQln1ePQpF7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mbG0ntM95AWZiKi5PifosMP6AF8gWub3F1LMYe61FhI=;
 b=Wdsa5W9MfdVFJ1Cy/QRKR+CofFiFusVPqvVjsUGQ2B1AOaUS9lrb26vu+0xQEr5y5PmzmSXd0iSvHvp3jsRsznX+O27nimRFsUSnURSm1AgHLIm+dNoh6CGWQZt4kFgWPA1MBDLVdLxsF01G7cjRZQqYTXWb+TyWD+CFVnaZgCU1x0ii0EOpDinllVoFJJMSsssSvipDGv2x/kDdRzvoxT8MWOLQCFMBjOThDlepVvWCYJ5x9E5MzPqEZi/sEe39Qpibb0KZUe56PjbOFjUFdEiDeEiL/oYcLX2viCaXRuLxgOOknGTiLZofEJRR3eA0iyYpHU8w/ee4H+NY6RtLwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amazon.co.uk; dmarc=pass action=none header.from=amazon.co.uk;
 dkim=pass header.d=amazon.co.uk; arc=none
Received: from LO4P123MB5121.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:1f4::8)
 by LO6P123MB7287.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:33c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Sat, 29 Nov
 2025 20:00:17 +0000
Received: from LO4P123MB5121.GBRP123.PROD.OUTLOOK.COM
 ([fe80::bbde:f164:4dc2:7b98]) by LO4P123MB5121.GBRP123.PROD.OUTLOOK.COM
 ([fe80::bbde:f164:4dc2:7b98%6]) with mapi id 15.20.9366.012; Sat, 29 Nov 2025
 20:00:17 +0000
From: "Becker, Hanno" <beckphan@amazon.co.uk>
To: Eric Biggers <ebiggers@kernel.org>
CC: "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>, "David
 Howells" <dhowells@redhat.com>, Herbert Xu <herbert@gondor.apana.org.au>,
	"Luis Chamberlain" <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>,
	"Daniel Gomez" <da.gomez@kernel.org>, Sami Tolvanen
	<samitolvanen@google.com>, "Jason A . Donenfeld" <Jason@zx2c4.com>, Ard
 Biesheuvel <ardb@kernel.org>, "Stephan Mueller" <smueller@chronox.de>, Lukas
 Wunner <lukas@wunner.de>, "Ignat Korchagin" <ignat@cloudflare.com>,
	"keyrings@vger.kernel.org" <keyrings@vger.kernel.org>,
	"linux-modules@vger.kernel.org" <linux-modules@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"matthias@kannwischer.eu" <matthias@kannwischer.eu>
Subject: Re: [PATCH 1/4] lib/crypto: Add ML-DSA verification support
Thread-Topic: [PATCH 1/4] lib/crypto: Add ML-DSA verification support
Thread-Index: AQHcYWpl4vlpzYy0KE2uJTRFS1fqTQ==
Date: Sat, 29 Nov 2025 20:00:17 +0000
Message-ID: <A7135B59-BAB5-451E-AD71-971F828054F0@amazon.co.uk>
References: <20251120003653.335863-1-ebiggers@kernel.org>
 <20251120003653.335863-2-ebiggers@kernel.org>
In-Reply-To: <20251120003653.335863-2-ebiggers@kernel.org>
Reply-To: "20251120003653.335863-2-ebiggers@kernel.org"
	<20251120003653.335863-2-ebiggers@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amazon.co.uk;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LO4P123MB5121:EE_|LO6P123MB7287:EE_
x-ms-office365-filtering-correlation-id: 75f3540e-4b68-42eb-a69d-08de2f81eb1a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|7416014|10070799003|1800799024|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?929r9vNDMbRgStWg0+PTXMMrqbgu927qGvLX9IJjX4+8+7D0KRPxPNfy37i7?=
 =?us-ascii?Q?W30XttbPxX6n8hqT0vWfefLTBPwpq4q5GgUrAAyso4aiUysEm2p8hE/hIJI1?=
 =?us-ascii?Q?7HOX6VXgijB8p8/SKeIV1Ggu1rAuUr1ZUQuXL0ZaSOlKd2ZaSSt+F5RPGjEB?=
 =?us-ascii?Q?rGyAZqfU2kYCsRItzD4rQGynHEFqLK2LSYOcdRHJZ3P3lDAF+4+e04HNg3iV?=
 =?us-ascii?Q?pcZwz7JhzgRGkqGYDtiOZaXldMbIDK6tj3vykQQyQlyHDcBL0LIm36aB/0Ij?=
 =?us-ascii?Q?mkV6zoNRZ4fLEIjpGanq4uWjJWr8AZQW6EPuP3DzmVh3DmXBNDBkQUGpoliK?=
 =?us-ascii?Q?qbgEUHEL4VwKp/THmRuMpfVneOgiaugkCKKu1F/rM7zooAjvsZB1wCuY2mVc?=
 =?us-ascii?Q?sgAnh3SF0IrD1IkVjY2TjAPj8X/b/AgJzU3+ylbb0PUi/g1ief3hp17QEgCa?=
 =?us-ascii?Q?v67UaZrKuRaKCj5Fusz8Gphh1ZmKllQ+/bMGiuVcztEmKX071es28YMqliRK?=
 =?us-ascii?Q?NpoPVJhdaWPJxUhgvz+pBdeuLikPgofkgcTffsJRiuutY2kaFMnkjGTO1q5S?=
 =?us-ascii?Q?KuxGpetB7lYRDJ9QRlnxr+nkydaazHHyxdfj+B1ZaA3rwBIP6StShLQH5wD5?=
 =?us-ascii?Q?MM/G9fSpw8OQPvG9mnLVWkyfyC2BXWEbfFxAcNmIWqplEebuB8QEzygjLQ6Z?=
 =?us-ascii?Q?rv9inV/IHPrxGyBEOkNS425XkbPQ0ytOjO3sbm1ljfr0YeNUQ3C6BrUT38ff?=
 =?us-ascii?Q?u+u6U6uRoZcVYL6qV76v/CabaZ8FWmIIAHvAoYsnLONjoK4wALdwN4mWkMJ8?=
 =?us-ascii?Q?C7/YMVwkouCgW/TWP8aDCOljzWfaYU74JieRNr9JGI7hmL09zLgGQHc8YpSF?=
 =?us-ascii?Q?SEFwS5mhO7jMt+UyfKyT+7dXgnTSfjQFbLnSzCPe8WvECx+W3VIteMYt9Y0s?=
 =?us-ascii?Q?szJZ9rT0U2x51z3oySNuz7mj/VYnivnxiQmilHLUe+wwLNFCW24dvJcgB4TK?=
 =?us-ascii?Q?i870B838DYMIq9WGNZNn3RY/e/QV6kK3dxp1zMHpfv3zGzNazY4DikMUf2vg?=
 =?us-ascii?Q?g6fdxR7SWuWBXRM8ZGR5ufI6lvgp/8ktr9+Liq9mrpRT8xH84h0P5j+xlppZ?=
 =?us-ascii?Q?TTSdNcQyBms3RinLYvcjW3v+wPWJ58h3aWbYC039aZ10UB4OvMnc8dIzSLb0?=
 =?us-ascii?Q?kwKpcBrE7cqgI+6dPXk9xXRbiTEWVyvUMms+4hYfgwZqC/hFCW9vKLZB4S6W?=
 =?us-ascii?Q?52vvBm3p1TCRxMennjDDGyVX+zK8isj/7eHK796HqRZajX47tdC1yBazOnQV?=
 =?us-ascii?Q?xU6He/fhCAP3jTqmvVQdqAyHL5pVIJ7L1EPBIqBdo2D/otd8m6kfAqWbbUJm?=
 =?us-ascii?Q?CzrreOnD4rA0iCHQlowtIZjRJLxbkDqd/mCjU2HGUL9LvFokOJBAcW103faL?=
 =?us-ascii?Q?NhoiK4HAHvIx1iwmK/CfS5uyYo4tTcztwwtA7EH6I2O5wW6XJWmlrJ/FkaQ9?=
 =?us-ascii?Q?a7ffAYdknrmrkXexQudzLQY4T6rduTQNhLBy60DXloXvBfJK6+nMXzPU3A?=
 =?us-ascii?Q?=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LO4P123MB5121.GBRP123.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(10070799003)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?jAttTBzcJBIhUvecWxLklZ/oiinVZ4nyLX3B1Ff9JSnKzMX/NhQtqWhs8IzL?=
 =?us-ascii?Q?+Zli3pStSIKw+MctAdwX4gjslFZ+2OPLPHL9ggZKZugrWvD8TbfHRG5Zsu1G?=
 =?us-ascii?Q?m0HrRDLQH6sXLem0LMTRGAUkdP53mIcI5PBes6ASairF3BxJEVwKWNLTx9Sz?=
 =?us-ascii?Q?32DfN2T3JZe29RnJVhnuX2BK40lhHxW+CVawdhdLVw7AsHDGPF3XKplYFCGh?=
 =?us-ascii?Q?HXqu58LpZ0VY/c1Fv7byF0i8mXSf/qfcNW/VIjSFE/ugNHU4RTZvHxAbsYpu?=
 =?us-ascii?Q?+7qbXLtK79TXZVa7NLmBhws7Gxw2VoV3idPB57HA+P1g5oKg1tmQDnWsAgHC?=
 =?us-ascii?Q?IK/BhhlXvwiEkTF3BPqSSFoNYdmZwHyLv6JUFG/aIuzReZny26z3nTqQcyKf?=
 =?us-ascii?Q?WXbQIBtNepAcJO4bDQcjzr4gjj+IWZ5XK6QaRNhNt4BmrJAEbXnQYpJ/dvV+?=
 =?us-ascii?Q?husuAGKA6Pf0BKSSIR51iZPBPDhGzKQLODsTjHzc9xY7urD+tWlTaLsZjcfl?=
 =?us-ascii?Q?N2xOOMLxP8s1hkvR1a3Kkkp53uVMKDSsY0Wjm64Loda+rbrEohs/EUQg3V+A?=
 =?us-ascii?Q?DAXTblVg6VUPCzZQD8a4EVFePGzypmT+zi5U5UdfAJFMhZdN/gW1iVwzmgY7?=
 =?us-ascii?Q?acikDhJVQTHcYrd3eT7d9TFD2JQmni4XcfqHTGRq1V+vy0sodWqW27UwEV5g?=
 =?us-ascii?Q?ZyJknjDOM8Ao5QhPGPfN9gfKUXwrEy+DmZJI0BLRn9Kw9Y0r1Mev1ao6iH0N?=
 =?us-ascii?Q?doKT0RVOHCspAq8dsk0k9KBHNlUYDL8EWkvYIiOedP+FCQjOpLSWjISGA8gs?=
 =?us-ascii?Q?8KtTMDQHTEU0RnQnDnl8Dn2Rhhiv3rPnnzId1WyQpJ0ktm6bSzpn6nNPaEq7?=
 =?us-ascii?Q?OIoR48Kl/B9PGsUB38HNc+zpofGGKEph2OXs5ZsAmHdbP8Awk0l/ak0/nxQE?=
 =?us-ascii?Q?WMlmxKhrx0XSYOF1VkjEvsWZepciYCxMCfSq+HbjAx9VjAs+5sjTKpgAlMHW?=
 =?us-ascii?Q?6yuQxCvj2ttGZ7lMDRNIGgX9pnow2YkDiS9g3Yb/NzVThPQx6LU2BOt5+lB/?=
 =?us-ascii?Q?jWpNeuAwhhJSzRLWZ1oFw2gmoeezkksO0+ihA5a+6pH/vtKWlHTh0VRfc6kI?=
 =?us-ascii?Q?QSdDAHVuyGAQkAbxiCnO7UrhbY7wWWYKs1TGKyzuYT22nl6dxFUClA6wQCX7?=
 =?us-ascii?Q?9a4yiE2v+nY6SabbB3GyEzt2Zqbg5i/bP9ol3JQQ9kgxEZvTOdFGceL9d56V?=
 =?us-ascii?Q?ZM70GVamYDgPA9wIVPvponARePa6VQsLTsY8zkQ1b2tfhO5w2khIT7W2YIwP?=
 =?us-ascii?Q?Sbi3FVJbSK7OaF/pkflgyFgPGudiI0K7l2d8gR8DO4+hmof0jl9JbQxp0+oX?=
 =?us-ascii?Q?Mr/qXJMQCLef0EaYH+MrvZEh5kJZVXVPIY4QodMze5/vhmr9MKfnGVAoigfW?=
 =?us-ascii?Q?VW0O/Rh1Q/ac/SBHOYW3bV7Hplo2bL6pCKz4kS1mJWu05Xui2rdjjekwUz3q?=
 =?us-ascii?Q?v4OazmdOO9vEDYCgOF39H+3LfkAA6UCBMkfNQLmWmhoelc/kXlA+gV+KklyA?=
 =?us-ascii?Q?uJeCWQ/+fj9zRFppwXhtpsUk6zwT4BmOZzz/IHt8jxm++rSuTAXpnpc9V042?=
 =?us-ascii?Q?c3uIS3pDCpfqU/jaCaNF/CYPuYgCxet0I6IXOOuaWseyAc2L/l7ikgbvWyLk?=
 =?us-ascii?Q?fpSnMw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <68E8E40B78616D4BA292F438C81CAE61@GBRP123.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LO4P123MB5121.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 75f3540e-4b68-42eb-a69d-08de2f81eb1a
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Nov 2025 20:00:17.4500
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5280104a-472d-4538-9ccf-1e1d0efe8b1b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6oeFl/EwpKEoomLzgtyA8+KdHPm1wPGsfGJFQ8pNZTOyZ+sJ0Rr6+7dyA3j7rdubmuDepirLzL+FG1RilXw/Uw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO6P123MB7287
X-OriginatorOrg: amazon.co.uk

It looks like this may be close, but for the record:

The LF has a dedicated project for ML-DSA: https://github.com/pq-code-packa=
ge/mldsa-native (part of the Post-Quantum Cryptography Alliance). It's deri=
ved from the reference implementation and adds automatically verified memor=
y-safety + type-safety (=3D bounds-tracking) and a uniform backend interfac=
e for assembly optimizations; see the README for more details. It's license=
d under Apache-2.0 OR MIT OR ISC.

If you are sure that the kernel will never need sign/keygen support, or sup=
port for optimized assembly, the current ad-hoc patch may be fine. Otherwis=
e, the challenges are likely just delayed, e.g. how to safely re-use parts =
of the current code for the timing-sensitive signing, or in contexts with o=
ther bounds assumptions, or how to integrate assembly optimizations. It may=
 not seem so, but this is difficult to get right and where maintainability =
gets challenging.

Verification here is a vehicle for maintainability: If you change any arith=
metic code -- say you decide to do less modular reduction for performance -=
- you currently need very careful review that the bounds still check out in=
 the worst case. In mldsa-native, this is re-checked automatically.

mldsa-native is production-ready and in the process of being integrated int=
o Amazon's AWS-LC crypto library; the sibling-project mlkem-native https://=
github.com/pq-code-package/mlkem-native already has been. mldsa-native is n=
ot yet a drop-in for the kernel, however. At the least, memory usage needs =
to be brought down and allocation be made flexible. We're working on it, an=
d if the kernel community was interested in it, it'd give impetus to accele=
rate the work.

This is just so you're aware. If mldsa-native is of interest, let us know -=
- it would be great to collaborate across the LF instead of duplicating eff=
orts.

Thanks,
Hanno & Matthias (maintainers of mldsa-native)=

