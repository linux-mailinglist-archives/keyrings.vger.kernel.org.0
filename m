Return-Path: <keyrings+bounces-2473-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A098A6750F
	for <lists+keyrings@lfdr.de>; Tue, 18 Mar 2025 14:27:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9A29C167DD4
	for <lists+keyrings@lfdr.de>; Tue, 18 Mar 2025 13:25:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D1A020ADD1;
	Tue, 18 Mar 2025 13:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ygKwZy0L"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39ABC13C908;
	Tue, 18 Mar 2025 13:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742304320; cv=none; b=BazstfYxH1UrIdpq4xmOQHfED4wQmqkBjIgFGWW640p0YYd7Nbryqq4DSZ79Q/uPWJjzKz8+xTFxieuKJFhPV5KDnVs5QAbIyag6EFcRId+jzrYDnVNyedQmj6A1GhX3xP6Aw7aKpvY1eFu4cBbR0rV11uXc/PunSRbxEL6Kcow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742304320; c=relaxed/simple;
	bh=sm1Xz6loYNgAy8QDfYfj8lVAdZgMYiUz6arqfRBcYtw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fX5Ulz1j0qFtl5prQfYeiKrDz9oM0cUyXH0HBB0Ow90ZAdsa5EsikG5YjOxLH8Vusoj10fy3NR6tH2Iby55+sIPpPOPCZl8sC7FNOEzdWX5S3m34wmAfKjuXkubnB9FwVSdYR5OkkQZUTvPQ5Vnig51EIgio3+DZEtKlfrUlhC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ygKwZy0L; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1455C4CEDD;
	Tue, 18 Mar 2025 13:25:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1742304320;
	bh=sm1Xz6loYNgAy8QDfYfj8lVAdZgMYiUz6arqfRBcYtw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ygKwZy0Ltkda23XHQWr41ijJCDPu/R0US0cCFlMUlDEzQ6r2ThZ811+VvKDazMaWv
	 W1L7EDE3LdYeIQozswMoggFQ2zd0ITil2wxSAS4v97hoZZ3O6Xa7fOuPLUZQrtcrHR
	 HpMwX/NtAqfhINVXu/TTsoNZWBc3Nk4KJiCnOBqw=
Date: Tue, 18 Mar 2025 14:24:01 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Huacai Chen <chenhuacai@loongson.cn>
Cc: Sasha Levin <sashal@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>, stable@vger.kernel.org,
	David Howells <dhowells@redhat.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Jan Stancek <jstancek@redhat.com>,
	Jarkko Sakkinen <jarkko@kernel.org>, keyrings@vger.kernel.org,
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev,
	R Nageswara Sastry <rnsastry@linux.ibm.com>,
	Neal Gompa <neal@gompa.dev>
Subject: Re: [PATCH 6.1&6.6 1/3] sign-file,extract-cert: move common SSL
 helper functions to a header
Message-ID: <2025031834-spotty-dipped-be36@gregkh>
References: <20250318110124.2160941-1-chenhuacai@loongson.cn>
 <20250318110124.2160941-2-chenhuacai@loongson.cn>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250318110124.2160941-2-chenhuacai@loongson.cn>

On Tue, Mar 18, 2025 at 07:01:22PM +0800, Huacai Chen wrote:
> From: Jan Stancek <jstancek@redhat.com>
> 
> commit 300e6d4116f956b035281ec94297dc4dc8d4e1d3 upstream.
> 
> Couple error handling helpers are repeated in both tools, so
> move them to a common header.
> 
> Signed-off-by: Jan Stancek <jstancek@redhat.com>
> Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>
> Tested-by: R Nageswara Sastry <rnsastry@linux.ibm.com>
> Reviewed-by: Neal Gompa <neal@gompa.dev>
> Signed-off-by: Jarkko Sakkinen <jarkko@kernel.org>
> Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
> ---

Is this "v2" as well?  the threading is all confusing here.  This is
what my inbox looks like right now:


  32 N T Mar 18 Huacai Chen     (2.9K) [PATCH 6.1&6.6 V2 0/3] sign-file,extract-cert: switch to PROVIDER API for OpenSSL >= 3.0
  33 N T Mar 18 Huacai Chen     (7.9K) ├─>[PATCH 6.1&6.6 V2 3/3] sign-file,extract-cert: use pkcs11 provider for OPENSSL MAJOR >= 3
  34 N T Mar 18 Huacai Chen     (3.4K) ├─>[PATCH 6.1&6.6 V2 2/3] sign-file,extract-cert: avoid using deprecated ERR_get_error_line()
  35 N T Mar 18 Huacai Chen     (4.8K) └─>[PATCH 6.1&6.6 1/3] sign-file,extract-cert: move common SSL helper functions to a header
  46 N T Mar 18 Huacai Chen     (2.9K) [PATCH 6.1&6.6 0/3] sign-file,extract-cert: switch to PROVIDER API for OpenSSL >= 3.0
  47 N T Mar 18 Huacai Chen     (3.3K) ├─>[PATCH 6.1&6.6 2/3] sign-file,extract-cert: avoid using deprecated ERR_get_error_line()
  48 N T Mar 18 Huacai Chen     (4.8K) ├─>[PATCH 6.1&6.6 1/3] sign-file,extract-cert: move common SSL helper functions to a header
  50 N T Mar 18 Huacai Chen     (7.8K) └─>[PATCH 6.1&6.6 3/3] sign-file,extract-cert: use pkcs11 provider for OPENSSL MAJOR >= 3

What would you do if you saw that?

greg k-h

