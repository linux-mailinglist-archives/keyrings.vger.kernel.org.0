Return-Path: <keyrings+bounces-3206-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 29B04BD0064
	for <lists+keyrings@lfdr.de>; Sun, 12 Oct 2025 09:38:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1BF2B189170D
	for <lists+keyrings@lfdr.de>; Sun, 12 Oct 2025 07:39:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EA8F220F2A;
	Sun, 12 Oct 2025 07:38:49 +0000 (UTC)
X-Original-To: keyrings@vger.kernel.org
Received: from bmailout1.hostsharing.net (bmailout1.hostsharing.net [83.223.95.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 804EF1BD9F0;
	Sun, 12 Oct 2025 07:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=83.223.95.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760254729; cv=none; b=SpXnyZMEjJWrBakCw0JrVhkirVzj8m4UdeEZ4hQ9X+4wzd2fHsxMl/ECGuEmxXi/oRTTIdHa8pLv/5qKBkE/l8JvLNohkpHLP1PA563MNaI5vRGuypebE7whYya/9PiXnq2PPaTJMJjgw2Og53rv9SP63xws90pZF2Li4FfK+RM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760254729; c=relaxed/simple;
	bh=B6TTQY2b105FO3hvPVhRwnkmJUx6GedqVg3l81uMnnE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hzMPnDuuAhBWlzwi7d/CLrBAECIpVTLhIkLKwBYmj8SQ4/HGW1Gtwjws9d1/QmFRzAZSEz8sjcMzss0GMoLF/miEL2S/DWiAuTsv8tvW3Cv6wNDCmARvoju0DWyP+0aRq6U/ukJ4DLwTdohBjvHc2lqWIYkOrvUHcQm2AUrLsQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de; spf=none smtp.mailfrom=h08.hostsharing.net; arc=none smtp.client-ip=83.223.95.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=h08.hostsharing.net
Received: from h08.hostsharing.net (h08.hostsharing.net [IPv6:2a01:37:1000::53df:5f1c:0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "*.hostsharing.net", Issuer "RapidSSL TLS RSA CA G1" (verified OK))
	by bmailout1.hostsharing.net (Postfix) with ESMTPS id AB6DD2C048AF;
	Sun, 12 Oct 2025 09:38:44 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id 97ADB4A12; Sun, 12 Oct 2025 09:38:44 +0200 (CEST)
Date: Sun, 12 Oct 2025 09:38:44 +0200
From: Lukas Wunner <lukas@wunner.de>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: David Howells <dhowells@redhat.com>,
	Ignat Korchagin <ignat@cloudflare.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>, keyrings@vger.kernel.org,
	linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] crypto: asymmetric_keys - prevent overflow in
 asymmetric_key_generate_id
Message-ID: <aOtbBJtU2NixkYuE@wunner.de>
References: <20251007185220.234611-2-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251007185220.234611-2-thorsten.blum@linux.dev>

On Tue, Oct 07, 2025 at 08:52:20PM +0200, Thorsten Blum wrote:
> +++ b/crypto/asymmetric_keys/asymmetric_type.c
> @@ -141,12 +142,13 @@ struct asymmetric_key_id *asymmetric_key_generate_id(const void *val_1,
>  						     size_t len_2)
>  {
>  	struct asymmetric_key_id *kid;
> +	size_t len;
>  
> -	kid = kmalloc(sizeof(struct asymmetric_key_id) + len_1 + len_2,
> -		      GFP_KERNEL);
> +	len = size_add(len_1, len_2);
> +	kid = kmalloc(struct_size(kid, data, len), GFP_KERNEL);
>  	if (!kid)
>  		return ERR_PTR(-ENOMEM);

This should error out on overflow, rather than continuing with a
SIZE_MAX length.  So how about using check_add_overflow() instead
of size_add() and returning -EOVERFLOW if that returns true?

asymmetric_key_generate_id() is invoked, among other things, with
the raw serial number from the X.509 certificate, which is an
ASN.1 INTEGER, which can be arbitrarily large.  (You may want to
mention that in the commit message.)  So checking for overflows
does seem to make sense to guard against maliciously crafted
certificates.

Thanks,

Lukas

