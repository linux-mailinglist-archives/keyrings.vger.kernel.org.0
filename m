Return-Path: <keyrings+bounces-2458-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA55AA6479E
	for <lists+keyrings@lfdr.de>; Mon, 17 Mar 2025 10:38:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C79F03A8C25
	for <lists+keyrings@lfdr.de>; Mon, 17 Mar 2025 09:37:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23B14221710;
	Mon, 17 Mar 2025 09:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=hmeau.com header.i=@hmeau.com header.b="CkZXhC4y"
X-Original-To: keyrings@vger.kernel.org
Received: from abb.hmeau.com (abb.hmeau.com [144.6.53.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10D50221540;
	Mon, 17 Mar 2025 09:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=144.6.53.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742204285; cv=none; b=GrTEgjP2r/JWpnYHvJBS8kmx7Kc2AYq+JlruDjdnLYzR0mpVLKCPLt2391Wj5kWJZ6aHvE3dr1tltfml7F+p4LMzXQwJ3m5jA5DYsQK2rri2sxfryYZvKCgPS3EX+ITYQWH1Csww+WAkO66rif71VG1i0MlmMNOjC08rA5nHYe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742204285; c=relaxed/simple;
	bh=n/2IBvy9e94DKUuABMxeQt20/6JGzm+SDMzWvg9FdCU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CX4ZGZEdMysxJTM1xxXDTv02CAK8Wte/D94RYmMFfNmkXZsKKtja6XRTn0lsDy4YCF+zJDSGcDFPBYbXw3aNJ65vQPRa/ZDfBMhJ4EGogCHqZqREuRpWAWtUC7NInW8ZBjLH6x8ifvYqILY8lp1IhnGbmeRvlnrY+2Er2/9F82s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au; spf=pass smtp.mailfrom=gondor.apana.org.au; dkim=pass (2048-bit key) header.d=hmeau.com header.i=@hmeau.com header.b=CkZXhC4y; arc=none smtp.client-ip=144.6.53.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gondor.apana.org.au
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=x8gu5xj0CJdNbPLEmbj4GHiIuAWTvAvev6JXkvq/r+c=; b=CkZXhC4yyiNddi3Kz3ob+HOURp
	5MchHR7mTTm68OEdwJDTcRra7uicjQkdQxQL3lEeK7o/FbWyhtPVdYvFOJGJtOr2kJU8X/ROAqDCp
	tFkv/fIUgWgU6jsks2kIMN+NNiTB/sHb0Id5OH4UaXQoIG0fCbtcjnPBKmew/FzsdPLlKof8vyMso
	8h47rSFwbDpAB/+/z2+qUZsOrmUrej6tQkFhGQCOC5IkacKMujPTReCuFPxYUEnx0y8L0RjL2hCDr
	YrTIkWGsZ2KPlwg3JwRjcziC+WWoJkCgxsOQughvR05RYG/1YoouAhR0ZZYjsPfOyA/7NVo9t8I3i
	fK7E9Ogw==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1tu6ul-007VSN-0o;
	Mon, 17 Mar 2025 17:37:44 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Mon, 17 Mar 2025 17:37:43 +0800
Date: Mon, 17 Mar 2025 17:37:43 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Lukas Wunner <lukas@wunner.de>
Cc: "David S. Miller" <davem@davemloft.net>,
	Stefan Berger <stefanb@linux.ibm.com>,
	Vitaly Chikunov <vt@altlinux.org>,
	David Howells <dhowells@redhat.com>,
	Ignat Korchagin <ignat@cloudflare.com>,
	linux-crypto@vger.kernel.org, keyrings@vger.kernel.org
Subject: Re: [PATCH v2 3/4] crypto: ecdsa - Fix enc/dec size reported by
 KEYCTL_PKEY_QUERY
Message-ID: <Z9ftZxb60ZmDnalx@gondor.apana.org.au>
References: <cover.1738521533.git.lukas@wunner.de>
 <3d74d6134f4f87a90ebe0a37cb06c6ec144ceef7.1738521533.git.lukas@wunner.de>
 <Z9WQtFEbSYuat42Y@wunner.de>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z9WQtFEbSYuat42Y@wunner.de>

On Sat, Mar 15, 2025 at 03:37:40PM +0100, Lukas Wunner wrote:
> Hi Herbert,
> 
> patches [3/4] and [4/4] of this series have not been applied and
> are marked "Changes Requested" in patchwork...
> 
> https://patchwork.kernel.org/project/linux-crypto/patch/3d74d6134f4f87a90ebe0a37cb06c6ec144ceef7.1738521533.git.lukas@wunner.de/
> 
> https://patchwork.kernel.org/project/linux-crypto/patch/c9d465b449b6ba2e4a59b3480119076ba1138ded.1738521533.git.lukas@wunner.de/
> 
> ...however it's unclear to me what needs to be changed in order to
> make them acceptable.  I think the objection was that asymmetric keys
> need to be maintained, but that's since been addressed.
> 
> Are there further objections?  Should I resend?

I'll try to resurrect them in patchworks.

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

