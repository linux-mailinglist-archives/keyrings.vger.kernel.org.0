Return-Path: <keyrings+bounces-2929-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B3DAB0C3CC
	for <lists+keyrings@lfdr.de>; Mon, 21 Jul 2025 14:05:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3FE7B1658CF
	for <lists+keyrings@lfdr.de>; Mon, 21 Jul 2025 12:05:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFE3628C871;
	Mon, 21 Jul 2025 12:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=benboeckel.net header.i=@benboeckel.net header.b="NvbihBwj";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="CCeJe81Z"
X-Original-To: keyrings@vger.kernel.org
Received: from fhigh-b1-smtp.messagingengine.com (fhigh-b1-smtp.messagingengine.com [202.12.124.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 738111ABED9
	for <keyrings@vger.kernel.org>; Mon, 21 Jul 2025 12:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753099507; cv=none; b=cbLWqgtGH4g5vw6LmcztPSk4ZxNMwXpCA1wWbSN+5iHw8CvVaT9JbWIP0ZKfuwcuJDLys8X06nD5TM+j80VK0eaS6X8I66doGXhHRnn++k+I8cAZaqAdFZjUmI3fNdUAGTfkCdlmeU/Lvb8GNYjoUjT3VLwd02ZtJUdz4tdqS7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753099507; c=relaxed/simple;
	bh=Ph4c3DwMg9QMCL1PvGRfd6CtV2LTnwj5k8/dgjb5uEg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hj0uSdFwmAUgjAuMfipDJcALztDaqK/p4oEEl7kH2/b8aRRLVjWGTac8Seq1eV9kl23fXbJXbRODa3V0rMmVNNwv+r3p5GnqTQ9UmijNsuGrwNzwXFxXhO2YAxwFvKbaNkhQTUd8erAAgsrGeI5iLd6buXPsL9IGPTiFr4AhXgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=benboeckel.net; spf=pass smtp.mailfrom=benboeckel.net; dkim=pass (2048-bit key) header.d=benboeckel.net header.i=@benboeckel.net header.b=NvbihBwj; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=CCeJe81Z; arc=none smtp.client-ip=202.12.124.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=benboeckel.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=benboeckel.net
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 408D77A022A;
	Mon, 21 Jul 2025 08:05:04 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Mon, 21 Jul 2025 08:05:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=benboeckel.net;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:reply-to:subject:subject:to:to; s=fm1; t=1753099504;
	 x=1753185904; bh=ZfQmaoVfbESot+jsp968Q7KG6MJ/X4wre3iM3AU35rA=; b=
	NvbihBwjtJweRNLRLCqjMwH5QZvvf58agE1x5t48GrLpoxcCtzVsWMICYVSsGYmU
	D6gg/q/+KhC2ekVIRMCE/0hbq+IqtfjjnFtmsjUxgzmSTRXWjfxPYbZEJjRxNytB
	6J70q4TvzFxcn9ql5QH8tCmGF1UZriqZicf1Svr4+BXirUsZMSgEuS6KQH04wYoQ
	t5Z5QYSsO1yI3iF025PJxVcdJvP9zyabgoNv5PargdwslhohzW4Dn98hral2SgDQ
	o3gXU89sv+w/df5MO8tzcdh3W50ecz0Ygi6Oj5Or8MgjpcZEeqMs5ks+fxfVKlAT
	JztKPoBH/Yl1v3o6NPK87A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1753099504; x=1753185904; bh=ZfQmaoVfbESot+jsp968Q7KG6MJ/
	X4wre3iM3AU35rA=; b=CCeJe81Z8avm+qf3eKbhhjpccPOPR5hJVkuiaEBa6ig9
	czMv3f1VbU03P51tdHnSsrOpsQO+ftrQoO8HSMOaLXQHZ48JNhOmjInKztYQEnD7
	LIzK35t5eDZpb94Wcyrhv3Jql8+JFuqs+fo2Tru2U2eFD1RgHdthfJQjEfeF0z2N
	S9XRW0VbZjGMBuXFTesFLEf4yj88NSP1tee8clq17K/3s9OaEY4SkyucNfeCF4B6
	IMJaQMIY8OLmjSUWl5UZnSmvzhdbI79vNFryEud7dxS/E99tWhWtW3t8arqLnsW2
	EasxxgaXYIcowa3RI7BiQMkfJLJ8e35YB8O+hTEYEg==
X-ME-Sender: <xms:7ix-aDn0heZHAuBNtED_NYjbTUplhBkS4mOuvkKnLXdrC6wDzYVlYA>
    <xme:7ix-aLNrUdtSWBpzCXg3ngS3aWyA3t7Z5S12fjypMzhjE1RBkFs5AEdw1IxVib1mI
    1H6f8itHLiZO8jL-xY>
X-ME-Received: <xmr:7ix-aHjqHz6SMi2M1XH6uYpN5XSknDr1GOgue4iDiilZK98ZhA_7rzoBRF5F31no9-uHeueJbaTRcV3s8TZhxaM2HC3Gu117gY0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdejvddtgecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhrfhggtggujggfsehttdertddtreejnecuhfhrohhmpeeuvghnuceu
    ohgvtghkvghluceomhgvsegsvghnsghovggtkhgvlhdrnhgvtheqnecuggftrfgrthhtvg
    hrnhepudevhfejffeigfffhefguedvfeefueffudeiiefgudekhfdugeegkedujedujeeh
    necuffhomhgrihhnpehmrghrtgdrihhnfhhopdhgihhthhhusgdrtghomhdpthhruhhsth
    gvugdrrhhsnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhho
    mhepmhgvsegsvghnsghovggtkhgvlhdrnhgvthdpnhgspghrtghpthhtohepuddupdhmoh
    guvgepshhmthhpohhuthdprhgtphhtthhopegvqhhuihhnohigseguihgrtgdvgedrnhgv
    thdprhgtphhtthhopehkvgihrhhinhhgshesvhhgvghrrdhkvghrnhgvlhdrohhrghdprh
    gtphhtthhopeguhhhofigvlhhlshesrhgvughhrghtrdgtohhmpdhrtghpthhtohepjhgr
    rhhkkhhosehkvghrnhgvlhdrohhrghdprhgtphhtthhopehsfhhrvghntghhsehsrghmsg
    grrdhorhhgpdhrtghpthhtoheptghhuhgtkhdrlhgvvhgvrhesohhrrggtlhgvrdgtohhm
    pdhrtghpthhtohepiihohhgrrheslhhinhhugidrihgsmhdrtghomhdprhgtphhtthhope
    hptgesmhgrnhhguhgvsghithdrohhrghdprhgtphhtthhopehhvghrsggvrhhtsehgohhn
    ughorhdrrghprghnrgdrohhrghdrrghu
X-ME-Proxy: <xmx:7ix-aJg7aZ1opVNvMAwB8NxndFYGsa6U6JWpGOOpS8CnMajnC9d7JQ>
    <xmx:7ix-aGLBd3wGkPx9ppj4g0Y2w5G5A1q-pG3Q_asdS7xFFI4QM2qPzw>
    <xmx:7ix-aIlwrKLwbGN6zJ1RFy3bvPp9JQ4r5b42mVRwrXJACU5AwgfvYg>
    <xmx:7ix-aON-PQ-_o7rIvu7M0KhfzJArQoE-BNgWca8zdPU0w3XkDV-d7A>
    <xmx:8Cx-aB17XLKtzP7st3mU-1KW0UkQXq6mR7HVn0cYwyECTxBq4y53V0um>
Feedback-ID: iffc1478b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 21 Jul 2025 08:05:01 -0400 (EDT)
Date: Mon, 21 Jul 2025 08:04:59 -0400
From: Ben Boeckel <me@benboeckel.net>
To: David 'equinox' Lamparter <equinox@diac24.net>
Cc: keyrings@vger.kernel.org, David Howells <dhowells@redhat.com>,
	Jarkko Sakkinen <jarkko@kernel.org>,
	Steve French <sfrench@samba.org>,
	Chuck Lever <chuck.lever@oracle.com>,
	Mimi Zohar <zohar@linux.ibm.com>,
	Paulo Alcantara <pc@manguebit.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Jeffrey Altman <jaltman@auristor.com>, hch@infradead.org
Subject: Re: [RFC] Keyrings: How to make them more useful
Message-ID: <aH4s6w6AgEJ2LDVr@farprobe>
Reply-To: list.lkml.keyrings@me.benboeckel.net
References: <462886.1749731810@warthog.procyon.org.uk>
 <aGKZUfjsj6kGs726@eidolon.nox.tf>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aGKZUfjsj6kGs726@eidolon.nox.tf>
User-Agent: Mutt/2.2.14 (2025-02-20)

On Mon, Jun 30, 2025 at 16:04:01 +0200, David 'equinox' Lamparter wrote:
> * the trusted key / TPM bits are incredibly poorly documented.  It's
>   basically "cobble together things from old patch descriptions", e.g.
>   https://marc.info/?l=linux-keyrings&m=160074197025246
>   (I still have not figured out how to do this correctly.  Some of that
>   is to blame on the TPM bits, but not all.)
> 
> I guess the kernel itself doesn't care about the blocking API, but for
> trusted keys...  you'll have to tie things together from user space, and
> I don't see how anyone can do that, especially with any level of
> confidence that they didn't accidentally leave some wide-open hole (as
> in - you might well get something to work, but without docs you can't
> check you actually did it *right*.)  This is really improving keyctl
> itself (i.e. how its commands are invoked) and also its documentation.

You may be interested in some of the work I've done here:

    https://github.com/mathstuf/rust-keyutils

In particular:

    https://github.com/mathstuf/rust-keyutils/blob/master/src/keytypes/trusted.rs

There are assorted issues and PRs that may be of interest for trusted
keys as well.

Unfortunately, I've not had the time to dedicate to it, so it has
languished a bit over time.

--Ben

