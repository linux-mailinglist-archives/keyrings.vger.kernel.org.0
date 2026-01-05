Return-Path: <keyrings+bounces-3706-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AE25CF2CFB
	for <lists+keyrings@lfdr.de>; Mon, 05 Jan 2026 10:41:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B0D153008E8D
	for <lists+keyrings@lfdr.de>; Mon,  5 Jan 2026 09:39:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D2B9329C6D;
	Mon,  5 Jan 2026 09:39:24 +0000 (UTC)
X-Original-To: keyrings@vger.kernel.org
Received: from bmailout1.hostsharing.net (bmailout1.hostsharing.net [83.223.95.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E745817E4;
	Mon,  5 Jan 2026 09:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=83.223.95.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767605964; cv=none; b=nTlrEN9eqDHXPhQc6i+l/2z7Yg1KXdE95Z3jWXoJ/Mfz0hj2cj325o2ci1TwIlXkvl+2KhR/8VUgv0Q6kYBGJQeTB2JGiGDpgWHyTsN+OSlGMpNHTLYz3wX0j6DBQZUpG0af/fzbsP4UarWZY9B8tMxCHTIY/cCOEw4DIYllXX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767605964; c=relaxed/simple;
	bh=UFikyvASjf4cnVHZiuKEu/N2RjJlInQvr9u99jkJQfE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ycmc5vRVSwsgrqEB6xvLspXpep25FrMP+ee/B+dRB96xA7kI4eOzILtWShnH8hzL+J+IB9Q1E9jYyDq1ZlkDJY++PKb2NOwS1TZcQ2wDFxmgpGlJ4C7TK+j26ksYu4wv3CW7YTm/QlLsUc3NiKKXGt9Z/rW9CT6e0xhRdK48Q5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de; spf=none smtp.mailfrom=h08.hostsharing.net; arc=none smtp.client-ip=83.223.95.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=h08.hostsharing.net
Received: from h08.hostsharing.net (h08.hostsharing.net [83.223.95.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384
	 client-signature ECDSA (secp384r1) client-digest SHA384)
	(Client CN "*.hostsharing.net", Issuer "GlobalSign GCC R6 AlphaSSL CA 2025" (verified OK))
	by bmailout1.hostsharing.net (Postfix) with ESMTPS id 601702C06E2E;
	Mon,  5 Jan 2026 10:33:10 +0100 (CET)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id 5A68C30118; Mon,  5 Jan 2026 10:33:10 +0100 (CET)
Date: Mon, 5 Jan 2026 10:33:10 +0100
From: Lukas Wunner <lukas@wunner.de>
To: Daniel Gomez <da.gomez@kernel.org>
Cc: David Howells <dhowells@redhat.com>,
	Ignat Korchagin <ignat@cloudflare.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Jarkko Sakkinen <jarkko@kernel.org>,
	Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
	"Serge E. Hallyn" <serge@hallyn.com>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Aaron Tomlin <atomlin@atomlin.com>,
	Lucas De Marchi <demarchi@kernel.org>, keyrings@vger.kernel.org,
	linux-crypto@vger.kernel.org, linux-modules@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org,
	Daniel Gomez <da.gomez@samsung.com>
Subject: Re: [PATCH] KEYS: replace -EEXIST with -EBUSY
Message-ID: <aVuFVpjO3GFjG11-@wunner.de>
References: <20251220-dev-module-init-eexists-keyring-v1-1-a2f23248c300@samsung.com>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251220-dev-module-init-eexists-keyring-v1-1-a2f23248c300@samsung.com>

On Sat, Dec 20, 2025 at 04:50:31AM +0100, Daniel Gomez wrote:
> The -EEXIST error code is reserved by the module loading infrastructure
> to indicate that a module is already loaded. When a module's init
> function returns -EEXIST, userspace tools like kmod interpret this as
> "module already loaded" and treat the operation as successful, returning
> 0 to the user even though the module initialization actually failed.
> 
> This follows the precedent set by commit 54416fd76770 ("netfilter:
> conntrack: helper: Replace -EEXIST by -EBUSY") which fixed the same
> issue in nf_conntrack_helper_register().
> 
> Affected modules:
>   * pkcs8_key_parser x509_key_parser asymmetric_keys dns_resolver
>   * nvme_keyring pkcs7_test_key rxrpc turris_signing_key

For the record, GregKH summarily rejected this approach:

https://lore.kernel.org/r/2025122212-fiction-setback-ede5@gregkh/

Thanks,

Lukas

