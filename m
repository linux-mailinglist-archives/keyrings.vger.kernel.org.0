Return-Path: <keyrings+bounces-2009-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3626A975324
	for <lists+keyrings@lfdr.de>; Wed, 11 Sep 2024 15:02:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4D8731C23179
	for <lists+keyrings@lfdr.de>; Wed, 11 Sep 2024 13:02:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B42E7192D70;
	Wed, 11 Sep 2024 13:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SoyXvnxe"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D4E3191F96;
	Wed, 11 Sep 2024 13:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726059727; cv=none; b=lw5kkbe6cjeOt2mZBILdHLfSJOcqnmaQSJZyca5EW7AZUhBCrw1dViZCPIACq7iz8wOPXB1tavkyBpjPOet3hvTXQ/HTwNKcJ3jMFtr1FzMjLhWFc+p1rU/39fyVXHKjfKBCcZn/IP+y5yniXCI3tONI5bWFtyldHXZpHSLOz+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726059727; c=relaxed/simple;
	bh=dr6QLw0P18E1m/7MbWVxGb3lVQ9iQ6axncoSMkE45NQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=Hvb6pPRawGTHSbDZI4ByWpr6TWp2xjUNdzzOLE2jDJ3l+rJ0Lj28yfegqo2/gX4xO26Zv9KW8T8oE/3fJ45zuFk2yIk10UR4fyBSW4Io2rczc2lGo9l6gyFIFB8FFP+Xs/OpmOJIRQe2No5635mbrIVqMxmPlW7AimoAp0HHpNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SoyXvnxe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2229C4CECE;
	Wed, 11 Sep 2024 13:02:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726059727;
	bh=dr6QLw0P18E1m/7MbWVxGb3lVQ9iQ6axncoSMkE45NQ=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=SoyXvnxeZbaxBiY8df0OD5F5VKTr2b2ek7DAoe88L59os7Lq6+A6MpYqB9Kk+8tLX
	 QRRmU8P+IXFJ4/J+juHqoVfRr4z/jowRbX/qLWbH8xYEmY1b36SW++2E402QnspXGB
	 SYvy5vlzWu6lzou7Nt5X9RPR0hMiMEaHg7gSNxgOQJrVpO6rWPSkWis8O/UJIj6QhM
	 QCvRxMkAIFLHPw7XdNxgLThor7fItpnYnU2rZkn2hpO6khrkgGR6HgsiIt5nMpll3l
	 OjiFEaElvOnWemIhcxpYe7PbJOQNrIBU5D+yYdGLUkie6p6BaUccqAWvEpd+GPZw3A
	 DZrEEuemrV+lg==
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 11 Sep 2024 16:02:03 +0300
Message-Id: <D43H3UEUAXDN.2CF8RROAANPM9@kernel.org>
Cc: "David Howells" <dhowells@redhat.com>, "Andrew Zaborowski"
 <andrew.zaborowski@intel.com>, "Saulo Alessandre"
 <saulo.alessandre@tse.jus.br>, "Jonathan Cameron"
 <Jonathan.Cameron@huawei.com>, "Ignat Korchagin" <ignat@cloudflare.com>,
 "Marek Behun" <kabel@kernel.org>, "Varad Gautam" <varadgautam@google.com>,
 "Stephan Mueller" <smueller@chronox.de>, "Denis Kenzior"
 <denkenz@gmail.com>, <linux-crypto@vger.kernel.org>,
 <keyrings@vger.kernel.org>
Subject: Re: [PATCH v2 16/19] crypto: sig - Rename crypto_sig_maxsize() to
 crypto_sig_keysize()
From: "Jarkko Sakkinen" <jarkko@kernel.org>
To: "Lukas Wunner" <lukas@wunner.de>, "Herbert Xu"
 <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>,
 "Eric Biggers" <ebiggers@google.com>, "Stefan Berger"
 <stefanb@linux.ibm.com>, "Vitaly Chikunov" <vt@altlinux.org>, "Tadeusz
 Struk" <tstruk@gigaio.com>
X-Mailer: aerc 0.18.2
References: <cover.1725972333.git.lukas@wunner.de>
 <85b9d0003d8d55c21e7411802950826d01011668.1725972335.git.lukas@wunner.de>
In-Reply-To: <85b9d0003d8d55c21e7411802950826d01011668.1725972335.git.lukas@wunner.de>

On Tue Sep 10, 2024 at 5:30 PM EEST, Lukas Wunner wrote:
> crypto_sig_maxsize() is a bit of a misnomer as it doesn't return the
> maximum signature size, but rather the key size.
>
> Rename it as well as all implementations of the ->max_size callback.
> A subsequent commit introduces a crypto_sig_maxsize() function which
> returns the actual maximum signature size.
>
> While at it, change the return type of crypto_sig_keysize() from int to
> unsigned int for consistency with crypto_akcipher_maxsize().  None of
> the callers checks for a negative return value and an error condition
> can always be indicated by returning zero.
>
> Signed-off-by: Lukas Wunner <lukas@wunner.de>

Why this is so late in the series?

BR, Jarkko

