Return-Path: <keyrings+bounces-2898-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BC8CAF6EA0
	for <lists+keyrings@lfdr.de>; Thu,  3 Jul 2025 11:28:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 92797484C44
	for <lists+keyrings@lfdr.de>; Thu,  3 Jul 2025 09:28:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FC972D780A;
	Thu,  3 Jul 2025 09:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xry111.site header.i=@xry111.site header.b="M1lb0ty/"
X-Original-To: keyrings@vger.kernel.org
Received: from xry111.site (xry111.site [89.208.246.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEF252D77F0;
	Thu,  3 Jul 2025 09:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.208.246.23
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751534882; cv=none; b=VCSpS+iv2uYieW4dVicWQ7NGrkWsHjuoGA2z70u/HZoeaLQ+sVvucabIynLLMdNXx9qolvge3l69t36abr2IE4+51UmX+VbSj47J27tFzpk16hbBWNQzK2+PL78dxQeCZqsUo3VpX09/G+O8Q36f/nYK4wVEWWy+JB+fujYzBCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751534882; c=relaxed/simple;
	bh=i74P6ykJLEnyrC03GPEsGhBSSNdT0vtNxbdEH9wyPsQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=GIlVNGNr+RgZLHKLkf0ioFYarcNfOWkLqRTVEMZ5GSP17+fhMWgCksfk4PoaUKnVORSAMDBomwxo75vEPIIiFvizkAfXOx2mHAA09WKHauXGzu22WsavRW7UJtDpypQBcf5sEldgUIruNCrqbD+3sfnMGjpAOejQwBhtrVH9Vtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xry111.site; spf=pass smtp.mailfrom=xry111.site; dkim=pass (1024-bit key) header.d=xry111.site header.i=@xry111.site header.b=M1lb0ty/; arc=none smtp.client-ip=89.208.246.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xry111.site
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xry111.site
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xry111.site;
	s=default; t=1751534345;
	bh=i74P6ykJLEnyrC03GPEsGhBSSNdT0vtNxbdEH9wyPsQ=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=M1lb0ty/nrTkoFvVTLVpN9Z1zmKJhYqjAhIXe2H7hR+YWLKab2f59h5IsYIRJpQdE
	 ermBlNyrdt65pKqiFV3MiEfD1a/UdC7A/xf//0A+5QPMnhE7O/F7OirkLCMZ8TKoYb
	 ugJVt4EpJBBciYzjB8bmUA1D/WXUJPsbQSWt1pA0=
Received: from [IPv6:110::25] (unknown [IPv6:2409:874d:200:3037::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (secp384r1))
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id ED6D265FF1;
	Thu,  3 Jul 2025 05:18:54 -0400 (EDT)
Message-ID: <a48666fb2254521197a7f13948feefd38947e944.camel@xry111.site>
Subject: Re: [PATCH RFC 1/4] Revert "Revert "lib/mpi: Extend the MPI
 library""
From: Xi Ruoyao <xry111@xry111.site>
To: Gu Bowen <gubowen5@huawei.com>, Herbert Xu
 <herbert@gondor.apana.org.au>,  David Howells <dhowells@redhat.com>, David
 Woodhouse <dwmw2@infradead.org>, Lukas Wunner <lukas@wunner.de>,  Ignat
 Korchagin <ignat@cloudflare.com>, "David S . Miller" <davem@davemloft.net>,
 Jarkko Sakkinen	 <jarkko@kernel.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Eric Biggers <ebiggers@kernel.org>, "Jason
 A . Donenfeld" <Jason@zx2c4.com>, Ard Biesheuvel <ardb@kernel.org>, Tianjia
 Zhang	 <tianjia.zhang@linux.alibaba.com>, Dan Carpenter
 <dan.carpenter@linaro.org>
Cc: keyrings@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-crypto@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, Lu Jialin <lujialin4@huawei.com>,
 GONG Ruiqi <gongruiqi1@huawei.com>
Date: Thu, 03 Jul 2025 17:18:49 +0800
In-Reply-To: <20250630133934.766646-2-gubowen5@huawei.com>
References: <20250630133934.766646-1-gubowen5@huawei.com>
	 <20250630133934.766646-2-gubowen5@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mon, 2025-06-30 at 21:39 +0800, Gu Bowen wrote:
> This reverts commit fca5cb4dd2b4a9423cb6d112cc71c33899955a1f.
>=20
> Reintroduce the mpi library based on libgcrypt to support sm2.

If you use a newer version of Git, the subject would be 'Reapply
"lib/mpi: Extend the MPI library"' and IMO it would be better.

--=20
Xi Ruoyao <xry111@xry111.site>

