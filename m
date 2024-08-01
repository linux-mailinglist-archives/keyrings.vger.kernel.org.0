Return-Path: <keyrings+bounces-1843-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ABA7944E3F
	for <lists+keyrings@lfdr.de>; Thu,  1 Aug 2024 16:42:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0961C1F22194
	for <lists+keyrings@lfdr.de>; Thu,  1 Aug 2024 14:42:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3120189B98;
	Thu,  1 Aug 2024 14:42:43 +0000 (UTC)
X-Original-To: keyrings@vger.kernel.org
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E509A16F0DF;
	Thu,  1 Aug 2024 14:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.176.79.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722523363; cv=none; b=dj+HFlat9m/Krm4MBzUgXHBhVJYUBGkfGafoayTP8paAPYpWVE2DUvQZUNRNbUcZG6hMLhwqZJLcDxgs9O0rTY9zDspT7kJzdPmxVJEgwxh0r/3vRCnjgX2G/i4WKRbk+rpWj44seppASxA5h3Suw3LreyiQyJkztIJLOybOlnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722523363; c=relaxed/simple;
	bh=dwBxhYSYWHgMN7E4yUs7uCNO33v+/pbSqSfbfuRYkME=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tWoOW0/qxlmc+VN40+YHQmxmENFMZH6ZvjC2TIFrOAr/BCpwNrgq801aJlTvuuKD0/b+2P2Dg37H4M9cEDAelKeG082Hr8Eh3FTOwR1hTJkwM/Y7a+TblhlPRBxRfj6dJm+I+R6wstqXCPpSdZpUjEMRx0gPtF050qZGdhOEtn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=Huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=185.176.79.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=Huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4WZWpB4jflz6K5vC;
	Thu,  1 Aug 2024 22:40:02 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (unknown [7.191.163.240])
	by mail.maildlp.com (Postfix) with ESMTPS id 57C281404FC;
	Thu,  1 Aug 2024 22:42:38 +0800 (CST)
Received: from localhost (10.203.177.66) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Thu, 1 Aug
 2024 15:42:37 +0100
Date: Thu, 1 Aug 2024 15:42:37 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Lukas Wunner <lukas@wunner.de>
CC: Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller"
	<davem@davemloft.net>, Stefan Berger <stefanb@linux.ibm.com>, David Howells
	<dhowells@redhat.com>, Vitaly Chikunov <vt@altlinux.org>, Tadeusz Struk
	<tstruk@gigaio.com>, Andrew Zaborowski <andrew.zaborowski@intel.com>, "Saulo
 Alessandre" <saulo.alessandre@tse.jus.br>, <linux-crypto@vger.kernel.org>,
	<keyrings@vger.kernel.org>
Subject: Re: [PATCH 1/5] ASN.1: Add missing include <linux/types.h>
Message-ID: <20240801154237.00002925@Huawei.com>
In-Reply-To: <a98ae07646e243fe0d9c1a25fcb3feb3e5987960.1722260176.git.lukas@wunner.de>
References: <cover.1722260176.git.lukas@wunner.de>
	<a98ae07646e243fe0d9c1a25fcb3feb3e5987960.1722260176.git.lukas@wunner.de>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: lhrpeml500006.china.huawei.com (7.191.161.198) To
 lhrpeml500005.china.huawei.com (7.191.163.240)

On Mon, 29 Jul 2024 15:47:00 +0200
Lukas Wunner <lukas@wunner.de> wrote:

> If <linux/asn1_decoder.h> is the first header included from a .c file
> (due to headers being sorted alphabetically), the compiler complains:
> 
> include/linux/asn1_decoder.h:18:29: error: unknown type name 'size_t'
> 
> Fix it.
> 
> Signed-off-by: Lukas Wunner <lukas@wunner.de>

FWIW
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

I see asn1_encoder.h already has this include so this
is nice and consistent.

However that header includes bug.h which should probably be
pushed down into the relevant c files.  Not relevant for this
series though so one for another day (or never :)

> ---
>  include/linux/asn1_decoder.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/include/linux/asn1_decoder.h b/include/linux/asn1_decoder.h
> index 83f9c6e1e5e9..b41bce82a191 100644
> --- a/include/linux/asn1_decoder.h
> +++ b/include/linux/asn1_decoder.h
> @@ -9,6 +9,7 @@
>  #define _LINUX_ASN1_DECODER_H
>  
>  #include <linux/asn1.h>
> +#include <linux/types.h>
>  
>  struct asn1_decoder;
>  


