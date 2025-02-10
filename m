Return-Path: <keyrings+bounces-2396-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A179A2FAB5
	for <lists+keyrings@lfdr.de>; Mon, 10 Feb 2025 21:37:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 44A397A1C40
	for <lists+keyrings@lfdr.de>; Mon, 10 Feb 2025 20:36:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D135424E4B7;
	Mon, 10 Feb 2025 20:29:32 +0000 (UTC)
X-Original-To: keyrings@vger.kernel.org
Received: from bmailout1.hostsharing.net (bmailout1.hostsharing.net [83.223.95.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1CC724E4B3;
	Mon, 10 Feb 2025 20:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=83.223.95.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739219372; cv=none; b=rRPsVkjMJCGJzDgaNxXQSwlJOY1eacJBgm3Rb9ynC/40CovjGwcvAHrqvgM7o7RlGdF1iHUKSpeRgJBsDT0/LyExGwWlGmkZLySeekt4uumgHfcUcZi2IohGVL1PEp/U8kEOywcrtHOOy0epS58M8rqtlakqYSZ9rGiK5cqvJyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739219372; c=relaxed/simple;
	bh=bdosDU1EK4m2FhjL8wH0lKPqoVP9PjsbF0ErfSUWg9c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lEmdt1Ci6jSQsgAP2ix+xsQU4I35CO6zAggoWS9BhclkcBfYXV+C2ecRocy+bCtyfWsxT1jB/7kyVB+N4JsAlm+iY82hDsmMwIR2XiLHHa7J6PWWpGbxsfwVGjo46xqCx30YB3XjOL32pFVg3sHoP8UE6elzkGHzNbBqdw5qoNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de; spf=none smtp.mailfrom=h08.hostsharing.net; arc=none smtp.client-ip=83.223.95.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=h08.hostsharing.net
Received: from h08.hostsharing.net (h08.hostsharing.net [IPv6:2a01:37:1000::53df:5f1c:0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "*.hostsharing.net", Issuer "RapidSSL TLS RSA CA G1" (verified OK))
	by bmailout1.hostsharing.net (Postfix) with ESMTPS id ED7C63000D924;
	Mon, 10 Feb 2025 21:29:27 +0100 (CET)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id D53342B6476; Mon, 10 Feb 2025 21:29:27 +0100 (CET)
Date: Mon, 10 Feb 2025 21:29:27 +0100
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
Message-ID: <Z6php2EaVZHT9MN5@wunner.de>
References: <cover.1738521533.git.lukas@wunner.de>
 <3d74d6134f4f87a90ebe0a37cb06c6ec144ceef7.1738521533.git.lukas@wunner.de>
 <Z6h8L0D-CBhZUiVR@gondor.apana.org.au>
 <Z6iRssS26IOjWbfx@wunner.de>
 <Z6mwxUaS33EastB3@gondor.apana.org.au>
 <Z6pLRRJFOml8w61S@wunner.de>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z6pLRRJFOml8w61S@wunner.de>

On Mon, Feb 10, 2025 at 07:53:57PM +0100, Lukas Wunner wrote:
> It takes advantage of the kernel's Key Retention Service for EAP-TLS,
> which generally uses mutual authentication.  E.g. clients authenticate
> against a wireless hotspot.  Hence it does invoke KEYCTL_PKEY_SIGN and
> KEYCTL_PKEY_ENCRYPT (with private keys, obviously).

Sorry, I meant KEYCTL_PKEY_DECRYPT.
                           ^^

