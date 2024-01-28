Return-Path: <keyrings+bounces-508-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 63D2283F5A2
	for <lists+keyrings@lfdr.de>; Sun, 28 Jan 2024 14:39:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D74B01C21433
	for <lists+keyrings@lfdr.de>; Sun, 28 Jan 2024 13:39:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F99A22F1D;
	Sun, 28 Jan 2024 13:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ea519LMZ"
X-Original-To: keyrings@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD3822375A;
	Sun, 28 Jan 2024 13:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.134.136.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706449196; cv=none; b=Gm3bCWzvSSQeJJGaLjDOrX+BkxJefbmXPkt15dn50h9aj2/uDYvfophIOJ2czTDM+CQBl6iiisVcuc1E5rGpKYya3XACItscKxd4YmzFhB01/PuDxMjpTRxjeOPMlpAZcUm6COD4MpSvf7Mhz5+M2wM4rgJbrlZLBuZuOCsv/rk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706449196; c=relaxed/simple;
	bh=P9qhIH7yb2IqSMRQfQhvgUK8xJ4ctjHPL0nym2sh5yc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gykz/yayitajaT4RMeCweYwiDcoQ/OIoeaM2GOdDZNmRQpLI6gJPq2KWuMXU5B8h6NabHlV7lAD1wlWmwtoScsgyYe+pyQGMPvKw594mwe47iueQLrv6EDf7JCfgeqjiYpW6ca1jlZ1dL52Lb+e2grNSmU3g/eKqsm9cpu2MQBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ea519LMZ; arc=none smtp.client-ip=134.134.136.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706449194; x=1737985194;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=P9qhIH7yb2IqSMRQfQhvgUK8xJ4ctjHPL0nym2sh5yc=;
  b=Ea519LMZQK/ZCS5/7PFZ6xTMqfkY7c86tzXC9rIruTZNLIVmuVBG/Jby
   nxy4DexCMTFZf/CsZW0KFtJDH8QnlMpUFKLDgca4yciOgx5f/JGhl3I7w
   McW2JAkCRzQ1peUpxA2nRnqagdxHZp+QSJArUGrrAvfkpdywYBdD4fs/E
   AcJAeucEeH9aLpgmwMZmwX9wRnAHJIhaeYm9MF0jYEIHpf5qJc2w4U3u9
   9Wp4/DbYyZlCKb1qjrICFdb0hzRIAwzyk2WK5MPZZrYnUmkXE3+uTos7O
   JMjHYnbHM9vyCzeYgZMYnBrk6E55lCPQV91DY9YXMX26T9hHajJE8icMx
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10966"; a="467042813"
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; 
   d="scan'208";a="467042813"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2024 05:39:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10966"; a="787576624"
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; 
   d="scan'208";a="787576624"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2024 05:39:51 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1rU5Gx-0000000HSqO-3xqP;
	Sun, 28 Jan 2024 15:32:31 +0200
Date: Sun, 28 Jan 2024 15:32:31 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Lukas Wunner <lukas@wunner.de>, David Howells <dhowells@redhat.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	keyrings@vger.kernel.org, linux-crypto@vger.kernel.org,
	Peter Zijlstra <peterz@infradead.org>,
	Dan Williams <dan.j.williams@intel.com>,
	Ard Biesheuvel <ardb@kernel.org>
Subject: Re: [PATCH] X.509: Introduce scope-based x509_certificate allocation
Message-ID: <ZbZXb7Bu1PrEMHrL@smile.fi.intel.com>
References: <70ecd3904a70d2b92f8f1e04365a2b9ce66fac25.1705857475.git.lukas@wunner.de>
 <ZbNFGC4q0Yy6RPNe@gondor.apana.org.au>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZbNFGC4q0Yy6RPNe@gondor.apana.org.au>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Jan 26, 2024 at 01:37:28PM +0800, Herbert Xu wrote:
> On Sun, Jan 21, 2024 at 06:50:39PM +0100, Lukas Wunner wrote:
> >
> > * x509_cert_parse() now checks that "cert" is not an ERR_PTR() before
> >   calling x509_free_certificate() at end of scope.  The compiler doesn't
> >   know that kzalloc() never returns an ERR_PTR().
> 
> How about moving the IS_ERR_OR_NULL check into x509_free_certificate
> itself so that you can always call it?

But why? The cleanup.h insists on having an explicit check, so call will be
ignored completely on the branches when it's not needed. This is the pattern
that is currently being used. Why do we need a deviation here?

-- 
With Best Regards,
Andy Shevchenko



