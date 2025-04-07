Return-Path: <keyrings+bounces-2601-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 99B5AA7DEE1
	for <lists+keyrings@lfdr.de>; Mon,  7 Apr 2025 15:22:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C87CB188AD8D
	for <lists+keyrings@lfdr.de>; Mon,  7 Apr 2025 13:20:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42691253F15;
	Mon,  7 Apr 2025 13:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Y8KN6859"
X-Original-To: keyrings@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97F3F253B75
	for <keyrings@vger.kernel.org>; Mon,  7 Apr 2025 13:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744032019; cv=none; b=bJElaL2VCq36msMiHKzeNKb1Ozd5zP9LVHOYHxPirX5+2Wt+XPbdKPMdx3SJHyG1GBAUoV/K6uB6vdeKJrmBocBTfQRo/IkBQQSKkJ37iQvycIZ41jbhaooc7QKVgeIB7sVlfJE7a0rQK3+khD6P7RGQXyFgyQIH1wvpkTSEJnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744032019; c=relaxed/simple;
	bh=IBAFSYEftFSEOjm2cNkui0kQbyc4fGxVU2sHcdp1J4A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bubgPnDfoXYdjXoHiAi6fnhbXFeHOO102stazv0LOy+KZ+DwFFf5c+SKgt35ssEjkrpT8jDtFpZVDU+ZE786F48mnajjV8rpMBxvC3Tp0bW2sSmRibbKG1HlrEVFewJh7Y/bHObNFVleS5MUfeAI7GQMiLoRL6W2jW6QikH4iQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Y8KN6859; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744032015;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=puvyqjVmSzk0HYb0KyLQqy8hU7+rU+A/opPj1bWYc1Q=;
	b=Y8KN6859A5AbcaM/Cu5vGaCNIqalXHdFR7Y5VobZB4mPRKwlUUm4IqgLMN4owPho68wzCj
	RQ93Y5bS5J0BYxrbTf0GlguWgY1a4byraOUffJMqX/9Fceai5JR6E6owxWE+5+QcnM5fXs
	rpR88om4SwQ1jyEv6wJsc9kaAn8uznM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-249-wtgxgT_6N-Gd5Rb6jmhfRg-1; Mon, 07 Apr 2025 09:20:12 -0400
X-MC-Unique: wtgxgT_6N-Gd5Rb6jmhfRg-1
X-Mimecast-MFC-AGG-ID: wtgxgT_6N-Gd5Rb6jmhfRg_1744032011
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-43cfda30a3cso26387835e9.3
        for <keyrings@vger.kernel.org>; Mon, 07 Apr 2025 06:20:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744032011; x=1744636811;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=puvyqjVmSzk0HYb0KyLQqy8hU7+rU+A/opPj1bWYc1Q=;
        b=GAW+eMOJ/xC1i5DeQqXywB4t7g1u2mRrMlcUzBlAcy8avUr6XmxzVqo/4HQjIlgEVB
         bErNeCOsBfO8phTI8F+QLXyQW6TVe+S1fcdzDHtDBZjMpaFB4LQ2wOB2bQ8+rqVxdUOE
         L8fSVFX65KrzkXlPeDCvEmfYiCnwkjKVLiHKuyYzH0eAicewbLjbc7f3PVcr2UxFLRWV
         EUnpmsbWPYsNlVj0plnNS4zNRStI9YbL9REq43ZOCuc9nW2SxWGargUZOY2EIPMUcKMj
         i01BVKAZiVaMo/8aw1c2Ra5eBoKyb02dfQq5/YrXARHbrGHxlDNrQjTHSiK38CNK9vLY
         kbDg==
X-Gm-Message-State: AOJu0Yzekld+bD6CqFgcvWnACoLomFHAk1QC2bGmcV62T93mOOuMHalE
	NqIVK7u7tXzs/5alG7eaplt+SKnuy/vqj65t1TxW3OS7epE4jftvX0bv6Zm0XdmQwcGIpie2uIE
	NRGSSCeSdYID2ie9NXKVc1SXBRrSrOwjhyqBMHnPhyNd0o/5R8dzIfgwV
X-Gm-Gg: ASbGncuI0z9UDI4lJiXUI3MOZAPtuwjpA05yU9HmCFnwaf8vALt3+Ak9LfWU0m7cGtt
	H22ORym/OWgUIS4otjEok7w4ngCbBeDtIzS6lTkeCkjpBJ0pKa+BhvizNjlk6Yg5Pl4uRXuRV/a
	xP/8xCBFlRSxQ9lqwhxhIcgB+SbSn2udWXcO/m7KMW32ew0GQRZF33Na12ynVNAlYw0JiRyP7x2
	GE5ZDNc8maJUxmzvpzf5r7H4QAX5d15uaA6u6JmSTM5Pg5DlqrB8NjdNpyNvBnQi2uw9FWd1Ekk
	85tZ3gN7xaz3BG5jJut6RhTsK5GSEsjPppPD7zmCXUoIxnsL5XA1s0WZRc/fvX/E
X-Received: by 2002:a05:600c:510d:b0:43d:2230:303b with SMTP id 5b1f17b1804b1-43ecf9c3e5emr89278835e9.20.1744032011111;
        Mon, 07 Apr 2025 06:20:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHEVMmWlPQZtDsnMFLZbMAxM9zqTMfp14GmzwUzy662LRZwj/J32cgeouoGgUEXLfLAfpiOEg==
X-Received: by 2002:a05:600c:510d:b0:43d:2230:303b with SMTP id 5b1f17b1804b1-43ecf9c3e5emr89278465e9.20.1744032010642;
        Mon, 07 Apr 2025 06:20:10 -0700 (PDT)
Received: from sgarzare-redhat (host-79-53-30-213.retail.telecomitalia.it. [79.53.30.213])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c3020d661sm12381031f8f.66.2025.04.07.06.20.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 06:20:10 -0700 (PDT)
Date: Mon, 7 Apr 2025 15:20:05 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: keyrings@vger.kernel.org, stable@vger.kernel.org, 
	Herbert Xu <herbert@gondor.apana.org.au>, David Howells <dhowells@redhat.com>, 
	Lukas Wunner <lukas@wunner.de>, Ignat Korchagin <ignat@cloudflare.com>, 
	"David S. Miller" <davem@davemloft.net>, Peter Huewe <peterhuewe@gmx.de>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Ard Biesheuvel <ardb@kernel.org>, James Bottomley <James.Bottomley@hansenpartnership.com>, 
	linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, linux-integrity@vger.kernel.org
Subject: Re: [PATCH v3] tpm: Mask TPM RC in tpm2_start_auth_session()
Message-ID: <rxygujdrx3d22mv2jcbp2mjr52noyf6c346vi7iljjf4ova2wz@zkoqxvcudi35>
References: <20250407071731.78915-1-jarkko@kernel.org>
 <20250407072057.81062-1-jarkko@kernel.org>
 <2mjtwprr3dujf4wbu5licb3jtzxujimcz5iahrgqymu6znwbbq@cslxwt7ejva3>
 <Z_O3PU5XDbDirlUO@kernel.org>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <Z_O3PU5XDbDirlUO@kernel.org>

On Mon, Apr 07, 2025 at 02:30:05PM +0300, Jarkko Sakkinen wrote:
>On Mon, Apr 07, 2025 at 10:04:09AM +0200, Stefano Garzarella wrote:
>> On Mon, Apr 07, 2025 at 10:20:57AM +0300, Jarkko Sakkinen wrote:
>> > tpm2_start_auth_session() does not mask TPM RC correctly from the callers:
>> >
>> > [   28.766528] tpm tpm0: A TPM error (2307) occurred start auth session
>> >
>> > Process TPM RCs inside tpm2_start_auth_session(), and map them to POSIX
>> > error codes.
>> >
>> > Cc: stable@vger.kernel.org # v6.10+
>> > Fixes: 699e3efd6c64 ("tpm: Add HMAC session start and end functions")
>> > Reported-by: Herbert Xu <herbert@gondor.apana.org.au>
>> > Closes: https://lore.kernel.org/linux-integrity/Z_NgdRHuTKP6JK--@gondor.apana.org.au/
>> > Signed-off-by: Jarkko Sakkinen <jarkko@kernel.org>
>> > ---
>> > v3:
>> > - rc > 0
>> > v2:
>> > - Investigate TPM rc only after destroying tpm_buf.
>> > ---
>> > drivers/char/tpm/tpm2-sessions.c | 31 +++++++++++++++++--------------
>> > include/linux/tpm.h              |  1 +
>> > 2 files changed, 18 insertions(+), 14 deletions(-)
>> >
>> > diff --git a/drivers/char/tpm/tpm2-sessions.c b/drivers/char/tpm/tpm2-sessions.c
>> > index 3f89635ba5e8..abd54fb0a45a 100644
>> > --- a/drivers/char/tpm/tpm2-sessions.c
>> > +++ b/drivers/char/tpm/tpm2-sessions.c
>> > @@ -40,11 +40,6 @@
>> >  *
>> >  * These are the usage functions:
>> >  *
>> > - * tpm2_start_auth_session() which allocates the opaque auth structure
>> > - *	and gets a session from the TPM.  This must be called before
>> > - *	any of the following functions.  The session is protected by a
>> > - *	session_key which is derived from a random salt value
>> > - *	encrypted to the NULL seed.
>> >  * tpm2_end_auth_session() kills the session and frees the resources.
>> >  *	Under normal operation this function is done by
>> >  *	tpm_buf_check_hmac_response(), so this is only to be used on
>> > @@ -963,16 +958,13 @@ static int tpm2_load_null(struct tpm_chip *chip, u32 *null_key)
>> > }
>> >
>> > /**
>> > - * tpm2_start_auth_session() - create a HMAC authentication session with the TPM
>> > - * @chip: the TPM chip structure to create the session with
>> > + * tpm2_start_auth_session() - Create an a HMAC authentication session
>> > + * @chip:	A TPM chip
>> >  *
>> > - * This function loads the NULL seed from its saved context and starts
>> > - * an authentication session on the null seed, fills in the
>> > - * @chip->auth structure to contain all the session details necessary
>> > - * for performing the HMAC, encrypt and decrypt operations and
>> > - * returns.  The NULL seed is flushed before this function returns.
>> > + * Loads the ephemeral key (null seed), and starts an HMAC authenticated
>> > + * session. The null seed is flushed before the return.
>> >  *
>> > - * Return: zero on success or actual error encountered.
>> > + * Returns zero on success, or a POSIX error code.
>> >  */
>> > int tpm2_start_auth_session(struct tpm_chip *chip)
>> > {
>> > @@ -1024,7 +1016,7 @@ int tpm2_start_auth_session(struct tpm_chip *chip)
>> > 	/* hash algorithm for session */
>> > 	tpm_buf_append_u16(&buf, TPM_ALG_SHA256);
>> >
>> > -	rc = tpm_transmit_cmd(chip, &buf, 0, "start auth session");
>> > +	rc = tpm_transmit_cmd(chip, &buf, 0, "StartAuthSession");
>> > 	tpm2_flush_context(chip, null_key);
>> >
>> > 	if (rc == TPM2_RC_SUCCESS)
>> > @@ -1032,6 +1024,17 @@ int tpm2_start_auth_session(struct tpm_chip *chip)
>> >
>> > 	tpm_buf_destroy(&buf);
>> >
>> > +	if (rc > 0) {
>>
>> To avoid the nesting blocks, can we include `TPM2_RC_SUCCESS` case in the
>> switch or move the `if (rc == TPM2_RC_SUCCESS)` before it?
>
>What do you mean by "avoiding nesting blocks"?

Ooops, I thought `rc` was unsigned always returning TPM2_RC_* values,
but it looks it's not the case.

I meant the switch "block" inside the if block, at the end exactly what
you did in tpm_to_ret() in v4 :-)

Thanks,
Stefano


