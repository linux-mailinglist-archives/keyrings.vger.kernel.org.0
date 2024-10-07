Return-Path: <keyrings+bounces-2186-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AB81A99366C
	for <lists+keyrings@lfdr.de>; Mon,  7 Oct 2024 20:42:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 51BE31F22635
	for <lists+keyrings@lfdr.de>; Mon,  7 Oct 2024 18:42:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C79CE1D357B;
	Mon,  7 Oct 2024 18:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=digikod.net header.i=@digikod.net header.b="JlE2A5da"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp-190d.mail.infomaniak.ch (smtp-190d.mail.infomaniak.ch [185.125.25.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2011E1DDC2A
	for <keyrings@vger.kernel.org>; Mon,  7 Oct 2024 18:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.25.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728326553; cv=none; b=JQlGhoEFPTtUIUc4dbGDu1MV3A9/31nakISdYlEeW6ww+qFyVzA5CQQy/lMN3bCdV+RMPqgg3QSYApPVjxI6466BEiT9XkDZLx+tn5193fT4xxpErBNWQTB/nAzDRb4EWrWaBsUOX6HExTeHk3r4uPAuQUDUhqiH6ZFW+Lp+qvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728326553; c=relaxed/simple;
	bh=mcMOKVsBPrPgTTNnT1Bb+Nfenyk6y5Waj7/KMOMeIEo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PStuoaF51DKXZ4Ui2fmRci0oghLP8pVRga1KEH5e6ozoiBXLAn+deHZUITOFHNlLTDkHP2Brv/2KiNLOquXAbhdQGf1UnUbWS0oSpQMK2JlZJe+VybtQsM2Y+55mxr0KpLuYpWm9br2pSb8CkUuXljHiHuZkiSg91Qk3aMTaXsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=digikod.net; spf=pass smtp.mailfrom=digikod.net; dkim=pass (1024-bit key) header.d=digikod.net header.i=@digikod.net header.b=JlE2A5da; arc=none smtp.client-ip=185.125.25.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=digikod.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=digikod.net
Received: from smtp-4-0001.mail.infomaniak.ch (smtp-4-0001.mail.infomaniak.ch [10.7.10.108])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4XMp0p6Cq3z2g;
	Mon,  7 Oct 2024 20:42:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=digikod.net;
	s=20191114; t=1728326538;
	bh=38snT+jgcGiQcLlpyDSbMiNYqR/RVp7VfyLyvnZeeHo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JlE2A5dawUjoBcXET0bOHOlOmEr6EtiQCczYvOVpMaLIypT/1SjMpl2rp6XVqgKkE
	 kE7rgRTKkBWxiktS2AzIHCPg9qsOUn/Y8TwXpYeGC5t6mp7bf7dPRyo9HS5g8aLGdo
	 iLziARWqlEPF6yP/Tw0Q3WEW1tyuSrnsve+QjxBs=
Received: from unknown by smtp-4-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4XMp0p0Rgfz2qM;
	Mon,  7 Oct 2024 20:42:18 +0200 (CEST)
Date: Mon, 7 Oct 2024 20:42:15 +0200
From: =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>
To: David Howells <dhowells@redhat.com>, 
	David Woodhouse <dwmw2@infradead.org>
Cc: keyrings@vger.kernel.org, Eric Snowberg <eric.snowberg@oracle.com>, 
	Jarkko Sakkinen <jarkko@kernel.org>, Daniel Urbonas <t-durbonas@microsoft.com>
Subject: Re: [PATCH] tools/certs: Make print-cert-tbs-hash.sh compatible with
 recent OpenSSL
Message-ID: <20241007.aek5Ohpahlai@digikod.net>
References: <20240729180233.1114694-1-mic@digikod.net>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240729180233.1114694-1-mic@digikod.net>
X-Infomaniak-Routing: alpha

Could someone please take this patch?

On Mon, Jul 29, 2024 at 08:02:32PM +0200, Mickaël Salaün wrote:
> Recent OpenSSL versions (2 or 3) broke the "x509" argument parsing by
> not handling "-in -" (unlike OpenSSL 1.1):
>   Could not open file or uri for loading certificate from -: No such
>   file or directory
> 
> Avoid this issue and still make this script work with older versions of
> OpenSSL by using implicit arguments instead.
> 
> To hopefully make it more future-proof, apply the same simplifications
> for other OpenSSL commands.
> 
> Cc: David Howells <dhowells@redhat.com>
> Cc: David Woodhouse <dwmw2@infradead.org>
> Cc: Eric Snowberg <eric.snowberg@oracle.com>
> Cc: Jarkko Sakkinen <jarkko@kernel.org>
> Reported-by: Daniel Urbonas <t-durbonas@microsoft.com>
> Fixes: 58d416351e6d ("tools/certs: Add print-cert-tbs-hash.sh")
> Signed-off-by: Mickaël Salaün <mic@digikod.net>
> ---
>  tools/certs/print-cert-tbs-hash.sh | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/tools/certs/print-cert-tbs-hash.sh b/tools/certs/print-cert-tbs-hash.sh
> index c93df5387ec9..22bdeec4d286 100755
> --- a/tools/certs/print-cert-tbs-hash.sh
> +++ b/tools/certs/print-cert-tbs-hash.sh
> @@ -54,7 +54,7 @@ RANGE_AND_DIGEST_RE='
>  '
>  
>  RANGE_AND_DIGEST=($(echo "${PEM}" | \
> -	openssl asn1parse -in - | \
> +	openssl asn1parse | \
>  	sed -n -e "${RANGE_AND_DIGEST_RE}"))
>  
>  if [ "${#RANGE_AND_DIGEST[@]}" != 3 ]; then
> @@ -85,7 +85,7 @@ if [ -z "${DIGEST_MATCH}" ]; then
>  fi
>  
>  echo "${PEM}" | \
> -	openssl x509 -in - -outform DER | \
> +	openssl x509 -outform DER | \
>  	dd "bs=1" "skip=${OFFSET}" "count=${END}" "status=none" | \
> -	openssl dgst "-${DIGEST_MATCH}" - | \
> +	openssl dgst "-${DIGEST_MATCH}" | \
>  	awk '{printf "tbs:" $2}'
> -- 
> 2.45.2
> 

