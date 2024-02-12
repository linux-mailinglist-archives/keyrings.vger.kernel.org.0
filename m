Return-Path: <keyrings+bounces-592-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 09DD6851371
	for <lists+keyrings@lfdr.de>; Mon, 12 Feb 2024 13:19:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B9854283CFF
	for <lists+keyrings@lfdr.de>; Mon, 12 Feb 2024 12:19:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3A1939AF3;
	Mon, 12 Feb 2024 12:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q0Xh+okx"
X-Original-To: keyrings@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4105339AE6;
	Mon, 12 Feb 2024 12:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707740349; cv=none; b=FEtPNkEF9gQdq8+atH8EKh8iFUyyZ5/2iFwppbC899GG8Uhzc7k39diX6et7lm/hFchOl3ul3QAhC4eXg1oQ2AiCi9t5F2Y2RbRLfbF5nESSGut/4LwyGWzKgb7MH0EZjUjKAEpiHGn5YSwYDikFK7i2uz/5FUdhfX7goBq1GTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707740349; c=relaxed/simple;
	bh=mFO4DZf4wIo5Zv/X4uh9RgOpgz1HA2YwRo3d7O1/7nA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CSNq2Pm74vtjCt+SAliGNC9sTwO5auZyUjEThZFmKklU7woI965RfA6lvw08C6WJU6SltbLgrCE1wP5YA5/MjFfslOxQ42FC6bmkHh4kckaQKFTITOWnExrzncbxvlZtHVUDSPbGzv8xetgFnP1b2dekdGd6gjuEctZeGh02j1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q0Xh+okx; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707740348; x=1739276348;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mFO4DZf4wIo5Zv/X4uh9RgOpgz1HA2YwRo3d7O1/7nA=;
  b=Q0Xh+okxP9d1pzo7j52SfBOq05pNH5zrzhmn1Rf/3SO20FACnGG2uIuN
   N09ph3X7jDU8SJzww+8Z342VqfcndOhSfimggowzmlYUyJmH0or7gQ3Lm
   dxPK9vu+K2kjSktVr544+FHtP/tk13vEkWXas7PB2AvKKBrIzBsQbVMrq
   1nLaiPLr4aW09ReRMjdo1et9OWBfxMfqowTIxXeOOdblsYYl2JXxk4z4g
   NseEjy2zFSfarqn+voymyKfkUQFjVQNzJIB0ky43ekHhS8nsBlLgii46r
   fpau6jiCU0qRypjRVbdFddhY0gPCl1cDLb1KMmwprZpCn8hRbPKw58CtT
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10981"; a="1591296"
X-IronPort-AV: E=Sophos;i="6.06,263,1705392000"; 
   d="scan'208";a="1591296"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2024 04:19:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10981"; a="911466980"
X-IronPort-AV: E=Sophos;i="6.06,263,1705392000"; 
   d="scan'208";a="911466980"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2024 04:19:03 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1rZVH2-00000003tF8-3IH5;
	Mon, 12 Feb 2024 14:19:00 +0200
Date: Mon, 12 Feb 2024 14:19:00 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: David Howells <dhowells@redhat.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	keyrings@vger.kernel.org, linux-crypto@vger.kernel.org,
	Peter Zijlstra <peterz@infradead.org>,
	Dan Williams <dan.j.williams@intel.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Jarkko Sakkinen <jarkko@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Nathan Chancellor <nathan@kernel.org>
Subject: Re: [PATCH v2] X.509: Introduce scope-based x509_certificate
 allocation
Message-ID: <ZcoMtNcBZq5wbbAY@smile.fi.intel.com>
References: <4143b15418c4ecf87ddeceb36813943c3ede17aa.1707734526.git.lukas@wunner.de>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4143b15418c4ecf87ddeceb36813943c3ede17aa.1707734526.git.lukas@wunner.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Feb 12, 2024 at 12:24:39PM +0100, Lukas Wunner wrote:
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
> check on return.

> Introduce a handy assume() macro for this which can be
> re-used elsewhere in the kernel to provide hints for the compiler.

Shouldn't it be in a separate patch?

...

> +#define assume(cond) do if(!(cond)) __builtin_unreachable(); while(0)

Missing spaces? Missing braces (for the sake of robustness)?

#define assume(cond) do { if (!(cond)) __builtin_unreachable(); } while (0)

-- 
With Best Regards,
Andy Shevchenko



