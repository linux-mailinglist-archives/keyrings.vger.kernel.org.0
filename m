Return-Path: <keyrings+bounces-3063-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F26AB923F9
	for <lists+keyrings@lfdr.de>; Mon, 22 Sep 2025 18:38:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4F2092A4E6A
	for <lists+keyrings@lfdr.de>; Mon, 22 Sep 2025 16:38:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C95ED3115B8;
	Mon, 22 Sep 2025 16:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q1EFcUXy"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A16DB310645;
	Mon, 22 Sep 2025 16:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758559089; cv=none; b=Dav+X5KEMw9YFxZs3RV/6Ry28JElsrE+TwJTwZ3a7rh4ht3x4siRcrBvVhqvq7U6mVpA+zx+Wuc3OxKORXbDsCD8cfWiU1VCY1VXbNQ8YxYB73jgsBRaqmpV0DaRsRAsX2ISGQGUb6M/p9R6I1ZgMogDkX5o4sp5sKNVqEMdHSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758559089; c=relaxed/simple;
	bh=Os+e4tQ1+o8C90kF/WbtmVLlttUFgf0PteI7dtYBh20=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iKZVbtcaSoETpKKVLAQ1kxQ5YrRPg8fdV2FH+YJcMCRo7WNRIBjklv1AD7l5046/pmto428KTIOE52Pjo7QC+87mYCfZ5pCGdNtZDEBLLxZV8K0gjGSyloADBXjmINPxkb45r969E2UmKbgMlzB7ssXg6r7HOoT0OCACES2Sjwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q1EFcUXy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAF5FC4CEF0;
	Mon, 22 Sep 2025 16:38:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758559089;
	bh=Os+e4tQ1+o8C90kF/WbtmVLlttUFgf0PteI7dtYBh20=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q1EFcUXyzWTZtQEIVWoYWdJRsfny2qvJT5HuA6VZmbJJduatGWsy/haCrs6DohoXr
	 v7stJPrBmp+ntK4R378D/RutfZtrt6NVYLGEKj02+fwnNbBQzQyUJMAqofKHNNB+KV
	 hnLG3/sXf19KZsDqTsW6wC76YZrg04XmOtyOfFfMAys2QhOdOKkgcR2fZmnR1WySE/
	 P7DKbaaUTreem4Tnev+sTpCmjB0wXEztKb3GmwzNvGIClBPhynfIucEL3+Uf8/bwUB
	 ZErmp4pVtDhyg5IR6vW0zY9bjvQT6ipU0safmUiF9+1+i4QDNwth6iVRBzAx7yOz8D
	 0GHFXrat/BvHw==
Date: Mon, 22 Sep 2025 17:38:04 +0100
From: Will Deacon <will@kernel.org>
To: Giuliano Procida <gprocida@google.com>
Cc: dhowells@redhat.com, dwmw2@infradead.org, gregkh@linuxfoundation.org,
	keyrings@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] system certificates: specify byte alignment
Message-ID: <aNF7bMbCLctgZQXq@willie-the-truck>
References: <20250912100015.1267643-1-gprocida@google.com>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250912100015.1267643-1-gprocida@google.com>

On Fri, Sep 12, 2025 at 11:00:15AM +0100, Giuliano Procida wrote:
> The .align macro is architecture dependent. On arm64 it behaves as
> .p2align. The various alignments in this file are all bytes.
> 
> So use the .balign macro to avoid unnecessary padding due to
> over-alignment.
> 
> Signed-off-by: Giuliano Procida <gprocida@google.com>
> ---
>  certs/system_certificates.S | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

Does certs/revocation_certificates.S need fixing as well?

Will

