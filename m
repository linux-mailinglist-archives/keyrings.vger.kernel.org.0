Return-Path: <keyrings+bounces-604-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BCC2C851DD2
	for <lists+keyrings@lfdr.de>; Mon, 12 Feb 2024 20:20:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4522CB23241
	for <lists+keyrings@lfdr.de>; Mon, 12 Feb 2024 19:20:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3132C4644E;
	Mon, 12 Feb 2024 19:20:15 +0000 (UTC)
X-Original-To: keyrings@vger.kernel.org
Received: from bmailout2.hostsharing.net (bmailout2.hostsharing.net [83.223.78.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C08A945014;
	Mon, 12 Feb 2024 19:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=83.223.78.240
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707765615; cv=none; b=kxjD0oaB860QQMwrX25yE1mS1iqsJGhY2USXYr5rFLI3gViCCf6ckiR0pnSmgfr2WhKIUEQE/C+oKuqhZ7xd/7MbW0nRbITtr8nKTDRIidkcjsBFrE/Vtr+7+t1qkMwAEkTLS8ekMheX6bP7Ti34EeoGaKxeWNjugCmfafcdLIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707765615; c=relaxed/simple;
	bh=FVraK5VpA8KDPuPKggW2NuN6F75oJkEORc7dRBwXXsM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pYSMzs3apvenakQEAeHRiUogcb08EB/87MmjZX0esyPLwZsD1oS+USkZH4rdg5KIEForpn+7pjBrPfnnrUzuy9GmGoU8cyE6U+qR3iyiL2lAYz9vebl/QgcJvWbt30GuD36W7myrc86XHCHOkdqQgzy4OHjFLOf7yvpBzWogWAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de; spf=none smtp.mailfrom=h08.hostsharing.net; arc=none smtp.client-ip=83.223.78.240
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=h08.hostsharing.net
Received: from h08.hostsharing.net (h08.hostsharing.net [IPv6:2a01:37:1000::53df:5f1c:0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "*.hostsharing.net", Issuer "RapidSSL TLS RSA CA G1" (verified OK))
	by bmailout2.hostsharing.net (Postfix) with ESMTPS id 7D9D52800E5D0;
	Mon, 12 Feb 2024 20:20:09 +0100 (CET)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id 664C0473EC7; Mon, 12 Feb 2024 20:20:09 +0100 (CET)
Date: Mon, 12 Feb 2024 20:20:09 +0100
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
Message-ID: <20240212192009.GA13884@wunner.de>
References: <4143b15418c4ecf87ddeceb36813943c3ede17aa.1707734526.git.lukas@wunner.de>
 <65ca6c5ab2728_5a7f294fe@dwillia2-xfh.jf.intel.com.notmuch>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <65ca6c5ab2728_5a7f294fe@dwillia2-xfh.jf.intel.com.notmuch>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Mon, Feb 12, 2024 at 11:07:06AM -0800, Dan Williams wrote:
> Lukas Wunner wrote:
> > In x509_cert_parse(), add a hint for the compiler that kzalloc() never
> > returns an ERR_PTR().  Otherwise the compiler adds a gratuitous IS_ERR()
> > check on return.  Introduce a handy assume() macro for this which can be
> > re-used elsewhere in the kernel to provide hints for the compiler.
[...]
> >  	cert = kzalloc(sizeof(struct x509_certificate), GFP_KERNEL);
> > +	assume(!IS_ERR(cert)); /* Avoid gratuitous IS_ERR() check on return */
> 
> I like the idea of assume() I just wonder if it should move inside of
> the kmalloc() inline definition itself? I.e. solve the "cleanup.h" vs
> ERR_PTR() rough edge more generally.

I've tried that but total vmlinux size increased by 448 bytes.
It seems to cause additional code or padding somewhere.  To avoid
pushback because of that, I confined it to just x509_cert_parse().

I should mention that there's a coccinelle rule which warns if
someone performs an IS_ERR() check on a kmalloc'ed pointer
(scripts/coccinelle/null/eno.cocci).  Which is why there likely
aren't any offenders in the tree.  That rule is triggered by
this assume() clause, but it's obviously a false-positive.
I'll look into suppressing that warning if/when this patch
gets accepted.

I should also mention that assume() currently only has an effect
with gcc.  clang-15 just ignored it during my testing.

Thanks,

Lukas

