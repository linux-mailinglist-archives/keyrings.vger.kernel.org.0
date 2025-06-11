Return-Path: <keyrings+bounces-2819-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C2177AD5D78
	for <lists+keyrings@lfdr.de>; Wed, 11 Jun 2025 19:51:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 13E8D1E1897
	for <lists+keyrings@lfdr.de>; Wed, 11 Jun 2025 17:51:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7976D1CBEAA;
	Wed, 11 Jun 2025 17:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="eeP5QqJ1"
X-Original-To: keyrings@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B12F1CF7AF
	for <keyrings@vger.kernel.org>; Wed, 11 Jun 2025 17:51:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749664268; cv=none; b=F4hbL9s6/YBy73i2kakttIAgI26q0Miv9AnNHRmotvx5xSfIRTMYZUQDxEG/+3qXn96QaWOFMJFlTM0eRV63f0gvSaLLHIz+LmLvrSirQJ2Wwc2VAEBAs4YKmrW85LPLM/hvQw5ikRX1Pd/+7QVweaG+2y51NjFkiKVAbEE0ZdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749664268; c=relaxed/simple;
	bh=eGNFqynuBIFAxQfgXXE+O2+YXzwRJnVxUyYET5WrhRM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tPPevGIhpwbVO/ev49hJ0JW9OEtb8Wq1ROHzpWXIzcUsI53qVcz5X4pwWenPdkoNNm3VqJ6C4k6NAgy0O15s8sUALXm9lXp+4Pc/AisBJPKQ2Um0Gc2of8OIIqk/ctlSRtPrmx4fxwiQqsbB70LCModZLdLcFsysCt9dXElSUyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=eeP5QqJ1; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-adb47e0644dso18158866b.0
        for <keyrings@vger.kernel.org>; Wed, 11 Jun 2025 10:51:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1749664264; x=1750269064; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=sNMRIvDjI5OxxkQoJ1BipcgVGMNLMdRP7oKxRHfqUb4=;
        b=eeP5QqJ1b6ERSQKr1GBNBQKslYpzvk9LwnkRhPaZ2m5glIcw0t4tByAVZqWGmTNz5U
         3fxh5rBma6XHiwkNFKO22zyl6S2YDaIdl6cF8pG8HRSa3jVE8y129w90mfIoBLTgOgQg
         n3yagfjaBDWlnqiDPpvR4LQi39Et18L9gGh9U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749664264; x=1750269064;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sNMRIvDjI5OxxkQoJ1BipcgVGMNLMdRP7oKxRHfqUb4=;
        b=mVrwPmqOwx2P94m5Z9oGBGagifgQJ5Yh3YTMFjp0P2U1d2jDuxpQYT9OOyp15fkvkx
         /C2XQlgCJq9MbhxMVltr9iGIVCwSCS22j8pi5HWGKn2/NAHRt3fmueIGb2BWlh/1F8+4
         HlVZTprVd/WWujo5oWMsth7fCET5vcJKmp1YOdoD6hK8njPOVBk5pgN/FXtwgZVIAUmC
         3kQhSuyxVYzYcPaKl67vPdCIHZRzJQmIidX2OGdcz6PnKwnf5zU62B8nDMIXllhxE+L2
         zj6xtV26/+jB9tt53+kifrchH93veScCrgk9n5hlIu4XmxBwz14inOBU5FIYNZSCltKn
         7GOw==
X-Forwarded-Encrypted: i=1; AJvYcCWJjkuT6WH0KZO2aPj176TdPEltLqcdBm3cxujc586yXncE53TEeaGYCb1B7HhVJ7bwhX4elO7TZA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwnInBN6/FsQgKWn+Ch5TYT1qHOrl+7aucVTUCSzgAXIImxCjwB
	iPBkw/GcmezivSGgEfx78Oenvurp7SFlAnsCpa/QMiApm2FkJxce9HliVIkXaO8K1XmtkY/bRmD
	Y+KdUJGg=
X-Gm-Gg: ASbGncuBSf9cjZZTX7ixVhAXJ6l4W1TRcFlwWNH4hsSeQHM7ivW9ep41KgBVugLfuLu
	kJ0Xb8VcSQwh9+ykOP2Z5IzGoSqXNRKGhRH5qrsx/Yz5rG5IAtZO1AU7jMvKShPjz7qfiQF67uT
	jiq619qL6ajsXZF2W9nKbjwWcIOaBJTJrN2KvcD67G5lTe/SglKSOyTricO9tXXMmW4HzDMcuiW
	PKXKMhbjEBNqtYd3XPdrvzyTpAWyWrwlUmD9dtzQAYBbbGbvnSjMQQ4S1jTd5VRQaKUKCv6PgMp
	Lbo5l41+1CXM1TZema+3Q4CpF7VSbmInVBkYmKoWIL6U9f40O5Q3H1gTF+YB75utdqFShcFIMVq
	CQ6dveY2SLtpYFsGAZmvcoziUUVcd/FPwcflDbvLnPoCX8k0=
X-Google-Smtp-Source: AGHT+IE16plx9Jy79sKpTZagqNoRRXVFSEg2kvDBH449bZdQaSjw/hwcGZhzQCa3Nt1s0t1wAqGdIg==
X-Received: by 2002:a17:907:805:b0:ade:44da:d2cf with SMTP id a640c23a62f3a-adea566604dmr37598766b.18.1749664264355;
        Wed, 11 Jun 2025 10:51:04 -0700 (PDT)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com. [209.85.208.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade1dc7b25dsm913797866b.156.2025.06.11.10.51.03
        for <keyrings@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Jun 2025 10:51:03 -0700 (PDT)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6084dfb4cd5so2080970a12.0
        for <keyrings@vger.kernel.org>; Wed, 11 Jun 2025 10:51:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWGE9a/poje1fyFtij8Xg9MH6RJpP+6zNnTIbG1lYrZfGaNR790QDTOM+squg6SluEtpwmOevT5OA==@vger.kernel.org
X-Received: by 2002:a05:6402:430a:b0:602:a0:1f2c with SMTP id
 4fb4d7f45d1cf-608666342e7mr349953a12.9.1749664263059; Wed, 11 Jun 2025
 10:51:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <301015.1748434697@warthog.procyon.org.uk> <CAHC9VhRn=EGu4+0fYup1bGdgkzWvZYpMPXKoARJf2N+4sy9g2w@mail.gmail.com>
In-Reply-To: <CAHC9VhRn=EGu4+0fYup1bGdgkzWvZYpMPXKoARJf2N+4sy9g2w@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 11 Jun 2025 10:50:46 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjY7b0gDcXiecsimfmOgs0q+aUp_ZxPHvMfdmAG_Ex_1Q@mail.gmail.com>
X-Gm-Features: AX0GCFvhYmOiGos_n7MIyKSpEE5Y2P1Gb8BenhLqBoBcFZYUdrTRYSzOg_XV1WU
Message-ID: <CAHk-=wjY7b0gDcXiecsimfmOgs0q+aUp_ZxPHvMfdmAG_Ex_1Q@mail.gmail.com>
Subject: Re: [PATCH] KEYS: Invert FINAL_PUT bit
To: Paul Moore <paul@paul-moore.com>
Cc: David Howells <dhowells@redhat.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	Jarkko Sakkinen <jarkko@kernel.org>, keyrings@vger.kernel.org, 
	linux-security-module@vger.kernel.org, linux-crypto@vger.kernel.org, 
	linux-integrity@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 10 Jun 2025 at 17:23, Paul Moore <paul@paul-moore.com> wrote:
>
> It doesn't look like this has made its way to Linus.

Bah. It "made it" in the sense that sure, it's in my inbox.

But particularly during the the early merge window I end up heavily
limiting my emails to pull requests. And then it ended up composted at
the bottom of my endless pile of emails.

I guess I can still take it if people just say "do it".

            Linus

