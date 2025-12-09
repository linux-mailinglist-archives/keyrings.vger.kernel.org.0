Return-Path: <keyrings+bounces-3552-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D8ACACAF1CA
	for <lists+keyrings@lfdr.de>; Tue, 09 Dec 2025 08:19:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 958CE301F8E9
	for <lists+keyrings@lfdr.de>; Tue,  9 Dec 2025 07:19:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABCCD19ABD8;
	Tue,  9 Dec 2025 07:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G8SudipJ"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E207DF76;
	Tue,  9 Dec 2025 07:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765264795; cv=none; b=PZ8evT1UZcQLQwwsLMw6BoKmcpEUmrZdz1BjuF0QKiWU4SEC3qWLQTP00ztZAdV3weLZQOvil7ClDtmpiY9sWl14JYxNYxEO+8sVHDhVQJA2mfbQGLF7wE1ZG+16Y3cBAf28sGiZwVQ0Yc4xylTynEKrZr/fCKliKEmEHYCMFwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765264795; c=relaxed/simple;
	bh=8yQ7Z0gNj1ITYP/xrSjdCimRNjC4VKPXNm0+rC4dlNI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rmo1868d1x34A5PRfUBc1L5aYlfJ5a4BgJiLwXhD9k5jIbUpoi/JkpwmiadAVcgcvquZlq9Mh+MvzKr0LB2yyrPEl6h6rnXITgA9CnUzbhAo8UsU0+O+4Jaw7UZ3v35l/ZfD9+bcau6pDPpZpAgQ5uOkudPZpYZzIxOgQOK7mak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G8SudipJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA140C4CEF5;
	Tue,  9 Dec 2025 07:19:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765264795;
	bh=8yQ7Z0gNj1ITYP/xrSjdCimRNjC4VKPXNm0+rC4dlNI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=G8SudipJLm2azSw5zq0m1/9RW5evsu7DrusLVR95om7Ja1kW0fLGlB1xxFpFJt51w
	 eqSLURESSRgYvnMTwoUDrWYb3TJ9n4Y3KSN9jNmglEc1/pDA6r9Km+WEGowiRfzORj
	 2i24EKDMD5FrdrfsKaISN1NU+IfdYp8XM6qAsEm8y4EvVoscnlf+GCiqLFb+9AADUa
	 ypqLHur/9Sr86fjTOZzyOwCYybaI1PnCjg6j9si0L5t1zlyJJyq9ISslx4T2ucXL0s
	 iPPKyIO1ZGAhb+F29i37oRQ0PYLT4Ck7umGdp8xmSAFwsdDDLXkOk/91G2XnGZptF2
	 CbPqQsdLV3e4g==
Date: Tue, 9 Dec 2025 09:19:51 +0200
From: Jarkko Sakkinen <jarkko@kernel.org>
To: linux-integrity@vger.kernel.orgg
Cc: James Bottomley <James.Bottomley@hansenpartnership.com>,
	Mimi Zohar <zohar@linux.ibm.com>,
	David Howells <dhowells@redhat.com>,
	Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
	"Serge E. Hallyn" <serge@hallyn.com>,
	"open list:KEYS-TRUSTED" <keyrings@vger.kernel.org>,
	"open list:SECURITY SUBSYSTEM" <linux-security-module@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] KEYS: trusted: Don't use 'buf->handles'
Message-ID: <aTfNl2nhJkjcOG5J@kernel.org>
References: <20251209071144.56893-1-jarkko@kernel.org>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251209071144.56893-1-jarkko@kernel.org>

On Tue, Dec 09, 2025 at 09:11:43AM +0200, Jarkko Sakkinen wrote:
> tpm2_unseal_trusted() deduces number of handles in run-time even tho the
> expected value is known at compile time. Address the issue.
> 
> Signed-off-by: Jarkko Sakkinen <jarkko@kernel.org>
> ---
>  security/keys/trusted-keys/trusted_tpm2.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/security/keys/trusted-keys/trusted_tpm2.c b/security/keys/trusted-keys/trusted_tpm2.c
> index 9074ae1a5896..e78061ee2d99 100644
> --- a/security/keys/trusted-keys/trusted_tpm2.c
> +++ b/security/keys/trusted-keys/trusted_tpm2.c
> @@ -491,7 +491,7 @@ static int tpm2_unseal_cmd(struct tpm_chip *chip,
>  		if (tpm2_chip_auth(chip)) {
>  			tpm_buf_append_hmac_session(chip, buf, TPM2_SA_ENCRYPT, NULL, 0);
>  		} else  {
> -			offset = buf->handles * 4 + TPM_HEADER_SIZE;
> +			offset = TPM_HEADER_SIZE + 2 * sizeof(u32);

Oops.

Should be 'TPM_HEADER_SIZE + sizeof(u32)'. There's just a single handle.

>  			head = (struct tpm_header *)buf->data;
>  			if (tpm_buf_length(buf) == offset)
>  				head->tag = cpu_to_be16(TPM2_ST_NO_SESSIONS);
> -- 
> 2.39.5
> 

BR, Jarkko

