Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62D053BF049
	for <lists+keyrings@lfdr.de>; Wed,  7 Jul 2021 21:31:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230466AbhGGTe0 (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 7 Jul 2021 15:34:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229519AbhGGTeZ (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 7 Jul 2021 15:34:25 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9FB6C061574
        for <keyrings@vger.kernel.org>; Wed,  7 Jul 2021 12:31:44 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id v14so7031955lfb.4
        for <keyrings@vger.kernel.org>; Wed, 07 Jul 2021 12:31:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DPg1H7me9qbdg7UVxK09AOFutkX6+2jjmGZLpP+9rFE=;
        b=Gk8b0Lglm9tXpIUGTSA+BdAdYFO01tU4/ih0LElLxUv84iB5oXNSeu91aDRJ/CLOd2
         hJCmRSTZ03TY7odHpSknbfl7YLtvbiU4e0ZAVnWMlHzlY4eKn29VkADWqWGvZgDIUHS2
         qr8tUuOReXID4F77MCK1ebc5hdK98+Fqzg0GQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DPg1H7me9qbdg7UVxK09AOFutkX6+2jjmGZLpP+9rFE=;
        b=lh2Iv2VHqhb9dQ0tieNazZJyyt/vmZxyqphoHW2ONBbiYOmgrgPpa7SfuALGvZU949
         HUezwwTLKDE2NAvki4v+bAIkUSD6+0js+jdSe9n4fMNoKf94gnxvV7s/xyY4fbN80SYn
         IA25Rz1dh2NmGATH9g1Av7xksXAi3kM3cGB1LC+PFtaI4ojYzG0GK/20CA72QeStJ99/
         mEGeKi5HIyTqNwwRzpY6GEro4lIBDTX0aaMPABcWAA/SlLhj6SGCJclsseh65RUifTbx
         eT6yqiDLOZWC+W3ehAQg47Bs+YLH96MrIH2n5ZlOaJRZ6cQqnKUlHdAQ5H/XqZ20Uvx9
         etTg==
X-Gm-Message-State: AOAM5315MFPkKcOQrlxUBNOXwgAWWzj+tNJ5iaonZPMvkrGzptZSrAK3
        7ygnE6XJIMjgEV3bcTdZtgjH1I6n71fhhMS3qhI=
X-Google-Smtp-Source: ABdhPJxKOoupp8fWXB5H/kX6SFDpVrbAH8xgtYUs1nxJiDqWrSkpmNmgJluhdSwcOgF8ryJpjggn/Q==
X-Received: by 2002:a19:dc02:: with SMTP id t2mr20332669lfg.563.1625686301510;
        Wed, 07 Jul 2021 12:31:41 -0700 (PDT)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com. [209.85.167.48])
        by smtp.gmail.com with ESMTPSA id k10sm44109lfg.35.2021.07.07.12.31.39
        for <keyrings@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jul 2021 12:31:40 -0700 (PDT)
Received: by mail-lf1-f48.google.com with SMTP id v14so7031384lfb.4
        for <keyrings@vger.kernel.org>; Wed, 07 Jul 2021 12:31:39 -0700 (PDT)
X-Received: by 2002:a2e:b55b:: with SMTP id a27mr9830494ljn.251.1625686299582;
 Wed, 07 Jul 2021 12:31:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210707024403.1083977-1-eric.snowberg@oracle.com> <20210707024403.1083977-6-eric.snowberg@oracle.com>
In-Reply-To: <20210707024403.1083977-6-eric.snowberg@oracle.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Wed, 7 Jul 2021 12:31:23 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgEncBgRdv0FZjmZGQP5tzcdYA0XJrxmBEOevi06dimtw@mail.gmail.com>
Message-ID: <CAHk-=wgEncBgRdv0FZjmZGQP5tzcdYA0XJrxmBEOevi06dimtw@mail.gmail.com>
Subject: Re: [PATCH RFC 05/12] integrity: Introduce mok keyring
To:     Eric Snowberg <eric.snowberg@oracle.com>
Cc:     keyrings@vger.kernel.org,
        linux-integrity <linux-integrity@vger.kernel.org>,
        Mimi Zohar <zohar@linux.ibm.com>,
        David Howells <dhowells@redhat.com>,
        David Woodhouse <dwmw2@infradead.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        David Miller <davem@davemloft.net>,
        Jarkko Sakkinen <jarkko@kernel.org>,
        James Morris James Morris <jmorris@namei.org>,
        "Serge E. Hallyn" <serge@hallyn.com>,
        Kees Cook <keescook@chromium.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        scott.branden@broadcom.com, Wei Yongjun <weiyongjun1@huawei.com>,
        Nayna Jain <nayna@linux.ibm.com>,
        Eric Biggers <ebiggers@google.com>,
        Ard Biesheuvel <ardb@kernel.org>, nramas@linux.microsoft.com,
        Lenny Szubowicz <lszubowi@redhat.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
        LSM List <linux-security-module@vger.kernel.org>,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        Peter Jones <pjones@redhat.com>, Gary Lin <glin@suse.com>,
        Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Tue, Jul 6, 2021 at 7:45 PM Eric Snowberg <eric.snowberg@oracle.com> wrote:
>
> Introduce a new keyring called mok.  This keyring will be used during
> boot. Afterwards it will be destroyed.

Already discussed elsewhere, but yeah, when using TLA's, unless they
are universally understood (like "CPU" or "TLB" or whatever), please
spell them out somewhere for people who don't have the background.

I saw that you said elsewhere that MOK is "Machine Owner Key", but
please let's just have that in the sources and commit messages at
least for the original new code cases.

Maybe it becomes obvious over time as there is more history to the
code, but when you literally introduce a new concept, please spell it
out.

           Linus
