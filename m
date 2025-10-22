Return-Path: <keyrings+bounces-3263-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EEC4BFD70D
	for <lists+keyrings@lfdr.de>; Wed, 22 Oct 2025 19:03:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id BD211568A19
	for <lists+keyrings@lfdr.de>; Wed, 22 Oct 2025 16:50:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E64C135B13F;
	Wed, 22 Oct 2025 16:50:19 +0000 (UTC)
X-Original-To: keyrings@vger.kernel.org
Received: from bmailout1.hostsharing.net (bmailout1.hostsharing.net [83.223.95.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F237335B132;
	Wed, 22 Oct 2025 16:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=83.223.95.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761151819; cv=none; b=shgoXekXV9UlN/ZNlT4VoQyg9TCLr9BjWM9Byzd+4dwN7TbZC11qtiie4lCzuy6YpEQJreLHyuwD5xTojvzqBcLBIU/C1t+g4ev54WXpdWtVxUoezeOtrUDhg7qkL4WFGLPWWyGUSeLnbifQDEJwfe/9VhU+h26Qngp/a1kQ91c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761151819; c=relaxed/simple;
	bh=3V+p5ua18plT82ZOHQ2rZhidDblQMsuy7V9f26iqUMc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JOyGaNQ9RWmdaf/HogwmMSkCJhZKCAT9Oyn4E7E9vIXhHBGauUfFGqUReEqwnojyWaitKvaMilJQcOEm/dvD6i+ZUOxIL3yQuOesEEjhbDlUF8bU0Vk2sHilS7wzFaGp/l9NuxRkJnUIqiQwkcBJJzhRdjEjcGuJqIKzkMehHkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de; spf=none smtp.mailfrom=h08.hostsharing.net; arc=none smtp.client-ip=83.223.95.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=h08.hostsharing.net
Received: from h08.hostsharing.net (h08.hostsharing.net [83.223.95.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "*.hostsharing.net", Issuer "RapidSSL TLS RSA CA G1" (verified OK))
	by bmailout1.hostsharing.net (Postfix) with ESMTPS id D25392C0667F;
	Wed, 22 Oct 2025 18:50:14 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id CC0154A12; Wed, 22 Oct 2025 18:50:14 +0200 (CEST)
Date: Wed, 22 Oct 2025 18:50:14 +0200
From: Lukas Wunner <lukas@wunner.de>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: David Howells <dhowells@redhat.com>,
	Ignat Korchagin <ignat@cloudflare.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Vivek Goyal <vgoyal@redhat.com>, keyrings@vger.kernel.org,
	linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] crypto: asymmetric_keys - prevent overflow in
 asymmetric_key_generate_id
Message-ID: <aPkLRkgrfBXpFvkt@wunner.de>
References: <20251013114010.28983-2-thorsten.blum@linux.dev>
 <aO0dJeqb9E99xVvD@wunner.de>
 <73423731-F3C2-483A-BDAB-3FEF5471B8EA@linux.dev>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <73423731-F3C2-483A-BDAB-3FEF5471B8EA@linux.dev>

On Wed, Oct 22, 2025 at 02:23:02PM +0200, Thorsten Blum wrote:
> On 13. Oct 2025, at 17:39, Lukas Wunner wrote:
> > On Mon, Oct 13, 2025 at 01:40:10PM +0200, Thorsten Blum wrote:
> >> Use check_add_overflow() to guard against potential integer overflows
> >> when adding the binary blob lengths and the size of an asymmetric_key_id
> >> structure and return ERR_PTR(-EOVERFLOW) accordingly. This prevents a
> >> possible buffer overflow when copying data from potentially malicious
> >> X.509 certificate fields that can be arbitrarily large, such as ASN.1
> >> INTEGER serial numbers, issuer names, etc.
> >> 
> >> Fixes: 7901c1a8effb ("KEYS: Implement binary asymmetric key ID handling")
> >> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> 
> I removed stable@ after your feedback to v2, but shouldn't v3 be applied
> to stable as well?

The Fixes tag you included implicitly serves as a stable tag.
It's usually sufficient reason for stable maintainers to select
the patch for backporting to stable kernels.

I'm always a bit cautious with stable designations because
if the patch turns out to be buggy, we broke the stable kernels as well,
which is bad and embarrassing.

In this particular case, the patch is fine but the bug doesn't look
easy to trigger.  One would have to craft an extremely large certificate.
Possible, but not very common.  Hence it doesn't seem super important
to get this fixed in stable kernels and for this reason I wouldn't have
included a Fixes tag if this was my patch.

Thanks,

Lukas

