Return-Path: <keyrings+bounces-3392-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 086EAC71D9C
	for <lists+keyrings@lfdr.de>; Thu, 20 Nov 2025 03:29:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by tor.lore.kernel.org (Postfix) with ESMTPS id DDF7E23FB5
	for <lists+keyrings@lfdr.de>; Thu, 20 Nov 2025 02:29:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB4EC2D0C85;
	Thu, 20 Nov 2025 02:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b="OaxvIi98"
X-Original-To: keyrings@vger.kernel.org
Received: from mx0b-002e3701.pphosted.com (mx0b-002e3701.pphosted.com [148.163.143.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3A3B135A53;
	Thu, 20 Nov 2025 02:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.143.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763605793; cv=fail; b=CZOXb6MN9GKwZhIFjN0IMeSnGUsCBEa1V5W74PB429aBuBWQB1Y1cb58NetYzEou9NYzfoVmEyvCAGjvN6oOresHo4V+Kfn/R0ld8J5L4u6/xFt1Mlo+Fk8BvAvtyMD+PKUwYw0L5stTqrZ040ave0z2ejdL9u/4Y5V/zocH+Zc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763605793; c=relaxed/simple;
	bh=JbOxmMBUr6qr+Dsu68aNBBPIZmcmPl2ZUaaW/Q9r+iE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=tDPsqTcqb+PBVXmZXVYlHDk8ZdOY9Rn1lj3C/aF/gpwLou3F944UY/Itt6p1YZQ+y/zb7ZMb9y41ggBqkjYnsZ12rQN1+P7+tzALEUIXpeQyvln52RuB109Cx3Y6YzoAuDVog4GbRBDsvttz08lK+oj4EJELs/Y+tc3NHsnGfX0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com; spf=pass smtp.mailfrom=hpe.com; dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b=OaxvIi98; arc=fail smtp.client-ip=148.163.143.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hpe.com
Received: from pps.filterd (m0148664.ppops.net [127.0.0.1])
	by mx0b-002e3701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5AJHb38O010882;
	Thu, 20 Nov 2025 02:29:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps0720; bh=Pk
	2Xk9SSx/fIQtY3S3ANEb53BQE4SIfszsiMqRjDkxE=; b=OaxvIi98Qememxv0iA
	e6zmgrUjCgH1LC3Etpw6MIXCa7AlzBRIQtf2id4HHsb/B1JgiMJl29r8iOSCHvlf
	4wPPVRfqA6mv5ThKU0Hd3dQzFdDDFbk1x/puw26Uv11KXFOXcWEUNteKqpLfc7V1
	+DaBqHM5h+XBOUCR2qZ60J+fH3hH/i9aoSJQ1ra7AD1s+2fHrn9N6cS4cQKin9nM
	naDCvundRu7JJF4FGSIfdJ5gmQj/+dH3Ciuzfd1r8zsCQpV4dnAiMwp8TFlPrJvn
	5KVd+6LTcQx4CL2cuVh/Km37lC/mKBHWdGKvN8KreU6o+T9tJuJXyCBMxIsTTrX3
	Ii6w==
Received: from p1lg14880.it.hpe.com (p1lg14880.it.hpe.com [16.230.97.201])
	by mx0b-002e3701.pphosted.com (PPS) with ESMTPS id 4ahg21ensw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Nov 2025 02:29:15 +0000 (GMT)
Received: from p1wg14926.americas.hpqcorp.net (unknown [10.119.18.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by p1lg14880.it.hpe.com (Postfix) with ESMTPS id 6747F800254;
	Thu, 20 Nov 2025 02:29:13 +0000 (UTC)
Received: from p1wg14926.americas.hpqcorp.net (10.119.18.115) by
 p1wg14926.americas.hpqcorp.net (10.119.18.115) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 19 Nov 2025 14:29:12 -1200
Received: from P1WG14918.americas.hpqcorp.net (16.230.19.121) by
 p1wg14926.americas.hpqcorp.net (10.119.18.115) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 19 Nov 2025 14:29:12 -1200
Received: from DM2PR04CU003.outbound.protection.outlook.com (192.58.206.35) by
 edge.it.hpe.com (16.230.19.121) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 20 Nov
 2025 02:29:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fzdunvi1rdI5e2PCWsc4xcGdm9cSkEdMoGp24oNKdJ/dq4Hicuv44XBB9sLdZEdWpOAUmcZyVVe2HnjKEuT4k/sqFJ8l4X+OyGBvfSZDw/Py9FbET/0YSb3fD7kyXk6XqDcN4MzEzL1uU4r/94W7HGZGixgp4cjKNFLuc82RkrnIZDVumw6C9MkB5VOBgkrl2ZNfDCIbKBoeHvAW9LT8v2gZ3FmAZ4piCBdrDkz8K6okvmCTO6pXbZEdyRApRit/UCuaSYDH+2fGxG5hsevKeig5R6NDGu9jzmR5NQU3YRjh2pDwSYWnhHUuUnvkklCJmz2RjxFd4CMsahzTm7+wuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pk2Xk9SSx/fIQtY3S3ANEb53BQE4SIfszsiMqRjDkxE=;
 b=eZ9OXhN+amQFjo6uHlgpCKJxqGtZifiJOuJKvKUdSZTmmtp5nMwdlx/Y/4QWVnslDkixADsX0RdwRwkA5BwSj388aqzPXPA/PjYqNZhIPM4DjmMJEILBYefm6Qy0VH1jPKH1He3BRBsyE0dhvQxeeymayJDh7t6+Y6HZfHtzrKrjWHzCs073z0lwXR321LHOhdgNTtzSs/iz6y2lTdUDO6E6VKZHriuebSY4yZJOUCHswVO4D9vkGtlkGRlyPfVzaH3Zch/LU4/q71aiffE7qm+BAlz2FyN1kJe4Kj4nL4pakn7QLwEhBRkd28gLsVKDG+AV+d5dTXfkQBhvo4hClQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Received: from IA4PR84MB4011.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:208:54f::12)
 by LV9PR84MB4008.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:408:2f1::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Thu, 20 Nov
 2025 02:29:10 +0000
Received: from IA4PR84MB4011.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::766:753d:9ff8:1c8b]) by IA4PR84MB4011.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::766:753d:9ff8:1c8b%4]) with mapi id 15.20.9343.009; Thu, 20 Nov 2025
 02:29:10 +0000
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
Subject: RE: [PATCH 2/4] lib/crypto: tests: Add KUnit tests for ML-DSA
Thread-Topic: [PATCH 2/4] lib/crypto: tests: Add KUnit tests for ML-DSA
Thread-Index: AQHcWbZqxJ3MuJzK4UuM43fEwkWrTrT61EIQ
Date: Thu, 20 Nov 2025 02:29:10 +0000
Message-ID: <IA4PR84MB4011DD869EB624399BD9AD7FABD4A@IA4PR84MB4011.NAMPRD84.PROD.OUTLOOK.COM>
References: <20251120003653.335863-1-ebiggers@kernel.org>
 <20251120003653.335863-3-ebiggers@kernel.org>
In-Reply-To: <20251120003653.335863-3-ebiggers@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA4PR84MB4011:EE_|LV9PR84MB4008:EE_
x-ms-office365-filtering-correlation-id: 019ac69b-d7d8-48d4-418c-08de27dc9658
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|7416014|366016|376014|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?SK3WLGbqH99TWGIQRmytVBsm4Wlg1OznqWZ4naPeGnk9zAnK/1pNmhft+Roj?=
 =?us-ascii?Q?qyRhZLykHxaqXu6qnFOTiC2Rn/Ox7Lj1d1DEp5sJn422MATiWeuGpAZxIUTy?=
 =?us-ascii?Q?B7m+B+E2R0JwRf74e5gQUQVj24Es4bQPFt/H0gdPPnK+Zf5zAFJaYtVy6k+q?=
 =?us-ascii?Q?0GBJWVzmzy/XuEJvW14IsoZrB1k15sfAAZtwOohOvSio/pkG9enV5hTifwBi?=
 =?us-ascii?Q?LWQuAph/L76JQRQ20UBnxghIMn+vz7o2BhSWOPg23286S2IJMpeH1oq/E5hB?=
 =?us-ascii?Q?F82xJiEwcYDZNFugoB8Xn4/1kISaTLXZWlwmyJb7zbTt02UwF9NjaqDSccz8?=
 =?us-ascii?Q?chXy0Vrkv7Ejx/MloSjq/lBRESB4t3G6NpMAF7FLZYNxqoTCTZNhze/9JbnH?=
 =?us-ascii?Q?RsEILLnSbXdEBtgX1PbD4LCg4dmVKbBcoNOcd01Jm6o42kz1rW3UFbCuR93/?=
 =?us-ascii?Q?2lafn0FLYivcXtCguDzUIDL1xEY0QfY8jSWchSGQ9KSJjt0+aZEY7K0eNuW+?=
 =?us-ascii?Q?VKCRBBS/TthonK3+kLxxa2LjPvBkzLc4hFpUz40X5KPL2xigIWK5gabH0+gD?=
 =?us-ascii?Q?9ZI5gbC4+2dNO5QpX6jWk23liki28gfZkyO2EO5WoPQ8S+LqaExn/6inWSUR?=
 =?us-ascii?Q?jH6I0+2vahVe1zQ5A5W/gx3dVh+D4e4pTCjpbaew/IYnQw0tt8VZf6HZurUe?=
 =?us-ascii?Q?iWtcH+bO29E1zGlbMoHZzN+9biMqp7QsEhbXj/k7dH9M7ACTLA/D/jl2xNL7?=
 =?us-ascii?Q?WE4y0I7xbTvGzGxbcJMndI+Dwoj3uALh7MEkeCdTI/CDCj3b2gqbts6PfRG0?=
 =?us-ascii?Q?XTfjURas1pyNLMUlzLX/i8JmCTb7CrVsrn9UWFinVdgBoUkWKCuqpPn12d0g?=
 =?us-ascii?Q?MKev1Zpjf6xd1ac5NZcpbHoNvcaYoY2dOQ6HakQFVsaI8+Mmu4YFjeIKK5tE?=
 =?us-ascii?Q?iPk8VTJdQkjxyv+zegvn8kyaw1W5YtH1gzw/jEgSuBdZ90RLHWlI/APQx60z?=
 =?us-ascii?Q?++PNlvVYD9TERYrTkO0rs0NsqFF4KGx5DGjoV/OacV1TxKn2Vv2easwer1cq?=
 =?us-ascii?Q?56BEaQqcrnHJ3nFygKqoStj6SbFvaBlJtwaY9ArPwW8k6clUbzG0yMl4DOLe?=
 =?us-ascii?Q?COvhaAUui2LvnPljCRNTmN8P++/c87MNVKCrKFUKoPpswSiadIGxYce5cNtg?=
 =?us-ascii?Q?KOat5gY4msevLj1vuK1kvZRSXZjFn7M1bXM0oDks5ONuqA0PslfeH52r7taQ?=
 =?us-ascii?Q?ELCDRwGjazHqDqesczvvwf5CegHGc+lf0iKg5z2t6G7TcAs3OiibNLXpVb0+?=
 =?us-ascii?Q?dsGr8NjI0PRHLcBx3K37SR0dHAuMv4Ob4qeO4fbN8pjR52LrQpM3n4gjz0F+?=
 =?us-ascii?Q?ubowA+PzKLJbcsFZjie9DFhXo3OvcvmrdcKDGQjSgobFd8R/VVV8lnT0EgUj?=
 =?us-ascii?Q?HgkNiold2FTOAPZZZnzo27p1etBn3pDt0Um+d0+tNIsBT7ltQVnPmO4QBJ53?=
 =?us-ascii?Q?sG5Q7sYQ7AQvXjErqdlqSFPWafJGV1r0eCgW?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA4PR84MB4011.NAMPRD84.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(366016)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?1P+/h2CyAqdAqGZzDnQ4zPo1CQh4gTTTfF5lThChSce9fGL8+7tKKXz1tM1O?=
 =?us-ascii?Q?Rtt8dXObAxJSJCNJZuJiZoH0AUKt959bY0IbG6uFcLuDxFQrSG//xYGTlGgJ?=
 =?us-ascii?Q?Y7FR7CWN+Zf72v20w7XBlpApmT9/uYeL5afj/2IHlGiR8pqCZ0yG8N3H37mx?=
 =?us-ascii?Q?h/YbEVoZG+Df4gl8mLqTjwmUqMV9n4z6GlSSL0crc4sX7g3pfRHWJEDTgwdN?=
 =?us-ascii?Q?mH7FHvKFIimLLUBV0L/K0gl7+QInm7e5E3Ml4X99+R6J4TN7YzdYhMHTqXhN?=
 =?us-ascii?Q?tv8Gt1/r96DVUeHuAZsqTPFlLcPUBVovTmKpcBgXzVJMDfjWS/rwnI8GMqDt?=
 =?us-ascii?Q?Xmf7vfzsX3kESZ02qN3gQMRBZtLLHopRB9QZV3mpOF5DrVKAebaE7BwVI0Oy?=
 =?us-ascii?Q?vXGHZIEBRTubQjNEYrwP/SNCxNiejprkhDjTzLps9cN6/mmTqaxca3c12yNg?=
 =?us-ascii?Q?cduGUaNjR0Dw2Z/zNHjON7LCAXCZaAeq4HXlFLCJpN8XnpVlTu1BctHhit/x?=
 =?us-ascii?Q?Vv5t1qFgQJjiVsoTZ2ybGsRsLAk8kjCHHpuVkutnjDBpUpLAvCgxuAAWa4OJ?=
 =?us-ascii?Q?4bxmZA5YeFs+2An9WDFftCkpLozdru2OsjQRClMHtyrsy55dk9lR2wO4hZ+S?=
 =?us-ascii?Q?aDqnOVm1rL166vszygYKShJlRIYiXQYBb40VUQUNqKDNDCrEWv/HpFv8zLSr?=
 =?us-ascii?Q?pHtuvNNA6skH30pexspErwbqGjTMk0kJTH78W0ANqetcnZqdPqKwK7awzFpf?=
 =?us-ascii?Q?I74m1d/J94Z/QfJ+gxxJVoph0xMFlSqHJZEF1ULw7Xkz3+NwDKTbAULsOT0Z?=
 =?us-ascii?Q?iNkeDpMO6+fimwc8TUQOSwBUOEFjxadwhGQiIUMulIKIouOv9P5ca7vI7J1N?=
 =?us-ascii?Q?upVLkybFnw6/NYCCmzKVchEpPiKxLNIcstXjXizOXOb4zEg63RwLpyHUkowP?=
 =?us-ascii?Q?X8DE/lSwnF7aOrA4EPAUuyzbmwuvbcqyJLFGhJirq6Pm5pp/ARYx7dZwsEA3?=
 =?us-ascii?Q?MHmccJrwYEhWvHxSuHQd90SMlPh4dMSZipaentEm6r1XV92/H4TJPlu9Bju4?=
 =?us-ascii?Q?hGVCu3XJYnM/nz+tL7onqk+ULCW8eKLeLFtK3K3bHjRkiGqRuTwe2oXv8S46?=
 =?us-ascii?Q?hezUYXA7gRYSHY1XoDNXEDWlwipxgVJcBVw+L7EJmTw9cgd9XNfChHjARG+H?=
 =?us-ascii?Q?fX/N/jdFjiD1xaTVVNCH5WoE5khlmYz8MCjJbp+2theye4Nl5zi1+Z+84PWn?=
 =?us-ascii?Q?4tmol0q0oqLdGEe6fKhdPYMaORceV6V6dBB7jTM1OhOBqGtqGrDckE7EBqap?=
 =?us-ascii?Q?qVpRrsaLXA7jowABUXPtUFvBBlW7xUn736FhYk5rRmZYW5kPB97vT6n57ts8?=
 =?us-ascii?Q?F88a+c/0VSzgactKv4uJMva3NYrk6MGsZkJfPKO/5Zcmcr1Br0J2jBS5m2DC?=
 =?us-ascii?Q?otKV4bQLeoy1Hg7fvzDlXBCinbsx+nAO4OE3/nBPuwEr8qUaiX5oLlTwFiWf?=
 =?us-ascii?Q?d2ztY1xjIFa4aIMs4tZtPCpLTVvCcJmERypy3cM4LCoXQcXnyfJeFr8FPVmD?=
 =?us-ascii?Q?WoVjrhvxDNMm+Lm0p+0=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 019ac69b-d7d8-48d4-418c-08de27dc9658
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Nov 2025 02:29:10.1304
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9i71tQjOFfhKl3IpCLRz/RwjACqUDnADRHtZgxDWzE+q+Rk0du6GiXgLQoK0pkhA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV9PR84MB4008
X-OriginatorOrg: hpe.com
X-Proofpoint-GUID: 9zisRSx-FNhPxCPN0NZOW-vaA1_ZX8lr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE5MDExOSBTYWx0ZWRfXyouJM/h6dzK8
 KSqcRww/aN22RTi9hQ2JWNTv6dyrA0nyEgJEvkm1ovFlFNHOzf9J4VHPsE2dEUc/7GZYyRTA2Go
 UuQFtY4v5P3rxLZBRNeiYwsQ68nM0x+2Ncnf4moHEN4K2gmAdfqvea7aOhTTRctSKCxFhaDReIi
 rDVoh0kceiYk+XDBm2ej3OHB29wBkhvzCu3ScCjlqq6VSQW/eh0xjuc+nUMMFz3jrlZSar+xvCf
 XASibs55pzSEbXFhn8fCeyu3VeU6EFpTifZSZZc+lLViPyKJx13yGkfRP5ZaytXgo+dqmp/AboU
 xEN/TJy2mRP2rwXMKhcYRMFGOvXeuN3emQorJppT9aygWP5ZJFngzzioXWDXnUEfcaXu1PPDZAq
 u/1jcqyfyxF0SWRah5GwSlF6jK4Xhw==
X-Authority-Analysis: v=2.4 cv=JPY2csKb c=1 sm=1 tr=0 ts=691e7cfb cx=c_pps
 a=A+SOMQ4XYIH4HgQ50p3F5Q==:117 a=A+SOMQ4XYIH4HgQ50p3F5Q==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6UeiqGixMTsA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=20KFwNOVAAAA:8
 a=2OWJTqkPu8zccz12aJgA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: 9zisRSx-FNhPxCPN0NZOW-vaA1_ZX8lr
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-20_01,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 clxscore=1015 bulkscore=0 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510240000
 definitions=main-2511190119



> -----Original Message-----
> From: Eric Biggers <ebiggers@kernel.org>
> Subject: [PATCH 2/4] lib/crypto: tests: Add KUnit tests for ML-DSA
...
>=20
> From: David Howells <dhowells@redhat.com>
>=20
> Add a KUnit test suite for ML-DSA, including:
>=20
> - The ML-DSA-44 "Pure rejection tests" from Stephan Mueller's Leancrypto
> - An ML-DSA-44 benchmark
>=20
> Later patches will add test cases for ML-DSA-65 and ML-DSA-87.
>=20
> (This needs some work.  For one, there are no negative tests yet.)
>=20
> Signed-off-by: David Howells <dhowells@redhat.com>
> Co-developed-by: Eric Biggers <ebiggers@kernel.org>
> Signed-off-by: Eric Biggers <ebiggers@kernel.org>
...

> +++ b/lib/crypto/tests/mldsa_pure_rejection_vectors_44.h
> @@ -0,0 +1,489 @@
> +/* SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause */
> +	{
> +		.what =3D "pure rejection vector",
> +		.algo =3D "ml-dsa44",

Either no dashes or all dashes might be easier to handle:
  mldsa44
  mldsa-44
  ml-dsa44
  ml-dsa-44



