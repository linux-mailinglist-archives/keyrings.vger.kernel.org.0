Return-Path: <keyrings+bounces-3783-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CF199D31BB1
	for <lists+keyrings@lfdr.de>; Fri, 16 Jan 2026 14:21:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CB07F30F360B
	for <lists+keyrings@lfdr.de>; Fri, 16 Jan 2026 13:19:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6404B24E016;
	Fri, 16 Jan 2026 13:19:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M7RJ4xWT"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40DF1247295
	for <keyrings@vger.kernel.org>; Fri, 16 Jan 2026 13:19:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768569540; cv=none; b=E4QSKwyp0yF/XwBUtVBN9l8ozgU5BkzoHSrITBwpQAsSqZHybG7zMWlaPVTiuyrgYHQOoLEMMckAQxH0SzDfrTR3mS+iJegxSXK61z52vV4qQnoPuLG5cAlCZuQiTIfB9QNRRuYn6ecxzlaNGNnin3XorxIk7NwDcM2QOXzj/IY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768569540; c=relaxed/simple;
	bh=paGgdC+WfYWTfp4FQwhsSNV0x9rGHQk4MpKoJN/J6kM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ul1KMtk9Bmf4zSq8LZC9eKuB/REXlHrhWvO7K7iuZTH7MkIPIAlzaYYH1LhECguTu6w8uWVO8jW8i6CMJdClon4/nERj5Q5Tb9ep/X4xSqji2XuY8661IItkN6MhnNkPAhUI0q/2ld6QnilPlc9pTnV86hXMqgaToBwoVOdKkn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M7RJ4xWT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E94A7C116C6
	for <keyrings@vger.kernel.org>; Fri, 16 Jan 2026 13:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768569539;
	bh=paGgdC+WfYWTfp4FQwhsSNV0x9rGHQk4MpKoJN/J6kM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=M7RJ4xWT43ADC98PxDV0e9HkP280IMkU6DuUIegDtDal1O+uBc54Tkxa09dLwjXub
	 YPFl3yiwWiS0BjazyBIjIvXj1bPBf9HUWuATFQjjMPIvMRiBVdB9C6gvatACsVQCZn
	 Q1cxodFpUXGz/ppkN2ieUnX1UvKai1MwWgfE/yv/G9Xt/x5hhIuTv4iowkxTtGCBWQ
	 iokXcbIAWUFqEg83r2kyYQFtPKeFO4/VXnU+HH4ZYJCkE5wTPD/IBLgTw3lEsycgkl
	 sSyPHDNvSqz/qFWqe4fO7qelHdj37D5Baf+lKFgJMZwu/rOBKY0Ayr6dZxSemsXv+G
	 WQqfmNw8427fQ==
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-34e730f5fefso1319574a91.0
        for <keyrings@vger.kernel.org>; Fri, 16 Jan 2026 05:18:59 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWbZoKG5BA9z8grbOlNGds8WSPXCRbjZMkW9E6K0oOEu6Ajo8PFrWM2cBWCfPeevyra7F9hWOZEyg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9brzwIWTxigNktvTYAAi75SXYX5t2DSVwYL6IGS9XvkmyhQTf
	HID1zJ48I9Me91Y0o1WnbJBdsH7TNG/p39lVr65/6ONIXba23GZHt627V647spEDONDtNKdmtRB
	LfIHi7AAXSH5CY2sFpAFhnEC8psTKXHw=
X-Received: by 2002:a17:90b:3c49:b0:341:88c1:6a7d with SMTP id
 98e67ed59e1d1-35272f87eb9mr2433924a91.18.1768569539305; Fri, 16 Jan 2026
 05:18:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260115004328.194142-1-coxu@redhat.com> <20260115004328.194142-2-coxu@redhat.com>
 <CAMj1kXFXNo1-pMbo-VZrjQ3TYe1tufebrLr_avL12A0nHMSGnA@mail.gmail.com> <8bfa859ed3a4f1cf0db0ab64d8c1c3b24684582a.camel@linux.ibm.com>
In-Reply-To: <8bfa859ed3a4f1cf0db0ab64d8c1c3b24684582a.camel@linux.ibm.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 16 Jan 2026 14:18:48 +0100
X-Gmail-Original-Message-ID: <CAMj1kXHsJNZoUEnbD1y=v4Ftuv9d2c08VckRV7ru4k4P83vZbQ@mail.gmail.com>
X-Gm-Features: AZwV_QiR8f22XUrZO7Ho9HKYBQjvJoHCgOD5leRDTv3x2USeTKmIDvLwsh7DTh4
Message-ID: <CAMj1kXHsJNZoUEnbD1y=v4Ftuv9d2c08VckRV7ru4k4P83vZbQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] integrity: Make arch_ima_get_secureboot integrity-wide
To: Mimi Zohar <zohar@linux.ibm.com>
Cc: Coiby Xu <coxu@redhat.com>, linux-integrity@vger.kernel.org, 
	Heiko Carstens <hca@linux.ibm.com>, Roberto Sassu <roberto.sassu@huaweicloud.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
	Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, 
	"maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, Roberto Sassu <roberto.sassu@huawei.com>, 
	Dmitry Kasatkin <dmitry.kasatkin@gmail.com>, Eric Snowberg <eric.snowberg@oracle.com>, 
	Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, 
	"Serge E. Hallyn" <serge@hallyn.com>, Jarkko Sakkinen <jarkko@kernel.org>, 
	"moderated list:ARM64 PORT (AARCH64 ARCHITECTURE)" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>, 
	"open list:LINUX FOR POWERPC (32-BIT AND 64-BIT)" <linuxppc-dev@lists.ozlabs.org>, 
	"open list:S390 ARCHITECTURE" <linux-s390@vger.kernel.org>, 
	"open list:EXTENSIBLE FIRMWARE INTERFACE (EFI)" <linux-efi@vger.kernel.org>, 
	"open list:SECURITY SUBSYSTEM" <linux-security-module@vger.kernel.org>, 
	"open list:KEYS/KEYRINGS_INTEGRITY" <keyrings@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, 16 Jan 2026 at 14:11, Mimi Zohar <zohar@linux.ibm.com> wrote:
>
> On Fri, 2026-01-16 at 10:41 +0100, Ard Biesheuvel wrote:
> > On Thu, 15 Jan 2026 at 01:43, Coiby Xu <coxu@redhat.com> wrote:
> > >
> > > EVM and other LSMs need the ability to query the secure boot status of
> > > the system, without directly calling the IMA arch_ima_get_secureboot
> > > function. Refactor the secure boot status check into a general,
> > > integrity-wide function named arch_integrity_get_secureboot.
> > >
> > > Define a new Kconfig option CONFIG_INTEGRITY_SECURE_BOOT, which is
> > > automatically configured by the supported architectures. The existing
> > > IMA_SECURE_AND_OR_TRUSTED_BOOT Kconfig loads the architecture specific
> > > IMA policy based on the refactored secure boot status code.
> > >
> > > Reported-and-suggested-by: Mimi Zohar <zohar@linux.ibm.com>
> > > Suggested-by: Roberto Sassu <roberto.sassu@huaweicloud.com>
> > > Signed-off-by: Coiby Xu <coxu@redhat.com>
> > > ---
> > >  arch/arm64/Kconfig                            |  1 +
> > >  arch/powerpc/Kconfig                          |  1 +
> > >  arch/powerpc/kernel/Makefile                  |  2 +-
> > >  arch/powerpc/kernel/ima_arch.c                |  5 --
> > >  arch/powerpc/kernel/integrity_sb_arch.c       | 13 +++++
> > >  arch/s390/Kconfig                             |  1 +
> > >  arch/s390/kernel/Makefile                     |  1 +
> > >  arch/s390/kernel/ima_arch.c                   |  6 --
> > >  arch/s390/kernel/integrity_sb_arch.c          |  9 +++
> > >  arch/x86/Kconfig                              |  1 +
> > >  arch/x86/include/asm/efi.h                    |  4 +-
> > >  arch/x86/platform/efi/efi.c                   |  2 +-
> > >  include/linux/ima.h                           |  7 +--
> > >  include/linux/integrity.h                     |  8 +++
> > >  security/integrity/Kconfig                    |  6 ++
> > >  security/integrity/Makefile                   |  3 +
> > >  security/integrity/efi_secureboot.c           | 56 +++++++++++++++++++
> > >  security/integrity/ima/ima_appraise.c         |  2 +-
> > >  security/integrity/ima/ima_efi.c              | 47 +---------------
> > >  security/integrity/ima/ima_main.c             |  4 +-
> > >  security/integrity/platform_certs/load_uefi.c |  2 +-
> > >  21 files changed, 111 insertions(+), 70 deletions(-)
> > >  create mode 100644 arch/powerpc/kernel/integrity_sb_arch.c
> > >  create mode 100644 arch/s390/kernel/integrity_sb_arch.c
> > >  create mode 100644 security/integrity/efi_secureboot.c
> > >
> > > diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> > > index 93173f0a09c7..4c265b7386bb 100644
> > > --- a/arch/arm64/Kconfig
> > > +++ b/arch/arm64/Kconfig
> > > @@ -2427,6 +2427,7 @@ config EFI
> > >         select EFI_STUB
> > >         select EFI_GENERIC_STUB
> > >         imply IMA_SECURE_AND_OR_TRUSTED_BOOT
> > > +       imply INTEGRITY_SECURE_BOOT
> >
> > This allows both to be en/disabled individually, which I don't think
> > is what we want. It also results in more churn across the
> > arch-specific Kconfigs than needed.
> >
> > Wouldn't it be better if IMA_SECURE_AND_OR_TRUSTED_BOOT 'select'ed
> > INTEGRITY_SECURE_BOOT in its Kconfig definition?
>
> As much as possible, EVM (and other LSMs) shouldn't be dependent on another LSM,
> in this case IMA, being configured.

Sure, but that is not my point.

This arrangement allows for IMA_SECURE_AND_OR_TRUSTED_BOOT to be
enabled without INTEGRITY_SECURE_BOOT, resulting in the stub
implementation of arch_integrity_get_secureboot() being used, which
always returns false.

