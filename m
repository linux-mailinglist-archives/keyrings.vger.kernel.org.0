Return-Path: <keyrings+bounces-2281-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 82CEA9B9EE1
	for <lists+keyrings@lfdr.de>; Sat,  2 Nov 2024 11:26:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D4F3EB21224
	for <lists+keyrings@lfdr.de>; Sat,  2 Nov 2024 10:26:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5011B167271;
	Sat,  2 Nov 2024 10:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=hmeau.com header.i=@hmeau.com header.b="p5bx78RB"
X-Original-To: keyrings@vger.kernel.org
Received: from abb.hmeau.com (abb.hmeau.com [144.6.53.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82D3B45016;
	Sat,  2 Nov 2024 10:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=144.6.53.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730543184; cv=none; b=YdLRtSiAjOdSCx7MRsPSFkueNjLmBeQTDTtDcYnoaNic1UgkT+0cjhoxaNjjudQOcReN9gtBfEIRQIMIwm8RDIFJ2k6271qHAC5vchI2dml3da2dWE0v8+6PtfRVwkkJWEGoPt/8/yl5E/KbRUGVawa2EFRXiFAGODONfzDvcjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730543184; c=relaxed/simple;
	bh=f8PjuYvrzEB3MF1hnJZGrRAYnde8xaXmbcNQE82ulI0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E5tHzY9ceV1bUtGQqoqalVdmmzJdyGG0kW1ljXBZ2O42GlV1tcYEUhbfbbwsoKX4KZD6c7d10Ezl2B6lGB+PypnmdVLyWEKui08CCUHlOsSHLn89ckUtLXJm9hLtFeOaK9EJ7c1g5BLppi9VqSNm/J+phkVzxh9UhNaSf8IDbJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au; spf=pass smtp.mailfrom=gondor.apana.org.au; dkim=pass (2048-bit key) header.d=hmeau.com header.i=@hmeau.com header.b=p5bx78RB; arc=none smtp.client-ip=144.6.53.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gondor.apana.org.au
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=GzhWJI53zcevRptpADxFjb3z9xCPDutVkIxZtRknggc=; b=p5bx78RBPvmt82KTNtXk8fVADm
	NXNg6dvjpufZrIZGKQUfklsjX76dXKv1THnSMh1Ovhan0Z7osx7QV1erz9RBh9rG8FHWjLkzXCcGk
	7rnApOFg+VqSM6zHwYqw40V29u4Bu5wh1BPT/bVvF+hreQN0pjz++pX8RwqswmZf/HUBGoaXWl2uq
	ZADXf5pZT/C/i/6CDyx6uDHUT2R8FSztq7ND26FuJ8gare2rFAfaUJ7SG5ZewE/qtWozxlQKi3KX6
	AFsPPNUdHMp+U/YiP9N77uSguWPFtc9z5RxGczx70w4YFvMlXVGiiSf3IuoF7SkYRtTApjrcTmN2f
	J5wA5kLA==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1t7BKc-00Dy2n-02;
	Sat, 02 Nov 2024 18:26:11 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Sat, 02 Nov 2024 18:26:10 +0800
Date: Sat, 2 Nov 2024 18:26:10 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: linux@treblig.org
Cc: dhowells@redhat.com, davem@davemloft.net, keyrings@vger.kernel.org,
	linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] crypto: Remove unused asymmetric_keys functions
Message-ID: <ZyX-QjQtdfKBBexi@gondor.apana.org.au>
References: <20241022002434.302518-1-linux@treblig.org>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241022002434.302518-1-linux@treblig.org>

On Tue, Oct 22, 2024 at 01:24:34AM +0100, linux@treblig.org wrote:
> From: "Dr. David Alan Gilbert" <linux@treblig.org>
> 
> encrypt_blob(), decrypt_blob() and create_signature() were some of the
> functions added in 2018 by
> commit 5a30771832aa ("KEYS: Provide missing asymmetric key subops for new
> key type ops [ver #2]")
> however, they've not been used.
> 
> Remove them.
> 
> Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
> ---
>  crypto/asymmetric_keys/signature.c | 63 ------------------------------
>  include/crypto/public_key.h        |  3 --
>  2 files changed, 66 deletions(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

