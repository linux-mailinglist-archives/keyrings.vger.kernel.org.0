Return-Path: <keyrings+bounces-1404-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 32D7E8CC93A
	for <lists+keyrings@lfdr.de>; Thu, 23 May 2024 00:53:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 63CCB1C21B98
	for <lists+keyrings@lfdr.de>; Wed, 22 May 2024 22:53:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22CE21494B6;
	Wed, 22 May 2024 22:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="cYGB4NaX"
X-Original-To: keyrings@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 368B4146A6A
	for <keyrings@vger.kernel.org>; Wed, 22 May 2024 22:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716418424; cv=none; b=PhW0FbKe6qS4YYUSs2pIktXLK3wFyOroRy5QA3DfjP9atHsjLawPNE8h/L0hXvNMcw5kEvBcG3ti13LQNv6VgBFbJ/vKiHGhu30gflQgm4ElgPAWncBbAxV7KP/mT3Bpup+wgh2tlhK8fWTbMxY0BVorftU6A5DJvOWyPmNXa2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716418424; c=relaxed/simple;
	bh=s+AFZiWYdfo9LHxXiFDhhaTaz5In1NnrT6e/kTcTOec=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A793TuUOnylTDdutjFmLJVf6sGxCnbhXZh/azWnfxcf+e+NJ81HWWBSBiTvOlzsnVY5Tg038kFyUmQjbeDmgevIdXDV3EVUGLp0ET7bSM16AK7h3qSCcOJ1U6+/tTUcyBReg+JPcqBygWB633g1ERH2eqsW5IXYV80D6/dL8gIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=cYGB4NaX; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a5a5c930cf6so1067335266b.0
        for <keyrings@vger.kernel.org>; Wed, 22 May 2024 15:53:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1716418420; x=1717023220; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5pQI3o2sJHQ9VDDihE2wM0f+XoWWITjrXXHCRcKXU50=;
        b=cYGB4NaXjHoGhca3ct5DdOYiHDbjeYgf/lCZgYEQVXHA4Fd/2rhq6+ihkXNLqF1Vol
         NC60TUEV3/o7Cx0ouNwYyRVjZrvx3ioRVS5Zyzyk5+8acNKiXgb9B6xUj6jbxZl37MsV
         BQv7jYJxwnztR/fVhohWau7RZvr9VvsMl8qlI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716418420; x=1717023220;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5pQI3o2sJHQ9VDDihE2wM0f+XoWWITjrXXHCRcKXU50=;
        b=ey6TPs62+DOYjL+W1A+u7S0TM675zGd+YcuPyr9/zjo1xNl57MnnYJAynMe7nGztBc
         3VS50qA1C9eTk0XxmpgTkCrhHN3MLRYHgu0EELDF7xjP/RQm5xKE5tyJM/PfqeNjcdlW
         GlnpdGBHcjTHygkPbXR95yf6/sXJSEXIfjrih7ELUOsBu/vNZicjH0x9ROOkEIkV19bi
         dam6M0eP5dGNjUvWS9+g7NIvto+HhOALK0sQsPpt0+LBCBDEmvWM3b4ATJD081fhXzZS
         rm/ZAb6nVKhdFNJDbuO0tMGURrygWdEgCeuUAvy31wtCpdkFctkT7pZM/0E/TUhzXkDL
         8xXA==
X-Forwarded-Encrypted: i=1; AJvYcCW5zYGk83lubtpvxOsDK2IphQg/LUQOwjhDxmRb9ikUcvNX8RwCq4FESWQl9l5i9IBMknno7AUqXnHkase1BVXRqTFVCkofIlg=
X-Gm-Message-State: AOJu0YyM4Df1X4dXKxQy/Gj8xWosftbi0wQEI7J4N+zu7GNXi7RsgoSr
	wpbeZ8w44Uz52iFMpSNzGn25tE3tuy4JoQmkF8/cVFON1s1+FoKTEFQL6S2bIXcZ17U0kt9t/sB
	gwoGi0Q==
X-Google-Smtp-Source: AGHT+IGWF1/FE7Q0hMoXofCyRgz74E3wt9duTxRW0qRNS6ZsR8Q33RUd4V0caorA9CHA7PdvTY2OEA==
X-Received: by 2002:a17:906:1ed0:b0:a5a:5634:a83a with SMTP id a640c23a62f3a-a62280815camr191082366b.17.1716418420402;
        Wed, 22 May 2024 15:53:40 -0700 (PDT)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com. [209.85.218.53])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5a17b01a2esm1834388166b.185.2024.05.22.15.53.39
        for <keyrings@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 May 2024 15:53:39 -0700 (PDT)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a5a5cb0e6b7so1081360966b.1
        for <keyrings@vger.kernel.org>; Wed, 22 May 2024 15:53:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVclhUoQ7z2aQmrNIW7WvLOv4ufY1A9sup8b2Hlge4VQNhpQprAXkoN4szTAQ8hy+EWZi2qRvmHlRHMGl482k07BCk7RHqoCK8=
X-Received: by 2002:a17:906:6945:b0:a5c:df23:c9c6 with SMTP id
 a640c23a62f3a-a62281673cemr222082266b.47.1716418419345; Wed, 22 May 2024
 15:53:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <0d260c2f7a9f67ec8bd2305919636678d06000d1.camel@HansenPartnership.com>
 <CAMj1kXFE_R_x10BVkU+8vrMz0RHiX0+rz-ZL+w08FH2CLQHZXA@mail.gmail.com>
 <66ec985f3ee229135bf748f1b0874d5367a74d7f.camel@HansenPartnership.com>
 <dfb0d930-7cbe-46c5-be19-d132b4906ecf@notapiano> <D1C2NPOBHAHK.20O4IME8OK1FH@kernel.org>
 <20240518043115.GA53815@sol.localdomain> <ZkhS1zrobNwAuANI@gondor.apana.org.au>
 <00bcfa65-384d-46ae-ab8b-30f12487928b@notapiano> <ZkwMnrTR_CbXcjWe@gondor.apana.org.au>
 <07512097-8198-4a84-b166-ef9809c2913b@notapiano> <Zk2Eso--FVsZ5AF3@gondor.apana.org.au>
In-Reply-To: <Zk2Eso--FVsZ5AF3@gondor.apana.org.au>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 22 May 2024 15:53:23 -0700
X-Gmail-Original-Message-ID: <CAHk-=wi7vwgzD4hdBzMrt1u3L2JyoctB91B7NLq-kVHrYXoTGA@mail.gmail.com>
Message-ID: <CAHk-=wi7vwgzD4hdBzMrt1u3L2JyoctB91B7NLq-kVHrYXoTGA@mail.gmail.com>
Subject: Re: [v3 PATCH] hwrng: core - Remove add_early_randomness
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>, 
	Eric Biggers <ebiggers@kernel.org>, Jarkko Sakkinen <jarkko@kernel.org>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, Ard Biesheuvel <ardb@kernel.org>, 
	Linux Crypto Mailing List <linux-crypto@vger.kernel.org>, linux-integrity@vger.kernel.org, 
	keyrings@vger.kernel.org, regressions@lists.linux.dev, kernel@collabora.com, 
	Tejun Heo <tj@kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Kees Cook <keescook@chromium.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 21 May 2024 at 22:38, Herbert Xu <herbert@gondor.apana.org.au> wrote:
>
> In this particular configuration, the deadlock doesn't exist because
> the warning triggered at a point before modules were even available.
> However, the deadlock can be real because any module loaded would
> invoke async_synchronize_full.

I think this crapectomy is good regardless of any deadlock - the
"register this driver" should not just blindly call back into the
driver.

That said, looking at the code in question, there are other oddities
going on. Even the "we found a favorite new rng" case looks rather
strange. The thread we use - nice and asynchronous - seems to sleep
only if the randomness source is emptied.

What if you have a really good source of hw randomness? That looks
like a busy loop to me, but hopefully I'm missing something obvious.

So I think this hw_random code has other serious issues, and I get the
feeling there might be more code that needs looking at..

              Linus

