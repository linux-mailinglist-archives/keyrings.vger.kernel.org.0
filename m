Return-Path: <keyrings+bounces-3330-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F4C5C4FFBA
	for <lists+keyrings@lfdr.de>; Tue, 11 Nov 2025 23:37:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 9899C342576
	for <lists+keyrings@lfdr.de>; Tue, 11 Nov 2025 22:37:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAA55293C4E;
	Tue, 11 Nov 2025 22:37:36 +0000 (UTC)
X-Original-To: keyrings@vger.kernel.org
Received: from CWXP265CU008.outbound.protection.outlook.com (mail-ukwestazon11020141.outbound.protection.outlook.com [52.101.195.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7E0F257831;
	Tue, 11 Nov 2025 22:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.195.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762900656; cv=fail; b=IB/kGIxLfpeh75vu+pEMXmHrymanK1tD6I2yMbEWGDQN9IhlMB3V6ro3r/wtp5sc5s+AV4HajG3N1fyRoPoNnI035U5P5HtUR1kz24I4lk1qnFUbhBWmpUJRj2h7nXQWZqw9Odx7GmDO0A0S0WVlPCSmGF9FIJugQnsT5IbgM4s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762900656; c=relaxed/simple;
	bh=vZKJPiIT5v6D7I8Jp7v/rCD21/kqTy3UOW8a0pThM6o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=iYIPJUkIjuProarFnlZlPoi/SFsiAbeuH2rBrJbqC5zNlbDM7lCw2zinA1b45FcPRbaM0YqCIfhVACbtd6YzX+sp3drQ1uUCKrD9ojPkHR4TUrYYNojR+TrIQqAHac6AigqSE1MVdk/u5ZiIjz4pRO/VSJAaFyHGuZ8UMftLMc4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com; spf=pass smtp.mailfrom=atomlin.com; arc=fail smtp.client-ip=52.101.195.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=atomlin.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sq6Oj4+zZzYfit7KnRWi16uWc7AnDRWmvzYppY4DnaDXMf7dv4JCO+tNTP1+f8xGzBtsM8N7o1tIcIynA+kVx5A8mIGHAL8bgn6Iw3blQ3psSzA2cdXXLO2SMPM74pmIfzxkbb2oaaMEuzvif+7tsks5Tq8EHH+ADXVGZT1Y5do+BgxDDRn+HgxAwHH+LdENQU1acoxkY6HXoGBAFTlFRuJn2iQ9Q9WCM/8ENCDdT/5ygIbkWu7om7P9yDfjaMsJt4TDHmYE9MkMHatVmoKB4MgXvdMen0RK/G60lTSQ7i25v0ad8lJzxd3SYPHDMxdJtUStXMHCU4rAspnRXvGDmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E0WQfMq/aRF3WBkWcoTUfHYHkSHEz8Z/J/g3rTetRR8=;
 b=M2r6leLuRNXkkvN2MyIP1m0BQE2YeXuw1F0LDgIyb2D87QeLP5wpdKrhGT1XMtdfEQ/D7lOUK+hutWpa4rFXS4roP6D1FNV4J67QK9sa9rbMwy9dhOzDzhXLsw4BqdQxaqeZ0B4Zrky8rVogyW3dVoc3US8CjEviujVT4obXYO5ZUo/xQ9Ej1D6zZva8b9HuoJ3DsUY/riwMYc5TWlirKz+ReYBPdfW2cjE8Fz/nSaBfwi58Cg6LKqrZXuSRHMMr7J1QIt3Jdbmv6hDSpAtLdR38VkVv2QyHVnFqgxkcAeJoh7E6j3Htr7lg37Ln0hx0L4mh23gxg2B0tZObERF86w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=atomlin.com; dmarc=pass action=none header.from=atomlin.com;
 dkim=pass header.d=atomlin.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=atomlin.com;
Received: from LO3P123MB3531.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:be::10)
 by LO6P123MB7271.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:33c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Tue, 11 Nov
 2025 22:37:32 +0000
Received: from LO3P123MB3531.GBRP123.PROD.OUTLOOK.COM
 ([fe80::8242:da40:efa0:8375]) by LO3P123MB3531.GBRP123.PROD.OUTLOOK.COM
 ([fe80::8242:da40:efa0:8375%4]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 22:37:31 +0000
Date: Tue, 11 Nov 2025 17:37:28 -0500
From: Aaron Tomlin <atomlin@atomlin.com>
To: Petr Pavlu <petr.pavlu@suse.com>
Cc: David Howells <dhowells@redhat.com>, 
	David Woodhouse <dwmw2@infradead.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	keyrings@vger.kernel.org, linux-modules@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] module: Remove SHA-1 support for module signing
Message-ID: <d54jhudd6xjf2y554aneavoa5mdg7gjjrt46ivlioz3y6i5wvj@s4picdthkoxy>
References: <20251111154923.978181-1-petr.pavlu@suse.com>
 <20251111154923.978181-2-petr.pavlu@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251111154923.978181-2-petr.pavlu@suse.com>
X-ClientProxiedBy: BN0PR03CA0046.namprd03.prod.outlook.com
 (2603:10b6:408:e7::21) To CWLP123MB3523.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:400:70::10)
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LO3P123MB3531:EE_|LO6P123MB7271:EE_
X-MS-Office365-Filtering-Correlation-Id: d2ef842a-47a9-481a-e002-08de2172e6b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Q3daaDdDQkxnNWRrVkZRdGM2bkZYMmJUMzErQlJUREY0c2VXOEIyTHNCc0RK?=
 =?utf-8?B?eTJtTG9ZSUgxMHltVVdLSVM1MDBhSDZGcHFEZW5OdUlvOHBISjN3TUpRckNB?=
 =?utf-8?B?aHRFdWg5ZlhjQ3dEZy83WWhGUng0d1BGUGR5dWJhZVZQdWtVY0hGZkRTY3Ft?=
 =?utf-8?B?K2xZS1ZGL0d5UjVZMTBCUW5GbWo3ZTBreXVjcXUyM3puYzFFUWs4Y2hwM0VK?=
 =?utf-8?B?cTBKQ00xM0g0YU1qb1FvN21vcW9LQi9qZ1FlMkEzbXp1UklJaStJejN6Tmhu?=
 =?utf-8?B?S3FwT3UrMVVlMVNuL2l1Z0ZCdnFqZjBVa2N3MEg3M1RidThpNURKWkJHN3dq?=
 =?utf-8?B?UXV6V0IxMHN5eXZnODFaV21jZDBhTHVwREhzV1c2OHBHZDNweDVZSU1OYmNV?=
 =?utf-8?B?VHNBUkVqQlJHc0Nwd3FWUmoxb3hVaXFtb29SekxMY2t4NHlzWCsrcHNzVGw0?=
 =?utf-8?B?a2NjeVF1Q01ENk1KczU5U0FCRWk0bld3NEtxMjh6VU1QZTVML1Fzd09yVFo0?=
 =?utf-8?B?MnluZXBlVXhGMnB0Zm50WkVLYTNpb0I1ekRsZWw3OU44aDhWdGdvbGlKWnBa?=
 =?utf-8?B?TUNFbmgxWklOS3JWNUxBQXg4UlZGT1ZQV1o3N0d3WHViT1ZyYS9aQUVDTGpI?=
 =?utf-8?B?ZzZWWUE5N0orVXJXei9jeG9USXVlQ2N3ZTc1aFBNNk8rbm1KVTVKSEtNbVlY?=
 =?utf-8?B?a1FCRXBoWmUxbmMxelRDcU9HZGhvQ1hlaXJROS91aDdrcFU2aThTbkZ6MjBE?=
 =?utf-8?B?MmNPcFNyZkZWdGFPRHpWZnA1UW5YcWdweGw5b0tqUHdjL3VkNWJGcTVyeU4w?=
 =?utf-8?B?amRwM2I1aVBDejNJbFF6YmZTY0RzcGh1dFRxeW9VUTZtc24wVkJFeE9CTXRr?=
 =?utf-8?B?dmEvZ0Z0TWNFZSt2cElVUy83V2dRL2ExR1BWeUdKV3ovWForblBJZHAwK3Rz?=
 =?utf-8?B?K0psTWRZTUI2ZURlTEhCaVZUdktsS1lHQkdsTGZjSTdXUFRYcW5IRVB3MjB0?=
 =?utf-8?B?NFBGbmxRU29VSUhKWnQ2bkVpaGxYcnk3YWtRK0dwWHI1cGxPTXBGdER1ZUMw?=
 =?utf-8?B?ck1INEo4WGNhb2N1VVh5ODJjWHZLb3dIZjd2QVFKSVRtamRpRWRjQmd2bFA4?=
 =?utf-8?B?QkVIZzdERDVZdm9MNFIyRUMxZjFsWGVhYkUvTC9mMjlRRGJ5UmdEdVgzR3Az?=
 =?utf-8?B?WVh0WS9wY1MxcndudDNOMVpDNSt4cEd6Ly9iZGlCNVpLT014dHhWZE8veXpJ?=
 =?utf-8?B?RUdoNXZUYlQvL2NYZklPY1ppeEY4cWhTRk5HRURtTW1MY1pUOFRuS1Frd3ho?=
 =?utf-8?B?T05KQkRSaGc0MG82a0hIc1BLZXc2MEl1cGZWRC9KWUNxMUM2NVBxSzZjV0RU?=
 =?utf-8?B?R2xENlRWVW11ZW9NU3lrU0p1VVF0cXc0TnVzWTR0Qkg5NW4yR2dJZlM3eXNm?=
 =?utf-8?B?YTBpNDlISXhGK3BqekNMVk1DcktMVUtyU2pCbXp1bUdvMndDTU1Bb1JoOGNB?=
 =?utf-8?B?K1l0SDJmUndpbFZXOC80TUVlb016MjBnNUJkeTNicWg1MFFRYVBUa3Zpakor?=
 =?utf-8?B?dGJmd1RaZVlFa3FVTUplOUt5YktRZk56TjB3NnJQYnhoNitNUGJFb3QwdTMv?=
 =?utf-8?B?VlJETUFtb2Z4OS9FZkV5N1VNOTlPZmdIV2o2SjhTN1g2aCtycTFxa3o4U3VB?=
 =?utf-8?B?VjhKdmNaYUNjeG12UFVyWDRLd0lrVXRmM1lDNmYwZm5ubDVWcUFoRG40bTly?=
 =?utf-8?B?N0FwQTVpbVVJZTF1b0ZmZTAzZVdjZHZEUFJibXc3ak4vMHYrZHhQbXpWSVBE?=
 =?utf-8?B?TTdsTzByTGt0Q2dER3EvT2o1cG9LQVlPR1NZZ0U2R0ZhL01DVXdMODJrNm11?=
 =?utf-8?B?bWZoZzRtZE9kKzJBYkFMeG82U0QzL25pQjZoaXllbGNZYnVYOXhxMTJaVndX?=
 =?utf-8?Q?26wVYytWuLFFhlMxHybhoRxLLoyq44Tg?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LO3P123MB3531.GBRP123.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SUtMZTJjdWQzbm1lWi9Qb3lPbGtFZ3BqSjhMSlVoRjAxUDFCazUzUG1zUWht?=
 =?utf-8?B?aElGVm9WR3RYcE1qSTdWYXZnMDZkR2QweFBIekNWNk1YYlY4Yi9QMjhyUUtk?=
 =?utf-8?B?aEVWS2NreDhjVXNjaTJRMDA1RkZQN3F2eFFqUUo2TTEvOEtkZ2JuVVhMVE0y?=
 =?utf-8?B?UnhSMmhjL1ZwVXc0Y3pRY0FQSGJkalNpbVREN3krWGVjVDhiYllIQ2w2RFpj?=
 =?utf-8?B?SUg3UGl4MHE2ZWZSd08yWnQ1OVp1cXUwektub2Nxb0tEUFFEc1gyTnlVODdR?=
 =?utf-8?B?T2ZSL2ZYeVlvL0IrTnUxdHgvVUdwNFN6UHEvc1ZIamlrLzZ1ZjZBRkJVc21o?=
 =?utf-8?B?MEJsY296a3Fmck9uVE9yQkZuS09QbWx5S05DYUxYMjRicndaRGd2Q3NVRDJo?=
 =?utf-8?B?R3hHWWdLTXh0V3A1dUgxdFNuWG51ZStXOTZIbEI1blRFQ0xOekthNjFsUjdS?=
 =?utf-8?B?ZHBlWUpjVS9XOVYyZTN6MlRVREIrSkErSE9LdlB2TThBMUsvUlA0eGt1aW51?=
 =?utf-8?B?cGtYdEJGY1RWcEE3UmNEcTZrb05sZmFZQlNGZWFHU3M5UnVRT2U0V2N1U21U?=
 =?utf-8?B?Tjh6M0FWQVVicmNXM2VNT01UNGJsSmhtRkpRQkVSMEFXVEJBM2F2UUJNWFgz?=
 =?utf-8?B?Y0xSNXBsNS9JZXV3aDVNdnR1VEFJaW1TYnUzOS9pTWRId09aTE9WaXNZSThl?=
 =?utf-8?B?WEVoMzRKV3pUL08vb1ROMFA0YXhwOVNocm9ZQVE0VTFRZXl4eUp5dWhqL0E2?=
 =?utf-8?B?bmp2ZnRFUUY3T3FEVEJKQXBDKzVNeWY4aStnd2psVXk1NStMdDV6Y1dRWGFo?=
 =?utf-8?B?SnFQTFhSVUdZNVl4QWIwMG1jamcrRGRmT1lHMElFK09maTZDL2IrZ1ZRZkQ0?=
 =?utf-8?B?MG8vQmMrRE5KSDU0VDJwWk5tSGtTR1IvSmxFdlZTSnZPWHFSeThQY2NtU01L?=
 =?utf-8?B?bi9ySEp4YTd0YTZhc1Rab0dWckdvNmoraXo4SFVXdTZ6OVJmNk1RTFdodml6?=
 =?utf-8?B?YWN0ajRLOEtuam41dnduOXhrMDlWREQra2Y0OE0yYXpmajU1WHlTSG5rRU9m?=
 =?utf-8?B?M0NhQk1OSUVON21PVUhla3VrM3NnNDh5RmJGcnJoWUtGSGhaRy9abC8zME8y?=
 =?utf-8?B?dlREYXBUN3VTSzFBUG05QldaTnBOaGZEUStYbkljOUIvSnhwTGdRRnJxbTlq?=
 =?utf-8?B?OVVBWTNQbTlnZFBSSHR1c3lNQjFycHU3ampndUxySGpmVUJqek44R2V0T1NF?=
 =?utf-8?B?RHduZTMxUXlsbVN6ZWFKdVBLdUdLMFNKQ1lvbFNSbW5DbzRzQ0h0ZGNrOWVN?=
 =?utf-8?B?endLU3BqZncwRFhQeE0xcitRLy9DUTNNQy9uWWRvR2RWSmZMRXFacjlPcWNS?=
 =?utf-8?B?bWczYWdFSlNLZVdZUWpFSEw3U0FTSUl2eFNuV3d0RHNXTTZiNVYxdE91UC9t?=
 =?utf-8?B?dEdoZjVBTmlTWEkzWUhVclhwNTBuKzJBQlJGMG5HUGJvSnYwY3NVbnZXYzZP?=
 =?utf-8?B?eWpZZ1grZEczVmVIMlhua2UrSGhtaDczak1GTHBYYnBPLzAvNVFpYThRdTY1?=
 =?utf-8?B?UjQ5dlVyUzhMcFNyZCtXTTZlYjlnNW1xTWRmY3AwdVFPR0VvNWR4TmcxMDdQ?=
 =?utf-8?B?eUI1Mm9xU0tSc0hmMHVPSGdWVGFjVkwrcHpPMEMrV1U4T2ZINDZDUzBhalpJ?=
 =?utf-8?B?cWtKZ2ZYSTd5NVNyRU1Dc0NnWmFXcExqcEd5TDJqMFI2LzlMVzdyUXFvb2Yy?=
 =?utf-8?B?ajN5cTBySmNaSFhMYnlON1VFdGdGTzB3RnNxTnk3WXM4ajFVSGJoNFlPOFZI?=
 =?utf-8?B?Q3RHNERWcm9Ramx3M0dlS3MxaVpxRUN2djV4QUN6R1hXbFlNTW9hVUQyTmtX?=
 =?utf-8?B?Nlo1bVllbVFaKzNILysxTDJvc0FHVDc2OE5WdUNkTlNma2hFQ1IrTlJyOVhI?=
 =?utf-8?B?SGx4SDJUcVVXakxaNHlqMGZJVXhseS9vcFVGNDJ4cjZyMWxOc2c3b3RXNm1n?=
 =?utf-8?B?b3BnNGJmR3IvNGt0SHVDdkJMcU5TY0NrS1dpUGp6c09TeHVaZ1hFZnZsQk9G?=
 =?utf-8?B?SUlNN21JQ1NZUTNrWkN1SVdnZEZoV0psMUI5VTZJd01FY1AwSEQ0Nk1TUWd6?=
 =?utf-8?Q?ZZmDaPfs9HrwccPp8CDj5X9LI?=
X-OriginatorOrg: atomlin.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2ef842a-47a9-481a-e002-08de2172e6b5
X-MS-Exchange-CrossTenant-AuthSource: CWLP123MB3523.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 22:37:31.8006
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e6a32402-7d7b-4830-9a2b-76945bbbcb57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7mUU4itvpQsiF494noEtLEPhyB0Cp4RLnrFmq939c4e/8W4Vj223eaygQzvEqvoOs8+9gp0W7MFX7VaN8+zODA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO6P123MB7271

On Tue, Nov 11, 2025 at 04:48:31PM +0100, Petr Pavlu wrote:
> SHA-1 is considered deprecated and insecure due to vulnerabilities that can
> lead to hash collisions. Most distributions have already been using SHA-2
> for module signing because of this. The default was also changed last year
> from SHA-1 to SHA-512 in commit f3b93547b91a ("module: sign with sha512
> instead of sha1 by default"). This was not reported to cause any issues.
> Therefore, it now seems to be a good time to remove SHA-1 support for
> module signing.
> 
> Commit 16ab7cb5825f ("crypto: pkcs7 - remove sha1 support") previously
> removed support for reading PKCS#7/CMS signed with SHA-1, along with the
> ability to use SHA-1 for module signing. This change broke iwd and was
> subsequently completely reverted in commit 203a6763ab69 ("Revert "crypto:
> pkcs7 - remove sha1 support""). However, dropping only the support for
> using SHA-1 for module signing is unrelated and can still be done
> separately.
> 
> Note that this change only removes support for new modules to be SHA-1
> signed, but already signed modules can still be loaded.
> 
> Signed-off-by: Petr Pavlu <petr.pavlu@suse.com>
> ---
>  kernel/module/Kconfig | 5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git a/kernel/module/Kconfig b/kernel/module/Kconfig
> index 2a1beebf1d37..be74917802ad 100644
> --- a/kernel/module/Kconfig
> +++ b/kernel/module/Kconfig
> @@ -299,10 +299,6 @@ choice
>  	  possible to load a signed module containing the algorithm to check
>  	  the signature on that module.
>  
> -config MODULE_SIG_SHA1
> -	bool "SHA-1"
> -	select CRYPTO_SHA1
> -
>  config MODULE_SIG_SHA256
>  	bool "SHA-256"
>  	select CRYPTO_SHA256
> @@ -332,7 +328,6 @@ endchoice
>  config MODULE_SIG_HASH
>  	string
>  	depends on MODULE_SIG || IMA_APPRAISE_MODSIG
> -	default "sha1" if MODULE_SIG_SHA1
>  	default "sha256" if MODULE_SIG_SHA256
>  	default "sha384" if MODULE_SIG_SHA384
>  	default "sha512" if MODULE_SIG_SHA512
> -- 
> 2.51.1
> 

Agreed.

Reviewed-by: Aaron Tomlin <atomlin@atomlin.com>

-- 
Aaron Tomlin

