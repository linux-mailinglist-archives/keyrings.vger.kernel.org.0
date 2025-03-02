Return-Path: <keyrings+bounces-2427-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D126A4B0E3
	for <lists+keyrings@lfdr.de>; Sun,  2 Mar 2025 11:11:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D466F16AD7D
	for <lists+keyrings@lfdr.de>; Sun,  2 Mar 2025 10:11:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 524211C695;
	Sun,  2 Mar 2025 10:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=hmeau.com header.i=@hmeau.com header.b="TW8KGRpB"
X-Original-To: keyrings@vger.kernel.org
Received: from abb.hmeau.com (abb.hmeau.com [144.6.53.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18A5717991;
	Sun,  2 Mar 2025 10:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=144.6.53.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740910285; cv=none; b=KgZB/W8UddLUHVAic4eGsaNMn+BL2t7HuTcjIetJwZRrLmCuCrM6zyJm6rRoM3cYhRR+QiJoeiJVFl436T84XZVJjBSUWa+THc6RRXPq+yQEAijgBWwJvLGXD5M5XUfXceeLIfGqZ1m3Yt1We6pXw2ncHUglRNp/lGeh8bRrctc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740910285; c=relaxed/simple;
	bh=X+dG4A9QnQTFqJvV+suXtjWyt578KH9A4EQ7Tz+tNsc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L840ITJLwdfxqbyOnJKmSv9EPEKgRkOkveiYjlc1DrvXe3wp1YsFm+2DQjLWbGv8fPpzUS6/4JwjEobca2BJbTG9TpX6TVGxxwmEp/iaUUjk5pLC3xmrpGlVe1LVNxoEImWbaulYpHl5pMK70dsQgyNzfuMFOv/e/1H2wcvfEZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au; spf=pass smtp.mailfrom=gondor.apana.org.au; dkim=pass (2048-bit key) header.d=hmeau.com header.i=@hmeau.com header.b=TW8KGRpB; arc=none smtp.client-ip=144.6.53.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gondor.apana.org.au
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=LZ1kzoItTIfgSfeyOMWuRUU3nz3iZo3LIJaz2feGi6E=; b=TW8KGRpBY4YITNZ0ZpfDPpj1Z2
	60Qm2B0Vt8eQVi+mnuVXeEv+oNJVjpOU25y/OEFTzcPe1gVbf9MNymDVV7TBPzMoZrB2e2We8Ko3v
	PUXJ1mxNH6PF8MtRItdj5e0zhh7jwbwY8d+n3RSkLEDKCRur3IOIsSG1cmWrhZBY2ujMttnxifb4+
	Pu1qKmvIVNfEDCE4rU+WtGEWReii8PI/9PQphSMPtER0u5vqcPn0sl+elavGFRjoSQA9PXfn346p+
	NhvSiFqye3sIemUQ8cRGXcs+ilk8X11qoRgESJw31fSJUS34mk/JMvM6UI+IFcXHMah/U4wJt7R7l
	GUP6X+Og==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1togHm-0031hy-2d;
	Sun, 02 Mar 2025 18:11:03 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Sun, 02 Mar 2025 18:11:02 +0800
Date: Sun, 2 Mar 2025 18:11:02 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Lukas Wunner <lukas@wunner.de>
Cc: "David S. Miller" <davem@davemloft.net>,
	Stefan Berger <stefanb@linux.ibm.com>,
	Vitaly Chikunov <vt@altlinux.org>,
	David Howells <dhowells@redhat.com>,
	Ignat Korchagin <ignat@cloudflare.com>,
	linux-crypto@vger.kernel.org, keyrings@vger.kernel.org,
	Eric Biggers <ebiggers@google.com>
Subject: Re: [PATCH v2 3/4] crypto: ecdsa - Fix enc/dec size reported by
 KEYCTL_PKEY_QUERY
Message-ID: <Z8Qutq61oFm9FFpY@gondor.apana.org.au>
References: <cover.1738521533.git.lukas@wunner.de>
 <3d74d6134f4f87a90ebe0a37cb06c6ec144ceef7.1738521533.git.lukas@wunner.de>
 <Z6h8L0D-CBhZUiVR@gondor.apana.org.au>
 <Z6iRssS26IOjWbfx@wunner.de>
 <Z6mwxUaS33EastB3@gondor.apana.org.au>
 <Z6pLRRJFOml8w61S@wunner.de>
 <Z7FnYEN-OnR_-7sP@gondor.apana.org.au>
 <Z7HBsONxj_q0BkJU@wunner.de>
 <Z8QNJqQKhyyft_gz@gondor.apana.org.au>
 <Z8QkDi79zO-PIaVV@wunner.de>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z8QkDi79zO-PIaVV@wunner.de>

On Sun, Mar 02, 2025 at 10:25:34AM +0100, Lukas Wunner wrote:
>
> In principle, yes.

Great!

> Which files are we talking about exactly?

So it's basically everything under crypto/asymmetric_keys + the
algorithms that they use.

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

