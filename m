Return-Path: <keyrings+bounces-2398-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E825BA306B8
	for <lists+keyrings@lfdr.de>; Tue, 11 Feb 2025 10:16:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 935B0164ABF
	for <lists+keyrings@lfdr.de>; Tue, 11 Feb 2025 09:16:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B55BB1EF0A9;
	Tue, 11 Feb 2025 09:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=hmeau.com header.i=@hmeau.com header.b="bTtiaIHX"
X-Original-To: keyrings@vger.kernel.org
Received: from abb.hmeau.com (abb.hmeau.com [144.6.53.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68A7C1E3DD8;
	Tue, 11 Feb 2025 09:16:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=144.6.53.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739265403; cv=none; b=JpIk1Z5iBNQkeP/tmaqgk2xx6FwA+ryskPX9z3kalGWGHCV+jxJTyBjj/R4ZelWuSbB8Ui11VEs7DpgsPfv7ixfeqZLCt2V9krGJpeXXbX1hKXaeW09ANhMXFbJRWqe28xEaA+ZGysk6X51WZm6OdjBpi/+/p+l4tJy5ZEJ9j4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739265403; c=relaxed/simple;
	bh=drdn/ZjU4hLVJ3bOmUaCEGwaSmywUfVCGhFpb/EHv+0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TZkva2d7Xvc9nHSAWW/FcTqeRHYNWEVY3tkw3HK8giJrelJW+fBeFtUsw+lkpgLLsj9ykKvedkNLDLPrsgsSBzb2MuGfcoaJXr9DIJ2WCmjuaFmWpXjggN+JAFzR8oZAakaMXlXMT4TMCwCUv/zu7I2wXn5b1+pgM/HMNwr6Hqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au; spf=pass smtp.mailfrom=gondor.apana.org.au; dkim=pass (2048-bit key) header.d=hmeau.com header.i=@hmeau.com header.b=bTtiaIHX; arc=none smtp.client-ip=144.6.53.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gondor.apana.org.au
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=RtmKp7CRr1Flxk41VrLFdrQFW24xoWI9GMtEuwWDiTc=; b=bTtiaIHXJ2n6Exo67PVGh6iKiY
	KqeGVzs4bDyKUaQtbwDj+hwNFLU+Ck8bBkr1V5N1Hz+n1pyN2WxhHTYYdKW71i98p2g4xHB9MQ0SL
	356qJ4HKq8Du9bBc2SFRJbN55nx0QApfKpT7DIO77yw6myjBfMkhP91EtXfrYi2CvyI7GbsE73NbC
	vZQax1itKr6Lo7SrF5kWCdGSNUMPVdl2U9At9+Xy5NQbYrDtGFby6NgXYM7XaL4GW6FoW/1aMyLHh
	okv6oIeDdpam/1ZKdbRcrv5Ar46ss5ecK88fPzvCdWpvXfy7VZWS3O/hSGiOCgrgt4fqTGEtJhlJe
	10g4d0+w==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1thmAX-00GyWF-1Y;
	Tue, 11 Feb 2025 17:16:23 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Tue, 11 Feb 2025 17:16:22 +0800
Date: Tue, 11 Feb 2025 17:16:22 +0800
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
Message-ID: <Z6sVZuK9h8aSviD7@gondor.apana.org.au>
References: <cover.1738521533.git.lukas@wunner.de>
 <3d74d6134f4f87a90ebe0a37cb06c6ec144ceef7.1738521533.git.lukas@wunner.de>
 <Z6h8L0D-CBhZUiVR@gondor.apana.org.au>
 <Z6iRssS26IOjWbfx@wunner.de>
 <Z6mwxUaS33EastB3@gondor.apana.org.au>
 <Z6pLRRJFOml8w61S@wunner.de>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z6pLRRJFOml8w61S@wunner.de>

On Mon, Feb 10, 2025 at 07:53:57PM +0100, Lukas Wunner wrote:
>
> It does use the private key part:
> 
> It takes advantage of the kernel's Key Retention Service for EAP-TLS,
> which generally uses mutual authentication.  E.g. clients authenticate
> against a wireless hotspot.  Hence it does invoke KEYCTL_PKEY_SIGN and
> KEYCTL_PKEY_ENCRYPT (with private keys, obviously).

Well if it wishes to keep this going, then someone will have to
step up and maintain these algorithms and make them secure against
side-channel attacks.

In the absence of that, this functionality should be removed
from the kernel.

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

