Return-Path: <keyrings+bounces-47-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B4C467E46A9
	for <lists+keyrings@lfdr.de>; Tue,  7 Nov 2023 18:20:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 711D2B20F23
	for <lists+keyrings@lfdr.de>; Tue,  7 Nov 2023 17:20:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65E3F341B6;
	Tue,  7 Nov 2023 17:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="jUVh7+9V"
X-Original-To: keyrings@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8B092FE02
	for <keyrings@vger.kernel.org>; Tue,  7 Nov 2023 17:20:10 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48E0BF7
	for <keyrings@vger.kernel.org>; Tue,  7 Nov 2023 09:20:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1699377609;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7BzU3dDdSH7oEfLk2Y642FIj/xbly1n4FfWSInGGOWQ=;
	b=jUVh7+9VZQgA0YHEXjPzXT+0jQFrfb488S81PS/Cxh56z+kiSoRWet1f9dT/UfrSBwAAlq
	M5XZErOjJEsen+LsJjdQF5d6PX/DNDaMop4q8M1HC4HtlzFyTKkiiQr672HIrxxIHbXM4G
	Fc7NeT6uRVWAPdQYJiM44FCXK933G/o=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-455-bv2d1T7eNmayQb-hn9_m4A-1; Tue, 07 Nov 2023 12:20:06 -0500
X-MC-Unique: bv2d1T7eNmayQb-hn9_m4A-1
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-41cd5166101so73416981cf.0
        for <keyrings@vger.kernel.org>; Tue, 07 Nov 2023 09:20:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699377605; x=1699982405;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7BzU3dDdSH7oEfLk2Y642FIj/xbly1n4FfWSInGGOWQ=;
        b=Vi1mTpLwvZ0aW3sQBtmnO0cASgWPs168I9I3csmlzS3PHsufxrKVyNeeo8WHtmWV+N
         4skw9m75N2IGlY4rcBrgtcpr+hBBwkxQZ1vWWffT/2e/SMkg0sjlYLBgcdfQfy6BSPsl
         Hx+YxD9MDjQnXEhcE0cgudqNDpFz5Yf6RO9bhxkvxFNo4zYOiLNi5dcj6hWaFHJOpD6i
         BN2Q/gYIavPSt+QYYJQH2VIWyGpQY/OYIR0E2s4ZWQ7k0OHF+QUGhzIrFEMHOz1O7ilw
         zZOY0ZFmXwgJ+cL2q1BEauGUpt1t104HtCOkl4VkjOICmqJI+wPzU/T3yZa9aUYC3n25
         BQ9A==
X-Gm-Message-State: AOJu0YzVC1zLms6REiu/Un6+4mhNwAIzHJ6DK3KVAFzQBATECeDQ0zU7
	2fzvK5Y8XPR3bEHPrxxCYHglh1N1WOl+smDnzmh1h2A4wNfO0ZNzVTOney+vXqTFsDU/RzduLLJ
	/odcHgV/dz6uaGvf/mms=
X-Received: by 2002:ac8:7f0a:0:b0:419:4c21:d706 with SMTP id f10-20020ac87f0a000000b004194c21d706mr41838475qtk.23.1699377605720;
        Tue, 07 Nov 2023 09:20:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEmk5NphBaKNBHbqE52Hw8MNilCJ0v2xrcEj47TC7u8ivcNr/mb5kCdrz4mKADOyy+M6i9epw==
X-Received: by 2002:ac8:7f0a:0:b0:419:4c21:d706 with SMTP id f10-20020ac87f0a000000b004194c21d706mr41838445qtk.23.1699377605471;
        Tue, 07 Nov 2023 09:20:05 -0800 (PST)
Received: from localhost (ip98-179-76-75.ph.ph.cox.net. [98.179.76.75])
        by smtp.gmail.com with ESMTPSA id p25-20020ac84619000000b0041cbb7139a9sm81308qtn.65.2023.11.07.09.20.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Nov 2023 09:20:05 -0800 (PST)
Date: Tue, 7 Nov 2023 10:20:03 -0700
From: Jerry Snitselaar <jsnitsel@redhat.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: linux-integrity@vger.kernel.org, keyrings@vger.kernel.org, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, William Roberts <bill.c.roberts@gmail.com>, 
	Stefan Berger <stefanb@linux.ibm.com>, David Howells <dhowells@redhat.com>, 
	Jason Gunthorpe <jgg@ziepe.ca>, Mimi Zohar <zohar@linux.ibm.com>, 
	Peter Huewe <peterhuewe@gmx.de>, James Bottomley <jejb@linux.ibm.com>, 
	Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, 
	"Serge E. Hallyn" <serge@hallyn.com>, Mario Limonciello <mario.limonciello@amd.com>, 
	Julien Gomes <julien@arista.com>, open list <linux-kernel@vger.kernel.org>, 
	"open list:SECURITY SUBSYSTEM" <linux-security-module@vger.kernel.org>
Subject: Re: [PATCH v3 4/6] tpm: Support TPM2 sized buffers (TPM2B)
Message-ID: <nwbyc2al5msr7d2wqvqcfdm75osrestjncuhjgxxigm773a6k5@bc7hjv5srjxv>
References: <20231024011531.442587-1-jarkko@kernel.org>
 <20231024011531.442587-5-jarkko@kernel.org>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231024011531.442587-5-jarkko@kernel.org>

On Tue, Oct 24, 2023 at 04:15:22AM +0300, Jarkko Sakkinen wrote:
> Add boolean parameters @alloc and @sized to tpm_buf_init():
> 
> * If @alloc is set to false, buf->data is assumed to be pre-feeded and
>   owned by the caller.
> * If @sized is set to true, the buffer represents a sized buffer
>   (TPM2B).
> 
> Signed-off-by: Jarkko Sakkinen <jarkko@kernel.org>
> ---
>  drivers/char/tpm/tpm-buf.c                | 32 ++++++++++++++++-------
>  drivers/char/tpm/tpm-sysfs.c              |  2 +-
>  drivers/char/tpm/tpm1-cmd.c               | 14 +++++-----
>  drivers/char/tpm/tpm2-cmd.c               | 22 ++++++++--------
>  drivers/char/tpm/tpm2-space.c             |  4 +--
>  drivers/char/tpm/tpm_vtpm_proxy.c         |  2 +-
>  include/linux/tpm.h                       |  3 ++-
>  security/keys/trusted-keys/trusted_tpm1.c |  4 +--
>  security/keys/trusted-keys/trusted_tpm2.c |  6 ++---
>  9 files changed, 51 insertions(+), 38 deletions(-)
> 
> diff --git a/drivers/char/tpm/tpm-buf.c b/drivers/char/tpm/tpm-buf.c
> index fa9a4c51157a..f1d92d7e758d 100644
> --- a/drivers/char/tpm/tpm-buf.c
> +++ b/drivers/char/tpm/tpm-buf.c
> @@ -7,22 +7,32 @@
>  #include <linux/tpm.h>
>  
>  /**
> - * tpm_buf_init() - Initialize from the heap
> + * tpm_buf_init() - Initialize a TPM buffer
>   * @buf:	A @tpm_buf
> + * @sized:	Represent a sized buffer (TPM2B)
> + * @alloc:	Allocate from the heap
>   *
>   * Initialize all structure fields to zero, allocate a page from the heap, and

Depending on what the decision ends up being on the bools, flags,
separate functions, or wrappers possibly an "if needed" should be
tacked on to the end of "allocate a page from the heap" here.


Flags would be better when coming across calls to the routine in the
code than the bools, but I think switching to wrappers around
a __tpm_buf_init for the different types would be good.


>   * zero the bytes that the buffer headers will consume.
>   *


