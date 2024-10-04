Return-Path: <keyrings+bounces-2180-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 14E2898FE11
	for <lists+keyrings@lfdr.de>; Fri,  4 Oct 2024 09:50:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7DD0E1F22241
	for <lists+keyrings@lfdr.de>; Fri,  4 Oct 2024 07:50:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4E2C136338;
	Fri,  4 Oct 2024 07:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VF/MsAst"
X-Original-To: keyrings@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B6A913B79F;
	Fri,  4 Oct 2024 07:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728028213; cv=none; b=fJAlNPUNbZBzaVfljV/YKVVaawnKDIVNrLRjpeRPDK8HmqU+3CSkUcv1ZwGAWa5BalvvrHiSY/Gkk6KS+zJaP0orqc5kf3Ji7nU0l27Ri7LIbNQEOK/ZQnnwKbtI7win6YiQb8wTK9ssKe/ySYlJ2XrL7PY+HeJEDKCkZGzPrWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728028213; c=relaxed/simple;
	bh=qzTii371FIssbjMIfWpZW2NM7wcNJ+VgmeW6uwGhyTg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uDPvn8dOr8QmKeCVtK6e8+rzY4x5DjQY1ZdxCkT2kiL/7D1tVF+YWLn0qX9issliAS5ykijUD6xfXftv8gibA68REcN791JhhvMWH/EYVqlUIjETmfm5S/fNkyRfn+h5ZoKSJGGl4rv3+jcUtR64c6wDYj9PkxhY1TJEgiPBaW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VF/MsAst; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728028212; x=1759564212;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qzTii371FIssbjMIfWpZW2NM7wcNJ+VgmeW6uwGhyTg=;
  b=VF/MsAst5fpJbNsqcusZNdsMSRPBnloJrUUscuQ0A1ywrWMzUgbLrEB3
   idQky9hUVu/Sgbo3Csyhtm9ldemLHjGWhj+DMK74WmQo62YImp7kU72AX
   qZSnmuD3VrLsXXDIS35fUhX8olcJas3ah7THEQ3FtcWrknq5piojA25eq
   MwvmK0SOgEtyOEV/UgwK3C1Ma16qouQjBFy77YsPxb7N5+qU3BWEBtDGN
   vZ7kH2vUcfq2S089dmQTijAlFFKQWqc1UrXllOjBg5QBerWDZZfU9rODZ
   yK86noPPvZc+iPMTCibKRjQD3h0clQQJx8rjMeMzW1eaNlMYF/jHxF+t1
   w==;
X-CSE-ConnectionGUID: kSzJzmMBTYKEMsIdxhEvMw==
X-CSE-MsgGUID: ttzaEZZlT0O09a+45yoVvA==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="27373125"
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; 
   d="scan'208";a="27373125"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2024 00:50:11 -0700
X-CSE-ConnectionGUID: uCVQNqVXRrSFakJfJ/qFIg==
X-CSE-MsgGUID: iake99g5SzWlFNB92aSDsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; 
   d="scan'208";a="79594295"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 04 Oct 2024 00:50:09 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1swd4g-0001LO-1U;
	Fri, 04 Oct 2024 07:50:06 +0000
Date: Fri, 4 Oct 2024 15:49:47 +0800
From: kernel test robot <lkp@intel.com>
To: Fam Zheng <fam.zheng@bytedance.com>, linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, fam@euphon.net,
	David Howells <dhowells@redhat.com>, keyrings@vger.kernel.org,
	David Woodhouse <dwmw2@infradead.org>, fam.zheng@bytedance.com
Subject: Re: [PATCH] sign-file: Add -D "digest mode"
Message-ID: <202410041509.PbZBKm0L-lkp@intel.com>
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

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.12-rc1 next-20241003]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Fam-Zheng/sign-file-Add-D-digest-mode/20241002-215025
base:   linus/master
patch link:    https://lore.kernel.org/r/20241002133837.1030094-1-fam.zheng%40bytedance.com
patch subject: [PATCH] sign-file: Add -D "digest mode"
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20241004/202410041509.PbZBKm0L-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project fef3566a25ff0e34fb87339ba5e13eca17cec00f)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241004/202410041509.PbZBKm0L-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410041509.PbZBKm0L-lkp@intel.com/

All errors (new ones prefixed by >>):

   WARNING: unmet direct dependencies detected for GET_FREE_REGION
   Depends on [n]: SPARSEMEM [=n]
   Selected by [m]:
   - RESOURCE_KUNIT_TEST [=m] && RUNTIME_TESTING_MENU [=y] && KUNIT [=m]
>> scripts/sign-file.c:357:8: error: call to undeclared function 'CMS_final_digest'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
   357 |                         ERR(CMS_final_digest(cms, digest_bin, digest_len, NULL, CMS_NOCERTS | CMS_BINARY) != 1,
   |                             ^
   1 error generated.
   make[3]: *** [scripts/Makefile.host:116: scripts/sign-file] Error 1
   make[3]: Target 'scripts/' not remade because of errors.
   make[2]: *** [Makefile:1187: scripts] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:224: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:224: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for MODVERSIONS
   Depends on [n]: MODULES [=y] && !COMPILE_TEST [=y]
   Selected by [y]:
   - RANDSTRUCT_FULL [=y] && (CC_HAS_RANDSTRUCT [=y] || GCC_PLUGINS [=n]) && MODULES [=y]
   WARNING: unmet direct dependencies detected for GET_FREE_REGION
   Depends on [n]: SPARSEMEM [=n]
   Selected by [m]:
   - RESOURCE_KUNIT_TEST [=m] && RUNTIME_TESTING_MENU [=y] && KUNIT [=m]


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

