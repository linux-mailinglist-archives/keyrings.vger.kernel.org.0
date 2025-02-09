Return-Path: <keyrings+bounces-2387-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E2048A2DBEA
	for <lists+keyrings@lfdr.de>; Sun,  9 Feb 2025 10:58:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 72C45188746A
	for <lists+keyrings@lfdr.de>; Sun,  9 Feb 2025 09:58:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2FA31537C6;
	Sun,  9 Feb 2025 09:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=hmeau.com header.i=@hmeau.com header.b="a3xij0K1"
X-Original-To: keyrings@vger.kernel.org
Received: from abb.hmeau.com (abb.hmeau.com [144.6.53.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DF6CE57D;
	Sun,  9 Feb 2025 09:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=144.6.53.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739095122; cv=none; b=rL8dnHFgnwV8mJbk5QzBMjTvltht99sUcxHDu2LO+wZtj2jgfwMpF3Zr/U+fFffrCvfpA5eDWcq190M6VBR+ISLFSurFYQOHuhcHicdGb95svjW9HCugzNHs/I9Tez2PwQh7fKLFMKWXvtD74f8hS7/TbUul6Vgq1BViD1Ed7Dk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739095122; c=relaxed/simple;
	bh=XGEB8JzVxGq1I11appRpi8ZzJbJEC88eq/6xP/ZK8ss=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lRKCyc1wgHAxrvKxVuQkT7XnADkjfc73ThznamOWaDn6J3te0btlqCXWzGyk4AcUr7k/y3B1jzp1Fa1uxP2k12iHE3ndkhAXug2ZU4Eb4445FjuO+uYvTwO9z48o+bv0ll3x6+8/4LSOwS3ZqlzTxQ89OnmECu4U0JJtv8RmDuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au; spf=pass smtp.mailfrom=gondor.apana.org.au; dkim=pass (2048-bit key) header.d=hmeau.com header.i=@hmeau.com header.b=a3xij0K1; arc=none smtp.client-ip=144.6.53.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gondor.apana.org.au
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=TR7CZzGW1jJt6Btx8WpZ8ONuD6+20pZHCFUeB5Ca+l4=; b=a3xij0K1m8uoBjHvB/dTC8ExX2
	7/3eOFy1y96YqCl4uu0TnhOsKx46d/mbFY6qwQ+ZKWDCRYAO3CVH13H2YEFLoLxZrAQ60PRE2iZJw
	zlALuwMFtDghzbbUFR7+j4vT+0eETVSZQ38D5NBzWRkkZ/4U1dwCL5Lxx0YcFlbR1PJgtBnWs1ztU
	sU5HgTcHtMd/vA9d71DPrvQifnR452awwiVOUhN5o8z0J3JY3+TGMzFeGyOx03TygAe1fHih3AZIE
	fgS/+VsdyZA0SmMcewjqGg+hFQ70qpNX8ovSknVMmRde/EpzwqhE+efXliUXk6Mquc289NrtxoMDu
	x3Jz+NIQ==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1th3rr-00GITg-0Q;
	Sun, 09 Feb 2025 17:58:08 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Sun, 09 Feb 2025 17:58:07 +0800
Date: Sun, 9 Feb 2025 17:58:07 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Lukas Wunner <lukas@wunner.de>
Cc: "David S. Miller" <davem@davemloft.net>,
	Stefan Berger <stefanb@linux.ibm.com>,
	Vitaly Chikunov <vt@altlinux.org>,
	David Howells <dhowells@redhat.com>,
	Ignat Korchagin <ignat@cloudflare.com>,
	linux-crypto@vger.kernel.org, keyrings@vger.kernel.org,
	Eric Biggers <ebiggers@google.com>
Subject: Re: [PATCH v2 3/4] crypto: ecdsa - Fix enc/dec size reported by
 KEYCTL_PKEY_QUERY
Message-ID: <Z6h8L0D-CBhZUiVR@gondor.apana.org.au>
References: <cover.1738521533.git.lukas@wunner.de>
 <3d74d6134f4f87a90ebe0a37cb06c6ec144ceef7.1738521533.git.lukas@wunner.de>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3d74d6134f4f87a90ebe0a37cb06c6ec144ceef7.1738521533.git.lukas@wunner.de>

On Sun, Feb 02, 2025 at 08:00:53PM +0100, Lukas Wunner wrote:
> KEYCTL_PKEY_QUERY system calls for ecdsa keys return the key size as
> max_enc_size and max_dec_size, even though such keys cannot be used for
> encryption/decryption.  They're exclusively for signature generation or
> verification.
> 
> Only rsa keys with pkcs1 encoding can also be used for encryption or
> decryption.
> 
> Return 0 instead for ecdsa keys (as well as ecrdsa keys).
> 
> Signed-off-by: Lukas Wunner <lukas@wunner.de>
> Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>
> ---
>  crypto/asymmetric_keys/public_key.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)

I think we should discuss who is using these user-space APIs
before doing any more work on them.  The in-kernel asymmetric
crypto code is not safe against side-channel attacks.  As there
are no in-kernel users of private-key functionality, we should
consider getting rid of private key support completely.

As it stands the only user is this user-space API.

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

