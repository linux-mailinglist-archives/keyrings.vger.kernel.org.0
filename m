Return-Path: <keyrings+bounces-1619-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 10AD3909BBE
	for <lists+keyrings@lfdr.de>; Sun, 16 Jun 2024 08:05:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AAC021F21E10
	for <lists+keyrings@lfdr.de>; Sun, 16 Jun 2024 06:05:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3104E16C866;
	Sun, 16 Jun 2024 06:05:42 +0000 (UTC)
X-Original-To: keyrings@vger.kernel.org
Received: from abb.hmeau.com (abb.hmeau.com [144.6.53.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2589AC125;
	Sun, 16 Jun 2024 06:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=144.6.53.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718517942; cv=none; b=TdGh2fe3B89CTcp+9Ags9SMctq+Ffl4tmwWzmncDnmljAl3g1Qs0Nll8vLqtAyXhFH8IKWqrfcVzX6lFOZ/7yIGvgDpthkisDcnYCb4SH3BqDKqN9JDjA8MBU0Ov3RCiyi7G0XT0qtgOqdOKobAJuzmRgsGezcGAQNyb8itHPhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718517942; c=relaxed/simple;
	bh=TYhyyaikfKTnql4Pt8mbERkKDmEbb6R3jq074BeyZ78=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g1+xBQPvg8uYKIRqOJp7XBNRTPSSUqebxhd6FlkRuNxilaoczYKAqQL+/HSn+trH/4ebDBp53tUyg/NiwdWHnThCtEAMqw/w0s9kz8+zPMSLK1awzlDLgycXOv5mubfsk2J0CbNen5i+wm8RRDzwh2vaASIABzLJK8V/wRPFnX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au; spf=pass smtp.mailfrom=gondor.apana.org.au; arc=none smtp.client-ip=144.6.53.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gondor.apana.org.au
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1sIiu8-000aOl-1E;
	Sun, 16 Jun 2024 13:58:17 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Sun, 16 Jun 2024 13:58:16 +0800
Date: Sun, 16 Jun 2024 13:58:16 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Stefan Berger <stefanb@linux.ibm.com>
Cc: keyrings@vger.kernel.org, linux-crypto@vger.kernel.org,
	davem@davemloft.net, linux-kernel@vger.kernel.org,
	jarkko@kernel.org
Subject: Re: [PATCH] crypto: ecc - Add comment to ecc_digits_from_bytes about
 input byte array
Message-ID: <Zm5--MASqjglXz1B@gondor.apana.org.au>
References: <20240607223417.587821-1-stefanb@linux.ibm.com>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240607223417.587821-1-stefanb@linux.ibm.com>

On Fri, Jun 07, 2024 at 06:34:17PM -0400, Stefan Berger wrote:
> Add comment to ecc_digits_from_bytes kdoc that the first byte is expected
> to hold the most significant bits of the large integer that is converted
> into an array of digits.
> 
> Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
> ---
>  include/crypto/internal/ecc.h | 3 +++
>  1 file changed, 3 insertions(+)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

