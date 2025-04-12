Return-Path: <keyrings+bounces-2623-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 824EFA86A07
	for <lists+keyrings@lfdr.de>; Sat, 12 Apr 2025 03:24:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 75C23462FB0
	for <lists+keyrings@lfdr.de>; Sat, 12 Apr 2025 01:24:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F035A73477;
	Sat, 12 Apr 2025 01:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=hmeau.com header.i=@hmeau.com header.b="rd+/nIH9"
X-Original-To: keyrings@vger.kernel.org
Received: from abb.hmeau.com (abb.hmeau.com [144.6.53.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB152139CF2;
	Sat, 12 Apr 2025 01:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=144.6.53.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744421083; cv=none; b=QMLwreLxW/iwZHVwwmvvdrGoWipMNyGwiyna3xIxNOseOCrHJQuTfNYuG2PsokDKohP1u8tuSMkvx6uJtRvDg9VGTM6jBcQEBnug7sv/eRgUS1R6FXY0nmNCTRRfmlsz1GHMiCqfV0LJ3Rufx8fV4VOhkg1XfVO40OU6/zRlZLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744421083; c=relaxed/simple;
	bh=Sl3blZt11LsMNEX3jnGH35uukHgzRT3gat4aoNvi0dI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZcBABYdlgC/rTVwbvyk0aG1HhdELhjktvO2krn9xC7avexFeFRrKj9CF5T1gOUTT6m9cvGUmcx+biiVqRNoERm+nkltqgYTWUiMGxMzS5Yo6Xg5BLeM0+mVPQinL2n1PurQPY2v91bnnxLSo7YsucPcW78n7S9alv0YiolmNvsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au; spf=pass smtp.mailfrom=gondor.apana.org.au; dkim=pass (2048-bit key) header.d=hmeau.com header.i=@hmeau.com header.b=rd+/nIH9; arc=none smtp.client-ip=144.6.53.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gondor.apana.org.au
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=i3D8uqAyeJXdjGXrTJsEVPFeBnK4qn8Jh4ZEY/amgTc=; b=rd+/nIH98FqlH7HAOBg/U1Agm2
	ib0QvDX1oys+zvOdSMi04PXmkIaWWJ4oxBcR9oCjUXZ2PKBlKkxbYYN7oqzxhQ/GDgalKJGsj1GlM
	UebVJJKdSjwgryP0ZWTZv0mgPgj4r1rH3e7ojmimkmqA9sqhOk7r1iYBBsuiUj1/OQgqyOvpo+yNa
	8Qh2t/bsuuN+Klhho9rHzHlz36yq1FpRce09Ye8XMmZiW/pIkoS4AB6PbmwT2KSHxWvETJoFpzm5i
	Hx1imR43+eCboZfCzu/e5Es/uSMhRSBVjlCkjL6p3SpvpUev0pMhTd0WY/xwWHzdMowli+xmV/OYf
	KdR1vrMw==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1u3Pb1-00F1Dq-09;
	Sat, 12 Apr 2025 09:23:48 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Sat, 12 Apr 2025 09:23:47 +0800
Date: Sat, 12 Apr 2025 09:23:47 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: "Gupta, Nipun" <nipun.gupta@amd.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, davem@davemloft.net,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, krzk+dt@kernel.org,
	gregkh@linuxfoundation.org, robh@kernel.org, conor+dt@kernel.org,
	ogabbay@kernel.org, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
	simona@ffwll.ch, derek.kiernan@amd.com, dragan.cvetic@amd.com,
	arnd@arndb.de, praveen.jain@amd.com, harpreet.anand@amd.com,
	nikhil.agarwal@amd.com, srivatsa@csail.mit.edu, code@tyhicks.com,
	ptsm@linux.microsoft.com, linux-crypto@vger.kernel.org,
	David Howells <dhowells@redhat.com>, Lukas Wunner <lukas@wunner.de>,
	Ignat Korchagin <ignat@cloudflare.com>, keyrings@vger.kernel.org
Subject: Re: [PATCH v2 2/3] accel/amdpk: add driver for AMD PKI accelerator
Message-ID: <Z_nAo7UpzBqeXLbA@gondor.apana.org.au>
References: <20250409173033.2261755-1-nipun.gupta@amd.com>
 <20250409173033.2261755-2-nipun.gupta@amd.com>
 <20250410-sly-inventive-squirrel-ddecbc@shite>
 <bf851be7-74a5-8f9d-375b-b617691b6765@amd.com>
 <Z_imAnYu1hGRb8An@gondor.apana.org.au>
 <4f365fae-aae2-a0df-e8e9-268b536378b1@amd.com>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4f365fae-aae2-a0df-e8e9-268b536378b1@amd.com>

On Fri, Apr 11, 2025 at 11:50:54PM +0530, Gupta, Nipun wrote:
>
> AFAIU after looking into it, the keyring subsystem is not to perform the
> data operations, but for managing keys for these operations. Kindly correct
> me if I am wrong here.

Have a look at

security/keys/keyctl_pkey.c

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

