Return-Path: <keyrings+bounces-2449-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F0947A559EF
	for <lists+keyrings@lfdr.de>; Thu,  6 Mar 2025 23:39:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ECC993B1A6F
	for <lists+keyrings@lfdr.de>; Thu,  6 Mar 2025 22:39:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09FDE27CB0C;
	Thu,  6 Mar 2025 22:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b="JuWR+waS"
X-Original-To: keyrings@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 350291F4185
	for <keyrings@vger.kernel.org>; Thu,  6 Mar 2025 22:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741300751; cv=none; b=WYwLU/e4DNI/qSFKPlAYOuJN3cBwJTtTQ1SlqqoXXbl8NgTPbRCgcvEo/yIizeL3ynLcxbikd6hfw4KUM2W6QfgTlRsKPwyKiSFkPstSNpeMXLhuEfmyk+OyX8vSmgTLQjsMMQNG6lqnT+80Sq7DC+zOkzX3msU0Vd3QD1tdl6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741300751; c=relaxed/simple;
	bh=hPzh7ssBwl1dUtDKNrXIa7KqEjktBsI9Rm9Oh1CqqTE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EBdZhRCLdensVEGb/ZPSYdQ27cOmMWkDyJazrL3M5T96z77hCkPIW/+3zw7wbmoNiydFssvNPmWhBK/0WT3FyudN7ZVeLZUM+LRktCf/bzibyUH9d992MDMhHM+MJ4Mi8pDyMXtRVksNL/F5DL+bgBBg6Pp2Tocz4jshAhCT0Vk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com; spf=pass smtp.mailfrom=cloudflare.com; dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b=JuWR+waS; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2234e5347e2so23491075ad.1
        for <keyrings@vger.kernel.org>; Thu, 06 Mar 2025 14:39:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1741300749; x=1741905549; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h+DEPeF6tUdrf5sYZTIAFqaj+xuuM1BUFzIBk9RHTI0=;
        b=JuWR+waSQMkH0iH3cMQ8qbklxMWjjNbG5WZtfi1bNNl90Y3xWsDVNKguvHcHpxO2s0
         NtRs/Ca6VESVIgbSXPhjBjiGouvuffkk0jnWfZcxQxEYP+e+WsE7t+rsFqcxYltcidgS
         CXjJZNfvPtcVamKMo/2+4hTPxhuLD48IlV3qbSxylIKiXlMkL1n+KiErrCc3UnMGd/s+
         PtQUhsVFNzGwTqD3WjpIH4JQsakyJ1vm56WqFe/XEaFBdjkS1s+6StUmnASgR4XItV7r
         nnMXJav+TuYEuPNI1srTJ+HHpWB3NYnJiwHaY+wX4SxUzXVblYqLSPsKpDNQLYW6ndrs
         iGHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741300749; x=1741905549;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h+DEPeF6tUdrf5sYZTIAFqaj+xuuM1BUFzIBk9RHTI0=;
        b=sYhdk2CZz156856AYY/XjJnELq3zq9wpMHYctseo0fprB6e6kha1bKRrvTFJ5b9sC/
         o8Qk1nXSOmsQWBJA3iStw+sDDjOgWSvv0avQpKMzYv9/wt4aUCMx4OiWpo6yja2GupMB
         UEMJ9WEXnRCmjZZhN6/4ZzDKG1PXVaJrwXge9BGEGbC+AHPtYRiji0dLi0lTzP/Wmiy1
         KstMlvozV7D1XKgmyaS3hAO71PpnHHn7EXGh/mHVK/WX1qrocyvC+zypg2syilNu7HQJ
         lW/dFGgGMMi9NXjPDC4eo8hvPNL+/YIthetXIhoxn9RUiKC1lc26seVTMI0EXoYDWAlE
         gGJA==
X-Forwarded-Encrypted: i=1; AJvYcCU/Ytgcn+D+ANq427I5/DaUUvvdQSAP+89eKCJTcfFMz5UsoT7uX6bd4aoBULGasbz305piI/VSnA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwtcUJsRlfHaTjlffacG8nW5ahY4r7rBqCTIvfKBxXl02eGuSoh
	RlX3U4qQ7kA8QtNn9xySTiJx2IQ1uHOls4V4uVLqGD0KXqU7XEWMBUX04Xy+1WCVxLRRL8jF+yo
	QAb6c/O2zbJJNpJMJpy3GdLZOrlDNiqrfa74+2w==
X-Gm-Gg: ASbGnct+92HqLP4yqtuP/eRhHuF4h5eK8PchJgyuUkYt9p4FIJC6vmcWMCnT92Gb7hd
	kUYqQQFt4qTx6h4LVcmRdt4v1Y+Ys7iE7x156YUBUxRbPvmzRL0tcjmIr5IXl3weGGaJoWqFlgd
	upITrmMiHEc7v3wQR3UwshhD0mrbegKixCDstAD8gpuAMkdJZjdi6L2dt+Xsc=
X-Google-Smtp-Source: AGHT+IGXTvH+QOSG/rW5XS7z1aEK3pcaK2z1twmViFnZzxKB7GeXwBWo4+UDouBTG979vA3+Yhzz/ndkDjnQ6YGlo8g=
X-Received: by 2002:a17:903:1b63:b0:224:1005:7280 with SMTP id
 d9443c01a7336-22428bd57a2mr18397955ad.38.1741300749421; Thu, 06 Mar 2025
 14:39:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <90c171d5beed08bcf65ec2df6357a7ac97520b91.1741194399.git.lukas@wunner.de>
In-Reply-To: <90c171d5beed08bcf65ec2df6357a7ac97520b91.1741194399.git.lukas@wunner.de>
From: Ignat Korchagin <ignat@cloudflare.com>
Date: Thu, 6 Mar 2025 22:38:58 +0000
X-Gm-Features: AQ5f1JoJa6SipvivxSs9TwSia_gUcfciKY7Kxc9Vy9q0r_E9yeTQv3AQR3ZIAAY
Message-ID: <CALrw=nG-NP=XAUD3V5O44j3fbea0-zhKJM1tgOmwN8yyQMYu-g@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Add Lukas & Ignat & Stefan for asymmetric keys
To: Lukas Wunner <lukas@wunner.de>
Cc: Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, 
	David Howells <dhowells@redhat.com>, Stefan Berger <stefanb@linux.ibm.com>, 
	Tadeusz Struk <tstruk@gmail.com>, Tadeusz Struk <tstruk@gigaio.com>, Vitaly Chikunov <vt@altlinux.org>, 
	linux-crypto@vger.kernel.org, keyrings@vger.kernel.org, 
	Eric Biggers <ebiggers@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 5, 2025 at 5:16=E2=80=AFPM Lukas Wunner <lukas@wunner.de> wrote=
:
>
> Herbert asks for long-term maintenance of everything under
> crypto/asymmetric_keys/ and associated algorithms (ECDSA, GOST, RSA) [1].
>
> Ignat has kindly agreed to co-maintain this with me going forward.
>
> Stefan has agreed to be added as reviewer for ECDSA.  He introduced it
> in 2021 and has been meticulously providing reviews for 3rd party
> patches anyway.
>
> Retain David Howells' maintainer entry until he explicitly requests to
> be removed.  He originally introduced asymmetric keys in 2012.
>
> RSA was introduced by Tadeusz Struk as an employee of Intel in 2015,
> but he's changed jobs and last contributed to the implementation in 2016.
>
> GOST was introduced by Vitaly Chikunov as an employee of Basealt LLC [2]
> (=D0=91=D0=B0=D0=B7=D0=B0=D0=BB=D1=8C=D1=82 =D0=A1=D0=9F=D0=9E [3]) in 20=
19.  This company is an OFAC sanctioned entity
> [4][5], which makes employees ineligible as maintainer [6].  It's not
> clear if Vitaly is still working for Basealt, he did not immediately
> respond to my e-mail.  Since knowledge and use of GOST algorithms is
> relatively limited outside the Russian Federation, assign "Odd fixes"
> status for now.
>
> [1] https://lore.kernel.org/r/Z8QNJqQKhyyft_gz@gondor.apana.org.au/
> [2] https://prohoster.info/ru/blog/novosti-interneta/reliz-yadra-linux-5-=
2
> [3] https://www.basealt.ru/
> [4] https://ofac.treasury.gov/recent-actions/20240823
> [5] https://sanctionssearch.ofac.treas.gov/Details.aspx?id=3D50178
> [6] https://lore.kernel.org/r/7ee74c1b5b589619a13c6318c9fbd0d6ac7c334a.ca=
mel@HansenPartnership.com/
>
> Signed-off-by: Lukas Wunner <lukas@wunner.de>
> ---
>  MAINTAINERS | 28 ++++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 8e0736d..b16a1cc 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -3595,14 +3595,42 @@ F:      drivers/hwmon/asus_wmi_sensors.c
>
>  ASYMMETRIC KEYS
>  M:     David Howells <dhowells@redhat.com>
> +M:     Lukas Wunner <lukas@wunner.de>
> +M:     Ignat Korchagin <ignat@cloudflare.com>
>  L:     keyrings@vger.kernel.org
> +L:     linux-crypto@vger.kernel.org
>  S:     Maintained
>  F:     Documentation/crypto/asymmetric-keys.rst
>  F:     crypto/asymmetric_keys/
>  F:     include/crypto/pkcs7.h
>  F:     include/crypto/public_key.h
> +F:     include/keys/asymmetric-*.h
>  F:     include/linux/verification.h
>
> +ASYMMETRIC KEYS - ECDSA
> +M:     Lukas Wunner <lukas@wunner.de>
> +M:     Ignat Korchagin <ignat@cloudflare.com>
> +R:     Stefan Berger <stefanb@linux.ibm.com>
> +L:     linux-crypto@vger.kernel.org
> +S:     Maintained
> +F:     crypto/ecc*
> +F:     crypto/ecdsa*
> +F:     include/crypto/ecc*
> +
> +ASYMMETRIC KEYS - GOST
> +M:     Lukas Wunner <lukas@wunner.de>
> +M:     Ignat Korchagin <ignat@cloudflare.com>
> +L:     linux-crypto@vger.kernel.org
> +S:     Odd fixes
> +F:     crypto/ecrdsa*
> +
> +ASYMMETRIC KEYS - RSA
> +M:     Lukas Wunner <lukas@wunner.de>
> +M:     Ignat Korchagin <ignat@cloudflare.com>
> +L:     linux-crypto@vger.kernel.org
> +S:     Maintained
> +F:     crypto/rsa*
> +
>  ASYNCHRONOUS TRANSFERS/TRANSFORMS (IOAT) API
>  R:     Dan Williams <dan.j.williams@intel.com>
>  S:     Odd fixes
> --
> 2.43.0
>

Acked-by: Ignat Korchagin <ignat@cloudflare.com>

Regards,
Ignat

