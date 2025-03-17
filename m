Return-Path: <keyrings+bounces-2457-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E42FA6468A
	for <lists+keyrings@lfdr.de>; Mon, 17 Mar 2025 10:05:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5EAAB3A97EA
	for <lists+keyrings@lfdr.de>; Mon, 17 Mar 2025 09:05:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB62821D5A7;
	Mon, 17 Mar 2025 09:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="B+dVnSYS";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="mNHS9VnD"
X-Original-To: keyrings@vger.kernel.org
Received: from fhigh-a2-smtp.messagingengine.com (fhigh-a2-smtp.messagingengine.com [103.168.172.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F3931459F7;
	Mon, 17 Mar 2025 09:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742202314; cv=none; b=SMmyx8F/kqyI3iyaglDBHHyb803zhskZQ+ccjJeVsWUQkakG+vErXdrkjGW1IqUArhuPZFmg4XBzdnZmPxqO6FZVwnbaYCqSSXrDtD/cVgwOmc26bluAjiRFKqSmIHARSINxtRNUWe62YH6WOB2Vrs5fghaRr0uudL/OHguxktc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742202314; c=relaxed/simple;
	bh=ZEfliQgNQrLF7tY2vcgoRTEhUSXIQ1hj1kWo0r1NaX0=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=ka60I/yLnB47P0f94XS4ko+r3CScydyXFzeEPQ27X6xVipolXg/4kuniLP9KbcLXwuSrZ+ebcJ3ywtGogPHAGBb0RmIhJRpU7ub+3h5lMnIIZYQNk8147Cpn3/fmVhIfCC78TUSB82pJqnKBDy+EgASXz8g7KZ5lQsW4XF1EPQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=B+dVnSYS; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=mNHS9VnD; arc=none smtp.client-ip=103.168.172.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-07.internal (phl-compute-07.phl.internal [10.202.2.47])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 01A3C11401CB;
	Mon, 17 Mar 2025 05:05:11 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-07.internal (MEProxy); Mon, 17 Mar 2025 05:05:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1742202310;
	 x=1742288710; bh=q8c2oruT3loXTDs3xgE5+1RGIsl+fzW/HgjFl2dlsyw=; b=
	B+dVnSYS6oyZiYouTxS49g/zc13WQdELKK0Sm7nFv4M17gx2S4OfgrIS9VfnyTAd
	bmdo30q7D4lxU1ZMEnHwuYp5TsZufcHw/FQU82UlSt+PbuIPfYVd1PJg0Brd8qfT
	R7w9eOsH2s+r/7gIFeXl99A5RIrAzkZe7hoeBrMBCS/Rrn9D5EUlgYTLePENrpLy
	twTBJdMyJN/JnGbEMQFGhXzoEhZm9vbf6QVaqITUCtUo5Eqv++3vQ3xT1e/K8jd7
	0/NclXbXW9S/4ffBEPd9feWSAJZ4t/jceSIIquqSF0rfq1RKrd/g36AqmPRqTmkT
	WgQEszCe+dLub17WYf5sCA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1742202310; x=
	1742288710; bh=q8c2oruT3loXTDs3xgE5+1RGIsl+fzW/HgjFl2dlsyw=; b=m
	NHS9VnD6SB1gbsu8ldfa8g9LeZUW+C0f4g/sH5ne39TS87KyPjH1R3CHIA8lfMqz
	/qXTPHjnybjxReAgDD6JZw6uhTibb5y9XzBEMlnqMMYj9rlpRyhsirzgMsTqfNqz
	L50fo2/znu/Bkwf7Gc42W8poE34DaprROTowYikbmM2qMaI59uExNOYHEc3Mk7dA
	8CzUS2lllVU8/pjhHEPgX8HKltFiTDNt9t/9nxHxaFLIeDYrv3HbpFtO3XyjI/jk
	5931H5OVkXb2ESQN1skcoqz+GrUb4nW2AVnI0R655gJovwlDEyNEAC162DQ/qsTb
	6S9DixN49uKbn0AL7mNqQ==
X-ME-Sender: <xms:xeXXZ8iZs9fL00IeZ7_t6z13sNVpKJqT2InpvgT0ICU3No31Uo4VgA>
    <xme:xeXXZ1BG-K-T36sKnMYOTNIy7vAhe3sHMx4zyDJ9QQfeURx3P_kI3LqZtwrYhiTuu
    IX1A0Hb_ZZW2JrR1hE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddufeeluddtucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertder
    tddtnecuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnug
    gsrdguvgeqnecuggftrfgrthhtvghrnhephfdthfdvtdefhedukeetgefggffhjeeggeet
    fefggfevudegudevledvkefhvdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohep
    vddtpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegurghvvghmsegurghvvghmlh
    hofhhtrdhnvghtpdhrtghpthhtohepjhhfohhrsggvshesfhgvughorhgrphhrohhjvggt
    thdrohhrghdprhgtphhtthhopehrohhsvghnphesghhmrghilhdrtghomhdprhgtphhtth
    hopehhvghrsggvrhhtsehgohhnughorhdrrghprghnrgdrohhrghdrrghupdhrtghpthht
    ohepshgvrhhgvgeshhgrlhhlhihnrdgtohhmpdhrtghpthhtohepjhgrmhgvshdrsghoth
    htohhmlhgvhieshhgrnhhsvghnphgrrhhtnhgvrhhshhhiphdrtghomhdprhgtphhtthho
    pegrrhgusgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghrnhgusehkvghrnhgvlh
    drohhrghdprhgtphhtthhopegssghrvgiiihhllhhonheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:xeXXZ0EoAiWS1UrsccSVFe3OgXt6PV8LyaooFUFZbJnKWtgljS4z5A>
    <xmx:xeXXZ9T15HBDPYBO7BFp7FsmgXKKq_n5P4gfad3-s5pxeIWkQ0jQZg>
    <xmx:xeXXZ5znDHpEBa62saNZ3feGCCGJQn7wZm_HRw3eh77rKHPgQPZ9ng>
    <xmx:xeXXZ75hS9ykx9nVAmrW33_4xN3Z_REnHVQYr0JiPz4bZWY1Kgpc7A>
    <xmx:xuXXZyHz7phn6HslI9mlTvZk9B4SA6RSrPg-n9sxD_gs3z6y92Ey5Qzf>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 1C3F92220072; Mon, 17 Mar 2025 05:05:09 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Mon, 17 Mar 2025 10:04:48 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Herbert Xu" <herbert@gondor.apana.org.au>,
 "David Howells" <dhowells@redhat.com>
Cc: "Arnd Bergmann" <arnd@kernel.org>,
 "'bbrezillon@kernel.org'" <bbrezillon@kernel.org>,
 "Arnaud Ebalard" <arno@natisbad.org>, "Srujana Challa" <schalla@marvell.com>,
 "David S . Miller" <davem@davemloft.net>,
 "Jarkko Sakkinen" <jarkko@kernel.org>, "Paul Moore" <paul@paul-moore.com>,
 "James Morris" <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>,
 "Justin M. Forbes" <jforbes@fedoraproject.org>,
 "Jason A . Donenfeld" <Jason@zx2c4.com>, "Rosen Penev" <rosenp@gmail.com>,
 "Ard Biesheuvel" <ardb@kernel.org>,
 "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>,
 linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
 keyrings@vger.kernel.org, linux-security-module@vger.kernel.org
Message-Id: <5d23903c-7d95-4f3f-975a-7f2fbd70e12e@app.fastmail.com>
In-Reply-To: <Z9ffUVmGlpXdh4jO@gondor.apana.org.au>
References: <20250314160543.605055-1-arnd@kernel.org>
 <2106120.1742200585@warthog.procyon.org.uk>
 <Z9ffUVmGlpXdh4jO@gondor.apana.org.au>
Subject: Re: [PATCH] [v2] crypto: lib/Kconfig: hide library options
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, Mar 17, 2025, at 09:37, Herbert Xu wrote:
> On Mon, Mar 17, 2025 at 08:36:25AM +0000, David Howells wrote:
>> Arnd Bergmann <arnd@kernel.org> wrote:
>> 
>> > -	depends on CRYPTO_LIB_CHACHA20POLY1305 = y
>> > +	select CRYPTO_LIB_CHACHA20POLY1305
>> 
>> Doesn't that allow CRYPTO_LIB_CHACHA20POLY1305=m?
>
> Not unless BIG_KEYS is tristate or under a tristate.

Right, or if it selects something that has a dependency.

Before commit 17ec3e71ba79 ("crypto: lib/Kconfig - Hide arch
options from user"), CRYPTO_LIB_CHACHA20POLY1305 had a
dependency on CONFIG_CRYPTO, so with CRYPTO=m, the 'select CRYPTO_LIB_CHACHA20POLY1305' in BIG_KEYS would result in
CRYPTO_LIB_CHACHA20POLY1305=m.

     Arnd

