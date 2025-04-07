Return-Path: <keyrings+bounces-2591-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 24C9EA7D829
	for <lists+keyrings@lfdr.de>; Mon,  7 Apr 2025 10:39:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D2506188A600
	for <lists+keyrings@lfdr.de>; Mon,  7 Apr 2025 08:39:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E06C8226D17;
	Mon,  7 Apr 2025 08:39:17 +0000 (UTC)
X-Original-To: keyrings@vger.kernel.org
Received: from bmailout3.hostsharing.net (bmailout3.hostsharing.net [176.9.242.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 870DC1A8F93;
	Mon,  7 Apr 2025 08:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=176.9.242.62
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744015157; cv=none; b=BPey8GhGkNspHbRebnEUaqeJYDWpOUcH5bcg3UX9Q6C+ckcLwLUPviVZiYALtwupSglWU3NRsWQxBu5PEzsPFC1HSp8+Q7doXjHq4o+CbGAOpByADHUhcn+g+xqkDH1EdortJyT9WnPh9pg3yysIU2jaY2MEE9OAGdGkBgJhPg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744015157; c=relaxed/simple;
	bh=L7pucbBLVRTuwmCZY209YVM8b1EvZuSLM0fbQ0DIgGk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OYx9VBOr/AOSHhAaAaD0mrZ/BCBezst532AWgxY3HfqobsXZk8l4bRl3UEKdMfel5DyCfP9LaTfT/BtSiFH+URSuy7tR5GqblQzwGXLtt4QzXY9ED8C4niTV/XTQhDL/swtPlO8Oa+8NsSwrWBvhiiH/e+afzZFhgaQqazVUlu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de; spf=none smtp.mailfrom=h08.hostsharing.net; arc=none smtp.client-ip=176.9.242.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=h08.hostsharing.net
Received: from h08.hostsharing.net (h08.hostsharing.net [IPv6:2a01:37:1000::53df:5f1c:0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "*.hostsharing.net", Issuer "RapidSSL TLS RSA CA G1" (verified OK))
	by bmailout3.hostsharing.net (Postfix) with ESMTPS id A5BF32C05257;
	Mon,  7 Apr 2025 10:39:05 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id D785C30EC6; Mon,  7 Apr 2025 10:39:10 +0200 (CEST)
Date: Mon, 7 Apr 2025 10:39:10 +0200
From: Lukas Wunner <lukas@wunner.de>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: David Howells <dhowells@redhat.com>,
	Ignat Korchagin <ignat@cloudflare.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>, keyrings@vger.kernel.org,
	linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RESEND PATCH] crypto: x509 - Replace kmalloc() +
 NUL-termination with kzalloc()
Message-ID: <Z_OPLsDQxcS1sGn9@wunner.de>
References: <20250407082247.741684-1-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407082247.741684-1-thorsten.blum@linux.dev>

On Mon, Apr 07, 2025 at 10:22:47AM +0200, Thorsten Blum wrote:
> Use kzalloc() to zero out the one-element array instead of using
> kmalloc() followed by a manual NUL-termination.
> 
> No functional changes intended.
> 
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>

Reviewed-by: Lukas Wunner <lukas@wunner.de>

