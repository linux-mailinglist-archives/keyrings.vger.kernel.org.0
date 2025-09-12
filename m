Return-Path: <keyrings+bounces-2994-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 92A1AB54F09
	for <lists+keyrings@lfdr.de>; Fri, 12 Sep 2025 15:15:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 901E5189AF70
	for <lists+keyrings@lfdr.de>; Fri, 12 Sep 2025 13:15:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64A2130DD05;
	Fri, 12 Sep 2025 13:14:18 +0000 (UTC)
X-Original-To: keyrings@vger.kernel.org
Received: from bmailout3.hostsharing.net (bmailout3.hostsharing.net [176.9.242.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47CB230DEBC;
	Fri, 12 Sep 2025 13:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=176.9.242.62
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757682858; cv=none; b=dmfmCJ6sKLkXyRDGXKtz8e+t5ppaLacqzBVvCqSyoGx3rzO/lXQNaOHLaAzkUIKo1hohld+a35razu+H2Mnc3RzKEiNR2/Zv27hd/35rwHNIZ7aVHMpxufD2XaJCnONQnhEtG4K/DyGOWXeMlJy9rqaskVNZAgH9WVB45U7stqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757682858; c=relaxed/simple;
	bh=6e+sVle9MifWvb6/53/ryU72tPHkEfNKBpFNkBJjL+Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JzDhU4ce0Xm+6bskW9P3PjdCtiVvTQwHTo4vp2RApnCuj+C9tMiomilP7psWzWLGj9CRzt/G5ubD1ieTji84XNdw8MqzzreSv8inrJiAmy3ea2V+h+hdT1OvoOvrOSRTPqBoqW/ekjrOrYAdB77njyORgpu4N2Uzkm0xjYAUKR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de; spf=none smtp.mailfrom=h08.hostsharing.net; arc=none smtp.client-ip=176.9.242.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=h08.hostsharing.net
Received: from h08.hostsharing.net (h08.hostsharing.net [83.223.95.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "*.hostsharing.net", Issuer "RapidSSL TLS RSA CA G1" (verified OK))
	by bmailout3.hostsharing.net (Postfix) with ESMTPS id D57E32C09E2B;
	Fri, 12 Sep 2025 15:14:06 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id ABA63121533; Fri, 12 Sep 2025 15:14:06 +0200 (CEST)
Date: Fri, 12 Sep 2025 15:14:06 +0200
From: Lukas Wunner <lukas@wunner.de>
To: wufan@kernel.org
Cc: dhowells@redhat.com, ignat@cloudflare.com, herbert@gondor.apana.org.au,
	davem@davemloft.net, jarkko@kernel.org, zohar@linux.ibm.com,
	eric.snowberg@oracle.com, keyrings@vger.kernel.org,
	linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] KEYS: X.509: Fix Basic Constraints CA flag parsing
Message-ID: <aMQcnoETIt4t4Tqz@wunner.de>
References: <20250911225356.2678-1-wufan@kernel.org>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250911225356.2678-1-wufan@kernel.org>

On Thu, Sep 11, 2025 at 10:53:56PM +0000, wufan@kernel.org wrote:
> Fix the X.509 Basic Constraints CA flag parsing to correctly handle
> the ASN.1 DER encoded structure. The parser was incorrectly treating
> the length field as the boolean value.
> 
> According to ITU-T X.690 section 8.2, a BOOLEAN is encoded as:
> 
> Tag (0x01), Length (0x01), Value (0x00 for FALSE, non-zero for TRUE)
> 
> The basicConstraints extension with CA:TRUE is encoded as:
> 
>   SEQUENCE (0x30) | Length | BOOLEAN (0x01) | Length (0x01) | Value (0xFF)
>                              ^-- v[2]         ^-- v[3]        ^-- v[4]
> 
> The parser was checking v[3] (the length field, always 0x01) instead
> of v[4] (the actual boolean value, 0xFF for TRUE).

Excellent catch!  How did you find it?

> +++ b/crypto/asymmetric_keys/x509_cert_parser.c
> @@ -623,7 +625,7 @@ int x509_process_extension(void *context, size_t hdrlen,
>  		if (v[0] != (ASN1_CONS_BIT | ASN1_SEQ))
>  			return -EBADMSG;
>  		if (vlen < 2)
>  			return -EBADMSG;
>  		if (v[1] != vlen - 2)
>  			return -EBADMSG;
> -		if (vlen >= 4 && v[1] != 0 && v[2] == ASN1_BOOL && v[3] == 1)
> +		if (vlen >= 5 && v[1] != 0 && v[2] == ASN1_BOOL && v[3] == 1 && v[4] != 0)
>  			ctx->cert->pub->key_eflags |= 1 << KEY_EFLAG_CA;
>  		return 0;
>  	}

Your patch is correct, however the conditions ...

  vlen >= 5 && v[1] != 0 && v[2] == ASN1_BOOL && v[3] == 1

... all check well-formedness of the BasicConstraints object,
so it seems if any of those checks fails, -EBADMSG should be returned.

The check "if (vlen < 2)" could be changed to "if (vlen < 5)" because
5 bytes seems to be the minimum size of a well-formed BasicConstraints
object.  Then the "vlen >= 5" and "v[1] != 0" checks can be dropped.

Up to you whether to respin this patch or make those changes in
a separate patch on top.  And up to Herbert whether to take this
patch as is or wait for a respin.

Reviewed-by: Lukas Wunner <lukas@wunner.de>

I note that parsing the v[] array is quite error-prone and it
might have been better to either declare a packed struct for the
BasicConstraints object with human-readable member names,
or create a separate ASN.1 module for it.

Thanks,

Lukas

