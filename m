Return-Path: <keyrings+bounces-3344-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C3BAFC5C6D4
	for <lists+keyrings@lfdr.de>; Fri, 14 Nov 2025 11:04:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E0EF04F3D83
	for <lists+keyrings@lfdr.de>; Fri, 14 Nov 2025 09:34:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FC8A307481;
	Fri, 14 Nov 2025 09:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lRVIg1Ih"
X-Original-To: keyrings@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95A7A306B2C
	for <keyrings@vger.kernel.org>; Fri, 14 Nov 2025 09:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763112891; cv=none; b=uqcc3xgA3QMb9U0jcBQRC0E/W1jfZI/dMNEJbPRVjiV3RRdIdln30cDxruwpAeVRAT8j0Bu5OVSC5fK+8R7TeiqzSKmlTdgRvPKZczdZB9RDS5VBsyChPs45SQi6akUGjlxcIZ2wcfG1hwhVd+H+5VkMdaRochGCIZ1saD2HJ8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763112891; c=relaxed/simple;
	bh=C8PM7WxuPGZdfL2k/hswcOqc/x9TppYivbKp35Py/N4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WImdDGlxxKyl1J2gKVHPpkols8FL2ib/ykzizKK982QPFpRACjeMSjHv3gceLNEUpTazMQqMbyklZzGlh1z6jp5axKvDHJDA72eBP+xULWb1mpWYKV/i/pgs0sp/07Ti9n2rNMGr6WHVG7xs9/pG5CELrkkhGgwInsKy5fmJ+TY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lRVIg1Ih; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4777771ed1aso12571825e9.2
        for <keyrings@vger.kernel.org>; Fri, 14 Nov 2025 01:34:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763112888; x=1763717688; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BIcvV078uJhN54sARrKY1Rqwcca2J3WG/bWTbfWheiQ=;
        b=lRVIg1IhGsjmG62zRqIW0jDcktXfh9q/PpJATyuviAZzYLc8UHQmXvO2YSvaQhWTRl
         noPEUDml0I4cmFggHx4LH9Ygb9LYsmse3lAv2yNe7BHCptZXffV5q54tPu/h4eLqKQ/G
         BBjMRZ377eMLzVyQEPHwOU1a9MkX+qCedmGee7ga2pxB15UCs1SGHcxBiP7aSGdUqcE7
         CIaB1+MzZJtC/XsoPcf6JQcE2E5L/OMX9SAQRR8AgxVjjyyDBOYzwHP5t9ZZ5lPFM5c9
         O3D4oN3c2jsY+XLEQIA2AWaUqwCpWcWJUWr01hLtFFqX7EHi+aNWgpXSkXTLmFh1vFzY
         lRYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763112888; x=1763717688;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BIcvV078uJhN54sARrKY1Rqwcca2J3WG/bWTbfWheiQ=;
        b=YmAPATP3u9V9nz1W8ZcTjHvSG6rCNX4bRJIjlwmM3FxcVimiCFzYs+CEf+LN2LUYnd
         KWc/ovtEGFXw4mvQHBsgkDg9STbDfgSXwH2tCuycf0O+pGlx6WVPGYPu+itTPCvgSQ3v
         gNMirRXFWgbVGZ2NnJ4t2eFKojLp4OKM2CP3hmCP+fZvKUyaPbjRWBBzHuinE95VIPgo
         vJHKRBM0lCA0T3bDJ/xZOF1148ZXxI7cQS4OugPq1AoivR/pjrPAD0kw+QSrozU7pta7
         9cN9a+/VQsEeFVepgjDfbzEcE17dXXPMazCScWXhBE8z1lTrSnwdH9eiQ/GsE94iVyNk
         9oMw==
X-Forwarded-Encrypted: i=1; AJvYcCXxz2uNEt8zh4NcLFROu03HvPUdgaMHr6hbo1mOImRijym6bKHY4OkEdO0VuE8N5b7+tHxLxU8PYg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwfIrCHJZiZejT041udsDZWvBa1fcNvzcm2hKyzB7LPnE0WitXF
	SjDGiLZ60PsoY8YS1LhKsQeqBaUY/8S3S9O9GjmAJa0QscFUf/7t/RXt
X-Gm-Gg: ASbGncurMOjHlgAVvXXnYn5MFwrNdZL2EqL57o28LCdqz2g1zii0fKKnjvWbyGhxDCL
	L5fnMjXphxHUIPeZZfSixB0PFJgUpYenCI540bDIVLK2iEYi7vTIl5mw+rNu6z7afzy+XYpbufx
	dpEq+e5m9Kp4FICSIrfWeiifkKk2f6/RW/G1rEpdAsOJzpotHRqIFvKeGOLJy1Xa5sTKGqDBeQz
	4KMiuROx5ss7ScLHctPO+r4NsLCMHJwCAuoGNhnjRk/m/ELRHtxTgJNXqY0DxBz9M7+3icr4I3i
	61nsM91prMpLrlUjYvDDnAbvMWtJ0+fwDUzcdqxxjSLXItrRHiFHMQ6zU7C6GQaZIb4c+/FgtOU
	D8PDQIvHHbGRpoA4C3pfA6I9obt/A4HDjAzGVek/3W3wG0htpLuIKkcwf/lHf/QXZxpAfuDsm8J
	/FcoyAlhdcFrOfBvjNOj7e2V/eAwBXBtP9gKegO1Yd4sQ/66GuUvt9
X-Google-Smtp-Source: AGHT+IHMhMM/WcqOC+40/CZXzxi+sVHMlKI3vfKumXj5CG2qbmIl/AdQzRU5H/oZ2Xbc89Ibz5CWGw==
X-Received: by 2002:a05:600c:a44:b0:477:5aaa:57a6 with SMTP id 5b1f17b1804b1-4778fe69cb3mr22853755e9.10.1763112887580;
        Fri, 14 Nov 2025 01:34:47 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47787e8e6a1sm131781785e9.11.2025.11.14.01.34.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 01:34:47 -0800 (PST)
Date: Fri, 14 Nov 2025 09:34:45 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: Eric Biggers <ebiggers@kernel.org>, Mimi Zohar <zohar@linux.ibm.com>,
 David Howells <dhowells@redhat.com>, Jarkko Sakkinen <jarkko@kernel.org>,
 Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, "Serge
 E. Hallyn" <serge@hallyn.com>, linux-hardening@vger.kernel.org,
 linux-integrity@vger.kernel.org, keyrings@vger.kernel.org,
 linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] KEYS: encrypted: Replace deprecated strcpy and
 improve get_derived_key
Message-ID: <20251114093445.0ec74428@pumpkin>
In-Reply-To: <20251113215546.136145-1-thorsten.blum@linux.dev>
References: <20251113215546.136145-1-thorsten.blum@linux.dev>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 13 Nov 2025 22:55:45 +0100
Thorsten Blum <thorsten.blum@linux.dev> wrote:

> strcpy() is deprecated; use the safer strscpy() and use its return
> value, the number of bytes copied, instead of calling strlen() on the
> destination buffer again. String truncation can be ignored since
> 'derived_buf' is guaranteed to be large enough.
> 
> Link: https://github.com/KSPP/linux/issues/88
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> ---
> Changes in v2:
> - Revert some changes to include the trailing '\0' even if key_type == 0
>   since this would change the bytes passed to sha256() (Eric Biggers)
> - Use strscpy() and its return value instead
> - Link to v1: https://lore.kernel.org/lkml/20251113135831.98587-1-thorsten.blum@linux.dev/
> ---
>  security/keys/encrypted-keys/encrypted.c | 21 ++++++++-------------
>  1 file changed, 8 insertions(+), 13 deletions(-)
> 
> diff --git a/security/keys/encrypted-keys/encrypted.c b/security/keys/encrypted-keys/encrypted.c
> index 15841466b5d4..94408909f1dd 100644
> --- a/security/keys/encrypted-keys/encrypted.c
> +++ b/security/keys/encrypted-keys/encrypted.c
> @@ -12,6 +12,7 @@
>   */
>  
>  #include <linux/uaccess.h>
> +#include <linux/minmax.h>
>  #include <linux/module.h>
>  #include <linux/init.h>
>  #include <linux/slab.h>
> @@ -330,23 +331,17 @@ static int get_derived_key(u8 *derived_key, enum derived_key_type key_type,
>  			   const u8 *master_key, size_t master_keylen)
>  {
>  	u8 *derived_buf;
> -	unsigned int derived_buf_len;
> -
> -	derived_buf_len = strlen("AUTH_KEY") + 1 + master_keylen;
> -	if (derived_buf_len < HASH_SIZE)
> -		derived_buf_len = HASH_SIZE;
> +	size_t derived_buf_len;
> +	const char *key_name;
> +	ssize_t len;
>  
> +	derived_buf_len = max(strlen("AUTH_KEY") + 1 + master_keylen, HASH_SIZE);
>  	derived_buf = kzalloc(derived_buf_len, GFP_KERNEL);
>  	if (!derived_buf)
>  		return -ENOMEM;
> -
> -	if (key_type)
> -		strcpy(derived_buf, "AUTH_KEY");
> -	else
> -		strcpy(derived_buf, "ENC_KEY");
> -
> -	memcpy(derived_buf + strlen(derived_buf) + 1, master_key,
> -	       master_keylen);
> +	key_name = key_type ? "AUTH_KEY" : "ENC_KEY";
> +	len = strscpy(derived_buf, key_name, derived_buf_len);
> +	memcpy(derived_buf + len + 1, master_key, master_keylen);
>  	sha256(derived_buf, derived_buf_len, derived_key);

I'm not sure this is an improvement, but has this code ever been correct?
The buffer passed to sha256 is either:
	"AUTH_KEY"'\0'master_key
or
	"ENC_KEY"'\0'master_key
For short master_key the buffer is HASH_SIZE bytes and padded with zeros (ok).
However for long master_key the length is calculated using "AUTH_KEY" so
there is an additional trailing '\0' in the "ENC_KEY" case.

	David



>  	kfree_sensitive(derived_buf);
>  	return 0;


