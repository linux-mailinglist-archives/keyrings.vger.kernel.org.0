Return-Path: <keyrings+bounces-593-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 445668519C2
	for <lists+keyrings@lfdr.de>; Mon, 12 Feb 2024 17:42:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F36EB2869E7
	for <lists+keyrings@lfdr.de>; Mon, 12 Feb 2024 16:42:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 205E01E496;
	Mon, 12 Feb 2024 16:36:40 +0000 (UTC)
X-Original-To: keyrings@vger.kernel.org
Received: from bmailout2.hostsharing.net (bmailout2.hostsharing.net [83.223.78.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 074133C495;
	Mon, 12 Feb 2024 16:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=83.223.78.240
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707755800; cv=none; b=EPl/oP//gu0Aqu3vzUTDAGKNbPtIimNsCIrLxz1STbRgUdIGs5utKWUVHshuQkZur8J28KHn3bGxvM07IDbnRZTLTS+wAY6taNeYP5EXKm4MMrbEr30T0DaG8qzzXOisV3Kna7gp03iGMGQnwMJ8bleSU7+x0o4HRsG256NKmrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707755800; c=relaxed/simple;
	bh=Bzn/M02ko0c//xrjr3QJW5TX0nFz1yuFAgrt0hMvtEw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rpwtfwO7TEmbprf7VHkGG7FsX406w1qKTfN3mO9ZL8h+MJQQfyGI8KIJpkze1coAEWAECWX0dtoZMKwCGqXjFPT+x8SE4HP108vcEEowyNGJWOWHUVaqpo+7nZr7oJDJsFFulaTU2ga/5vnc5XZhniPSRjZUXK8/7veU82WdUbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de; spf=none smtp.mailfrom=h08.hostsharing.net; arc=none smtp.client-ip=83.223.78.240
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=h08.hostsharing.net
Received: from h08.hostsharing.net (h08.hostsharing.net [83.223.95.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "*.hostsharing.net", Issuer "RapidSSL TLS RSA CA G1" (verified OK))
	by bmailout2.hostsharing.net (Postfix) with ESMTPS id AD4262800B3C6;
	Mon, 12 Feb 2024 17:36:34 +0100 (CET)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id 92EC7136202; Mon, 12 Feb 2024 17:36:34 +0100 (CET)
Date: Mon, 12 Feb 2024 17:36:34 +0100
From: Lukas Wunner <lukas@wunner.de>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
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
Message-ID: <20240212163634.GA1966@wunner.de>
References: <4143b15418c4ecf87ddeceb36813943c3ede17aa.1707734526.git.lukas@wunner.de>
 <ZcoMtNcBZq5wbbAY@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZcoMtNcBZq5wbbAY@smile.fi.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Mon, Feb 12, 2024 at 02:19:00PM +0200, Andy Shevchenko wrote:
> On Mon, Feb 12, 2024 at 12:24:39PM +0100, Lukas Wunner wrote:
> > Jonathan suggests adding cleanup.h support for x509_certificate structs.
> > cleanup.h is a newly introduced way to automatically free allocations at
> > end of scope:  https://lwn.net/Articles/934679/
> > 
> > So add a DEFINE_FREE() clause for x509_certificate structs and use it in
> > x509_cert_parse() and x509_key_preparse().  These are the only functions
> > where scope-based x509_certificate allocation currently makes sense.
> > A third user will be introduced with the forthcoming SPDM library
> > (Security Protocol and Data Model) for PCI device authentication.
> > 
> > Unlike most other DEFINE_FREE() clauses, this one checks for IS_ERR()
> > instead of NULL before calling x509_free_certificate() at end of scope.
> > That's because the "constructor" of x509_certificate structs,
> > x509_cert_parse(), returns a valid pointer or an ERR_PTR(), but never
> > NULL.
> > 
> > I've compared the Assembler output before/after and they are identical,
> > save for the fact that gcc-12 always generates two return paths when
> > __cleanup() is used, one for the success case and one for the error case.
> > 
> > In x509_cert_parse(), add a hint for the compiler that kzalloc() never
> > returns an ERR_PTR().  Otherwise the compiler adds a gratuitous IS_ERR()
> > check on return.
> 
> > Introduce a handy assume() macro for this which can be
> > re-used elsewhere in the kernel to provide hints for the compiler.
> 
> Shouldn't it be in a separate patch?

The advantage of introducing it in this patch is that someone later
examining the git history with "git blame" + "git log" will directly
see why exactly it was added and what it's good for.  Often people
introduce a feature in one patch but its usage is in a different patch
and that means more digging in the git history, which can be annoying.

I also don't see an *advantage* of splitting into two patches.  If someone
decides to revert the DEFINE_FREE() conversion for x509_certificate structs,
they would leave the assume() macro behind because it was in a separate
patch.  Leaving an unused macro behind should probably be avoided.
Granted if at that point there are additional assume() users, the revert
patch would have to be edited, but who knows if and when those will appear.


> > +#define assume(cond) do if(!(cond)) __builtin_unreachable(); while(0)
> 
> Missing spaces? Missing braces (for the sake of robustness)?
> 
> #define assume(cond) do { if (!(cond)) __builtin_unreachable(); } while (0)

Hm, I'm not sure why this improves robustness?
Readability might be an argument for the braces. *shrug*

Thanks,

Lukas

