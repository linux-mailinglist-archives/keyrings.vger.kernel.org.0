Return-Path: <keyrings+bounces-3002-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 17B58B58CAA
	for <lists+keyrings@lfdr.de>; Tue, 16 Sep 2025 06:10:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BDEB73B5752
	for <lists+keyrings@lfdr.de>; Tue, 16 Sep 2025 04:10:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22FE729D281;
	Tue, 16 Sep 2025 04:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=hmeau.com header.i=@hmeau.com header.b="nMsJHq0/"
X-Original-To: keyrings@vger.kernel.org
Received: from abb.hmeau.com (abb.hmeau.com [180.181.231.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39F89E573;
	Tue, 16 Sep 2025 04:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=180.181.231.80
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757995854; cv=none; b=OYQHfI/H5srmEi1WF+4BcaFoByHTMAvdAfVaKSM5WaY2ejuyLbrohzOZ8mm0yIk6XtdbYnKiPrRYJW/4bF/doqO28BeE4zgzI+iNpEb6qe5WB7HKnHclj94zP2Wwc23k1XbVJ/foKCCsiHejc8MWaPj3QE4zQRgZzOHkzWlQARo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757995854; c=relaxed/simple;
	bh=PtH1iRHW6h0DURdju9NcKVU4b1uEkhjS1o24zyiW5Lc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Shlvppx52HRAUV4iS08YFt5nXsnCyTFkwQmjssAzfjmWz8uY40CApOLPvWhG3FEFbMG71s6PzQdxUlJCfuiKPn387eo8L/PKRizbcdheYcJbk83XxYrrQpUyp1XfBzevQPAmbp3hXaj6FnFabC7FLZLmMwlck8ljNyg38wuaeb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au; spf=pass smtp.mailfrom=gondor.apana.org.au; dkim=pass (2048-bit key) header.d=hmeau.com header.i=@hmeau.com header.b=nMsJHq0/; arc=none smtp.client-ip=180.181.231.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gondor.apana.org.au
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=o1tk/0vnXSF3vDo4ceMyopNhrSusaxh4z04Ox78NhXY=; b=nMsJHq0/a/tzP26JkwfkguKIAd
	Ay3COqBPQ2L0PIsMOqGc23mWvBbLQchTDW9vy6H9qKO4ACLSvv7ZSYGq4FMJ480ikwBG0OvOzNU+q
	5Jc1BHuoyDBQpJxB4xUqYCNoGT31q+YQZRmCJZwjX2rlPlzxw6ceHFhvC/bz7N405vHIThEUo79IC
	1HeDwzO7K+ewkKN5OM7MwwZUoq6F7VtuVHVwnNfZJF6hKtgIxYTDYYVY1xlFe3n0fbPsz1eI5txyC
	Wymvn7mfWjZEFxWoV3A4BLdpqZON+CemU5UTj54UAhPf/l3UhG8n9kbCwZJ61pGMqgBwCA377am0I
	IaHC/VaQ==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1uyMm9-005lMQ-0w;
	Tue, 16 Sep 2025 12:10:38 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Tue, 16 Sep 2025 12:10:37 +0800
Date: Tue, 16 Sep 2025 12:10:37 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Rodolfo Giometti <giometti@enneenne.com>
Cc: Eric Biggers <ebiggers@kernel.org>, linux-crypto@vger.kernel.org,
	"David S . Miller" <davem@davemloft.net>, keyrings@vger.kernel.org,
	David Howells <dhowells@redhat.com>, Lukas Wunner <lukas@wunner.de>,
	Ignat Korchagin <ignat@cloudflare.com>
Subject: Re: [V1 0/4] User API for KPP
Message-ID: <aMjjPV21x2M_Joi1@gondor.apana.org.au>
References: <20250915084039.2848952-1-giometti@enneenne.com>
 <20250915145059.GC1993@quark>
 <87f17424-b50e-45a0-aefa-b1c7a996c36c@enneenne.com>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87f17424-b50e-45a0-aefa-b1c7a996c36c@enneenne.com>

On Mon, Sep 15, 2025 at 05:47:56PM +0200, Rodolfo Giometti wrote:
>
> The main purpose of using this implementation is to be able to use the
> kernel's trusted keys as private keys. Trusted keys are protected by a TPM
> or other hardware device, and being able to generate private keys that can
> only be (de)encapsulated within them is (IMHO) a very useful and secure
> mechanism for storing a private key.

If the issue is key management then you should be working with
David Howell on creating an interface that sits on top of the
keyring subsystem.

The Crypto API doesn't care about keys.

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

