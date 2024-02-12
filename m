Return-Path: <keyrings+bounces-589-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F673851258
	for <lists+keyrings@lfdr.de>; Mon, 12 Feb 2024 12:36:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EF47E1F21046
	for <lists+keyrings@lfdr.de>; Mon, 12 Feb 2024 11:36:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E508C38FB0;
	Mon, 12 Feb 2024 11:35:59 +0000 (UTC)
X-Original-To: keyrings@vger.kernel.org
Received: from bmailout3.hostsharing.net (bmailout3.hostsharing.net [176.9.242.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB29138FB2;
	Mon, 12 Feb 2024 11:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=176.9.242.62
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707737759; cv=none; b=H9Lk7ziv9AxR4bfIw7vXzLlYPeIRKD7tf9SuvYamu5IrIpBXwY+ZU5/QpDQm+N2V5NFZ8vBhdmPg7b6T/HNqTMF6BD/akvUE9YsQXMbakpv/GP5UkWNkW059HPf6M5bgyP1v9TrMiq5+6yjm0j89v8wzHUaPeUETZz4qJj5yMDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707737759; c=relaxed/simple;
	bh=dwUgIDooyWsgURasG21d1orlggXG8kSHNDkyx3wsCno=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jcorZlqHepJpA0hFclbdBWi0olYudZAXBfUrKGdadPQ4rWJ8fKUH7Pwv+5ffVZmU/dqGOOyJtbmd4pC1Zp1AFPPexKidn1Xz5Mi7Bjaid7vGyMZ4WBlR0uMN0Rr7YG5UN7zQEHXUwV3Ycbdqmg65/BEtTROCcs2rrVUa9H4yTv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de; spf=none smtp.mailfrom=h08.hostsharing.net; arc=none smtp.client-ip=176.9.242.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=h08.hostsharing.net
Received: from h08.hostsharing.net (h08.hostsharing.net [IPv6:2a01:37:1000::53df:5f1c:0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "*.hostsharing.net", Issuer "RapidSSL TLS RSA CA G1" (verified OK))
	by bmailout3.hostsharing.net (Postfix) with ESMTPS id 93187100DA1AC;
	Mon, 12 Feb 2024 12:35:54 +0100 (CET)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id 6449D1CCAED; Mon, 12 Feb 2024 12:35:54 +0100 (CET)
Date: Mon, 12 Feb 2024 12:35:54 +0100
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
	Ard Biesheuvel <ardb@kernel.org>
Subject: Re: [PATCH] X.509: Introduce scope-based x509_certificate allocation
Message-ID: <20240212113554.GA15065@wunner.de>
References: <70ecd3904a70d2b92f8f1e04365a2b9ce66fac25.1705857475.git.lukas@wunner.de>
 <CYLHFLJROQG2.SCLJMME8WBN8@suppilovahvero>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CYLHFLJROQG2.SCLJMME8WBN8@suppilovahvero>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Mon, Jan 22, 2024 at 09:29:33PM +0200, Jarkko Sakkinen wrote:
> On Sun Jan 21, 2024 at 7:50 PM EET, Lukas Wunner wrote:
> > Jonathan suggests adding cleanup.h support for x509_certificate structs:
> > https://lore.kernel.org/all/20231003153937.000034ca@Huawei.com/
[...]
> > x509_certificate allocation currently makes sense.  Another user will
> > be introduced with the upcoming SPDM library (Security Protocol and
> > Data Model) for PCI device authentication.
> 
> What is it and why we care about it here?

SPDM is a generic protocol for device authentication and measurement
retrieval which has been adopted by the PCISIG and other consortiums.
Jonathan's above-linked suggestion to add cleanup.h support for
x509_certificate structs was in reply to a patch set I submitted
to add SPDM and PCI device authentication support to the kernel.
The cover letter of that patch set is available here:

https://lore.kernel.org/all/cover.1695921656.git.lukas@wunner.de/

I am working on a v2 of that patch set which will take advantage of
cleanup.h support for x509_certificate structs.  So the present patch
is a prerequisite for it.

I don't think it's opportune or necessary to mention the patch set
more verbosely in the commit message here, I just want to point out
that the two functions converted by the patch will not be the only
ones and that there's another use case coming up.

I've just respun the patch and have amended the commit message with
all the other feedback you gave.

Thanks,

Lukas

