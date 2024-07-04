Return-Path: <keyrings+bounces-1698-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DB27927B95
	for <lists+keyrings@lfdr.de>; Thu,  4 Jul 2024 19:08:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 371A028454E
	for <lists+keyrings@lfdr.de>; Thu,  4 Jul 2024 17:08:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DFDE1B3721;
	Thu,  4 Jul 2024 17:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="SIg0F2GS"
X-Original-To: keyrings@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4966A1AEFF7
	for <keyrings@vger.kernel.org>; Thu,  4 Jul 2024 17:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720112897; cv=none; b=igKDexTWURXPdJRRl7IlRFw22THG3UbL3WXlZ1aw/ZIPOeBBLuDd8bQ68dyXNXs4jyiIjJmcjh5FIewDSSamfLSv3dMUCTVHFd7OLJzKKJyorxEeLjJdm7PobPtYNRYdBa3tnn/0+ppZVGgD6BjSNtHJPFlZDhS2zbG5ET3YN6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720112897; c=relaxed/simple;
	bh=QguQgLZBBttmrru34w9QMLWo5wJFt+WRZM0wpZpr6UY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A/z//t3S/Wyn2oTNhA8fg88xmCtb0YoxmR4/+qkaxuetSodIx93azTBEyKjtymCs87Vt5rFZOXNt7a1TKpZiOhDrEYvk2c+/LrcarMRjlI+aWg6RcCBcWf2iNXt6rF0vI/vEETF66jH0Z4PbLhSDxXur2fTpe8JRKgkE7Pf9lXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=SIg0F2GS; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-52e9380add2so1406050e87.3
        for <keyrings@vger.kernel.org>; Thu, 04 Jul 2024 10:08:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1720112892; x=1720717692; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UlrKQa45wt6qlKqqrZr7W5l7lANNYZzO1+mSmOq7i9c=;
        b=SIg0F2GS99ypMCxZRJR+2us+SihOXLnjqVXJxIxllEyFpT+j2l5ZyBYWAB0uzKk+zn
         MAZzpgJA9kC+hbEw8Oumhz5jyAl+JtkXCed7EOCJPwtuKkx6L7DOmi7vzg328glkrdNE
         HsQ4ub/Wcrg9ET00rN87k+zfldXia043j64kU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720112892; x=1720717692;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UlrKQa45wt6qlKqqrZr7W5l7lANNYZzO1+mSmOq7i9c=;
        b=GP/bcbRLpjS685V+AlNxW7oPglxdZecn7X5XmgGcJE+PyUgleudX2LA92KVDSuB41S
         7jIr6G23NkjNKUlUQXv5+8cqbPtx2HFGZrAUw7aM6Gyq/l75rxyIGQEiZMB6+tfNnv2E
         E+543WnhCxNJAMwFUDkBbyLIKu/MLxLB4DOKskzvjvtCVUNeD9Uv0kkPdJFy6df09n90
         9A5ltapRBgpnjjAIELX7DzKmt0eF1+9UWmdbonQVIYd9e8egwvLWTg+2YospiMdOqEEi
         eP4MQ37dPmEpHHNR9qR7rfRVPUy4+X6+E0cRtT5tpf23t5cTKu1S4PDoKdrW6lOFyqKS
         9nbw==
X-Forwarded-Encrypted: i=1; AJvYcCUDinUxczMa7mLRdmep6oZtNCygTQ+BPisGo+fCmpPQxDzf4s821hcKJ71leJlJZVQeXsADdzmBZkK5o63tJpgq4lqK9hZMQQs=
X-Gm-Message-State: AOJu0YxGAFTWmEdF32SSLkyyokt79jJn7GK9wHRuyeFxPeIVoFp2CD1m
	486ecPMbHlHItHNo1YgysUnKvrKSGPKgX1MW1Al5sEYY1yu5AEHuF9drRsqxmebqZtt1tV/pQdY
	AwONNlQ==
X-Google-Smtp-Source: AGHT+IHpVfVybZC4M+hfLxX2KlCPdDqLZoNIWZSYs2T4qfIdOwD48QBPwdJuwzaLC6GhjU+U1CCVxQ==
X-Received: by 2002:ac2:47fb:0:b0:52c:e080:6a07 with SMTP id 2adb3069b0e04-52ea0632f61mr2053393e87.39.1720112892394;
        Thu, 04 Jul 2024 10:08:12 -0700 (PDT)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com. [209.85.167.48])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52e9740367esm609507e87.158.2024.07.04.10.08.12
        for <keyrings@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jul 2024 10:08:12 -0700 (PDT)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-52e97e5a84bso1204073e87.2
        for <keyrings@vger.kernel.org>; Thu, 04 Jul 2024 10:08:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUu4z6B27hMOSZjpd6VvcQ9AEbbYIX6bv2P6NhcjcMFd3+WknSZdkaYTKbqdkWY7sPYCuhvVUkNHRdvqptFTHgt34HCTYv2DDI=
X-Received: by 2002:a05:6512:204:b0:52c:8075:4f3 with SMTP id
 2adb3069b0e04-52ea0632781mr2063767e87.36.1720112891664; Thu, 04 Jul 2024
 10:08:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240703182453.1580888-1-jarkko@kernel.org> <20240703182453.1580888-3-jarkko@kernel.org>
 <922603265d61011dbb23f18a04525ae973b83ffd.camel@HansenPartnership.com>
In-Reply-To: <922603265d61011dbb23f18a04525ae973b83ffd.camel@HansenPartnership.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 4 Jul 2024 10:07:54 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiM=Cyw-07EkbAH66pE50VzJiT3bVHv9CS=kYR6zz5mTQ@mail.gmail.com>
Message-ID: <CAHk-=wiM=Cyw-07EkbAH66pE50VzJiT3bVHv9CS=kYR6zz5mTQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] tpm: Address !chip->auth in tpm_buf_append_name()
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: Jarkko Sakkinen <jarkko@kernel.org>, linux-integrity@vger.kernel.org, 
	Thorsten Leemhuis <regressions@leemhuis.info>, stable@vger.kernel.org, 
	Stefan Berger <stefanb@linux.ibm.com>, Peter Huewe <peterhuewe@gmx.de>, 
	Jason Gunthorpe <jgg@ziepe.ca>, Mimi Zohar <zohar@linux.ibm.com>, David Howells <dhowells@redhat.com>, 
	Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, 
	"Serge E. Hallyn" <serge@hallyn.com>, Ard Biesheuvel <ardb@kernel.org>, 
	Mario Limonciello <mario.limonciello@amd.com>, linux-kernel@vger.kernel.org, 
	keyrings@vger.kernel.org, linux-security-module@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 3 Jul 2024 at 13:11, James Bottomley
<James.Bottomley@hansenpartnership.com> wrote:
>
> if (__and(IS_ENABLED(CONFIG_TCG_TPM2_HMAC), chip->auth))

Augh. Please don't do this.

That "__and()" thing may work, but it's entirely accidental that it does.

It's designed for config options _only_, and the fact that it then
happens to work for "first argument is config option, second argument
is C conditional".

The comment says that it's implementing "&&" using preprocessor
expansion only, but it's a *really* limited form of it. The arguments
are *not* arbitrary.

So no. Don't do this.

Just create a helper inline like

    static inline struct tpm2_auth *chip_auth(struct tpm_chip *chip)
    {
    #ifdef CONFIG_TCG_TPM2_HMAC
        return chip->auth;
    #else
        return NULL;
    #endif
    }

and if we really want to have some kind of automatic way of doing
this, we will *NOT* be using __and(), we'd do something like

        /* Return zero or 'value' depending on whether OPTION is
enabled or not */
        #define IF_ENABLED(option, value) __and(IS_ENABLED(option), value)

that actually would be documented and meaningful.

Not this internal random __and() implementation that is purely a
kconfig.h helper macro and SHOULD NOT be used anywhere else.

             Linus

