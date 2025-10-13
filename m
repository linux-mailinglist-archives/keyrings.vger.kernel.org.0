Return-Path: <keyrings+bounces-3218-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CF78BD530E
	for <lists+keyrings@lfdr.de>; Mon, 13 Oct 2025 18:47:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 06C2D543F6A
	for <lists+keyrings@lfdr.de>; Mon, 13 Oct 2025 15:59:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4823F30DD26;
	Mon, 13 Oct 2025 15:39:29 +0000 (UTC)
X-Original-To: keyrings@vger.kernel.org
Received: from bmailout2.hostsharing.net (bmailout2.hostsharing.net [83.223.78.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCC6B30DD19;
	Mon, 13 Oct 2025 15:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=83.223.78.240
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760369969; cv=none; b=TW79WodZtv3ewtCyk7QcuwMsB5q7OLScViXsHa/REYGVvKl2IwrD8ubJa2yQXSS63gxHv1jV9c+s/AIA6RD6VNAuxXCxsauKB/JJyCx2BoyrMk57zSIezAkmWGK/F6INyrtcASvs87v3oVCZbsctROC39Nbc1MJEYgDNjzzkq1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760369969; c=relaxed/simple;
	bh=xEXvG76TBhcCLLDPHeeQUiOmT61E7FaywA6jCqOdt90=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rWneAsESMVpLKfrRV9iCAvrZASMRPxL2n8M7LkjeDNATYTu4kUjdZSCwwm/NgLQAexp4rMKLvRpNyw26Hv8lO0jCwi/W5u0wnwv8efZ9YSmUyinjX5vmYooHqSzd66bANy/ujBJ0yxWh1jUkZHbuGTdsegNzJsAMVEcYwV8dTNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de; spf=none smtp.mailfrom=h08.hostsharing.net; arc=none smtp.client-ip=83.223.78.240
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=h08.hostsharing.net
Received: from h08.hostsharing.net (h08.hostsharing.net [IPv6:2a01:37:1000::53df:5f1c:0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "*.hostsharing.net", Issuer "RapidSSL TLS RSA CA G1" (verified OK))
	by bmailout2.hostsharing.net (Postfix) with ESMTPS id 562FC200803F;
	Mon, 13 Oct 2025 17:39:17 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id 3E0B44A12; Mon, 13 Oct 2025 17:39:17 +0200 (CEST)
Date: Mon, 13 Oct 2025 17:39:17 +0200
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
Message-ID: <aO0dJeqb9E99xVvD@wunner.de>
References: <20251013114010.28983-2-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251013114010.28983-2-thorsten.blum@linux.dev>

On Mon, Oct 13, 2025 at 01:40:10PM +0200, Thorsten Blum wrote:
> Use check_add_overflow() to guard against potential integer overflows
> when adding the binary blob lengths and the size of an asymmetric_key_id
> structure and return ERR_PTR(-EOVERFLOW) accordingly. This prevents a
> possible buffer overflow when copying data from potentially malicious
> X.509 certificate fields that can be arbitrarily large, such as ASN.1
> INTEGER serial numbers, issuer names, etc.
> 
> Fixes: 7901c1a8effb ("KEYS: Implement binary asymmetric key ID handling")
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>

Reviewed-by: Lukas Wunner <lukas@wunner.de>

