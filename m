Return-Path: <keyrings+bounces-2407-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ACBBA38916
	for <lists+keyrings@lfdr.de>; Mon, 17 Feb 2025 17:27:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CD8DD3AA448
	for <lists+keyrings@lfdr.de>; Mon, 17 Feb 2025 16:27:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E615A224B08;
	Mon, 17 Feb 2025 16:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eoLaeHa0"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C23272248B6
	for <keyrings@vger.kernel.org>; Mon, 17 Feb 2025 16:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739809642; cv=none; b=GvsCuA3dZFN/nutzAa8a/nn0UqYkfNpEPZpIJ6nlLx45/ohbZ0YN2wPpRo6fIA3UECUQt66j3f2GmyzOP85evdoWJ7qxYkgSIfvk3wSiHMr91zaKoiuUfQDcXmGyy3JI3Oh5Fm1HK2vRGUED/Nn0dr9yUtQD4aCl6g0X1SLhwNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739809642; c=relaxed/simple;
	bh=ln23ovePyjY47znpVaHvjUEIhanxseKF5hqx4EQcRPU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SNJ4yEKHzR7SBIGIkIhujFKzFxRvTufh9mNaynJlHtx8+3Ezdr7srzPDA/PVLz2DKjZUDZ2shz6u1dNYWsl/Wz5Mgxbx4ifQG01sJ15qsCzjhisE9VUVABpcEaVrbVms0OEsgbsDigKSOrzx58sumRTZiZGLoXGHe/kb1Lv36BI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eoLaeHa0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A53D0C4CED1;
	Mon, 17 Feb 2025 16:27:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739809642;
	bh=ln23ovePyjY47znpVaHvjUEIhanxseKF5hqx4EQcRPU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eoLaeHa0hToo/3VyrHr2XO+qG7lTt6LaKiGRlYYR6LAQnrf0GokV2bBbktcfwLOay
	 po3H1rs9HLaWygVO2t2/zCEU1NXl2+IdL8SlUd2LBjh0X68LjPFhrxLToAWKfgkAos
	 WETHxwPdz4eKLHxIgCyWF5GZnZlRDoHHFO3q6mp0zBP3HCEQxfsk+VtFcY84qRmu7q
	 2cMP2hoJe5fmHTwbJDl/P1fXVKigy/YAcj9RQsqSlCIUGMBabxw7dMeULzV2SS98vP
	 CcpJpEYtEbb6Yxd+hN5MzgTL0P0trVpNrZ2VQ0Zwi5Awdf0B3O+BX8WDEcV2TtjAft
	 6IM6KeuOpsVXQ==
Date: Mon, 17 Feb 2025 18:27:17 +0200
From: Jarkko Sakkinen <jarkko@kernel.org>
To: Hazem Mohamed Abuelfotoh <abuehaze@amazon.com>
Cc: dhowells@redhat.com, keyrings@vger.kernel.org, benh@amazon.com,
	ptyadav@amazon.com
Subject: Re: [PATCH] Pass "err" argument by address to "_nsError" function
Message-ID: <Z7NjZTjRZSt3pmZh@kernel.org>
References: <20250217005452.4873-1-abuehaze@amazon.com>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250217005452.4873-1-abuehaze@amazon.com>

On Mon, Feb 17, 2025 at 12:54:52AM +0000, Hazem Mohamed Abuelfotoh wrote:
> Commit 0d71523ab584 (“DNS: Support AFS SRV records and
> cell db config files”) has refactored the "nsError" function
> by moving some of error handling to "_nsError" function
> however we are passing the "err" argument to "_nsError"
> by value not by address which is wrong as that basically
> waste any processing we do in the "_nsError" function
> so correcting that by passing "err" by address.
> 
> Reported-by: Pratyush Yadav <ptyadav@amazon.com>
> Signed-off-by: Hazem Mohamed Abuelfotoh <abuehaze@amazon.com>
> ---
>  dns.afsdb.c        |  4 ++--
>  key.dns.h          |  2 +-
>  key.dns_resolver.c | 20 ++++++++++----------
>  3 files changed, 13 insertions(+), 13 deletions(-)
> 
> diff --git a/dns.afsdb.c b/dns.afsdb.c
> index 986c0f3..7bffb60 100644
> --- a/dns.afsdb.c
> +++ b/dns.afsdb.c
> @@ -228,7 +228,7 @@ static int dns_query_AFSDB(const char *cell)
>  
>  	if (response_len < 0) {
>  		/* negative result */
> -		_nsError(h_errno, cell);
> +		_nsError(&h_errno, cell);
>  		return -1;
>  	}
>  
> @@ -267,7 +267,7 @@ static int dns_query_VL_SRV(const char *cell)
>  
>  	if (response_len < 0) {
>  		/* negative result */
> -		_nsError(h_errno, cell);
> +		_nsError(&h_errno, cell);
>  		return -1;
>  	}
>  
> diff --git a/key.dns.h b/key.dns.h
> index 33d0ab3..2fedbc3 100644
> --- a/key.dns.h
> +++ b/key.dns.h
> @@ -59,7 +59,7 @@ extern __attribute__((format(printf, 1, 2)))
>  void info(const char *fmt, ...);
>  extern __attribute__((noreturn))
>  void nsError(int err, const char *domain);
> -extern void _nsError(int err, const char *domain);
> +extern void _nsError(int *err, const char *domain);

Why a function declaration need extern anyway?

You could do w/o.

>  extern __attribute__((format(printf, 1, 2)))
>  void debug(const char *fmt, ...);
>  
> diff --git a/key.dns_resolver.c b/key.dns_resolver.c
> index 7a7ec42..6b16427 100644
> --- a/key.dns_resolver.c
> +++ b/key.dns_resolver.c
> @@ -157,19 +157,20 @@ static const int ns_errno_map[] = {
>  	[NO_DATA]		= ENODATA,
>  };
>  
> -void _nsError(int err, const char *domain)
> +void _nsError(int *err, const char *domain)
>  {
>  	if (isatty(2))
> -		fprintf(stderr, "NS:%s: %s.\n", domain, hstrerror(err));
> +		fprintf(stderr, "NS:%s: %s.\n", domain, hstrerror(*err));
>  	else
> -		syslog(LOG_INFO, "%s: %s", domain, hstrerror(err));
> +		syslog(LOG_INFO, "%s: %s", domain, hstrerror(*err));
>  
> -	if (err >= sizeof(ns_errno_map) / sizeof(ns_errno_map[0]))
> -		err = ECONNREFUSED;
> -	else
> -		err = ns_errno_map[err];
> +	if (*err >= sizeof(ns_errno_map) / sizeof(ns_errno_map[0]))
> +		*err = ECONNREFUSED;
> +	else{
> +		*err = ns_errno_map[*err];
> +	}
>  
> -	info("Reject the key with error %d", err);
> +	info("Reject the key with error %d", *err);
>  }
>  
>  void nsError(int err, const char *domain)
> @@ -177,8 +178,7 @@ void nsError(int err, const char *domain)
>  	unsigned timeout;
>  	int ret;
>  
> -	_nsError(err, domain);
> -
> +	_nsError(&err, domain);
>  	switch (err) {
>  	case TRY_AGAIN:
>  		timeout = 1;
> -- 
> 2.47.1
> 
> 

BR, Jarkko

