Return-Path: <keyrings+bounces-4054-lists+keyrings=lfdr.de@vger.kernel.org>
Delivered-To: lists+keyrings@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uLOKDscSjmll/AAAu9opvQ
	(envelope-from <keyrings+bounces-4054-lists+keyrings=lfdr.de@vger.kernel.org>)
	for <lists+keyrings@lfdr.de>; Thu, 12 Feb 2026 18:49:59 +0100
X-Original-To: lists+keyrings@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A82E0130136
	for <lists+keyrings@lfdr.de>; Thu, 12 Feb 2026 18:49:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BFE4B3012CEB
	for <lists+keyrings@lfdr.de>; Thu, 12 Feb 2026 17:49:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7366D13777E;
	Thu, 12 Feb 2026 17:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rijWrhG0"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F12613A86C;
	Thu, 12 Feb 2026 17:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770918595; cv=none; b=D7M4K48wpaS0xQjlZLkWRHbdyEUGsZHX1kqx2dgHy7HeSTGX++sX1Bn1paPvWpTTk+U+fr1KNZh6pvHDbu/o3PQZVunv2+cdYwU5/zsXiVrXORNTVZso2Drzxk855TadIyx7ZJ+z7vBXtpA8/AhF+DGoPXoJKqO1yR2+6lkddhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770918595; c=relaxed/simple;
	bh=DJULQCBIOYoYFZiOD7NY6M6YiAlcP9swo3j9cbL0Ko0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XLKGILdil2cV53WdnwzLmVqDJYve2hv9hBy+0P60ves38ON1JWfKnKAfu0l8MQBhCFZHZ8gHqoKEaYYzouFX9DGW6lFscgf1cLLsE4oCg7JObfC4i1xSp9G0NpONz9vr7ihWBXDUgfetW3JV7VIM/WdOr05aSmsuZ1G0+85tVN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rijWrhG0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9999BC4CEF7;
	Thu, 12 Feb 2026 17:49:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770918595;
	bh=DJULQCBIOYoYFZiOD7NY6M6YiAlcP9swo3j9cbL0Ko0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rijWrhG0tnaAVAfoSCnB9xzdbBMrS5yXtsfdp/xtvKUpOO2LaiLPDvMp6Wktzp04u
	 uwaoxXhM/tPymGk5vVRWrF6dw47VA/kk4H1VV10IUsUAluwE3LjDgeaYwkVeeVpkTh
	 k+mCoL3CTXGSZvMpbQUtYoSc/q409owNRgGAtWmDrbIcQyexMjZGTQLC+Awi5+9nCc
	 eJ7yIMHPCDbvhhlrVowBQ/VbM0itkA2dy/CnFoalQG7IkCn10Zw32rNoqOXTVUFGND
	 LtKdnhoOtiUZcmwxzlIaurwyQ1em2QrWD1OvVu5JXirg4Lj4nw8EGVYaAGIXDTQXCv
	 TRuFmfTs0IkjQ==
Date: Thu, 12 Feb 2026 09:49:10 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: David Howells <dhowells@redhat.com>, Lukas Wunner <lukas@wunner.de>,
	Ignat Korchagin <ignat@cloudflare.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Jarkko Sakkinen <jarkko@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	keyrings@vger.kernel.org, linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] x509: select CONFIG_CRYPTO_LIB_SHA256
Message-ID: <20260212174910.GC2269@sol>
References: <20260212102102.429181-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260212102102.429181-1-arnd@kernel.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-4054-lists,keyrings=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ebiggers@kernel.org,keyrings@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[keyrings];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A82E0130136
X-Rspamd-Action: no action

On Thu, Feb 12, 2026 at 11:20:55AM +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The x509 public key code gained a dependency on the sha256 hash
> implementation, causing a rare link time failure in randconfig
> builds:
> 
> arm-linux-gnueabi-ld: crypto/asymmetric_keys/x509_public_key.o: in function `x509_get_sig_params':
> x509_public_key.c:(.text.x509_get_sig_params+0x12): undefined reference to `sha256'
> arm-linux-gnueabi-ld: (sha256): Unknown destination type (ARM/Thumb) in crypto/asymmetric_keys/x509_public_key.o
> x509_public_key.c:(.text.x509_get_sig_params+0x12): dangerous relocation: unsupported relocation
> 
> Select the necessary library code from Kconfig.
> 
> Fixes: 2c62068ac86b ("x509: Separately calculate sha256 for blacklist")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  crypto/asymmetric_keys/Kconfig | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Eric Biggers <ebiggers@kernel.org>

- Eric

