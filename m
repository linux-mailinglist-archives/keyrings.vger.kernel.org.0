Return-Path: <keyrings+bounces-3086-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 00BE7B97156
	for <lists+keyrings@lfdr.de>; Tue, 23 Sep 2025 19:45:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C63472E69B2
	for <lists+keyrings@lfdr.de>; Tue, 23 Sep 2025 17:45:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C2682820A0;
	Tue, 23 Sep 2025 17:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gLBwm0NZ"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27EBF21C9F4;
	Tue, 23 Sep 2025 17:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758649544; cv=none; b=NtAxak3if7CX9v+mgSnyJzISaxp5I1nclZg0Aw1V8RDyhoi6BaZhE2DiesEssorCWTJBxVzJb9HsaWnqQcEprhq1ihkbpUqRdoWEsfRoPwVMJgOipzmgLgB5uFtwpv6lLPqtvDttB06ZhbW3EtRcxYRDoQUsRpX13byrkf9pZ5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758649544; c=relaxed/simple;
	bh=4eo/a1KUEFY7fEWdOih7ebHnYSPIXBQbHE0axcplA7o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F61CTTlccrxYWITMPxU9J8ROpp45f1tl3/LwkR/pI5IA6d94Iqd2ASapAQ1hYqotLxAjRm2XsaPwaS1zpnTKFIZm9CsLxMtH2UwEnGPnYvH3o0ual6ijFvF7iEQVwF21alc2uU78aZlGnlVmCiL53Jkicb7DiJmpfVBr5jzNYI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gLBwm0NZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42797C4CEF5;
	Tue, 23 Sep 2025 17:45:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758649543;
	bh=4eo/a1KUEFY7fEWdOih7ebHnYSPIXBQbHE0axcplA7o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gLBwm0NZiP5WB54dyrSCDfzdzAje1hFBdha6vFXsG445cBLf+e6Apbuu92tfpoqRM
	 YIdf/xrhOjQwvFltc//95KCDvZV69WQVXSAmreR2fEOIL32Mtj8EOXw5ZplzpgRKbM
	 Iy2dSlUL1pUrKtKQU383z9+OigzrojzAR8rVZNoKirYFsKDs2aKM0hrWNcHKB3MHX4
	 tDagc/uepq0esC/KnPok/F1Nqe9/tKYoVV9KwTIGdCs8PsQ02Na0doFrenPIrBd+Kv
	 EH9bY68Ds/grUtEwBuj8qBLnHUCHC4P9WzO6wpLfNJJswt/nG4PpMKyPoF3FvJ8pDo
	 1lp8LevcFd8Uw==
Date: Tue, 23 Sep 2025 17:45:41 +0000
From: Eric Biggers <ebiggers@kernel.org>
To: David Howells <dhowells@redhat.com>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Harald Freudenberger <freude@linux.ibm.com>,
	Holger Dengler <dengler@linux.ibm.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Stephan Mueller <smueller@chronox.de>, Simo Sorce <simo@redhat.com>,
	linux-crypto@vger.kernel.org, linux-s390@vger.kernel.org,
	keyrings@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] lib/crypto: Add SHA3-224, SHA3-256, SHA3-384,
 SHA-512, SHAKE128, SHAKE256
Message-ID: <20250923174541.GA2695109@google.com>
References: <20250919203208.GA8350@quark>
 <20250919190413.GA2249@quark>
 <3936580.1758299519@warthog.procyon.org.uk>
 <3975735.1758311280@warthog.procyon.org.uk>
 <538563.1758648981@warthog.procyon.org.uk>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <538563.1758648981@warthog.procyon.org.uk>

On Tue, Sep 23, 2025 at 06:36:21PM +0100, David Howells wrote:
> Eric Biggers <ebiggers@kernel.org> wrote:
> 
> > > > and that the functions can be called in any context.
> > > 
> > > "Context" as in?
> > 
> > See the "Function context" section of
> > Documentation/doc-guide/kernel-doc.rst
> 
> Btw, in include/crypto/sha1.h:
> 
> /**
>  * hmac_sha1_update() - Update an HMAC-SHA1 context with message data
>  * @ctx: the HMAC context to update; must have been initialized
>  * @data: the message data
>  * @data_len: the data length in bytes
>  *
>  * This can be called any number of times.
>  *
>  * Context: Any context.
>  */
> static inline void hmac_sha1_update(struct hmac_sha1_ctx *ctx,
> 				    const u8 *data, size_t data_len)
> {
> 	sha1_update(&ctx->sha_ctx, data, data_len);
> }
> 
> for example, your specification of "Context: Any context." is probably not
> correct if FPU/Vector registers are used by optimised assembly as part of the
> function.  See:
> 
> void kernel_fpu_begin_mask(unsigned int kfpu_mask)
> {
> 	if (!irqs_disabled())
> 		fpregs_lock();
> 
> 	WARN_ON_FPU(!irq_fpu_usable());
> 
> 	/* Toggle kernel_fpu_allowed to false: */
> 	WARN_ON_FPU(!this_cpu_read(kernel_fpu_allowed));
> 	this_cpu_write(kernel_fpu_allowed, false);
> 
> 	if (!(current->flags & (PF_KTHREAD | PF_USER_WORKER)) &&
> 	    !test_thread_flag(TIF_NEED_FPU_LOAD)) {
> 		set_thread_flag(TIF_NEED_FPU_LOAD);
> 		save_fpregs_to_fpstate(x86_task_fpu(current));
> 	}
> 	__cpu_invalidate_fpregs_state();
> 
> 	/* Put sane initial values into the control registers. */
> 	if (likely(kfpu_mask & KFPU_MXCSR) && boot_cpu_has(X86_FEATURE_XMM))
> 		ldmxcsr(MXCSR_DEFAULT);
> 
> 	if (unlikely(kfpu_mask & KFPU_387) && boot_cpu_has(X86_FEATURE_FPU))
> 		asm volatile ("fninit");
> }
> 
> If you try and access the function in IRQ mode, for example, you'll get a
> warning, and if IRQs are not disabled, it will disable BH/preemption.
> 
> You also can't use it from inside something else that uses FPU registers.
> 
> I suggest something like:
> 
>  * Context: Arch-dependent: May use the FPU/Vector unit registers.

Kernel-mode FPU is used only when irq_fpu_usable().

The tests verify that the functions do work in IRQ context.

- Eric

