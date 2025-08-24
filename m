Return-Path: <keyrings+bounces-2981-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D7EFAB32CA6
	for <lists+keyrings@lfdr.de>; Sun, 24 Aug 2025 02:06:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A0B08188EED1
	for <lists+keyrings@lfdr.de>; Sun, 24 Aug 2025 00:05:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C60FA41;
	Sun, 24 Aug 2025 00:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DFljkkm5"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43B3536B;
	Sun, 24 Aug 2025 00:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755993919; cv=none; b=Gc53um7f1u4ZpheB9dyTxpT2YXVBl7oI/WLylQiHFxRivIsRGCxW8APVU+bTDCipr18U+SWJ8zXIh20vv2VCm2QZ/WZdW1Aq54A96gGy3MLy0rcpnx8EjsGPLIiykiEiA2X1MUlqOwr7mVAyfVIm6t0/BDISJFjb99IUniNb9eo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755993919; c=relaxed/simple;
	bh=IKoB0+d+FEdPjt7GndniHX8cgIQomggUIPUshViHYks=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LEb0qLMFvm6glr3mSKf/uf6vqHQbF64981AAgxN4X5W7t70aqP3IYOyEnGy+IUJpwFf1qVRRVL3au9Bm4rKbBvwbAb3cG0t1FO9P/AJrPwcypGxhowyTT+Vqb66SH/P+ul/lKCcZ56qBKMg78gEqh2bek1nruYZmTGKLdPpqtWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DFljkkm5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6392BC4CEE7;
	Sun, 24 Aug 2025 00:05:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755993915;
	bh=IKoB0+d+FEdPjt7GndniHX8cgIQomggUIPUshViHYks=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DFljkkm5GO5nccLP3q7aDUnlkeKGNyWClGvJHqIztzxvUCAN0jrtQwJfTTm2/ZQLK
	 rneD2BgIlzFSUJHR4VrHBBjHKVqWE2V/YQJPwOsyODHsvLITnfIPeGj53ZUUEd65jL
	 fkxdS4JR9Mo9b4LNJX52cUh6wDEUvTpMscFL/ehg7CD43+K91Sfo7QiRyvIIn/Yx4Q
	 /pQAHAvs7xO0+uagajR8s3rGbjMF7o+a0XS4egnepfVG5KCdjl85leZXIqEZSuKvxh
	 snE8pJ3WK+Gjt8y/UmOjTecfRSPSyyG6ELR/dK0Hdutkf/1Tw/DGKydoSr/BkCW5wf
	 AOltbBNqvJI/g==
Date: Sun, 24 Aug 2025 03:05:12 +0300
From: Jarkko Sakkinen <jarkko@kernel.org>
To: David Howells <dhowells@redhat.com>
Cc: keyrings@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 7/7] request-key: Support the promised multiwildcard
 matching
Message-ID: <aKpXONemtv0AUllZ@kernel.org>
References: <20250822142215.2475014-1-dhowells@redhat.com>
 <20250822142215.2475014-8-dhowells@redhat.com>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250822142215.2475014-8-dhowells@redhat.com>

On Fri, Aug 22, 2025 at 03:22:14PM +0100, David Howells wrote:
> The manual page for request-key.conf says that multiple wildcards can be
> used in match elements in the config files, so implement this feature.
> 
> Also add a flag, "--test-match", to allow that match function to be tested
> directly, e.g.:
> 
>   request-key --test-match "**a*a***i**a**a**" antidisestablishmentarianism
> 
> Signed-off-by: David Howells <dhowells@redhat.com>
 
Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>

BR, Jarkko

