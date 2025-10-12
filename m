Return-Path: <keyrings+bounces-3208-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 80AE0BD0296
	for <lists+keyrings@lfdr.de>; Sun, 12 Oct 2025 15:23:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EB15A3B866A
	for <lists+keyrings@lfdr.de>; Sun, 12 Oct 2025 13:23:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF8DB17A2FB;
	Sun, 12 Oct 2025 13:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="ditdHmn1"
X-Original-To: keyrings@vger.kernel.org
Received: from out-182.mta1.migadu.com (out-182.mta1.migadu.com [95.215.58.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAAD817A2E1
	for <keyrings@vger.kernel.org>; Sun, 12 Oct 2025 13:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760275395; cv=none; b=QU6k+tdqcjBy7TWYmFQmVnVFmEMxbZkr6i7jxP7u+a80ZM4fX+WWqI0ipl4vDTGkh/6suSGIq/teotK4RPRmhqE3kDgMxK2kFmd4FowfP5LX3rWHdxIsP7+pYTFiBqT/v70bnsNqnD1jT6JOpVjKzRRKVR9FreGLPmb2I/R+XAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760275395; c=relaxed/simple;
	bh=xW7vrgIMkFpkvysk3qIyoknOdvPYvzPU/rmAHSKgUhk=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=gXBftKzByF7fjBY1lZ+5Mdaivrj9M3iYJwTEPe+rRNv8eW0WhvWBuaSOk/Xiuy7VFX6zn2torWhpbTiSP7k6WNGOSW/hG71ycst6NjUsvQHBRxzB3VqGxSSRHBU350FmHvKAeDWbj4ED+LG7ahQ7QDTZFbb7V6SsqaF01JUedmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=ditdHmn1; arc=none smtp.client-ip=95.215.58.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Content-Type: text/plain;
	charset=us-ascii
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1760275389;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0VTZ3wDaUKClfqe3G2M5ryu4iWYV/VPU2x3dyoai7Wc=;
	b=ditdHmn1apksGr14p9GLn5bw0GfuwIdty4zG9l+y5vjJSaGlb+dGdPPIHYLYpH3jtKJqBP
	dx2ZNjIz92Tq4QQWqCOqO7L4/hCn11ZhdQJZirhALhV4JqTMIiElTFxAriM1eikmrDvNwQ
	BLehygD8621E03NMLx4E1JhRJ0rtCNc=
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH 2/2] crypto: asymmetric_keys - simplify
 asymmetric_key_hex_to_key_id
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Thorsten Blum <thorsten.blum@linux.dev>
In-Reply-To: <aOuavtSpoNLWHoMS@wunner.de>
Date: Sun, 12 Oct 2025 15:23:02 +0200
Cc: David Howells <dhowells@redhat.com>,
 Ignat Korchagin <ignat@cloudflare.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>,
 keyrings@vger.kernel.org,
 linux-crypto@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <A0C349D1-C7FA-40C6-971B-910122B1AAE1@linux.dev>
References: <20251007185220.234611-2-thorsten.blum@linux.dev>
 <20251007185220.234611-3-thorsten.blum@linux.dev>
 <aOuavtSpoNLWHoMS@wunner.de>
To: Lukas Wunner <lukas@wunner.de>
X-Migadu-Flow: FLOW_OUT

On 12. Oct 2025, at 14:10, Lukas Wunner wrote:
> On Tue, Oct 07, 2025 at 08:52:21PM +0200, Thorsten Blum wrote:
>> Use struct_size() to calculate the number of bytes to allocate for the
>> asymmetric key id.
> 
> Why?  To what end?  To guard against an overflow?

I find struct_size() to be more readable because it explicitly
communicates the relationship between the flexible array member 'data'
and 'asciihexlen / 2', which the open-coded version doesn't.

'sizeof(struct asymmetric_key_id) + asciihexlen / 2' works because the
flexible array 'data' is an unsigned char (1 byte). This will probably
never change, but struct_size() would still work even if it did change
to a data type that isn't exactly 1 byte.

Additionally, struct_size() has some extra compile-time checks (e.g.,
__must_be_array()).

>> -	ret = __asymmetric_key_hex_to_key_id(id, match_id, asciihexlen / 2);
>> -	if (ret < 0) {
>> +	if (__asymmetric_key_hex_to_key_id(id, match_id, hexlen) < 0) {
>> 		kfree(match_id);
>> 		return ERR_PTR(-EINVAL);
>> 	}
> 
> If anything, return ret instead of removing the ret variable.
> The only negative return value of __asymmetric_key_hex_to_key_id()
> is -EINVAL, hence that's returned directly here.

Ok, I'll change this in v2.

Thanks,
Thorsten


