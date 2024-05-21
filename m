Return-Path: <keyrings+bounces-1345-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 590258CA940
	for <lists+keyrings@lfdr.de>; Tue, 21 May 2024 09:45:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0B05E282EE0
	for <lists+keyrings@lfdr.de>; Tue, 21 May 2024 07:45:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 170CD47F51;
	Tue, 21 May 2024 07:45:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M4Dzd9TO"
X-Original-To: keyrings@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BB1C3BB32;
	Tue, 21 May 2024 07:45:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716277510; cv=fail; b=TioGLL21Bu13fXN4Dx+MNg60gFe8aqriSCPgMH/d/xmMIiMN6AyQkO96dCocDTRXZmyN4E2BHGa46GISW4g2Ww3IfBuZhACS5mAiUF4Qirt3znKaw6lBBJdvpyYVPZg+EqHjHo1oT1hiL7+sXM0z1j6UWAD9yF6v6Y1IlNrBtNA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716277510; c=relaxed/simple;
	bh=EmtoaodyhIxh8VckKC0O0z9fD9nSRg2WfuTsE6VSQwE=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=ef6Ndp3g8XyYZUJvfHOg507hiuDU1RYb2IEB6KLT+icWpC+Rc7K+D4yGW+/xfcHFxm3Xz978Dy5HKJKbAuT6FGFsFBzUUxVanIacNlZHgCvNip+KcMakguhAA0SGQlf2JxBzZcLvvYFFFCE5wiUovukXOQjuXj8qoPFOBm++EPM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M4Dzd9TO; arc=fail smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716277508; x=1747813508;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:mime-version;
  bh=EmtoaodyhIxh8VckKC0O0z9fD9nSRg2WfuTsE6VSQwE=;
  b=M4Dzd9TOpZN1hO0E/VGF0umrsKDxS21T6VQ4l4Ec4UupvUyndVjR2cBl
   PiIY5qwF9LLBavjIOFVOkXL+nOD8r4DrpgOlqyE02MBP1dUH2dZ5iRnXT
   HG8py7AMXPl+tk1Th41P359mtkEstSR9w7HZWPp5yMPV20lNPwVU0f1d/
   1CSrjhX42MbIghk5hOaoTmfAQv98NQoPwNJPYYRbt1uzG+Cp7GZSe5Jdb
   WCqtO5B9S7MbyO7IxqsLowUoqSP2IVuikgFhTgmYFxJa5k2yr4ZQ28WcX
   DCJ+92aUXvZiBva+cSA8/2UZR/idv/XE4yzzxSp9I8uwbhnahk/j8V+2B
   w==;
X-CSE-ConnectionGUID: NOEQw4HmTYOvhZxgvEBHyQ==
X-CSE-MsgGUID: XNpK5VTUQvCk+rAsBD3quw==
X-IronPort-AV: E=McAfee;i="6600,9927,11078"; a="12634734"
X-IronPort-AV: E=Sophos;i="6.08,177,1712646000"; 
   d="scan'208";a="12634734"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2024 00:45:00 -0700
X-CSE-ConnectionGUID: A88GAZwHTTidiN5b3IbyMQ==
X-CSE-MsgGUID: 0nvdcYe5SOmjqcFiHv9Ynw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,177,1712646000"; 
   d="scan'208";a="33247767"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 21 May 2024 00:45:00 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 21 May 2024 00:44:53 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 21 May 2024 00:44:53 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 21 May 2024 00:44:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E+KaOOqwxOEvxkYR/EAbWuBrpvMrdQUkeDAN+i7gnPP/2KJlcikJiHklP40xXe95rX4RsjOKylMMFL/JdXSQIAygG93AH6PMpeHfqXkVtcDr9OjTUn1JZZQf7e3iIYlZPn2U3ZO2v4x+oqGNjG3pVXyBylpHhTHqrq5ulQzbFeHoD4tIX3qnmOI+gGLw7Q1muOgfYzEAfKxxFF3pD4BuevJCbtFPyV/5zCTWuYDojK8FcOAs/HvbjC3KlUq3rkb7txe21MRqBkQhA5wFXVWmu+TCFzG00TSpGqSaznRykSShDJzQacp9/OGT6LarYviTNJdjRBe6cStlxRx0FAVmWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sFxMR+mbphrSpCtVRt3hpKoihsSdkBxlO+PisKd135I=;
 b=TXLn5PRBb0fbuoDCNZxr0+Q05lDWU8zBG7p8PQKCR4TBV+BUzq4/kkuFRNPjpkDUpNhX03z/tol/NTO4+Rd5mWeE/Caj6o4ClUZ0TZgIg9rPYf51q7RFCD/n3TV6kM9YXtCA+vpKKr89SMUuE5D9EabixlFZoPLBmc77eUW4sVqR5uQVw861DReE5lOQ25QsntMlGZ6P40PqfYObX75sOGKd6fgQUvf4pSax08kmmb7+vr86hkX/jDYsbsXY1w+Pl7FaO6lbxU2O9xVy+ngtXC47Rddz/J7YHf5d1ZZvqfM2hfBRJs8iRTZ6CRBsLZ+WKwJmRvqxqcGYbBIzcO4mgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by LV3PR11MB8506.namprd11.prod.outlook.com (2603:10b6:408:1bb::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.35; Tue, 21 May
 2024 07:44:49 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%2]) with mapi id 15.20.7587.030; Tue, 21 May 2024
 07:44:49 +0000
Date: Tue, 21 May 2024 15:44:40 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Luis Henriques <lhenriques@suse.de>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <linux-kernel@vger.kernel.org>,
	Jarkko Sakkinen <jarkko@kernel.org>, David Howells <dhowells@redhat.com>,
	Jarkko Sakkinen <jarkko.sakkinen@kernel.org>, <keyrings@vger.kernel.org>,
	<ying.huang@intel.com>, <feng.tang@intel.com>, <fengwei.yin@intel.com>,
	<oliver.sang@intel.com>
Subject: [linus:master] [keys]  9578e327b2:  stress-ng.key.ops_per_sec -98.9%
 regression
Message-ID: <202405211428.a5fd016-oliver.sang@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR02CA0052.apcprd02.prod.outlook.com
 (2603:1096:4:196::18) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|LV3PR11MB8506:EE_
X-MS-Office365-Filtering-Correlation-Id: c2859186-5334-45c9-1a55-08dc7969e461
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|366007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?PnL/eUk1dh8ttMZPELQ9YiyYRX/00U0XmKLBzoHoijBmtchII742bPvCXq?=
 =?iso-8859-1?Q?Inm8waoBRUPtGDmRUUgj3cVrUBtUsmGvrCOc6dqH7n/YJZiXZmuYNUara6?=
 =?iso-8859-1?Q?WBCq7Z3JIFs3k4hINk/o36AMuJOzqFpD/GSGeRBD6oiSKXMuY9juYmmsBb?=
 =?iso-8859-1?Q?JcHBFTXN72dRF35ouc4VNFZ7naODCjtMKgOSxVbQRLYxBCy0LAHak41xTJ?=
 =?iso-8859-1?Q?m47WC0i1Pm3QW2UVTueRKWQbtEZ9QQdUj9BS3sawYogG1X3ekjErnHCW4G?=
 =?iso-8859-1?Q?bQGLXZhQ1HBLaeToM+sMHKyhPhHRPKCmVIg05+oe2MD00GAj41GRyZ67ja?=
 =?iso-8859-1?Q?o+VWJRGi0u8R3/u6b+uWMVDMtOcCUQv3qs9kuFOYJ5iA1ra7zQuGuNgwjx?=
 =?iso-8859-1?Q?P8XcmlePUdGt9zAUzOcH81fiQw7b0f93i7FCjMKUyy6Efc/yqnq/SY0IIq?=
 =?iso-8859-1?Q?mMiwJEQcaFGg4cEC+D4L8hRqQ9dTtf5rvoYrn1T0AVXv55RyhXY/78/Z7i?=
 =?iso-8859-1?Q?aPwUei1XIDoie14Exq92cIjxFt3myFnb7blMRDr1WEcin5p69cKTgub9hU?=
 =?iso-8859-1?Q?+fzTOA5/c7BAvXjTNWEkwVJ/jbAoNkYG22W00ldvgpzwg855NHIlL0gPn+?=
 =?iso-8859-1?Q?Uinhi8H3A2oMLn8d4eQ2GYI1VbZzINRNBW0Mb7v5QMDJd1IdcMKh8ydZye?=
 =?iso-8859-1?Q?P4xFYVCG2qVkeL9xxthvAZdfX830WUPVLeLESrIZQfEJCZevHgapCbLNH2?=
 =?iso-8859-1?Q?6lzvIYSUolLeJKhQATACDDvUjwgVk20toHs8gUrnuwGszfE/HNyLd96q0c?=
 =?iso-8859-1?Q?vCyw1KATmVdsZP3yma0YEOuOsSzCt/w4wnEY/JWrz4EZekjfnfjtGbNMCr?=
 =?iso-8859-1?Q?z6fCDPj5abCa0pL+e99N1Uf8MMbZt1Apie8GjLPWzvnHDErlkcetLTDyMx?=
 =?iso-8859-1?Q?X7egDmJ/A28ZpBxeUJurKHfxKj74M+hzTacYBTfLR7K9dKSSCeGwnmBlTk?=
 =?iso-8859-1?Q?ZE73EY2D9u5Ni+uDZXbcPEAj08WeIt0Y1ULa08nX52CgE5Jj4Z8/chEhLF?=
 =?iso-8859-1?Q?Hq92D1GM6iVcqtnNq339EfO4O+YnzuKiYHqyRaqYHJxGPz6F3ZBsMMyVLD?=
 =?iso-8859-1?Q?uiWluIjaAlikJKHjUIyxGHnPx2FGk1mi7UlzvtLVRoPmloVOEasbhkAyky?=
 =?iso-8859-1?Q?b7RuPsgXXFR46RkU034ut2gz/H+rehIVFzHCYOyCDGpePHhgLveONRljrj?=
 =?iso-8859-1?Q?4Q7V2XVvmL5w8z4xe4wmVcWBorEvYpd8VrqH+Z228=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?RszpFiTZHVx3Rru7L8U58Ys41xvKDSz6zSATRBKEYeU9iJDIJMj956vx3k?=
 =?iso-8859-1?Q?5pXIKaRDxy5cMX8u6/z7CgFrxuSfuJ03yP2WDovyh+AZ5+Uu/rHus46Lp1?=
 =?iso-8859-1?Q?SRRbZc79ZdHmtwx4KHV+bOElA6ORa0q/eHhsbsh4DzLAB9OBN9chpFtC5v?=
 =?iso-8859-1?Q?XuBQkOfEJJigtcTchzgB6/fcC/MROCdCKvB9jgMdRLS1Myf8QRdAXX1ieg?=
 =?iso-8859-1?Q?ItA7N2Tl+h1v/SsPSUyO3u9Qn/NpeYTzueLw3MMF3QO7kkDE84afCXRfdC?=
 =?iso-8859-1?Q?MAnG0O6ikdqrVJtym4gw7KKWJ3vt/vn5MP/oYB/LkGl7iaRv4uYgu+8tg9?=
 =?iso-8859-1?Q?MCEYGysVoKU5yDY4oN6zkWTL6kHGjR+O6240nkXl8NuNFB5Da/wcwyEfqX?=
 =?iso-8859-1?Q?xImjUjVANLPIQQ/m0K/oK2WDgN0SD8SLY3ENLGMNQbzDVCwipqTVPTySys?=
 =?iso-8859-1?Q?yKu/VyNP/fCh1t1lW2c+xPmAi24oWgfCmPDWIORxYoIKv28Fw0vpqtBNFi?=
 =?iso-8859-1?Q?YjqKOt05lVBrzHy2d2rP/HHKb/oLWgSjvw7VIE2IVfsydns0BDRV8Txslb?=
 =?iso-8859-1?Q?C6GsjZ0/iyIPKYlH1fh7bquidQupsthQC52rHN0DkYr1Txd2nWClqLztfA?=
 =?iso-8859-1?Q?NIZFpztXjL+9W75nZjFXVTHauIWJxYaEj/yuwh22TDh6r+RQf3OfuAx4X9?=
 =?iso-8859-1?Q?qEUuTs/SlboUz8KlCyoCmTjbqA4Ju2BEqyZw7zPq8jz2T1AXq5E+L4Kwro?=
 =?iso-8859-1?Q?b3tULhDncmr7FIziScCYG3IDpYdhdPY6H/kRds0lt1MDAUC2PoOAUzcAyy?=
 =?iso-8859-1?Q?JzRS+//D51Rb54k2kPy6ZvlUXuBLDd0cgYi/fa08ran0xwGXYNAdGUNRbO?=
 =?iso-8859-1?Q?COdAi3wzpu7xe6e/Z0+FWcz7xbHY5OEq5veTrFKa5/W6KdH7CgBzIhlyO7?=
 =?iso-8859-1?Q?lqJmlGYM+69sa5QLO5HiDB8kAanKk2g9dlPCFWlbu7jVk9AbkQDg5nt0+J?=
 =?iso-8859-1?Q?ULPAcqqf/8bkhMwICY7y7tr1RzDXQNK1vZEPWaGQPGeEV+rNKv8Zm33oBp?=
 =?iso-8859-1?Q?2GSw6m8UJ/j2VyZbsmFtFBO2noVYX3eAZsM1ZXHjUSj99t2gnruqDKG862?=
 =?iso-8859-1?Q?t/vivUmk9ERwN5HKWlUX1CtSWkwOaGq20AU9Zxen+s/L9tdCdGj/7gSQMy?=
 =?iso-8859-1?Q?PplM4F7KVdXlNUXOuhvJxqvULHVaOsRbzby8Emo1wgHqOykqTrrkeNW8/M?=
 =?iso-8859-1?Q?WguHcYTthUyM/zHho+QyDQexxWC1KbMku18Cd5C2k7dPT5GKOr/+e/FzQg?=
 =?iso-8859-1?Q?6n+OMaPHZpRdIS0havGeiQYYYA/DLE1xmNpqCJticu23f3+B+QDjgu1MeB?=
 =?iso-8859-1?Q?Mmc+tsoKyKIhx3bLGfaHojzFK4pzPrKHMXdrjVflZ5CItGUQ3XC3MZ8ooh?=
 =?iso-8859-1?Q?11SL3mBabmIEIDgXJBPPJd9E3RIQba+dQB5CVTC+qY8hIS0NSsCO5Ui5C6?=
 =?iso-8859-1?Q?afp/8DFIKA5sRgqAu3QVM+G5pElS31FYLz90se3I9OGw7UwuiNIwD5j3Xy?=
 =?iso-8859-1?Q?zT+WEQfNut7o6qssKTHdkHOmrkb9ps1cKQeYKPmZlXWTVV/loD3HBfvH9T?=
 =?iso-8859-1?Q?L8lfQPmvedI3auJ76nHAeThK1a4VuN8l4M8D/id7vW6VApPPF6IRfk0A?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c2859186-5334-45c9-1a55-08dc7969e461
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2024 07:44:49.2842
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZHyj8Zgm0uEbkdQMNi49FDfcsy9w/O1ZNtMEMqP0NGyOy1rveKNeVfwefJjdbS9LV0I1EKeaxbGMbO+EBU86yw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8506
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed a -98.9% regression of stress-ng.key.ops_per_sec on:


commit: 9578e327b2b4935a25d49e3891b8fcca9b6c10c6 ("keys: update key quotas in key_put()")
https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master

testcase: stress-ng
test machine: 64 threads 2 sockets Intel(R) Xeon(R) Gold 6346 CPU @ 3.10GHz (Ice Lake) with 256G memory
parameters:

	nr_threads: 100%
	testtime: 60s
	test: key
	cpufreq_governor: performance



If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202405211428.a5fd016-oliver.sang@intel.com


Details are as below:
-------------------------------------------------------------------------------------------------->


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20240521/202405211428.a5fd016-oliver.sang@intel.com

=========================================================================================
compiler/cpufreq_governor/kconfig/nr_threads/rootfs/tbox_group/test/testcase/testtime:
  gcc-13/performance/x86_64-rhel-8.3/100%/debian-12-x86_64-20240206.cgz/lkp-icl-2sp7/key/stress-ng/60s

commit: 
  45db3ab700 ("Merge tag '6.9-rc7-ksmbd-fixes' of git://git.samba.org/ksmbd")
  9578e327b2 ("keys: update key quotas in key_put()")

45db3ab700926379 9578e327b2b4935a25d49e3891b 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
      0.02 ±  5%      +0.4        0.40 ±  5%  mpstat.cpu.all.soft%
      3327 ±  4%     +26.3%       4203        vmstat.system.cs
    132586           +12.5%     149116        vmstat.system.in
    242317 ± 21%     +81.7%     440232 ±  7%  numa-numastat.node0.local_node
    265814 ± 20%     +77.8%     472661 ±  6%  numa-numastat.node0.numa_hit
    336040 ± 21%     +44.6%     485763 ± 12%  numa-numastat.node1.local_node
   1420300           -98.9%      16000        stress-ng.key.ops
     23671           -98.9%     266.57        stress-ng.key.ops_per_sec
     86664 ±  9%     +39.7%     121097 ±  3%  stress-ng.time.involuntary_context_switches
    147766 ±  2%     +13.5%     167740        meminfo.Active
    147701 ±  2%     +13.5%     167676        meminfo.Active(anon)
    383066          +113.9%     819244        meminfo.SUnreclaim
    474630           +91.8%     910260        meminfo.Slab
    197208 ±  4%    +117.4%     428732        numa-meminfo.node0.SUnreclaim
    243602 ± 10%     +97.4%     480764 ±  4%  numa-meminfo.node0.Slab
    185960 ±  4%    +108.0%     386790        numa-meminfo.node1.SUnreclaim
    231124 ± 10%     +84.2%     425753 ±  5%  numa-meminfo.node1.Slab
     49305 ±  4%    +117.5%     107260        numa-vmstat.node0.nr_slab_unreclaimable
    265330 ± 20%     +78.1%     472675 ±  6%  numa-vmstat.node0.numa_hit
    241833 ± 21%     +82.0%     440246 ±  7%  numa-vmstat.node0.numa_local
     46500 ±  4%    +108.2%      96809        numa-vmstat.node1.nr_slab_unreclaimable
    335385 ± 21%     +44.8%     485563 ± 12%  numa-vmstat.node1.numa_local
      1343 ± 60%    +284.2%       5162 ± 14%  perf-c2c.DRAM.local
      1029 ± 50%    +942.9%      10731 ±  9%  perf-c2c.DRAM.remote
    722.67 ±  2%   +1259.5%       9825        perf-c2c.HITM.local
    565.50 ±  4%   +1169.2%       7177        perf-c2c.HITM.remote
      1288 ±  2%   +1219.9%      17002        perf-c2c.HITM.total
    246.44 ±  7%     +13.0%     278.58 ±  5%  sched_debug.cfs_rq:/.runnable_avg.stddev
    218.77 ±  5%     +77.4%     388.20 ±  9%  sched_debug.cfs_rq:/.util_est.avg
    987.92 ±  9%     +36.9%       1352 ± 10%  sched_debug.cfs_rq:/.util_est.max
    177.06 ±  7%     +44.6%     256.06 ±  6%  sched_debug.cfs_rq:/.util_est.stddev
      3311 ±  2%     +12.2%       3716 ±  2%  sched_debug.cpu.nr_switches.avg
     37118 ±  2%     +10.5%      41032 ±  2%  proc-vmstat.nr_active_anon
     71004            +4.1%      73890        proc-vmstat.nr_shmem
     95794          +112.8%     203871        proc-vmstat.nr_slab_unreclaimable
     37118 ±  2%     +10.5%      41032 ±  2%  proc-vmstat.nr_zone_active_anon
      3916 ±  4%    +106.1%       8072 ± 56%  proc-vmstat.numa_hint_faults_local
    645123 ±  3%     +54.1%     993900 ±  3%  proc-vmstat.numa_hit
    578841 ±  4%     +60.3%     927625 ±  3%  proc-vmstat.numa_local
    902523 ±  2%    +108.0%    1876904 ±  4%  proc-vmstat.pgalloc_normal
    663704 ±  4%    +103.7%    1351779 ±  7%  proc-vmstat.pgfree
      0.49 ± 20%     +70.9%       0.84 ±  4%  perf-stat.i.MPKI
 5.892e+09            -9.9%  5.309e+09        perf-stat.i.branch-instructions
      0.60 ±  7%      +0.1        0.69 ±  5%  perf-stat.i.branch-miss-rate%
     43.36 ± 12%      +9.2       52.51 ±  3%  perf-stat.i.cache-miss-rate%
  11245283 ± 21%     +66.7%   18744064 ±  4%  perf-stat.i.cache-misses
  22283372 ± 13%     +57.0%   34986667 ±  2%  perf-stat.i.cache-references
      3339 ±  4%     +25.9%       4204 ±  2%  perf-stat.i.context-switches
      7.89            +8.4%       8.55        perf-stat.i.cpi
    136.30            +9.5%     149.28 ±  2%  perf-stat.i.cpu-migrations
     51088 ± 27%     -75.8%      12346 ±  4%  perf-stat.i.cycles-between-cache-misses
 2.461e+10            -7.7%  2.271e+10        perf-stat.i.instructions
      0.13            -8.6%       0.12        perf-stat.i.ipc
      0.04 ± 66%    +142.6%       0.10 ± 40%  perf-stat.i.major-faults
      0.43 ± 21%     +89.3%       0.82 ±  4%  perf-stat.overall.MPKI
      0.62 ±  6%      +0.1        0.71 ±  5%  perf-stat.overall.branch-miss-rate%
      7.92            +8.4%       8.58        perf-stat.overall.cpi
     19604 ± 31%     -46.5%      10494 ±  4%  perf-stat.overall.cycles-between-cache-misses
      0.13            -7.7%       0.12        perf-stat.overall.ipc
 5.796e+09           -10.0%  5.219e+09        perf-stat.ps.branch-instructions
  10473414 ± 21%     +74.6%   18283383 ±  4%  perf-stat.ps.cache-misses
  21668097 ± 13%     +58.6%   34375038 ±  2%  perf-stat.ps.cache-references
      3202 ±  4%     +28.6%       4117 ±  2%  perf-stat.ps.context-switches
    133.71            +9.5%     146.46 ±  2%  perf-stat.ps.cpu-migrations
 2.417e+10            -7.7%  2.231e+10        perf-stat.ps.instructions
      0.04 ± 66%    +162.8%       0.09 ± 41%  perf-stat.ps.major-faults
 1.473e+12            -8.1%  1.354e+12        perf-stat.total.instructions
     97.62           -97.6        0.00        perf-profile.calltrace.cycles-pp.read.stress_run
     97.60           -97.6        0.00        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.read.stress_run
     97.60           -97.6        0.00        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.read.stress_run
     97.59           -97.6        0.00        perf-profile.calltrace.cycles-pp.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe.read.stress_run
     97.59           -97.6        0.00        perf-profile.calltrace.cycles-pp.vfs_read.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe.read
     97.58           -97.6        0.00        perf-profile.calltrace.cycles-pp.proc_reg_read_iter.vfs_read.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe
     97.58           -97.6        0.00        perf-profile.calltrace.cycles-pp.seq_read_iter.proc_reg_read_iter.vfs_read.ksys_read.do_syscall_64
     95.99           -96.0        0.00        perf-profile.calltrace.cycles-pp.proc_keys_start.seq_read_iter.proc_reg_read_iter.vfs_read.ksys_read
     95.97           -96.0        0.00        perf-profile.calltrace.cycles-pp._raw_spin_lock.proc_keys_start.seq_read_iter.proc_reg_read_iter.vfs_read
     95.94           -95.9        0.00        perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock.proc_keys_start.seq_read_iter.proc_reg_read_iter
     98.04            -0.4       97.64        perf-profile.calltrace.cycles-pp.stress_run
      1.60            -0.0        1.58        perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock.key_garbage_collector.process_one_work.worker_thread
      1.66 ±  3%      +0.5        2.20        perf-profile.calltrace.cycles-pp.kthread.ret_from_fork.ret_from_fork_asm
      1.66 ±  3%      +0.5        2.20        perf-profile.calltrace.cycles-pp.ret_from_fork.ret_from_fork_asm
      1.66 ±  3%      +0.5        2.20        perf-profile.calltrace.cycles-pp.ret_from_fork_asm
      0.00            +0.6        0.58 ±  6%  perf-profile.calltrace.cycles-pp.rcu_do_batch.rcu_core.handle_softirqs.run_ksoftirqd.smpboot_thread_fn
      0.00            +0.6        0.58 ±  6%  perf-profile.calltrace.cycles-pp.rcu_core.handle_softirqs.run_ksoftirqd.smpboot_thread_fn.kthread
      0.00            +0.6        0.58 ±  5%  perf-profile.calltrace.cycles-pp.handle_softirqs.run_ksoftirqd.smpboot_thread_fn.kthread.ret_from_fork
      0.00            +0.6        0.58 ±  5%  perf-profile.calltrace.cycles-pp.run_ksoftirqd.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      0.00            +0.6        0.58 ±  5%  perf-profile.calltrace.cycles-pp.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      0.00            +3.1        3.13        perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock.key_lookup.lookup_user_key.keyctl_revoke_key
      0.00            +3.2        3.15        perf-profile.calltrace.cycles-pp._raw_spin_lock.key_lookup.lookup_user_key.keyctl_revoke_key.do_syscall_64
      0.00            +3.2        3.16        perf-profile.calltrace.cycles-pp.key_lookup.lookup_user_key.keyctl_revoke_key.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00            +3.2        3.20        perf-profile.calltrace.cycles-pp.lookup_user_key.keyctl_revoke_key.do_syscall_64.entry_SYSCALL_64_after_hwframe.syscall
      0.00            +3.2        3.25        perf-profile.calltrace.cycles-pp.keyctl_revoke_key.do_syscall_64.entry_SYSCALL_64_after_hwframe.syscall.stress_run
      0.00            +6.2        6.18        perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock.key_lookup.lookup_user_key.keyctl_read_key
      0.00            +6.2        6.19        perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock.key_lookup.lookup_user_key.keyctl_keyring_unlink
      0.00            +6.2        6.20        perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock.key_lookup.lookup_user_key.keyctl_get_security
      0.00            +6.2        6.20        perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock.key_lookup.lookup_user_key.keyctl_setperm_key
      0.00            +6.2        6.21        perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock.key_lookup.lookup_user_key.keyctl_describe_key
      0.00            +6.2        6.22        perf-profile.calltrace.cycles-pp._raw_spin_lock.key_lookup.lookup_user_key.keyctl_read_key.do_syscall_64
      0.00            +6.2        6.23        perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock.key_lookup.lookup_user_key.keyctl_keyring_link
      0.00            +6.2        6.23        perf-profile.calltrace.cycles-pp._raw_spin_lock.key_lookup.lookup_user_key.keyctl_keyring_unlink.do_syscall_64
      0.00            +6.2        6.24        perf-profile.calltrace.cycles-pp._raw_spin_lock.key_lookup.lookup_user_key.keyctl_describe_key.do_syscall_64
      0.00            +6.2        6.24        perf-profile.calltrace.cycles-pp._raw_spin_lock.key_lookup.lookup_user_key.keyctl_get_security.do_syscall_64
      0.00            +6.2        6.24        perf-profile.calltrace.cycles-pp._raw_spin_lock.key_lookup.lookup_user_key.keyctl_setperm_key.do_syscall_64
      0.00            +6.2        6.24        perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock.key_lookup.lookup_user_key.keyctl_update_key
      0.00            +6.2        6.25        perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock.key_alloc.__key_create_or_update.key_create_or_update
      0.00            +6.3        6.25        perf-profile.calltrace.cycles-pp.key_lookup.lookup_user_key.keyctl_keyring_unlink.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00            +6.3        6.25        perf-profile.calltrace.cycles-pp.key_lookup.lookup_user_key.keyctl_read_key.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00            +6.3        6.26        perf-profile.calltrace.cycles-pp._raw_spin_lock.key_lookup.lookup_user_key.keyctl_keyring_link.do_syscall_64
      0.00            +6.3        6.27        perf-profile.calltrace.cycles-pp.key_lookup.lookup_user_key.keyctl_setperm_key.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00            +6.3        6.27        perf-profile.calltrace.cycles-pp.key_lookup.lookup_user_key.keyctl_get_security.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00            +6.3        6.27        perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock.key_lookup.lookup_user_key.keyctl_set_timeout
      0.00            +6.3        6.28        perf-profile.calltrace.cycles-pp._raw_spin_lock.key_lookup.lookup_user_key.keyctl_update_key.do_syscall_64
      0.00            +6.3        6.28        perf-profile.calltrace.cycles-pp._raw_spin_lock.key_alloc.__key_create_or_update.key_create_or_update.__do_sys_add_key
      0.00            +6.3        6.29        perf-profile.calltrace.cycles-pp.key_lookup.lookup_user_key.keyctl_keyring_link.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00            +6.3        6.30        perf-profile.calltrace.cycles-pp.lookup_user_key.keyctl_read_key.do_syscall_64.entry_SYSCALL_64_after_hwframe.syscall
      0.00            +6.3        6.30        perf-profile.calltrace.cycles-pp.lookup_user_key.keyctl_keyring_unlink.do_syscall_64.entry_SYSCALL_64_after_hwframe.syscall
      0.00            +6.3        6.30        perf-profile.calltrace.cycles-pp._raw_spin_lock.key_lookup.lookup_user_key.keyctl_set_timeout.do_syscall_64
      0.00            +6.3        6.31        perf-profile.calltrace.cycles-pp.key_lookup.lookup_user_key.keyctl_update_key.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00            +6.3        6.31        perf-profile.calltrace.cycles-pp.keyctl_setperm_key.do_syscall_64.entry_SYSCALL_64_after_hwframe.syscall.stress_run
      0.00            +6.3        6.31        perf-profile.calltrace.cycles-pp.lookup_user_key.keyctl_setperm_key.do_syscall_64.entry_SYSCALL_64_after_hwframe.syscall
      0.00            +6.3        6.32        perf-profile.calltrace.cycles-pp.lookup_user_key.keyctl_get_security.do_syscall_64.entry_SYSCALL_64_after_hwframe.syscall
      0.00            +6.3        6.32        perf-profile.calltrace.cycles-pp.keyctl_get_security.do_syscall_64.entry_SYSCALL_64_after_hwframe.syscall.stress_run
      0.00            +6.3        6.33        perf-profile.calltrace.cycles-pp.keyctl_read_key.do_syscall_64.entry_SYSCALL_64_after_hwframe.syscall.stress_run
      0.00            +6.3        6.34        perf-profile.calltrace.cycles-pp.key_lookup.lookup_user_key.keyctl_set_timeout.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00            +6.3        6.35        perf-profile.calltrace.cycles-pp.lookup_user_key.keyctl_keyring_link.do_syscall_64.entry_SYSCALL_64_after_hwframe.syscall
      0.00            +6.4        6.36        perf-profile.calltrace.cycles-pp.lookup_user_key.keyctl_update_key.do_syscall_64.entry_SYSCALL_64_after_hwframe.syscall
      0.00            +6.4        6.38        perf-profile.calltrace.cycles-pp.lookup_user_key.keyctl_set_timeout.do_syscall_64.entry_SYSCALL_64_after_hwframe.syscall
      0.00            +6.4        6.40        perf-profile.calltrace.cycles-pp.keyctl_keyring_link.do_syscall_64.entry_SYSCALL_64_after_hwframe.syscall.stress_run
      0.00            +6.4        6.41        perf-profile.calltrace.cycles-pp.keyctl_update_key.do_syscall_64.entry_SYSCALL_64_after_hwframe.syscall.stress_run
      0.00            +6.4        6.41        perf-profile.calltrace.cycles-pp.keyctl_set_timeout.do_syscall_64.entry_SYSCALL_64_after_hwframe.syscall.stress_run
      0.00            +6.4        6.42        perf-profile.calltrace.cycles-pp.keyctl_keyring_unlink.do_syscall_64.entry_SYSCALL_64_after_hwframe.syscall.stress_run
      0.00            +6.4        6.42        perf-profile.calltrace.cycles-pp.key_lookup.lookup_user_key.keyctl_describe_key.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00            +6.5        6.49        perf-profile.calltrace.cycles-pp.lookup_user_key.keyctl_describe_key.do_syscall_64.entry_SYSCALL_64_after_hwframe.syscall
      0.00            +6.6        6.55        perf-profile.calltrace.cycles-pp.keyctl_describe_key.do_syscall_64.entry_SYSCALL_64_after_hwframe.syscall.stress_run
      0.00            +6.7        6.73        perf-profile.calltrace.cycles-pp.key_alloc.__key_create_or_update.key_create_or_update.__do_sys_add_key.do_syscall_64
      0.00            +7.0        7.04        perf-profile.calltrace.cycles-pp.__key_create_or_update.key_create_or_update.__do_sys_add_key.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00            +7.0        7.05        perf-profile.calltrace.cycles-pp.key_create_or_update.__do_sys_add_key.do_syscall_64.entry_SYSCALL_64_after_hwframe.syscall
      0.00            +7.2        7.22        perf-profile.calltrace.cycles-pp.__do_sys_add_key.do_syscall_64.entry_SYSCALL_64_after_hwframe.syscall.stress_run
      0.00           +12.4       12.44        perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock.key_lookup.lookup_user_key.keyctl_chown_key
      0.00           +12.5       12.51        perf-profile.calltrace.cycles-pp._raw_spin_lock.key_lookup.lookup_user_key.keyctl_chown_key.do_syscall_64
      0.00           +12.6       12.56        perf-profile.calltrace.cycles-pp.key_lookup.lookup_user_key.keyctl_chown_key.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00           +12.7       12.65        perf-profile.calltrace.cycles-pp.lookup_user_key.keyctl_chown_key.do_syscall_64.entry_SYSCALL_64_after_hwframe.syscall
      0.00           +12.7       12.66        perf-profile.calltrace.cycles-pp.keyctl_chown_key.do_syscall_64.entry_SYSCALL_64_after_hwframe.syscall.stress_run
      0.00           +21.8       21.80        perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock.key_lookup.lookup_user_key.keyctl_invalidate_key
      0.00           +21.9       21.92        perf-profile.calltrace.cycles-pp._raw_spin_lock.key_lookup.lookup_user_key.keyctl_invalidate_key.do_syscall_64
      0.00           +22.1       22.13        perf-profile.calltrace.cycles-pp.key_lookup.lookup_user_key.keyctl_invalidate_key.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00           +22.4       22.38        perf-profile.calltrace.cycles-pp.lookup_user_key.keyctl_invalidate_key.do_syscall_64.entry_SYSCALL_64_after_hwframe.syscall
      0.00           +22.4       22.44        perf-profile.calltrace.cycles-pp.keyctl_invalidate_key.do_syscall_64.entry_SYSCALL_64_after_hwframe.syscall.stress_run
      0.00           +97.3       97.28        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.syscall.stress_run
      0.00           +97.3       97.29        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.syscall.stress_run
      0.00           +97.5       97.50        perf-profile.calltrace.cycles-pp.syscall.stress_run
     97.62           -97.6        0.05        perf-profile.children.cycles-pp.read
     97.59           -97.6        0.02 ±141%  perf-profile.children.cycles-pp.proc_reg_read_iter
     97.60           -97.6        0.05        perf-profile.children.cycles-pp.ksys_read
     97.60           -97.5        0.05        perf-profile.children.cycles-pp.vfs_read
     97.58           -97.5        0.05        perf-profile.children.cycles-pp.seq_read_iter
     95.99           -96.0        0.00        perf-profile.children.cycles-pp.proc_keys_start
     97.56            -2.1       95.48        perf-profile.children.cycles-pp.native_queued_spin_lock_slowpath
     97.61            -2.1       95.54        perf-profile.children.cycles-pp._raw_spin_lock
      1.24 ±  3%      -1.2        0.06        perf-profile.children.cycles-pp.vsnprintf
     98.23            -0.8       97.42        perf-profile.children.cycles-pp.do_syscall_64
     98.24            -0.8       97.44        perf-profile.children.cycles-pp.entry_SYSCALL_64_after_hwframe
     98.04            -0.4       97.64        perf-profile.children.cycles-pp.stress_run
      0.00            +0.1        0.05        perf-profile.children.cycles-pp.__check_object_size
      0.00            +0.1        0.05        perf-profile.children.cycles-pp.assoc_array_insert_into_terminal_node
      0.00            +0.1        0.05        perf-profile.children.cycles-pp.queue_work_on
      0.00            +0.1        0.05 ±  7%  perf-profile.children.cycles-pp.__cond_resched
      0.00            +0.1        0.05 ±  7%  perf-profile.children.cycles-pp.key_user_lookup
      0.00            +0.1        0.05 ±  8%  perf-profile.children.cycles-pp.kvasprintf
      0.00            +0.1        0.06 ±  9%  perf-profile.children.cycles-pp.kasprintf
      0.00            +0.1        0.06 ±  8%  perf-profile.children.cycles-pp._get_random_bytes
      0.00            +0.1        0.06        perf-profile.children.cycles-pp.__kmalloc_node_track_caller
      0.00            +0.1        0.06        perf-profile.children.cycles-pp.entry_SYSCALL_64
      0.00            +0.1        0.08 ±  6%  perf-profile.children.cycles-pp.__key_instantiate_and_link
      0.00            +0.1        0.08 ±  4%  perf-profile.children.cycles-pp.key_type_lookup
      0.00            +0.1        0.08        perf-profile.children.cycles-pp.memdup_user
      0.00            +0.1        0.08 ±  5%  perf-profile.children.cycles-pp.down_read
      0.00            +0.1        0.08 ±  5%  perf-profile.children.cycles-pp.memcmp
      0.43 ±  3%      +0.1        0.52 ±  7%  perf-profile.children.cycles-pp.asm_sysvec_apic_timer_interrupt
      0.41 ±  3%      +0.1        0.50 ±  7%  perf-profile.children.cycles-pp.sysvec_apic_timer_interrupt
      0.00            +0.1        0.09        perf-profile.children.cycles-pp.request_key_and_link
      0.00            +0.1        0.09 ±  7%  perf-profile.children.cycles-pp.irq_exit_rcu
      0.00            +0.1        0.10        perf-profile.children.cycles-pp.__slab_free
      0.00            +0.1        0.10        perf-profile.children.cycles-pp.keyctl_keyring_search
      0.00            +0.1        0.11 ±  4%  perf-profile.children.cycles-pp.key_link
      0.00            +0.1        0.11        perf-profile.children.cycles-pp.key_unlink
      0.00            +0.1        0.13 ±  2%  perf-profile.children.cycles-pp.clear_bhb_loop
      0.00            +0.1        0.13 ±  2%  perf-profile.children.cycles-pp.keyring_compare_object
      0.00            +0.1        0.14 ±  3%  perf-profile.children.cycles-pp.kfree
      0.00            +0.1        0.14 ±  4%  perf-profile.children.cycles-pp.assoc_array_insert
      0.00            +0.2        0.17 ±  4%  perf-profile.children.cycles-pp.key_payload_reserve
      0.00            +0.2        0.18        perf-profile.children.cycles-pp.strnlen_user
      0.00            +0.2        0.19        perf-profile.children.cycles-pp.assoc_array_find
      0.00            +0.2        0.19 ±  3%  perf-profile.children.cycles-pp.__key_link_begin
      0.00            +0.2        0.23        perf-profile.children.cycles-pp.hash_key_type_and_desc
      0.02 ± 99%      +0.2        0.26        perf-profile.children.cycles-pp.strndup_user
      0.00            +0.4        0.35        perf-profile.children.cycles-pp.__do_sys_request_key
      0.00            +0.5        0.50 ±  8%  perf-profile.children.cycles-pp.key_put
      0.00            +0.5        0.52 ±  8%  perf-profile.children.cycles-pp.assoc_array_rcu_cleanup
      1.66 ±  3%      +0.5        2.20        perf-profile.children.cycles-pp.kthread
      1.66 ±  3%      +0.5        2.20        perf-profile.children.cycles-pp.ret_from_fork
      1.66 ±  3%      +0.5        2.20        perf-profile.children.cycles-pp.ret_from_fork_asm
      0.00            +0.6        0.56 ±  8%  perf-profile.children.cycles-pp._raw_spin_lock_irqsave
      0.00            +0.6        0.58 ±  5%  perf-profile.children.cycles-pp.run_ksoftirqd
      0.00            +0.6        0.58 ±  5%  perf-profile.children.cycles-pp.smpboot_thread_fn
      0.00            +0.7        0.66 ±  6%  perf-profile.children.cycles-pp.rcu_do_batch
      0.00            +0.7        0.66 ±  6%  perf-profile.children.cycles-pp.rcu_core
      0.00            +0.7        0.67 ±  6%  perf-profile.children.cycles-pp.handle_softirqs
      0.00            +0.7        0.69        perf-profile.children.cycles-pp.search_nested_keyrings
      0.00            +0.7        0.70        perf-profile.children.cycles-pp.search_cred_keyrings_rcu
      0.00            +0.7        0.71        perf-profile.children.cycles-pp.search_process_keyrings_rcu
      0.00            +0.7        0.72        perf-profile.children.cycles-pp.keyring_search_rcu
      0.00            +3.2        3.25        perf-profile.children.cycles-pp.keyctl_revoke_key
      0.00            +6.3        6.31        perf-profile.children.cycles-pp.keyctl_setperm_key
      0.00            +6.3        6.32        perf-profile.children.cycles-pp.keyctl_get_security
      0.00            +6.3        6.33        perf-profile.children.cycles-pp.keyctl_read_key
      0.00            +6.4        6.40        perf-profile.children.cycles-pp.keyctl_keyring_link
      0.00            +6.4        6.41        perf-profile.children.cycles-pp.keyctl_update_key
      0.00            +6.4        6.41        perf-profile.children.cycles-pp.keyctl_set_timeout
      0.00            +6.4        6.42        perf-profile.children.cycles-pp.keyctl_keyring_unlink
      0.00            +6.6        6.55        perf-profile.children.cycles-pp.keyctl_describe_key
      0.00            +6.7        6.73        perf-profile.children.cycles-pp.key_alloc
      0.07 ±  6%      +7.0        7.05        perf-profile.children.cycles-pp.__key_create_or_update
      0.07 ±  6%      +7.0        7.05        perf-profile.children.cycles-pp.key_create_or_update
      0.15 ±  2%      +7.1        7.22        perf-profile.children.cycles-pp.__do_sys_add_key
      0.00           +12.7       12.66        perf-profile.children.cycles-pp.keyctl_chown_key
      0.00           +22.4       22.45        perf-profile.children.cycles-pp.keyctl_invalidate_key
      0.00           +88.3       88.26        perf-profile.children.cycles-pp.key_lookup
      0.00           +89.1       89.10        perf-profile.children.cycles-pp.lookup_user_key
      0.20 ±  2%     +97.3       97.55        perf-profile.children.cycles-pp.syscall
     97.16            -2.1       95.03        perf-profile.self.cycles-pp.native_queued_spin_lock_slowpath
      0.00            +0.1        0.05        perf-profile.self.cycles-pp.queue_work_on
      0.00            +0.1        0.05 ±  8%  perf-profile.self.cycles-pp.key_put
      0.00            +0.1        0.06        perf-profile.self.cycles-pp.syscall
      0.00            +0.1        0.06 ±  6%  perf-profile.self.cycles-pp.assoc_array_insert
      0.00            +0.1        0.07        perf-profile.self.cycles-pp.key_payload_reserve
      0.00            +0.1        0.07 ±  5%  perf-profile.self.cycles-pp._raw_spin_lock_irqsave
      0.00            +0.1        0.08        perf-profile.self.cycles-pp.assoc_array_find
      0.00            +0.1        0.08        perf-profile.self.cycles-pp.memcmp
      0.00            +0.1        0.08 ±  4%  perf-profile.self.cycles-pp.down_read
      0.00            +0.1        0.10 ±  3%  perf-profile.self.cycles-pp.__slab_free
      0.00            +0.1        0.11 ±  5%  perf-profile.self.cycles-pp.lookup_user_key
      0.00            +0.1        0.12 ±  3%  perf-profile.self.cycles-pp.clear_bhb_loop
      0.00            +0.2        0.18 ±  2%  perf-profile.self.cycles-pp.strnlen_user
      0.00            +0.2        0.22 ±  2%  perf-profile.self.cycles-pp.hash_key_type_and_desc
      0.00            +0.2        0.24 ±  3%  perf-profile.self.cycles-pp.key_alloc
      0.00            +0.3        0.25        perf-profile.self.cycles-pp.search_nested_keyrings
      0.05            +0.5        0.53        perf-profile.self.cycles-pp._raw_spin_lock
      0.00            +0.6        0.64        perf-profile.self.cycles-pp.key_lookup



Disclaimer:
Results have been estimated based on internal Intel analysis and are provided
for informational purposes only. Any difference in system hardware or software
design or configuration may affect actual performance.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


