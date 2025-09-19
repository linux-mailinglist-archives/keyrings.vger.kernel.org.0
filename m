Return-Path: <keyrings+bounces-3026-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 73985B88C3A
	for <lists+keyrings@lfdr.de>; Fri, 19 Sep 2025 12:10:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3E20B1C25B8E
	for <lists+keyrings@lfdr.de>; Fri, 19 Sep 2025 10:10:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F4CD2ECE9E;
	Fri, 19 Sep 2025 10:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gc/Ig3PB"
X-Original-To: keyrings@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD62F2D8393;
	Fri, 19 Sep 2025 10:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758276622; cv=none; b=qD/fUSkhvtRBQjqB2cT1vccsAKFNVAUsaUBmPr5UeLSld+NjVF+E1hIlTJKrVeeyt5lfGzw/pTHzyZenofBjHsBk9rKon78gozd6gjNt3o/0AIiliyM+zIKyE+5fsM6Bdl5yaaWu9ilZUEsy8KfqPM/j2V/EheAdK2hXc0RMK2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758276622; c=relaxed/simple;
	bh=UOnrDjb3zW6uaFQeDhffAgYfTtqW5gfMKbPsRtlldQA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hTks9L2wCbE5tB5GKtrRW+bDasXD1o5/Tci0jt9R9xW3ABrFvh2Rqgff4IQPDDmpl//EteSGq4j915OY8M0WMzhP5eYvFz9tGbFGP3O5YdsvwiJWD/0lLKYN1Oc4+1A6t2MxJXL4sGSqjFMmLf3fqk/22yP0Z2/sPA54J0bI42o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gc/Ig3PB; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758276621; x=1789812621;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UOnrDjb3zW6uaFQeDhffAgYfTtqW5gfMKbPsRtlldQA=;
  b=gc/Ig3PBR81sEsf+dzVe6qLouINvrn9h1RwwNJ2bi7OgtnSBBbJTbdef
   IMwybBkVwGExn6nn9MuQ5Dncv3MmK3UAvKWbtTs2h2RIsOcxxN2jRyfJ2
   0F1VfDUsNodG8QGlJ0IY2uvnuzwv8vDaGQQwPwFHfTEMsx4xd4959r/ML
   Okm6OjgrmrpH3I9LMKJpmQ2KRMsgFy7tyoEzLmUKOpwHr9lHfFXDzLlnd
   0TV0SVBu5ROtKmHQywPyKninjtQ3R+tLrBzoR3pU8wa8A8Pb1bFrE1IWc
   yEhsL/we4Bh90qSckhv1LHwTU8MN2Lq6ipfgy2jDivsv2lK0Lu34+jEXz
   A==;
X-CSE-ConnectionGUID: GecuecC5TMeD7YnDXCOucQ==
X-CSE-MsgGUID: ++8eNExLQAeeyuBqkYyU7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11557"; a="60508993"
X-IronPort-AV: E=Sophos;i="6.18,277,1751266800"; 
   d="scan'208";a="60508993"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2025 03:10:20 -0700
X-CSE-ConnectionGUID: rKO6kgaYTn2CtLKpBq2S8w==
X-CSE-MsgGUID: Xy2qpEfvRAGb/HYwfkjv8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,277,1751266800"; 
   d="scan'208";a="175721554"
Received: from lkp-server01.sh.intel.com (HELO 84a20bd60769) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 19 Sep 2025 03:10:17 -0700
Received: from kbuild by 84a20bd60769 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uzY4F-0004Bn-12;
	Fri, 19 Sep 2025 10:10:15 +0000
Date: Fri, 19 Sep 2025 18:10:00 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>, Eric Biggers <ebiggers@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, dhowells@redhat.com,
	"Jason A. Donenfeld" <Jason@zx2c4.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Stephan Mueller <smueller@chronox.de>, linux-crypto@vger.kernel.org,
	keyrings@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] lib/crypto: Add SHA3-224, SHA3-256, SHA3-384, SHA-512,
 SHAKE128, SHAKE256
Message-ID: <202509191712.4MoL99fN-lkp@intel.com>
References: <3605112.1758233248@warthog.procyon.org.uk>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3605112.1758233248@warthog.procyon.org.uk>

Hi David,

kernel test robot noticed the following build warnings:

[auto build test WARNING on ebiggers/libcrypto-fixes]
[also build test WARNING on herbert-cryptodev-2.6/master herbert-crypto-2.6/master linus/master v6.17-rc6 next-20250918]
[cannot apply to ebiggers/libcrypto-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/David-Howells/lib-crypto-Add-SHA3-224-SHA3-256-SHA3-384-SHA-512-SHAKE128-SHAKE256/20250919-061024
base:   https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git libcrypto-fixes
patch link:    https://lore.kernel.org/r/3605112.1758233248%40warthog.procyon.org.uk
patch subject: [PATCH] lib/crypto: Add SHA3-224, SHA3-256, SHA3-384, SHA-512, SHAKE128, SHAKE256
config: arm-randconfig-001-20250919 (https://download.01.org/0day-ci/archive/20250919/202509191712.4MoL99fN-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250919/202509191712.4MoL99fN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509191712.4MoL99fN-lkp@intel.com/

All warnings (new ones prefixed by >>):

   lib/crypto/sha3.c: In function 'sha3_absorb_xorle':
>> lib/crypto/sha3.c:229:30: warning: suggest parentheses around arithmetic in operand of '|' [-Wparentheses]
     229 |                 buf[woff | 7 - boff] ^= *data++;
         |                            ~~^~~~~~


vim +229 lib/crypto/sha3.c

   211	
   212	/*
   213	 * XOR in partial data that's insufficient to fill a whole block.
   214	 */
   215	static void sha3_absorb_xorle(struct sha3_ctx *ctx, const u8 *data, unsigned int len)
   216	{
   217		unsigned int partial = ctx->partial;
   218		u8 *buf = (u8 *)ctx->state.st;
   219	
   220	#ifdef __LITTLE_ENDIAN
   221		buf += partial;
   222		for (int i = 0; i < len; i++)
   223			*buf++ ^= *data++;
   224	#else
   225		for (int i = 0; i < len; i++) {
   226			unsigned int woff = (partial + i) & ~7;
   227			unsigned int boff = (partial + i) & 7;
   228	
 > 229			buf[woff | 7 - boff] ^= *data++;
   230		}
   231	#endif
   232		ctx->partial += len;
   233	}
   234	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

