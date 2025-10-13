Return-Path: <keyrings+bounces-3211-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 01774BD1A85
	for <lists+keyrings@lfdr.de>; Mon, 13 Oct 2025 08:26:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C94974EC280
	for <lists+keyrings@lfdr.de>; Mon, 13 Oct 2025 06:24:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43D4D2E2DC1;
	Mon, 13 Oct 2025 06:24:40 +0000 (UTC)
X-Original-To: keyrings@vger.kernel.org
Received: from bmailout3.hostsharing.net (bmailout3.hostsharing.net [176.9.242.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3AAF27A122;
	Mon, 13 Oct 2025 06:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=176.9.242.62
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760336680; cv=none; b=lcxrU1GMsyCI0ECCRP6bU0uAa+MMr3n8Q2XPIJUPt/OlvMihJcuriIIT8v5x1zFVFNDok0rpdbwzmtvSV/9rQl7s2eLvoLPh/4setEZyo5kJ+qLFq0ZUiSTnDGPVQnCUi1/fwlv7gwglHanVCB57dn9qGpD2T5/vsKvQW2p5xwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760336680; c=relaxed/simple;
	bh=scipkCogXX/m5+KJO510ggbFUKsa7diGjhXViS+mDFE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rKA7+RyrGV53I+2WfCaAYM7UaUdcaXWp1iR8tYo4/yB+RSwb+6zMNmBLOzPsO3EztaV3HVEhqlMUZYRA4TCyWFpc2Srh6C66jEOW+FGbal4kFWhbSDMXUFD1MTk6rXcmGun9gzI0vsq+wal2dgxml8LSd+rCRPNBvT3MJFmZnzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de; spf=none smtp.mailfrom=h08.hostsharing.net; arc=none smtp.client-ip=176.9.242.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=h08.hostsharing.net
Received: from h08.hostsharing.net (h08.hostsharing.net [IPv6:2a01:37:1000::53df:5f1c:0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "*.hostsharing.net", Issuer "RapidSSL TLS RSA CA G1" (verified OK))
	by bmailout3.hostsharing.net (Postfix) with ESMTPS id 90E442C01634;
	Mon, 13 Oct 2025 08:24:33 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id 5412C4A12; Mon, 13 Oct 2025 08:24:33 +0200 (CEST)
Date: Mon, 13 Oct 2025 08:24:33 +0200
From: Lukas Wunner <lukas@wunner.de>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: David Howells <dhowells@redhat.com>,
	Ignat Korchagin <ignat@cloudflare.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Vivek Goyal <vgoyal@redhat.com>, stable@vger.kernel.org,
	keyrings@vger.kernel.org, linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] crypto: asymmetric_keys - prevent overflow in
 asymmetric_key_generate_id
Message-ID: <aOybIZ2iqXExpTUw@wunner.de>
References: <20251012203841.60230-1-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251012203841.60230-1-thorsten.blum@linux.dev>

On Sun, Oct 12, 2025 at 10:38:40PM +0200, Thorsten Blum wrote:
> Use check_add_overflow() to guard against a potential integer overflow
> when adding the binary blob lengths in asymmetric_key_generate_id() and
> return -EOVERFLOW accordingly. This prevents a possible buffer overflow
> when copying data from potentially malicious X.509 fields that can be
> arbitrarily large, such as ASN.1 INTEGER serial numbers, issuer names,
> etc.
> 
> Also use struct_size() to calculate the number of bytes to allocate for
> the new asymmetric key id.
> 
> Cc: stable@vger.kernel.org
> Fixes: 7901c1a8effb ("KEYS: Implement binary asymmetric key ID handling")

No stable designation please, this doesn't pass the "obviously correct"
test, see below.

> +++ b/crypto/asymmetric_keys/asymmetric_type.c
> @@ -141,12 +142,14 @@ struct asymmetric_key_id *asymmetric_key_generate_id(const void *val_1,
>  						     size_t len_2)
>  {
>  	struct asymmetric_key_id *kid;
> +	size_t len;
>  
> -	kid = kmalloc(sizeof(struct asymmetric_key_id) + len_1 + len_2,
> -		      GFP_KERNEL);
> +	if (check_add_overflow(len_1, len_2, &len))
> +		return ERR_PTR(-EOVERFLOW);
> +	kid = kmalloc(struct_size(kid, data, len), GFP_KERNEL);

This will add (at least) 2 bytes to len (namely the size of struct
asymmetric_key_id)) and may cause an overflow (even if len_1 + len_2
did not overflow).

struct_size() truncates to SIZE_MAX and then right below...

>  	if (!kid)
>  		return ERR_PTR(-ENOMEM);
> -	kid->len = len_1 + len_2;
> +	kid->len = len;
>  	memcpy(kid->data, val_1, len_1);
>  	memcpy(kid->data + len_1, val_2, len_2);

... this memcpy() operation will perform an out-of-bound access
beyond SIZE_MAX.

Thanks,

Lukas

