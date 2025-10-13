Return-Path: <keyrings+bounces-3215-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 53AC8BD20F3
	for <lists+keyrings@lfdr.de>; Mon, 13 Oct 2025 10:31:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DBD983BD08C
	for <lists+keyrings@lfdr.de>; Mon, 13 Oct 2025 08:31:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBE3B2EB867;
	Mon, 13 Oct 2025 08:31:30 +0000 (UTC)
X-Original-To: keyrings@vger.kernel.org
Received: from bmailout2.hostsharing.net (bmailout2.hostsharing.net [83.223.78.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5992F2EACF0;
	Mon, 13 Oct 2025 08:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=83.223.78.240
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760344290; cv=none; b=mPjyZauSFU5+vutA0ueMcX+V7+8HoOFVbxOFMcJ41sns2SH2CFlOHdw2aWvcbX8rspK9e5UhhDjR2v2foZJX8d992FJO/d+IwOksMcWmO7570Tw6CL1ARsyg6AEDhaAKAGudXyGBGCZkanZFgCO4vw3b6Ld7Sx9NJCWn0cKFPL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760344290; c=relaxed/simple;
	bh=5qxHhY7PZ7QHCzoQybgXMKX5rBZv0iExbyqZvi8fRGk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mYFBrPzKKMz6NTv8WASIi71ZpmD8p1VgB1uzUXX3f/J0E1Fmuqc6z6RFPDMfh2IJqP6Y3VGRK9J23jawsXpsRk+h0quQ3jQZ7eYzvD/Qu4pfYqQBbrwVTkRFKWfXU9VYDrcPlF8Q2riUZAC1SvWlz5Eu+CZaBu9t66gG3jBJdzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de; spf=none smtp.mailfrom=h08.hostsharing.net; arc=none smtp.client-ip=83.223.78.240
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=h08.hostsharing.net
Received: from h08.hostsharing.net (h08.hostsharing.net [IPv6:2a01:37:1000::53df:5f1c:0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "*.hostsharing.net", Issuer "RapidSSL TLS RSA CA G1" (verified OK))
	by bmailout2.hostsharing.net (Postfix) with ESMTPS id 42E3B200802F;
	Mon, 13 Oct 2025 10:31:25 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id 3C2544A12; Mon, 13 Oct 2025 10:31:25 +0200 (CEST)
Date: Mon, 13 Oct 2025 10:31:25 +0200
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
Message-ID: <aOy43TmVgWvzNGfB@wunner.de>
References: <20251012203841.60230-1-thorsten.blum@linux.dev>
 <aOybIZ2iqXExpTUw@wunner.de>
 <4AF8BE0F-D400-4020-A8F6-EF61A797A24E@linux.dev>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4AF8BE0F-D400-4020-A8F6-EF61A797A24E@linux.dev>

On Mon, Oct 13, 2025 at 10:23:01AM +0200, Thorsten Blum wrote:
> On 13. Oct 2025, at 08:24, Lukas Wunner wrote:
> > On Sun, Oct 12, 2025 at 10:38:40PM +0200, Thorsten Blum wrote:
> >> +++ b/crypto/asymmetric_keys/asymmetric_type.c
> >> @@ -141,12 +142,14 @@ struct asymmetric_key_id *asymmetric_key_generate_id(const void *val_1,
> >> 						     size_t len_2)
> >> {
> >> 	struct asymmetric_key_id *kid;
> >> +	size_t len;
> >> 
> >> -	kid = kmalloc(sizeof(struct asymmetric_key_id) + len_1 + len_2,
> >> -		      GFP_KERNEL);
> >> +	if (check_add_overflow(len_1, len_2, &len))
> >> +		return ERR_PTR(-EOVERFLOW);
> >> +	kid = kmalloc(struct_size(kid, data, len), GFP_KERNEL);
> > 
> > This will add (at least) 2 bytes to len (namely the size of struct
> > asymmetric_key_id)) and may cause an overflow (even if len_1 + len_2
> > did not overflow).
> 
> Could you explain which part adds "(at least) 2 bytes to len"?

The struct_size() macro performs another size_add() to add the
size of struct asymmetric_key_id (which is at least 2 bytes) to len:

#define struct_size(p, member, count)					\
	__builtin_choose_expr(__is_constexpr(count),			\
		sizeof(*(p)) + flex_array_size(p, member, count),	\
		size_add(sizeof(*(p)), flex_array_size(p, member, count)))
                ^^^^^^^^

So there's an addition of three numbers, yet you're only checking that
the addition of two of them doesn't overflow.

Thanks,

Lukas

