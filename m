Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A628219FBA6
	for <lists+keyrings@lfdr.de>; Mon,  6 Apr 2020 19:34:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729418AbgDFRd7 (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Mon, 6 Apr 2020 13:33:59 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:37615 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726675AbgDFRd6 (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Mon, 6 Apr 2020 13:33:58 -0400
Received: by mail-lf1-f68.google.com with SMTP id t11so164783lfe.4
        for <keyrings@vger.kernel.org>; Mon, 06 Apr 2020 10:33:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=crJk+8BSj7iZamojeVRuNeQnx02e+aby3GgDMVtCX+M=;
        b=HaLctUUehIorhjsFq2+glIghQf2BJmPdCNRSdW6INhtT+CNtKPXSUUdlbD3pPrqHdo
         wDYu2EbJxV6gfWowAwmLB4BPQOe4BovD3e0D+cJzgLkc9/NAEZMZJ7fAcUfbzHhYkKJa
         iUPkBc9zIba7IkGAJ4Fs2BcVc+k+RQ3ovwnxk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=crJk+8BSj7iZamojeVRuNeQnx02e+aby3GgDMVtCX+M=;
        b=fe7uFO9nRvSHMMBVf+W343WK8z0CtbC+0Yye53HWzvYN3Vzoc4znXnnpxp5+IZNFsg
         bjWz5jA/+I3iaPMtmKLzuJGSpm4zmErSCdPiYi3i28buoQgvyeamz3my7l5b+qSj7QZ+
         3YeW9eVwmHxH/FgR/oVqFQr/ZPWONvMjOZfSRNZMpul0GCbZXIJ2jClP+Yg8hHrfvhW7
         sH9pAfgMiJytgwKJFP/LY7io2vdeLo5h2UrD2KYItuZvktGF+qaUNItF88PZx789k4Ik
         8MODA7yh/HEqhUE4K/fTna6LdZkLzI5vryqEtUTOq8cacDrL8volExvWvQ80hDYYyLGf
         1XYQ==
X-Gm-Message-State: AGi0Pub3rGi/+bw6u67BRERMsM+PYQL4t5OufMclScAyl1fptBHoC2lz
        jPOqa6Mj/ggtroWhTQY9P9kivJWtCrE=
X-Google-Smtp-Source: APiQypI5VRUUo8hJufikeL66nHEglsimnFjdzCLdYZUq3H61/8IK5t70thZ1JNNw5qiUgEqD+sDDOg==
X-Received: by 2002:ac2:5208:: with SMTP id a8mr13509126lfl.88.1586194433833;
        Mon, 06 Apr 2020 10:33:53 -0700 (PDT)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com. [209.85.208.179])
        by smtp.gmail.com with ESMTPSA id o18sm1505301lfb.13.2020.04.06.10.33.52
        for <keyrings@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Apr 2020 10:33:52 -0700 (PDT)
Received: by mail-lj1-f179.google.com with SMTP id r24so602985ljd.4
        for <keyrings@vger.kernel.org>; Mon, 06 Apr 2020 10:33:52 -0700 (PDT)
X-Received: by 2002:a2e:7c1a:: with SMTP id x26mr190977ljc.209.1586194431768;
 Mon, 06 Apr 2020 10:33:51 -0700 (PDT)
MIME-Version: 1.0
References: <a291cce3ff1ba978e7ad231a8e1b7d82f6164e86.camel@perches.com>
 <20200406023700.1367-1-longman@redhat.com> <319765.1586188840@warthog.procyon.org.uk>
 <d509771b7e08fff0d18654b746e413e93ed62fe8.camel@perches.com>
 <CAHk-=whgvhyi_=2AsfFLUznqmrO9TOjuzTvcYHvCC=f0+Y7PkQ@mail.gmail.com>
 <adc76d7c441e8f10697b61ceaff66207fb219886.camel@perches.com>
 <CAHk-=wgyt8j5rEnyKE8YdrRjQof1kvyom1CensTE0-Bp-meGnA@mail.gmail.com> <7eb36a794df38c885689085618a8a4ff9df3dd2c.camel@perches.com>
In-Reply-To: <7eb36a794df38c885689085618a8a4ff9df3dd2c.camel@perches.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Mon, 6 Apr 2020 10:33:35 -0700
X-Gmail-Original-Message-ID: <CAHk-=wj=zTfrjXbFp+yhMpjH5jyx=t5fcDVmYN6KpE9Tjxb9YA@mail.gmail.com>
Message-ID: <CAHk-=wj=zTfrjXbFp+yhMpjH5jyx=t5fcDVmYN6KpE9Tjxb9YA@mail.gmail.com>
Subject: Re: [PATCH] mm: Add kvfree_sensitive() for freeing sensitive data objects
To:     Joe Perches <joe@perches.com>
Cc:     David Howells <dhowells@redhat.com>,
        Waiman Long <longman@redhat.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
        James Morris <jmorris@namei.org>,
        "Serge E. Hallyn" <serge@hallyn.com>,
        Linux-MM <linux-mm@kvack.org>, keyrings@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Mon, Apr 6, 2020 at 10:22 AM Joe Perches <joe@perches.com> wrote:
>
> API function naming symmetry is good.

BS.

Naming should be symmetric if _use_ is symmetric.

But if the use is completely different, then the naming should be
completely different too.

A symmetric naming is only helpful if it implies symmetries in use.
Otherwise it's actively misleading.

In "kzalloc()", the z is meaningful and an important part of what the
caller wants.

In "kzfree()", the z is actively detrimental, because maybe in the
future we really _might_ want to use that "memfill(0xdeadbeef)" or
something. The "zero" part of the interface isn't even _relevant_.

See? There is no API symmetry. There is only a small and immaterial
implementation detail.

We don't put an "l" into the kfree/kmalloc names because they
internally use a percpu list to manage the allocations, do we? That's
a "symmetry" too. But it's an irrelevant implementation detail that
makes no sense to the caller.

           Linus
