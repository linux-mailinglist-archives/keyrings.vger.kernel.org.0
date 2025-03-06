Return-Path: <keyrings+bounces-2444-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B2337A53F51
	for <lists+keyrings@lfdr.de>; Thu,  6 Mar 2025 01:46:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EACE9173B5F
	for <lists+keyrings@lfdr.de>; Thu,  6 Mar 2025 00:46:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6931E171CD;
	Thu,  6 Mar 2025 00:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=hmeau.com header.i=@hmeau.com header.b="HZmO2wUE"
X-Original-To: keyrings@vger.kernel.org
Received: from abb.hmeau.com (abb.hmeau.com [144.6.53.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98260376;
	Thu,  6 Mar 2025 00:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=144.6.53.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741221985; cv=none; b=cBZ8wQnPjM0EHKd7ibA1IXDhiEVzKGN6+tyBdpvbjbEeyGnKFX+UwKGLL29ngarPAO9yWSty1cA2FLEa4ESfmpHf4y5U1xdFEu4YLAGQkAWMb+cxlBhcOEkvUbVvojVFmVYWj6PGy8FHa/93eEXAHPfDg1t1c5bLDli2TfvoLDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741221985; c=relaxed/simple;
	bh=bdHiGmQCW+jIfwEFWXAePVnE6Zh5EwQEOmLh1i+TniU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jNUJGbowPI9yAmHNlDtlDolEBKzYZq1sfuiuhETY/NXgNY7bivQblBb9LYzETM2E6cZuzr6YOdbLIrRlUoXrrogi3U0sdILiExaW8JarnkawLcDpPgBk5BPQjDr+KVzZs7VDiryoIUs00HbZZGYhg2TMRRAyZBAnlfLdumN4wIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au; spf=pass smtp.mailfrom=gondor.apana.org.au; dkim=pass (2048-bit key) header.d=hmeau.com header.i=@hmeau.com header.b=HZmO2wUE; arc=none smtp.client-ip=144.6.53.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gondor.apana.org.au
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=6yqrLKAlALHmSW2F1YLkpltivONOHD+rr+GiBiB4O/4=; b=HZmO2wUEsPHehGXtyKG2XKbyVx
	7FFv/baK50YvkjaDfunG677O3VDdq3YUjwajZUt3un9vXdmvDkKnNTXd+QvoaVqtH3Ee5P+Y5wFxw
	LkVz71wddgy+t/24VLQUpcIV67D2cNsbguccMf0t0KrG5IxeEAtvIu/yu3ZtKkVle8N99IOQpR4Xt
	6l9FiJvTF6RnC+A2D5oNwENoVWdgQYZ44lrDZGkAWtYyyKN0UYU4HbNhrbYe7DpMZ960YwTzGveDO
	Ej1fTHgISfixmDUBvLmDrayVIiBO4Hqqr1AuMgUg5w6NTonD4G5xm+cEXyQcLc8eaY7C1YmmrZwG0
	4byQow/Q==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1tpzNC-0048x1-0a;
	Thu, 06 Mar 2025 08:46:03 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Thu, 06 Mar 2025 08:46:02 +0800
Date: Thu, 6 Mar 2025 08:46:02 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Lukas Wunner <lukas@wunner.de>
Cc: "David S. Miller" <davem@davemloft.net>,
	David Howells <dhowells@redhat.com>,
	Ignat Korchagin <ignat@cloudflare.com>,
	Stefan Berger <stefanb@linux.ibm.com>,
	Tadeusz Struk <tstruk@gmail.com>, Tadeusz Struk <tstruk@gigaio.com>,
	Vitaly Chikunov <vt@altlinux.org>, linux-crypto@vger.kernel.org,
	keyrings@vger.kernel.org, Eric Biggers <ebiggers@google.com>,
	Jarkko Sakkinen <jarkko@kernel.org>
Subject: Re: [PATCH] MAINTAINERS: Add Lukas & Ignat & Stefan for asymmetric
 keys
Message-ID: <Z8jwSmRA45tMlUKI@gondor.apana.org.au>
References: <90c171d5beed08bcf65ec2df6357a7ac97520b91.1741194399.git.lukas@wunner.de>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <90c171d5beed08bcf65ec2df6357a7ac97520b91.1741194399.git.lukas@wunner.de>

On Wed, Mar 05, 2025 at 06:14:32PM +0100, Lukas Wunner wrote:
> Herbert asks for long-term maintenance of everything under
> crypto/asymmetric_keys/ and associated algorithms (ECDSA, GOST, RSA) [1].
> 
> Ignat has kindly agreed to co-maintain this with me going forward.
> 
> Stefan has agreed to be added as reviewer for ECDSA.  He introduced it
> in 2021 and has been meticulously providing reviews for 3rd party
> patches anyway.
> 
> Retain David Howells' maintainer entry until he explicitly requests to
> be removed.  He originally introduced asymmetric keys in 2012.
> 
> RSA was introduced by Tadeusz Struk as an employee of Intel in 2015,
> but he's changed jobs and last contributed to the implementation in 2016.
> 
> GOST was introduced by Vitaly Chikunov as an employee of Basealt LLC [2]
> (Базальт СПО [3]) in 2019.  This company is an OFAC sanctioned entity
> [4][5], which makes employees ineligible as maintainer [6].  It's not
> clear if Vitaly is still working for Basealt, he did not immediately
> respond to my e-mail.  Since knowledge and use of GOST algorithms is
> relatively limited outside the Russian Federation, assign "Odd fixes"
> status for now.
> 
> [1] https://lore.kernel.org/r/Z8QNJqQKhyyft_gz@gondor.apana.org.au/
> [2] https://prohoster.info/ru/blog/novosti-interneta/reliz-yadra-linux-5-2
> [3] https://www.basealt.ru/
> [4] https://ofac.treasury.gov/recent-actions/20240823
> [5] https://sanctionssearch.ofac.treas.gov/Details.aspx?id=50178
> [6] https://lore.kernel.org/r/7ee74c1b5b589619a13c6318c9fbd0d6ac7c334a.camel@HansenPartnership.com/
> 
> Signed-off-by: Lukas Wunner <lukas@wunner.de>
> ---
>  MAINTAINERS | 28 ++++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 8e0736d..b16a1cc 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -3595,14 +3595,42 @@ F:	drivers/hwmon/asus_wmi_sensors.c
>  
>  ASYMMETRIC KEYS
>  M:	David Howells <dhowells@redhat.com>
> +M:	Lukas Wunner <lukas@wunner.de>
> +M:	Ignat Korchagin <ignat@cloudflare.com>
>  L:	keyrings@vger.kernel.org
> +L:	linux-crypto@vger.kernel.org
>  S:	Maintained
>  F:	Documentation/crypto/asymmetric-keys.rst
>  F:	crypto/asymmetric_keys/
>  F:	include/crypto/pkcs7.h
>  F:	include/crypto/public_key.h
> +F:	include/keys/asymmetric-*.h
>  F:	include/linux/verification.h
>  
> +ASYMMETRIC KEYS - ECDSA
> +M:	Lukas Wunner <lukas@wunner.de>
> +M:	Ignat Korchagin <ignat@cloudflare.com>
> +R:	Stefan Berger <stefanb@linux.ibm.com>
> +L:	linux-crypto@vger.kernel.org
> +S:	Maintained
> +F:	crypto/ecc*
> +F:	crypto/ecdsa*
> +F:	include/crypto/ecc*
> +
> +ASYMMETRIC KEYS - GOST
> +M:	Lukas Wunner <lukas@wunner.de>
> +M:	Ignat Korchagin <ignat@cloudflare.com>
> +L:	linux-crypto@vger.kernel.org
> +S:	Odd fixes
> +F:	crypto/ecrdsa*
> +
> +ASYMMETRIC KEYS - RSA
> +M:	Lukas Wunner <lukas@wunner.de>
> +M:	Ignat Korchagin <ignat@cloudflare.com>
> +L:	linux-crypto@vger.kernel.org
> +S:	Maintained
> +F:	crypto/rsa*
> +
>  ASYNCHRONOUS TRANSFERS/TRANSFORMS (IOAT) API
>  R:	Dan Williams <dan.j.williams@intel.com>
>  S:	Odd fixes
> -- 
> 2.43.0

Thank you for stepping up to do this! I'll just add Jarkko to
the cc list so that he is aware of this.

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

