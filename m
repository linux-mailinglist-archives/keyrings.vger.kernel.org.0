Return-Path: <keyrings+bounces-2425-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DFEEA4B056
	for <lists+keyrings@lfdr.de>; Sun,  2 Mar 2025 08:48:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 160F63AAFB4
	for <lists+keyrings@lfdr.de>; Sun,  2 Mar 2025 07:48:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D92A71CAA99;
	Sun,  2 Mar 2025 07:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=hmeau.com header.i=@hmeau.com header.b="H7UPu291"
X-Original-To: keyrings@vger.kernel.org
Received: from abb.hmeau.com (abb.hmeau.com [144.6.53.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D03C1CAA80;
	Sun,  2 Mar 2025 07:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=144.6.53.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740901701; cv=none; b=qnz3TIUgNHKnNzaGIB6Kf5L0+dRww7KJCGw+qWnQytMmCiL/RGA7TQ42QYonPGDl7Rx2QVz6i1myTw0RYOthFrwOb7xrcs5Jq5GzCL/fsOqWk9gcLtto4DAOHjdkplnlk2fcTZH8PPjFx9i0BQaO/nJAHNEKyhRLZryXhkW1jfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740901701; c=relaxed/simple;
	bh=gxcNzhUAbbMnadRwLKmsEqwOeLEf+LcbPnXXmHY9DeE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PMtpXW2AscZnzC+qzF0nxxKNG727dGWDFFjQDGRSSnN1j4s84Yawb8H7OmciUDO74gmTrYBGdWB3EC0joq38LlKvIg6t7Qhsf98Pjz54J40zo8agAxPUrCaTBYX+pHnkKUDTljNbAsn6Wk7+phtzIbWvw21mePaESIxzqCClzBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au; spf=pass smtp.mailfrom=gondor.apana.org.au; dkim=pass (2048-bit key) header.d=hmeau.com header.i=@hmeau.com header.b=H7UPu291; arc=none smtp.client-ip=144.6.53.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gondor.apana.org.au
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=q4tMciyVQqcFrGw/27BWcTPClf6ozhyVrTYo1K7XZb8=; b=H7UPu291m3DmwdR1kwW/YEy4jP
	jjMtFCFm5lKXOl9sB5FfTkvHv4n9vpg7KKqX8ej4uohjgBTfls6nYfo9e/Ybx0goaB1+DrSRDgwPP
	XP+CbGWB2SPriQU6GiU4JIIhpHonnmxNzPs6vR+w6/dut+ZRI6aP1drhM6FD4dn75Gru1nHBbionS
	aO4tzt4aqad7WWdfxzLSh+a7+D4RXx4c3kmjK8HaJ8Yq6GrKhN0CVkZQ8vzJllSnZizs0UpvNV8Hf
	rVIbKqG8ZVpVVfOkCyhHDwsokpMxBEXL3MSXyyztM1vUGwVgcZj4m6CK7Zd0FmUYZgY3BBz5B2mcM
	JQwrTcpQ==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1toe3C-0030fO-0Q;
	Sun, 02 Mar 2025 15:47:51 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Sun, 02 Mar 2025 15:47:50 +0800
Date: Sun, 2 Mar 2025 15:47:50 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Lukas Wunner <lukas@wunner.de>
Cc: "David S. Miller" <davem@davemloft.net>,
	Stefan Berger <stefanb@linux.ibm.com>,
	Vitaly Chikunov <vt@altlinux.org>,
	David Howells <dhowells@redhat.com>,
	Ignat Korchagin <ignat@cloudflare.com>,
	linux-crypto@vger.kernel.org, keyrings@vger.kernel.org,
	Eric Biggers <ebiggers@google.com>
Subject: Re: [PATCH v2 3/4] crypto: ecdsa - Fix enc/dec size reported by
 KEYCTL_PKEY_QUERY
Message-ID: <Z8QNJqQKhyyft_gz@gondor.apana.org.au>
References: <cover.1738521533.git.lukas@wunner.de>
 <3d74d6134f4f87a90ebe0a37cb06c6ec144ceef7.1738521533.git.lukas@wunner.de>
 <Z6h8L0D-CBhZUiVR@gondor.apana.org.au>
 <Z6iRssS26IOjWbfx@wunner.de>
 <Z6mwxUaS33EastB3@gondor.apana.org.au>
 <Z6pLRRJFOml8w61S@wunner.de>
 <Z7FnYEN-OnR_-7sP@gondor.apana.org.au>
 <Z7HBsONxj_q0BkJU@wunner.de>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z7HBsONxj_q0BkJU@wunner.de>

On Sun, Feb 16, 2025 at 11:45:04AM +0100, Lukas Wunner wrote:
>
> I think the best option at this point isn't to aim for removal
> but to wait for Cloudflare to beat their out-of-tree implementation
> (which apparently isn't susceptible to side channel attacks)
> into shape so that it can be upstreamed.

I don't think having a one-off fix is sufficient.  We need someone
who can maintain this for the long term.  Are you willing to do this?

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

