Return-Path: <keyrings+bounces-1185-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BF788C1F74
	for <lists+keyrings@lfdr.de>; Fri, 10 May 2024 10:08:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 44BA61F2218F
	for <lists+keyrings@lfdr.de>; Fri, 10 May 2024 08:08:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3691815F3F1;
	Fri, 10 May 2024 08:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lziRbQkx"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 056D215F301;
	Fri, 10 May 2024 08:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715328527; cv=none; b=DR3hIkbmL9/Fgyo4sGBsKY/kvBdAcsXO8rzkGN1fzu170jOVXzlgdYj7ZKUwFGJ9dobMTMCj5+o88MrJq+86mbq4efm7JtY/urLBWhRwgPem/gmKLyU8EdAp/n0AdeJ3fe7bi6B+WqKltIL2FAcvobrhnR4Ey3/H7jQTMm/AehM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715328527; c=relaxed/simple;
	bh=/ApmeYDDAk+7joyT9QAfro3+bN4u7mRVnwE230NWwkU=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=QS7oYvEDDaemApHX7bD896kmTkr/ZKixeQXt/fKiw5DYqSHn4Efv4v4Iu4m/x+ft30VbNSRRpvbFDJSDFz373gRkcPZSTQkhuSJht/90EHvLNJfUuzgRr1QGCYzPfUBMk730dxRFlYGXVL/WfdkmFCx7VyUyZhp70BjzwGu15Zw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lziRbQkx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBF2EC113CC;
	Fri, 10 May 2024 08:08:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715328526;
	bh=/ApmeYDDAk+7joyT9QAfro3+bN4u7mRVnwE230NWwkU=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=lziRbQkxssP9Cc+0P7e7L/uHMJhnXbHoSGxO8KJTyxj/LuMVNQcz84oBn4+G4KSYh
	 M6X++JAiy7pP4y5ZVjUU1oXxVBesPR5c2kbOXfJ/8a6MLVIQDqEKIt/gXqa+yotI7d
	 tv0cVRSEec9CEOZTC7V8UT2Ma/xlBxvHxFA09RMEH7+UnDzgJuCP0j4DzDE16Cyqqt
	 SQ3uxSno63m5k6l5JEURmBD74nDv3550d5aC7pyR0jS47NLHnHgD4XLoal9tpqUjfZ
	 hsUVhBD0wi3OQzpqIL51RmX/zh01XgSB6W9OKEvezhaq2RqrLQKIMaOeeczvGP5buY
	 QId5DUnBSmz0A==
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 10 May 2024 11:08:42 +0300
Message-Id: <D15T7OSYSX5S.3G35QSFEIHU8F@kernel.org>
Cc: <linux-kernel@vger.kernel.org>, <lukas@wunner.de>
Subject: Re: [PATCH v3] crypto: ecc - Prevent ecc_digits_from_bytes from
 reading too many bytes
From: "Jarkko Sakkinen" <jarkko@kernel.org>
To: "Stefan Berger" <stefanb@linux.ibm.com>, <keyrings@vger.kernel.org>,
 <linux-crypto@vger.kernel.org>, <herbert@gondor.apana.org.au>,
 <davem@davemloft.net>
X-Mailer: aerc 0.17.0
References: <20240510015921.179175-1-stefanb@linux.ibm.com>
In-Reply-To: <20240510015921.179175-1-stefanb@linux.ibm.com>

On Fri May 10, 2024 at 4:59 AM EEST, Stefan Berger wrote:
> +		memcpy((u8 *)&msd + sizeof(msd) - o, in, o);

Not a review/NAK comment but I personally prefer to treat these
like arrays:

&((u8 *)&msd)[sizeof(msd) - o]

It is totally fine as it is.

BR, Jarkko

