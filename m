Return-Path: <keyrings+bounces-2833-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FE38AD91B9
	for <lists+keyrings@lfdr.de>; Fri, 13 Jun 2025 17:43:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0FB6F7A3B9C
	for <lists+keyrings@lfdr.de>; Fri, 13 Jun 2025 15:42:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDF892E11D7;
	Fri, 13 Jun 2025 15:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="V4aBVBCK"
X-Original-To: keyrings@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC9C81F0E24
	for <keyrings@vger.kernel.org>; Fri, 13 Jun 2025 15:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749829405; cv=none; b=AEXDbQiOjQB7+m2EE2vbxNugufivvqqahGonpbQo9LF9UIZsISDcV7OSNwZA1VIYXCFzjogwqH57I5BmdWwAPYsHEOz9Df2wvdRyQefGi+KbCHRadFbLnYXabhtZks335zv6CbAjscZ9W94exRyyZCTSZHtDrc5iPIKiEc/Jv8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749829405; c=relaxed/simple;
	bh=ErljPl4av/QaQOhDCXeS4el6raSxykJe0R1j3QAerS0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eBtIYvHetJ4+W2/EFNIefOZkLiXBuXDTSTZZy1ZD+X5zWCIjUK+Gh6xL2JwK+F64z+ObgONJCB4i/tAmS9UFMnFHzbVW+NPfRBI/QXDKLIGKWZxApU0Jpupy+RAxoH3iYJrvOaNdwOVAxmQnLNd+GRsCX8GHPPadmlJiKuv7K+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=V4aBVBCK; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-60700a745e5so5145970a12.3
        for <keyrings@vger.kernel.org>; Fri, 13 Jun 2025 08:43:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1749829402; x=1750434202; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FcZeGwCm22Kaq6Zayr5a6cqDxVP6CQrhoWJiO/5RmRE=;
        b=V4aBVBCKgcFz5PpDzpbTCY73ocfms0i8kisAnkkvJZrqqZ7o9Y4/+NAo9aTstVWA8X
         2r/jpYJUfzPOnrPKA1vL4DFVYOOxUTMWcI6kp5XBYWdXXz0DrsQbcJq5VFEg/Oejthdc
         c4B14iV5JgVp8dOc3gVMWdtX7D0p44krAmLfU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749829402; x=1750434202;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FcZeGwCm22Kaq6Zayr5a6cqDxVP6CQrhoWJiO/5RmRE=;
        b=RtaMkS0DP4TGV/MHRR8+WAvicCjm+HMNnd0dw0tEjwaILz/QnSc7gs1uY+052+drmm
         jsJEYSBGBL9Ipr1TYFBi6iAEo3esGsQQQlhYesmI+FFZxPy+vmz6zO5ls0kf+X3VFqn3
         Olie0Ar01Ca0VwC2bpmbiFcecltHzjQvADGXKlFOW2vCS7OhAONTK5V7B0V7jddd1Qti
         qjumQ50tGx3W+t9KJukvdDAOMn793xmfwwih4nMXnnT8d4tbAK+JXtZILy5/4tOk2qJ0
         1paReJDFJjGbjyrP7riucLVtKpl7yWuZGEV8A47TccO+mHFDrTxnKsYMPtVxZuMX1+qL
         sQLQ==
X-Forwarded-Encrypted: i=1; AJvYcCWrOtBbHPY0tCT0TFSERLJuOGGURIkOcjvi9c/K5RF/fgIZFPH+j3Mf7LGfe5v+WRyP2/TKkmiapQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzD5fMD8/s814HWx8B+6U4zhhsPy+OSCtKSZalzi9/XDagkQYI7
	BmqlQV7IpxTBtspSxtBXBKjlIRHZlHkTShjWDMd16joBRTFK3M6RdiVrP6ntegh9dmKweYsq1fg
	WmItU5rc=
X-Gm-Gg: ASbGncvMSp+FvtCKbEjngKC5HQBECXUQOgzzB+hSPag1m4/8BGZjFYwJAPyc031DKqJ
	H0yFglmoIxr01Ss+fJl8vPO4pymqNXPM4J46bCaie5rJ2WJA+APTJ/x9jRxBPz386KSj2ytxmyR
	VRSPz11WnDIQ002UPTECecd987Mjepr9qxxZ8mW3rf8AvisplFu0IfA4ZinETR0p7GbavxwsHau
	5huYyvYo9sksxV2A0ucbzCtAOIpHpwYXEbyXDdEYhF1vteGKvYnM8fGZnOKkyvC/4qZpnOaSSXX
	Y9lDNfPy1tc/SZ4wGqYsCFwlLyQ43NRaI7dSG3od1dPKfsa1Qd3/ogXWKb/sldv8B7Ioc4W2uSL
	aPvkrcbajBWT8lv2sRjB6b4uj5DGZRhdffIVn
X-Google-Smtp-Source: AGHT+IEAagBpjzlvjJ4A0klDbkTJ6C4dFpK8NyR6pZM2H8P2vsYWrrFlVshNFFKWaLuEZ5vyYOp6zg==
X-Received: by 2002:a17:907:7209:b0:ade:9b52:4cc2 with SMTP id a640c23a62f3a-adec5cb7177mr335147666b.59.1749829401832;
        Fri, 13 Jun 2025 08:43:21 -0700 (PDT)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com. [209.85.208.49])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adec89292d9sm144337266b.116.2025.06.13.08.43.20
        for <keyrings@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jun 2025 08:43:20 -0700 (PDT)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-606ddbda275so4509518a12.1
        for <keyrings@vger.kernel.org>; Fri, 13 Jun 2025 08:43:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXm6lce0aUTWUji30r7cpyoUeCl8wE/t59YUhkPgfkcPdalLJmzRFe4BWCWbGJUaXVfE/0iBfugMA==@vger.kernel.org
X-Received: by 2002:a05:6402:26c7:b0:607:eb04:72f0 with SMTP id
 4fb4d7f45d1cf-608b4910f1emr3292023a12.4.1749829399723; Fri, 13 Jun 2025
 08:43:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <501216.1749826470@warthog.procyon.org.uk>
In-Reply-To: <501216.1749826470@warthog.procyon.org.uk>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 13 Jun 2025 08:43:02 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgYdf08uju5UrDZ9kEgsC9yrtBNOTzSX6zAbOdRfg+JkA@mail.gmail.com>
X-Gm-Features: AX0GCFtHIfBeIIpdLiCaIbjGHR268VNaR19hWtgTk1l0lqwTG5TIoyTmne_dSmw
Message-ID: <CAHk-=wgYdf08uju5UrDZ9kEgsC9yrtBNOTzSX6zAbOdRfg+JkA@mail.gmail.com>
Subject: Re: Module signing and post-quantum crypto public key algorithms
To: David Howells <dhowells@redhat.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>, Stephan Mueller <smueller@chronox.de>, 
	Simo Sorce <simo@redhat.com>, Paul Moore <paul@paul-moore.com>, Lukas Wunner <lukas@wunner.de>, 
	Ignat Korchagin <ignat@cloudflare.com>, Clemens Lang <cllang@redhat.com>, 
	David Bohannon <dbohanno@redhat.com>, Roberto Sassu <roberto.sassu@huawei.com>, keyrings@vger.kernel.org, 
	linux-crypto@vger.kernel.org, linux-security-module@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 13 Jun 2025 at 07:54, David Howells <dhowells@redhat.com> wrote:
>
> So we need to do something about the impending quantum-related obsolescence [..]

I'd suggest you worry more about the rumors that Kazakhstan is growing
a veritable army of gerbils, and giving them all ABACUSES!

What's your plan for that imminent attack vector? Because they could
be here any day.

Yes, yes, please stop using RSA and relying over-much on big prime
numbers. But let's not throw the "Post Quantum" word around as if it
was reality.

The reality of kernel security remains actual bugs - both in hardware
and in software - not some buzzword.

             Linus

