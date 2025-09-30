Return-Path: <keyrings+bounces-3130-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E0C8FBACC9C
	for <lists+keyrings@lfdr.de>; Tue, 30 Sep 2025 14:12:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 96E2D3C247C
	for <lists+keyrings@lfdr.de>; Tue, 30 Sep 2025 12:12:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F00A62F8BF3;
	Tue, 30 Sep 2025 12:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="C9uz80kz"
X-Original-To: keyrings@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44B452F7AD4
	for <keyrings@vger.kernel.org>; Tue, 30 Sep 2025 12:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759234369; cv=none; b=L1H0NTzxWhmKzArSafAZokuY+TpVyfdA8OMRzgS9uv+SYFjw1WvlzY3uXey08SMoQLq3yeeKZkM9dHJD1uNJ8CcC9PR4g6jBNgGJXqPC4Y7c6Tl+kL+pRJSpVc4vDt+TYNLj7EFfJOZJH28Bl1TY6LuAhijaNkq2JK5Bjyw6BvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759234369; c=relaxed/simple;
	bh=8hAe6inhz0E/QWnBDuNMlbdqmEfM/Hzecqaiue2MllA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JBcQ2WLuLmm+bJfbzT/l599ONln8UyfNIumPEG0wRh6T5sUQYIKtpss6SeBwuuhZZK6vLVUb6qTacCc5z1t260sbPkb+ss9UuKSuLi6I23+xZGb0XK06YIQOKQjWS532Xv+IK5Yy4G0Tort+5V2dW3ujNHe32ta28koOrScJTGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=C9uz80kz; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1759234366;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CWIgSoKL3urKBOhTmtSOXc8Pl4O+FoLwxpjwzaySij8=;
	b=C9uz80kznLvVCdCiEkKy0EsM65IkkAxBmnhmxWsd5pIl1QmPj0arT4eOf1FEDajgGGEP9L
	oZi6J5AHZH1VXQl9fvky+HmzuIYt6WzQpe+1sdAeN38eJIaT0BIxRZVGtcj1O+7eB+X8XJ
	w8jjArwkBkaheLszZ0EUO+1epNSEuNE=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-523-6b9Gg74WMgyrG8o24QMjxA-1; Tue, 30 Sep 2025 08:12:44 -0400
X-MC-Unique: 6b9Gg74WMgyrG8o24QMjxA-1
X-Mimecast-MFC-AGG-ID: 6b9Gg74WMgyrG8o24QMjxA_1759234364
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-6305c385adbso9178404a12.1
        for <keyrings@vger.kernel.org>; Tue, 30 Sep 2025 05:12:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759234363; x=1759839163;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CWIgSoKL3urKBOhTmtSOXc8Pl4O+FoLwxpjwzaySij8=;
        b=AVViJZbh8XV/i9pHA87/7uF1Gk+sFJ3rpQxLXOZbAuDukpOjVrnDSQf4Ww6L3AxDf/
         zPwohRl4tkaa6OQCvO6XUAYhrJ3vRbJdfuTqrcZvQfb+2bbRDmunTXeGEiTziSK0YVPK
         g1pO5tRuztBHM5hIFNro14bsLT6iCkVL7SSOQp0MdtTUlyxZbje5Ws/H75fbIgl8KDbB
         6nt9YZlmzjOk2iRs/b02kYCrS8RO+xQ4ekPaOiBRvjojLkv18Wg1DRkZa/8jEL5f105D
         PF09g6HQj53a344FhppbaDpf6lW0alYjCJJlR4lqM1+m9R43OPzcoyphk4PFYgE1ggNB
         +74g==
X-Forwarded-Encrypted: i=1; AJvYcCWTLIrjQBrVFH5ceOYHsGIQ6sk/sHY0evDuuFlg5W0r6SM3IoiyjcwdXFdadut4EDTlXLvftfPreQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzd0pVeB1uKnQG6byVg+g56UziYVnTdqm07gWcNc7urEDfk5pvk
	SrK9m8V48eFF0siitD4SfTpbmGovaIgLXZMKlFbmAbuqyQgt6mHN5pdyElLRxPJCGJAUtjF3dBs
	KpIRPcX2ffy7j3KJZTqjtvWM2l/LC+FDWgVyQUbptXmjLXzi7tevN4tGaq0sV
X-Gm-Gg: ASbGncu9Uho2hjFuWVp+/DbzZj6r1jKOtb5vnobaeW+rAv1rHzX58nWkyDb1viaBBSv
	X7GRwNH64FojuIJ43JtkJHS9kW+Br7aj/m+K/CDUbKDRRMGpglI9Esq8xNawk55hvG0C3i3h9vA
	8cH0+qa9MZfzdyk4A0g6RZUiRb/ORaUu0tIkVkZomLI2V1Ig7Xpedznoe/HzuS5DoW6k23jd8XN
	kCsJwzAGQ3I/CyCJuv4pKTJ4XjczxTpdTFQCzVXhYqT/6Hpeh3IS9cHLqWeHpy2X28wGjYdB7/U
	psKAeo92q9LTgV2H5YIJ+sujE+jxyBDIuctNyWcKHM5VjIRh2D6s1OMnM7VB9G4b+JCP/dH84ut
	FdEl/9HT602/MmDU2U9Y5Dg==
X-Received: by 2002:a17:907:3c8f:b0:b04:36bb:545 with SMTP id a640c23a62f3a-b34bb12fc3dmr2371563066b.48.1759234363474;
        Tue, 30 Sep 2025 05:12:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHCMW+GDcVwUnAC/efDdJR1OCcQoMagIWww3faxZxGxD2S8ezNsWbFnZUmUdO9qvxkKur0+NA==
X-Received: by 2002:a17:907:3c8f:b0:b04:36bb:545 with SMTP id a640c23a62f3a-b34bb12fc3dmr2371558866b.48.1759234363046;
        Tue, 30 Sep 2025 05:12:43 -0700 (PDT)
Received: from sgarzare-redhat (host-79-46-200-153.retail.telecomitalia.it. [79.46.200.153])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-634a3b05779sm9854125a12.49.2025.09.30.05.12.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 05:12:42 -0700 (PDT)
Date: Tue, 30 Sep 2025 14:12:35 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: linux-integrity@vger.kernel.org, dpsmith@apertussolutions.com, 
	ross.philipson@oracle.com, Jarkko Sakkinen <jarkko.sakkinen@opinsys.com>, 
	David Howells <dhowells@redhat.com>, Paul Moore <paul@paul-moore.com>, 
	James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, Mimi Zohar <zohar@linux.ibm.com>, 
	"open list:KEYS/KEYRINGS" <keyrings@vger.kernel.org>, 
	"open list:SECURITY SUBSYSTEM" <linux-security-module@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 03/10] KEYS: trusted: Use tpm_ret_to_err() in
 trusted_tpm2
Message-ID: <7icpto3rnm2f4u6zaxl4xy7zvar3q4hhpgelq2gnazszdkwc3m@5dtivkqs5xdg>
References: <20250929194832.2913286-1-jarkko@kernel.org>
 <20250929194832.2913286-4-jarkko@kernel.org>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20250929194832.2913286-4-jarkko@kernel.org>

On Mon, Sep 29, 2025 at 10:48:25PM +0300, Jarkko Sakkinen wrote:
>From: Jarkko Sakkinen <jarkko.sakkinen@opinsys.com>
>
>Use tpm_ret_to_err() to transmute TPM return codes in trusted_tpm2.
>
>Signed-off-by: Jarkko Sakkinen <jarkko.sakkinen@opinsys.com>
>---
>v3:
>- No changes.
>v2:
>- New patch split out from the fix.
>---
> security/keys/trusted-keys/trusted_tpm2.c | 26 ++++++-----------------
> 1 file changed, 7 insertions(+), 19 deletions(-)

Nice clean up!

Acked-by: Stefano Garzarella <sgarzare@redhat.com>

>
>diff --git a/security/keys/trusted-keys/trusted_tpm2.c b/security/keys/trusted-keys/trusted_tpm2.c
>index 024be262702f..e165b117bbca 100644
>--- a/security/keys/trusted-keys/trusted_tpm2.c
>+++ b/security/keys/trusted-keys/trusted_tpm2.c
>@@ -348,25 +348,19 @@ int tpm2_seal_trusted(struct tpm_chip *chip,
> 	}
>
> 	blob_len = tpm2_key_encode(payload, options, &buf.data[offset], blob_len);
>+	if (blob_len < 0)
>+		rc = blob_len;
>
> out:
> 	tpm_buf_destroy(&sized);
> 	tpm_buf_destroy(&buf);
>
>-	if (rc > 0) {
>-		if (tpm2_rc_value(rc) == TPM2_RC_HASH)
>-			rc = -EINVAL;
>-		else
>-			rc = -EPERM;
>-	}
>-	if (blob_len < 0)
>-		rc = blob_len;
>-	else
>+	if (!rc)
> 		payload->blob_len = blob_len;
>
> out_put:
> 	tpm_put_ops(chip);
>-	return rc;
>+	return tpm_ret_to_err(rc);
> }
>
> /**
>@@ -468,10 +462,7 @@ static int tpm2_load_cmd(struct tpm_chip *chip,
> 		kfree(blob);
> 	tpm_buf_destroy(&buf);
>
>-	if (rc > 0)
>-		rc = -EPERM;
>-
>-	return rc;
>+	return tpm_ret_to_err(rc);
> }
>
> /**
>@@ -534,8 +525,6 @@ static int tpm2_unseal_cmd(struct tpm_chip *chip,
> 	tpm_buf_fill_hmac_session(chip, &buf);
> 	rc = tpm_transmit_cmd(chip, &buf, 6, "unsealing");
> 	rc = tpm_buf_check_hmac_response(chip, &buf, rc);
>-	if (rc > 0)
>-		rc = -EPERM;
>
> 	if (!rc) {
> 		data_len = be16_to_cpup(
>@@ -568,7 +557,7 @@ static int tpm2_unseal_cmd(struct tpm_chip *chip,
>
> out:
> 	tpm_buf_destroy(&buf);
>-	return rc;
>+	return tpm_ret_to_err(rc);
> }
>
> /**
>@@ -600,6 +589,5 @@ int tpm2_unseal_trusted(struct tpm_chip *chip,
>
> out:
> 	tpm_put_ops(chip);
>-
>-	return rc;
>+	return tpm_ret_to_err(rc);
> }
>-- 
>2.39.5
>
>


