Return-Path: <keyrings+bounces-3260-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id CA30EBF015B
	for <lists+keyrings@lfdr.de>; Mon, 20 Oct 2025 11:05:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 29CE24F0EE6
	for <lists+keyrings@lfdr.de>; Mon, 20 Oct 2025 09:05:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13F702ECE9D;
	Mon, 20 Oct 2025 09:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="e1f2XP8D"
X-Original-To: keyrings@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38F882E8B75
	for <keyrings@vger.kernel.org>; Mon, 20 Oct 2025 09:05:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760951105; cv=none; b=Wo0ZPREwn+bqzM1I++udUV8vpL6VCjIrLZfmliX0G4DCYV8TfuUEdFuNgVV+9Dgf/flVq9yCh8df/aLWMB1SktW/BXtX8SHt2vOfmzfiZr9XNoIrG6SrRmDyg2OJvR58OmVr2YfP+bhUBRxRLy9ibIYadXphAexjybD1VRm0p1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760951105; c=relaxed/simple;
	bh=KZuK0NW8g/jyi+GON1sj2/KfHSvjXYfSxqe8K2xhPPI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=npyOZvvHl9P7qz0Z5S6mDoEAF1w7kEuGMxZf5xnnrMnHIQ2w/H376xGUanabhbJkjUlghfmySeHpJ0n4e2UJHeHZhnK7MJa64hjZL7RFFJz5QismGrEsulcBDDrCEug2RPBqftByXRdcGsZm+PooZjnLjNfqGsrbjZHf7InF9uI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=e1f2XP8D; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760951101;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=22yfNbJ+mpY0goN/o5ffj6htndw8FKixezqcENam2+w=;
	b=e1f2XP8DWJKcyXuzJWcka0LIuiIYGiDw861XczIG4W+8Ad/O1gspov4mIymN/rpHqF0fjp
	0MGHAVUW4VIiZv3hfCRyA4jJQEUFcBlKnP+oUu8ahsSrUimSq9siytbehwsYEWWh+ngc0w
	sK82IXk3RSiXdbaANhKgkeCidLh9cVw=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-50-MPcbgrVMPOepEODLOYJbRw-1; Mon, 20 Oct 2025 05:04:59 -0400
X-MC-Unique: MPcbgrVMPOepEODLOYJbRw-1
X-Mimecast-MFC-AGG-ID: MPcbgrVMPOepEODLOYJbRw_1760951098
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-b479e43ad46so344428166b.2
        for <keyrings@vger.kernel.org>; Mon, 20 Oct 2025 02:04:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760951098; x=1761555898;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=22yfNbJ+mpY0goN/o5ffj6htndw8FKixezqcENam2+w=;
        b=vva1B3ngq3MNQjmmZVZ/8bPDX6eHkaOF4KqcCXSWQbrHd3oTH9kQWHoCb7GOQz5x/S
         Pa1HisdrT4zx4IEcORT7bA/PBajULlLnivGpy6AVmDh7s1ZmaZq+16ZaP16XR1NNk4Cy
         qShQpu2tIXjmT1I/wFvyBPmDd0xlP9ckD54lToL7Zet+ILpQ9ydV8z4BhtbDeeFTpR9G
         dlr6lcYrvwRZMCoItxpX66aV47j3Xe+FKo4J+HyMInpUQ0MhjnzQ1U4h52QmC/gkw9mR
         ov1XcculdWVKGUdAod6/e7oRkAT7BPfG/In+gZGUwVm6/MexqAF9i+tdtNa10U8k1pdi
         lyyA==
X-Forwarded-Encrypted: i=1; AJvYcCV77KhQjsbMDgg3JbUG6hpJdWrxo01UkmwIhr8F0ucg1zdniPCc6CG2BlbYIUMcLIkAYmoD/uGa5A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx20YPL1AorpzPxfzK0OZdaZPLISn9i98MmEDWWX0U6FK+PNyN6
	2Cuu9P6IO5V9vhhuhPJlNNIzqNWl+zh08CO1Z+11xZOIfsZWPmF9kUW7LgUbzWDVfMJci7Luu/h
	evhBAasoMWrRkEkdlOIyQeZ6zLuIByhC3RXxtiWV+IOrpie06CT4Yu0nQcRHt
X-Gm-Gg: ASbGncuKlAEfnRrp1PkLg1i/fOlOBf4eZv2/QMoQEoCqqOf26fYvIpzd9e/ySIkikF4
	5MULnHQL+UBSxB+6LmoAK/Jtw4mlTVf+tBIibb52zJ2VMzwNfuA70mOWcBYRELHLCG9vJLO2uBj
	cfkF3efPnNl+/ni1fmamzdTzurd8m78V0KyxTyR42anJTAfut0Y3wiAr1MQn+ocRekt7yTrs2h1
	gvdpk0kHyIHWldteOKH8SSMXWdncCbyNpxvN3ER337cpYMCE31EkINnJPj4D2Aea1spTMyQcj6U
	Z+FHheQBPK/Xhb8vzkkfw+B2b94DmfhOhenEL/z4AGTZ6db8oXtoUJkZ2squkQKvbnAAr89AoG+
	RcuWHPJCpLjavG76g7E/w0W16+Q/nvwRuvZNkMrBUO4slnWeD7AY=
X-Received: by 2002:a17:906:fe41:b0:b45:a6e6:97b4 with SMTP id a640c23a62f3a-b64764e2fd5mr1384718566b.50.1760951097667;
        Mon, 20 Oct 2025 02:04:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFe2BUld3tY9H9mPNFll8sWB6BjRuOwgWEhUFvxf6FyCKHjQQuGnV1QEE2cqA4E1arzNlugSg==
X-Received: by 2002:a17:906:fe41:b0:b45:a6e6:97b4 with SMTP id a640c23a62f3a-b64764e2fd5mr1384713366b.50.1760951097175;
        Mon, 20 Oct 2025 02:04:57 -0700 (PDT)
Received: from sgarzare-redhat (host-79-46-200-153.retail.telecomitalia.it. [79.46.200.153])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b65e7da1b96sm739516666b.1.2025.10.20.02.04.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 02:04:56 -0700 (PDT)
Date: Mon, 20 Oct 2025 11:04:51 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: linux-integrity@vger.kernel.org, keyring@vger.kernel.org, 
	dpsmith@apertussolutions.com, ross.philipson@oracle.com, Jonathan McDowell <noodles@earth.li>, 
	Roberto Sassu <roberto.sassu@huawei.com>, Jarkko Sakkinen <jarkko.sakkinen@opinsys.com>, 
	Stefan Berger <stefanb@linux.ibm.com>, Peter Huewe <peterhuewe@gmx.de>, Jason Gunthorpe <jgg@ziepe.ca>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, Mimi Zohar <zohar@linux.ibm.com>, 
	David Howells <dhowells@redhat.com>, Paul Moore <paul@paul-moore.com>, 
	James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, 
	linux-kernel@vger.kernel.org, keyrings@vger.kernel.org, linux-security-module@vger.kernel.org
Subject: Re: [PATCH v6 10/10] tpm-buf: Enable managed and stack allocations.
Message-ID: <yynqxoqux5whcbsnticikhwmupqh57xfbll5egzkn42kj7gkaf@s4kwxfmto5ia>
References: <20251018111725.3116386-1-jarkko@kernel.org>
 <20251018111725.3116386-11-jarkko@kernel.org>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20251018111725.3116386-11-jarkko@kernel.org>

On Sat, Oct 18, 2025 at 02:17:25PM +0300, Jarkko Sakkinen wrote:
>From: Jarkko Sakkinen <jarkko.sakkinen@opinsys.com>
>
>Decouple kzalloc from buffer creation, so that a managed allocation can be
>done trivially:
>
>	struct tpm_buf *buf __free(kfree) buf = kzalloc(TPM_BUFSIZE,
>							GFP_KERNEL);
>	if (!buf)
>		return -ENOMEM;
>	tpm_buf_init(buf, TPM_BUFSIZE);
>
>Alternatively, stack allocations are also possible:
>
>	u8 buf_data[512];
>	struct tpm_buf *buf = (struct tpm_buf *)buf_data;
>	tpm_buf_init(buf, sizeof(buf_data));
>
>Given that every single tpm_transmit_cmd() call site needs to be changed,
>place command names from TCG 1.2 and 2.0 specifications to the @dest
>parameter, which will e.g., help tracing bugs.

Perhaps my previous message fell through the cracks, but I still have a 
couple of comments (perhaps trivial, sorry in that case) that have not 
been answered about this patch:

>
>Signed-off-by: Jarkko Sakkinen <jarkko.sakkinen@opinsys.com>
>Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>
>---
>v6
>- Update commit message.
>v5:
>- There was a spurious change in tpm2_seal_trusted() error
>  code handling introduce by this patch.
>v4:
>- Since every single tpm_transmit_cmd() call site needs to be
>  changed anyhow, use 'dest' parameter more structured and
>  actually useful way, and pick the string TCG 1.2 and 2.0
>  specifications.
>- tpm1-cmd: Remove useless rc declarations and repliace them
>  with trivial "return tpm_transmit_cmd" statement.
>- Reverted spurious changes in include/linux/tpm.h.
>- Use concisely TPM_BUFSIZE instead of PAGE_SIZE.
>v3:
>- A new patch from the earlier series with more scoped changes and
>  less abstract commit message.
>---
> drivers/char/tpm/tpm-buf.c                | 122 +++++----
> drivers/char/tpm/tpm-sysfs.c              |  21 +-
> drivers/char/tpm/tpm.h                    |   1 -
> drivers/char/tpm/tpm1-cmd.c               | 162 +++++-------
> drivers/char/tpm/tpm2-cmd.c               | 299 ++++++++++------------
> drivers/char/tpm/tpm2-sessions.c          | 122 +++++----
> drivers/char/tpm/tpm2-space.c             |  44 ++--
> drivers/char/tpm/tpm_vtpm_proxy.c         |  30 +--
> include/linux/tpm.h                       |  18 +-
> security/keys/trusted-keys/trusted_tpm1.c |  34 ++-
> security/keys/trusted-keys/trusted_tpm2.c | 175 ++++++-------
> 11 files changed, 484 insertions(+), 544 deletions(-)
>
>diff --git a/drivers/char/tpm/tpm-buf.c b/drivers/char/tpm/tpm-buf.c
>index 1b9dee0d0681..a3bf3c3d0c48 100644
>--- a/drivers/char/tpm/tpm-buf.c
>+++ b/drivers/char/tpm/tpm-buf.c

[...]

>@@ -92,6 +119,9 @@ EXPORT_SYMBOL_GPL(tpm_buf_destroy);
>  */
> u32 tpm_buf_length(struct tpm_buf *buf)

Should we update the return value to u16?


> {
>+	if (buf->flags & TPM_BUF_INVALID)
>+		return 0;
>+
> 	return buf->length;
> }
> EXPORT_SYMBOL_GPL(tpm_buf_length);

[...]

>diff --git a/security/keys/trusted-keys/trusted_tpm1.c b/security/keys/trusted-keys/trusted_tpm1.c
>index 636acb66a4f6..3ac204a902de 100644
>--- a/security/keys/trusted-keys/trusted_tpm1.c
>+++ b/security/keys/trusted-keys/trusted_tpm1.c
>@@ -310,9 +310,8 @@ static int TSS_checkhmac2(unsigned char *buffer,
>  * For key specific tpm requests, we will generate and send our
>  * own TPM command packets using the drivers send function.
>  */
>-static int trusted_tpm_send(unsigned char *cmd, size_t buflen)
>+static int trusted_tpm_send(void *cmd, size_t buflen)
> {
>-	struct tpm_buf buf;
> 	int rc;
>
> 	if (!chip)
>@@ -322,15 +321,12 @@ static int trusted_tpm_send(unsigned char *cmd, size_t buflen)
> 	if (rc)
> 		return rc;
>
>-	buf.flags = 0;
>-	buf.length = buflen;
>-	buf.data = cmd;
> 	dump_tpm_buf(cmd);
>-	rc = tpm_transmit_cmd(chip, &buf, 4, "sending data");
>+	rc = tpm_transmit_cmd(chip, cmd, 4, "sending data");

Is it fine here to remove the intermediate tpm_buf ?

IIUC tpm_transmit_cmd() needs a tpm_buf, while here we are passing just
the "data", or in some way it's a nested tpm_buf?

> 	dump_tpm_buf(cmd);
>
>+	/* Convert TPM error to -EPERM. */
> 	if (rc > 0)
>-		/* TPM error */
> 		rc = -EPERM;
>
> 	tpm_put_ops(chip);

Thanks,
Stefano


