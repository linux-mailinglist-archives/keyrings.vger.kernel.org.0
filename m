Return-Path: <keyrings+bounces-3444-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C85D6C8C06F
	for <lists+keyrings@lfdr.de>; Wed, 26 Nov 2025 22:29:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id ACB234E248D
	for <lists+keyrings@lfdr.de>; Wed, 26 Nov 2025 21:29:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60F922D6E7C;
	Wed, 26 Nov 2025 21:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b="eaSBU90C"
X-Original-To: keyrings@vger.kernel.org
Received: from mx0a-002e3701.pphosted.com (mx0a-002e3701.pphosted.com [148.163.147.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38C9A149C6F;
	Wed, 26 Nov 2025 21:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.147.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764192588; cv=fail; b=NQFIKDEk8T+hHwZYT9FmdaShcLG6aFwe5S5w+9KFBZsG1Jpdcs/YCcXaxQM65GZz8N1rOuRAOb0L1CljYFaZVUlVC3oPAcva7w3I3+YWTb70lDMT50VlSKUJCrL7f9rcRaW09QLM94d3EVS2SWIxBS0NlNTMk3Hq8SMwnQPxCIs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764192588; c=relaxed/simple;
	bh=fx8Xz1PVgfXS9qTa3wS+8OF5c7sk9vfeS4XszAbIviU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=GTw/x7aR1ACnH/YmkTdmL6LbWj4ccMXS8Bl6R5nE0p4+TcbOQXCaE2zwEa1wetmc+Dg1M0SG5RZlzbjpMvxn0kfgijtkTSbeu0cszQk4/UX8jypXuBXsJBRqH/jIfq8xdM8A0kYcnD2PUZIDXzBe+jxOzsYhi2hE5oCu33MtrXM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com; spf=pass smtp.mailfrom=hpe.com; dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b=eaSBU90C; arc=fail smtp.client-ip=148.163.147.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hpe.com
Received: from pps.filterd (m0134421.ppops.net [127.0.0.1])
	by mx0b-002e3701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AQFdVAB2241669;
	Wed, 26 Nov 2025 21:29:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps0720; bh=OD
	9BjvSJ6/6CcMmQrniXUGWrFBcon0W5RrAfZ/XLy3M=; b=eaSBU90Cp3w7oRVnIt
	4ZzJylAoDH+GjzNMjrYJF8VaCuUITcaXXvKjgtgt5Ld1QM2UjoAlivad1MTWUu9s
	FvODl97u0fkkhemCs3/ReQHg6l+RPXEdVSD8GYFG7SzKX8/24c0VgRtWXXUXOHxn
	+Kc22YHVV4LAI/u5fEg1eBuSgof/IQcSkg2Z5BjfHTn4AMHDrQQ0oM+gPGD7uOAK
	vrp+R0OlC/GZpSKv2FflLs3fFqCsrs5FzJfob5V3Ltkih5/wKl3WbHxVaVqoVQF8
	KrVzY2I2rgBbEOAe2vVJO//oNDzPk9QvQEPKmgHd5NIoiDpwbNEvRone2CPZueKY
	wiow==
Received: from p1lg14881.it.hpe.com (p1lg14881.it.hpe.com [16.230.97.202])
	by mx0b-002e3701.pphosted.com (PPS) with ESMTPS id 4ap4cm3188-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 26 Nov 2025 21:29:16 +0000 (GMT)
Received: from p1wg14924.americas.hpqcorp.net (unknown [10.119.18.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by p1lg14881.it.hpe.com (Postfix) with ESMTPS id 0991C805667;
	Wed, 26 Nov 2025 21:29:13 +0000 (UTC)
Received: from p1wg14928.americas.hpqcorp.net (10.119.18.116) by
 p1wg14924.americas.hpqcorp.net (10.119.18.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 26 Nov 2025 09:29:13 -1200
Received: from p1wg14919.americas.hpqcorp.net (16.230.19.122) by
 p1wg14928.americas.hpqcorp.net (10.119.18.116) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 26 Nov 2025 09:29:13 -1200
Received: from CY3PR08CU001.outbound.protection.outlook.com (192.58.206.38) by
 edge.it.hpe.com (16.230.19.122) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 26 Nov
 2025 09:29:12 -1200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dS6KI3Xwy607JILcqWSSQBcKZSh+LWP65JPEwouIRCXJVu1ZCZjY2vAQgqh3pzSR2aNZVjHeY/ha0E0VoiahtbvoflYqQwIjFkXP0puo0eHTCAF7dTf8hyAabsEz5ivjiUqmxvZcPsIJg8GtUnvPJPTTsH45FwH4TSP++vtzy8ODJ1/hWD0puQz/TwN+pwIVnn1Ib9YoMz6yh0mU/H2eKwG6nCyIIUoT4kKcskfFq3Ylc5Ik8SOc9DdLNoaf2jeS9QILSbsOAWKFNKpZjh8d3B/B0NRsVxayd8/lsyhHXze5R/MZOShw5OKZcy/Q/DGD3BImKHz+tBm3oJG/3L2pjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OD9BjvSJ6/6CcMmQrniXUGWrFBcon0W5RrAfZ/XLy3M=;
 b=USwrJE64nJDAzAg3QkKgR2Cz5BwDzRg8o28+SWm8OBHh1t8b4R0U906d+O1R1W+iZdgUmvKpa4Kfy0YvCTdcTvlnSuOq/tPscymbn0K8AwknYcnjgPAD/2tixtHBApboudMGYGSXnc800dHkzr36QkH/GBsGTruBtINHcjcVL/2C1GVHSLtNf3iHSQ6zXgVtjjT3VcURU7T1OJrY69tbse+JywQ4cvMLuHM8BA3QVkNkmsNK0sEQexRK3tm/Ti3rpCmde/YlDi52YAjGyVO740nABYqpxsiBuARgg1qsYZX5mU14vmUBwELNXA5EUcuzR6syRSl5afSNYiHpoJFVOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Received: from IA4PR84MB4011.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:208:54f::12)
 by SA1PR84MB3264.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:806:25f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.12; Wed, 26 Nov
 2025 21:29:10 +0000
Received: from IA4PR84MB4011.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::766:753d:9ff8:1c8b]) by IA4PR84MB4011.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::766:753d:9ff8:1c8b%4]) with mapi id 15.20.9366.012; Wed, 26 Nov 2025
 21:29:10 +0000
From: "Elliott, Robert (Servers)" <elliott@hpe.com>
To: Eric Biggers <ebiggers@kernel.org>,
        "linux-crypto@vger.kernel.org"
	<linux-crypto@vger.kernel.org>,
        David Howells <dhowells@redhat.com>
CC: Herbert Xu <herbert@gondor.apana.org.au>,
        Luis Chamberlain
	<mcgrof@kernel.org>,
        Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez
	<da.gomez@kernel.org>,
        Sami Tolvanen <samitolvanen@google.com>,
        "Jason A .
 Donenfeld" <Jason@zx2c4.com>,
        Ard Biesheuvel <ardb@kernel.org>,
        "Stephan
 Mueller" <smueller@chronox.de>,
        Lukas Wunner <lukas@wunner.de>,
        "Ignat
 Korchagin" <ignat@cloudflare.com>,
        "keyrings@vger.kernel.org"
	<keyrings@vger.kernel.org>,
        "linux-modules@vger.kernel.org"
	<linux-modules@vger.kernel.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v2 1/2] lib/crypto: Add ML-DSA verification support
Thread-Topic: [PATCH v2 1/2] lib/crypto: Add ML-DSA verification support
Thread-Index: AQHcXxRHHQmwOqUncU+szik/6P+x5LUFdAWA
Date: Wed, 26 Nov 2025 21:29:10 +0000
Message-ID: <IA4PR84MB4011F4D5B7EF52901829AD94ABDEA@IA4PR84MB4011.NAMPRD84.PROD.OUTLOOK.COM>
References: <20251126203517.167040-1-ebiggers@kernel.org>
 <20251126203517.167040-2-ebiggers@kernel.org>
In-Reply-To: <20251126203517.167040-2-ebiggers@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA4PR84MB4011:EE_|SA1PR84MB3264:EE_
x-ms-office365-filtering-correlation-id: 067500e2-8538-4e64-712f-08de2d32d656
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?7FEGznLRSvXpeNBs3VjFfBdYV5oKNCkmBGPNH3e1qddtLivIgBLQPaLw2cpm?=
 =?us-ascii?Q?mPjI1hHLyhFDXQ7TKdLF4J8HF8Ik3DlkycCI3a5a8WlwstY6MMxTK89q4ceB?=
 =?us-ascii?Q?+uZwAtXRMaApywU1SVNa4FPDBSVezmLQAo09IUPInSrLjOaySuCwsOvMv0rL?=
 =?us-ascii?Q?1sZeW4m5rNTKF/UHZRbiw9JXvAjEcG/YnHnwcoBP2WrOP6j+Gf1x3haQHL0l?=
 =?us-ascii?Q?d5lDoQmhmThbsHsJ9IYEhCCdf36U7te2ya/9SBczgqQa9xV7zCKmkOImCHlT?=
 =?us-ascii?Q?K/GQIQr47zEt3o98kbnpXZvpLoTELnWoaaO+0TJ2UKgaiVq7tSpiVfslWoVL?=
 =?us-ascii?Q?xbgcECvLzqyclbeJ4rOKKijVJVOHAOV00Txwl1nwEc44/oJBN8exR5GpiPqT?=
 =?us-ascii?Q?yLsytfTADaLkUcrjUtuY9g1CI9pEYO1WeusOiHSxsLwPnyM9+1bEDeXYF+FX?=
 =?us-ascii?Q?8DXk/4J6N11UYWIKmNsYuwQbaGle236eTcKLg6UOYkoBuvj4domOIg7lVrPH?=
 =?us-ascii?Q?Dso2fgEJ4CcUP+hgQS0n7BFL6/7wp9c6XgzvCz8AXG2CMkYSUSyzFhkrFT2X?=
 =?us-ascii?Q?9Jy98El1lW/aafm5Dfjp9QgxzTWmJu4NhiJT1TP/TzcZFyOaCvFq50ZgF51m?=
 =?us-ascii?Q?+tEN2ugFJtgNV9jUg/Q8KdMW690AjPyIbZTC8YK3RMEfKfu/6wAN6R592Fsn?=
 =?us-ascii?Q?BUJY96r7dDhrOILer+5o+v9oIW0MTx886vrPPnWckC7XqIMb20FdHEHopzfm?=
 =?us-ascii?Q?G/60F8P3jDmohRRzmGg5WHZfv/AHGGw71XrPgoFPbGwz+BkRnULNxh3BupKl?=
 =?us-ascii?Q?cqjt/eoWW0VwxTsEmuvq8RvsQSsZ0QZ6cNv0/oz2Hx2eHwTPu4jq4SyEUcEp?=
 =?us-ascii?Q?ptvWYMF6Db6lxRaQ6XeuXDb/3e1t8x/iLce7C2bd3ZgKX3ZTNyUW98kbOopg?=
 =?us-ascii?Q?yi8TH2MLJEUC3LdslQ/9i2lkYS7wce5ljauzM+70sORSzZwEODM7J5XWbu0p?=
 =?us-ascii?Q?xbPizQhx+ORX+zSVbT2/Tr9Fikbla1iRwFeHqYyEGR8ey2vnlU+WrL2JwT2v?=
 =?us-ascii?Q?rH12skJ37ULvve2B6D/UqKiUMMp4+WQtOdgteIfw4N/sajdCQ87agwos+wV4?=
 =?us-ascii?Q?tfUuVCe4+kbakylAPULC+MgPlWXSlUxdryOeAeDlh2xwjWM5Mqqd6DkQQ/qD?=
 =?us-ascii?Q?Xs5KDt2zodRdvrRaVt+5PS2O9DJnTIqhhPf/hEU2TZQUlyHVL7NrvIEtPqxV?=
 =?us-ascii?Q?ZgP5U6v8Ro1siTtzaIBV3Qth94snpoPF177DBy50wHXGr1vR2DwXWYU7Ty9v?=
 =?us-ascii?Q?DeUIKRGIUOlfMtGG1nd+RMM6/wvqGwR1Kq4yr3J5BwAR3lvNPGVwgVt3Nd2w?=
 =?us-ascii?Q?olh/23SXItIC/IJQoBaqKBWzVFuxrUWUx9rsgJXfcuLZccvQcj5Vq8A5kQVq?=
 =?us-ascii?Q?hJc3NBdOH/vs/CD44UGR2CxRG60GwUIITqGfvv9y9R4hZxvdNDT1IzWBC4BP?=
 =?us-ascii?Q?1eW/t3yW4T0b2dX8NNngFSEZlGmZCaJwXKbX?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA4PR84MB4011.NAMPRD84.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?13hWDP7gCEHyvkt79iVjB5OM+ms+qRE2hmFzSNFgn05jMLm0BIYVM9ApPqxY?=
 =?us-ascii?Q?IviUyv16iIZ9vVA1OKMRbRG/fkx9ucFXKH7s+FZlxwlhLD62nOCo7XBzwAUX?=
 =?us-ascii?Q?VU/Ek0PE7xyOmH53Xksltcq5xIpMvjo7hscULDMM0nfvhAggUfjkYCcfrg7t?=
 =?us-ascii?Q?+WNYTRqVmnfFhPeZ8T0X75bdulC+OjCQUGN55diKXCgmTFdrskkFw7C+mdrF?=
 =?us-ascii?Q?65O+7upm8VSREtwzJ1aWxZAmOM8ICjLcfooBZun2TD2ZwJPtgVUTZDOzXJKd?=
 =?us-ascii?Q?oWwuYGy9Jkct09XstsWKoyMdu89b1y0cCUg5HaLHHkO4qUfnd8DWlTjwTlqY?=
 =?us-ascii?Q?BnjMzHQFzE10U+o2hik+UlO9X7F6n42Ysieugs21ZHijCgJJ+RPtQ+rtxqPb?=
 =?us-ascii?Q?gzt/P0j6tkUMjRb33NO00l22jAPnyqgPpshoS2ABHk3wd2LNoNUGWUgrOyX/?=
 =?us-ascii?Q?jn3Uw0YDPevgnfqYwAna9K7E1q1GG6yZmqP0l5MHx8fiVNiSVdHisdZTqi2n?=
 =?us-ascii?Q?Y2tCxM/xTvsV3dp46/BpBjvJYv793XN9UV9DN/nQM8tfuPuhebUVWxE5gw0q?=
 =?us-ascii?Q?S7o0opn7dKXxE1v2ZG0LcL/lkF8TcX8CxJvxJEl+Rqgg6Bv+p6S03OHirWG+?=
 =?us-ascii?Q?7JgpSmEv7N5OxNfwVB2lt4YB519hubI1t2YkqqDHDnVNol0F1GulJhO9HiQy?=
 =?us-ascii?Q?RyM+Sjl9hYmwDMfVdyLCeKiYvLPQGmoGz8WKuQ2JYBxp5Tjp8+EJARiWqUIP?=
 =?us-ascii?Q?Q/m5a89bDtiH6zXQtzJmcVQLQxHh+YFOXWxQHUd1SIedqFcLNQpXK9bpPsfi?=
 =?us-ascii?Q?Mha0+rkMAURMmX56ejwfoH+Xwdpdee0tK2xWJACTGay7UhfndeU+ySzcmrP2?=
 =?us-ascii?Q?Sky85nmcn2iReoB8IH4xhG5I6GPuByZ3XxfW/F3IT4RvTfGCJ9TOAbwGAObd?=
 =?us-ascii?Q?U0a6LuTPWHUXxJWAWz7AyeIEdNpKNLxwTWnwB5LAdm/bDlvWh7JyX7rIZFDE?=
 =?us-ascii?Q?Ft7RK3QBk4fl0z4xS3FkBd8XRDH8rn2UoN5uLkJM+V11zhM//YzZNITkKxZz?=
 =?us-ascii?Q?V/gEqs4/Y139XA8izEK9m7G0gK9DC0jcgzIud3rOcsB0mZBjxChTFDIB4G91?=
 =?us-ascii?Q?5UMQYHQgEBLvJLP6a8ppUZLJaMpJVv77xlwbfHOv6/Z2J082Nd7x3BXoqT7/?=
 =?us-ascii?Q?hAH0jz+k5DkHoQzABJTgRPA4kv1ljY/kM9jtyxNerwO37mc0U6vysAcW4muH?=
 =?us-ascii?Q?3hVO96tnBUOFkvv+HmNEERvebvhQqj4fB5D3tIJkDPBxAufEYRZ3tr10MdFU?=
 =?us-ascii?Q?lODgkd0BoilJ1itIv/MpIesbINVmqXw7eC/H6QVF5e2P+gaAUB+e6dnq5ebM?=
 =?us-ascii?Q?KjluErabu3r6RZcfDvfOa4LbLM+53/53/rJJRUaBijWqgBjdhsLmdBk2bshJ?=
 =?us-ascii?Q?42ryVbC0ZE2KOa9qOd7slrSTyh4L+uTB+lPVw/OMXPYGhASGjgO8YUBSn/qs?=
 =?us-ascii?Q?2DM5OWTRvcmXATs3dSW89c07b5xnDtRin5mS29nOKRUMa6kcWeEYvrhqSI/g?=
 =?us-ascii?Q?i1AJbfRqXHYsepLv8yY=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 067500e2-8538-4e64-712f-08de2d32d656
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Nov 2025 21:29:10.0432
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dWJQ5VBF6ERKdRgistPwOMsLyl0EGPq7q4h0tj2mbq4tpHF0DJKB63DqO5DBLfPA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR84MB3264
X-OriginatorOrg: hpe.com
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDE3NCBTYWx0ZWRfX1O1X0RCs+BNa
 EJsBBj9/0eLpTM/mkJSiW8k/jb7U5eQPj1hQ/hTdZa15lfMxHrnmBZ9RJmI2j3wgJO1/tfXWkK7
 heOK36KLcv+sTNhWKNDECJ1IcEcE9D3x0dNICKsGF+3pWOhT455+hWlnEEBqME0w2YiUwdX4Osp
 ECw40DmeUtY7U3+iyyelxcBIGGBV9dHYcGMkY7KbKh0Uv5hbzg5I+R3q8HGIQUVQ0hn3VUgBUYv
 dsKKCVJtdeItV/ABWJlBxkM6Y25grPSk3pbQOk1YGBSTF10cs1a5OyA/IhoY6IWnTRUtR9FLWx8
 lv5NASzSO8CK+OGNV2RVqBORJ6gDYY1UHbi6+UBkYWWaGw7LWL2YlbL01E37B6wj3Hwy1yfbG2e
 USPZXMx2cOnT3aDmR55hQPombLpDnQ==
X-Proofpoint-GUID: ZpIDNWToePfWtbbR1qumTDOa_mpqzBTC
X-Proofpoint-ORIG-GUID: ZpIDNWToePfWtbbR1qumTDOa_mpqzBTC
X-Authority-Analysis: v=2.4 cv=Q5bfIo2a c=1 sm=1 tr=0 ts=6927712c cx=c_pps
 a=FAnPgvRYq/vnBSvlTDCQOQ==:117 a=FAnPgvRYq/vnBSvlTDCQOQ==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6UeiqGixMTsA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=gcRi9byGnSU8lzZet-wA:9
 a=CjuIK1q_8ugA:10
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 phishscore=0 adultscore=0 impostorscore=0
 spamscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511260174



> -----Original Message-----
> From: Eric Biggers <ebiggers@kernel.org>
> Subject: [PATCH v2 1/2] lib/crypto: Add ML-DSA verification support
...

> +++ b/lib/crypto/mldsa.c

> +} mldsa_parameter_sets[] =3D {
> +	[MLDSA44] =3D {
> +		.ctilde_len =3D 32,
> +		.pk_len =3D MLDSA44_PUBLIC_KEY_SIZE,
> +		.sig_len =3D MLDSA44_SIGNATURE_SIZE,
> +	},
> +	[MLDSA65] =3D {
> +		.ctilde_len =3D 48,
> +		.pk_len =3D MLDSA65_PUBLIC_KEY_SIZE,
> +		.sig_len =3D MLDSA65_SIGNATURE_SIZE,
> +	},
> +	[MLDSA87] =3D {
> +		.ctilde_len =3D 64,
> +		.pk_len =3D MLDSA87_PUBLIC_KEY_SIZE,
> +		.sig_len =3D MLDSA87_SIGNATURE_SIZE,
> +	},
...
> +	union {
...
> +		/* The commitment hash.  Real length is params->ctilde_len */
> +		u8 ctildeprime[64];
> +	};
...
> +	/* Recreate the challenge c from the signer's commitment hash. */
> +	sample_in_ball(&ws->c, ctilde, params->ctilde_len, params->tau,
> +		       &ws->shake);
...
> +	/* Finish computing ctildeprime. */
> +	shake_squeeze(&ws->shake, ws->ctildeprime, params->ctilde_len);
...
> +	/* Verify that ctilde =3D=3D ctildeprime. */
> +	if (memcmp(ws->ctildeprime, ctilde, params->ctilde_len) !=3D 0)
> +		return -EKEYREJECTED;

Is there any way to ensure that each ctilde_len value is <=3D 64
and <=3D the corresponding .sig_size value at compile time so there's
no risk of overflowing any buffers?


