Return-Path: <keyrings+bounces-3030-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 71478B89482
	for <lists+keyrings@lfdr.de>; Fri, 19 Sep 2025 13:33:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 320AA3ACBFB
	for <lists+keyrings@lfdr.de>; Fri, 19 Sep 2025 11:33:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47D3C2FC00E;
	Fri, 19 Sep 2025 11:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kZMEdtLt"
X-Original-To: keyrings@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D0153081DC;
	Fri, 19 Sep 2025 11:33:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758281611; cv=none; b=Q/x2N1pihTOTS0/OS3jn6OsV9R2u2NAqW2U9hsF0agsrEFc28MVyVXRL5jOyKx4Ff7Ja98UTqbrOWZSS1KqoGbttYelVtrpkBA+QEh7JLC9ilpSAPBbv7yZGlXNwpvwQOnuYWs0priLeETsr+TpvqYxUh48kA4XUydW7+IS/lB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758281611; c=relaxed/simple;
	bh=/4VwWOhjauXsfY9ntn6Ue6xTcnqRGvf9YDxTB/1IvnM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=owfb6AELCC8NSEUgt5iQ+J4TMdz74S85hf0G2CGrKGl0k4QEIcNGa2QbBQFheYYuXtpMrS9ZZKPgv/Hwf5tHFZw37sdvYFBoH4kp+66gSuDETWnhNxv7U9qebiJi8ZZWqh4Gows6PtJk1k/1vubBCThzMC+c310110Sydf2HjN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kZMEdtLt; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758281610; x=1789817610;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/4VwWOhjauXsfY9ntn6Ue6xTcnqRGvf9YDxTB/1IvnM=;
  b=kZMEdtLt3gYK6S09/mMz83d8e7qDY8vZIgyS1TvAqYz72TyY6jnMbGgq
   OxNo6Vdo258QTs5GXUVLgtWllexXDYSGaKgbcCIJjkbLh0rixudW/p5Za
   egA6haHYNmUM3eyF6ZmleTFIt+g0xklaWIYIhKfW9eCX102cPlmO3GPzR
   PN8nw1Hq8sh1rWWcR7A+eNCyRO3YfrGERUQ05lmiNvbqkotnSmz+k2KvD
   HaPnYOHrdHGJ4xTfzEfNMLKMH1NGOlbk4bzt/ilf8dxJl+KjKbH1LxU19
   aup5xydgjj6oIo8r1X+Ba6Qz2Crg7bv9RPaPC4XLczU2fktMRfXrxeaZb
   w==;
X-CSE-ConnectionGUID: bMYBvhkISmiPK9G1UY758A==
X-CSE-MsgGUID: gGmdEbwYSvi36s7nG+cj9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11557"; a="83229907"
X-IronPort-AV: E=Sophos;i="6.18,277,1751266800"; 
   d="scan'208";a="83229907"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2025 04:33:29 -0700
X-CSE-ConnectionGUID: IKqascKySYqe3W1E8Eb0Bw==
X-CSE-MsgGUID: lA89En3tSYqfh8/binHCHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,277,1751266800"; 
   d="scan'208";a="175372304"
Received: from lkp-server01.sh.intel.com (HELO 84a20bd60769) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 19 Sep 2025 04:33:26 -0700
Received: from kbuild by 84a20bd60769 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uzZMh-0004Fr-1r;
	Fri, 19 Sep 2025 11:33:23 +0000
Date: Fri, 19 Sep 2025 19:33:10 +0800
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
Message-ID: <202509191938.PrHY82Kd-lkp@intel.com>
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
config: arc-randconfig-r112-20250919 (https://download.01.org/0day-ci/archive/20250919/202509191938.PrHY82Kd-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250919/202509191938.PrHY82Kd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509191938.PrHY82Kd-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> lib/crypto/sha3.c:317:11: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le64 [usertype] *s @@     got unsigned long long * @@
   lib/crypto/sha3.c:317:11: sparse:     expected restricted __le64 [usertype] *s
   lib/crypto/sha3.c:317:11: sparse:     got unsigned long long *
>> lib/crypto/sha3.c:319:36: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned long long [usertype] val @@     got restricted __le64 [usertype] @@
   lib/crypto/sha3.c:319:36: sparse:     expected unsigned long long [usertype] val
   lib/crypto/sha3.c:319:36: sparse:     got restricted __le64 [usertype]

vim +317 lib/crypto/sha3.c

   271	
   272	/**
   273	 * sha3_final() - Finish computing a SHA3 message digest of any type
   274	 * @ctx: the context to finalize; must have been initialized
   275	 * @out: (output) the resulting message digest
   276	 *
   277	 * Finish the computation of a SHA3 message digest of any type and perform the
   278	 * "Keccak sponge squeezing" phase.  The digest is written to @out buffer and
   279	 * the size of the digest is returned.  Before returning, the context @ctx is
   280	 * cleared so that the caller does not need to do it.
   281	 */
   282	int sha3_final(struct sha3_ctx *ctx, u8 *out)
   283	{
   284		struct sha3_state *state = &ctx->state;
   285		unsigned int digest_size = ctx->digest_size;
   286		unsigned int bsize = ctx->block_size;
   287		u8 end_marker = 0x80;
   288	
   289		sha3_absorb_xorle(ctx, &ctx->padding, 1);
   290		ctx->partial = bsize - 1;
   291		sha3_absorb_xorle(ctx, &end_marker, 1);
   292		sha3_keccakf(ctx->state.st);
   293	
   294	#ifdef __LITTLE_ENDIAN
   295		for (;;) {
   296			unsigned int part = umin(digest_size, bsize);
   297	
   298			memcpy(out, state->st, part);
   299			digest_size -= part;
   300			if (!digest_size)
   301				goto done;
   302			out += part;
   303			sha3_keccakf(ctx->state.st);
   304		}
   305	#else
   306		__le64 *digest = (__le64 *)out, *s;
   307	
   308		while (digest_size >= bsize) {
   309			for (int i = 0; i < bsize / 8; i++)
   310				put_unaligned_le64(state->st[i], digest++);
   311			digest_size -= bsize;
   312			if (!digest_size)
   313				goto done;
   314			sha3_keccakf(ctx->state.st);
   315		}
   316	
 > 317		s = state->st;
   318		for (; digest_size >= 8; digest_size -= 8)
 > 319			put_unaligned_le64(*s++, digest++);
   320	
   321		u8 *sc = (u8 *)s;
   322		u8 *dc = (u8 *)digest;
   323	
   324		for (; digest_size >= 1; digest_size -= 1)
   325			*dc++ = *sc++;
   326	#endif
   327	done:
   328		digest_size = ctx->digest_size;
   329		memzero_explicit(ctx, sizeof(*ctx));
   330		return digest_size;
   331	}
   332	EXPORT_SYMBOL_GPL(sha3_final);
   333	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

