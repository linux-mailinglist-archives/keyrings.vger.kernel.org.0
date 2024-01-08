Return-Path: <keyrings+bounces-414-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A9B97827132
	for <lists+keyrings@lfdr.de>; Mon,  8 Jan 2024 15:24:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CE5071C22A12
	for <lists+keyrings@lfdr.de>; Mon,  8 Jan 2024 14:24:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84ECA4654F;
	Mon,  8 Jan 2024 14:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tUsYivmD"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 646274654A;
	Mon,  8 Jan 2024 14:24:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7ED8EC433C7;
	Mon,  8 Jan 2024 14:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704723889;
	bh=+STw9UiZGx3J/t1LF9eRC4a7J3XN0t4eLlAKGTfSH1U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tUsYivmDk53zNMF6yAQHm+njCpZSL3PgUZqMOTcqDZGUHsizruc0ktIKN7HducdIn
	 6TJal63c9EldYJc12emykxs2b3ML2Uj1dADW5akfTOq/OKHnUwUm2X2ix/CalI9uXF
	 MYk+lTZRU4g9h8PmsDlHxEIsyckyxX9w5YYU/EG8lMxz1N7AnHU9BPxnBw3/Dewf8X
	 KATMrRfXimt9Bux0MDEvejcFO489v8qVS1r+tD3pM5tN551MGnQU670ibfNwpgLcGy
	 QC+765QEgeV9LiNtYEm0d9tcb9Aq6wns48HmEmMcD9tL7lRL1vMOgRLiS9Z/J8qltM
	 oXtwpy9xekl3A==
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 08 Jan 2024 16:24:46 +0200
Message-Id: <CY9E6M2BYETA.1VE73N3UHD4B9@suppilovahvero>
From: "Jarkko Sakkinen" <jarkko@kernel.org>
To: <clayc@hpe.com>, <keyrings@vger.kernel.org>,
 <linux-crypto@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Cc: <dhowells@redhat.com>, <herbert@gondor.apana.org.au>,
 <davem@davemloft.net>
Subject: Re: [PATCH] KEYS: include header for EINVAL definition
X-Mailer: aerc 0.15.2
References: <20240107132842.4024084-1-clayc@hpe.com>
In-Reply-To: <20240107132842.4024084-1-clayc@hpe.com>

On Sun Jan 7, 2024 at 3:28 PM EET,  wrote:
> From: Clay Chang <clayc@hpe.com>
>
> This patch includes linux/errno.h to address the issue of 'EINVAL' being
> undeclared.
>
> Signed-off-by: Clay Chang <clayc@hpe.com>
> ---
>  include/crypto/public_key.h | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/include/crypto/public_key.h b/include/crypto/public_key.h
> index 462f8a34cdf8..b7f308977c84 100644
> --- a/include/crypto/public_key.h
> +++ b/include/crypto/public_key.h
> @@ -10,6 +10,7 @@
>  #ifndef _LINUX_PUBLIC_KEY_H
>  #define _LINUX_PUBLIC_KEY_H
> =20
> +#include <linux/errno.h>
>  #include <linux/keyctl.h>
>  #include <linux/oid_registry.h>
> =20

Please provide evidence that issue exist (applies for any possible kernel i=
ssue).

BR, Jarkko

