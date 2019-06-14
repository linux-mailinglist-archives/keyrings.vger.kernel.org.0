Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6C66B4546A
	for <lists+keyrings@lfdr.de>; Fri, 14 Jun 2019 07:58:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726059AbfFNF6p (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Fri, 14 Jun 2019 01:58:45 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:33513 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725801AbfFNF6o (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Fri, 14 Jun 2019 01:58:44 -0400
Received: by mail-lj1-f196.google.com with SMTP id h10so1128586ljg.0
        for <keyrings@vger.kernel.org>; Thu, 13 Jun 2019 22:58:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QFXNxbR5qtxNXi2nY5hSY49xeuHs2429UMIo2iWWl0g=;
        b=hD2rzW6+JswYVvwbKP+ETgzs+PloQRvs6H+EadUYpU/Oro1P+HHue6bgtuazPDg3gK
         stuJfFJXi5+gnnWcvhtxSaUN3NgUEt6xiRprMP6iXljZvONiXwrdE3eIhXuN3F65jqvj
         GDdqmqA4QbwtfVNGWRe5tEbx32S/rr8Z5fQh9bOdjhFyY0JSJuUKOSHoKQcwCLE6dXEF
         8H1Ah0D76X6ToKxVMaSjQ6P3BfUoC5IDA1zBe7kuIrdrloFC94pCsg2+UXs3ll7h5odz
         2CIf2h8rEBW6fQQpVQ6fPQTVx78raNLKckBefIUx83lDXGiAmD7qaIEG60q0jLmManM3
         aAbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QFXNxbR5qtxNXi2nY5hSY49xeuHs2429UMIo2iWWl0g=;
        b=UKGEC1jJSLYpL0GB4QIzbldyQJTM1zmxHKNA10Tl6nbZ0cevmnK33IDDSqxbjVg6f0
         o2KbhdMvD/r42dIm4zTiKZOWXrGkBtbQUqF7bXF+QWBCn/7PPCkR5K+I1LBuI11w/6iq
         FQsTxSje8MpNcy0ulB8uhInX9v4KTsHBkzAO/rZ3/iYP7/agUIXiuGXzQgvNA8VzNn4G
         hqwLPXh9ZunHEToDVKNeHU7ObF8SjZDJMmQUK2HW50PiQQfGW4BJZr7qRftZmM+57/3V
         +TsJ6F82TsIlYMy5STfsNkDtAtdLk8RvrQWpTv7K4aK7gQoynEPiLoKMxGeb3rA4u7D2
         ptgA==
X-Gm-Message-State: APjAAAWLPSVEE6pR9hjfA7TWUoW1dhJ3DwrHq/RX5QWJaEPJxG5U6E0I
        vfFMuYxJm71O9u7iGecSqL0VMD5ZgrDX3Yk2dE267Xm1
X-Google-Smtp-Source: APXvYqzeksM7lw+9eRlJ79HkAyW5J8Xn00aCwvC2H55C68XUPO5raXUWhnglWIySJoN7qdrhKGK/PKFdGYxBJR4f23E=
X-Received: by 2002:a2e:9b57:: with SMTP id o23mr1081203ljj.67.1560491923075;
 Thu, 13 Jun 2019 22:58:43 -0700 (PDT)
MIME-Version: 1.0
References: <1560421833-27414-1-git-send-email-sumit.garg@linaro.org> <d803283e-5e69-5deb-fe94-3f2e45fb95af@schaufler-ca.com>
In-Reply-To: <d803283e-5e69-5deb-fe94-3f2e45fb95af@schaufler-ca.com>
From:   Sumit Garg <sumit.garg@linaro.org>
Date:   Fri, 14 Jun 2019 11:28:31 +0530
Message-ID: <CAFA6WYN0u1nrxp1rok+GMi_wVH44FD9QKhoqOPvUNC0_f+kULw@mail.gmail.com>
Subject: Re: [RFC 0/7] Introduce TEE based Trusted Keys support
To:     Casey Schaufler <casey@schaufler-ca.com>
Cc:     keyrings@vger.kernel.org, linux-integrity@vger.kernel.org,
        linux-security-module@vger.kernel.org,
        Jens Wiklander <jens.wiklander@linaro.org>, corbet@lwn.net,
        dhowells@redhat.com, jejb@linux.ibm.com,
        Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
        zohar@linux.ibm.com, jmorris@namei.org, serge@hallyn.com,
        Ard Biesheuvel <ard.biesheuvel@linaro.org>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        linux-doc@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        tee-dev@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Thu, 13 Jun 2019 at 22:10, Casey Schaufler <casey@schaufler-ca.com> wrote:
>
> On 6/13/2019 3:30 AM, Sumit Garg wrote:
> > Add support for TEE based trusted keys where TEE provides the functionality
> > to seal and unseal trusted keys using hardware unique key. Also, this is
> > an alternative in case platform doesn't possess a TPM device.
> >
> > This series also adds some TEE features like:
>
> Please expand the acronym TEE on first use. That will
> help people who don't work with it on a daily basis
> understand what you're going on about.
>

Sure will take care of this. BTW, its Trusted Execution Environment (TEE).

-Sumit

> >
> > Patch #1, #2 enables support for registered kernel shared memory with TEE.
> >
> > Patch #3 enables support for private kernel login method required for
> > cases like trusted keys where we don't wan't user-space to directly access
> > TEE service to retrieve trusted key contents.
> >
> > Rest of the patches from #4 to #7 adds support for TEE based trusted keys.
> >
> > This patch-set has been tested with OP-TEE based pseudo TA which can be
> > found here [1].
> >
> > Looking forward to your valuable feedback/suggestions.
> >
> > [1] https://github.com/OP-TEE/optee_os/pull/3082
> >
> > Sumit Garg (7):
> >   tee: optee: allow kernel pages to register as shm
> >   tee: enable support to register kernel memory
> >   tee: add private login method for kernel clients
> >   KEYS: trusted: Introduce TEE based Trusted Keys
> >   KEYS: encrypted: Allow TEE based trusted master keys
> >   doc: keys: Document usage of TEE based Trusted Keys
> >   MAINTAINERS: Add entry for TEE based Trusted Keys
> >
> >  Documentation/security/keys/tee-trusted.rst      |  93 +++++
> >  MAINTAINERS                                      |   9 +
> >  drivers/tee/optee/call.c                         |   7 +
> >  drivers/tee/tee_core.c                           |   6 +
> >  drivers/tee/tee_shm.c                            |  16 +-
> >  include/keys/tee_trusted.h                       |  84 ++++
> >  include/keys/trusted-type.h                      |   1 +
> >  include/linux/tee_drv.h                          |   1 +
> >  include/uapi/linux/tee.h                         |   2 +
> >  security/keys/Kconfig                            |   3 +
> >  security/keys/Makefile                           |   3 +
> >  security/keys/encrypted-keys/masterkey_trusted.c |  10 +-
> >  security/keys/tee_trusted.c                      | 506 +++++++++++++++++++++++
> >  13 files changed, 737 insertions(+), 4 deletions(-)
> >  create mode 100644 Documentation/security/keys/tee-trusted.rst
> >  create mode 100644 include/keys/tee_trusted.h
> >  create mode 100644 security/keys/tee_trusted.c
> >
