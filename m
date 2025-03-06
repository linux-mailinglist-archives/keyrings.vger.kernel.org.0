Return-Path: <keyrings+bounces-2447-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 27CFBA55902
	for <lists+keyrings@lfdr.de>; Thu,  6 Mar 2025 22:43:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4053A16AEA5
	for <lists+keyrings@lfdr.de>; Thu,  6 Mar 2025 21:43:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 735A3276D16;
	Thu,  6 Mar 2025 21:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NcU8by+U"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BBB9276046;
	Thu,  6 Mar 2025 21:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741297398; cv=none; b=VK3hAP+xEPjeJfYYDHVnAx0ofmZmNkchDF48vsgfeTdef9BpnyNcohbEuDQL9ExVD7xy/84LkIqLugdI/lCA9q9WQv10BprB0/yAUAUKwmD0++GYzH0u+gKwgMh0QBUfw8ZBbQHuCYnvDzGyLlpQdD1RMeqUPTjMQ6mAZiMnPcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741297398; c=relaxed/simple;
	bh=eYBwHZ5INlIMDOJPyHlAMImaRq/UZptFbqP68XED+FA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SclvqthvKZ83uQ6N6XPKRmmAZ8yMvNRw1eRL/vy2RTrh8VhLzHHCifV+S8mmI6OUAichzc8aUa+BTa6YO90xZY9hkoyezODrxGNRO9RXVOVBODUT9e6C84to9+mQLtv6W3d+T3cAMmVqpfWWg0jUdX0b3FsNnPnZb1eI1uj/lls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NcU8by+U; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44AE2C4CEE0;
	Thu,  6 Mar 2025 21:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741297397;
	bh=eYBwHZ5INlIMDOJPyHlAMImaRq/UZptFbqP68XED+FA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NcU8by+UCIeObt4+rW1H9FFDzWYW69RzGqpk3L+YfyfwxRZeLbzDrDTz6bUdMr688
	 74IsLK4dSfn0BUMwnAI6KZzCUxtbez1/J/Tx4lHkStWeiGTe5YgEylSLVk+dPyM50A
	 cXgSjiXH5WBgxa+38EQ4a9eth6Dv37vkdCczgpGgcJ/f28WNmtiJ9FHQQ+xVb1lH4g
	 Nm20HwAHeFlUSf+D5LDRF16lgNt/Pfo/9FXn/B1Nge73Xqn08MHDxeQPkTnLD5+vD3
	 UioHoNMtiXdTuZcwpQ/QrpYIAXC4FCYVNE89YkPpLlnUp7kTdDh4iawpCbbgNb1gDy
	 hh8KQhmbzM7rQ==
Date: Thu, 6 Mar 2025 23:43:13 +0200
From: Jarkko Sakkinen <jarkko@kernel.org>
To: Lukas Wunner <lukas@wunner.de>
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	David Howells <dhowells@redhat.com>,
	Ignat Korchagin <ignat@cloudflare.com>,
	Stefan Berger <stefanb@linux.ibm.com>,
	Tadeusz Struk <tstruk@gmail.com>, Tadeusz Struk <tstruk@gigaio.com>,
	Vitaly Chikunov <vt@altlinux.org>, linux-crypto@vger.kernel.org,
	keyrings@vger.kernel.org, Eric Biggers <ebiggers@google.com>
Subject: Re: [PATCH] MAINTAINERS: Add Lukas & Ignat & Stefan for asymmetric
 keys
Message-ID: <Z8oW8bS9og9RDqsg@kernel.org>
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
> 
> 

Acked-by: Jarkko Sakkinen <jarkko@kernel.org>

BR, Jarkko

