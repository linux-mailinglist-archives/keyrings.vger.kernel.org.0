Return-Path: <keyrings+bounces-348-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B1BB081F404
	for <lists+keyrings@lfdr.de>; Thu, 28 Dec 2023 02:56:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6C0BB1C20DF4
	for <lists+keyrings@lfdr.de>; Thu, 28 Dec 2023 01:56:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA8B015B3;
	Thu, 28 Dec 2023 01:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=benboeckel.net header.i=@benboeckel.net header.b="e7NzKu3N";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="YRYIJfnq"
X-Original-To: keyrings@vger.kernel.org
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com [66.111.4.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25B7D136F
	for <keyrings@vger.kernel.org>; Thu, 28 Dec 2023 01:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=benboeckel.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=benboeckel.net
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.nyi.internal (Postfix) with ESMTP id 0FE4A5C01AD;
	Wed, 27 Dec 2023 20:56:09 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Wed, 27 Dec 2023 20:56:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=benboeckel.net;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1703728569; x=
	1703814969; bh=/w7Vsxxre5/xKj+1zxQumws9yVqXYyb02kdmhCMqo5M=; b=e
	7NzKu3NzTUoQdQbzZ2X1uoaD8iKqGGcjhIwlzHF2joir8oHsGOxGAZYXherFPQdZ
	se7oWmZbWDZhAutMGYZQJYRbSqA+UOG6RRn6eKbPeqBHGMca7vksZPuzi7BIX6Mz
	MQE+rMCblX0j+tntZwu54hRG8wKr85zaLvEieR3XaTB6ck97AFyG1y0xSBWHE1Yd
	F3Ow6Bj4Rlex7EcY90dmAxqYjrmiSv2AIDBjfsjwVU5jdOso2Ife/CIeLWAOVNK0
	dD3chUOWomwDdVfAHjoQwt3YVwWXMtGsfs//HZFUE0xUuCuvjyDByHFj/t/y89Ij
	HcI2fHb+YC5iYWEhjtznw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1703728569; x=1703814969; bh=/w7Vsxxre5/xKj+1zxQumws9yVqX
	Yyb02kdmhCMqo5M=; b=YRYIJfnqm1v5XLASGGWG68dvWgVXIAeS2FCPWowX3zFi
	GGA7kUOZCd6vQSIAKqaJvUYj2miByx+fOPcXqlKwaBo9sO7Y+T/+0PnCbOsvXtwk
	VVIjmwjhJ1qGp+0hO216yEiFLA4ctAyYkvKg43ZfB+qvQs/Mhz2EvNiwKBgs38ey
	Oonv7KQXXjAUQDOFwPDFCdL8MioqBE1N3sY+fE610WabBqQloyQUxOYIWAv2e3yv
	kN5WDGH3raVJKTYKLNUAC2Dfflm6wjsNPH7679tvMUaRdUjf11YFwclDlX+ozdPO
	zDaANa9UJnLVl9sZasN3yhJq+AgWm8tdqbcpK/6ItQ==
X-ME-Sender: <xms:uNWMZeed2mU5p_FvB4rxw0intt0t05-o8_8sbY_gqZgy4KFBc_JCgg>
    <xme:uNWMZYPh3PIqXpcKK6hDv3gx0kFrAm3sBdAU5aq2libHx9dou_PIjbHIfowcb_RVN
    KlcI0R79OZ7bHcmKRg>
X-ME-Received: <xmr:uNWMZfgOzFD2F411IfbGG9YnQM3VVGr7esyQKqZaTG1B_sgJWPMdEz4EjPAMKTWikMY1_JgonCiHrr9sDUcsmBERl4mgfKE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrvdeftddggedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujggfsehttdertddtreejnecuhfhrohhmpeeuvghn
    uceuohgvtghkvghluceomhgvsegsvghnsghovggtkhgvlhdrnhgvtheqnecuggftrfgrth
    htvghrnhepfefhledvtdehudejgeejvdevffeuuefhvdelueehueehfeevkeduuddvvdeg
    feffnecuffhomhgrihhnpehgihhtlhgrsgdrtghomhenucevlhhushhtvghrufhiiigvpe
    dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmvgessggvnhgsohgvtghkvghlrdhnvght
X-ME-Proxy: <xmx:uNWMZb-b2N1Eam9xVa2GWjazZKH6yFb1tsLmXBjxX9R6jqq6Ufw7kg>
    <xmx:uNWMZauuf4M2JDptaIfxD5d3is7t8F_yl6GrbljVgXNAB8hOyb1XOA>
    <xmx:uNWMZSGd1YS4pxqFBF4X0-UWUuG9wQXRT511wQcwP39Sqr7JQcQLAg>
    <xmx:udWMZfW_mWBSBYPpcvmg5TmdW7M75o8S6Q7PY9yPrWXsmUA_AAP87w>
Feedback-ID: iffc1478b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 27 Dec 2023 20:56:08 -0500 (EST)
Date: Wed, 27 Dec 2023 20:56:05 -0500
From: Ben Boeckel <me@benboeckel.net>
To: Nicholas Vinson <nvinson234@gmail.com>
Cc: keyrings@vger.kernel.org, dhowells@redhat.com
Subject: Re: [keyutils] Remove undefined functions afrom version.lds
Message-ID: <ZYzVtdviEYQ6AN-6@farprobe>
References: <85561febfcf0618a9280448d5c53775646f470d6.1703712863.git.nvinson234@gmail.com>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <85561febfcf0618a9280448d5c53775646f470d6.1703712863.git.nvinson234@gmail.com>
User-Agent: Mutt/2.2.12 (2023-09-09)

On Wed, Dec 27, 2023 at 16:35:16 -0500, Nicholas Vinson wrote:
> Functions keyctl_restrict() and keyctl_dh_compute_kdf_alloc() are
> nodefined. Their inclusion in version.lds causes clang/llvm LTO
> optimizations to fail with error messages similar to
> 
>     error: version script assignment of KEYUTILS_1.7 to symbol
>     keyctl_restrict failed: symbol not defined
> 
> This patch fixes the issue by removing the symbol names from
> version.lds.

FYI, there is also a GitLab repo here if you want to submit an MR:

    https://gitlab.com/linux-afs/keyutils

I believe it has yet to be seen if this is preferred or GitLab. Or
whether the ML will get GitLab MR notifications.

--Ben

