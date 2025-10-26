Return-Path: <keyrings+bounces-3277-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E181C0A55B
	for <lists+keyrings@lfdr.de>; Sun, 26 Oct 2025 10:20:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 3A8B9346BAA
	for <lists+keyrings@lfdr.de>; Sun, 26 Oct 2025 09:20:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F44420B7E1;
	Sun, 26 Oct 2025 09:20:29 +0000 (UTC)
X-Original-To: keyrings@vger.kernel.org
Received: from bmailout1.hostsharing.net (bmailout1.hostsharing.net [83.223.95.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCC7E29CE1;
	Sun, 26 Oct 2025 09:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=83.223.95.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761470428; cv=none; b=sVpCoS+Y7sF6ji27N7RGu2vKfazd2tovYcMY66hb6ZXpt36Lq9XPo6whfyi9IVF+DBxHDWLc3WEAFdrSkBKWL3sYAzQs+/zhomPAnAi/BCO8r4IK6h8KLmiVad/rhO4Irf1V5AnSt2UFgehnsgkzqRBWUWg/NF7woHMqPSt4NPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761470428; c=relaxed/simple;
	bh=pm+w35RRQqugC7LYqKdn/s8gmhqaCcoLYgXqWUd7GS8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QSfNirCzBjmtEBPEuxWVpOSWXzVT1rvSMyZYraECymylju/EFpaFBRjVAHXNITUpqq9XSxiYTc+w/BhJgtVnq1OKa4HosELf5QLgQktUUD7UBiMdlk3GQEMOka2Z+znAgthaHeN0DuTXkfX2CXugsjLKFpu4igtdpuLk5qo/w6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de; spf=none smtp.mailfrom=h08.hostsharing.net; arc=none smtp.client-ip=83.223.95.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=h08.hostsharing.net
Received: from h08.hostsharing.net (h08.hostsharing.net [IPv6:2a01:37:1000::53df:5f1c:0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "*.hostsharing.net", Issuer "RapidSSL TLS RSA CA G1" (verified OK))
	by bmailout1.hostsharing.net (Postfix) with ESMTPS id C66592C06404;
	Sun, 26 Oct 2025 10:20:17 +0100 (CET)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id B15714A12; Sun, 26 Oct 2025 10:20:17 +0100 (CET)
Date: Sun, 26 Oct 2025 10:20:17 +0100
From: Lukas Wunner <lukas@wunner.de>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: David Howells <dhowells@redhat.com>,
	Ignat Korchagin <ignat@cloudflare.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>, keyrings@vger.kernel.org,
	linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] keys: Remove unnecessary local variable from
 ca_keys_setup
Message-ID: <aP3n0Rn0UMW3_rj9@wunner.de>
References: <20251023143231.2086-2-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251023143231.2086-2-thorsten.blum@linux.dev>

On Thu, Oct 23, 2025 at 04:32:31PM +0200, Thorsten Blum wrote:
> The variable 'ret', whose name implies a return variable, is only used
> to temporarily store the result of __asymmetric_key_hex_to_key_id().
> Use the result directly and remove the local variable.
[...]
> +++ b/crypto/asymmetric_keys/restrict.c
> @@ -29,15 +29,13 @@ static int __init ca_keys_setup(char *str)
>  	if (strncmp(str, "id:", 3) == 0) {
>  		struct asymmetric_key_id *p = &cakey.id;
>  		size_t hexlen = (strlen(str) - 3) / 2;
> -		int ret;
>  
>  		if (hexlen == 0 || hexlen > sizeof(cakey.data)) {
>  			pr_err("Missing or invalid ca_keys id\n");
>  			return 1;
>  		}
>  
> -		ret = __asymmetric_key_hex_to_key_id(str + 3, p, hexlen);
> -		if (ret < 0)
> +		if (__asymmetric_key_hex_to_key_id(str + 3, p, hexlen) < 0)
>  			pr_err("Unparsable ca_keys id hex string\n");
>  		else
>  			ca_keyid = p;	/* owner key 'id:xxxxxx' */

Quite honestly I don't think this change constitutes a worthwhile
improvement.

Those "if (ret)" checks are everywhere in the kernel, it's a pattern
that developers have grown accustomed to and immediately understand
when reading the code.  If it takes an extra variable declaration,
so be it.

For people (like me) who frequently have to dig in the git history
with recursive "git blame", changes like this one make life harder
because it introduces an extra step when trying to understand from
which commit a particular line of code originated.

And so changes like this one which are merely motivated by personal
stylistic preferences become a net negative.

Thanks,

Lukas

