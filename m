Return-Path: <keyrings+bounces-4144-lists+keyrings=lfdr.de@vger.kernel.org>
Delivered-To: lists+keyrings@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EG6jEHkLr2lzMQIAu9opvQ
	(envelope-from <keyrings+bounces-4144-lists+keyrings=lfdr.de@vger.kernel.org>)
	for <lists+keyrings@lfdr.de>; Mon, 09 Mar 2026 19:03:37 +0100
X-Original-To: lists+keyrings@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id B46BA23E267
	for <lists+keyrings@lfdr.de>; Mon, 09 Mar 2026 19:03:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A2CF03000BAE
	for <lists+keyrings@lfdr.de>; Mon,  9 Mar 2026 18:03:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78F653F0774;
	Mon,  9 Mar 2026 17:59:58 +0000 (UTC)
X-Original-To: keyrings@vger.kernel.org
Received: from bmailout3.hostsharing.net (bmailout3.hostsharing.net [144.76.133.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA063407599;
	Mon,  9 Mar 2026 17:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=144.76.133.112
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773079198; cv=none; b=AQJjIb2AAH74oGlsM5ppF3e3lb3ZVsru7T5wNMSOFUHFUdTQeDftcKG2maKCmi0b3VY4jD4ICqTx+4YWmpgQZLbwX9Z7NylB5b9RDSMgDu76rTo1YcfeITEcK1aK6gr5ed/Ssyxfxe/0kk0Hp6AG/G02WI0ObtagyuGzzyynHoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773079198; c=relaxed/simple;
	bh=c//TlHLudlYMiJ/hQkbuHxWvTFwDGvZJGJ4BL41BeR4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mh2O0QOQHWw5q3pBtVeC8tpx7gN3mr4QrU6uV+0n3eaTwbF5Rrj6ylx1J2FwYyC7eZ3USfaJpl9E/ghAK+ZD+w6RcjJKgfGwNfBBNbvGaR3uZ3q2tejK88kf1B7VT16ZOO+O9tP4C7Ajdps1d8LSl8bNX5LV+cizv3ciUCy/bMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de; spf=none smtp.mailfrom=h08.hostsharing.net; arc=none smtp.client-ip=144.76.133.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=h08.hostsharing.net
Received: from h08.hostsharing.net (h08.hostsharing.net [83.223.95.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (secp384r1) server-digest SHA384
	 client-signature ECDSA (secp384r1) client-digest SHA384)
	(Client CN "*.hostsharing.net", Issuer "GlobalSign GCC R6 AlphaSSL CA 2025" (verified OK))
	by bmailout3.hostsharing.net (Postfix) with ESMTPS id C0B6C2025727;
	Mon, 09 Mar 2026 18:59:46 +0100 (CET)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id 8851A4F38C; Mon,  9 Mar 2026 18:59:46 +0100 (CET)
Date: Mon, 9 Mar 2026 18:59:46 +0100
From: Lukas Wunner <lukas@wunner.de>
To: Ignat Korchagin <ignat@cloudflare.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	David Howells <dhowells@redhat.com>,
	Herbert Xu <herbert@gondor.apana.org.au>, keyrings@vger.kernel.org,
	linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
	Ignat Korchagin <ignat@linux.win>
Subject: Re: [PATCH] MAINTAINERS: update email address for Ignat Korchagin
Message-ID: <aa8KkkKldYOVNg0A@wunner.de>
References: <20260309173445.71393-1-ignat@cloudflare.com>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309173445.71393-1-ignat@cloudflare.com>
X-Rspamd-Queue-Id: B46BA23E267
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DMARC_NA(0.00)[wunner.de: no valid DMARC record];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-4144-lists,keyrings=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[keyrings];
	MID_RHS_MATCH_FROM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lukas@wunner.de,keyrings@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.897];
	RCPT_COUNT_SEVEN(0.00)[8];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,wunner.de:mid,wunner.de:email,cloudflare.com:email]
X-Rspamd-Action: no action

On Mon, Mar 09, 2026 at 05:34:45PM +0000, Ignat Korchagin wrote:
> Since I'm moving from Cloudflare update my email address in the
> MAINTAINERS file and add an entry to .mailmap so nothing gets lost.
> 
> Signed-off-by: Ignat Korchagin <ignat@cloudflare.com>

Acked-by: Lukas Wunner <lukas@wunner.de>

