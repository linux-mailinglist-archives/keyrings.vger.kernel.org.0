Return-Path: <keyrings+bounces-3070-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B506B93335
	for <lists+keyrings@lfdr.de>; Mon, 22 Sep 2025 22:17:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 03677164F89
	for <lists+keyrings@lfdr.de>; Mon, 22 Sep 2025 20:17:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B17892EF676;
	Mon, 22 Sep 2025 20:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MSmaDQ51"
X-Original-To: keyrings@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D19D2286893
	for <keyrings@vger.kernel.org>; Mon, 22 Sep 2025 20:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758572262; cv=none; b=Z4u/xZUmxicqaktRezeKujDQRrqyj70/z+A90N0+fWzcGvKwPUulqIqqaKNX0duDBJ21lRlv5JMiaIT9uYSGZMhPa9s+ATCcdx1L/eLD2WFZ4Z+mrTQE5vNbhairRlWAQn6c57ibU0otne5fKjYnw2rMJU/erN8sddC9mgwziPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758572262; c=relaxed/simple;
	bh=nmtqbHU/w/B61zuLXPpSmmuVWqr/lOlDK84jUWG4zdE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qnWSNG5iw5ZXDOroNGb/wPStkaGSaGfnV0H4iDrcIO50U2DQZk6Jp35HGNYE0evHPlAdJDZoSFM7N9kbFr5NCTLP5JNrp14l01HmmLqPuYE/VN4lrMmcgO2Zn/OsooS1sBsUKNTgeWDjmR82tjTJC3AUyQmMG0dd/FTwNO7k8yQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MSmaDQ51; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-57abcb8a41eso492e87.1
        for <keyrings@vger.kernel.org>; Mon, 22 Sep 2025 13:17:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1758572259; x=1759177059; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FWtQpQUzJ9r+dDTG1AXpfBAR2RpoIfe3F7cTMYfaN2A=;
        b=MSmaDQ51fKyzm6PI1NTJw21GpO6V3rz8skHp0uPwapIEEqCT4rtgVz/caC5i1ugkgI
         T81temQRVCw5fAUKfI+KuIZqMESLl/Pd4+MOSMEBvOygVgRKZEefPD2c3lFbTRCmAKmZ
         HFf4JtUELBa+fdBNxuWEH9ama8zkApepJaGH2IrqAIQihpsLHKcsLIXlncw16xh0UcSP
         q1XKp069hDHU+V67oa69A2Q6myYMsMuh4N8E1Q0lYe80VPH2mRE3b/ciFKd163FfDoac
         yrRHzkZ0v0VbZou6usffI0LPQvE8H/xgbS0FGepru/hBIbOUHTo14+jyAkbZY83IG5Mi
         i7xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758572259; x=1759177059;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FWtQpQUzJ9r+dDTG1AXpfBAR2RpoIfe3F7cTMYfaN2A=;
        b=NsrLtOT/rA1JGGwg482evKZGGMHRTU12h2retwRzpo8hCLceaV+5NEkmPrM65sMfPK
         FFPKvJXGjyqv8fsCQVGY/X2NC1zp8Bxd0qhYofJGDbb38mXm3C/QcNDcQ83ebv6O18V4
         0LZYIkfDkRM/criZMvFPMbGk37jM7mrx0vBhYf21OcOGMrx2pOUAkDE7kH/5t043ksEp
         T6og0y8YrY5ApRlCg/gkkZ6u/WjMuMkZ/H5zhkRmmP9UUhfZ6kRfWIp/Hgd2JVGgbb63
         YP40weYfXsyk0oUQUI82VhPxb5HfbbdJTd9eS+F+Y8acSWUzAdzojd5hEc84m4C++6iM
         6/Cg==
X-Forwarded-Encrypted: i=1; AJvYcCVbTMiS3oHiO5ddtezJhrXw6lHXR+0r8748kJmroI22F25bDb1C74cAlcN9wOq6QK/ZIbM9q1fZWw==@vger.kernel.org
X-Gm-Message-State: AOJu0YynhgthNniWTumjy5W24HvVzWBILqb0VPUVObi/VdZ/F1JGiHgL
	4rULHOC9KAMeSVMJ0Dvacg0xRu/FU4SNzpzprC4FcHBRZudd1FOmCLj+5drPoO4/Pr0eecAqwgl
	bgaTqr9eK2qLajW87XsSxZ9y4bChoVpG1SgE+yNGx
X-Gm-Gg: ASbGncvN+VMXz7MLv4rkeTBtvNKRJsLQXrbzXEYzPpAF/tTTEiQLebWyQWd2vpFiw5O
	4C96Fda93XSlu4UrqOhBQ1C3+NsI1tcib/VJNt9p6rJ80FVoqOU+pNw32M8LjmdkWXzBpqPuwoX
	gJmuTtCehASz1n4Oa5xOaRS19Ohj1Y6lsF8pPV+P+IG+6BR/3fLfQXhyZ6/yXz01moIqCgPkYSQ
	HUuH15s
X-Google-Smtp-Source: AGHT+IGj40k0Zzp2Zts4gKKxfvVZo7SESC+oB/L/7btr7Jz+gFTswsnF97s93sXgwzMxhRFPeFiftbI656ORBiYokwI=
X-Received: by 2002:a05:6512:39d6:b0:57b:43e0:ab17 with SMTP id
 2adb3069b0e04-5805f834784mr14939e87.7.1758572258627; Mon, 22 Sep 2025
 13:17:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250912100015.1267643-1-gprocida@google.com> <aNF7bMbCLctgZQXq@willie-the-truck>
In-Reply-To: <aNF7bMbCLctgZQXq@willie-the-truck>
From: Giuliano Procida <gprocida@google.com>
Date: Mon, 22 Sep 2025 21:17:01 +0100
X-Gm-Features: AS18NWCRygDx1l5PpFOEIBdc9FaO-Su34gj887gjfAMUSPHftRgTWnJ_N8qLGLs
Message-ID: <CAGvU0H=Jup8bYYgZ1EbYHZMSnf_SkazXDfOm7h1QrcL-ZKw55A@mail.gmail.com>
Subject: Re: [PATCH] system certificates: specify byte alignment
To: Will Deacon <will@kernel.org>
Cc: dhowells@redhat.com, dwmw2@infradead.org, gregkh@linuxfoundation.org, 
	keyrings@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 22 Sept 2025 at 17:38, Will Deacon <will@kernel.org> wrote:
>
> On Fri, Sep 12, 2025 at 11:00:15AM +0100, Giuliano Procida wrote:
> > The .align macro is architecture dependent. On arm64 it behaves as
> > .p2align. The various alignments in this file are all bytes.
> >
> > So use the .balign macro to avoid unnecessary padding due to
> > over-alignment.
> >
> > Signed-off-by: Giuliano Procida <gprocida@google.com>
> > ---
> >  certs/system_certificates.S | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
>
> Does certs/revocation_certificates.S need fixing as well?

Yes. I will post a v2.

> Will

