Return-Path: <keyrings+bounces-2602-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F2371A7E037
	for <lists+keyrings@lfdr.de>; Mon,  7 Apr 2025 15:59:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2ABCF3A84E4
	for <lists+keyrings@lfdr.de>; Mon,  7 Apr 2025 13:51:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6294D1AC88B;
	Mon,  7 Apr 2025 13:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cY/xu2x2"
X-Original-To: keyrings@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8707155300
	for <keyrings@vger.kernel.org>; Mon,  7 Apr 2025 13:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744033893; cv=none; b=DqcXLADEC+adXleHqpm+34VwywVe8de1Ewj/oC1nWlcBJBHdm6DXoRCtu7h67eaOFO4Pg9+vnlklDUE5XyCehlnyjxF/Caa+kfkKDTLmq7VlQ24n2ZFMMYxQLFrhtDzUwj3Ueb2NtoVRxThh9bXqahgKJwu80R9Lw0C562pwHnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744033893; c=relaxed/simple;
	bh=pOlUfoxKMdcIvFibY4XcyydBHsdZrFh189zmiV4sVgo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CFn8Fb+5Dc4o9mAgmpMH9qOELLjjI5Dm45T8F77ZNFMlX7rMQzsYykmj/m2Q7XlC8fVlAIn4q85WjSpRm1eBTKQbUT1lRR+Eh7fnd/DJTBbc/SMXGfcOEPj0SRHa/J9kkteT65fj8IX0e4+G9/lMsSrJCjaOpJ/JRJUrtf/4JBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cY/xu2x2; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744033890;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4QozE0PDtnnSmD6ILxl3+T7V2hUuUMgoSOAUqOydwIc=;
	b=cY/xu2x2SWjihcQvpOS+KYuvYD57d3I3neMPqv9LFyohOUrpMBT/Y52jCTHfAE09dbdaG6
	v+zxvv/VEebZ48BIVXklHwawU15/hC5xM2QYjq9ydsE7F7sjjVh17fiJ/NGDsTsmmedTyT
	W2bmMuHYLKqyDEil5r5MQkArf1mwSt0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-196-l1m-HT4bPNqwDZUzzLtg1w-1; Mon, 07 Apr 2025 09:51:29 -0400
X-MC-Unique: l1m-HT4bPNqwDZUzzLtg1w-1
X-Mimecast-MFC-AGG-ID: l1m-HT4bPNqwDZUzzLtg1w_1744033887
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-43cec217977so28623975e9.0
        for <keyrings@vger.kernel.org>; Mon, 07 Apr 2025 06:51:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744033887; x=1744638687;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4QozE0PDtnnSmD6ILxl3+T7V2hUuUMgoSOAUqOydwIc=;
        b=Q548Vx3kI9c2kJfoUoKQsWdgKe2WvBXm/sWFK1hEP/nRshofjdUQuCO6bJm9ArEP2v
         6LBYox5aYlmXopiL+FtDBmh6NApWMGfb36AQHUT6wTfatenrgH4YutPH3YaOR7OYqbbL
         3QLkrdnJURjNoRPLcAykbkUu5KxsOq0FFV3e9iwjJjpbXVfkHSGbGXEz6o22vj+2JMCU
         Us3eEy/jiDqyUdmo+3PzYJH6XR8mjqfiH4ibh6UHSEG+doxYVQq44g1kSZ+JE3YWLhaP
         Mt54mjxg5HTTn2AJiAnHf8gB/tfxFykr4qs29mhMZsbP9ieUDhqL3GOtVm+C/q53ckRR
         xveg==
X-Gm-Message-State: AOJu0Ywqsw+VcZR4zspUzRYrvd/1UXjDFRWiGLPxhEpG/igeIWpuBZoy
	QvCH+/WbUCg/rekjp7jJB3wtt546SfQ5brPwJ4rZjrqbO1WiSU8sotOcQ615IE34kBrWPwp9ot/
	AABCoTs4gfTMvbLPi9bVuSAExY59VaWhf5F6yZ5Im6v18Q8pQoUeVM04a
X-Gm-Gg: ASbGncvrqqiHnh4oGlEgP3PgblNEpUhzxQNQC7qPf36ClXZLCaZ2Kbpnude8Vze9RnA
	I/LQEU1mduQOAcN08cjswxKRrRBVAhc+FTiNwWbrxo4Jz8XxE1cZwzYN7jtMqKHCflBryFC1nA5
	LByOyqbpblc7XRgy4jaeeP08yEhJFuOWR1wplziLcntSQyY5/ZZOWYUZwp5K/3ELx/uasYZSpXv
	nq3OVdqmjWiFyOmnHpa9q4q4yZMqrYIiPagdK0EpbVF0/Xyjc/56v463dym8YCTIKXsJn4dKK6/
	GB5Xb342BL7jziWnCgFeebio1lUH0mw8Q9sC9QiYw3WsgVpFMk+CEWnakOVq+Fje
X-Received: by 2002:a05:600c:3109:b0:43d:ea:51d2 with SMTP id 5b1f17b1804b1-43ecf85fb61mr113063675e9.14.1744033887029;
        Mon, 07 Apr 2025 06:51:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHWKfH/L/DqQU6vxaZkSWgWxiOUkaiLhr+XQUhQs80d/mT6RMww2aM39izGLVjowZVzDnOYDQ==
X-Received: by 2002:a05:600c:3109:b0:43d:ea:51d2 with SMTP id 5b1f17b1804b1-43ecf85fb61mr113063395e9.14.1744033886549;
        Mon, 07 Apr 2025 06:51:26 -0700 (PDT)
Received: from sgarzare-redhat (host-79-53-30-213.retail.telecomitalia.it. [79.53.30.213])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ea8d2bc7fsm95414515e9.0.2025.04.07.06.51.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 06:51:26 -0700 (PDT)
Date: Mon, 7 Apr 2025 15:51:21 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: keyrings@vger.kernel.org, stable@vger.kernel.org, 
	Herbert Xu <herbert@gondor.apana.org.au>, David Howells <dhowells@redhat.com>, 
	Lukas Wunner <lukas@wunner.de>, Ignat Korchagin <ignat@cloudflare.com>, 
	"David S. Miller" <davem@davemloft.net>, Peter Huewe <peterhuewe@gmx.de>, Jason Gunthorpe <jgg@ziepe.ca>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, Ard Biesheuvel <ardb@kernel.org>, linux-crypto@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-integrity@vger.kernel.org
Subject: Re: [PATCH v4] tpm: Mask TPM RC in tpm2_start_auth_session()
Message-ID: <e7ul3n3rwvv3xiyiaf4dv5x7kbtcgb6zpcf33k6dobxf5ctdyp@z5iwi4pofj7h>
References: <20250407072057.81062-1-jarkko@kernel.org>
 <20250407122806.15400-1-jarkko@kernel.org>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20250407122806.15400-1-jarkko@kernel.org>

On Mon, Apr 07, 2025 at 03:28:05PM +0300, Jarkko Sakkinen wrote:
>tpm2_start_auth_session() does not mask TPM RC correctly from the callers:
>
>[   28.766528] tpm tpm0: A TPM error (2307) occurred start auth session
>
>Process TPM RCs inside tpm2_start_auth_session(), and map them to POSIX
>error codes.
>
>Cc: stable@vger.kernel.org # v6.10+
>Fixes: 699e3efd6c64 ("tpm: Add HMAC session start and end functions")
>Reported-by: Herbert Xu <herbert@gondor.apana.org.au>
>Closes: https://lore.kernel.org/linux-integrity/Z_NgdRHuTKP6JK--@gondor.apana.org.au/
>Signed-off-by: Jarkko Sakkinen <jarkko@kernel.org>
>---
>v4:
>- tpm_to_ret()
>v3:
>- rc > 0
>v2:
>- Investigate TPM rc only after destroying tpm_buf.
>---
> drivers/char/tpm/tpm2-sessions.c | 20 ++++++--------------
> include/linux/tpm.h              | 21 +++++++++++++++++++++
> 2 files changed, 27 insertions(+), 14 deletions(-)
>
>diff --git a/drivers/char/tpm/tpm2-sessions.c b/drivers/char/tpm/tpm2-sessions.c
>index 3f89635ba5e8..102e099f22c1 100644
>--- a/drivers/char/tpm/tpm2-sessions.c
>+++ b/drivers/char/tpm/tpm2-sessions.c
>@@ -40,11 +40,6 @@
>  *
>  * These are the usage functions:
>  *
>- * tpm2_start_auth_session() which allocates the opaque auth structure
>- *	and gets a session from the TPM.  This must be called before
>- *	any of the following functions.  The session is protected by a
>- *	session_key which is derived from a random salt value
>- *	encrypted to the NULL seed.
>  * tpm2_end_auth_session() kills the session and frees the resources.
>  *	Under normal operation this function is done by
>  *	tpm_buf_check_hmac_response(), so this is only to be used on
>@@ -963,16 +958,13 @@ static int tpm2_load_null(struct tpm_chip *chip, u32 *null_key)
> }
>
> /**
>- * tpm2_start_auth_session() - create a HMAC authentication session with the TPM
>- * @chip: the TPM chip structure to create the session with
>+ * tpm2_start_auth_session() - Create an a HMAC authentication session
>+ * @chip:	A TPM chip
>  *
>- * This function loads the NULL seed from its saved context and starts
>- * an authentication session on the null seed, fills in the
>- * @chip->auth structure to contain all the session details necessary
>- * for performing the HMAC, encrypt and decrypt operations and
>- * returns.  The NULL seed is flushed before this function returns.
>+ * Loads the ephemeral key (null seed), and starts an HMAC authenticated
>+ * session. The null seed is flushed before the return.
>  *
>- * Return: zero on success or actual error encountered.
>+ * Returns zero on success, or a POSIX error code.
>  */
> int tpm2_start_auth_session(struct tpm_chip *chip)
> {
>@@ -1024,7 +1016,7 @@ int tpm2_start_auth_session(struct tpm_chip *chip)
> 	/* hash algorithm for session */
> 	tpm_buf_append_u16(&buf, TPM_ALG_SHA256);
>
>-	rc = tpm_transmit_cmd(chip, &buf, 0, "start auth session");
>+	rc = tpm_to_ret(tpm_transmit_cmd(chip, &buf, 0, "StartAuthSession"));
> 	tpm2_flush_context(chip, null_key);
>
> 	if (rc == TPM2_RC_SUCCESS)
>diff --git a/include/linux/tpm.h b/include/linux/tpm.h
>index 6c3125300c00..c826d5a9d894 100644
>--- a/include/linux/tpm.h
>+++ b/include/linux/tpm.h
>@@ -257,8 +257,29 @@ enum tpm2_return_codes {
> 	TPM2_RC_TESTING		= 0x090A, /* RC_WARN */
> 	TPM2_RC_REFERENCE_H0	= 0x0910,
> 	TPM2_RC_RETRY		= 0x0922,
>+	TPM2_RC_SESSION_MEMORY	= 0x0903,

nit: the other values are in ascending order, should we keep it or is it 
not important?

(more a question for me than for the patch)

> };
>
>+/*
>+ * Convert a return value from tpm_transmit_cmd() to a POSIX return value. The
>+ * fallback return value is -EFAULT.
>+ */
>+static inline ssize_t tpm_to_ret(ssize_t ret)
>+{
>+	/* Already a POSIX error: */
>+	if (ret < 0)
>+		return ret;
>+
>+	switch (ret) {
>+	case TPM2_RC_SUCCESS:
>+		return 0;
>+	case TPM2_RC_SESSION_MEMORY:
>+		return -ENOMEM;
>+	default:
>+		return -EFAULT;
>+	}
>+}

I like this and in the future we could reuse it in different places like 
tpm2_load_context() and tpm2_save_context().

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>


BTW for my understading, looking at that code (sorry if the answer is 
obvious, but I'm learning) I'm confused about the use of 
tpm2_rc_value().

For example in tpm2_load_context() we have:

     	rc = tpm_transmit_cmd(chip, &tbuf, 4, NULL);
     	...
	} else if (tpm2_rc_value(rc) == TPM2_RC_HANDLE ||
		   rc == TPM2_RC_REFERENCE_H0) {

While in tpm2_save_context(), we have:

	rc = tpm_transmit_cmd(chip, &tbuf, 0, NULL);
	...
	} else if (tpm2_rc_value(rc) == TPM2_RC_REFERENCE_H0) {

So to check TPM2_RC_REFERENCE_H0 we are using tpm2_rc_value() only 
sometimes, what's the reason?

Thanks,
Stefano


