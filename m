Return-Path: <keyrings+bounces-3342-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 41152C59F5D
	for <lists+keyrings@lfdr.de>; Thu, 13 Nov 2025 21:25:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 128FE3B650B
	for <lists+keyrings@lfdr.de>; Thu, 13 Nov 2025 20:23:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1932C3101A8;
	Thu, 13 Nov 2025 20:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="sRB3kHc4"
X-Original-To: keyrings@vger.kernel.org
Received: from out-172.mta1.migadu.com (out-172.mta1.migadu.com [95.215.58.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 376A42877F2
	for <keyrings@vger.kernel.org>; Thu, 13 Nov 2025 20:23:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763065402; cv=none; b=A79wWlS0VNvWOEb54qWCt4ryE/KvEa/5fgU6pDQoF0xgjJ2nCcZ8R9yJ/OkUgkbRbBCWMIFiTOrf6aEI65MzG3P/a4oSpVgAOMOtytUarDYVZv1nNbfCC8gfcwi09U3+CYYVgDH65xcFvHQz4vqPERkZRovupMPpfd+Hi4XPtgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763065402; c=relaxed/simple;
	bh=1EmXvRqwWJk/1eCiXdIX4GUSs27vYT0K7Xwt/Tdoa4M=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=N/ncKkazN50UVJPLH4IRb3FhOeOdcTnj+tWiF4kB5mZibZeBsfFy1gbLdpkZs9FkZWGQvlBV5e5YSiln3lDRwY/Bi8xSQtCky6rGjJytWRpKKWa8AqHWdU+rloNds6Q0ocY4idX+oeu7EB0Cxns61X00zzX+reC0D34kngIzC/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=sRB3kHc4; arc=none smtp.client-ip=95.215.58.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Content-Type: text/plain;
	charset=us-ascii
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1763065388;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9uKu64x57meNN+TtZY3bpRMMEpmt9YND75hWgxR8WSA=;
	b=sRB3kHc4HEC+f82cvLFkjSov1M+2akJC8aYLDdT06iuFr8MVwbUyzKBoqWUsnjAfkehaLr
	4Flpo4bo5e+pMGQfABeClGzCzOuhIr7sUDHpL1sdblyAX62TOLcl6uyrtq5w1PDSB+ssyx
	fEIeCcCS0IFNelNKIXIgLWjw4Mb3x0U=
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH] KEYS: encrypted: Replace deprecated strcpy and improve
 get_derived_key
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Thorsten Blum <thorsten.blum@linux.dev>
In-Reply-To: <20251113172913.GC1792@sol>
Date: Thu, 13 Nov 2025 21:23:01 +0100
Cc: Mimi Zohar <zohar@linux.ibm.com>,
 David Howells <dhowells@redhat.com>,
 Jarkko Sakkinen <jarkko@kernel.org>,
 Paul Moore <paul@paul-moore.com>,
 James Morris <jmorris@namei.org>,
 "Serge E. Hallyn" <serge@hallyn.com>,
 linux-hardening@vger.kernel.org,
 linux-integrity@vger.kernel.org,
 keyrings@vger.kernel.org,
 linux-security-module@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <C7360ADD-68AF-4305-A643-50CF5F44F7DC@linux.dev>
References: <20251113135831.98587-1-thorsten.blum@linux.dev>
 <20251113172913.GC1792@sol>
To: Eric Biggers <ebiggers@kernel.org>
X-Migadu-Flow: FLOW_OUT

On 13. Nov 2025, at 18:29, Eric Biggers wrote:
> [...]
> 
> This changes the resulting derived key when key_type == 0 &&
> master_keylen >= 24, because different bytes are passed to sha256().

I see, thanks. I'll submit a v2.


