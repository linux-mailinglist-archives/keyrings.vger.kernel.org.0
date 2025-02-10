Return-Path: <keyrings+bounces-2392-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AEC74A2E5D6
	for <lists+keyrings@lfdr.de>; Mon, 10 Feb 2025 08:55:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5C7E61628A3
	for <lists+keyrings@lfdr.de>; Mon, 10 Feb 2025 07:55:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDA772F2A;
	Mon, 10 Feb 2025 07:55:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=hmeau.com header.i=@hmeau.com header.b="axz2LlYX"
X-Original-To: keyrings@vger.kernel.org
Received: from abb.hmeau.com (abb.hmeau.com [144.6.53.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 238D81BBBE5;
	Mon, 10 Feb 2025 07:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=144.6.53.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739174112; cv=none; b=pD8Jz99ZceZwgE7knr5eIVjnsBuKvD4zqcIIBieyaA1WEo4OnaBTOzylDNr0n90USbFl1U5mcjKAsfGwSTf6oiASn8p2AI38witlbsoBO/BzW/sV7F5z8uJpGQai3lk9JuW17iZ+TRLqtoe9s7nU8ce2deosFib0tIdL0HfHT8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739174112; c=relaxed/simple;
	bh=+yH1+/vfua0kb36HoGky/YL7GDTdPlx9P92pxcH8WZM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cMc94t7+QOTUBMfa1Uh+hdAH/R+oacEvmygty+K66MWelGBssdGfYm+fNUWUMr55rFVQUrlXuGL3TK9uyn8V/Gcy+rXCGc8iqmlVhSs7xxCd4kHcgtNYYLnBnRpRWD/UNG+CO6EmUWBTa/pHMbTe47Rr/Yh2SQwhk0aK6G/ud2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au; spf=pass smtp.mailfrom=gondor.apana.org.au; dkim=pass (2048-bit key) header.d=hmeau.com header.i=@hmeau.com header.b=axz2LlYX; arc=none smtp.client-ip=144.6.53.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gondor.apana.org.au
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=Exdjmonj6GK2zeEbY00Q7n//w+UT1eEbVIkBvF29tHM=; b=axz2LlYXnNo/cSiE+jX4BNynyG
	aAsl+QFMe/xPo5snnamjApb8+d14yXzABQ2XJubygwD8QTwWmm/A6Vg4dl2bq0sk3TyiidNT1az/K
	4AZKYcU24xlJUdpBe9fLrsf1LlSoadiZ5s7VH1ULrFebtJ9GVoCXvCnK52zNvZWcnr8hjjvEh/omZ
	t4IHiT51SsAvzcezLIDUsIFW/muZbbeWdCHUypiTNpUCp3R/w4qWJAWUQCqWw5Bp9IKHOnkBmknh7
	x6WVZChtwyRzMDtPVtHZZiZPSF1nYooOf73B+lNZEW03Zqv/U4B/kVTlimISWGgMShQBa4XLhvc9u
	frxKvZgg==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1thOQ1-00Gcm7-0a;
	Mon, 10 Feb 2025 15:54:47 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Mon, 10 Feb 2025 15:54:45 +0800
Date: Mon, 10 Feb 2025 15:54:45 +0800
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
Message-ID: <Z6mwxUaS33EastB3@gondor.apana.org.au>
References: <cover.1738521533.git.lukas@wunner.de>
 <3d74d6134f4f87a90ebe0a37cb06c6ec144ceef7.1738521533.git.lukas@wunner.de>
 <Z6h8L0D-CBhZUiVR@gondor.apana.org.au>
 <Z6iRssS26IOjWbfx@wunner.de>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z6iRssS26IOjWbfx@wunner.de>

On Sun, Feb 09, 2025 at 12:29:54PM +0100, Lukas Wunner wrote:
>
> One user of this API is the Embedded Linux Library, which in turn
> is used by Intel Wireless Daemon:
> 
> https://git.kernel.org/pub/scm/libs/ell/ell.git/tree/ell/key.c
> https://git.kernel.org/pub/scm/network/wireless/iwd.git/tree/src/eap-tls.c

Surely this doesn't use the private key part of the API, does it?

While I intensely dislike the entire API being there, it's only the
private key part that I really want to remove.

Thanks,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

