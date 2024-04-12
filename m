Return-Path: <keyrings+bounces-1087-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 30BA98A2828
	for <lists+keyrings@lfdr.de>; Fri, 12 Apr 2024 09:34:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E1A12280D8D
	for <lists+keyrings@lfdr.de>; Fri, 12 Apr 2024 07:33:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7163F4CB35;
	Fri, 12 Apr 2024 07:33:56 +0000 (UTC)
X-Original-To: keyrings@vger.kernel.org
Received: from abb.hmeau.com (abb.hmeau.com [144.6.53.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F0784AEE3;
	Fri, 12 Apr 2024 07:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=144.6.53.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712907236; cv=none; b=Ehh9NvG25Li02lRgmE/16JjTSIiVVZ9BQnPEuk/JljnMp/xri4/PepfP/2F6QX3vqhSNdWLYDP7DdZ6son89CPnUZ4aI1oFUNDGLos6oq5e8jRkJjDC+wT1uhYRZZ39RkdbA1BIx7KNn1nFoqtuuX8pbZHEY9paFxaFwqY6VPHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712907236; c=relaxed/simple;
	bh=UjGGsBDeZa6tp7LMRqKVPl6TWPS7+hVNdoJB8ERR5Ks=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FbWTiXzFrmec2Qfjt3sSElIPQcZtLH+smqW7BZUAa2No5/rvy+xR9xy6s10D/VByLk9OxW7+69hhnfTvBGZdXUoe0nAKZjyMD7S8EVn7n9MWXFB+kld9hOYnxfgw5KqwCG45W76Ed0+i1qBfwYNjDfwCAC4Q3v2WKtvMKpWpDTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au; spf=pass smtp.mailfrom=gondor.apana.org.au; arc=none smtp.client-ip=144.6.53.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gondor.apana.org.au
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.94.2 #2 (Debian))
	id 1rvBPb-000ltu-Ja; Fri, 12 Apr 2024 15:33:28 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Fri, 12 Apr 2024 15:33:45 +0800
Date: Fri, 12 Apr 2024 15:33:45 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Lukas Wunner <lukas@wunner.de>
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
Subject: Re: [PATCH v4] X.509: Introduce scope-based x509_certificate
 allocation
Message-ID: <Zhjj2dhsFN808f/b@gondor.apana.org.au>
References: <ace28d74f7c143fa28919214858a9ca90b6cf970.1712511262.git.lukas@wunner.de>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ace28d74f7c143fa28919214858a9ca90b6cf970.1712511262.git.lukas@wunner.de>

On Sun, Apr 07, 2024 at 07:57:40PM +0200, Lukas Wunner wrote:
> Add a DEFINE_FREE() clause for x509_certificate structs and use it in
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
> Comparing the Assembler output before/after has shown they are identical,
> save for the fact that gcc-12 always generates two return paths when
> __cleanup() is used, one for the success case and one for the error case.
> 
> In x509_cert_parse(), add a hint for the compiler that kzalloc() never
> returns an ERR_PTR().  Otherwise the compiler adds a gratuitous IS_ERR()
> check on return.  Introduce an assume() macro for this which can be
> re-used elsewhere in the kernel to provide hints for the compiler.
> 
> Suggested-by: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
> Link: https://lore.kernel.org/all/20231003153937.000034ca@Huawei.com/
> Link: https://lwn.net/Articles/934679/
> Signed-off-by: Lukas Wunner <lukas@wunner.de>
> ---
> Changes v3 -> v4:
> Use passive mood in and drop the word "handy" from commit message (Jarkko).
> 
> Link to v3:
> https://lore.kernel.org/all/63cc7ab17a5064756e26e50bc605e3ff8914f05a.1708439875.git.lukas@wunner.de/
> 
>  crypto/asymmetric_keys/x509_cert_parser.c | 43 ++++++++++++-------------------
>  crypto/asymmetric_keys/x509_parser.h      |  3 +++
>  crypto/asymmetric_keys/x509_public_key.c  | 31 +++++++---------------
>  include/linux/compiler.h                  |  2 ++
>  4 files changed, 30 insertions(+), 49 deletions(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

