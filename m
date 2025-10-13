Return-Path: <keyrings+bounces-3214-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A9ECBD2044
	for <lists+keyrings@lfdr.de>; Mon, 13 Oct 2025 10:23:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8F0651898F3F
	for <lists+keyrings@lfdr.de>; Mon, 13 Oct 2025 08:23:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CA742EC0AF;
	Mon, 13 Oct 2025 08:23:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="O2nd+b5Z"
X-Original-To: keyrings@vger.kernel.org
Received: from out-188.mta1.migadu.com (out-188.mta1.migadu.com [95.215.58.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D8462EB5C9
	for <keyrings@vger.kernel.org>; Mon, 13 Oct 2025 08:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760343800; cv=none; b=GQFPmb48lQc4vVQenJ7n5rSLIV0XsHdoDBfj/BsuZakX6ts+OxlKgoxM3FSZhK3E5ehjgfm1QQ0fr/77RPb5G6PkWMDWeaBGFeTgw4VjshU3I3SGUflF4nslm/lbmE1UV4ykmaLovTHXythU8r5I0EOAGWKfiJxVrN+hXo2tHqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760343800; c=relaxed/simple;
	bh=1kR31gbBKnUscwS6ZTjsnygKJs8ivj+9YtUWNXRZP3Q=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=Lj89fq5eAsThVgX4l6QjJM7WeSVOuM9EnibLqoGEFNAP/5gumK0Tq2s4MX+q0W1w7S7vH6XAmXiUxOxuYWpEzOj0mms2+qyr4Vl3/1JHr7rL4OQvmmxugIGhcbjy/e6PsAbEWQ+pY41CPprzFCA35v/E8N7xOcO3pW71FXZ1kDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=O2nd+b5Z; arc=none smtp.client-ip=95.215.58.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Content-Type: text/plain;
	charset=us-ascii
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1760343786;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vvAwE+mYlFFTAsj2rEKkqTesljDavewgCpk7RarO+os=;
	b=O2nd+b5ZQqqRTbpp7mYz1uktv8h7XNclbxxqpyGymBYBngnMHmyYjuFOAgkEMdPm8i0pzh
	P+JyicDM6y7IsHrVTw1R7I7HNePuy38/7pTu2zdYsYE3XVc5zlyKySaLNJ/bZIVwE2lNnc
	qtcTON8QsOaizF3zblxb4jSQlMXxQAE=
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH v2 1/2] crypto: asymmetric_keys - prevent overflow in
 asymmetric_key_generate_id
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Thorsten Blum <thorsten.blum@linux.dev>
In-Reply-To: <aOybIZ2iqXExpTUw@wunner.de>
Date: Mon, 13 Oct 2025 10:23:01 +0200
Cc: David Howells <dhowells@redhat.com>,
 Ignat Korchagin <ignat@cloudflare.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>,
 Vivek Goyal <vgoyal@redhat.com>,
 stable@vger.kernel.org,
 keyrings@vger.kernel.org,
 linux-crypto@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <4AF8BE0F-D400-4020-A8F6-EF61A797A24E@linux.dev>
References: <20251012203841.60230-1-thorsten.blum@linux.dev>
 <aOybIZ2iqXExpTUw@wunner.de>
To: Lukas Wunner <lukas@wunner.de>
X-Migadu-Flow: FLOW_OUT

On 13. Oct 2025, at 08:24, Lukas Wunner wrote:
> On Sun, Oct 12, 2025 at 10:38:40PM +0200, Thorsten Blum wrote:
>> +++ b/crypto/asymmetric_keys/asymmetric_type.c
>> @@ -141,12 +142,14 @@ struct asymmetric_key_id =
*asymmetric_key_generate_id(const void *val_1,
>> 						     size_t len_2)
>> {
>> 	struct asymmetric_key_id *kid;
>> +	size_t len;
>>=20
>> -	kid =3D kmalloc(sizeof(struct asymmetric_key_id) + len_1 + =
len_2,
>> -		      GFP_KERNEL);
>> +	if (check_add_overflow(len_1, len_2, &len))
>> +		return ERR_PTR(-EOVERFLOW);
>> +	kid =3D kmalloc(struct_size(kid, data, len), GFP_KERNEL);
>=20
> This will add (at least) 2 bytes to len (namely the size of struct
> asymmetric_key_id)) and may cause an overflow (even if len_1 + len_2
> did not overflow).

Could you explain which part adds "(at least) 2 bytes to len"?

Thanks,
Thorsten


