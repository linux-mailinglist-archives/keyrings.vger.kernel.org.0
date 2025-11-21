Return-Path: <keyrings+bounces-3419-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 1720EC7BDAE
	for <lists+keyrings@lfdr.de>; Fri, 21 Nov 2025 23:29:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id B67963476FA
	for <lists+keyrings@lfdr.de>; Fri, 21 Nov 2025 22:29:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BAC93043BF;
	Fri, 21 Nov 2025 22:29:23 +0000 (UTC)
X-Original-To: keyrings@vger.kernel.org
Received: from bmailout3.hostsharing.net (bmailout3.hostsharing.net [176.9.242.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3817128507B;
	Fri, 21 Nov 2025 22:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=176.9.242.62
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763764163; cv=none; b=Xm9ZbLjPdPUbACsGMR7G8Uhu8EMn5ctKe4anlDeMY/P2t6O7MYEoZDiR1Q3ROw8HIxY3M+Ad70oG9NDrUbwA9QTD1yzB4Vv8VT8Y3qwQEkRvF8cMAGsuF8TwIRXX/YTCWbJfkZQihd8VLkrPNVV3/0OZ6Nq64+nCe54eEEQxucQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763764163; c=relaxed/simple;
	bh=iY1vG8M1ytYhGmSQtXyo9wuSJdh9F389ipM6R4zq0zo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BnEAWQsep6omBeFsLjzsEwTRKWn9jZoHYXwXMGBPcqOA1SHxJGouPX9yulI0JEAZkwrh57551pvj4kBp0jUo6mOwSV/YqUSN6aiYLGAUdcG3P3HXmwwGTK409upI7ukZsou1b53Nz12V5WGnsBQzKHvhwVor0GATdb/RQ0QjwVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de; spf=none smtp.mailfrom=h08.hostsharing.net; arc=none smtp.client-ip=176.9.242.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=h08.hostsharing.net
Received: from h08.hostsharing.net (h08.hostsharing.net [83.223.95.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384
	 client-signature ECDSA (secp384r1) client-digest SHA384)
	(Client CN "*.hostsharing.net", Issuer "GlobalSign GCC R6 AlphaSSL CA 2025" (verified OK))
	by bmailout3.hostsharing.net (Postfix) with ESMTPS id 738142C05275;
	Fri, 21 Nov 2025 23:29:16 +0100 (CET)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id 51B361BDE8; Fri, 21 Nov 2025 23:29:16 +0100 (CET)
Date: Fri, 21 Nov 2025 23:29:16 +0100
From: Lukas Wunner <lukas@wunner.de>
To: Eric Biggers <ebiggers@kernel.org>
Cc: David Howells <dhowells@redhat.com>, linux-crypto@vger.kernel.org,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Daniel Gomez <da.gomez@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Stephan Mueller <smueller@chronox.de>,
	Ignat Korchagin <ignat@cloudflare.com>, keyrings@vger.kernel.org,
	linux-modules@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] lib/crypto: Add ML-DSA verification support
Message-ID: <aSDnvNGos9qM2Uj5@wunner.de>
References: <20251121005017.GD3532564@google.com>
 <20251120003653.335863-2-ebiggers@kernel.org>
 <20251120003653.335863-1-ebiggers@kernel.org>
 <2624664.1763646918@warthog.procyon.org.uk>
 <3067069.1763761171@warthog.procyon.org.uk>
 <20251121222309.GA3300186@google.com>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251121222309.GA3300186@google.com>

On Fri, Nov 21, 2025 at 10:23:09PM +0000, Eric Biggers wrote:
> That list actually includes the same three files that use -EKEYREJECTED.
> It looks like if the signature verification fails "early" it's -EBADMSG,
> whereas if it fails "late" it's -EKEYREJECTED?

-EBADMSG denotes malformed data (e.g. incorrectly formatted ASN.1 payload).

-EKEYREJECTED denotes a well-formed, but incorrect signature (e.g. made
by a wrong key).

I think it's important and useful to be able to differentiate that.

Thanks,

Lukas

