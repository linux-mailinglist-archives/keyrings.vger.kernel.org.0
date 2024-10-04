Return-Path: <keyrings+bounces-2182-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 52596990472
	for <lists+keyrings@lfdr.de>; Fri,  4 Oct 2024 15:32:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C2C021F21042
	for <lists+keyrings@lfdr.de>; Fri,  4 Oct 2024 13:32:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D1DB212F07;
	Fri,  4 Oct 2024 13:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jUHRieyz"
X-Original-To: keyrings@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDD39212EE7;
	Fri,  4 Oct 2024 13:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728048719; cv=none; b=UPNd3E6zz1b2qHH8SeaetmCbE3OlIL7mJZ4KQ42k+MGwxdADJNDvERAOlZHulFFZWwYAMEgc2/wzXtkhILkXNlTfHwun3xz6mzHn7C7vz6MqmBPNaE8D0/DQGAX0D/W60E3VUQ+EHuWziwhHvTOFLcT1Y2uK1c8cMBqU/XG7qG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728048719; c=relaxed/simple;
	bh=FPLZJaARGtRR7bwMZfLF8SBRUPHLyRTznI4rLQWKTiU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ig/oNZr1DsQLHzqy9DkecTBCK30HWK93DIy51MgmYM+z4nJcoft2fzTZEBTBKES4npLgkTtcSFunBv0XB2qtMb/DCBDc/apz50KCqaYDski7bGxDLXE64pOGRxpD85cmKWTBEraVISMicEn8GSO2lrbuuriBG9l2EbDNHYL34zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jUHRieyz; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728048717; x=1759584717;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FPLZJaARGtRR7bwMZfLF8SBRUPHLyRTznI4rLQWKTiU=;
  b=jUHRieyz1FMasVVZbwlzQFUKf3j1Gl9uN/Xd9p525IUhtv+p3paL/Svd
   js1RR/9oIxknr3LJBr1E6a+8nyEsueEW2QKyyccFh5aEltgcytj4VdGnJ
   sSvoGz571d84WQFvo3o8GIPbsegSB/fb0NOBipTL7X+HnbuPIkYi+ypqY
   OYZZUOypaS9OpTjHSMj/kFQRqGBjU+ypDgHF/5YEYkJOaGELJNooNq9Zc
   UZb7Iw4IGyyJvBHAzmKwBBLJW6aexr01z1TYvzU7Omduebw2ywify+MIA
   7pz/NrmOSaf9X1Vvai/RH+mUKGlwRTUOZAr4As5JFLTF9XywKZqjdTr/p
   g==;
X-CSE-ConnectionGUID: eJrIxmvtTV+wRitEO1Wl5Q==
X-CSE-MsgGUID: RhfnDijfR46Md2IL4wVAsQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="27150476"
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; 
   d="scan'208";a="27150476"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2024 06:30:21 -0700
X-CSE-ConnectionGUID: L0iAeHhRRXmIGL7OAVxeAQ==
X-CSE-MsgGUID: y5hOZK8qRSWp9CZ6SrHB7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; 
   d="scan'208";a="74697088"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 04 Oct 2024 06:30:20 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1swiNt-0001fq-1V;
	Fri, 04 Oct 2024 13:30:17 +0000
Date: Fri, 4 Oct 2024 21:30:05 +0800
From: kernel test robot <lkp@intel.com>
To: Fam Zheng <fam.zheng@bytedance.com>, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, fam@euphon.net,
	David Howells <dhowells@redhat.com>, keyrings@vger.kernel.org,
	David Woodhouse <dwmw2@infradead.org>, fam.zheng@bytedance.com
Subject: Re: [PATCH] sign-file: Add -D "digest mode"
Message-ID: <202410042115.WT7VlS8U-lkp@intel.com>
References: <20241002133837.1030094-1-fam.zheng@bytedance.com>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241002133837.1030094-1-fam.zheng@bytedance.com>

Hi Fam,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.12-rc1 next-20241004]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Fam-Zheng/sign-file-Add-D-digest-mode/20241002-215025
base:   linus/master
patch link:    https://lore.kernel.org/r/20241002133837.1030094-1-fam.zheng%40bytedance.com
patch subject: [PATCH] sign-file: Add -D "digest mode"
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20241004/202410042115.WT7VlS8U-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241004/202410042115.WT7VlS8U-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410042115.WT7VlS8U-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from scripts/sign-file.c:40:
   scripts/sign-file.c: In function 'main':
>> scripts/sign-file.c:357:29: warning: implicit declaration of function 'CMS_final_digest' [-Wimplicit-function-declaration]
     357 |                         ERR(CMS_final_digest(cms, digest_bin, digest_len, NULL, CMS_NOCERTS | CMS_BINARY) != 1,
         |                             ^~~~~~~~~~~~~~~~
   scripts/ssl-common.h:27:32: note: in definition of macro 'ERR'
      27 |                 bool __cond = (cond);                   \
         |                                ^~~~
--
   In file included from scripts/sign-file.c:40:
   scripts/sign-file.c: In function 'main':
>> scripts/sign-file.c:357:29: warning: implicit declaration of function 'CMS_final_digest' [-Wimplicit-function-declaration]
     357 |                         ERR(CMS_final_digest(cms, digest_bin, digest_len, NULL, CMS_NOCERTS | CMS_BINARY) != 1,
         |                             ^~~~~~~~~~~~~~~~
   scripts/ssl-common.h:27:32: note: in definition of macro 'ERR'
      27 |                 bool __cond = (cond);                   \
         |                                ^~~~


vim +/CMS_final_digest +357 scripts/sign-file.c

   329	
   330		if (!raw_sig) {
   331			/* Read the private key and the X.509 cert the PKCS#7 message
   332			 * will point to.
   333			 */
   334			private_key = read_private_key(private_key_name);
   335			x509 = read_x509(x509_name);
   336	
   337			/* Digest the module data. */
   338			OpenSSL_add_all_digests();
   339			drain_openssl_errors(__LINE__, 0);
   340			digest_algo = EVP_get_digestbyname(hash_algo);
   341			ERR(!digest_algo, "EVP_get_digestbyname");
   342	
   343	#ifndef USE_PKCS7
   344			/* Load the signature message from the digest buffer. */
   345			cms = CMS_sign(NULL, NULL, NULL, NULL,
   346				       CMS_NOCERTS | CMS_PARTIAL | CMS_BINARY |
   347				       CMS_DETACHED | CMS_STREAM);
   348			ERR(!cms, "CMS_sign");
   349	
   350			ERR(!CMS_add1_signer(cms, x509, private_key, digest_algo,
   351					     CMS_NOCERTS | CMS_BINARY |
   352					     CMS_NOSMIMECAP | use_keyid |
   353					     (digest_mode ? CMS_KEY_PARAM : 0) |
   354					     use_signed_attrs),
   355			    "CMS_add1_signer");
   356			if (digest_mode)
 > 357				ERR(CMS_final_digest(cms, digest_bin, digest_len, NULL, CMS_NOCERTS | CMS_BINARY) != 1,
   358				    "CMS_final_digest");
   359			else
   360				ERR(CMS_final(cms, bm, NULL, CMS_NOCERTS | CMS_BINARY) != 1,
   361				    "CMS_final");
   362	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

