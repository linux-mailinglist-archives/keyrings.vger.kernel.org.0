Return-Path: <keyrings+bounces-3207-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 27552BD01B1
	for <lists+keyrings@lfdr.de>; Sun, 12 Oct 2025 14:10:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C6E4B3AD6C0
	for <lists+keyrings@lfdr.de>; Sun, 12 Oct 2025 12:10:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2BCE25D527;
	Sun, 12 Oct 2025 12:10:50 +0000 (UTC)
X-Original-To: keyrings@vger.kernel.org
Received: from bmailout3.hostsharing.net (bmailout3.hostsharing.net [176.9.242.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E073216E23;
	Sun, 12 Oct 2025 12:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=176.9.242.62
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760271050; cv=none; b=WfAn1K4B1YombFqfSiMgBPUna/skNOvUGa6LQla9S7IR/UeAFeWdSIWnvwtUZoq8K8/fRwZg0uME8NiPEvjDHqwyfhZYU/fl5nl1TlPzXIsXjuhzx68knsOFw9ba3wra6atP55t48Ml5ftLECcd5PcMODTavBWJ4YZe/6ZLxq5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760271050; c=relaxed/simple;
	bh=Qp2sPur4CMjUQspmdKidAJIdyFfnmbYq0fXObkKFPXs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JKUIBZBLNyNnQitXnKfGCli0HG40Pqefr3zvulNH7RpARMsh4OdGoBh6EB8hLaaNUwMB+ztYp/a94DZhBhYIslZgyjVV6wlJC89FVBdXIPkZaEg5wXagG+Xf/GHbenBZaWr2L43I107RDNYGaUkCoL0jq3u0pqEnUw2mX2cmF3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de; spf=none smtp.mailfrom=h08.hostsharing.net; arc=none smtp.client-ip=176.9.242.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=h08.hostsharing.net
Received: from h08.hostsharing.net (h08.hostsharing.net [IPv6:2a01:37:1000::53df:5f1c:0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "*.hostsharing.net", Issuer "RapidSSL TLS RSA CA G1" (verified OK))
	by bmailout3.hostsharing.net (Postfix) with ESMTPS id AFBD92C02B85;
	Sun, 12 Oct 2025 14:10:38 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id 75A9D4A12; Sun, 12 Oct 2025 14:10:38 +0200 (CEST)
Date: Sun, 12 Oct 2025 14:10:38 +0200
From: Lukas Wunner <lukas@wunner.de>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: David Howells <dhowells@redhat.com>,
	Ignat Korchagin <ignat@cloudflare.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>, keyrings@vger.kernel.org,
	linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] crypto: asymmetric_keys - simplify
 asymmetric_key_hex_to_key_id
Message-ID: <aOuavtSpoNLWHoMS@wunner.de>
References: <20251007185220.234611-2-thorsten.blum@linux.dev>
 <20251007185220.234611-3-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251007185220.234611-3-thorsten.blum@linux.dev>

On Tue, Oct 07, 2025 at 08:52:21PM +0200, Thorsten Blum wrote:
> Use struct_size() to calculate the number of bytes to allocate for the
> asymmetric key id.

Why?  To what end?  To guard against an overflow?

I've gone through the callers of asymmetric_key_hex_to_key_id() and
it seems they all limit the length of the keyid.  Guarding against
an overflow in asymmetric_key_hex_to_key_id() could thus only be
justified as a defense-in-depth measure, but I doubt that's worth it.

Callers I've found:

- keyctl_keyring_search() [security/keys/keyctl.c]
    keyring_search()
      type->match_preparse() == asymmetric_key_match_preparse()
        asymmetric_key_hex_to_key_id()

  Here the size of the key id is constrained to 4096 bytes
  (KEY_MAX_DESC_SIZE) by keyctl_keyring_search().

- request_key() [security/keys/keyctl.c]
    request_key_and_link()
        type->match_preparse() == asymmetric_key_match_preparse()
          asymmetric_key_hex_to_key_id()

  Same here.

- asymmetric_verify() [security/integrity/digsig_asymmetric.c]
    request_asymmetric_key()
      find_asymmetric_key()
        keyring_search()
          type->match_preparse() == asymmetric_key_match_preparse()
            asymmetric_key_hex_to_key_id()

  Here the size of the key id is a 32-bit integer.

- pkcs7_validate_trust_one() [crypto/asymmetric_keys/pkcs7_trust.c]
    find_asymmetric_key()
      keyring_search()
        type->match_preparse() == asymmetric_key_match_preparse()
          asymmetric_key_hex_to_key_id()

  Here the key id in hexadecimal is constructed from its binary form,
  asymmetric_key_hex_to_key_id() then converts that back.  Naturally
  the back conversion shouldn't overflow.

- restrict_link_by_signature() [crypto/asymmetric_keys/restrict.c]
    find_asymmetric_key()
      keyring_search()
        type->match_preparse() == asymmetric_key_match_preparse()
          asymmetric_key_hex_to_key_id()

  Same here.

> +++ b/crypto/asymmetric_keys/asymmetric_type.c
> @@ -236,12 +236,11 @@ struct asymmetric_key_id *asymmetric_key_hex_to_key_id(const char *id)
>  	if (asciihexlen & 1)
>  		return ERR_PTR(-EINVAL);
>  
> -	match_id = kmalloc(sizeof(struct asymmetric_key_id) + asciihexlen / 2,
> -			   GFP_KERNEL);
> +	hexlen = asciihexlen / 2;
> +	match_id = kmalloc(struct_size(match_id, data, hexlen), GFP_KERNEL);
>  	if (!match_id)
>  		return ERR_PTR(-ENOMEM);

This doesn't look more readable to be honest.

> -	ret = __asymmetric_key_hex_to_key_id(id, match_id, asciihexlen / 2);
> -	if (ret < 0) {
> +	if (__asymmetric_key_hex_to_key_id(id, match_id, hexlen) < 0) {
>  		kfree(match_id);
>  		return ERR_PTR(-EINVAL);
>  	}

If anything, return ret instead of removing the ret variable.
The only negative return value of __asymmetric_key_hex_to_key_id()
is -EINVAL, hence that's returned directly here.

Thanks,

Lukas

