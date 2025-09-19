Return-Path: <keyrings+bounces-3027-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6605CB88DC0
	for <lists+keyrings@lfdr.de>; Fri, 19 Sep 2025 12:23:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B2C657C4E03
	for <lists+keyrings@lfdr.de>; Fri, 19 Sep 2025 10:21:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCCE43081AC;
	Fri, 19 Sep 2025 10:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hUKJqkLJ"
X-Original-To: keyrings@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2904307AE5;
	Fri, 19 Sep 2025 10:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758277284; cv=none; b=ZP8Lo/YpuAeE3RXr1rRJ4qOMyA/RvwbiLZSWG+ahHN07fky30nT0muHSezbT4vanHBxm7TqKLW8O19jGEX/ztyCDH2B6HCYubNVJcg5ELNe00z04vrInBDrDB4V6EAElkiO6/sJlLicwbb1+n7FRL56FcFKdXZvyjsOHMLGp3iU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758277284; c=relaxed/simple;
	bh=vo3mFVbOD1gbm726Eeresb/lGnylnNiMb51Lk9E0sbs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UjOZz0oSnC0VW4n79J+XS6us9aH+Z9DIFbkY6FxnANQjRu5cEzp6DslO8rDF3dzT1fL+7rCBqLMZIrweTKO5EZFN3T4hDaatohjiJGoo4iZ7eAL6uppKW3zpbC+SSZteqVtKQArWlDyVevwT01QofOxmQ+mduHNZVGBY+I3E/sU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hUKJqkLJ; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758277283; x=1789813283;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vo3mFVbOD1gbm726Eeresb/lGnylnNiMb51Lk9E0sbs=;
  b=hUKJqkLJiClJc8+JNjw9AWGGDhi/33PwbwL2N+Bu/OObkmBWiT1h43TO
   9WASMGPcXLhMwiE5u/QlOmILFDeyjO2Zj8GiX1u+7bjCUibOcs0yvdDm6
   TsyKDIFniEglSspSuLpNgtDEHmN8+PGEmsE5LuN3i4690jxtYxmtNobht
   kFYyhsz+HhdNR5XcUT86lR5Prp2mWOvFtjjEVGE00Pt+clEu7i6WjJYCi
   2Q7BMzFl0toY1p1/ZRdEu9WTcTLcE5EF7TRAFmO20SLGEOPrCNzcKeSRf
   BLWBl1ZdaekcGpeFXsefyVPF/Va/z5nHzUu1nop65S7OnSG5fcXcB2gYN
   Q==;
X-CSE-ConnectionGUID: 7TtyxpRFS3Or1sfXiEKFJA==
X-CSE-MsgGUID: uagltAZ/Rr+3ev1TsCNtvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="64425847"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="64425847"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2025 03:21:21 -0700
X-CSE-ConnectionGUID: 4RVgT/nkQoSuYg7xkigZiQ==
X-CSE-MsgGUID: EEX/WbvuTrS8eqgbphm3Vg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,277,1751266800"; 
   d="scan'208";a="176244624"
Received: from lkp-server01.sh.intel.com (HELO 84a20bd60769) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 19 Sep 2025 03:21:18 -0700
Received: from kbuild by 84a20bd60769 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uzYEu-0004Ch-0y;
	Fri, 19 Sep 2025 10:21:16 +0000
Date: Fri, 19 Sep 2025 18:20:31 +0800
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
Message-ID: <202509191807.9daDknje-lkp@intel.com>
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

kernel test robot noticed the following build errors:

[auto build test ERROR on ebiggers/libcrypto-fixes]
[also build test ERROR on herbert-cryptodev-2.6/master herbert-crypto-2.6/master linus/master v6.17-rc6 next-20250918]
[cannot apply to ebiggers/libcrypto-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/David-Howells/lib-crypto-Add-SHA3-224-SHA3-256-SHA3-384-SHA-512-SHAKE128-SHAKE256/20250919-061024
base:   https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git libcrypto-fixes
patch link:    https://lore.kernel.org/r/3605112.1758233248%40warthog.procyon.org.uk
patch subject: [PATCH] lib/crypto: Add SHA3-224, SHA3-256, SHA3-384, SHA-512, SHAKE128, SHAKE256
config: s390-randconfig-001-20250919 (https://download.01.org/0day-ci/archive/20250919/202509191807.9daDknje-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250919/202509191807.9daDknje-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509191807.9daDknje-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/s390/crypto/sha3_256_s390.c:22:12: error: conflicting types for 'sha3_256_init'
    static int sha3_256_init(struct shash_desc *desc)
               ^~~~~~~~~~~~~
   In file included from arch/s390/crypto/sha3_256_s390.c:13:
   include/crypto/sha3.h:71:20: note: previous definition of 'sha3_256_init' was here
    static inline void sha3_256_init(struct sha3_ctx *ctx)
                       ^~~~~~~~~~~~~
>> arch/s390/crypto/sha3_256_s390.c:99:12: error: conflicting types for 'sha3_224_init'
    static int sha3_224_init(struct shash_desc *desc)
               ^~~~~~~~~~~~~
   In file included from arch/s390/crypto/sha3_256_s390.c:13:
   include/crypto/sha3.h:59:20: note: previous definition of 'sha3_224_init' was here
    static inline void sha3_224_init(struct sha3_ctx *ctx)
                       ^~~~~~~~~~~~~


vim +/sha3_256_init +22 arch/s390/crypto/sha3_256_s390.c

3c2eb6b76cabb7 Joerg Schmidbauer 2019-08-14   21  
3c2eb6b76cabb7 Joerg Schmidbauer 2019-08-14  @22  static int sha3_256_init(struct shash_desc *desc)
3c2eb6b76cabb7 Joerg Schmidbauer 2019-08-14   23  {
3c2eb6b76cabb7 Joerg Schmidbauer 2019-08-14   24  	struct s390_sha_ctx *sctx = shash_desc_ctx(desc);
3c2eb6b76cabb7 Joerg Schmidbauer 2019-08-14   25  
6f90ba7065515d Herbert Xu        2025-04-18   26  	sctx->first_message_part = test_facility(86);
6f90ba7065515d Herbert Xu        2025-04-18   27  	if (!sctx->first_message_part)
3c2eb6b76cabb7 Joerg Schmidbauer 2019-08-14   28  		memset(sctx->state, 0, sizeof(sctx->state));
3c2eb6b76cabb7 Joerg Schmidbauer 2019-08-14   29  	sctx->count = 0;
3c2eb6b76cabb7 Joerg Schmidbauer 2019-08-14   30  	sctx->func = CPACF_KIMD_SHA3_256;
3c2eb6b76cabb7 Joerg Schmidbauer 2019-08-14   31  
3c2eb6b76cabb7 Joerg Schmidbauer 2019-08-14   32  	return 0;
3c2eb6b76cabb7 Joerg Schmidbauer 2019-08-14   33  }
3c2eb6b76cabb7 Joerg Schmidbauer 2019-08-14   34  
3c2eb6b76cabb7 Joerg Schmidbauer 2019-08-14   35  static int sha3_256_export(struct shash_desc *desc, void *out)
3c2eb6b76cabb7 Joerg Schmidbauer 2019-08-14   36  {
3c2eb6b76cabb7 Joerg Schmidbauer 2019-08-14   37  	struct s390_sha_ctx *sctx = shash_desc_ctx(desc);
73c2437109c3ea Herbert Xu        2025-05-23   38  	union {
73c2437109c3ea Herbert Xu        2025-05-23   39  		u8 *u8;
73c2437109c3ea Herbert Xu        2025-05-23   40  		u64 *u64;
73c2437109c3ea Herbert Xu        2025-05-23   41  	} p = { .u8 = out };
73c2437109c3ea Herbert Xu        2025-05-23   42  	int i;
3c2eb6b76cabb7 Joerg Schmidbauer 2019-08-14   43  
6f90ba7065515d Herbert Xu        2025-04-18   44  	if (sctx->first_message_part) {
73c2437109c3ea Herbert Xu        2025-05-23   45  		memset(out, 0, SHA3_STATE_SIZE);
73c2437109c3ea Herbert Xu        2025-05-23   46  		return 0;
6f90ba7065515d Herbert Xu        2025-04-18   47  	}
73c2437109c3ea Herbert Xu        2025-05-23   48  	for (i = 0; i < SHA3_STATE_SIZE / 8; i++)
73c2437109c3ea Herbert Xu        2025-05-23   49  		put_unaligned(le64_to_cpu(sctx->sha3.state[i]), p.u64++);
3c2eb6b76cabb7 Joerg Schmidbauer 2019-08-14   50  	return 0;
3c2eb6b76cabb7 Joerg Schmidbauer 2019-08-14   51  }
3c2eb6b76cabb7 Joerg Schmidbauer 2019-08-14   52  
3c2eb6b76cabb7 Joerg Schmidbauer 2019-08-14   53  static int sha3_256_import(struct shash_desc *desc, const void *in)
3c2eb6b76cabb7 Joerg Schmidbauer 2019-08-14   54  {
3c2eb6b76cabb7 Joerg Schmidbauer 2019-08-14   55  	struct s390_sha_ctx *sctx = shash_desc_ctx(desc);
73c2437109c3ea Herbert Xu        2025-05-23   56  	union {
73c2437109c3ea Herbert Xu        2025-05-23   57  		const u8 *u8;
73c2437109c3ea Herbert Xu        2025-05-23   58  		const u64 *u64;
73c2437109c3ea Herbert Xu        2025-05-23   59  	} p = { .u8 = in };
73c2437109c3ea Herbert Xu        2025-05-23   60  	int i;
3c2eb6b76cabb7 Joerg Schmidbauer 2019-08-14   61  
73c2437109c3ea Herbert Xu        2025-05-23   62  	for (i = 0; i < SHA3_STATE_SIZE / 8; i++)
73c2437109c3ea Herbert Xu        2025-05-23   63  		sctx->sha3.state[i] = cpu_to_le64(get_unaligned(p.u64++));
6f90ba7065515d Herbert Xu        2025-04-18   64  	sctx->count = 0;
6f90ba7065515d Herbert Xu        2025-04-18   65  	sctx->first_message_part = 0;
3c2eb6b76cabb7 Joerg Schmidbauer 2019-08-14   66  	sctx->func = CPACF_KIMD_SHA3_256;
3c2eb6b76cabb7 Joerg Schmidbauer 2019-08-14   67  
3c2eb6b76cabb7 Joerg Schmidbauer 2019-08-14   68  	return 0;
3c2eb6b76cabb7 Joerg Schmidbauer 2019-08-14   69  }
3c2eb6b76cabb7 Joerg Schmidbauer 2019-08-14   70  
3c2eb6b76cabb7 Joerg Schmidbauer 2019-08-14   71  static int sha3_224_import(struct shash_desc *desc, const void *in)
3c2eb6b76cabb7 Joerg Schmidbauer 2019-08-14   72  {
3c2eb6b76cabb7 Joerg Schmidbauer 2019-08-14   73  	struct s390_sha_ctx *sctx = shash_desc_ctx(desc);
3c2eb6b76cabb7 Joerg Schmidbauer 2019-08-14   74  
6f90ba7065515d Herbert Xu        2025-04-18   75  	sha3_256_import(desc, in);
3c2eb6b76cabb7 Joerg Schmidbauer 2019-08-14   76  	sctx->func = CPACF_KIMD_SHA3_224;
3c2eb6b76cabb7 Joerg Schmidbauer 2019-08-14   77  	return 0;
3c2eb6b76cabb7 Joerg Schmidbauer 2019-08-14   78  }
3c2eb6b76cabb7 Joerg Schmidbauer 2019-08-14   79  
3c2eb6b76cabb7 Joerg Schmidbauer 2019-08-14   80  static struct shash_alg sha3_256_alg = {
3c2eb6b76cabb7 Joerg Schmidbauer 2019-08-14   81  	.digestsize	=	SHA3_256_DIGEST_SIZE,	   /* = 32 */
3c2eb6b76cabb7 Joerg Schmidbauer 2019-08-14   82  	.init		=	sha3_256_init,
6f90ba7065515d Herbert Xu        2025-04-18   83  	.update		=	s390_sha_update_blocks,
6f90ba7065515d Herbert Xu        2025-04-18   84  	.finup		=	s390_sha_finup,
3c2eb6b76cabb7 Joerg Schmidbauer 2019-08-14   85  	.export		=	sha3_256_export,
3c2eb6b76cabb7 Joerg Schmidbauer 2019-08-14   86  	.import		=	sha3_256_import,
6f90ba7065515d Herbert Xu        2025-04-18   87  	.descsize	=	S390_SHA_CTX_SIZE,
6f90ba7065515d Herbert Xu        2025-04-18   88  	.statesize	=	SHA3_STATE_SIZE,
3c2eb6b76cabb7 Joerg Schmidbauer 2019-08-14   89  	.base		=	{
3c2eb6b76cabb7 Joerg Schmidbauer 2019-08-14   90  		.cra_name	 =	"sha3-256",
3c2eb6b76cabb7 Joerg Schmidbauer 2019-08-14   91  		.cra_driver_name =	"sha3-256-s390",
3c2eb6b76cabb7 Joerg Schmidbauer 2019-08-14   92  		.cra_priority	 =	300,
6f90ba7065515d Herbert Xu        2025-04-18   93  		.cra_flags	 =	CRYPTO_AHASH_ALG_BLOCK_ONLY,
3c2eb6b76cabb7 Joerg Schmidbauer 2019-08-14   94  		.cra_blocksize	 =	SHA3_256_BLOCK_SIZE,
3c2eb6b76cabb7 Joerg Schmidbauer 2019-08-14   95  		.cra_module	 =	THIS_MODULE,
3c2eb6b76cabb7 Joerg Schmidbauer 2019-08-14   96  	}
3c2eb6b76cabb7 Joerg Schmidbauer 2019-08-14   97  };
3c2eb6b76cabb7 Joerg Schmidbauer 2019-08-14   98  
3c2eb6b76cabb7 Joerg Schmidbauer 2019-08-14  @99  static int sha3_224_init(struct shash_desc *desc)
3c2eb6b76cabb7 Joerg Schmidbauer 2019-08-14  100  {
3c2eb6b76cabb7 Joerg Schmidbauer 2019-08-14  101  	struct s390_sha_ctx *sctx = shash_desc_ctx(desc);
3c2eb6b76cabb7 Joerg Schmidbauer 2019-08-14  102  
6f90ba7065515d Herbert Xu        2025-04-18  103  	sha3_256_init(desc);
3c2eb6b76cabb7 Joerg Schmidbauer 2019-08-14  104  	sctx->func = CPACF_KIMD_SHA3_224;
3c2eb6b76cabb7 Joerg Schmidbauer 2019-08-14  105  	return 0;
3c2eb6b76cabb7 Joerg Schmidbauer 2019-08-14  106  }
3c2eb6b76cabb7 Joerg Schmidbauer 2019-08-14  107  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

