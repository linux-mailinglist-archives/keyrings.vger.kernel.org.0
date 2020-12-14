Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 579A62DA222
	for <lists+keyrings@lfdr.de>; Mon, 14 Dec 2020 21:57:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726227AbgLNU4b (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Mon, 14 Dec 2020 15:56:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388128AbgLNU4N (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Mon, 14 Dec 2020 15:56:13 -0500
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89D66C0613D3
        for <keyrings@vger.kernel.org>; Mon, 14 Dec 2020 12:55:32 -0800 (PST)
Received: by mail-ej1-x644.google.com with SMTP id w1so19843676ejf.11
        for <keyrings@vger.kernel.org>; Mon, 14 Dec 2020 12:55:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=yjX3o6xsyCaRUXsi679rrY59nTFovxClxEsS5QsmetY=;
        b=XjtwLkAai12lTlnZPVGu410mAuM6h7pvrrsWQtnfyC+fVZDlR06SHMnbqxBQ7mlCD2
         O5QFsMoATEz1Fg1a2rba6L5kRW7vKfPSB+6Y8bNbfs6TnHzYFEiYTpk0nFnuKI8a/45V
         EP/9F3u3S9UlH8OTDO0A6KqVZinxKJN52Ny+s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=yjX3o6xsyCaRUXsi679rrY59nTFovxClxEsS5QsmetY=;
        b=TBRc9dzUT+NCkaL1Neg9CVzyRrMAvwwwbeRH6N2S55XWzFHbkrC65u87IbFfudNnYh
         GoE40xzN4PxkqiZk6e3Zy1DjDq673QOwDH33XnZ4k5oWS8aZe/j54UrnYMXc2Rd6Ijlr
         SmgCmwtMWCFkza21NrbovCqk4g90IHG3ufswEzgWv/CoeQTcYDNXjdqR9WVqj2X76q7K
         3BfXQIVj34sJKljdJRGBHlpPwC2/O7HlD8zFbqCI4bq2w6O3qKcZxeIGDzl9fux9BG0E
         rbINX+5qPQ/eCo9U63yQCHj7VdgL/uSDkjkp0ID2K/LpfFI4zK8FSDLxzwHp1DPlAAdF
         e+Qg==
X-Gm-Message-State: AOAM5315Fm68vWBT9PDtNjQ0zPbNmy1G80RgFVv+yJz+B+74mLWqBH/j
        4es4kA5lFRgpoTVNqlpvR25Y8OSyczHFeg==
X-Google-Smtp-Source: ABdhPJyPi6djDwMhptpcDw4gNGtwTyMPsZCu3riqRMoI8zQSg3xOy4I9qLURzeEjwUrEYbSQXqjj6A==
X-Received: by 2002:a17:906:3b4d:: with SMTP id h13mr23833480ejf.289.1607979330898;
        Mon, 14 Dec 2020 12:55:30 -0800 (PST)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com. [209.85.208.45])
        by smtp.gmail.com with ESMTPSA id i18sm2757143edt.68.2020.12.14.12.55.30
        for <keyrings@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Dec 2020 12:55:30 -0800 (PST)
Received: by mail-ed1-f45.google.com with SMTP id b2so18703897edm.3
        for <keyrings@vger.kernel.org>; Mon, 14 Dec 2020 12:55:30 -0800 (PST)
X-Received: by 2002:a2e:b4af:: with SMTP id q15mr11323303ljm.507.1607978983041;
 Mon, 14 Dec 2020 12:49:43 -0800 (PST)
MIME-Version: 1.0
References: <2659836.1607940186@warthog.procyon.org.uk>
In-Reply-To: <2659836.1607940186@warthog.procyon.org.uk>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Mon, 14 Dec 2020 12:49:27 -0800
X-Gmail-Original-Message-ID: <CAHk-=wido5stGfFtRzmW19bB1w2XQAuY8oxUtFN2ZWdk2Grq-w@mail.gmail.com>
Message-ID: <CAHk-=wido5stGfFtRzmW19bB1w2XQAuY8oxUtFN2ZWdk2Grq-w@mail.gmail.com>
Subject: Re: [GIT PULL] keys: Collected minor fixes and cleanups
To:     David Howells <dhowells@redhat.com>
Cc:     Jarkko Sakkinen <jarkko@kernel.org>,
        "Alexander A. Klimov" <grandmaster@al2klimov.de>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Alex Shi <alex.shi@linux.alibaba.com>,
        Ben Boeckel <mathstuf@gmail.com>,
        Denis Efremov <efremov@linux.com>,
        Gabriel Krisman Bertazi <krisman@collabora.com>,
        Jann Horn <jannh@google.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        =?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@linux.microsoft.com>,
        Mimi Zohar <zohar@linux.vnet.ibm.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Tianjia Zhang <tianjia.zhang@linux.alibaba.com>,
        Tom Rix <trix@redhat.com>, YueHaibing <yuehaibing@huawei.com>,
        keyrings@vger.kernel.org,
        Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        LSM List <linux-security-module@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Mon, Dec 14, 2020 at 2:04 AM David Howells <dhowells@redhat.com> wrote:
>
> Here's a set of minor fixes/cleanups that I've collected from various
> people for the next merge window.

This doesn't even build.

And no, that's not because of some merge error on my part. Just to
verify, I tried to build the head of what you sent me (commit
1b91ea77dfeb: "certs: Replace K{U,G}IDT_INIT() with
GLOBAL_ROOT_{U,G}ID") and it fails the same way.

  In file included from ./include/linux/cred.h:13,
                   from security/integrity/ima/ima_mok.c:12:
  security/integrity/ima/ima_mok.c: In function =E2=80=98ima_mok_init=E2=80=
=99:
  ./include/linux/key.h:292:29: warning: passing argument 7 of
=E2=80=98keyring_alloc=E2=80=99 makes pointer from integer without a cast
[-Wint-conversion]
  .. ten more lines of warnings..
  security/integrity/ima/ima_mok.c:36:26: error: too many arguments to
function =E2=80=98keyring_alloc=E2=80=99
     36 |  ima_blacklist_keyring =3D keyring_alloc(".ima_blacklist",
        |                          ^~~~~~~~~~~~~

so these "fixes" have clearly had absolutely zero testing, haven't
been in linux-next, and are completely broken.

The bug was introduced by commit 33c36b2053de ("certs: Fix blacklist
flag type confusion"), which changed the IMA code without actually
testing it.

I suspect the fix is trivial (change the "," to "|"), but I will not
be pulling this - or anything else that hasn't been in linux-next -
from you this merge window.

The pain just isn't worth it, but more importantly, you simply need to
get your workflow in order, and not send me completely untested
garbage that hasn't even been compiled.

               Linus
