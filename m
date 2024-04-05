Return-Path: <keyrings+bounces-1076-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DC15489996C
	for <lists+keyrings@lfdr.de>; Fri,  5 Apr 2024 11:29:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7D4851F227A0
	for <lists+keyrings@lfdr.de>; Fri,  5 Apr 2024 09:29:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5EAD15FCF6;
	Fri,  5 Apr 2024 09:29:17 +0000 (UTC)
X-Original-To: keyrings@vger.kernel.org
Received: from bmailout3.hostsharing.net (bmailout3.hostsharing.net [176.9.242.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B96815FCE2;
	Fri,  5 Apr 2024 09:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=176.9.242.62
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712309357; cv=none; b=qNeMiZz5IzN97B9e6L9I6mu1xjljEVVKQSs5pi2R9YvKyxIaO9j6pm8XHB52RYVyQM0CzKLMZ5it6diHmFBWkoP7fS/CIqPZXzYj2/1i1s1dLwTlix/SsqK4SezgJNDA+VeqydcG0RI2aZp6lcVZdjvMulYQGiWQ8zmXUTEFwew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712309357; c=relaxed/simple;
	bh=Y24ye3Z3sxdzRUqBmE+2D+Ilmvls6rU9q0bvb5UvSM8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=sQnMwVm1MKhQgy5i15FWHbn7cd1i4f4tChFccI677TVvTAqYm5IWCtE7PFUcjayQxvCZ9QDvXBQsNs/T2TWDil7WkD4bI4COOhETmpQg2GyRRwOX4KmqNtIqJXaN871zvAhH9lQjJKo/kaP6vKGjmK7iR/beprZ8MAbiwhPeHI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de; spf=none smtp.mailfrom=h08.hostsharing.net; arc=none smtp.client-ip=176.9.242.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=h08.hostsharing.net
Received: from h08.hostsharing.net (h08.hostsharing.net [83.223.95.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "*.hostsharing.net", Issuer "RapidSSL TLS RSA CA G1" (verified OK))
	by bmailout3.hostsharing.net (Postfix) with ESMTPS id 1C4E8100DA1A6;
	Fri,  5 Apr 2024 11:29:06 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id E7B329926C7; Fri,  5 Apr 2024 11:29:05 +0200 (CEST)
Date: Fri, 5 Apr 2024 11:29:05 +0200
From: Lukas Wunner <lukas@wunner.de>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: David Howells <dhowells@redhat.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	keyrings@vger.kernel.org, linux-crypto@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Dan Williams <dan.j.williams@intel.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Nathan Chancellor <nathan@kernel.org>
Subject: Re: [PATCH v3] X.509: Introduce scope-based x509_certificate
 allocation
Message-ID: <Zg_EYX5m-GTyfPbY@wunner.de>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CZA3R5R9CVYD.1HH1S662FW2RX@seitikki>
 <CZA3PCY3U4YU.3R05ZC4X16EX0@seitikki>

On Tue, Feb 20, 2024 at 06:00:41PM +0000, Jarkko Sakkinen wrote:
> On Tue Feb 20, 2024 at 3:10 PM UTC, Lukas Wunner wrote:
> > Add a DEFINE_FREE() clause for x509_certificate structs and use it in
> > x509_cert_parse() and x509_key_preparse().  These are the only functions
> > where scope-based x509_certificate allocation currently makes sense.
> > A third user will be introduced with the forthcoming SPDM library
> > (Security Protocol and Data Model) for PCI device authentication.
> 
> I think you are adding scope-based memory management and not
> DEFINE_FREE(). Otherwise, this would be one-liner patch.

Above it states very clearly: "and use it in x509_cert_parse() and
x509_key_preparse()".

That's the reason it is not a one-liner patch.


> I'm not sure if the last sentence adds more than clutter as this
> patch has nothing to do with SPDM changes per se.

I disagree.  It is important as a justification for the change that
the two functions converted here are not going to be the only users,
but that there's a third one coming up.


> > I've compared the Assembler output before/after and they are identical,
> > save for the fact that gcc-12 always generates two return paths when
> > __cleanup() is used, one for the success case and one for the error case.
> 
> Use passive as commit message is not a personal letter.

Okay, I will respin and change to passive mood.


> I don't see a story here but instead I see bunch of disordered tecnical
> terms.

That doesn't sound like constructive criticism.


> We have the code diff for detailed technical stuff. The commit message
> should simply explain why we want this and what it does for us.
[...]
> What is the most important function of a commit message? Well, it comes
> when the commit is in the mainline. It reminds of the *reasons* why a
> change was made and this commit message does not really serve well in
> that role.

The reason for the commit is that Jonathan requested it during code
review of my PCI device authentication patches.  I've been stating
this very clearly in the first iteration of the present patch.
You asked that I delete the sentence and instead use a Suggested-by.

Perhaps it would have been better had I not listened to you.
Because now you seem to have forgotten the reason for the patch,
which, again, you asked me to delete.

FWIW, here's the link to Jonathan's review:
https://lore.kernel.org/all/20231003153937.000034ca@Huawei.com/

And here's the quote with his explicit request to use cleanup.h:

   "Maybe cleanup.h magic?  Seems like it would simplify error paths here a
    tiny bit. Various other cases follow, but I won't mention this every time
    [...]
    Even this could be done with the cleanup.h stuff with appropriate
    pointer stealing and hence allow direct returns.
    This is the sort of case that I think really justifies that stuff."

Thanks,

Lukas

