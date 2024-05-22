Return-Path: <keyrings+bounces-1391-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E5AE8CBF04
	for <lists+keyrings@lfdr.de>; Wed, 22 May 2024 12:09:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9E1E91C2156C
	for <lists+keyrings@lfdr.de>; Wed, 22 May 2024 10:09:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 570F281AB7;
	Wed, 22 May 2024 10:09:55 +0000 (UTC)
X-Original-To: keyrings@vger.kernel.org
Received: from bmailout1.hostsharing.net (bmailout1.hostsharing.net [83.223.95.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1A021CD13;
	Wed, 22 May 2024 10:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=83.223.95.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716372595; cv=none; b=b+56xX6SQHaRqu5cDMbpgZMjXoKpH8GohqGjhai5BY8h1wPaTTNmyuq+7UxpLukPwy+GrdZ2aamKYqHpR134G+TiooCpGfkb40mRPc360eNfYVGYJLZS+OXBbnnLn2AOpGRF48Z+BG749nY/WP8Y2MDZtXStbfQKps0XGtKRdY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716372595; c=relaxed/simple;
	bh=MGaEax+OAxHF7CuQ1K04zDUYjYQwNLeO0Fvn7PYBV7U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WoJf8yPad06ssRzz+46+ge8H892kvNWaUb3Soq11TF7ud26nB12DVGUIURFw6ARFdWjwxWL/jUjjuTL/btv+UM5fxhyD/mEcoguDydjgO2c548irCbDGsR9ua2r+PMk2ypc5RO7EYj8MPnDTtIT0jibvK7u4vtKoWVo9ywU1axw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de; spf=none smtp.mailfrom=h08.hostsharing.net; arc=none smtp.client-ip=83.223.95.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=h08.hostsharing.net
Received: from h08.hostsharing.net (h08.hostsharing.net [IPv6:2a01:37:1000::53df:5f1c:0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "*.hostsharing.net", Issuer "RapidSSL TLS RSA CA G1" (verified OK))
	by bmailout1.hostsharing.net (Postfix) with ESMTPS id 6A0C8300000A6;
	Wed, 22 May 2024 12:09:42 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id 624716FAE90; Wed, 22 May 2024 12:09:42 +0200 (CEST)
Date: Wed, 22 May 2024 12:09:42 +0200
From: Lukas Wunner <lukas@wunner.de>
To: Stefan Berger <stefanb@linux.ibm.com>
Cc: keyrings@vger.kernel.org, linux-crypto@vger.kernel.org,
	herbert@gondor.apana.org.au, davem@davemloft.net,
	linux-kernel@vger.kernel.org, jarkko@kernel.org
Subject: Re: [REPOST PATCH v3] crypto: ecc - Prevent ecc_digits_from_bytes
 from reading too many bytes
Message-ID: <Zk3EZqQcMYKiDvhC@wunner.de>
References: <20240521225006.207084-1-stefanb@linux.ibm.com>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240521225006.207084-1-stefanb@linux.ibm.com>

On Tue, May 21, 2024 at 06:50:06PM -0400, Stefan Berger wrote:
> Prevent ecc_digits_from_bytes from reading too many bytes from the input
> byte array in case an insufficient number of bytes is provided to fill the
> output digit array of ndigits. Therefore, initialize the most significant
> digits with 0 to avoid trying to read too many bytes later on. Convert the
> function into a regular function since it is getting too big for an inline
> function.
> 
> If too many bytes are provided on the input byte array the extra bytes
> are ignored since the input variable 'ndigits' limits the number of digits
> that will be filled.
> 
> Fixes: d67c96fb97b5 ("crypto: ecdsa - Convert byte arrays with key coordinates to digits")
> Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>
> Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
> 
> ---
> v3:
>  - Applied Jarkko's tag

Already landed in Linus' tree 42 hours ago -- with Jarkko's tag:

https://git.kernel.org/linus/568c98a0f6ef

