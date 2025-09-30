Return-Path: <keyrings+bounces-3129-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7461FBACC87
	for <lists+keyrings@lfdr.de>; Tue, 30 Sep 2025 14:11:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3C81532186C
	for <lists+keyrings@lfdr.de>; Tue, 30 Sep 2025 12:11:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F4D02F99AE;
	Tue, 30 Sep 2025 12:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="De2HCYpu"
X-Original-To: keyrings@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9A341B4236
	for <keyrings@vger.kernel.org>; Tue, 30 Sep 2025 12:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759234297; cv=none; b=jK2S9AjhEPLlQgjUXUSy1mGMPMyKKAJN1ZJmCroCwM5vWBjM3/QUA2qOUB566BiTvCnUjaiEWe75dLlnrbE/CNh+tQ9+t1m/4OYaCEBW2/vugOBR5fJH26Q4+qGiIftYY3DaAqHXLn7QAodRQJdvcITKtlh33gOMIrzE3CxWb+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759234297; c=relaxed/simple;
	bh=KD8kMWmVHWif/IAatoSGDNampJhPM/CNfGdxYnMKEMc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qnV0v0sqBjMY0xcOIaQCk8dGjU58NW6h9Ze/9ROSBcim1cUtk0w8CZbLxjXzV+xxW7+7Zhgviuz1j/TDgrEHSHMU50qdHqblzH3HVoMdCBGROJTEt1AqhKNQJA8Onk0klJKAWWQI9CZb6wQN+l4a6AgtTJkkxuSiDXa9Ifkp6i4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=De2HCYpu; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1759234294;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nYhlOTDpz0Sda3KEKTdInplw8rxwP1Ctg1XIqKxUWtw=;
	b=De2HCYpuUgr7oGDomhsFLIVb/bTgI9y7RUJU/i1Ka7wxZDRBVgp+2u6cwvL3W4q1125hnW
	jU0h4Zybm7jPPhUAEGe/PuhnOJ2I7GaodtVudxC5ecYUNL6CtD+ifhX8yGVVuIWTlwPUN9
	6E87pKQgwyfu2t+Niqv8Q1+BNZBPEXA=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-421-vnJW4dC3OlGVsOnJ_Z7nUA-1; Tue, 30 Sep 2025 08:11:32 -0400
X-MC-Unique: vnJW4dC3OlGVsOnJ_Z7nUA-1
X-Mimecast-MFC-AGG-ID: vnJW4dC3OlGVsOnJ_Z7nUA_1759234292
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-634b661347bso5599971a12.3
        for <keyrings@vger.kernel.org>; Tue, 30 Sep 2025 05:11:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759234291; x=1759839091;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nYhlOTDpz0Sda3KEKTdInplw8rxwP1Ctg1XIqKxUWtw=;
        b=aCt8CMsmBHLhNT4QymlpIl132hBEaRMteOMba6Digo/jQW63IJwFq/99dhYRCVhX8z
         QiOpnbmvVolrN8v7M7y+taggnQ8bnxOHdNeilXyPdHi6lF1f5Sfu+KN3JLgcdaNCgXU8
         +Ax9OPDszT5niuvKn2mbtl2M/TdSEfrisYmd0Rl8TcZP3dudBaZrXzUOJZd5NBKK99eL
         dkwDllbFL5/lSmiqUGQ3DTBu8KMw9NSuvuj/ex/CYE7ugGr7AfIOIhWJ+19n2KQSAZ2q
         Qq2u4KsQKjpFewbi21R5fJ7CxVV0EaTSL3Cb8wlXxYqH6XRASBSRdLqItd5uLLA+zEnT
         475g==
X-Forwarded-Encrypted: i=1; AJvYcCVwGXumN4g+BnUwmqlmyQ7GBH9BreLC5OsDW3mMPvn4k9SPqrk4MDyvqV9shAyejbc9GTw9DnkmDg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzxkajNnNXJ5zdp05YEn14CMUWkgpOydWLco7IbhMJucmD2l1xF
	VBZOt78lx28A/ALPtoZLI6O/ceYED8z3LrdH2dbBce17U9UxZBwQMeldKtE8c/8ZBixIdUzYVvI
	KR9qor0SUric7w+5BK4nkI4rRAj+SB2P28vtJWFUobCaD+az5GSFkDy+MX6kY
X-Gm-Gg: ASbGncuzSUqxA0iEHfz3H4YdaWrik8dEoAaC7KcnvaBSHyM2Ebax8fN6jCwnyFXnIAZ
	jMH4EVBXnseM70S04su/ZxVMx3HKxg1038UmK7oGUwtaYUG5dyux+8nRFi3bgJDn0SNBsa08AHE
	mbUmF5JMDVX1rzQ7Cwp5TdctbJMpZw3AJlv95BIhIMalsgwcXGwCfbcSK1AvDNSEVI14DZlImPc
	VJsHATTj/w1OBAQR4q1KlKcIjKBB7mKHIYPA3zGFW0pKY5V0Slp7/9a0Cg7eIIcb1vrPpw/W/VM
	6UHhoj/MTIkhiMJWp2yTUc6MSL54OtZEsfneErM+P2pEm+wm5Z+e9/A8C7WBULMZVVvhdPfpwm8
	PEMCQcrP1XknnnBQc3lYvGw==
X-Received: by 2002:a05:6402:3551:b0:636:23c2:e61f with SMTP id 4fb4d7f45d1cf-63623c2f2d5mr11899901a12.26.1759234291461;
        Tue, 30 Sep 2025 05:11:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHpBFHlpi6h26vswLogB4lR1OKDkES+l20vuTxXnbWfysRnTRsji62rg1W2cZYzxCghNaMmAA==
X-Received: by 2002:a05:6402:3551:b0:636:23c2:e61f with SMTP id 4fb4d7f45d1cf-63623c2f2d5mr11899850a12.26.1759234290960;
        Tue, 30 Sep 2025 05:11:30 -0700 (PDT)
Received: from sgarzare-redhat (host-79-46-200-153.retail.telecomitalia.it. [79.46.200.153])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-634a3b02ccbsm9498953a12.45.2025.09.30.05.11.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 05:11:30 -0700 (PDT)
Date: Tue, 30 Sep 2025 14:11:23 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: linux-integrity@vger.kernel.org, dpsmith@apertussolutions.com, 
	ross.philipson@oracle.com, Jarkko Sakkinen <jarkko.sakkinen@opinsys.com>, 
	Peter Huewe <peterhuewe@gmx.de>, Jason Gunthorpe <jgg@ziepe.ca>, 
	David Howells <dhowells@redhat.com>, Paul Moore <paul@paul-moore.com>, 
	James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, 
	open list <linux-kernel@vger.kernel.org>, "open list:KEYS/KEYRINGS" <keyrings@vger.kernel.org>, 
	"open list:SECURITY SUBSYSTEM" <linux-security-module@vger.kernel.org>
Subject: Re: [PATCH v3 02/10] tpm: Use -EPERM as fallback error code in
 tpm_ret_to_err
Message-ID: <hjay4b2lomj6k63tbnuk55q6mm4sdj2d7yycw64ybhu372l6bd@uqetr6ipbtg4>
References: <20250929194832.2913286-1-jarkko@kernel.org>
 <20250929194832.2913286-3-jarkko@kernel.org>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20250929194832.2913286-3-jarkko@kernel.org>

On Mon, Sep 29, 2025 at 10:48:24PM +0300, Jarkko Sakkinen wrote:
>From: Jarkko Sakkinen <jarkko.sakkinen@opinsys.com>
>
>Using -EFAULT as the tpm_ret_to_err() fallback error code causes makes it
>incompatible on how trusted keys transmute TPM return codes.
>
>Change the fallback as -EPERM in order to gain compatibility with trusted
>keys. In addition, map TPM_RC_HASH to -EINVAL in order to be compatible
>with tpm2_seal_trusted() return values.
>
>Signed-off-by: Jarkko Sakkinen <jarkko.sakkinen@opinsys.com>
>---
>v3:
>- Removed fixes tag as it hardly categorizes as a bug fix.
>v2:
>- Split trusted_tpm2 change to a separate patch.
>---
> include/linux/tpm.h | 4 +++-
> 1 file changed, 3 insertions(+), 1 deletion(-)

LGTM now!

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>

>
>diff --git a/include/linux/tpm.h b/include/linux/tpm.h
>index fc7df87dfb9a..51846317d662 100644
>--- a/include/linux/tpm.h
>+++ b/include/linux/tpm.h
>@@ -453,8 +453,10 @@ static inline ssize_t tpm_ret_to_err(ssize_t ret)
> 		return 0;
> 	case TPM2_RC_SESSION_MEMORY:
> 		return -ENOMEM;
>+	case TPM2_RC_HASH:
>+		return -EINVAL;
> 	default:
>-		return -EFAULT;
>+		return -EPERM;
> 	}
> }
>
>-- 
>2.39.5
>
>


