Return-Path: <keyrings+bounces-1522-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5686C8D44AD
	for <lists+keyrings@lfdr.de>; Thu, 30 May 2024 07:08:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ADD78284E31
	for <lists+keyrings@lfdr.de>; Thu, 30 May 2024 05:08:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C008714389C;
	Thu, 30 May 2024 05:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Glcw5yIo"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DC632BD0F;
	Thu, 30 May 2024 05:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717045708; cv=none; b=L3VOd8EoXIop0T6bkpL/mNtkcNhj9937DSE6/zTJFgaHUrpfUWcGxRvTnRxY6dN5S0TDt0DnwcrXbMxO8Zya1gIOuHN/faRygsNyHsLQDNVw+DiD4WxXo3ME5kWmS4l1flkXy6kIrL8whSH/ev0Tuzh/wsgkOY1S9U8U+XUip9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717045708; c=relaxed/simple;
	bh=gBDuLudmfbZqPlaV0ny+HEdAMRPxPbpiX0rPhaTiNrA=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=Zhew+zYfi/WuJqTcFJMO8WNvlC4kul4o+47VtZkaa/Sa0j6lDVEZN21dWPFU+zjlVycA/mXCLnf5sMYgawTiv4VfsBYYBNipOS0WZUWVqaLrNLtXjK8hkuTnTGHkJ6WavwAElOk4E3IhCu7+dGHgi9OusqquYjfSUDn9qIfCPpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Glcw5yIo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3789C2BBFC;
	Thu, 30 May 2024 05:08:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717045708;
	bh=gBDuLudmfbZqPlaV0ny+HEdAMRPxPbpiX0rPhaTiNrA=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=Glcw5yIo6MMcWYrzrdTrjkd414NngIclvaDqVWtkot9kMBN4WOCe2Srlm6IUPHuDO
	 IZLaij8L3CPCUye/e1nYu5RfUx+g7BD8SmGuxJmP8tMjrp/2yrT8xRZJoHLeJ/OadO
	 OLuYAgFj+GkDjZwDjt+jaPfGBs1iyI6A+yDFDFakdxigEtwXggfhoE2GdXkJn8ZgFB
	 LxifjrHRZ78ck0v+t5Q5eUbcdS9EsIsw2kbn6EWwWoohyNphIR8yT7m44mNjO3o+iB
	 Exf68EdfLJrE/Ozy9cKlPPsZ5sV9/zrKfQKOEemzfY43heMMaXUBvLpOA2uXzYNz2I
	 KnWgBlkqOqVFg==
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 30 May 2024 08:08:22 +0300
Message-Id: <D1MPWI6C2ZCW.F08I9ILD63L4@kernel.org>
Cc: <linux-kernel@vger.kernel.org>, <lukas@wunner.de>
Subject: Re: [PATCH 0/2] ecdsa: Use ecc_digits_from_bytes to simplify code
From: "Jarkko Sakkinen" <jarkko@kernel.org>
To: "Stefan Berger" <stefanb@linux.ibm.com>, <keyrings@vger.kernel.org>,
 <linux-crypto@vger.kernel.org>, <herbert@gondor.apana.org.au>,
 <davem@davemloft.net>
X-Mailer: aerc 0.17.0
References: <20240529230827.379111-1-stefanb@linux.ibm.com>
In-Reply-To: <20240529230827.379111-1-stefanb@linux.ibm.com>

On Thu May 30, 2024 at 2:08 AM EEST, Stefan Berger wrote:
> Simplify two functions that were using temporary byte arrays for
> converting too-short input byte arrays to digits. Use ecc_digits_from_byt=
es
> since this function can now handle an input byte array that provides
> less bytes than what a coordinate of a curve requires - the function
> provides zeros for the missing (leading) bytes.
>
> See: c6ab5c915da4 ("crypto: ecc - Prevent ecc_digits_from_bytes from read=
ing too many bytes")
>
> Regards,
>    Stefan
>
> Stefan Berger (2):
>   crypto: ecdsa - Use ecc_digits_from_bytes to create hash digits array
>   crypto: ecdsa - Use ecc_digits_from_bytes to convert signature
>
>  crypto/ecdsa.c | 29 ++++++-----------------------
>  1 file changed, 6 insertions(+), 23 deletions(-)

BTW, would it make sense split ecdsa signature encoding to its own patch
in my next patch set version and name it ecdsa_* style and put it to
ecdsa.c?

Just asking this because the part should be the same same for any ECDSA
signature. It must scale also to all NIST variants before my patch set
can land.

BR, Jarkko

