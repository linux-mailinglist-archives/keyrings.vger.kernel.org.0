Return-Path: <keyrings+bounces-2255-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DF0059B05FB
	for <lists+keyrings@lfdr.de>; Fri, 25 Oct 2024 16:38:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9797F1F2403C
	for <lists+keyrings@lfdr.de>; Fri, 25 Oct 2024 14:38:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 043671F80DC;
	Fri, 25 Oct 2024 14:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GprTa6sY"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8BDB21219A;
	Fri, 25 Oct 2024 14:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729867115; cv=none; b=VOQLLwr8E/RHVCXdK04HN3cueGKJh7I3gyxwh3FCumZ1bvsAf6LDRn/lORtS0cVZlsoOVIwGjKWti5lw0/OuRR8UnRQvHfSclXwxsUenwL1B01egkEnyLM6MJhIr4+TCKQvMnkwiPlJDPa9VV6OYgs2HKfbYqBJ9F6PiL04EbvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729867115; c=relaxed/simple;
	bh=x7wWqYTr2jfDDcO8vMIh7tjpwW6QWXTekXTUY1vyvhA=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=H7aF+kQ8aRzkbSEeHCtmEwjGEOG8piiclfTLpBucC9yIELVwfEmoKIeEcIZYuPxUu2SSyU9pYzl9NIn+WazXlo9E/1caCIUi+pER4F/u9Rtum6xagxxeDKZEkM6zl/vVDfH+0hhrtg0vH4Ky3/siop93vbTnZxbdb58PWUE4oto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GprTa6sY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3601C4CEC3;
	Fri, 25 Oct 2024 14:38:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729867115;
	bh=x7wWqYTr2jfDDcO8vMIh7tjpwW6QWXTekXTUY1vyvhA=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=GprTa6sYwLx3Gq9RJ5RtLknGazNywVrvuimh7r8HaGGOpafjIx5E3T0iorfF/zanh
	 Z25BPlDxDshwCPFibHfSBPK44hvleyrH62kGq7sKpBaC7Kt4VkqeKw8EzkOjxGkNfX
	 3rFoKDrEktaBW+3HC4ERpahGtGKjyD7jwU8NjQWnoWiLd3zjpWUMbL1gmaTa1W+yS4
	 NUG7qjI8h36eED11QL39G/yVmuVJOf5IU/gkDs0yg0u64cWw+1avGNIrltpt1yPtTQ
	 d3t3RU+pJfd4UzOPRgxt7uX+fYWdWipGVjMJdEtQEQt5Amo8gBlywt5f3BSbcp2gkS
	 zj0AbDx0hdQAw==
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 25 Oct 2024 17:38:31 +0300
Message-Id: <D54YPO281JW8.SC38DUD3YEQX@kernel.org>
Cc: <keyrings@vger.kernel.org>, <linux-crypto@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] crypto: Remove unused asymmetric_keys functions
From: "Jarkko Sakkinen" <jarkko@kernel.org>
To: <linux@treblig.org>, <dhowells@redhat.com>,
 <herbert@gondor.apana.org.au>, <davem@davemloft.net>
X-Mailer: aerc 0.18.2
References: <20241022002434.302518-1-linux@treblig.org>
In-Reply-To: <20241022002434.302518-1-linux@treblig.org>

On Tue Oct 22, 2024 at 3:24 AM EEST, linux wrote:
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

LGTM, thanks.

Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>

BR, Jarkko

