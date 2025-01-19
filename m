Return-Path: <keyrings+bounces-2360-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C67BFA16036
	for <lists+keyrings@lfdr.de>; Sun, 19 Jan 2025 05:48:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5646F1886732
	for <lists+keyrings@lfdr.de>; Sun, 19 Jan 2025 04:48:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99F5F14A08E;
	Sun, 19 Jan 2025 04:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=hmeau.com header.i=@hmeau.com header.b="BrIvNpRE"
X-Original-To: keyrings@vger.kernel.org
Received: from abb.hmeau.com (abb.hmeau.com [144.6.53.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5F8B29415;
	Sun, 19 Jan 2025 04:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=144.6.53.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737262090; cv=none; b=e3WN8QpeYSJoOSg8dAcQqRcJotdNRDZEJS4LHe+XjJpbQrkvWf1zv5NZkw5WTSPFYka5Uh9Erk+KDPlezwQrGNtqlP8IABLrjcaeWRXCi5zezgPisFFnTMTmaEJdtI7A82r5QBtOEALNSgzCsmUoikk22rRTIe2bC3hkYlAcqeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737262090; c=relaxed/simple;
	bh=uxxXeFjAY6wweLaf4sEgfHVYC2uhY9maODuklTZ8DMk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CVRq7rmBEpQgRPXzdUaJgyfdhTs520/ahN4wKHp3osNXRyQgOX4dIJs1s9hN14Id8q/AIIFNe/sTFECUGiZdbgrBCYyKtQxynS77tHNmwJAMJKE9GAVjeimnavY4pUaHqvIfC6XBfQwtTj8GA91kDDNyrmZk9qIqQ1xIZiPdmMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au; spf=pass smtp.mailfrom=gondor.apana.org.au; dkim=pass (2048-bit key) header.d=hmeau.com header.i=@hmeau.com header.b=BrIvNpRE; arc=none smtp.client-ip=144.6.53.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gondor.apana.org.au
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=V5ENLfs6ADWLzgC23KA+TxlNF+qneYE9AqMACdTLr1I=; b=BrIvNpREVTscdnzeb6wFSS8pWy
	ns8K5WXsf8iBbKqHfDczg6BIWbXx9qpprQVkhOIz8/7FIA3IBiLMWJmFNjBNwn0aofyenXrFX5Z7V
	W5WYX8iOSYjhrE0BHZMPfdGXhcpcPL40aSdPNumCLDfoO4XJ2+M74YXJzVP3jcZLPamqwo/DGvjO8
	ukhI/eZrumgZuQLCrit6YhEO9R4APov6LEzYhqmlj83sDTk3dp7YooRemndo0yb1fb5PHau86RwXX
	23uxE9K4rdsET2dHuWCBET0y3+HQBDtDBhjXmmOFy2m6jm991qTq19GvWXBKjpY/0EsJUpLSdIao4
	497IJmGg==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1tZN1B-00AVZ0-1b;
	Sun, 19 Jan 2025 12:47:59 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Sun, 19 Jan 2025 12:47:58 +0800
Date: Sun, 19 Jan 2025 12:47:58 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: linux@treblig.org
Cc: dhowells@redhat.com, davem@davemloft.net, keyrings@vger.kernel.org,
	linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] crypto: asymmetric_keys - Remove unused
 key_being_used_for[]
Message-ID: <Z4yD_uQAaYlPfifn@gondor.apana.org.au>
References: <20250112163059.467573-1-linux@treblig.org>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250112163059.467573-1-linux@treblig.org>

On Sun, Jan 12, 2025 at 04:30:59PM +0000, linux@treblig.org wrote:
> From: "Dr. David Alan Gilbert" <linux@treblig.org>
> 
> key_being_used_for[] is an unused array of textual names for
> the elements of the enum key_being_used_for.  It was added in 2015 by
> commit 99db44350672 ("PKCS#7: Appropriately restrict authenticated
> attributes and content type")
> 
> Remove it.
> 
> Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
> ---
>  crypto/asymmetric_keys/asymmetric_type.c | 10 ----------
>  include/linux/verification.h             |  2 --
>  2 files changed, 12 deletions(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

