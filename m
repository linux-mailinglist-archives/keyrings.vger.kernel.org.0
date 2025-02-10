Return-Path: <keyrings+bounces-2395-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 80C97A2F7F2
	for <lists+keyrings@lfdr.de>; Mon, 10 Feb 2025 19:54:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 305F8166752
	for <lists+keyrings@lfdr.de>; Mon, 10 Feb 2025 18:54:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62D1025E441;
	Mon, 10 Feb 2025 18:54:09 +0000 (UTC)
X-Original-To: keyrings@vger.kernel.org
Received: from bmailout1.hostsharing.net (bmailout1.hostsharing.net [83.223.95.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A78D25E44D;
	Mon, 10 Feb 2025 18:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=83.223.95.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739213649; cv=none; b=S8btQpL4Ly7vK/ZkqT6FyPg2V8k8/V4AZISOPTNXgp8ZNDhQKc8QsSul+mU+EAW/kXpQq4c2bIlXaQTLiofn4Q1xvOhfmnj/zcVLIn3W7jF5GSVwyUdEuypbK0Z68sdsZnkpTknuunavd8cfqi5bVGJx1lhaU5ga2xxip0nbJhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739213649; c=relaxed/simple;
	bh=0AKP6Cx7ME0izaqpJffT6YldnbNQda1e9BZqeeflKmA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RXV3TTeEHonuB4ZD8rhoPJCWWT9o90cVoisuvO51NYg7Bo6c1Jygf/NpYGtkn+k4KSzNM64spUq6ERt4yTp1zAFMfH3JioJoTQMPwEPZpNA4a12Z74coPtWQNAHA5MGKviWKyLp6Z+I9tF2mba9VNurcJewKOj2j6EMmQfwY7jM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de; spf=none smtp.mailfrom=h08.hostsharing.net; arc=none smtp.client-ip=83.223.95.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=h08.hostsharing.net
Received: from h08.hostsharing.net (h08.hostsharing.net [IPv6:2a01:37:1000::53df:5f1c:0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "*.hostsharing.net", Issuer "RapidSSL TLS RSA CA G1" (verified OK))
	by bmailout1.hostsharing.net (Postfix) with ESMTPS id 7A96C3000820D;
	Mon, 10 Feb 2025 19:53:57 +0100 (CET)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id 5E231546B89; Mon, 10 Feb 2025 19:53:57 +0100 (CET)
Date: Mon, 10 Feb 2025 19:53:57 +0100
From: Lukas Wunner <lukas@wunner.de>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: "David S. Miller" <davem@davemloft.net>,
	Stefan Berger <stefanb@linux.ibm.com>,
	Vitaly Chikunov <vt@altlinux.org>,
	David Howells <dhowells@redhat.com>,
	Ignat Korchagin <ignat@cloudflare.com>,
	linux-crypto@vger.kernel.org, keyrings@vger.kernel.org,
	Eric Biggers <ebiggers@google.com>
Subject: Re: [PATCH v2 3/4] crypto: ecdsa - Fix enc/dec size reported by
 KEYCTL_PKEY_QUERY
Message-ID: <Z6pLRRJFOml8w61S@wunner.de>
References: <cover.1738521533.git.lukas@wunner.de>
 <3d74d6134f4f87a90ebe0a37cb06c6ec144ceef7.1738521533.git.lukas@wunner.de>
 <Z6h8L0D-CBhZUiVR@gondor.apana.org.au>
 <Z6iRssS26IOjWbfx@wunner.de>
 <Z6mwxUaS33EastB3@gondor.apana.org.au>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z6mwxUaS33EastB3@gondor.apana.org.au>

On Mon, Feb 10, 2025 at 03:54:45PM +0800, Herbert Xu wrote:
> On Sun, Feb 09, 2025 at 12:29:54PM +0100, Lukas Wunner wrote:
> > One user of this API is the Embedded Linux Library, which in turn
> > is used by Intel Wireless Daemon:
> > 
> > https://git.kernel.org/pub/scm/libs/ell/ell.git/tree/ell/key.c
> > https://git.kernel.org/pub/scm/network/wireless/iwd.git/tree/src/eap-tls.c
> 
> Surely this doesn't use the private key part of the API, does it?

It does use the private key part:

It takes advantage of the kernel's Key Retention Service for EAP-TLS,
which generally uses mutual authentication.  E.g. clients authenticate
against a wireless hotspot.  Hence it does invoke KEYCTL_PKEY_SIGN and
KEYCTL_PKEY_ENCRYPT (with private keys, obviously).


> While I intensely dislike the entire API being there, it's only the
> private key part that I really want to remove.

Note that the patches proposed here only touch the KEYCTL_PKEY_QUERY
interface, which is used for public keys as well.

Thanks,

Lukas

