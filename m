Return-Path: <keyrings+bounces-764-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A7F386EF9D
	for <lists+keyrings@lfdr.de>; Sat,  2 Mar 2024 09:28:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5C6F51C21BE9
	for <lists+keyrings@lfdr.de>; Sat,  2 Mar 2024 08:28:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 711AA1757B;
	Sat,  2 Mar 2024 08:28:04 +0000 (UTC)
X-Original-To: keyrings@vger.kernel.org
Received: from bmailout1.hostsharing.net (bmailout1.hostsharing.net [83.223.95.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED05D17553;
	Sat,  2 Mar 2024 08:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=83.223.95.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709368084; cv=none; b=Y/soV01wPRy4nhR4Ob4Tn1XrDVYmwTkSM2zbkM96H2larD8R3EPOwNurtuTYaFmcEMCqbXvC4fKaih+cUgzvo3y8IJqDFotD+3NV6CclQtr/e+Ob6XMyWTAw26CfowxH3Mr1t7QN6bgfG8E/dee1ofElZnMNJtyUSPIUjiEc6b4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709368084; c=relaxed/simple;
	bh=CVULUo//9x0nN93MMBp0nP2y9b2g3CbSPU8l7LLAMoA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p2T//yBuBIssliNec+GBOD0uIbf+mnU0+gNmsgQ2sxwZANSmo/SEdZNyW4LekL5tBm9cLS0QrPb9soMUHqy7GsGVKPiC+1x6SIVvFGgst4+5+D7PqV1TTKlweB1+O1xfpLrlaKimsWIjQkpUtL2KQYKWtjLs4KlnXQ02Ev1B4Ks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de; spf=none smtp.mailfrom=h08.hostsharing.net; arc=none smtp.client-ip=83.223.95.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=h08.hostsharing.net
Received: from h08.hostsharing.net (h08.hostsharing.net [83.223.95.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "*.hostsharing.net", Issuer "RapidSSL TLS RSA CA G1" (verified OK))
	by bmailout1.hostsharing.net (Postfix) with ESMTPS id E2F8B3000086A;
	Sat,  2 Mar 2024 09:27:51 +0100 (CET)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id D220F168E2; Sat,  2 Mar 2024 09:27:51 +0100 (CET)
Date: Sat, 2 Mar 2024 09:27:51 +0100
From: Lukas Wunner <lukas@wunner.de>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: David Howells <dhowells@redhat.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	keyrings@vger.kernel.org, linux-crypto@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Dan Williams <dan.j.williams@intel.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Jarkko Sakkinen <jarkko@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Nathan Chancellor <nathan@kernel.org>
Subject: Re: [PATCH v3] X.509: Introduce scope-based x509_certificate
 allocation
Message-ID: <20240302082751.GA25828@wunner.de>
References: <63cc7ab17a5064756e26e50bc605e3ff8914f05a.1708439875.git.lukas@wunner.de>
 <ZeGpmbawHkLNcwFy@gondor.apana.org.au>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZeGpmbawHkLNcwFy@gondor.apana.org.au>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Fri, Mar 01, 2024 at 06:10:33PM +0800, Herbert Xu wrote:
> On Tue, Feb 20, 2024 at 04:10:39PM +0100, Lukas Wunner wrote:
> >
> > In x509_cert_parse(), add a hint for the compiler that kzalloc() never
> > returns an ERR_PTR().  Otherwise the compiler adds a gratuitous IS_ERR()
> > check on return.  Introduce a handy assume() macro for this which can be
> > re-used elsewhere in the kernel to provide hints for the compiler.
> 
> Would it be possible to move the use of assume into the kzalloc
> declaration instead? Perhaps by turning it into a static inline
> wrapper that does the "assume"?
> 
> Otherwise as time goes on we'll have a proliferation of these
> "assume"s all over the place.

I've tried moving the assume(!IS_ERR()) to kmalloc() (which already is
a static inline), but that increased total vmlinux size by 448 bytes.
I was expecting pushback due to the size increase, hence kept the
assume() local to x509_cert_parse().

There's a coccinelle rule which warns if an IS_ERR() check is performed
on a kmalloc'ed pointer (scripts/coccinelle/null/eno.cocci), hence there
don't seem to be any offenders left in the tree which use this antipattern
and adding assume(!IS_ERR()) to kmalloc() doesn't have any positive effect
beyond avoiding the single unnecessary check in x509_cert_parse().

If you don't like the assume(!IS_ERR(cert)) in x509_cert_parse(),
I can respin the patch to drop it.  The unnecessary check which it
avoids only occurs in the error path.  If the certificate can be
parsed without error, there's no unnecessary check.  It still
triggered my OCD when scrutinizing the disassembled code and
sufficiently annoyed me that I wanted to get rid of it,
but in reality it's not such a big deal.

Thanks,

Lukas

