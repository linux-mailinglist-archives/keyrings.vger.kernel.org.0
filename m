Return-Path: <keyrings+bounces-2490-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A76A1A697D8
	for <lists+keyrings@lfdr.de>; Wed, 19 Mar 2025 19:17:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A4E488A62D4
	for <lists+keyrings@lfdr.de>; Wed, 19 Mar 2025 18:14:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C85AF20FA97;
	Wed, 19 Mar 2025 18:12:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="SO+my/8i"
X-Original-To: keyrings@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3C9B20A5DE
	for <keyrings@vger.kernel.org>; Wed, 19 Mar 2025 18:12:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742407938; cv=none; b=or0u7PFS8Dh7wU5OV61cg6+wa/LjE8ujAU5l5beNrKJiWO0UbzffhiF9Y4r50d+t4io/VJ2nS7KG7z0C0/qbstx8x9EK+AT0BGSVeMRZOIz7yYVgWWD4InL7VywhiSxMzQGPCIrtmCc6pzFsEmUgUUlcW+pcTrQfwcP/T9PkAWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742407938; c=relaxed/simple;
	bh=fFeqEDSx+gFrh11ijFVYJhwWlYSMde/JsajtuuK8bvA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aY2HLvyCSf3NmmjyupnxuP11rTxMJlRqWCTa/rn4l+PoLw3Ag5Wp1Z1Vh+l5+90yWrgJ7YWEwgsNm0ZRgGX3+Xarr//cLSmKcx2p1T9Hn/UzCa58yYIhvYA4bFvnQP1NepohYYaP0Gk7GCgp390fSdqEBzrquHSHQWPB1BjVLRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=SO+my/8i; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ac2a81e41e3so177420766b.1
        for <keyrings@vger.kernel.org>; Wed, 19 Mar 2025 11:12:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1742407935; x=1743012735; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PtsDpMKG3PVh8c/2wdkRvEAKIrMwiuW7c09tD+wzsRQ=;
        b=SO+my/8iQC8Sry5gW8ScLtTJKz1xPXEWyhJqAmZk6pqTd7ZwdCTM1TQFPBDiePS1d+
         T2u39Hctl8SR4BwtPK1xiHhBW8z3V4hBhIxnOdJ3qzOGK1nSPhn5TIYUixr6dvEsh2bx
         WQPpNR+W3NXEtmu93UpOmsRDn0+jGh5+nwijw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742407935; x=1743012735;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PtsDpMKG3PVh8c/2wdkRvEAKIrMwiuW7c09tD+wzsRQ=;
        b=TBU+wQ1h1CO9bmepp8oMOXKlvGBCNxO1DT6rsVo5QtGGQgeEJLQptmcAa17YVKsY0N
         xtDdb4Iy6EQ4lZE+hj4OPHcggDbkNeQ7wlppWL8XTXQPUXa9OVTVazXuG8aE22IFPK5Q
         yXx4BrZBZD0Lsst00KmnI6539DZSMLAR/HAW0m13edkWE/TypI+L9hH4iNFXiHKsKucf
         g1GBSqXg4r3Uq4o/kizY8NOqoBOTXQrhSAh7WC45H6j5sN6iTFM/GmOBTWNcVO1t+xiU
         cWzSQ3Kjj7S1qZ0Q5Supj6jUDvY5BiCI60brcz2dw1jo30Q4rl4Gwp7aHmfL7j4mY49R
         noGQ==
X-Forwarded-Encrypted: i=1; AJvYcCWneuwRURnt0e3hX7SYWhDDgWfLxSBtkRzDTlIrXNJUuDbajdGQAuW9xutGSjW1b2XHnU0i+/FYNg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwcJhM1q/B0slb4yxjMuSm+bJ3VVvDMOtXUSxZqsbNjBa3gW/CM
	E3aYb2jnDbIxSlRpbasQI3g65SNJbcxJs4/Q5QKGWZ4Hs+s5qknkUJESia8TJY7qO8a9qNX2zYs
	AlbE=
X-Gm-Gg: ASbGnct+cgYvadkhmErVZTfpQ+4Ti/1oGJ63fpMI58XKajV80VdAvuSV+de2Pfb2t7e
	BVZgFg+pmQLWrXmGoR2YSG3kaajg2Gdy1cO+MWnnLgCx0IawaZ0qk8dK6ixGXJpmHabpVi9RH5d
	VV/GK9WaLedwsI/iGnwGve9inE9iW2O6JW68YUQtLbpsbDj2Mo/rHwAy0oSuFCESbcpOZpEpKF1
	JhZvZPLrFPktJ9yYoPIxHhpYDvwY4MeDYKK5MHbNwZC2azFzCLb7N05y//VqiaQeBfLkDlXDkuv
	W3w62bakN2Rd+ib2FxhJm3tQyW+uggc9kKxWjiZgHnFMfvw239b+Yd5CppzeziAseVSR0qdicaY
	WKrZYYN07na+mo1eeqQ==
X-Google-Smtp-Source: AGHT+IHSBc58z2vk4vxKiEw2B8qPTv9etpx/HviiziNbKlvfu/kUoCGv3f1byQGXQeG7gbHP2NWO3Q==
X-Received: by 2002:a17:907:d93:b0:ac3:4489:790f with SMTP id a640c23a62f3a-ac3b7dd3027mr368277966b.24.1742407934831;
        Wed, 19 Mar 2025 11:12:14 -0700 (PDT)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com. [209.85.218.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3149d0bc1sm1060766466b.105.2025.03.19.11.12.13
        for <keyrings@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Mar 2025 11:12:13 -0700 (PDT)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-abec8b750ebso1263669066b.0
        for <keyrings@vger.kernel.org>; Wed, 19 Mar 2025 11:12:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUfrwaoeCdogpX4Cw4X32akkfq3ySMrwgqZ9FwT2WSjqLPsAenXo22A8G1/YvWU5UKaYWuw5xM6nw==@vger.kernel.org
X-Received: by 2002:a17:907:ec0d:b0:ac3:bd68:24e4 with SMTP id
 a640c23a62f3a-ac3bd6830damr446966766b.53.1742407933026; Wed, 19 Mar 2025
 11:12:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <2874581.1742399866@warthog.procyon.org.uk> <20250319163038.GD26879@redhat.com>
In-Reply-To: <20250319163038.GD26879@redhat.com>
From: Linus Torvalds <torvalds@linuxfoundation.org>
Date: Wed, 19 Mar 2025 11:11:56 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgqidLD38wYUw-5Y6ztFdAvkX3P+Gv2=K+rpkFBG-bf7g@mail.gmail.com>
X-Gm-Features: AQ5f1JrIwulbm3bCXYePiRgtmwvEUEXDiL2TRjJKyWZ4_ecrDX73K-AxzmDTtIE
Message-ID: <CAHk-=wgqidLD38wYUw-5Y6ztFdAvkX3P+Gv2=K+rpkFBG-bf7g@mail.gmail.com>
Subject: Re: [PATCH v2] keys: Fix UAF in key_put()
To: Oleg Nesterov <oleg@redhat.com>
Cc: David Howells <dhowells@redhat.com>, Jarkko Sakkinen <jarkko@kernel.org>, Kees Cook <kees@kernel.org>, 
	Greg KH <gregkh@linuxfoundation.org>, Josh Drake <josh@delphoslabs.com>, 
	Suraj Sonawane <surajsonawane0215@gmail.com>, keyrings@vger.kernel.org, 
	linux-security-module@vger.kernel.org, security@kernel.org, 
	stable@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 19 Mar 2025 at 09:31, Oleg Nesterov <oleg@redhat.com> wrote:
>
> Can't resist, smp_mb__before_atomic() should equally work,
> but this doesn't really matter, please forget.

We really should have "test_bit_acquire()" and "set_bit_release()".

Well, we do have the test_bit_acquire().

We just don't have the set_bit side, because we only have the bit
clearing version (and it's called "clear_bit_unlock()" for historical
reasons).

Annoying.

             Linus

