Return-Path: <keyrings+bounces-3100-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 01610BA6753
	for <lists+keyrings@lfdr.de>; Sun, 28 Sep 2025 05:56:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6E375189AC36
	for <lists+keyrings@lfdr.de>; Sun, 28 Sep 2025 03:56:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72C80270EBB;
	Sun, 28 Sep 2025 03:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hmeau.com header.i=@hmeau.com header.b="QpeuWzsw"
X-Original-To: keyrings@vger.kernel.org
Received: from abb.hmeau.com (abb.hmeau.com [180.181.231.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AFC626CE34;
	Sun, 28 Sep 2025 03:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=180.181.231.80
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759031780; cv=none; b=QJu276uz0n0I8RhHZixfIUGW3exqiZNHgKoMK1BOA9eA2xXhpLiUOOhOKOM4GIoAk1a2ybTO3HTaJl4tfnIkcQym97XRQM1Z0Hon5vjA06GS650IOWhl43ukY9+ktUYq2gC0gc+doUfc1zRzCBqzthDAucXuKU/IzkXrESxfHHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759031780; c=relaxed/simple;
	bh=OIfasNa+ag1qvbefr0z6kW2GWY/WyHW5gLYWTh1ReSE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SYQ+ZnUOGyiXX6k46KokQ6OhOGDT+V2Kwf17elKb/F9dxszfTBCi7d2/peLFVHyoBfMcXnNK2CJHn9oJVy1U7FOvPQZia2kXDt7RPJRI34idByeAlCSk5+nFxlwgHoylMZRxfa2rZXd0byTznazMu4Bim3ClN64vcwL3jQ3kiek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au; spf=pass smtp.mailfrom=gondor.apana.org.au; dkim=pass (2048-bit key) header.d=hmeau.com header.i=@hmeau.com header.b=QpeuWzsw; arc=none smtp.client-ip=180.181.231.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gondor.apana.org.au
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:
	From:Date:cc:to:subject:message-id:date:from:reply-to;
	bh=pr1Dpmut/fehj9bXBF3Tni2TXwBYKjIbf2dKQjxeX1A=; b=QpeuWzsw7+1mh6uWvn9WCxxp2C
	hmqgHsX45A3NIUAJ0YCFGUiJsQeIlWDNkyfxQcwiA/2GHaKw9Mx23xCCHDaLdOFeU7AVC/gAE0FTp
	IGGhHRvjSiUmanNTTLiF6t8QWLiqHr39ukfJZyjx7QWYMl+3xxUI8SdQZko/4V7lSkD+ilVIN+hqC
	m8K1PLtv6dC9SnpMk8BSRg3/VoJMNcH5qZcI2PNsRx5mFVgwV3uhEuVBEbZfolxpXIqftu0BWLzDv
	7JwrrOBh/frbn5bCcOUpsOhbWwo7a4ltw//DFUCJN/tGGTd7akCo0O2DSJwq8cVt5NDJIuHIbdgi4
	60qSpjpA==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1v2iW9-008qQ2-0H;
	Sun, 28 Sep 2025 11:56:10 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Sun, 28 Sep 2025 11:56:09 +0800
Date: Sun, 28 Sep 2025 11:56:09 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: wufan@kernel.org
Cc: keyrings@vger.kernel.org, linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org, dhowells@redhat.com, lukas@wunner.de,
	ignat@cloudflare.com, davem@davemloft.net, jarkko@kernel.org,
	zohar@linux.ibm.com, eric.snowberg@oracle.com
Subject: Re: [PATCH v2] KEYS: X.509: Fix Basic Constraints CA flag parsing
Message-ID: <aNix2dfs0FC74Zi2@gondor.apana.org.au>
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
> From: Fan Wu <wufan@kernel.org>
> 
> Fix the X.509 Basic Constraints CA flag parsing to correctly handle
> the ASN.1 DER encoded structure. The parser was incorrectly treating
> the length field as the boolean value.
> 
> Per RFC 5280 section 4.1, X.509 certificates must use ASN.1 DER encoding.
> According to ITU-T X.690, a DER-encoded BOOLEAN is represented as:
> 
> Tag (0x01), Length (0x01), Value (0x00 for FALSE, 0xFF for TRUE)
> 
> The basicConstraints extension with CA:TRUE is encoded as:
> 
>   SEQUENCE (0x30) | Length | BOOLEAN (0x01) | Length (0x01) | Value (0xFF)
>                              ^-- v[2]         ^-- v[3]        ^-- v[4]
> 
> The parser was checking v[3] (the length field, always 0x01) instead
> of v[4] (the actual boolean value, 0xFF for TRUE in DER encoding).
> 
> Also handle the case where the extension is an empty SEQUENCE (30 00),
> which is valid for CA:FALSE when the default value is omitted as
> required by DER encoding rules (X.690 section 11.5).
> 
> Per ITU-T X.690-0207:
> - Section 11.5: Default values must be omitted in DER
> - Section 11.1: DER requires TRUE to be encoded as 0xFF
> 
> Link: https://datatracker.ietf.org/doc/html/rfc5280
> Link: https://www.itu.int/ITU-T/studygroups/com17/languages/X.690-0207.pdf
> Fixes: 30eae2b037af ("KEYS: X.509: Parse Basic Constraints for CA")
> Signed-off-by: Fan Wu <wufan@kernel.org>
> ---
>  crypto/asymmetric_keys/x509_cert_parser.c | 16 ++++++++++++----
>  1 file changed, 12 insertions(+), 4 deletions(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

