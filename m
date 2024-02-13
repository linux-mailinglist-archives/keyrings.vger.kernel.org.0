Return-Path: <keyrings+bounces-611-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E5094852820
	for <lists+keyrings@lfdr.de>; Tue, 13 Feb 2024 06:11:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 119241C22D54
	for <lists+keyrings@lfdr.de>; Tue, 13 Feb 2024 05:11:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8175E816;
	Tue, 13 Feb 2024 05:11:18 +0000 (UTC)
X-Original-To: keyrings@vger.kernel.org
Received: from bmailout1.hostsharing.net (bmailout1.hostsharing.net [83.223.95.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8319111717;
	Tue, 13 Feb 2024 05:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=83.223.95.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707801078; cv=none; b=MT0h4E07Np+hx/tmCCf2CWAhLARmGwHrT3xSG4m70Pd9zqJShoCjenhpY+MSy72mb0lGFSu8dTJWH8ZyU4rRsA2KErRjsHL41/k8rLDhD0UCi9D1WYTZkLeC0Iv+7qOH17aRW6ngEncAudchvR8lCltEnbJo3WdyWti0ndHOMcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707801078; c=relaxed/simple;
	bh=CHJ+Aj4mFHtfBR7E6FlZ5tP+277WRqFkwNzHnRNxBlo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p4r/nx6X6yb+Op5JDQBjSGDNLo/sMtbpkkcMZ4VGMhkib8eYthCJdWKLx0J3F4iUEksw/VT7JOssOsC/mQLIxirNZL7VA34mwAmwTqPPw/v2DtncndT7DnOaLeOq4yBdAaw8SNld58/nGyIDid32GfKA7EhShnrozljVRP9XcAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de; spf=none smtp.mailfrom=h08.hostsharing.net; arc=none smtp.client-ip=83.223.95.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=h08.hostsharing.net
Received: from h08.hostsharing.net (h08.hostsharing.net [83.223.95.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "*.hostsharing.net", Issuer "RapidSSL TLS RSA CA G1" (verified OK))
	by bmailout1.hostsharing.net (Postfix) with ESMTPS id E4191300037E4;
	Tue, 13 Feb 2024 06:04:45 +0100 (CET)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id D045C1D43B9; Tue, 13 Feb 2024 06:04:45 +0100 (CET)
Date: Tue, 13 Feb 2024 06:04:45 +0100
From: Lukas Wunner <lukas@wunner.de>
To: Dan Williams <dan.j.williams@intel.com>
Cc: David Howells <dhowells@redhat.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	keyrings@vger.kernel.org, linux-crypto@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Jarkko Sakkinen <jarkko@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Nathan Chancellor <nathan@kernel.org>
Subject: Re: [PATCH v2] X.509: Introduce scope-based x509_certificate
 allocation
Message-ID: <20240213050445.GA27995@wunner.de>
References: <4143b15418c4ecf87ddeceb36813943c3ede17aa.1707734526.git.lukas@wunner.de>
 <65ca6c5ab2728_5a7f294fe@dwillia2-xfh.jf.intel.com.notmuch>
 <20240212192009.GA13884@wunner.de>
 <65ca861e14779_5a7f2949e@dwillia2-xfh.jf.intel.com.notmuch>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <65ca861e14779_5a7f2949e@dwillia2-xfh.jf.intel.com.notmuch>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Mon, Feb 12, 2024 at 12:57:02PM -0800, Dan Williams wrote:
> Lukas Wunner wrote:
> > On Mon, Feb 12, 2024 at 11:07:06AM -0800, Dan Williams wrote:
> > > Lukas Wunner wrote:
> > > > In x509_cert_parse(), add a hint for the compiler that kzalloc()
> > > > never returns an ERR_PTR().  Otherwise the compiler adds a gratuitous
> > > > IS_ERR() check on return.  Introduce a handy assume() macro for this
> > > > which can be re-used elsewhere in the kernel to provide hints for the
> > > > compiler.
> 
> Might I suggest the following:
> 
> > diff --git a/include/linux/compiler.h b/include/linux/compiler.h
> > index bb1339c..384803e 100644
> > --- a/include/linux/compiler.h
> > +++ b/include/linux/compiler.h
> > @@ -139,6 +139,8 @@ void ftrace_likely_update(struct ftrace_likely_data *f, int val,
> >  } while (0)
> >  #endif
> >  
> > +#define assume(cond) do if(!(cond)) __builtin_unreachable(); while(0)
> 
> s/__builtin_unreachable()/unreachable()/?

I tried that and it didn't work.  The superfluous IS_ERR() check
was not optimized away by gcc.  It seemed to remove the unreachable
portion of the code before using it for optimization of the code.


> Move this to cleanup.h and add extend the DEFINE_FREE() comment about
> its usage:

Yes, spreading the knowledge in this way might make sense.
I'll wait for Peter to weigh in before submitting that though.

Thanks,

Lukas

