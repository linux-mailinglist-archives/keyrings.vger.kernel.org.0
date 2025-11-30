Return-Path: <keyrings+bounces-3479-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 34FC5C949FC
	for <lists+keyrings@lfdr.de>; Sun, 30 Nov 2025 02:05:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E06FC3A5D4A
	for <lists+keyrings@lfdr.de>; Sun, 30 Nov 2025 01:05:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 148AD1FF61E;
	Sun, 30 Nov 2025 01:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="F5tMY9xy"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D417617B50A;
	Sun, 30 Nov 2025 01:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764464727; cv=none; b=HLfexbUciY4wpvk24PzXiE/yNsfW45AI4sUHCMIjzMSEThJwDitfnG/XC3jlj3U2McQgHEpXVfvHy1LhlCQhewgUmr+OAzWGFTpAWdh/MHBn3afdi6kPXTfpr8JG3VujVmQ+3uciE4+T9JKPbNgKUrpbITEUQbMoI0NS3gmZevI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764464727; c=relaxed/simple;
	bh=h62Qpy3wIzPNqaVVz62kx+Vm/YLqPAAAXuI2QaLGGEA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qZpw/CU6JeEVye/srDTbFiI2ssFisRRDoA1zkZY28Qp/WNtFnvTinsVUgaq1fwEDLHuuCaY6DwsY4day5z/3Sb/saSJYz32qzf+X7kwrwuYe+MNoZYj7i7MAwA8Cnl/Yjzyyd1/pN5kGtJ0BhU9FkqgFF2x0EY+ySUiBe10wXJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b=F5tMY9xy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58B22C4CEF7;
	Sun, 30 Nov 2025 01:05:24 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="F5tMY9xy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1764464722;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=At7TTlBq+ZlIDUjv0+t7TLluXTYzsmDdD2LzPAn7QLI=;
	b=F5tMY9xylsT7GA1JTKuJpo5H5xvVA+gTL+hy8+hP8P8ChalCe3+UWj6MEDPMR/YC6c3bDb
	c5kDz1hrgLUb2nv2v3WrvHtZxKTpKKL6zCsyMAxvyiF4DwtvtHobduzOvImE/p8umNr9yn
	vN4gXTf1fays4EoolzDbkqwQP9Cndb8=
Received: 
	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id cda9e9f9 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Sun, 30 Nov 2025 01:05:21 +0000 (UTC)
Date: Sun, 30 Nov 2025 02:05:20 +0100
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: "Becker, Hanno" <beckphan@amazon.co.uk>,
	"linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
	David Howells <dhowells@redhat.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Daniel Gomez <da.gomez@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Stephan Mueller <smueller@chronox.de>,
	Lukas Wunner <lukas@wunner.de>,
	Ignat Korchagin <ignat@cloudflare.com>,
	"keyrings@vger.kernel.org" <keyrings@vger.kernel.org>,
	"linux-modules@vger.kernel.org" <linux-modules@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"matthias@kannwischer.eu" <matthias@kannwischer.eu>
Subject: Re: [PATCH 1/4] lib/crypto: Add ML-DSA verification support
Message-ID: <aSuYUDdlZvZrXuUo@zx2c4.com>
References: <20251120003653.335863-1-ebiggers@kernel.org>
 <20251120003653.335863-2-ebiggers@kernel.org>
 <A7135B59-BAB5-451E-AD71-971F828054F0@amazon.co.uk>
 <20251130001911.GA12664@sol>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251130001911.GA12664@sol>

Hi Hanno,

Just to add to what Eric said...

On Sat, Nov 29, 2025 at 04:19:11PM -0800, Eric Biggers wrote:
> I think you may be underestimating how much the requirements of the
> kernel differ from userspace.  Consider the following:

I've added a bit of formally verified code to the kernel, and also
ported some userspace crypto. In these cases, I wound up working with
the authors of the code to make it more suitable to the requirements of
kernel space -- even down to the formatting level. For example, the
HACL* project needed some changes to KReMLin to make the variety of code
fit into what the kernel expected. Andy Polyakov's code needed some
internal functions exposed so that the kernel could do cpu capability
based dispatch. And so on and so forth. There's always _something_.

I'd love to have a formally verified ML-DSA implementation (if we're to
have ML-DSA in the kernel anyhow, but it looks like that's happening).
But I almost guarantee that it's going to be some work to do. If those
are efforts you'd consider undertaking seriously, I'd be happy to assist
or help guide the considerations.

There's also another approach, which would be to formally verify Eric's
code, perhaps even using the same techniques as your own project, via
CBMC and such. In this case, the name of the game is usually to port the
kernel code to userspace. That generally winds up being a matter of
shimming out some headers and adding a few typedefs. There's a decent
amount of kernel test code or kernel tool code that does this, and lots
of shim headers already in the kernel that can be borrowed for this. But
usually, at least for crypto code, you can figure it out pretty quickly
by just trying to compile it and plugging the missing headers and types
as they come up.

The model checking might be more work with this latter approach, since
it's not already done like it is for the former, but the porting work is
probably much less arduous.

Anyway, the bigger picture is that I'm very enthusiastic about getting
formally verified crypto in the kernel, so these types of efforts are
really very appreciated and welcomed. But it just takes a bit more work
than usual.

Jason

