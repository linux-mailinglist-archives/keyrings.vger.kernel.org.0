Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C0F1D4869A
	for <lists+keyrings@lfdr.de>; Mon, 17 Jun 2019 17:08:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726731AbfFQPHr (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Mon, 17 Jun 2019 11:07:47 -0400
Received: from mail.kernel.org ([198.145.29.99]:43020 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727639AbfFQPHn (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Mon, 17 Jun 2019 11:07:43 -0400
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id CE23321783
        for <keyrings@vger.kernel.org>; Mon, 17 Jun 2019 15:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1560784062;
        bh=Gxoxo21Lfkn/K7A7njUdmGutlMuh89H9AmOUNy6D3vQ=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=kijmrsYEnMsus0trgL5AcnNyXRdSURSsYmJ/F2iZvEm/37ek4Kg+AF9JdVMI9bh9W
         JCFvsRZC0mD8yQbWZY9v8HJWBAPk96z9+JoD4uRu7MAO4S0KFeAtbR+55mQnDUe/5Z
         nWYb6rdWQnZWVQMEPmADVTmw4jGsElcvfYdVki2M=
Received: by mail-wr1-f43.google.com with SMTP id x17so10352884wrl.9
        for <keyrings@vger.kernel.org>; Mon, 17 Jun 2019 08:07:41 -0700 (PDT)
X-Gm-Message-State: APjAAAXXCAjYQFI/0p95q9PhoFFBR7JB4GK8effQHoFkHSoO6jzAd6MF
        Hz6zbO7MPESOQAv8viB9eW/ln9Wo/Mgs3eHxzJqs0g==
X-Google-Smtp-Source: APXvYqyI1b9br6hsxubRzj9P6hDCchpenelMr+cbgYq59s/ECCE0jKzqk2QGDR5wJOWg+nRr7Sj8Tlmkt7OD9xMBD9U=
X-Received: by 2002:a5d:6a42:: with SMTP id t2mr12131692wrw.352.1560784060277;
 Mon, 17 Jun 2019 08:07:40 -0700 (PDT)
MIME-Version: 1.0
References: <20190508144422.13171-1-kirill.shutemov@linux.intel.com> <20190508144422.13171-46-kirill.shutemov@linux.intel.com>
In-Reply-To: <20190508144422.13171-46-kirill.shutemov@linux.intel.com>
From:   Andy Lutomirski <luto@kernel.org>
Date:   Mon, 17 Jun 2019 08:07:29 -0700
X-Gmail-Original-Message-ID: <CALCETrVCdp4LyCasvGkc0+S6fvS+dna=_ytLdDPuD2xeAr5c-w@mail.gmail.com>
Message-ID: <CALCETrVCdp4LyCasvGkc0+S6fvS+dna=_ytLdDPuD2xeAr5c-w@mail.gmail.com>
Subject: Re: [PATCH, RFC 45/62] mm: Add the encrypt_mprotect() system call for MKTME
To:     "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>, X86 ML <x86@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>,
        "H. Peter Anvin" <hpa@zytor.com>, Borislav Petkov <bp@alien8.de>,
        Peter Zijlstra <peterz@infradead.org>,
        David Howells <dhowells@redhat.com>,
        Kees Cook <keescook@chromium.org>,
        Dave Hansen <dave.hansen@intel.com>,
        Kai Huang <kai.huang@linux.intel.com>,
        Jacob Pan <jacob.jun.pan@linux.intel.com>,
        Alison Schofield <alison.schofield@intel.com>,
        Linux-MM <linux-mm@kvack.org>, kvm list <kvm@vger.kernel.org>,
        keyrings@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Wed, May 8, 2019 at 7:44 AM Kirill A. Shutemov
<kirill.shutemov@linux.intel.com> wrote:
>
> From: Alison Schofield <alison.schofield@intel.com>
>
> Implement memory encryption for MKTME (Multi-Key Total Memory
> Encryption) with a new system call that is an extension of the
> legacy mprotect() system call.
>
> In encrypt_mprotect the caller must pass a handle to a previously
> allocated and programmed MKTME encryption key. The key can be
> obtained through the kernel key service type "mktme". The caller
> must have KEY_NEED_VIEW permission on the key.
>
> MKTME places an additional restriction on the protected data:
> The length of the data must be page aligned. This is in addition
> to the existing mprotect restriction that the addr must be page
> aligned.

I still find it bizarre that this is conflated with mprotect().

I also remain entirely unconvinced that MKTME on anonymous memory is
useful in the long run.  There will inevitably be all kinds of fancy
new CPU features that make the underlying MKTME mechanisms much more
useful.  For example, some way to bind a key to a VM, or a way to
*sanely* encrypt persistent memory.  By making this thing a syscall
that does more than just MKTME, you're adding combinatorial complexity
(you forget pkey!) and you're tying other functionality (change of
protection) to this likely-to-be-deprecated interface.

This is part of why I much prefer the idea of making this style of
MKTME a driver or some other non-intrusive interface.  Then, once
everyone gets tired of it, the driver can just get turned off with no
side effects.

--Andy
