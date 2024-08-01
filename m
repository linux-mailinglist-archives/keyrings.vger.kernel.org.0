Return-Path: <keyrings+bounces-1850-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 81F61945473
	for <lists+keyrings@lfdr.de>; Fri,  2 Aug 2024 00:18:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3FADC1C22ADE
	for <lists+keyrings@lfdr.de>; Thu,  1 Aug 2024 22:18:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DDBD14A4E0;
	Thu,  1 Aug 2024 22:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ikSEaowM"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7B4F145352;
	Thu,  1 Aug 2024 22:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722550734; cv=none; b=IVM5oERUFXlyRYkgoTYkPfwwsRUH2SzFK5Bygv/emJLDGcbRWQeE2GA9C2yvDtktPJNHQHr9dUZzjzqRiDTSaIKtGIVTeb+DcJUvfo+9SsvSpIDpF2YU/9LPGl7xPbcCC53k/gG7OceZ7XHuUrl0+dm7zATPOLT4HYMstYDbg5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722550734; c=relaxed/simple;
	bh=XHBXDg/QCVVDyAvsC29+VmKlPwpZn++uqA4GGm3BPVA=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=V1+wivBffcedAEgD2qNZBfHe9NgDvCLJcahTOJRWYzqLUoZHEFp9PvtTT9tQ6bTBo7S8zHbjQ0DIYntvqlTdAVw8skMl8DsRRHL7yKKLZ/FFrpHbxGXBPSof7q7yNWJ3vSUdgEkNTUqcDdrAYgxtrjWJ8QAGoHTBovZQ+OqNLGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ikSEaowM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6730C4AF0A;
	Thu,  1 Aug 2024 22:18:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722550734;
	bh=XHBXDg/QCVVDyAvsC29+VmKlPwpZn++uqA4GGm3BPVA=;
	h=Date:To:Cc:Subject:From:References:In-Reply-To:From;
	b=ikSEaowMu2n/Jno351/5zqw1qfDOIG/mpdydEsUBQFheJIcg8kr+w0eAU/Nyr5hqW
	 8OD0nnCjcQcQ0fDonCZK+rP5p+aGPwc009tHR3FphI7DbMdZXHZ4xNE4ItUzVV2uWt
	 Y834husZXXyb6eVGR/G7b9rCMIsosjtE308IklN6oLizA/pWt6irQ9AA54G/gNMqIY
	 y97GpocPxr7Bv3sD0PoElWi+ao5oIdhTYHGDNIuV9CUCGlwua4hvCtBUjtqXwL1C2M
	 twBfaWjxax24/Arvwp5CXkF6KpRmpn73bck0n3R/M9KoROx3Bzzoe6W3oCXy4iWjrC
	 8kiw21nsD7pNw==
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 02 Aug 2024 01:18:50 +0300
Message-Id: <D34X9TBDRS5R.1FIX4R99A6XSR@kernel.org>
To: "Yue Haibing" <yuehaibing@huawei.com>, <dhowells@redhat.com>,
 <hare@suse.de>
Cc: <keyrings@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH resend -next] KEYS: Remove unused declarations
From: "Jarkko Sakkinen" <jarkko@kernel.org>
X-Mailer: aerc 0.17.0
References: <20240731074313.1349741-1-yuehaibing@huawei.com>
In-Reply-To: <20240731074313.1349741-1-yuehaibing@huawei.com>

On Wed Jul 31, 2024 at 10:43 AM EEST, Yue Haibing wrote:
> These declarations are never implemented, remove it.
>
> Signed-off-by: Yue Haibing <yuehaibing@huawei.com>
> Acked-by: Jarkko Sakkinen <jarkko@kernel.org>
> ---
>  include/keys/dns_resolver-type.h | 4 ----
>  include/linux/key.h              | 3 ---
>  2 files changed, 7 deletions(-)
>
> diff --git a/include/keys/dns_resolver-type.h b/include/keys/dns_resolver=
-type.h
> index 218ca22fb056..1b89088a2837 100644
> --- a/include/keys/dns_resolver-type.h
> +++ b/include/keys/dns_resolver-type.h
> @@ -12,8 +12,4 @@
> =20
>  extern struct key_type key_type_dns_resolver;
> =20
> -extern int request_dns_resolver_key(const char *description,
> -				    const char *callout_info,
> -				    char **data);
> -
>  #endif /* _KEYS_DNS_RESOLVER_TYPE_H */
> diff --git a/include/linux/key.h b/include/linux/key.h
> index 943a432da3ae..074dca3222b9 100644
> --- a/include/linux/key.h
> +++ b/include/linux/key.h
> @@ -436,9 +436,6 @@ extern key_ref_t keyring_search(key_ref_t keyring,
>  				const char *description,
>  				bool recurse);
> =20
> -extern int keyring_add_key(struct key *keyring,
> -			   struct key *key);
> -
>  extern int keyring_restrict(key_ref_t keyring, const char *type,
>  			    const char *restriction);
> =20


Applied!

BR, Jarkko

