Return-Path: <keyrings+bounces-2821-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A140AD5EAD
	for <lists+keyrings@lfdr.de>; Wed, 11 Jun 2025 20:59:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0B871164E53
	for <lists+keyrings@lfdr.de>; Wed, 11 Jun 2025 18:59:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E805827CCF8;
	Wed, 11 Jun 2025 18:59:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="E9Ydht1s"
X-Original-To: keyrings@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9748B2750ED
	for <keyrings@vger.kernel.org>; Wed, 11 Jun 2025 18:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749668381; cv=none; b=twlV3cqIPGxpOXCBgbXFlucrdbKJngURAdDmfKtvjg4Vj3p8wBY4fKnRBGQcmE9kvW1GfE9957GhGQAuvTcmwuZJtFsohe5AiCueiCLndo1GtYcUJCKG45J/Lpo7moB91VFNRWoDlG3JWcwhVlQ/LQ3hV8kGU33lQXUH+zudAa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749668381; c=relaxed/simple;
	bh=novuMTuhYNzqynSwAmnzr3dM+uqQhwQCtXMewPa/Wkg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JkJ3j8W8WQ/rHkATiLvdCI00E1139sV2K7mvyFM2QFNKBIdTw68DYfJJ+8apECviltYAC1cQJ1NShz8TfauMffOEyrG7Hty/j54rDVPEK73eoBTY28ytD4jRRsB2npbMF+JZUXbzANhRtQZnNVyVWrQJGVICC60LYaRdeGnPWI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=E9Ydht1s; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-60768f080d8so487748a12.1
        for <keyrings@vger.kernel.org>; Wed, 11 Jun 2025 11:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1749668377; x=1750273177; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=p4nKI6dictu7VKkBmue+gE/ANqM7N/0dOk6jpGABvHA=;
        b=E9Ydht1sw91RtTi77mWmR5VGvywqjrductLOx6+fyV51Mtnv20M9JTrWOIxWC98CmX
         b+eKkcHwx3ENwgNhMu/MmFN3U9MWsEzCMGD/UXqFuVwIkONDr5af7eErI4fYTrVXsiHn
         A5em+R6fHQb97i55ZdxEJwulmxe149OMRR/UQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749668377; x=1750273177;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p4nKI6dictu7VKkBmue+gE/ANqM7N/0dOk6jpGABvHA=;
        b=d43kJlypbjt0pQY6scqz0S+ovF1e2Y5MU35hioS7WW9p+uyWBRp6rJggN0WI3g9ajZ
         qgMo3WMXcnhp1D9bEZFsc6oPPyFlyttBogEFl7phnwq54gwxp8vGJBBekQWAPYjG9Vtr
         REBYlBZKYEbS/rpCaqH3Z3SOGpe3yEQ2/vaxp28q324iv4DeUwOiVHsx5InnNJvYq2g1
         cJmrTvE9PxXI8U+9bmvjnAIZyJefIkLzgH5AM16v7cyUje73yV9CpPwGTl8MlwJxMzrm
         88FTK7T5W7u53HkbZM22NuDvTwxSLfFvwYbQvSI77No4q8fc3E2IBqrfjVvU6NxD1yyp
         FA1g==
X-Forwarded-Encrypted: i=1; AJvYcCXr3gYp5zb5+lD+U6uUY+taTT/at9dci40vO9qaXvEgAcYcy/WDNlgtChZyZCxLcnMy4GQA5/knmA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwgcTyCAnQaXihS/Yk7RtHzzbIiVBEPeOcP1stL0E5aeUcq3GEj
	YIQ+tmU3B6aewRsdN1cDAgpIeC3kDPhr4Q4PpMotIQC9nzc+7mQV9g+IBGIQIrmczqceTmBYDS0
	8Yem26fs=
X-Gm-Gg: ASbGncvyMBI3Rb47XiqjsvY3wEGdRqV9UnuuLPaJ2ENGS40OHYfJJlxXUZlh6iaG3sy
	OlTDTfmd1C+jdv6uppLWWT1ZaltqYj97dzoXpJip6+FfI9MjO7AwfWWWqGOmrvmTLX/cCforeUg
	mqOl6bDjwMvsAgS/5V+HwiWZVz+61fRbU2Sti38PJbaCmGUF/cHWkA9YsM1XbAs2A0XLB2HfXVJ
	5OReo8eWNURirtK/8lLEf8QaUHWKRLz2NxG03yHMoqtnxydYyJAoUfnxFVV35uAKE//r8MCkRhj
	l0sm+6P0xZ9InyOpJFFhFhIDQr8r8rdLW+TjJrFgouPUE4UqSOu7uvGGoysNP+QWsoGeN+YqvRe
	Y+unr2mmgkKAuCAOwAYKqJSenKY0Ad4HEX12T
X-Google-Smtp-Source: AGHT+IFWwVZ7yR0AhwLog6oDWXpiHzw091sVWtCWS0Yn0b0QMMdu6g0IFKalXmsVLO5X9LHqncPASA==
X-Received: by 2002:a17:907:3e9b:b0:ad2:2a2f:7064 with SMTP id a640c23a62f3a-adea2ece74emr68877966b.25.1749668377607;
        Wed, 11 Jun 2025 11:59:37 -0700 (PDT)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com. [209.85.208.47])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade1d754610sm929864166b.1.2025.06.11.11.59.36
        for <keyrings@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Jun 2025 11:59:37 -0700 (PDT)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-60768f080d8so487713a12.1
        for <keyrings@vger.kernel.org>; Wed, 11 Jun 2025 11:59:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXr4iKc0kQfilg8r8ZJvrPY9L1OX5u+8VoY5FZ14a0fIBbC6dB7eWFXjoCLZHz7WquZcGGrKsWcAw==@vger.kernel.org
X-Received: by 2002:a05:6402:2344:b0:607:77ec:fa8c with SMTP id
 4fb4d7f45d1cf-6086382094emr984600a12.1.1749668376614; Wed, 11 Jun 2025
 11:59:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <301015.1748434697@warthog.procyon.org.uk> <CAHC9VhRn=EGu4+0fYup1bGdgkzWvZYpMPXKoARJf2N+4sy9g2w@mail.gmail.com>
 <CAHk-=wjY7b0gDcXiecsimfmOgs0q+aUp_ZxPHvMfdmAG_Ex_1Q@mail.gmail.com> <382106.1749667515@warthog.procyon.org.uk>
In-Reply-To: <382106.1749667515@warthog.procyon.org.uk>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 11 Jun 2025 11:59:19 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgBt2=pnDVvH9qnKjxBgm87Q_th4SLzkv9YkcRAp7Bj2A@mail.gmail.com>
X-Gm-Features: AX0GCFtsLno8Yfd-XNr8pAuQD_5-TGkXF-CBKKMqVdzdI6GXK5Wl1KZHm9JyRfA
Message-ID: <CAHk-=wgBt2=pnDVvH9qnKjxBgm87Q_th4SLzkv9YkcRAp7Bj2A@mail.gmail.com>
Subject: Re: [PATCH] KEYS: Invert FINAL_PUT bit
To: David Howells <dhowells@redhat.com>
Cc: Paul Moore <paul@paul-moore.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	Jarkko Sakkinen <jarkko@kernel.org>, keyrings@vger.kernel.org, 
	linux-security-module@vger.kernel.org, linux-crypto@vger.kernel.org, 
	linux-integrity@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 11 Jun 2025 at 11:45, David Howells <dhowells@redhat.com> wrote:
>
> Do you want a signed tag and git pull for it?

Particularly during the merge window that makes sense just to make it
trigger my usual "git pull" pattern, but now that I'm more aware of it
I can just take the patch directly.

Anyway - done just to get this behind us. But for next time, just do
it as a signed tag pull request, _particularly_ during the merge
window when most other emails get much lower priority.

             Linus

