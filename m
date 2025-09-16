Return-Path: <keyrings+bounces-3010-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 25DA9B59AE7
	for <lists+keyrings@lfdr.de>; Tue, 16 Sep 2025 16:54:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DAE953A40D7
	for <lists+keyrings@lfdr.de>; Tue, 16 Sep 2025 14:54:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A17C9341655;
	Tue, 16 Sep 2025 14:52:57 +0000 (UTC)
X-Original-To: keyrings@vger.kernel.org
Received: from bmailout1.hostsharing.net (bmailout1.hostsharing.net [83.223.95.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FA58309DB0;
	Tue, 16 Sep 2025 14:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=83.223.95.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758034377; cv=none; b=uI4k5yiRqYdfUlt6/AO3BpicFhxMWJ3W7c+vWqKTIFlWtIJ/1Mwu8MUV7G/vB85S8BD3v5oyXLRXICaPcoCr7elE0JH5Vb2tutwXtc2lMXeuQmRgG9WogOx3xi/uz6v4Jf2gmY6SOkOqNBTe4b6VGB+Yx5QIYqwuWDHTYjjWFfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758034377; c=relaxed/simple;
	bh=uWFwdCKgY4KtJCBw76nmYl/luYzpUeAdJ6G3lD0fkpk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HF1bKk+DEVOfY1y108l1wH5dP0wsW2iScF1d5RhnlC8NAIQKtBTUN3d1SlJOAYhpfFYbHQJZA6/pZPLJoA3q0iEkefD15oWUyECj5eXMcSRE7HaJeWBCM88uqrnyvA8zAmfyy+2Q897hdBjvAr+89/bRB/EAei97KN2Hkh9gkDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de; spf=none smtp.mailfrom=h08.hostsharing.net; arc=none smtp.client-ip=83.223.95.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=h08.hostsharing.net
Received: from h08.hostsharing.net (h08.hostsharing.net [83.223.95.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "*.hostsharing.net", Issuer "RapidSSL TLS RSA CA G1" (verified OK))
	by bmailout1.hostsharing.net (Postfix) with ESMTPS id E5F862C06649;
	Tue, 16 Sep 2025 16:52:44 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id D6FE235A08; Tue, 16 Sep 2025 16:52:44 +0200 (CEST)
Date: Tue, 16 Sep 2025 16:52:44 +0200
From: Lukas Wunner <lukas@wunner.de>
To: wufan@kernel.org
Cc: keyrings@vger.kernel.org, linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org, dhowells@redhat.com,
	ignat@cloudflare.com, herbert@gondor.apana.org.au,
	davem@davemloft.net, jarkko@kernel.org, zohar@linux.ibm.com,
	eric.snowberg@oracle.com
Subject: Re: [PATCH v2] KEYS: X.509: Fix Basic Constraints CA flag parsing
Message-ID: <aMl5vAB1qmRw6eZT@wunner.de>
References: <20250911225356.2678-1-wufan@kernel.org>
 <20250915211550.2610-1-wufan@kernel.org>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250915211550.2610-1-wufan@kernel.org>

On Mon, Sep 15, 2025 at 09:15:50PM +0000, wufan@kernel.org wrote:
> Fix the X.509 Basic Constraints CA flag parsing to correctly handle
> the ASN.1 DER encoded structure. The parser was incorrectly treating
> the length field as the boolean value.
[...]
> Link: https://datatracker.ietf.org/doc/html/rfc5280
> Link: https://www.itu.int/ITU-T/studygroups/com17/languages/X.690-0207.pdf
> Fixes: 30eae2b037af ("KEYS: X.509: Parse Basic Constraints for CA")
> Signed-off-by: Fan Wu <wufan@kernel.org>

Reviewed-by: Lukas Wunner <lukas@wunner.de>

> @@ -623,8 +626,13 @@ int x509_process_extension(void *context, size_t hdrlen,
>  			return -EBADMSG;
>  		if (v[1] != vlen - 2)
>  			return -EBADMSG;
> -		if (vlen >= 4 && v[1] != 0 && v[2] == ASN1_BOOL && v[3] == 1)
> +		/* Empty SEQUENCE means CA:FALSE (default value omitted per DER) */
> +		if (v[1] == 0)
> +			return 0;
> +		if (vlen >= 5 && v[2] == ASN1_BOOL && v[3] == 1 && v[4] == 0xFF)
>  			ctx->cert->pub->key_eflags |= 1 << KEY_EFLAG_CA;
> +		else
> +			return -EBADMSG;
>  		return 0;
>  	}

For anyone who didn't follow the discussion and/or isn't familiar
with ASN.1, the patch first checks for a well-formed "CA:FALSE",
then checks for a well-formed "CA:TRUE", finally rejects anything
else as malformed.

Thanks,

Lukas

