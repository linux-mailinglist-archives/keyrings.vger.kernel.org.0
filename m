Return-Path: <keyrings+bounces-590-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4498F85126B
	for <lists+keyrings@lfdr.de>; Mon, 12 Feb 2024 12:39:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D84321F23BAF
	for <lists+keyrings@lfdr.de>; Mon, 12 Feb 2024 11:39:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 132F739859;
	Mon, 12 Feb 2024 11:39:27 +0000 (UTC)
X-Original-To: keyrings@vger.kernel.org
Received: from bmailout2.hostsharing.net (bmailout2.hostsharing.net [83.223.78.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A2C93984A;
	Mon, 12 Feb 2024 11:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=83.223.78.240
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707737967; cv=none; b=igR9QrgTNzcRD0CGa2oyvAM9vxdyOc/coUTWz5VOXsy3LfY4UIyrN1xP6nyAzR97ERfK5egYJx02wLHcUBGmtNAtG5mHQHZEPQMEK7GWp6t7YJk16LlubuHZJDkHzKJAgjt9pO2C3TGowIsc1gbliHHU7p2cp4xGOnbfZnfv1TM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707737967; c=relaxed/simple;
	bh=futqDLgv3tlotdyd35QD213Q692uWMARo7CbWQwzja0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UPiQLeu1xA/KseRLRppu9hBr+U469c0L+Ws+/ZH4mCK0ZQyGePRQRuI8bd+quGYXfHJJMCfo4NYjqE9L9g0634RWx9Wnh8P324Xn0554cxQS2VJCtaFzDjenoAhXjwZ9esJHt2Y7f5cg/acPlolq9rTUTY7Mv2Bfzep+mkLw5Rw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de; spf=none smtp.mailfrom=h08.hostsharing.net; arc=none smtp.client-ip=83.223.78.240
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=h08.hostsharing.net
Received: from h08.hostsharing.net (h08.hostsharing.net [IPv6:2a01:37:1000::53df:5f1c:0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "*.hostsharing.net", Issuer "RapidSSL TLS RSA CA G1" (verified OK))
	by bmailout2.hostsharing.net (Postfix) with ESMTPS id 8535F2800B76D;
	Mon, 12 Feb 2024 12:39:16 +0100 (CET)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id 77995D5ABB; Mon, 12 Feb 2024 12:39:16 +0100 (CET)
Date: Mon, 12 Feb 2024 12:39:16 +0100
From: Lukas Wunner <lukas@wunner.de>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: David Howells <dhowells@redhat.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	keyrings@vger.kernel.org, linux-crypto@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Dan Williams <dan.j.williams@intel.com>,
	Ard Biesheuvel <ardb@kernel.org>
Subject: Re: [PATCH] X.509: Introduce scope-based x509_certificate allocation
Message-ID: <20240212113916.GB15065@wunner.de>
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
User-Agent: Mutt/1.10.1 (2018-07-13)

On Fri, Jan 26, 2024 at 01:37:28PM +0800, Herbert Xu wrote:
> On Sun, Jan 21, 2024 at 06:50:39PM +0100, Lukas Wunner wrote:
> >
> > * x509_cert_parse() now checks that "cert" is not an ERR_PTR() before
> >   calling x509_free_certificate() at end of scope.  The compiler doesn't
> >   know that kzalloc() never returns an ERR_PTR().
> 
> How about moving the IS_ERR_OR_NULL check into x509_free_certificate
> itself so that you can always call it?

Thanks for the suggestion.  Indeed the NULL check is unnecessary
as x509_free_certificate() already checks that.  So in v2 I'm only
checking for !IS_ERR() in the DEFINE_FREE() clause and that avoids
the gratuitous NULL pointer checks at end of scope.

Lukas

