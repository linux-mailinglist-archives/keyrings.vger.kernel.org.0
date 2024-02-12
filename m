Return-Path: <keyrings+bounces-602-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C9A6851D95
	for <lists+keyrings@lfdr.de>; Mon, 12 Feb 2024 20:07:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E0E4F1F23A60
	for <lists+keyrings@lfdr.de>; Mon, 12 Feb 2024 19:07:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AF4541212;
	Mon, 12 Feb 2024 19:07:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G7T/+5CZ"
X-Original-To: keyrings@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5926C405F8;
	Mon, 12 Feb 2024 19:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707764853; cv=fail; b=qvpABA46GwDmy13NLwL+DwfJwu0NNXVvVclLPj3CNt1Ij5MU5dIPVHz7s6vmiVlkjtXS+y8vplQzwB/yY3BNjQJuLTkYzLDxO3Iz6UQPV17bF3J39W04wdtnibsMLjeI3DN5bj5k9dPb3SoJzstuGQngQgowe3ERXThsnT8aVss=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707764853; c=relaxed/simple;
	bh=Co0yUhp0tUdKnoLeLf9Fcm2J4HuokH2nNuq98N6D2WU=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=rhOOxx29jQoU6Bi2GCtv11mNJ1RHsg14tqO0scxaIxWtBQUvjQDswSj7Mig66gnDH9S1Py4qqLJuvQq4fFkVfgN5zltq3U2c3y2qcLlNE046fLL51oVsEwHJJk7PL//5NH8edcGfMUJS+nzOIJ9dW/Aza5iIMXK9NCvy3enFK+o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G7T/+5CZ; arc=fail smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707764849; x=1739300849;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=Co0yUhp0tUdKnoLeLf9Fcm2J4HuokH2nNuq98N6D2WU=;
  b=G7T/+5CZ65+TIkwao7xrVBxO6lfcWHUDA4rJJ4Icl9e7hVNQwMgtGd7S
   hAmc9yB9IKa25lN6IhrMbsmKbbRg6i7GKutV8Gb/Oy6jN+bmiSYfce824
   7GGp7xz61umeJ1d0coWPIcy2hRG7YmHOikOd4M/3B/TWtUjCQIF9KhJDX
   xOjXXRDz/O//NZbr26xq/lr4//z0h2S4WySYxaj/xsTiQckUSCeYOr4P5
   9ubLlJRcaP+jVGAfoWKTsORyZ09LDh2Ml8LNdgMebnMdmElzA8ScJ8sN8
   nnB+vHbkRfhRJYYYMQJ0jabewxPmUYURwEr5XHkWVKKxs/PRZxTzEvuCA
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="12392535"
X-IronPort-AV: E=Sophos;i="6.06,155,1705392000"; 
   d="scan'208";a="12392535"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2024 11:07:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="935149744"
X-IronPort-AV: E=Sophos;i="6.06,155,1705392000"; 
   d="scan'208";a="935149744"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by fmsmga001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 12 Feb 2024 11:07:11 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 12 Feb 2024 11:07:11 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 12 Feb 2024 11:07:11 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 12 Feb 2024 11:07:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n+g/FDD/iu9XgKVhjFQGv3egQMp+tKMaYYyB0xQQVBsp/rqXShIG2IJ0SDpAvuwZ5b0bL0uiD5dNWl1sgkw3ojRb/wal9fZyY2cbJ0GUDfWfWJH9c7CSCe6VHAuerG8Wt28VUsyUlIWjz3nIOZpk//uT7yke85naOpoMztiez/2UT5/POt4xSRIgk6V13Q50gJg5PlEo+P9s9APZvFLKGJuQPTeoqthQZ9x9/abLVKSV0dS5FHaMe7WlKPJ8vDx2nK5OYdnu3kA2fjfjiNgyEyn5BFzzLDEzSVV+3wflb9jIgC+v9G0PlYL5OJenWTJg4szpQsYpnT4hYcRxtqZrtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G9Vt9jeCb/fwwbpTOqM4bbCStt6QA3qNO3hZ1GoVqFw=;
 b=eQBbTEs99fhuuo0ECm6sXtvKS0pVf0fZ96l+anVimvzs0VvC2sx4B2e2o/xSUzmLYpgozCr8s6EwZo3qU04DyvHn8Py4rAR7O19IOnpbP+8lIRgtizJATg8CCZpJ08c4hd+KHvRvy8kjlJ2xNbM7jCgLEaRhvJqUCAghpvwFAFB8nN9a8NjhnSQi6xwhREeP7H/9J1+Pa7LIVdGvOWrbI0oVFNMtFV74T1iumIsM98UD1dRTzouOOkdbNmWjpV9Pj8T+8AgT5CiIxqg0kZd1jVj5MmDGBh7DFYHAQVM1HHf7sRKm0CXtRzynZ0/6xMMpPMN6kQ9/CPrdYOjQPJsRKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6)
 by BN9PR11MB5369.namprd11.prod.outlook.com (2603:10b6:408:11a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.35; Mon, 12 Feb
 2024 19:07:09 +0000
Received: from PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6257:f90:c7dd:f0b2]) by PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6257:f90:c7dd:f0b2%4]) with mapi id 15.20.7270.036; Mon, 12 Feb 2024
 19:07:09 +0000
Date: Mon, 12 Feb 2024 11:07:06 -0800
From: Dan Williams <dan.j.williams@intel.com>
To: Lukas Wunner <lukas@wunner.de>, David Howells <dhowells@redhat.com>,
	Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller"
	<davem@davemloft.net>, Jonathan Cameron <Jonathan.Cameron@huawei.com>
CC: <keyrings@vger.kernel.org>, <linux-crypto@vger.kernel.org>, "Andy
 Shevchenko" <andriy.shevchenko@linux.intel.com>, Peter Zijlstra
	<peterz@infradead.org>, Dan Williams <dan.j.williams@intel.com>, "Ard
 Biesheuvel" <ardb@kernel.org>, Jarkko Sakkinen <jarkko@kernel.org>, "Nick
 Desaulniers" <ndesaulniers@google.com>, Nathan Chancellor <nathan@kernel.org>
Subject: RE: [PATCH v2] X.509: Introduce scope-based x509_certificate
 allocation
Message-ID: <65ca6c5ab2728_5a7f294fe@dwillia2-xfh.jf.intel.com.notmuch>
References: <4143b15418c4ecf87ddeceb36813943c3ede17aa.1707734526.git.lukas@wunner.de>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <4143b15418c4ecf87ddeceb36813943c3ede17aa.1707734526.git.lukas@wunner.de>
X-ClientProxiedBy: MW4PR04CA0146.namprd04.prod.outlook.com
 (2603:10b6:303:84::31) To PH8PR11MB8107.namprd11.prod.outlook.com
 (2603:10b6:510:256::6)
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8107:EE_|BN9PR11MB5369:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d7c41a3-b31d-4e8c-ef12-08dc2bfdcfba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: I0XqGoYyaYrbth/iFSGoRUpbdL8Toqth3/bTpmTSJvtnyi57sYAd1ahZ8PLhScrV3Le55whUh+fwvgfiMYsNaCdB70GHaLFjJ80zTuW/GpFOzI+762ZLXllEgDZZWMjB8U0yh6QiucxMOFyk/++5P0Z94wca5t/LUVumup51+6Fo5byWbKX9DDbrQoUZj/dm8hOqJ9A7ASnWnnsidJb8lja7fAOtcMSxnWnaoAAjiu8gx8UgR+Nb/GbR1EgFxu67oapcsvTk1aOA0Pdv3YYAv+xK6/3yPDZ2nITFaRKTY5aVAEwetJDlj1pAp6Z+h3Mfd0tee15CgoaiZm8WMMPjaZrqSOAPTleuhMctq5jO1Ho9SpXkDsgnrVSSfq/hj5NLQmrhsACcsGDQ7nhMZuT4nlGeXd4QbaOzpsXGbJJL3aAG90NtokQrAj7S3n8J5mO71TQnePgh5BHySEcrz2PHqijIOx9CSYWnEhSwudq5bYAOjWoYthmMvxplO3rpG+R/B1l23KsG9DXf5Ebndlzen5HPs07v3HFJbb0QxfoABJsCw/lNrU46W3Yx09oC8aRiI4WTNOqP/04ZP4zK7olBZQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB8107.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(396003)(366004)(376002)(39860400002)(136003)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(2906002)(7416002)(8936002)(8676002)(5660300002)(4326008)(83380400001)(82960400001)(26005)(38100700002)(86362001)(66556008)(110136005)(66476007)(66946007)(54906003)(316002)(6506007)(6666004)(478600001)(6512007)(6486002)(966005)(9686003)(41300700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?L/9ChKKhhngJ4VmmPDkkX8OgCvKxYZh1nWKdz+R0uW6sh9N057JxafvA2ix0?=
 =?us-ascii?Q?gbTf4SRLL590yPYT+nhhDHhLar6wQDaV0yP9evkmj1t41VWGHlC7DEQkIxN9?=
 =?us-ascii?Q?7a1OlmHH9BuDwNfumqWYv/uoZHuydJybASpGE6makxWiTqRJXdcbstMeCNCb?=
 =?us-ascii?Q?gUf8IsfexjLczaK5KNUJLtO6WmlKpqhe7nst6nXF8M8yWcfoWWExYAxFs/Ct?=
 =?us-ascii?Q?U/ZZM7pvaqWT4++t3CFHLuoJKKqqiUlSL3/2uZ/LAEnaS5CaO41RdvDsETas?=
 =?us-ascii?Q?tZmFor/4p0g2ULX/vZLcB/7wo5LSFWxV04ICUPi4ZXKqvFZGKVcYQS1y8v+A?=
 =?us-ascii?Q?7TgSa87AfKS6n5BbiH6dNfs9t7Erge3iEbI7q6rW7kG6zjnO1CqG36lTmktH?=
 =?us-ascii?Q?vWg4A5zwwXsE/WwJbhL4BPIiC4pINH0epH2Tw45zuBOspz+hPuB0DpgGcE9k?=
 =?us-ascii?Q?XD8SeJqrhg1otki6OVBnnwODB/AdfIKYd5PRTcqSy3ul8/8s+7YFH4e28XO/?=
 =?us-ascii?Q?bo+UArogGI2/auCbb0Mm3R6vf+F2bglkXaspUVmpJodN9tibSl73PYlhgF0i?=
 =?us-ascii?Q?VtuXcCZWjvkBnyHzzaa/WVsqLDTwjBAxY/Cl9LGKZ6tTpydi7ngaly0pcM64?=
 =?us-ascii?Q?V3LrrYAmrOIyfu8NbEDh5z68AeK8vFVeCIdl/KiKjLpqIoTq1DoElOi14Jt6?=
 =?us-ascii?Q?B19sbe/68byshzAAyElEsW1sQSjmzS5TJZJXuF3C8OshM1YI56NZvXMVTH9S?=
 =?us-ascii?Q?6efrNZKxIqoQ3QziBMfpETrZBg6doBEZI8QKT+pBYkGir2zYXgDua1n+Mudz?=
 =?us-ascii?Q?LMYvMjLuVCKOSLLBJIZ4t3nwuCaSqa9cAoEQTEdVYDdFEJNyvB7Vzzr046Hn?=
 =?us-ascii?Q?MUoTf2aW+3FzEX/gIuqbzJHxHd4Zu8xw2WeJkw0lzLQE50ANTGonwq9UHyiX?=
 =?us-ascii?Q?qkhNMYtdATIjo5Rmk0nFvC0O5+kCQXUPkCve5LIsDVktPQbumDzxfyS9xfQM?=
 =?us-ascii?Q?LkkG1MpTGBBgYKILPS7HANx6emrzGz97FPHaIYaCJOhBo+7S/+u2/8m2WArD?=
 =?us-ascii?Q?NhUtTvhvbYSnn2AM+lFzcB2IpN4LnleoEUFBOjnwKriZs4Z2PhBVve0iQJKo?=
 =?us-ascii?Q?BhyiZ2hAU0VehgpdNQIyGBt2yipuVHwtzl+l+eOyhEHsozeLeubhy2d5SVuP?=
 =?us-ascii?Q?h1srALvOYhblohcqjXLDuFbR31G1Q2r6XLBtcBcKzveNzDXl6JcAukdI3drU?=
 =?us-ascii?Q?Ke3m4ydZX0T/NR5nHX6jJEznd9r2moSBYlxtw6quKwyZQi2P9E40W/FS7hVd?=
 =?us-ascii?Q?BytYQNW9yUE4CsxCHmjuo3OUA/hYCgPojuqYY2/ip1AJ6TpOW/BnyxlzO60F?=
 =?us-ascii?Q?c1FekkLLZF8ZhO10xIZvCH8itPG2719i9/du8QpIdhbNyLmcSl29cPSg7eOn?=
 =?us-ascii?Q?ClsI6ePqSrCnJcXQJFmJUfHUxOkxg5+THJCSbib9eQeZrOYjwDs30XMgj9A6?=
 =?us-ascii?Q?ixETjGE+orkH3lY3Q6Z0srnyOwUr9qYUWa/wgEMZfXZgSAEvG3uqzThsPAFT?=
 =?us-ascii?Q?NopDHtXrIK3jdfI+G/oe75WIR42ox2otQHO7cVi4jGXWkyiTxl0HPuFRMzzb?=
 =?us-ascii?Q?Og=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d7c41a3-b31d-4e8c-ef12-08dc2bfdcfba
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8107.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2024 19:07:09.3217
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yDsFomPOvFGkbnyON/zizG8W+CsggV0aOpGezA8KWTdJnGI/p0hRxewf1aWE3g/UeEWlcTBbEu7agBiBG3IIl/hrPvXZjo7HrU1MGpfdsww=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5369
X-OriginatorOrg: intel.com

Lukas Wunner wrote:
> Jonathan suggests adding cleanup.h support for x509_certificate structs.
> cleanup.h is a newly introduced way to automatically free allocations at
> end of scope:  https://lwn.net/Articles/934679/
> 
> So add a DEFINE_FREE() clause for x509_certificate structs and use it in
> x509_cert_parse() and x509_key_preparse().  These are the only functions
> where scope-based x509_certificate allocation currently makes sense.
> A third user will be introduced with the forthcoming SPDM library
> (Security Protocol and Data Model) for PCI device authentication.
> 
> Unlike most other DEFINE_FREE() clauses, this one checks for IS_ERR()
> instead of NULL before calling x509_free_certificate() at end of scope.
> That's because the "constructor" of x509_certificate structs,
> x509_cert_parse(), returns a valid pointer or an ERR_PTR(), but never
> NULL.
> 
> I've compared the Assembler output before/after and they are identical,
> save for the fact that gcc-12 always generates two return paths when
> __cleanup() is used, one for the success case and one for the error case.
> 
> In x509_cert_parse(), add a hint for the compiler that kzalloc() never
> returns an ERR_PTR().  Otherwise the compiler adds a gratuitous IS_ERR()
> check on return.  Introduce a handy assume() macro for this which can be
> re-used elsewhere in the kernel to provide hints for the compiler.
> 
> Suggested-by: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
> Link: https://lore.kernel.org/all/7721bfa3b4f8a99a111f7808ad8890c3c13df56d.1695921657.git.lukas@wunner.de/
> Signed-off-by: Lukas Wunner <lukas@wunner.de>
> ---
> Changes v1 -> v2:
>  * Only check for !IS_ERR and not for NULL in DEFINE_FREE() clause (Herbert).
>    This avoids gratuitous NULL pointer checks at end of scope.
>    It's still safe to set a struct x509_certificate pointer to
>    NULL because x509_free_certificate() is a no-op in that case.
>  * Rephrase commit message (Jarkko):
>    Add Link tag, explain what cleanup.h is for, refer to DEFINE_FREE()
>    "clause" instead of "macro".
>  * Add assume() macro to <linux/compiler.h> and use it in x509_cert_parse()
>    to tell the compiler that kzalloc() never returns an ERR_PTR().
>    This avoids gratuitous IS_ERR() checks at end of scope.
> 
> Link to v1:
>  https://lore.kernel.org/all/70ecd3904a70d2b92f8f1e04365a2b9ce66fac25.1705857475.git.lukas@wunner.de/
> 
>  crypto/asymmetric_keys/x509_cert_parser.c | 43 ++++++++++++-------------------
>  crypto/asymmetric_keys/x509_parser.h      |  3 +++
>  crypto/asymmetric_keys/x509_public_key.c  | 31 +++++++---------------
>  include/linux/compiler.h                  |  2 ++
>  4 files changed, 30 insertions(+), 49 deletions(-)
> 
> diff --git a/crypto/asymmetric_keys/x509_cert_parser.c b/crypto/asymmetric_keys/x509_cert_parser.c
> index 487204d..aeffbf6 100644
> --- a/crypto/asymmetric_keys/x509_cert_parser.c
> +++ b/crypto/asymmetric_keys/x509_cert_parser.c
> @@ -60,24 +60,24 @@ void x509_free_certificate(struct x509_certificate *cert)
>   */
>  struct x509_certificate *x509_cert_parse(const void *data, size_t datalen)
>  {
> -	struct x509_certificate *cert;
> -	struct x509_parse_context *ctx;
> +	struct x509_certificate *cert __free(x509_free_certificate);
> +	struct x509_parse_context *ctx __free(kfree) = NULL;
>  	struct asymmetric_key_id *kid;
>  	long ret;
>  
> -	ret = -ENOMEM;
>  	cert = kzalloc(sizeof(struct x509_certificate), GFP_KERNEL);
> +	assume(!IS_ERR(cert)); /* Avoid gratuitous IS_ERR() check on return */

I like the idea of assume() I just wonder if it should move inside of
the kmalloc() inline definition itself? I.e. solve the "cleanup.h" vs
ERR_PTR() rough edge more generally.

