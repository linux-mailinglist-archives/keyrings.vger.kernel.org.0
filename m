Return-Path: <keyrings+bounces-3072-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9197FB9524E
	for <lists+keyrings@lfdr.de>; Tue, 23 Sep 2025 11:08:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AFADD44689E
	for <lists+keyrings@lfdr.de>; Tue, 23 Sep 2025 09:08:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33F2A31E89D;
	Tue, 23 Sep 2025 09:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WjNF5VRS"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C32E31A04F;
	Tue, 23 Sep 2025 09:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758618492; cv=none; b=DJK6bntn4Wrf8X8mHans7YOxXXuy4wX8jA8mkfEhYv3zribtNQrE+Yl2S3Fs3YLJmG/FhPaUsPk0+VxuYf2UVen/kurJ4Ty/pGfY2TtqjW9dpsNALeYaJeikXcIzyV3SfyPY4WdpKtxvPcGyKWM9Vm5YtfIPeNlK6L/ALadhltc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758618492; c=relaxed/simple;
	bh=kcedW8uu5GsDDGSmTz1vpHl2B2Qn+rYWq9Un8lX7oI0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i8mR7yc3IPvycH+UjwrDk5bCAfPhyiZ9tW7d1/AwLJ+REb7bYAbrAwm53JWqdv5PKQmVSEEIYrhNB8LquCts7+6asABDkiAatJcxJgmrWsrJFivrqkY/Lh74qcneSiN9yPNkc4fhaqKh8/O9CJkkx9EfgRkXIs7PvH1Ohw0dPlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WjNF5VRS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DAA0C4CEF5;
	Tue, 23 Sep 2025 09:08:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758618491;
	bh=kcedW8uu5GsDDGSmTz1vpHl2B2Qn+rYWq9Un8lX7oI0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WjNF5VRSzL2PM7NKbSn82nbEzNnpR8qgkhlgMOBmynY5IDHbYv0ebQFHwxzEbZfMQ
	 Z3sROCQxzbw6Qr1afHPLna+dZ4BY0KYacL7Q1w39IS7dwSuXg06PhM4pdyV9SqonKm
	 qgXetqCj5YXRWvwqUL1iVhn2w7WOaieJEaE4o1inW174bNEEFN6dTkBKkngwykow0L
	 Lc+Tb81R1iKiTyqQ9EWtrechiRZ8aRJ8LjhhrhkH31V7QRcbIqMVkosWwJv/WZ06D9
	 v7JjJDPefoKK23icUkhj5SnbkuZDPkGZzmNFNx53nvmorkIyMGC5ctexive9XDhAWz
	 YxGgrtJu1KrTg==
Date: Tue, 23 Sep 2025 10:08:07 +0100
From: Will Deacon <will@kernel.org>
To: Giuliano Procida <gprocida@google.com>
Cc: dhowells@redhat.com, dwmw2@infradead.org, gregkh@linuxfoundation.org,
	keyrings@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] certs: specify byte alignment
Message-ID: <aNJjdzrkvfDm2SsK@willie-the-truck>
References: <20250912100015.1267643-1-gprocida@google.com>
 <20250923081344.1657783-1-gprocida@google.com>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250923081344.1657783-1-gprocida@google.com>

On Tue, Sep 23, 2025 at 09:13:42AM +0100, Giuliano Procida wrote:
> The alignments specified in system_certificates.S and
> revocation_certificates.S are intended to be byte quantities.
> 
> However, the .align macro is architecture dependent and on arm64 it
> behaves as .p2align. So use the .balign macro to avoid unnecessary
> padding due to over-alignment.
> 
> Signed-off-by: Giuliano Procida <gprocida@google.com>
> ---
>  certs/revocation_certificates.S | 4 ++--
>  certs/system_certificates.S     | 8 ++++----
>  2 files changed, 6 insertions(+), 6 deletions(-)

Acked-by: Will Deacon <will@kernel.org>

Will

