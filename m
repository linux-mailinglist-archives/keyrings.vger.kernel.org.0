Return-Path: <keyrings+bounces-2061-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D8DB09795CA
	for <lists+keyrings@lfdr.de>; Sun, 15 Sep 2024 10:40:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3B473283CD8
	for <lists+keyrings@lfdr.de>; Sun, 15 Sep 2024 08:40:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79AED197A81;
	Sun, 15 Sep 2024 08:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="F6yRrWLa"
X-Original-To: keyrings@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61785364A9
	for <keyrings@vger.kernel.org>; Sun, 15 Sep 2024 08:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726389638; cv=none; b=nVU8HpzjJkzb8LdSAuCKqGC/UxW/JrdvKKfWYZxsAIoLoC1RJ5fVR/jgxxWhe+rvgH9ym25h58xTeMRieE/30zIA6qzmP6KLz8k+N9eO5Q/JJB6luRctE1QZtLxmx3zVgWGBH2ZNZC6UqgIjm59hfIWF1wfNA3V/6FoBbYztrfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726389638; c=relaxed/simple;
	bh=7W4dXzHo6ZsXChruk3vokDJnvUK3D1xdySswkG1oy0o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TUL3hc3WJsW5fiFCG9Uog93uQY/dLYBSTtL0oxM8lqf5xqabTu4ov0TnhZ0rxnf41zZcrKgOJhA4hkQiGMTH9dpb5KQlY8KDfvOetkntbkcmmNvCCe1AURRvXAoq41dK0v8jmIu9c5quWo3VKsREwWYKaD3QKieR3umTu8shguQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=F6yRrWLa; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a8d0d0aea3cso461745466b.3
        for <keyrings@vger.kernel.org>; Sun, 15 Sep 2024 01:40:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1726389634; x=1726994434; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IDDAsPUl2QeVKALO8ENGYLR9AUDsg9hKmMIPotwlIM8=;
        b=F6yRrWLam+fKgeR8gbnXbOQcBeZmm7nZWbGY1/8XCIL1LcDP7Ym11iXQHIGZ5jG+Mz
         Nd9Q0eR3d8VAXQKbGVZee7rzvRgnW402q591O3vhT06YLYc5z7zfG0e498R0eMC71Ys7
         Yh4bchsDMMZJfK4FC/QsY54d2QeUBSu5JZ1SQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726389634; x=1726994434;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IDDAsPUl2QeVKALO8ENGYLR9AUDsg9hKmMIPotwlIM8=;
        b=Ik9+uzuJvgQruL4fd+Yb77wfxTdyDDN5ppskQeK5990OHqLBabpwTiwieLbP/Yy2i0
         vr7PEpymOg47Z3o62fCWbzHBkIasOJP9AeTdl308YnLdpoooNN73hHuapDViz9k8CawW
         4n/AcafqEo25bmagahz7db6fJopguv4XiucDJXVnlENC3yAQ+MkrMpLuCEQENTfBrxBG
         n8PldLpNgtFa6eXIbcaTZOxthFaoZ+6norhcUncWzRoK62g7S34doYcw1EeZ0nctiVtG
         BfCTdmq1HcRiZZa2rQP4az8P1WwXcDympWHXavuW987Ewuj+QXI6nsc/KiW6by7RZhvW
         yJNg==
X-Forwarded-Encrypted: i=1; AJvYcCWo1WgNG1K9DTL1OZTxX4Qw37ExkgMIelNWfMFwMCKNi/q1dvjxPuMKhZIJxvTHa01EI3s6FtmLOQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzV+KcgQPH5NXBHWni2L4W2qIqIFMyeCpRlgeFU37N4TIgALmyQ
	fkZMItesyxykttZs/Ux47yPbCledxxcQhKaN1Be1m+DjrDWY9UePVIKQlDi5033ljfJF5t4BaZK
	1uFytoA==
X-Google-Smtp-Source: AGHT+IHijiYJcXyysUkTkER4dsx1feD7soDORMxdX6t4NRL/w48fsx1awtJBHRRhoy/GgrnfoqxR2A==
X-Received: by 2002:a17:907:9411:b0:a7a:9a78:4b5a with SMTP id a640c23a62f3a-a9029617504mr1346887266b.52.1726389633929;
        Sun, 15 Sep 2024 01:40:33 -0700 (PDT)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com. [209.85.208.45])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c42bc88fedsm1467323a12.92.2024.09.15.01.40.32
        for <keyrings@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Sep 2024 01:40:33 -0700 (PDT)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5c413cf5de5so4671539a12.0
        for <keyrings@vger.kernel.org>; Sun, 15 Sep 2024 01:40:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXOu/LcsTHxglWJTUfEUAc4Ufe8oiDo5V+Wt8WymQgs6S2cPBtYzeajFYEnbXzUaS4FXNUnEz/g3w==@vger.kernel.org
X-Received: by 2002:a50:9b57:0:b0:5c2:58f7:fe95 with SMTP id
 4fb4d7f45d1cf-5c413e5164emr9626495a12.31.1726389632541; Sun, 15 Sep 2024
 01:40:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ZuPDZL_EIoS60L1a@gondor.apana.org.au> <b4a3e55650a9e9f2302cf093e5cc8e739b4ac98f.camel@huaweicloud.com>
 <CAHk-=wiU24MGO7LZ1ZZYpQJr1+CSFG9VnB0Nyy4xZSSc_Zu0rg@mail.gmail.com> <ZuaVzQqkwwjbUHSh@gondor.apana.org.au>
In-Reply-To: <ZuaVzQqkwwjbUHSh@gondor.apana.org.au>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 15 Sep 2024 10:40:15 +0200
X-Gmail-Original-Message-ID: <CAHk-=wgnG+C3fVB+dwZYi_ZEErnd_jFbrkN+xc__om3d=7optQ@mail.gmail.com>
Message-ID: <CAHk-=wgnG+C3fVB+dwZYi_ZEErnd_jFbrkN+xc__om3d=7optQ@mail.gmail.com>
Subject: Re: [PATCH v3 00/14] KEYS: Add support for PGP keys and signatures
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Roberto Sassu <roberto.sassu@huaweicloud.com>, dhowells@redhat.com, dwmw2@infradead.org, 
	davem@davemloft.net, linux-kernel@vger.kernel.org, keyrings@vger.kernel.org, 
	linux-crypto@vger.kernel.org, zohar@linux.ibm.com, 
	linux-integrity@vger.kernel.org, roberto.sassu@huawei.com, 
	linux-security-module@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Sun, 15 Sept 2024 at 10:08, Herbert Xu <herbert@gondor.apana.org.au> wrote:
>
> If the aformentioned EFI use-case is bogus, then distro package
> verification is going to be the only application for PGP keys in
> the kernel.

So I haven't actually seen _that_ series, but as mentioned it does
smell pretty conceptually broken to me.

But hey, code talks, bullshit walks. People can most certainly try to
convince me.

                   Linus

