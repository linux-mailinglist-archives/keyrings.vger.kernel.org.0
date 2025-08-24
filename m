Return-Path: <keyrings+bounces-2980-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 82678B32CA3
	for <lists+keyrings@lfdr.de>; Sun, 24 Aug 2025 02:04:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 26A103A0247
	for <lists+keyrings@lfdr.de>; Sun, 24 Aug 2025 00:04:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6FB6211F;
	Sun, 24 Aug 2025 00:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pA/txsnB"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B621A184E;
	Sun, 24 Aug 2025 00:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755993886; cv=none; b=bO5D5/x4klidB5IhUDuJKiJtSc45fOqxGssqs8Ynio8wyWp4oYTun7xf+irpr242MITz+bDQu48TOoXy5vkQQIGtgoxhgFVzBiJt63aecD3NTGPeRWZHC4ith3KiQPpiI2X0EJmMQm/y1b5j6oB2veKpejhRR+9ITlXhX9Jfiuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755993886; c=relaxed/simple;
	bh=x+mCNRp8xPptPM4wLsx71iWrg0hQPcLojwOfmgMrA0w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MFNaldjKWDGnplsqi5OwnhyeZQGSv8HSQfyqq691kVGUwyMNEgm1DR8oIx64HaH+MRxZ/211AJiLQNo+APWnKyxhHnKE3xwDkImz+aNcpZJ7d6VDf+vHZqpyT2bsY6NsPKGDCPvu7pcLr3S5AP4nGgcZxh0cwR80xHvjP41/jx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pA/txsnB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3269C4CEE7;
	Sun, 24 Aug 2025 00:04:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755993886;
	bh=x+mCNRp8xPptPM4wLsx71iWrg0hQPcLojwOfmgMrA0w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pA/txsnBrWkwc7NGc5i5sBsTpDrwlcsdmuolpEYJ725Ao9Tu4DQd9Dke8pP81recK
	 L9EgUk8T8qma86iYIAlKx22zz0lpsOvPtyI0Ir3e/H67r85jbKu936AW4DakNr4fSl
	 WT5W7ojFZf7JWDuKAbfGyDmiZuCqUUoHmXu3Ui9D5LCbCtx0boq1HBUTrSKwXXVOWZ
	 yxpPuC6qBvipleOrzSTVz2H+tbiFLS6TR/MJsKhiaWlfSRpAglj4aMpk3d+YmSPS1h
	 6XkWw0aj9usFR121dTo7Qf5s8OrMh6Sk0IrvfgbDpb4Eo1h9EN7yJ9LEMyfKNsoq+8
	 WRv7ofRoldYcg==
Date: Sun, 24 Aug 2025 03:04:43 +0300
From: Jarkko Sakkinen <jarkko@kernel.org>
To: David Howells <dhowells@redhat.com>
Cc: keyrings@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/7] request-key: Add a simpler debug test
Message-ID: <aKpXG9jpIsyLYDL7@kernel.org>
References: <20250822142215.2475014-1-dhowells@redhat.com>
 <20250822142215.2475014-7-dhowells@redhat.com>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250822142215.2475014-7-dhowells@redhat.com>

On Fri, Aug 22, 2025 at 03:22:13PM +0100, David Howells wrote:
> Add a simpler debug test to avoid the need to supply all the parameters
> that don't take part in the matching.  This looks like:
> 
> 	request-key --check <type> <desc> [<callout>] [<op>]
> 	request-key --check user debug:bar
> 
> The unspecified parameters are just defaulted.
> 
> Signed-off-by: David Howells <dhowells@redhat.com>

Tested-by: Jarkko Sakkinen <jarkko@kernel.org>
Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>

BR, Jarkko

