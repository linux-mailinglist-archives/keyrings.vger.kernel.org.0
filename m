Return-Path: <keyrings+bounces-2459-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F2C37A647C3
	for <lists+keyrings@lfdr.de>; Mon, 17 Mar 2025 10:40:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F22933B1787
	for <lists+keyrings@lfdr.de>; Mon, 17 Mar 2025 09:40:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F12A8221540;
	Mon, 17 Mar 2025 09:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=hmeau.com header.i=@hmeau.com header.b="ovbYO/Vv"
X-Original-To: keyrings@vger.kernel.org
Received: from abb.hmeau.com (abb.hmeau.com [144.6.53.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C445191499;
	Mon, 17 Mar 2025 09:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=144.6.53.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742204444; cv=none; b=O50TOviDKHmKMqfiDsnXIPanL+ITlaHIg/CTEu+pN2YvU3mXBPiWp8aX685uGiC9amxJK4QdkPfwArnM4i0QbtRjVM59+XZC5eRfJteWPQG5KCBg537u4w6VQEwslG2U1M2kfhSSzn4fP5nyF36K1GR43Y4q6oT95K8a29fCMOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742204444; c=relaxed/simple;
	bh=vKsa82/alp2Pw+Qo2W+zdqWMBRjJH9mC48mDzzQzJcI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tQMJuMIK62dVYKZbYMaCfQbJUyDBBcn1HReqFojAHRz5XwZ2DCZm1Rak+tNPkKp5bout+7nRJLtRgr092I9NdRzND5vCc6/sglGHS2vM/jYHRv+QMvSHwonG97Ise0gdMx2949EQ9bqHFSvTXzixPBgMRHn0RoR4MhdMdJcaAaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au; spf=pass smtp.mailfrom=gondor.apana.org.au; dkim=pass (2048-bit key) header.d=hmeau.com header.i=@hmeau.com header.b=ovbYO/Vv; arc=none smtp.client-ip=144.6.53.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gondor.apana.org.au
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=84G8xbBYi/P6VLkHXla8LhcngS7NPWO6sd7sswK3vzs=; b=ovbYO/VvxJDUTNQN3VfSADVs2K
	5FYeC9TD62KDwIZ6e+OGx7DxYBr4iLtUx7kQHf160ORlAjXrliAE4uV61NALRQQh2kIkfh+VQOCYU
	15dQZuydjdIP1wdVAzDCAEX6C0mhgq4gXl7GYJCLbSRTMDjvcs68zyVQjI7pZp09RU2JJl4lQQ1XF
	YVp/Vk4e3w7uZgKW6cT6n7cGu9oSn1u4uNsAfGDCGLG5NdSohSZUwWuRpSxiG6ozEh10fng3/qTBb
	0tQuriOH/oNSp2YoKeZbM4+vZjYodIjpd2wfqp3sg/v5U4sc7Ddx5yF2WG8PiLf15fC26ABL5xirk
	BCw34dkQ==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1tu6xN-007VTa-1R;
	Mon, 17 Mar 2025 17:40:26 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Mon, 17 Mar 2025 17:40:25 +0800
Date: Mon, 17 Mar 2025 17:40:25 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Lukas Wunner <lukas@wunner.de>
Cc: "David S. Miller" <davem@davemloft.net>,
	Stefan Berger <stefanb@linux.ibm.com>,
	Vitaly Chikunov <vt@altlinux.org>,
	David Howells <dhowells@redhat.com>,
	Ignat Korchagin <ignat@cloudflare.com>,
	linux-crypto@vger.kernel.org, keyrings@vger.kernel.org
Subject: Re: [PATCH v2 3/4] crypto: ecdsa - Fix enc/dec size reported by
 KEYCTL_PKEY_QUERY
Message-ID: <Z9fuCTAAOphOvEeH@gondor.apana.org.au>
References: <cover.1738521533.git.lukas@wunner.de>
 <3d74d6134f4f87a90ebe0a37cb06c6ec144ceef7.1738521533.git.lukas@wunner.de>
 <Z9WQtFEbSYuat42Y@wunner.de>
 <Z9ftZxb60ZmDnalx@gondor.apana.org.au>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z9ftZxb60ZmDnalx@gondor.apana.org.au>

On Mon, Mar 17, 2025 at 05:37:43PM +0800, Herbert Xu wrote:
>
> I'll try to resurrect them in patchworks.

It's not letting me do that.  So please resend.

Thanks,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

