Return-Path: <keyrings+bounces-2546-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 36920A758FC
	for <lists+keyrings@lfdr.de>; Sun, 30 Mar 2025 10:45:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C82C81690D0
	for <lists+keyrings@lfdr.de>; Sun, 30 Mar 2025 08:45:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 677561581F0;
	Sun, 30 Mar 2025 08:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="M0UdzJmp";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="JsmG2djz"
X-Original-To: keyrings@vger.kernel.org
Received: from flow-b2-smtp.messagingengine.com (flow-b2-smtp.messagingengine.com [202.12.124.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5290C433A4;
	Sun, 30 Mar 2025 08:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743324347; cv=none; b=iH+tE4Yp8wJX2gQVP8OwxWvI3YcTVR+j2P5pW0YMp3vkGpoYjwoB65G6oO7VWOhVPzFw5lOl3CIzMgmWYDlOpKjQskpyaR2ZPnvQQgMcRsZnHTaWSRdlxODPgBkuTI8DbRJa0YyPJWdOJS0vRT4u+Wpl9lBQZd+zoATwCAcrHrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743324347; c=relaxed/simple;
	bh=H+Ux5Cj60Wwux5gpGqtyWyKc4Ac653kKfonZ49tQiz0=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=KFkCrwqHZyu637B+75ZD0AZD6yp0n8KZEX0JJM9Hjj2ANpZIt+aPrgyldTVBZJ/h+2OHGWNIYaDHLARi1Lmbsg7W1+RwoxKQuXxZvgTMMuJnDWTbTUdaYS1/NAB0g36ALfm4sJtXPDePxopYhlDcQHajLzEDy0uAseIAsyFeWM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=M0UdzJmp; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=JsmG2djz; arc=none smtp.client-ip=202.12.124.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-07.internal (phl-compute-07.phl.internal [10.202.2.47])
	by mailflow.stl.internal (Postfix) with ESMTP id 7FB6C1D417AF;
	Sun, 30 Mar 2025 04:45:42 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-07.internal (MEProxy); Sun, 30 Mar 2025 04:45:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1743324342;
	 x=1743331542; bh=jQjMu37O/l4HzRGTyx5F4BIFe78F9UaGqYjLoWsple4=; b=
	M0UdzJmpeLm3ADW5uZ4hZ6yrLV3yPx/q2x7O3H3vK+lJiiDRelNFWxVBBNrXZjuH
	rwVY8ASm2eCXlBjOgvxlxUlkQw1idKaEtgK5Vs6O9bMnp6QFeJG+P7uaITMXAS4k
	FlMnEcWGTKeAjoAo2JQcQXczK4KMTZkIvwCCVSmxSj/eAuiFjMI3f5qxMhV2ctC2
	ohZsFiOXa0WeNk5SvVfsTKevISygSDrexia5TTUIfuH59v4hMfUjLtoPyiZjC5Nr
	CKh/O9FuQAGoWk6K8uaudwEC3cSvC8YQGhsFTzkcGmRhpynYmccojjI1WiVqF74A
	80vIQ7fYxPNdVB/KIjOQGw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1743324342; x=
	1743331542; bh=jQjMu37O/l4HzRGTyx5F4BIFe78F9UaGqYjLoWsple4=; b=J
	smG2djz6vfVjZfm/9HsjDJNuy5fipjqS3xySNuwaYr8fq038FJD8/2xIwBsxEFlF
	G+wvm44m7HU2Lf1C5XXqRG8JL0Tf9ic5ljKKT6NUlk2miPYy/cyQO+kCHJVsYSuq
	LB0sLH17kC3hKJBk7hvZRRVBspYfF0NEdaTLC7/Mf1FZtzZNNls5aHspVuauWpYc
	L61gee4ENborxfMwwWG6U8BIIBESUAdyPmJ0HqNOUqMlcCeIvKdNOrWPWd1G2zTd
	I2SgmuOb/HoZ81vwwVRARvHFIK9pLZ2KhH+S2xrkeGGprWCG9QitIY/3+kOqlUzc
	1vwWCHZ3ec6Ij1JKx4FKw==
X-ME-Sender: <xms:tATpZ9BqDN5NsfXKy6h2aZ6DiIit7GOxNXtuogPGDBozDsavQNCP5w>
    <xme:tATpZ7h29tLbh-LAI5WRUBt1GlvpT8QWQvBStNdqc47j_9QLriv-ZgDa_kTbNZuVj
    0rPsmrqyOCFUDuLEpE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddujeeiiedtucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertder
    tddtnecuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnug
    gsrdguvgeqnecuggftrfgrthhtvghrnhephfdthfdvtdefhedukeetgefggffhjeeggeet
    fefggfevudegudevledvkefhvdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohep
    vddupdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegurghvvghmsegurghvvghmlh
    hofhhtrdhnvghtpdhrtghpthhtohepjhhfohhrsggvshesfhgvughorhgrphhrohhjvggt
    thdrohhrghdprhgtphhtthhopehrohhsvghnphesghhmrghilhdrtghomhdprhgtphhtth
    hopehhvghrsggvrhhtsehgohhnughorhdrrghprghnrgdrohhrghdrrghupdhrtghpthht
    ohepshgvrhhgvgeshhgrlhhlhihnrdgtohhmpdhrtghpthhtohepjhgrmhgvshdrsghoth
    htohhmlhgvhieshhgrnhhsvghnphgrrhhtnhgvrhhshhhiphdrtghomhdprhgtphhtthho
    pegrrhgusgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghrnhgusehkvghrnhgvlh
    drohhrghdprhgtphhtthhopegssghrvgiiihhllhhonheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:tATpZ4k0mjpEPjUlnNOhBptKalfvSqDuXfAnqzOosmRiDt_t4Ru4OQ>
    <xmx:tATpZ3zgCgCKTaYHV-z7WfzDdwBdQeBrBA_Ocxvx4npXAKa1HDAsfA>
    <xmx:tATpZyTB5IB2RPxn29aslFtX9EwVNtAupyDNT_Y7jmY3YC68FC9T0A>
    <xmx:tATpZ6YwAy2TtY_6JDC2pLq6IXuUd8-MYX0XlnrW5bfkNzC9QTWr3A>
    <xmx:tgTpZ8GcKMuPjU7jnxyZbPEl8DsK-URHm4QxIfpTBP4VF4F5xJ0s9x6x>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 0B7AF2220072; Sun, 30 Mar 2025 04:45:39 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: T2a88af23abfdad3d
Date: Sun, 30 Mar 2025 10:45:19 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Geert Uytterhoeven" <geert@linux-m68k.org>,
 "Arnd Bergmann" <arnd@kernel.org>
Cc: "'bbrezillon@kernel.org'" <bbrezillon@kernel.org>,
 "Arnaud Ebalard" <arno@natisbad.org>, "Srujana Challa" <schalla@marvell.com>,
 "Herbert Xu" <herbert@gondor.apana.org.au>,
 "David S . Miller" <davem@davemloft.net>,
 "David Howells" <dhowells@redhat.com>, "Jarkko Sakkinen" <jarkko@kernel.org>,
 "Paul Moore" <paul@paul-moore.com>, "James Morris" <jmorris@namei.org>,
 "Serge E. Hallyn" <serge@hallyn.com>,
 "Justin M. Forbes" <jforbes@fedoraproject.org>,
 "Jason A . Donenfeld" <Jason@zx2c4.com>, "Rosen Penev" <rosenp@gmail.com>,
 "Ard Biesheuvel" <ardb@kernel.org>,
 "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>,
 linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
 keyrings@vger.kernel.org, linux-security-module@vger.kernel.org
Message-Id: <4a1e3e4d-a568-4f5f-a6cc-502b9642d0eb@app.fastmail.com>
In-Reply-To: 
 <CAMuHMdViGZRQL7toi7Arvm5L=OTK1mGmODbckE+427bx4KyWdw@mail.gmail.com>
References: <20250314160543.605055-1-arnd@kernel.org>
 <CAMuHMdViGZRQL7toi7Arvm5L=OTK1mGmODbckE+427bx4KyWdw@mail.gmail.com>
Subject: Re: [PATCH] [v2] crypto: lib/Kconfig: hide library options
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sun, Mar 30, 2025, at 10:34, Geert Uytterhoeven wrote:
> On Fri, 14 Mar 2025 at 17:05, Arnd Bergmann <arnd@kernel.org> wrote:
>
>> --- a/security/keys/Kconfig
>> +++ b/security/keys/Kconfig
>> @@ -60,7 +60,7 @@ config BIG_KEYS
>>         bool "Large payload keys"
>>         depends on KEYS
>>         depends on TMPFS
>> -       depends on CRYPTO_LIB_CHACHA20POLY1305 = y
>> +       select CRYPTO_LIB_CHACHA20POLY1305
>>         help
>>           This option provides support for holding large keys within the kernel
>>           (for example Kerberos ticket caches).  The data may be stored out to
>
> Due to dropping the dependency, this appeared on my radar.
> Should this be selected by one or some of the Kerberos Kconfig symbols?
>

I don't see why: before commit 521fd61c84a1 ("security/keys: rewrite
big_key crypto to use library interface") it was user selectable
without the crypto dependency, and now it got back to that. I think
from the point of view of Kconfig that is how we want it.

     Arnd

