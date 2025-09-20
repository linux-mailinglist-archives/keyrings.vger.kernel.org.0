Return-Path: <keyrings+bounces-3045-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BDEF3B8C60D
	for <lists+keyrings@lfdr.de>; Sat, 20 Sep 2025 12:53:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 907BF189BA80
	for <lists+keyrings@lfdr.de>; Sat, 20 Sep 2025 10:54:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74A6B2F619F;
	Sat, 20 Sep 2025 10:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QYNcscXQ"
X-Original-To: keyrings@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A908725F79A;
	Sat, 20 Sep 2025 10:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758365631; cv=none; b=Nm1VAjPppAd4sliwy662LXXPpOHWmgteszi/sOH/T+NJgyLrLDPPFz02ZIjWKrDqCcM22Fa8h5L/JE0+UNiJt6eEBr46Vg6E41VHAyEdrogiPFkNHNJ7sqiaVYAhGygFoy9oXC+D/XvJIloEW17RuKjiTzRFhfFQH6AKmGjK4QY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758365631; c=relaxed/simple;
	bh=uEAw+Qb712GnVUjjj39hLndG5hIdLluHSViucJPES7A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MEz7e7TWbQwjoBBT/iq9uWYdsotP4v98cDmYZVQ1pxEtUKzYFBO2wyk/33o0EfFj8VYD48B3BbrOyVBtN/tFP2BrrJT/8VdaM4bZ724DAi1kOYMo6jDCFuGPppNB9OaiCGGW3R8a5XrQavGUhqZufWkgITqIniTRQX5mrEprInc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QYNcscXQ; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758365629; x=1789901629;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=uEAw+Qb712GnVUjjj39hLndG5hIdLluHSViucJPES7A=;
  b=QYNcscXQaYHvEcCoPCTWitiZy35j3x/07XYlSdXTavjmXMIAZmVc15VN
   gjiHHtIu6Pzmzm3h5E/UMJB2qUYKspqdLHN0ugepS2XsjN42tEmWy4IES
   Xz/7l6mkYg3lGTZMvEcmo2HrYBBFXsDwX9qggMkku5ZCHbEnOoHmx59GW
   6bEf3HZm7rFWz+4Agh96jbDBJy5lpLL6hgtFONIZi8uoyuW8I/g/RSRlc
   G7Tg5UzBQu7PJO7zTZ8Hi51tIbV5/INP6ZPXwz+SCVLxspv33jx/7os1l
   TY8rMPtA0TPI+O7yQ03KjdVJJp8TqUVNc98TPTOvGA/kDzNb9srXtNZyO
   A==;
X-CSE-ConnectionGUID: vyU4tv3WRcm2sNlm0IV85A==
X-CSE-MsgGUID: Kyj0+yj0RzWCO9yIphIK4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11558"; a="71802124"
X-IronPort-AV: E=Sophos;i="6.18,280,1751266800"; 
   d="scan'208";a="71802124"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2025 03:53:48 -0700
X-CSE-ConnectionGUID: Feot2xJmT6S2CChkcwxb/g==
X-CSE-MsgGUID: I12qQxbhRCSHZncygvghLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,280,1751266800"; 
   d="scan'208";a="176099691"
Received: from lkp-server01.sh.intel.com (HELO 84a20bd60769) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 20 Sep 2025 03:53:45 -0700
Received: from kbuild by 84a20bd60769 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uzvDq-0005ER-17;
	Sat, 20 Sep 2025 10:53:42 +0000
Date: Sat, 20 Sep 2025 18:53:17 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>, Eric Biggers <ebiggers@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, dhowells@redhat.com,
	"Jason A. Donenfeld" <Jason@zx2c4.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Harald Freudenberger <freude@linux.ibm.com>,
	Holger Dengler <dengler@linux.ibm.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Stephan Mueller <smueller@chronox.de>, Simo Sorce <simo@redhat.com>,
	linux-crypto@vger.kernel.org, linux-s390@vger.kernel.org,
	keyrings@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] lib/crypto: Add SHA3-224, SHA3-256, SHA3-384,
 SHA-512, SHAKE128, SHAKE256
Message-ID: <202509201849.9iMsH2kd-lkp@intel.com>
References: <3936580.1758299519@warthog.procyon.org.uk>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3936580.1758299519@warthog.procyon.org.uk>

Hi David,

kernel test robot noticed the following build errors:

[auto build test ERROR on ebiggers/libcrypto-fixes]
[also build test ERROR on herbert-cryptodev-2.6/master herbert-crypto-2.6/master linus/master v6.17-rc6 next-20250919]
[cannot apply to ebiggers/libcrypto-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/David-Howells/lib-crypto-Add-SHA3-224-SHA3-256-SHA3-384-SHA-512-SHAKE128-SHAKE256/20250920-003544
base:   https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git libcrypto-fixes
patch link:    https://lore.kernel.org/r/3936580.1758299519%40warthog.procyon.org.uk
patch subject: [PATCH v2] lib/crypto: Add SHA3-224, SHA3-256, SHA3-384, SHA-512, SHAKE128, SHAKE256
config: sparc-defconfig (https://download.01.org/0day-ci/archive/20250920/202509201849.9iMsH2kd-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250920/202509201849.9iMsH2kd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509201849.9iMsH2kd-lkp@intel.com/

All errors (new ones prefixed by >>):

   sparc-linux-ld: lib/crypto/sha3.o: in function `sha3_keccakf_generic':
>> sha3.c:(.text+0x964): undefined reference to `__bswapdi2'
>> sparc-linux-ld: sha3.c:(.text+0x9c0): undefined reference to `__bswapdi2'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

