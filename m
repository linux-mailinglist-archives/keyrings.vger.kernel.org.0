Return-Path: <keyrings+bounces-1084-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C1358A242E
	for <lists+keyrings@lfdr.de>; Fri, 12 Apr 2024 05:07:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C548FB22BED
	for <lists+keyrings@lfdr.de>; Fri, 12 Apr 2024 03:07:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4461C14016;
	Fri, 12 Apr 2024 03:07:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jQAe7cCn"
X-Original-To: keyrings@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7FD914A9D
	for <keyrings@vger.kernel.org>; Fri, 12 Apr 2024 03:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712891250; cv=fail; b=sqowI84R0LcCcTswwcOIKLc+7QMzgdAdW//hsgGIMCKyIAsIXFV434HqMzl0fFycnmRQfuGHH5GPO7i9p0CTY/IvRQ8u7YZjji7niBIKbnKniPkTpSuI1v4tb+iMV1EaIJ3eGw9POrwPyZjKWLICZpc9b37ILnm7zLsGUlm1Jfo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712891250; c=relaxed/simple;
	bh=DEzYSaiqsf5p+av/hbtXRoR8A3W7Su1hHWHI92gG/sE=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=VCWG9P2XHTzmJxSHJjHJZHdLHLcHZhKw2PVvRPhMPcdIERdlt5Cq+WPKHMC5HkWejYDql3cbrkUTk2fckdrHM1/c17P56jVpsW4Yy9CcHiSdsP16PetK2MtCLJDquVGDxBkT7VwQcfI8vv2KuyTvOwejpuCjyfZVjbqrklR/fmE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jQAe7cCn; arc=fail smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712891247; x=1744427247;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:mime-version;
  bh=DEzYSaiqsf5p+av/hbtXRoR8A3W7Su1hHWHI92gG/sE=;
  b=jQAe7cCnocuFVSj+GH5ZEZXd6kmBKrHwEbs1M3G0UJwrT2M1+orncQQ4
   qQvOORDLUWonYKIGy1FqDe0ZVDO2fk7rw2fUz93WF8ZkayBRuhANLXrNN
   T9Zn2deTpGiJGnb/Hx4uzbWHoaVq6Y6Zk3/mvJ0B44yiV3Ec9/p8awnQs
   0nAA3JFfBXbnLryH6mBXEtMqDa/2akjGBm6CSM1b1llz7Dd8k9LFrd9cy
   HH+h1Fn1Hv1HiWs6fF0HOO4eamMEXwFBSg4MO+eWszwMyJNKEUUFc7boT
   SK0ZEdnMuAwDO7ieLiQOCTxP2BvbzUMBusEvPK0aUrkXevx+uo50EkAYl
   Q==;
X-CSE-ConnectionGUID: CgqB97sOR5KWdBzkOWUGWA==
X-CSE-MsgGUID: mE+1cVLqQsaDyx26NXOkdQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="12187301"
X-IronPort-AV: E=Sophos;i="6.07,194,1708416000"; 
   d="scan'208";a="12187301"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2024 20:07:26 -0700
X-CSE-ConnectionGUID: bUzmMfECSe6mUItBEhJpMg==
X-CSE-MsgGUID: 02CbB/fGQHa0jecpTBf7Fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,194,1708416000"; 
   d="scan'208";a="21151140"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 11 Apr 2024 20:07:26 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 11 Apr 2024 20:07:25 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 11 Apr 2024 20:07:25 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 11 Apr 2024 20:07:25 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 11 Apr 2024 20:07:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZMWIM+0HeGbKARcTQ3UlRCz9LwH91FRlqaj39WnpK8g7rHQ75OJ8ZoKBY+YSE3KYWRD87t2heL4hcwJLcdesu1KsEQdXyyWvdILVWUwXcfuYmO4uqmtuBJUulvpftg1ShgbWBEWBJUPsO53SRXQMzeQ+LXmMwB/F6bINBYud7fF9GHRTmH5GzsiAP5OpUaqNXE1HA+9dL8f4j8//pn3BiTrr8J3MJlKIpFje2fwzNSFfxH3y2a40rhihqAbV3sGBHWrgjsDsfpHbzOcfXOgrheOZOT8uZcfpM+UUQYOV0i9tW/V4SapbmC0SZaKDAE/N0vhJCwv79GG6kR34vDZG3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/iQqRARpLFEMx0Ja0XsXIY/+dro/nAfYXNg1Kbsxixo=;
 b=E4YKJalgHOOJz4/mNWKvhH5Rf9EOt+sXAuLwSzLePmwCjNcSgxxIvGi02LQ9AkLQp2F89efNtDDJVFXvzVoQJvEuOiJydWqQ8IrZIsbwU9DOfpkl59meoksZsZMravtc4SPNAvZyUPnPUtB+TOW1rVR9B8180Fz3ckFgVuAGcTqJu34S9P3Q9z1T1rD/qNjbiycWux1KjOJ7UpSM5RO+8i+NH2v08FS7aWEdK/Mj6eKs1WaLekneQ8PX8XC5CsvIvihnx9VpOYuGGX1QDtK8Ef/Lnj716GxMo1qcMoSUuMi4Z5qIvFTVtRpcPkxDO4Ar/0TCu+yzaFNqqVF24Vve8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by PH8PR11MB6973.namprd11.prod.outlook.com (2603:10b6:510:226::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7430.46; Fri, 12 Apr
 2024 03:07:19 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::58dd:99ca:74a6:2e3e]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::58dd:99ca:74a6:2e3e%3]) with mapi id 15.20.7472.025; Fri, 12 Apr 2024
 03:07:19 +0000
Date: Fri, 12 Apr 2024 11:07:08 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Luis Henriques <lhenriques@suse.de>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, Linux Memory Management List
	<linux-mm@kvack.org>, Jarkko Sakkinen <jarkko@kernel.org>, David Howells
	<dhowells@redhat.com>, Jarkko Sakkinen <jarkko.sakkinen@kernel.org>,
	<keyrings@vger.kernel.org>, <ying.huang@intel.com>, <feng.tang@intel.com>,
	<fengwei.yin@intel.com>, <oliver.sang@intel.com>
Subject: [linux-next:master] [keys]  019e41d1be:  stress-ng.key.ops_per_sec
 -98.9% regression
Message-ID: <202404121005.d2eb358a-oliver.sang@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI1PR02CA0041.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::18) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|PH8PR11MB6973:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f120b9f-ee42-4ed6-7aef-08dc5a9da9f2
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vz7lC1syVBqNFKjnX0CaZxYJNGTG5bYf9C9g+WrJfG3zVHf48a/N6Jg1inskZ4ckkibihGWvHAORMIsGwLuOBJMoL5UTz0NbmNlh41KQBj6wDe8qUFfjX+SPfjkf+qH0EJ6BNzAge/PLRc3gAge14L7crYZGRiUIBwSYFliT3BL6yj4Or6slunqDtDuq0frexj4mF4G0in5NmL7kbGhJsSG7obVYkSAVJBAKIbiFJ4olYjauV7j5mQY2ZBVI5+wrOlNk/HvAL5wdNvpaHDJZ7QyzCK3LueBiIV8PH+nT6LJYx+i9XjbzDP2ve5POI+aiugcVwj6CjJV4PJZ9f+A4Q02nTpvK20IzwvizZ/2JlOiYbB6wWPsKhP5oPtLLSgri9hv5dLpCP4b43OQk7UruytK0FLk4Ld6gYqyF9FH5EnmyYcV5lNHAbbvJGddey5qmcGbR6viSBDpTuYj/VQZMxVfRIRyMJqeQe47vFrsmV8hkO5lLbe89i91eiQBkNMwmpzdVY91fmdTE3gRbhCn6JJ3agd/6iAGC5ESesaYMMIuzg6Z48KwHk+ldeftKrwIGkJcMQ2YdsrcpOh4AH58xJHSIv7kbd7wLr1jE6UuZ3egknc3PubbwDe2B+/rm7tL2
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(366007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?Uc4iug+Qm77Jt2+KFl55u9LhTv2EL+fbY+2kUzXHgRdRPkIrh/p03pHkX3?=
 =?iso-8859-1?Q?UD8gaj/JOgj9IGS8paep8xF4wvKyD/zr9f9XtvsnJx219mayG9zqwwNxnM?=
 =?iso-8859-1?Q?CHAEi21rZpt0EumjRfsFlWMFLaYzqJAs9dr6yLFevqqQcqVV1Wz4Y3XdE7?=
 =?iso-8859-1?Q?aW3oYQZC2pcURPHL9Uz8x7baSOV/Ih21crURbb1KYhpXojOSY0e83eZ1vx?=
 =?iso-8859-1?Q?2NURKUeWkP+DCkEdKofQWX1SCTSrhq0+BlR9obDRt+0Vb6CKDdmEnzHkKZ?=
 =?iso-8859-1?Q?vxup/SvP0gYXrlsYFlJ3geu2gzsSJeJbKzrVfjbx0fWyE1/nkl8g4CAknY?=
 =?iso-8859-1?Q?aOiBx4WFK0Pzi8U+U2ZF2EazA039/0pQg4feO7KTxhwSNAhDzFSJjGNWco?=
 =?iso-8859-1?Q?P1KBBqn6J7P4B1xEF9sWcqw1dkH0qpjT/caRsLNOu9T5Ei/rGl7pE1YPP0?=
 =?iso-8859-1?Q?dg2nik2n53JC7kD5gMc/e2h5tSP9p4Jwn+ct8Xvxos5REChWllNZ6nENNI?=
 =?iso-8859-1?Q?AL59s1/8U19LB/AlgHAEVBWQ/Np+WmzlLND1lp9284iRz8Az/t8QnTdyyL?=
 =?iso-8859-1?Q?+84REwKXicNKgF1qQnX3reXaQ05pomEgYkLr1/ahxcOaQDafrMGzoJyS6q?=
 =?iso-8859-1?Q?JJKIDatuQ96f4/cwW4NeTkTx/muxUBRjVT4csqYUqSRuyLaeQi6GAR8LnS?=
 =?iso-8859-1?Q?n9YslejBmIy2qBoRcKixJT1LWU/XjbFJd1cbGf7/l1GaN1bdUX73J8JUsT?=
 =?iso-8859-1?Q?7MD2Z5q0bPaPcPJijYkKQUYYBwJ/ufu1tt8qGN+y50CamBNkAoALIikbZN?=
 =?iso-8859-1?Q?9sBBjQfT5wjXI4RLo8V2qjmS7N8oIqz/iXSO8F4NWMkvFyi2Z1OPFU9Jxn?=
 =?iso-8859-1?Q?CQNs6v30XeH+vnPoH024G/96k7e2Dx7Ok8o92ECj/JoZTILpaPc0mB0aD5?=
 =?iso-8859-1?Q?6dEG4vi0V658Tn00uJNVMoBSwko1pxxtJdZjgxdhvlbjADla/hySiW2MnC?=
 =?iso-8859-1?Q?dqQqfcWY6OogqMXJf4QDeVPR77EZCbXopR8Y1Q2hZgecZu8rAk98em/4Iv?=
 =?iso-8859-1?Q?9gtc4fC/npSHBqE5AQ5tDuKKZZZYiaMmHxku/VUN0NGOtIlUAM+OcLcUcW?=
 =?iso-8859-1?Q?3c5JtNDhIK4mN7S1xBo3HJsXJdzsD0nlpiOTgnsSnFLdWKiDzoow29uvIw?=
 =?iso-8859-1?Q?dA8Xvw/uJr/2D2omZrjxatnREhTbfyGWf6Pt63vwarGUAKUeZHPJj6ZqoE?=
 =?iso-8859-1?Q?bLQktT66aPmawhgImbU1y7zz2hjSLmixEp3yxR0kJTm6+Td5lQxZ+gXa3b?=
 =?iso-8859-1?Q?LUTTacEFiwm93WhJoF2KPLYVmro+J/ux+3XgrVtymGs3oofm7fWBOokpWS?=
 =?iso-8859-1?Q?M5wztrK8eEup8qK7pjW4Eek+APctrMJFK6VvxOc94twXEPXTcw1gDIMZa7?=
 =?iso-8859-1?Q?QLPn6WNBl52N19uKPMrGc7BRziq0Tq4YwETiNe++0M11nIYHxyJdL6wy/H?=
 =?iso-8859-1?Q?2lIsinhqNT4vMph+NuDTZoGkeXrt+IL149TjGJ6QodTuOsBBIGV99d5mJo?=
 =?iso-8859-1?Q?zLWnpkWDXS8UC0jSvR3MjztNh2QhrtE99G1W0BtKfdd7O6qnt0fxO1YnFQ?=
 =?iso-8859-1?Q?hjr29JiWt0+5eQAIeGgLEAlIPIf4scx2Ow?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f120b9f-ee42-4ed6-7aef-08dc5a9da9f2
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2024 03:07:19.0603
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zSALudCEg+DGoxDcOjnyRHE1mWwGBVmM7DPj4Qh+o5pTLAVoJsTiFnZQbmp3FsU9sB+4+W8TN2OxTCmT/e7iKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6973
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed a -98.9% regression of stress-ng.key.ops_per_sec on:


commit: 019e41d1bee9bb730dfd1ccecabdb254e5c3b6cc ("keys: update key quotas in key_put()")
https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master

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
| Closes: https://lore.kernel.org/oe-lkp/202404121005.d2eb358a-oliver.sang@intel.com


Details are as below:
-------------------------------------------------------------------------------------------------->


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20240412/202404121005.d2eb358a-oliver.sang@intel.com

=========================================================================================
compiler/cpufreq_governor/kconfig/nr_threads/rootfs/tbox_group/test/testcase/testtime:
  gcc-13/performance/x86_64-rhel-8.3/100%/debian-12-x86_64-20240206.cgz/lkp-icl-2sp7/key/stress-ng/60s

commit: 
  928a87efa4 ("Merge tag 'gfs2-v6.8-fix' of git://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2")
  019e41d1be ("keys: update key quotas in key_put()")

928a87efa42302a2 019e41d1bee9bb730dfd1ccecab 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
      0.02 ±  2%      +0.3        0.32 ±  9%  mpstat.cpu.all.soft%
      2.49 ±  4%      +0.2        2.74 ±  6%  mpstat.cpu.all.usr%
      3569 ±  5%     +25.1%       4464 ±  6%  vmstat.system.cs
    132355           +12.6%     149062        vmstat.system.in
    231851 ± 21%     +99.8%     463144 ± 13%  numa-numastat.node0.local_node
    261492 ± 24%     +82.4%     476945 ± 13%  numa-numastat.node0.numa_hit
    383953 ± 19%     +36.1%     522743 ± 12%  numa-numastat.node1.numa_hit
    224.89 ±  8%     +54.5%     347.45 ± 10%  sched_debug.cfs_rq:/.util_est.avg
    181.48 ±  9%     +27.2%     230.90 ± 10%  sched_debug.cfs_rq:/.util_est.stddev
      3443 ±  4%     +13.4%       3905 ±  5%  sched_debug.cpu.nr_switches.avg
   1418611           -98.9%      16031        stress-ng.key.ops
     23643           -98.9%     267.08        stress-ng.key.ops_per_sec
     89963 ±  9%     +38.6%     124714 ±  9%  stress-ng.time.involuntary_context_switches
    150856 ±  3%     +10.0%     165912 ±  2%  meminfo.Active
    150824 ±  3%     +10.0%     165878 ±  2%  meminfo.Active(anon)
    381558          +116.1%     824606        meminfo.SUnreclaim
    472814           +93.8%     916219        meminfo.Slab
      1454 ± 23%    +335.2%       6329 ± 27%  perf-c2c.DRAM.local
    802.50 ±  4%   +1147.1%      10008 ±  2%  perf-c2c.DRAM.remote
    754.17 ±  7%   +1167.1%       9556 ±  3%  perf-c2c.HITM.local
    588.83 ±  3%   +1097.3%       7050 ±  2%  perf-c2c.HITM.remote
      1343 ±  4%   +1136.5%      16606 ±  3%  perf-c2c.HITM.total
      6575 ± 16%    +145.4%      16140 ± 20%  numa-meminfo.node0.Active
      6549 ± 16%    +146.0%      16110 ± 20%  numa-meminfo.node0.Active(anon)
    204390 ±  5%    +106.4%     421876 ±  3%  numa-meminfo.node0.SUnreclaim
    258837 ±  9%     +86.0%     481426 ±  7%  numa-meminfo.node0.Slab
    178481 ±  6%    +122.2%     396525 ±  4%  numa-meminfo.node1.SUnreclaim
    215280 ± 10%     +99.1%     428555 ±  8%  numa-meminfo.node1.Slab
      1645 ± 16%    +143.6%       4007 ± 20%  numa-vmstat.node0.nr_active_anon
     51114 ±  5%    +106.5%     105542 ±  3%  numa-vmstat.node0.nr_slab_unreclaimable
      1645 ± 16%    +143.6%       4007 ± 20%  numa-vmstat.node0.nr_zone_active_anon
    261119 ± 24%     +82.7%     476985 ± 13%  numa-vmstat.node0.numa_hit
    231477 ± 21%    +100.1%     463184 ± 13%  numa-vmstat.node0.numa_local
     44634 ±  6%    +122.3%      99202 ±  4%  numa-vmstat.node1.nr_slab_unreclaimable
    383077 ± 19%     +36.3%     522226 ± 13%  numa-vmstat.node1.numa_hit
     37749 ±  2%      +7.3%      40496 ±  4%  proc-vmstat.nr_active_anon
     71137            +4.1%      74072        proc-vmstat.nr_shmem
     95721          +114.2%     205034        proc-vmstat.nr_slab_unreclaimable
     37749 ±  2%      +7.3%      40496 ±  4%  proc-vmstat.nr_zone_active_anon
    645807 ±  2%     +55.2%    1002156        proc-vmstat.numa_hit
    579527 ±  2%     +61.5%     935903        proc-vmstat.numa_local
    898522 ±  2%    +105.5%    1846347        proc-vmstat.pgalloc_normal
    647568 ±  4%    +103.5%    1317984 ±  2%  proc-vmstat.pgfree
      0.51 ±  7%     +68.9%       0.86 ±  3%  perf-stat.i.MPKI
 5.863e+09           -11.2%  5.207e+09        perf-stat.i.branch-instructions
      0.61 ±  4%      +0.1        0.75 ±  8%  perf-stat.i.branch-miss-rate%
     41.80 ± 12%     +10.7       52.51 ±  2%  perf-stat.i.cache-miss-rate%
  11580284 ±  7%     +65.6%   19179253 ±  2%  perf-stat.i.cache-misses
  23119726 ±  2%     +55.7%   36004185        perf-stat.i.cache-references
      3622 ±  6%     +23.4%       4471 ±  7%  perf-stat.i.context-switches
      7.86            +8.5%       8.53        perf-stat.i.cpi
    134.82 ±  2%      +9.4%     147.51 ±  2%  perf-stat.i.cpu-migrations
     53914 ± 16%     -77.5%      12106 ±  3%  perf-stat.i.cycles-between-cache-misses
  2.47e+10            -7.9%  2.274e+10        perf-stat.i.instructions
      0.13            -8.2%       0.12        perf-stat.i.ipc
      0.44 ±  8%     +88.5%       0.84 ±  3%  perf-stat.overall.MPKI
      0.62 ±  4%      +0.1        0.77 ±  7%  perf-stat.overall.branch-miss-rate%
      7.90            +8.4%       8.56        perf-stat.overall.cpi
     17893 ±  7%     -42.8%      10237 ±  2%  perf-stat.overall.cycles-between-cache-misses
      0.13            -7.8%       0.12        perf-stat.overall.ipc
 5.764e+09           -11.2%   5.12e+09        perf-stat.ps.branch-instructions
  10766056 ±  8%     +73.8%   18709213 ±  2%  perf-stat.ps.cache-misses
  22377319 ±  2%     +58.1%   35372285        perf-stat.ps.cache-references
      3457 ±  6%     +26.7%       4381 ±  7%  perf-stat.ps.context-switches
    132.32 ±  2%      +9.5%     144.94 ±  2%  perf-stat.ps.cpu-migrations
 2.424e+10            -7.8%  2.235e+10        perf-stat.ps.instructions
  1.48e+12            -8.2%  1.358e+12        perf-stat.total.instructions
     97.58           -97.6        0.00        perf-profile.calltrace.cycles-pp.read.stress_run
     97.57           -97.6        0.00        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.read.stress_run
     97.57           -97.6        0.00        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.read.stress_run
     97.56           -97.6        0.00        perf-profile.calltrace.cycles-pp.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe.read.stress_run
     97.56           -97.6        0.00        perf-profile.calltrace.cycles-pp.vfs_read.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe.read
     97.56           -97.6        0.00        perf-profile.calltrace.cycles-pp.proc_reg_read_iter.vfs_read.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe
     97.55           -97.5        0.00        perf-profile.calltrace.cycles-pp.seq_read_iter.proc_reg_read_iter.vfs_read.ksys_read.do_syscall_64
     95.95           -96.0        0.00        perf-profile.calltrace.cycles-pp.proc_keys_start.seq_read_iter.proc_reg_read_iter.vfs_read.ksys_read
     95.93           -95.9        0.00        perf-profile.calltrace.cycles-pp._raw_spin_lock.proc_keys_start.seq_read_iter.proc_reg_read_iter.vfs_read
     95.90           -95.9        0.00        perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock.proc_keys_start.seq_read_iter.proc_reg_read_iter
      1.70 ±  6%      +0.5        2.16 ±  2%  perf-profile.calltrace.cycles-pp.kthread.ret_from_fork.ret_from_fork_asm
      1.70 ±  6%      +0.5        2.16 ±  2%  perf-profile.calltrace.cycles-pp.ret_from_fork.ret_from_fork_asm
      1.70 ±  6%      +0.5        2.16 ±  2%  perf-profile.calltrace.cycles-pp.ret_from_fork_asm
      0.00            +3.1        3.14        perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock.key_lookup.lookup_user_key.keyctl_revoke_key
      0.00            +3.2        3.16        perf-profile.calltrace.cycles-pp._raw_spin_lock.key_lookup.lookup_user_key.keyctl_revoke_key.do_syscall_64
      0.00            +3.2        3.17        perf-profile.calltrace.cycles-pp.key_lookup.lookup_user_key.keyctl_revoke_key.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00            +3.2        3.22        perf-profile.calltrace.cycles-pp.lookup_user_key.keyctl_revoke_key.do_syscall_64.entry_SYSCALL_64_after_hwframe.syscall
      0.00            +3.3        3.26        perf-profile.calltrace.cycles-pp.keyctl_revoke_key.do_syscall_64.entry_SYSCALL_64_after_hwframe.syscall.stress_run
      0.00            +6.2        6.20        perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock.key_lookup.lookup_user_key.keyctl_read_key
      0.00            +6.2        6.21        perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock.key_lookup.lookup_user_key.keyctl_describe_key
      0.00            +6.2        6.22        perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock.key_lookup.lookup_user_key.keyctl_get_security
      0.00            +6.2        6.22        perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock.key_lookup.lookup_user_key.keyctl_keyring_unlink
      0.00            +6.2        6.22        perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock.key_lookup.lookup_user_key.keyctl_setperm_key
      0.00            +6.2        6.23        perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock.key_lookup.lookup_user_key.keyctl_keyring_link
      0.00            +6.2        6.24        perf-profile.calltrace.cycles-pp._raw_spin_lock.key_lookup.lookup_user_key.keyctl_read_key.do_syscall_64
      0.00            +6.2        6.25        perf-profile.calltrace.cycles-pp._raw_spin_lock.key_lookup.lookup_user_key.keyctl_describe_key.do_syscall_64
      0.00            +6.3        6.25        perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock.key_alloc.__key_create_or_update.key_create_or_update
      0.00            +6.3        6.25        perf-profile.calltrace.cycles-pp._raw_spin_lock.key_lookup.lookup_user_key.keyctl_get_security.do_syscall_64
      0.00            +6.3        6.26        perf-profile.calltrace.cycles-pp._raw_spin_lock.key_lookup.lookup_user_key.keyctl_keyring_unlink.do_syscall_64
      0.00            +6.3        6.26        perf-profile.calltrace.cycles-pp._raw_spin_lock.key_lookup.lookup_user_key.keyctl_setperm_key.do_syscall_64
      0.00            +6.3        6.26        perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock.key_lookup.lookup_user_key.keyctl_update_key
      0.00            +6.3        6.26        perf-profile.calltrace.cycles-pp.key_lookup.lookup_user_key.keyctl_read_key.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00            +6.3        6.27        perf-profile.calltrace.cycles-pp._raw_spin_lock.key_lookup.lookup_user_key.keyctl_keyring_link.do_syscall_64
      0.00            +6.3        6.28        perf-profile.calltrace.cycles-pp.key_lookup.lookup_user_key.keyctl_keyring_unlink.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00            +6.3        6.28        perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock.key_lookup.lookup_user_key.keyctl_set_timeout
      0.00            +6.3        6.28        perf-profile.calltrace.cycles-pp.key_lookup.lookup_user_key.keyctl_get_security.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00            +6.3        6.28        perf-profile.calltrace.cycles-pp._raw_spin_lock.key_alloc.__key_create_or_update.key_create_or_update.__do_sys_add_key
      0.00            +6.3        6.28        perf-profile.calltrace.cycles-pp.key_lookup.lookup_user_key.keyctl_setperm_key.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00            +6.3        6.29        perf-profile.calltrace.cycles-pp.key_lookup.lookup_user_key.keyctl_keyring_link.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00            +6.3        6.30        perf-profile.calltrace.cycles-pp._raw_spin_lock.key_lookup.lookup_user_key.keyctl_update_key.do_syscall_64
      0.00            +6.3        6.31        perf-profile.calltrace.cycles-pp.lookup_user_key.keyctl_read_key.do_syscall_64.entry_SYSCALL_64_after_hwframe.syscall
      0.00            +6.3        6.31        perf-profile.calltrace.cycles-pp._raw_spin_lock.key_lookup.lookup_user_key.keyctl_set_timeout.do_syscall_64
      0.00            +6.3        6.33        perf-profile.calltrace.cycles-pp.key_lookup.lookup_user_key.keyctl_update_key.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00            +6.3        6.33        perf-profile.calltrace.cycles-pp.lookup_user_key.keyctl_get_security.do_syscall_64.entry_SYSCALL_64_after_hwframe.syscall
      0.00            +6.3        6.33        perf-profile.calltrace.cycles-pp.lookup_user_key.keyctl_keyring_unlink.do_syscall_64.entry_SYSCALL_64_after_hwframe.syscall
      0.00            +6.3        6.33        perf-profile.calltrace.cycles-pp.lookup_user_key.keyctl_setperm_key.do_syscall_64.entry_SYSCALL_64_after_hwframe.syscall
      0.00            +6.3        6.33        perf-profile.calltrace.cycles-pp.keyctl_get_security.do_syscall_64.entry_SYSCALL_64_after_hwframe.syscall.stress_run
      0.00            +6.3        6.34        perf-profile.calltrace.cycles-pp.keyctl_setperm_key.do_syscall_64.entry_SYSCALL_64_after_hwframe.syscall.stress_run
      0.00            +6.3        6.34        perf-profile.calltrace.cycles-pp.key_lookup.lookup_user_key.keyctl_set_timeout.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00            +6.3        6.35        perf-profile.calltrace.cycles-pp.keyctl_read_key.do_syscall_64.entry_SYSCALL_64_after_hwframe.syscall.stress_run
      0.00            +6.3        6.35        perf-profile.calltrace.cycles-pp.lookup_user_key.keyctl_keyring_link.do_syscall_64.entry_SYSCALL_64_after_hwframe.syscall
      0.00            +6.4        6.38        perf-profile.calltrace.cycles-pp.lookup_user_key.keyctl_update_key.do_syscall_64.entry_SYSCALL_64_after_hwframe.syscall
      0.00            +6.4        6.40        perf-profile.calltrace.cycles-pp.lookup_user_key.keyctl_set_timeout.do_syscall_64.entry_SYSCALL_64_after_hwframe.syscall
      0.00            +6.4        6.40        perf-profile.calltrace.cycles-pp.keyctl_keyring_link.do_syscall_64.entry_SYSCALL_64_after_hwframe.syscall.stress_run
      0.00            +6.4        6.42        perf-profile.calltrace.cycles-pp.key_lookup.lookup_user_key.keyctl_describe_key.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00            +6.4        6.42        perf-profile.calltrace.cycles-pp.keyctl_set_timeout.do_syscall_64.entry_SYSCALL_64_after_hwframe.syscall.stress_run
      0.00            +6.4        6.43        perf-profile.calltrace.cycles-pp.keyctl_update_key.do_syscall_64.entry_SYSCALL_64_after_hwframe.syscall.stress_run
      0.00            +6.4        6.44        perf-profile.calltrace.cycles-pp.keyctl_keyring_unlink.do_syscall_64.entry_SYSCALL_64_after_hwframe.syscall.stress_run
      0.00            +6.5        6.49        perf-profile.calltrace.cycles-pp.lookup_user_key.keyctl_describe_key.do_syscall_64.entry_SYSCALL_64_after_hwframe.syscall
      0.00            +6.5        6.55        perf-profile.calltrace.cycles-pp.keyctl_describe_key.do_syscall_64.entry_SYSCALL_64_after_hwframe.syscall.stress_run
      0.00            +6.7        6.74        perf-profile.calltrace.cycles-pp.key_alloc.__key_create_or_update.key_create_or_update.__do_sys_add_key.do_syscall_64
      0.00            +7.0        7.04        perf-profile.calltrace.cycles-pp.__key_create_or_update.key_create_or_update.__do_sys_add_key.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00            +7.0        7.05        perf-profile.calltrace.cycles-pp.key_create_or_update.__do_sys_add_key.do_syscall_64.entry_SYSCALL_64_after_hwframe.syscall
      0.00            +7.2        7.22        perf-profile.calltrace.cycles-pp.__do_sys_add_key.do_syscall_64.entry_SYSCALL_64_after_hwframe.syscall.stress_run
      0.00           +12.5       12.47        perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock.key_lookup.lookup_user_key.keyctl_chown_key
      0.00           +12.5       12.54        perf-profile.calltrace.cycles-pp._raw_spin_lock.key_lookup.lookup_user_key.keyctl_chown_key.do_syscall_64
      0.00           +12.6       12.59        perf-profile.calltrace.cycles-pp.key_lookup.lookup_user_key.keyctl_chown_key.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00           +12.7       12.68        perf-profile.calltrace.cycles-pp.lookup_user_key.keyctl_chown_key.do_syscall_64.entry_SYSCALL_64_after_hwframe.syscall
      0.00           +12.7       12.69        perf-profile.calltrace.cycles-pp.keyctl_chown_key.do_syscall_64.entry_SYSCALL_64_after_hwframe.syscall.stress_run
      0.00           +21.8       21.83        perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock.key_lookup.lookup_user_key.keyctl_invalidate_key
      0.00           +22.0       21.95        perf-profile.calltrace.cycles-pp._raw_spin_lock.key_lookup.lookup_user_key.keyctl_invalidate_key.do_syscall_64
      0.00           +22.2       22.16        perf-profile.calltrace.cycles-pp.key_lookup.lookup_user_key.keyctl_invalidate_key.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00           +22.4       22.41        perf-profile.calltrace.cycles-pp.lookup_user_key.keyctl_invalidate_key.do_syscall_64.entry_SYSCALL_64_after_hwframe.syscall
      0.00           +22.5       22.48        perf-profile.calltrace.cycles-pp.keyctl_invalidate_key.do_syscall_64.entry_SYSCALL_64_after_hwframe.syscall.stress_run
      0.00           +97.4       97.42        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.syscall.stress_run
      0.00           +97.4       97.44        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.syscall.stress_run
      0.00           +97.5       97.54        perf-profile.calltrace.cycles-pp.syscall.stress_run
     97.56           -97.6        0.01 ±223%  perf-profile.children.cycles-pp.proc_reg_read_iter
     97.59           -97.5        0.05 ±  7%  perf-profile.children.cycles-pp.read
     97.57           -97.5        0.05        perf-profile.children.cycles-pp.ksys_read
     97.57           -97.5        0.05        perf-profile.children.cycles-pp.vfs_read
     97.55           -97.5        0.04 ± 44%  perf-profile.children.cycles-pp.seq_read_iter
     95.95           -96.0        0.00        perf-profile.children.cycles-pp.proc_keys_start
     97.52            -2.0       95.56        perf-profile.children.cycles-pp.native_queued_spin_lock_slowpath
     97.56            -1.8       95.72        perf-profile.children.cycles-pp._raw_spin_lock
      1.25 ±  3%      -1.2        0.06        perf-profile.children.cycles-pp.vsnprintf
     98.23            -0.6       97.59        perf-profile.children.cycles-pp.do_syscall_64
     98.23            -0.6       97.60        perf-profile.children.cycles-pp.entry_SYSCALL_64_after_hwframe
      0.00            +0.1        0.05        perf-profile.children.cycles-pp.__check_object_size
      0.00            +0.1        0.05        perf-profile.children.cycles-pp.assoc_array_insert_into_terminal_node
      0.00            +0.1        0.05        perf-profile.children.cycles-pp.entry_SYSRETQ_unsafe_stack
      0.00            +0.1        0.05        perf-profile.children.cycles-pp.up_read
      0.00            +0.1        0.05 ±  7%  perf-profile.children.cycles-pp.kasprintf
      0.00            +0.1        0.05 ±  7%  perf-profile.children.cycles-pp.kvasprintf
      0.00            +0.1        0.06 ±  9%  perf-profile.children.cycles-pp.__cond_resched
      0.00            +0.1        0.06 ±  6%  perf-profile.children.cycles-pp.__kmalloc_node_track_caller
      0.00            +0.1        0.06 ±  6%  perf-profile.children.cycles-pp._get_random_bytes
      0.00            +0.1        0.06        perf-profile.children.cycles-pp.entry_SYSCALL_64
      0.00            +0.1        0.07 ±  5%  perf-profile.children.cycles-pp.__key_instantiate_and_link
      0.00            +0.1        0.08 ± 10%  perf-profile.children.cycles-pp.irq_exit_rcu
      0.00            +0.1        0.08        perf-profile.children.cycles-pp.memdup_user
      0.00            +0.1        0.08 ±  5%  perf-profile.children.cycles-pp.key_type_lookup
      0.00            +0.1        0.09 ±  5%  perf-profile.children.cycles-pp.memcmp
      0.00            +0.1        0.09 ±  6%  perf-profile.children.cycles-pp.request_key_and_link
      0.00            +0.1        0.09 ±  4%  perf-profile.children.cycles-pp.down_read
      0.00            +0.1        0.10 ±  4%  perf-profile.children.cycles-pp.__slab_free
      0.00            +0.1        0.10 ±  4%  perf-profile.children.cycles-pp.key_unlink
      0.00            +0.1        0.11 ±  4%  perf-profile.children.cycles-pp.key_link
      0.00            +0.1        0.11 ±  4%  perf-profile.children.cycles-pp.keyctl_keyring_search
      0.00            +0.1        0.13 ±  3%  perf-profile.children.cycles-pp.keyring_compare_object
      0.00            +0.1        0.14 ±  3%  perf-profile.children.cycles-pp.kfree
      0.00            +0.1        0.14 ±  3%  perf-profile.children.cycles-pp.assoc_array_insert
      0.00            +0.1        0.15 ±  4%  perf-profile.children.cycles-pp.key_payload_reserve
      0.00            +0.2        0.18 ±  2%  perf-profile.children.cycles-pp.strnlen_user
      0.00            +0.2        0.19 ±  3%  perf-profile.children.cycles-pp.__key_link_begin
      0.00            +0.2        0.20 ±  2%  perf-profile.children.cycles-pp.assoc_array_find
      0.00            +0.2        0.23        perf-profile.children.cycles-pp.hash_key_type_and_desc
      0.02 ±141%      +0.2        0.26 ±  2%  perf-profile.children.cycles-pp.strndup_user
      0.00            +0.4        0.35 ±  2%  perf-profile.children.cycles-pp.__do_sys_request_key
      0.00            +0.4        0.42 ± 12%  perf-profile.children.cycles-pp.key_put
      0.00            +0.4        0.43 ± 11%  perf-profile.children.cycles-pp.assoc_array_rcu_cleanup
      0.00            +0.5        0.46 ± 12%  perf-profile.children.cycles-pp._raw_spin_lock_irqsave
      1.70 ±  6%      +0.5        2.16 ±  2%  perf-profile.children.cycles-pp.kthread
      1.70 ±  6%      +0.5        2.16 ±  2%  perf-profile.children.cycles-pp.ret_from_fork
      1.70 ±  6%      +0.5        2.16 ±  2%  perf-profile.children.cycles-pp.ret_from_fork_asm
      0.00            +0.5        0.51 ±  9%  perf-profile.children.cycles-pp.run_ksoftirqd
      0.00            +0.5        0.52 ±  8%  perf-profile.children.cycles-pp.smpboot_thread_fn
      0.00            +0.6        0.58 ±  8%  perf-profile.children.cycles-pp.rcu_do_batch
      0.00            +0.6        0.58 ±  8%  perf-profile.children.cycles-pp.rcu_core
      0.00            +0.6        0.59 ±  8%  perf-profile.children.cycles-pp.__do_softirq
      0.00            +0.7        0.70        perf-profile.children.cycles-pp.search_nested_keyrings
      0.00            +0.7        0.72        perf-profile.children.cycles-pp.search_cred_keyrings_rcu
      0.00            +0.7        0.72        perf-profile.children.cycles-pp.search_process_keyrings_rcu
      0.00            +0.7        0.74        perf-profile.children.cycles-pp.keyring_search_rcu
      0.00            +3.3        3.26        perf-profile.children.cycles-pp.keyctl_revoke_key
      0.00            +6.3        6.33        perf-profile.children.cycles-pp.keyctl_get_security
      0.00            +6.3        6.34        perf-profile.children.cycles-pp.keyctl_setperm_key
      0.00            +6.3        6.35        perf-profile.children.cycles-pp.keyctl_read_key
      0.00            +6.4        6.40        perf-profile.children.cycles-pp.keyctl_keyring_link
      0.00            +6.4        6.42        perf-profile.children.cycles-pp.keyctl_set_timeout
      0.00            +6.4        6.43        perf-profile.children.cycles-pp.keyctl_update_key
      0.00            +6.4        6.44        perf-profile.children.cycles-pp.keyctl_keyring_unlink
      0.00            +6.5        6.55        perf-profile.children.cycles-pp.keyctl_describe_key
      0.00            +6.7        6.74        perf-profile.children.cycles-pp.key_alloc
      0.07            +7.0        7.05        perf-profile.children.cycles-pp.key_create_or_update
      0.07 ±  5%      +7.0        7.05        perf-profile.children.cycles-pp.__key_create_or_update
      0.14 ±  5%      +7.1        7.22        perf-profile.children.cycles-pp.__do_sys_add_key
      0.00           +12.7       12.69        perf-profile.children.cycles-pp.keyctl_chown_key
      0.00           +22.5       22.48        perf-profile.children.cycles-pp.keyctl_invalidate_key
      0.00           +88.4       88.41        perf-profile.children.cycles-pp.key_lookup
      0.00           +89.3       89.27        perf-profile.children.cycles-pp.lookup_user_key
      0.18 ±  4%     +97.4       97.58        perf-profile.children.cycles-pp.syscall
     97.10            -2.0       95.14        perf-profile.self.cycles-pp.native_queued_spin_lock_slowpath
      0.00            +0.1        0.05        perf-profile.self.cycles-pp.up_read
      0.00            +0.1        0.06 ±  9%  perf-profile.self.cycles-pp.key_put
      0.00            +0.1        0.06        perf-profile.self.cycles-pp.syscall
      0.00            +0.1        0.06 ±  7%  perf-profile.self.cycles-pp.assoc_array_insert
      0.00            +0.1        0.07 ±  7%  perf-profile.self.cycles-pp._raw_spin_lock_irqsave
      0.00            +0.1        0.07        perf-profile.self.cycles-pp.key_payload_reserve
      0.00            +0.1        0.08        perf-profile.self.cycles-pp.assoc_array_find
      0.00            +0.1        0.08 ±  5%  perf-profile.self.cycles-pp.memcmp
      0.00            +0.1        0.09        perf-profile.self.cycles-pp.down_read
      0.00            +0.1        0.10 ±  4%  perf-profile.self.cycles-pp.__slab_free
      0.00            +0.1        0.11        perf-profile.self.cycles-pp.lookup_user_key
      0.00            +0.2        0.18 ±  2%  perf-profile.self.cycles-pp.strnlen_user
      0.00            +0.2        0.23 ±  2%  perf-profile.self.cycles-pp.hash_key_type_and_desc
      0.00            +0.3        0.26        perf-profile.self.cycles-pp.search_nested_keyrings
      0.00            +0.3        0.26 ±  2%  perf-profile.self.cycles-pp.key_alloc
      0.01 ±223%      +0.5        0.53        perf-profile.self.cycles-pp._raw_spin_lock
      0.00            +0.6        0.63        perf-profile.self.cycles-pp.key_lookup




Disclaimer:
Results have been estimated based on internal Intel analysis and are provided
for informational purposes only. Any difference in system hardware or software
design or configuration may affect actual performance.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


