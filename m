Return-Path: <keyrings+bounces-989-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C5D78878E8
	for <lists+keyrings@lfdr.de>; Sat, 23 Mar 2024 14:51:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 31B37283D86
	for <lists+keyrings@lfdr.de>; Sat, 23 Mar 2024 13:51:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC09C1EB5B;
	Sat, 23 Mar 2024 13:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mbosch.me header.i=@mbosch.me header.b="dlChNiqe"
X-Original-To: keyrings@vger.kernel.org
Received: from mail.mbosch.me (mail.mbosch.me [65.21.144.185])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0889E1B95C
	for <keyrings@vger.kernel.org>; Sat, 23 Mar 2024 13:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.21.144.185
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711201879; cv=none; b=TzJDqYleSurQ8CCz34cnSvfBV6iLHJyDh912FFQQLdAsuHtAb5pdvvLMv2qQJtyji5eLo9v1+MfiDsoGNJLmvXclUyhnCYHjfDAcJqTNiFTLYgso61vWmGPMc/TlVaoOf033tTt3DDk1sCQHTywktSK4b/bJAufsubfQ+4zlAo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711201879; c=relaxed/simple;
	bh=C3XdIZPF/5jg6exg+lgbigcUBBcElpD3YgItxjB2loo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l+BestCNjeFwsTCgdoz1498hwSe+4aApcRd6ivLBaAVwF8W0Zzhn1PEWnGuvNRvExv1MGbecQRpLb/IinzDQjheu6SMJzuItmk0B9P2JLUv1FDX96BI7hxMGR03yZfkv3vtIIAZhHMnaXNPm+Jvjbpe74i3ml/KYxc+60Y5OD9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mbosch.me; spf=pass smtp.mailfrom=mbosch.me; dkim=pass (1024-bit key) header.d=mbosch.me header.i=@mbosch.me header.b=dlChNiqe; arc=none smtp.client-ip=65.21.144.185
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mbosch.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mbosch.me
Date: Sat, 23 Mar 2024 14:44:06 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mbosch.me; s=mail;
	t=1711201447; bh=C3XdIZPF/5jg6exg+lgbigcUBBcElpD3YgItxjB2loo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dlChNiqeXLGjg/04bjxkYKXQZdIZEsLpTj7cmEsnpPCPKYTC6h3LJju0HkwLxRKai
	 W7kMPyzME2vVoI5afsNsh3qy143w6GaK++8mOQQFmTIuFRKHc1N0yx92kdjyV9s0t9
	 IM9t8GysYAvMgr++L0/mIXSaa8Iu3uzDMDbPxq/I=
From: Maximilian Bosch <maximilian@mbosch.me>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: Linus Heckemann <linus@schreibt.jetzt>, keyrings@vger.kernel.org
Subject: Re: Allowing empty keys? or: setting attributes on keys safely
Message-ID: <pvifchlk2bxk4o5tpucvh2n5evmbhhcc7ok6dmxi2jogqd6oxo@rozgfpgmebpr>
References: <ygar0hbrm05.fsf@localhost>
 <CZ9B2PLX5VZS.1GPZ6W2K9UVV5@seitikki>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CZ9B2PLX5VZS.1GPZ6W2K9UVV5@seitikki>

Hi!

> Something prevents you setting invalid payload first, and appropriate
> one later with keyctl_update?

When I look at the implementation of `key_update`[1], it seems as if the
expiry is reset. Is there any way I'm missing which allows me to either
atomically create a key in a keyring with a timeout or to update a key
while retaining the timeout?

Cheers!

Max / ma27

[1] https://github.com/torvalds/linux/blob/v6.8/security/keys/key.c#L1083

