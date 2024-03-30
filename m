Return-Path: <keyrings+bounces-1022-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id ACBB7892DA2
	for <lists+keyrings@lfdr.de>; Sat, 30 Mar 2024 23:32:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AA4F3282DBD
	for <lists+keyrings@lfdr.de>; Sat, 30 Mar 2024 22:32:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3C59335BC;
	Sat, 30 Mar 2024 22:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="Ft0qMpZG"
X-Original-To: keyrings@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEB6D22092
	for <keyrings@vger.kernel.org>; Sat, 30 Mar 2024 22:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711837947; cv=none; b=qcurnOsck1hNZXtQtWnTNRxgjDBuQ6oygX/KVRUMW2C++47VJcIeUZqVrGjwHmg3JM/duD8JX00EpCPgE1MmIi4ewywbMios+3SeDiZRf+SFxuiGExb0qFs+AD+DqBXDaq0bKVze0u4x/CwVKm+NzvAIv6qWp7VtsUQASXoxhQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711837947; c=relaxed/simple;
	bh=U43Wuq55vMxCLBzqGRdkR/mMGx+zO2GmUgWVZu6Gawg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MC2kKYr7hZxlvL4KY6eIEyVXE7a7fBRrGhPrDC0/4KsNGWlhsMhIj4cXEGurZOT0YSKrAxzHJWIz9Vk7XbeQZguP+jmFM20dS23QbMdlZHlCeFtpqxpfuheSfe6YkBVGB1lsv0z3cmlb1gvf8abB75czUYTMAg6dXTIlGZM4UfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=Ft0qMpZG; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-515c3eeea5dso3295106e87.1
        for <keyrings@vger.kernel.org>; Sat, 30 Mar 2024 15:32:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1711837944; x=1712442744; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Qh7m7AzKE9zxgcmaZLpWEMMQFO2AQlI5WB3LlhW1I44=;
        b=Ft0qMpZGU9No1lDtNY6m+QEK9VUB3iCBlXDau5eoyGUjPfc6s69wYnViDKOvrtDhts
         4cteyZ0It7eEa6xzoND8JiNqN5EYI1zb+xyCXMFw7oyiXZJ0e159qI4flnyp2Dpvbz+y
         8Jle660pX/0lAxvng8Eu5kDc0+bfz5sKol1pg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711837944; x=1712442744;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qh7m7AzKE9zxgcmaZLpWEMMQFO2AQlI5WB3LlhW1I44=;
        b=CfgcwJqM5HT4yg6UMUNxEhGSRoOHbh77Zo/dU+By0PkgEhxmqQ2zO+O53xhQv8Hi6p
         WL3ZzNdLb2TqwAE8hMdsOTQ028NUb2cYQsFhgzNj+41xozARSbTKj1o7FieQr5i/eT5o
         vmwJLxCNKKdMfIMyuIBP7hlxP9BlDuO/1E+jWDnOqvO8LPN3/wGo/qbRortIwmOADSTI
         0bv/n1Y+2hDl6CIlFKRVu18GsSdcRKBqI5KWZrFjUpUArHjedvGHiy2u9f4RZv2au3ep
         W0/uoH0qHSjkK/CUsqIDh+O/+5sqCN7BVisWnEHFs+g/TnHljidmviSjWsS2Spky5lhg
         N7Ow==
X-Forwarded-Encrypted: i=1; AJvYcCWingowvZ4PVAy4cTLOoaesj+aBs6XmLuFWqEsPkmmiiNKe4k7VySxETUfYbUlqt47cVN+er1NkTCe/8f3ISDhfcw2h9RAsxPU=
X-Gm-Message-State: AOJu0YyvT51Bg2CanCXHKI7+yTYoyQNUlz5xVcrhh2R/bVfJqTJbPGpK
	Zm4NJo+Pa0cF+3qyiBQXP8Kr+x/1PRD6E9Bz9H7/K95hQ0udMqCJdqP0FnpszOYVrBsqDq3bW4+
	9xA4=
X-Google-Smtp-Source: AGHT+IHQwgg+Gc6ybUWDXgEez8g7KNpMTUIzD2C5lgGr7UbPoMyD8sWJ32b66EaAcczYymjg0zYQew==
X-Received: by 2002:ac2:5eca:0:b0:513:403c:d887 with SMTP id d10-20020ac25eca000000b00513403cd887mr3774760lfq.38.1711837943679;
        Sat, 30 Mar 2024 15:32:23 -0700 (PDT)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com. [209.85.208.169])
        by smtp.gmail.com with ESMTPSA id f15-20020ac24e4f000000b005159fb35a9fsm1003923lfr.38.2024.03.30.15.32.22
        for <keyrings@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 30 Mar 2024 15:32:22 -0700 (PDT)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2d4a8bddc21so39639721fa.0
        for <keyrings@vger.kernel.org>; Sat, 30 Mar 2024 15:32:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVrYjtNv1aprUccAxFd9efUlkcKQC5RA/ezJ9ay5ILDV+wpyJegdjDMlux7JUObTBl4AABUa7ei79NZ56lZZGQgyqsxYBxHOTo=
X-Received: by 2002:a19:5517:0:b0:515:90e5:4555 with SMTP id
 n23-20020a195517000000b0051590e54555mr3507469lfe.16.1711837942133; Sat, 30
 Mar 2024 15:32:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240326143838.15076-1-jarkko@kernel.org>
In-Reply-To: <20240326143838.15076-1-jarkko@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 30 Mar 2024 15:32:05 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgNpPQFJyLe5dwEVH66ubviuiwM1_tjbyzQv4BytPw7dQ@mail.gmail.com>
Message-ID: <CAHk-=wgNpPQFJyLe5dwEVH66ubviuiwM1_tjbyzQv4BytPw7dQ@mail.gmail.com>
Subject: Re: [GIT PULL] tpmdd changes for v6.9-rc2
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: Peter Huewe <peterhuewe@gmx.de>, Jason Gunthorpe <jgg@ziepe.ca>, David Howells <dhowells@redhat.com>, 
	linux-integrity@vger.kernel.org, linux-kernel@vger.kernel.org, 
	keyrings@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 26 Mar 2024 at 07:38, Jarkko Sakkinen <jarkko@kernel.org> wrote:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git tags/tpmdd-v6.9-rc2

So I haven't pulled this, because the subject line (and tag name)
talks about tpmdd, but this is clearly about key handling.

Also, the actual contents seem to be very much an "update", not fixes.
And it doesn't seem to be an actual improvement, in how it now does
things from interrupts. That seems to be going backward rather than
forward.

            Linus

