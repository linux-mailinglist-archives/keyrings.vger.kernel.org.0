Return-Path: <keyrings+bounces-1986-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EA2B975117
	for <lists+keyrings@lfdr.de>; Wed, 11 Sep 2024 13:52:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 51C761C20EFD
	for <lists+keyrings@lfdr.de>; Wed, 11 Sep 2024 11:52:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 531D21537C9;
	Wed, 11 Sep 2024 11:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eBDzK1FL"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A5C7187355;
	Wed, 11 Sep 2024 11:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726055553; cv=none; b=nFFMoKCQTROt1A5Xlf9XAca+oB4+P4CMRXBm3bf36kPkl8s+gjXL299p5QPqw0SYF3HyeGZRTtOTI/g3o6WuwOSsZNZ/XPFhKOODsrpC4zxfBCwrwbGZkUvOd2Wpy573zRWsBLV5/bRSGHbK9az9c2BCHLKfsCX+sVF7K8npGD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726055553; c=relaxed/simple;
	bh=m2G9sU3dDk87vO6dqG2X29ztnbBK8oLK3pr8htXdlTc=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=Qs5wB3kPtldjhwwl4Wd0/HKu/PxAkYT291DXxbYfgQYRhlKk+9f7OOBverYJDlr/2EG50kqsOf73ysn3dCi28QYEdETqBRhkLYnpiuIlOefEhazHKEivOumyW+PJm1YiwdtgNzApPpRyOnA8shd8tFuBd5Req+vCXqDYU1sR1IA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eBDzK1FL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BAB5C4CEC5;
	Wed, 11 Sep 2024 11:52:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726055551;
	bh=m2G9sU3dDk87vO6dqG2X29ztnbBK8oLK3pr8htXdlTc=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=eBDzK1FLiKyQUBq6ltFE1xDrd+5xd6+bav8ODjz8WyuL91LQxi9qBufXH1h46JfJW
	 un90y3GSg5YSGNuAiD6MDd95eTXaDj9xZgtjByZFjtY8PNC0F0bxbG/J5HcuIR6MWO
	 7OlA6AOFhLJ9QhmNs0+XkSmRDUpMMKmlehmDZL8yZuEiOd8nq/ECMBUGVafkXhTs77
	 w5/gOcgqZO37BC0SXYNPCK057K021ECGhnRaJFkhDV8A7Wege/vl8CMAM8R7S3Gl4x
	 d8iYiSWWCSHEvn/KsW732uPIYUPqXKvgHfxZfDipDhuv3qMJyWNd7GmykS382Gue7E
	 59SEDy6K5/mFA==
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 11 Sep 2024 14:52:27 +0300
Message-Id: <D43FMJZBP0GO.4TZSB0B03L9E@kernel.org>
Cc: "David Howells" <dhowells@redhat.com>, "Andrew Zaborowski"
 <andrew.zaborowski@intel.com>, "Saulo Alessandre"
 <saulo.alessandre@tse.jus.br>, "Jonathan Cameron"
 <Jonathan.Cameron@huawei.com>, "Ignat Korchagin" <ignat@cloudflare.com>,
 "Marek Behun" <kabel@kernel.org>, "Varad Gautam" <varadgautam@google.com>,
 "Stephan Mueller" <smueller@chronox.de>, "Denis Kenzior"
 <denkenz@gmail.com>, <linux-crypto@vger.kernel.org>,
 <keyrings@vger.kernel.org>
Subject: Re: [PATCH v2 01/19] crypto: ecdsa - Drop unused test vector
 elements
From: "Jarkko Sakkinen" <jarkko@kernel.org>
To: "Lukas Wunner" <lukas@wunner.de>, "Herbert Xu"
 <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>,
 "Eric Biggers" <ebiggers@google.com>, "Stefan Berger"
 <stefanb@linux.ibm.com>, "Vitaly Chikunov" <vt@altlinux.org>, "Tadeusz
 Struk" <tstruk@gigaio.com>
X-Mailer: aerc 0.18.2
References: <cover.1725972333.git.lukas@wunner.de>
 <f160f2418c98204817f93339e944529987308b32.1725972334.git.lukas@wunner.de>
In-Reply-To: <f160f2418c98204817f93339e944529987308b32.1725972334.git.lukas@wunner.de>

On Tue Sep 10, 2024 at 5:30 PM EEST, Lukas Wunner wrote:
> The ECDSA test vectors contain "params", "param_len" and "algo" elements
> even though ecdsa.c doesn't make any use of them.  The only algorithm
> implementation using those elements is ecrdsa.c.

I'm missing these pieces of information here at least:

- akcipher.h tells that tail contains OID, parameter blob length and the
  blob itself.
- akcipher.h leaves the size of those fields completely *undefined*.
- According to call sites OID and blob length are 32-bit fields.
- According to call sites that I bumped into they are always set to
  zero.
- There's no information in the kernel source code that I could fine
  for any other rules how the should be set.
 =20
Putting random words (of which params_len is not even a word) to quotes
does not really make this whole story obvious. You could just as well
delete the paragraph, because that only makes you look for a struct
that does not even exist.

BR, Jarkko


