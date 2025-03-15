Return-Path: <keyrings+bounces-2453-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DA48A629B3
	for <lists+keyrings@lfdr.de>; Sat, 15 Mar 2025 10:14:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 40C423B0360
	for <lists+keyrings@lfdr.de>; Sat, 15 Mar 2025 09:14:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97F021F4621;
	Sat, 15 Mar 2025 09:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=hmeau.com header.i=@hmeau.com header.b="ePqxmoqY"
X-Original-To: keyrings@vger.kernel.org
Received: from abb.hmeau.com (abb.hmeau.com [144.6.53.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84AFD1F427D;
	Sat, 15 Mar 2025 09:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=144.6.53.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742030010; cv=none; b=JpUdfxCiHkMtkqj5siDtiy9kQKDN9bY9sKtAySvUSPjGnqCT810PyRAc9LzGsPUFcXBCTF2Py7Xl932xJWeJPp7J2q8wWjjgXmx32H7vIvPWs3LlmxxCNddFR3c2FOFjwLN6ERICp9LNN2wPVj8s6d6lmNgn9fvf+NU/kGjBMas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742030010; c=relaxed/simple;
	bh=5bDJmD++AwF6BkhqykUp+qNmWwScODpEAqmisAHVoD8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uvDrs+g4XAaaje5Uvn+uh29WKyT9GfqYJvxhmERN9fEB9nvA5i9Ns7Qr956ORoCAGG78T6HHRWlV/RrZehsLwu8JJtZfjlsrw1ydiRst7Gi9NHL8yxp2aZ/j7fZeyw2hIlmfeVqC43WC14UYXe74IbPgI1Qd/BPv8uI6IawT32o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au; spf=pass smtp.mailfrom=gondor.apana.org.au; dkim=pass (2048-bit key) header.d=hmeau.com header.i=@hmeau.com header.b=ePqxmoqY; arc=none smtp.client-ip=144.6.53.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gondor.apana.org.au
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=sq0cBRpOdcRt1xNs7/tAMMvUtt+0MqLbuh8BF4SxG50=; b=ePqxmoqYByfwRnMjmBHuPIETmp
	lYmFeL09gq3+HbkxZuwWbZO8AKjMFShOEyH6eRP7m2gwhbxAaDhICMnOK3kw6bFruNiGApsWsAh6Z
	44sQjni/OcdxoPOVkpnmk13ZGLOjs2V7QrSahygWsNozfLhQsmLo2oJ13bTVhHJQqF7Q/vUvroX9+
	woAaK/VqgpP3AudxTjSZ4oWK5mZ6nOI55yiApLQb950aLWp4/nxNt99UG8aYhJJ1BWGnToBBgg/Pd
	BYPPQ/ApBnqOTak9bGhYIJAC0N08Ko/hNU2BvGCz/VzEIU7i92YxAYi3Wlg/AqH2BHIT/fAUGzkNP
	A4ThhQSw==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1ttNZv-006o2v-30;
	Sat, 15 Mar 2025 17:13:13 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Sat, 15 Mar 2025 17:13:11 +0800
Date: Sat, 15 Mar 2025 17:13:11 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Lukas Wunner <lukas@wunner.de>
Cc: "David S. Miller" <davem@davemloft.net>,
	David Howells <dhowells@redhat.com>,
	Ignat Korchagin <ignat@cloudflare.com>,
	Stefan Berger <stefanb@linux.ibm.com>,
	Tadeusz Struk <tstruk@gmail.com>, Tadeusz Struk <tstruk@gigaio.com>,
	Vitaly Chikunov <vt@altlinux.org>, linux-crypto@vger.kernel.org,
	keyrings@vger.kernel.org, Eric Biggers <ebiggers@google.com>
Subject: Re: [PATCH] MAINTAINERS: Add Lukas & Ignat & Stefan for asymmetric
 keys
Message-ID: <Z9VEp7rl7JbNgY5w@gondor.apana.org.au>
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

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

