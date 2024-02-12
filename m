Return-Path: <keyrings+bounces-608-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0220E851EF9
	for <lists+keyrings@lfdr.de>; Mon, 12 Feb 2024 21:57:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2739C1C2188F
	for <lists+keyrings@lfdr.de>; Mon, 12 Feb 2024 20:57:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 481C2481B4;
	Mon, 12 Feb 2024 20:57:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FqrYesdA"
X-Original-To: keyrings@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 077D747F7A;
	Mon, 12 Feb 2024 20:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707771433; cv=fail; b=qynbSmZLegNHwQw7V2L65g1ZEjnRI6ahZJwgktJjZuFuBzMm2TdePnu8WArWEX2Btx34l76RHJUq96vqQ3rLYwRvec03q6Y4qF0NY2W3Q3y+7f1J+6GWpbK938ISDC5ebDgGVTR4Mipu6djcbpzrwdC0yKrOUxrdOqz2uWbR9y8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707771433; c=relaxed/simple;
	bh=5v/nVXV7pTyvUSLhGmRnfrxxx7O9ZtMcuknJG6D896M=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=OlZm9uKTTKyiWQHqJjMIc4GeDQoUjP6zBZMpFgfF55CG1IVnnmTjVWBgeZFqQUl1bPhyb7u+sHy+qg0TB4DWZQpsyuFe83+E0kKxA+gzfXT2isfaqSBV3sebg+K1aV65M/ubxFBeOJXMuoyTMxppN3fUGu5AgP5kyB55ZrbPY9E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FqrYesdA; arc=fail smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707771431; x=1739307431;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=5v/nVXV7pTyvUSLhGmRnfrxxx7O9ZtMcuknJG6D896M=;
  b=FqrYesdARHmhCulH2pcmvkEkrI8ZB+mh4T4I3qqgeQSeqpeNA+4jUWQ/
   3H3Tz+vUyRzto9XpOFhMcBIwUiArUUnnUOkv5e0xLVtbR55B6+GMhrDyM
   7ortgRmW4Ph4lQDsgrbLsiw0S5duo8qNFWEySuF1tMXGVA9uWsaA3PCk2
   9MZDiqWET7JPfcCVNsCfqg+hKvw+2KwIt1AsSwldVxnp/OaFujrGnhP+j
   CfXGgQBOalrL8UXIVDqmcyiAqpPSE0lp0ByNqSlfn1A/AgO3Kh961VWh7
   r3e9d3cq8iJWRJn0W67BcHynLqg002CspSnh65KihYniJV6OisfHhcXS4
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="1913252"
X-IronPort-AV: E=Sophos;i="6.06,155,1705392000"; 
   d="scan'208";a="1913252"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2024 12:57:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,155,1705392000"; 
   d="scan'208";a="2662186"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 12 Feb 2024 12:57:09 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 12 Feb 2024 12:57:08 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 12 Feb 2024 12:57:08 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 12 Feb 2024 12:57:08 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 12 Feb 2024 12:57:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JO60nICuw7jK+cpJjpjKPDYLKP5ImmMwZO3KnT1+ldq/cteSoOuSzAno7kepVPmjkvkYXM3L11i07IQtc3Tbu9aHL50WxKZAtrJa4p2Qua443Rk/rBnPMf5u2pAbTB8x21x7+/KOIY3fJ9O5KVSFn9P9+y4AnZ0O4bdSxI/KXRMayZ18GDEtkgbIQ/oSLQIA+auXo6FlIJgH0dFQLrAhXS9EIT65NWyXqcIjon0TIzuJLMn0xbb/NQPa69ND8SIYHZtQsqBxOIpv+c/Jy+LW1foM8EuEipXvsSuY/NsFUaMfIzFFjnYja+WvluNRRmAO9OxPEtzmWm/Pik1F4GMlhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X3uZnQKlWmxWDjK/njQauK79mZe8MCtpa5VFfpWQmA4=;
 b=Fl8NviZ2gNpcN2frHlfRePOCYcKsCRwo96w3yaZ9LG7QPK20spCMO4WQH5+yv0POf8/vVi8hL3mQZGIAJ4M8rcM0hnmRPhKc8PeMBQFRePFbWykTDukAKIkVviuKKMpEJonyoe1/NE4OG7wDzX6X8BE5OY4pvODvPtygJ7TddQLLXVczshOS5iMjuzFY+UQC9PwVQum4syJDAsio62r5TyvQN8eT9KUJwNxcDXT0w1pHMSC6hZSzwqhxdNJdG0grDxDqNtUz37nolaCzH0hd7tsXHrW85F9kBN7dhLnTJUUb45XoRk4rugSRosB7X9ohruxM/qN08rfvQBXB15II/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6)
 by MW3PR11MB4665.namprd11.prod.outlook.com (2603:10b6:303:5d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.38; Mon, 12 Feb
 2024 20:57:05 +0000
Received: from PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6257:f90:c7dd:f0b2]) by PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6257:f90:c7dd:f0b2%4]) with mapi id 15.20.7270.036; Mon, 12 Feb 2024
 20:57:05 +0000
Date: Mon, 12 Feb 2024 12:57:02 -0800
From: Dan Williams <dan.j.williams@intel.com>
To: Lukas Wunner <lukas@wunner.de>, Dan Williams <dan.j.williams@intel.com>
CC: David Howells <dhowells@redhat.com>, Herbert Xu
	<herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>, <keyrings@vger.kernel.org>,
	<linux-crypto@vger.kernel.org>, Andy Shevchenko
	<andriy.shevchenko@linux.intel.com>, Peter Zijlstra <peterz@infradead.org>,
	Ard Biesheuvel <ardb@kernel.org>, Jarkko Sakkinen <jarkko@kernel.org>, "Nick
 Desaulniers" <ndesaulniers@google.com>, Nathan Chancellor <nathan@kernel.org>
Subject: Re: [PATCH v2] X.509: Introduce scope-based x509_certificate
 allocation
Message-ID: <65ca861e14779_5a7f2949e@dwillia2-xfh.jf.intel.com.notmuch>
References: <4143b15418c4ecf87ddeceb36813943c3ede17aa.1707734526.git.lukas@wunner.de>
 <65ca6c5ab2728_5a7f294fe@dwillia2-xfh.jf.intel.com.notmuch>
 <20240212192009.GA13884@wunner.de>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240212192009.GA13884@wunner.de>
X-ClientProxiedBy: MW4P221CA0006.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:303:8b::11) To PH8PR11MB8107.namprd11.prod.outlook.com
 (2603:10b6:510:256::6)
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8107:EE_|MW3PR11MB4665:EE_
X-MS-Office365-Filtering-Correlation-Id: 7bc6f64f-8ff4-43c8-cb58-08dc2c0d2b2c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: paxOyIUwZ3+ta0kbL9xd2Qo6AtG37/K5Y1cKHfe4NwvXTr3U27eQj+c3aikmgWHBKRAXbsrcC/sM01E+P5RzS2PbuKVRA63M+yGHDdtcUdperDEaklDRxh0wtDUy6+Ct1mE/yJL44NmuJTrknGfL2pu/3J3eHKF2sovJYmtSz/lwjE82Dp4FWkYoMWMoOoIP/mBqBJx4Mhs66UBGKYL4Tfscckeot9IpAHRLp/Vvp0WmtHwgDpQbn9gPQ3xXiFPOD3thqt27uyTNs8FjgCHE+8oCE3657MuaOPqdroQTVkEWZmpv9zulVz1vt9miyRCkY1xPXVaa1wMTfSD0kbrsvcl1xMy0GY42Ommb8DBsvc64LChlVsgMoezn6enP2eYrvJeEc2ZR/0KUojWokdKQ8zoVy0cRvKKB/AePSAj6AhiPZQBwZuuvbfmaYuiDuLLZ+SmZoSJcZOFD+hBhxqwdbWGCQW+N3mRPenI1BxQyfoeOSA5xE9hNRABcyBnElwV30RTQPqcN5wdQ17/8uchyiMjSR/DJJeiNbOzNs1hoWQlPHl06yKQ+cmOZb2fqst29
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB8107.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(136003)(376002)(346002)(396003)(366004)(230922051799003)(230273577357003)(186009)(64100799003)(1800799012)(451199024)(41300700001)(6666004)(7416002)(38100700002)(110136005)(8676002)(4326008)(8936002)(66556008)(2906002)(316002)(54906003)(5660300002)(66476007)(66946007)(26005)(82960400001)(86362001)(478600001)(6512007)(9686003)(83380400001)(6506007)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bq/hZbtYylofF6rSnhrcal9UY+Ngae+VJgKiySPeaAZv0CXyhYKmQGSZShSB?=
 =?us-ascii?Q?MWgDYq3S8vOBn/isIxEej0U08rmK7o36bftuwdCYN//mFVQw5831NcDc5nfS?=
 =?us-ascii?Q?De/vUeX2CV6hPZwLvMteDoOw7upXVUOBYBOTuk12ZTR3BvkGaT6HI1ELFKHq?=
 =?us-ascii?Q?tJDn6Yt/iUPSCH6qxEc5bs2X3QripPi1tSaoga7AZPHSy4mgokY2CnYjFObP?=
 =?us-ascii?Q?eIN68YytWC4v5YFshsesN8NV14W0HTYbHmiGnofA4HM18TxyuIIMMxfVKeVW?=
 =?us-ascii?Q?5ySV1ynCo8QLx2A8k+clPITPcYHi63R51iSIizHjhixfhSrXP2gkkSutZU/n?=
 =?us-ascii?Q?Ds9evA0A1KeveiUQ7swZmjxlac4QCCtPCvbcT/a0MqtXo4eh8g68Dc1ZNOQW?=
 =?us-ascii?Q?t/2uVtpTKurrekyBH/h1geR8cvXDNRrerCm9AJZG1G4aVgOSx6gyqR0l40uF?=
 =?us-ascii?Q?XE7O/uHV3jXAWh/gzASNvdk+1bV53DWusZfUcTX5W/6rBmH7hTlnCZ9r8C3h?=
 =?us-ascii?Q?Suz+7LUuNAcVpe/wgWX421L20aHFoEyOthyreROl2G73HqvF40q6TDLbf2V5?=
 =?us-ascii?Q?VBy3boJkAhPcuz42xhsNyH8hp961r41SKFvM0Qq54bEqjx1thesukctY+WWG?=
 =?us-ascii?Q?I0MViDNVVs63llHCGamABTB9Kfm9YOQUA0HCBZezCGtl2DpDx4P+9BIYwflo?=
 =?us-ascii?Q?mMdpwLAdUYJ4WjGyoe8vjAGHxzaT3BB84dB8lAo5EKiAj5xsE+kAmjbby9SH?=
 =?us-ascii?Q?g4zjjIqf68Rga86Ha69E3FnxG/Aie2cT4v2olB5OKo0T79c/HIBt4pG5xR9L?=
 =?us-ascii?Q?+WzV3zMpY/1mvFfRxu0jfH9BCLTRrmnjf6/4IZxiwZhqJ6ItjzCF4woWgmAW?=
 =?us-ascii?Q?WbNbeWT1mc89fCT9b7qGFdzp3A1Cuv++H9iXNIQlDmTIaM00GzkEnUSrmuNY?=
 =?us-ascii?Q?tvGNAVu5SwEHmzrkhTKyowu5ANOHLe++ZOs1pNaeWYG26lgtbi0ZtVpsB8bv?=
 =?us-ascii?Q?SNdUAzEK3naWaYhAylPiOCpk2Mlhx7XFu5o1Lh3Mqa2YaFa3NbYJ7hHQPOvt?=
 =?us-ascii?Q?UtQx/Qm/x4n+CjIaNllQnpmG6xXnCK80j+4Iw2vlPPM1HNJGEaeAWdmxhnSI?=
 =?us-ascii?Q?QvFX4qWdEcLFo2UM9RHa2SuzS52u/Bj+qvdKquCLzzk3NNQRjO5cFitucbk2?=
 =?us-ascii?Q?QIVn6XIpgOiWXu1wP+doZYTYDllqNqp5c9wW8i97STtROYJXpAmzVT6DQ1Ko?=
 =?us-ascii?Q?HAxx3r7j//ArZqfo/mmlkN7wo18e3YtKzXipghyOhrXfyZJC88QtsBo0ANuK?=
 =?us-ascii?Q?uURNa8EvGHBSzTYZb/KE6XedtOSWMpc+7urK+SncC60cqhv/CSwGapuTTmOD?=
 =?us-ascii?Q?L7yVtg+pNTHUEFUeOvkZ+J6AWHX/oQtq1E3YDEA4AqRDdJxlFrMZyvvWSUQ8?=
 =?us-ascii?Q?TYyWKTTAu0/YYBZLURfWoHXjIagP6ZyDoQbuLTqwEhNz/7SicE9iiUXqdyYT?=
 =?us-ascii?Q?EM3JoGF5Lg6Na6gy6PNzVvfNXvZc9jXp2hThQWwQTQo7ODs7n0H0lG5Xy1Lt?=
 =?us-ascii?Q?y9m8e2cClT25HhMVZ1oxWBkoAJ5e6sBwB4rqtPMJn5AkyK1EYgJEyjMbtPPL?=
 =?us-ascii?Q?xw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bc6f64f-8ff4-43c8-cb58-08dc2c0d2b2c
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8107.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2024 20:57:05.1874
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gdkvg+tGfKIW9UoALYH7VPvNVGG6OWIxzkBFDLeYTMgRkM3KObwlUa/ziGlriEKCaSXDcAMZtzyCkuCJlVdyzoXBKh3NLgt3iax4Egw705Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4665
X-OriginatorOrg: intel.com

Lukas Wunner wrote:
> On Mon, Feb 12, 2024 at 11:07:06AM -0800, Dan Williams wrote:
> > Lukas Wunner wrote:
> > > In x509_cert_parse(), add a hint for the compiler that kzalloc() never
> > > returns an ERR_PTR().  Otherwise the compiler adds a gratuitous IS_ERR()
> > > check on return.  Introduce a handy assume() macro for this which can be
> > > re-used elsewhere in the kernel to provide hints for the compiler.
> [...]
> > >  	cert = kzalloc(sizeof(struct x509_certificate), GFP_KERNEL);
> > > +	assume(!IS_ERR(cert)); /* Avoid gratuitous IS_ERR() check on return */
> > 
> > I like the idea of assume() I just wonder if it should move inside of
> > the kmalloc() inline definition itself? I.e. solve the "cleanup.h" vs
> > ERR_PTR() rough edge more generally.
> 
> I've tried that but total vmlinux size increased by 448 bytes.
> It seems to cause additional code or padding somewhere.  To avoid
> pushback because of that, I confined it to just x509_cert_parse().
> 
> I should mention that there's a coccinelle rule which warns if
> someone performs an IS_ERR() check on a kmalloc'ed pointer
> (scripts/coccinelle/null/eno.cocci).  Which is why there likely
> aren't any offenders in the tree.  That rule is triggered by
> this assume() clause, but it's obviously a false-positive.
> I'll look into suppressing that warning if/when this patch
> gets accepted.
> 
> I should also mention that assume() currently only has an effect
> with gcc.  clang-15 just ignored it during my testing.

Ah, ok, and I now I see you already addressed that in the changelog for
v1, but dropped that comment for v2. Might I suggest the following:

> diff --git a/include/linux/compiler.h b/include/linux/compiler.h
> index bb1339c..384803e 100644
> --- a/include/linux/compiler.h
> +++ b/include/linux/compiler.h
> @@ -139,6 +139,8 @@ void ftrace_likely_update(struct ftrace_likely_data *f, int val,
>  } while (0)
>  #endif
>  
> +#define assume(cond) do if(!(cond)) __builtin_unreachable(); while(0)

s/__builtin_unreachable()/unreachable()/?

Move this to cleanup.h and add extend the DEFINE_FREE() comment about
its usage:

diff --git a/include/linux/cleanup.h b/include/linux/cleanup.h
index c2d09bc4f976..b4380a69ac72 100644
--- a/include/linux/cleanup.h
+++ b/include/linux/cleanup.h
@@ -56,6 +56,32 @@
  *	return p;
  *
  * Without the NULL test it turns into a mess and the compiler can't help us.
+ *
+ * NOTE2: For scoped based resource management in paths that want to
+ * cleanup an allocation *and* return an ERR_PTR() on failure, the
+ * compiler needs more help. Use an IS_ERR() check in the DEFINE_FREE()
+ * definition and then use assume() to tell the compiler that the
+ * allocation never returns an ERR_PTR().
+ *
+ * Ex.
+ *
+ * DEFINE_FREE(free_obj, struct obj *, if (!IS_ERR(_T)) free_obj(_T))
+ *
+ * struct obj *create_obj(...)
+ * {
+ *	struct obj *p __free(free_obj) = kzalloc(...);
+ *	int rc;
+ *
+ *	assume(!IS_ERR(p));
+ *	if (!p)
+ *		return ERR_PTR(-ENOMEM);
+ *
+ *	rc = init_obj(p);
+ *	if (rc)
+ *		return PTR_ERR(rc);
+ *
+ *	return_ptr(p);
+ * }
  */
 
 #define DEFINE_FREE(_name, _type, _free) \

