Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E825E26B051
	for <lists+keyrings@lfdr.de>; Wed, 16 Sep 2020 00:08:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727928AbgIOWII (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 15 Sep 2020 18:08:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727983AbgIOUVP (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Tue, 15 Sep 2020 16:21:15 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 868D8C061788
        for <keyrings@vger.kernel.org>; Tue, 15 Sep 2020 13:20:33 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id k14so2574460pgi.9
        for <keyrings@vger.kernel.org>; Tue, 15 Sep 2020 13:20:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KKOXRLJhkGhiu92khwe8SCHm7fBcYmv/ys0l/XPzjKs=;
        b=Wz+BieWsz9tBppl55cH0gZUAY+AWg0bv7saM/2nDohe3eL0PP9s7q0ZlQFWXA82A3/
         7i0rO/EVbOXnbgU/Re1YvOR4pVy/dxFhLx50NgG323jKRkAIGglycn7vmPT59RtsbKfn
         G8cojrdxnvoSJFIhiOxzAahRGvlqL7L3r4det3ATlvHWboIpPKriHFZPcDzMGYio/bcK
         IYAeJeiakQUvcZnggP5T05SIEnwMvwVxkTdNyCN2Gb0Zg3YN5QflfqPsVJeqK91Ctpig
         F4DBVPDSLClXVcinR++JFhI+TqKyJl4vh09kO+RTE/EjlPPmtLKwyOnQBzvmBLlVaH7h
         D+6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KKOXRLJhkGhiu92khwe8SCHm7fBcYmv/ys0l/XPzjKs=;
        b=JO0oWuU5deG3X680pUnn8pPb3rPICzyu7A8+4VKlWW1BVBCCFAZq39LAw+I6VKy8rQ
         e7SK3+Cxa8qfwI+K9NEyTAOCVV781tYLzRGT/1GchJK5rmbcrimYXHdx1eVryA7ESWn3
         yliRTcguMco6jjIfPyAJbudDByTHMYxs1E+d0GcPVWCQSvqbLyOqFrjRVkwzH5iVcBdw
         1ZBImPTEuqWFw97Ao9WsOIpkIs2/gL4e7yQYsNg1ykBzuY+tLl2tMeu6CY/f4t2Rg/w6
         HB0W5ZIHqNEolXjBtAOWjn/YNmq6fqaRPOa4boqvIJknb+TX2a+KruiBC7l/PgtzGL9t
         i1+Q==
X-Gm-Message-State: AOAM531BfMbvPWiNvwNTNHO8IlYjq0MQAmZJ23mZBNvR7poyH8gmtnqu
        paKjmS9jCjPtYnlU5qRns8OEbAdvdSjQ8o0QCG+JbA==
X-Google-Smtp-Source: ABdhPJzopiasXStsZ048nRyWlzMTOvMY5O+fmTdHlgtoYibbwZ7I2wht/t3RyRw/q/Vft3U9WgLWjsqor4gfSAj+bZs=
X-Received: by 2002:a63:31d2:: with SMTP id x201mr16442770pgx.263.1600201232776;
 Tue, 15 Sep 2020 13:20:32 -0700 (PDT)
MIME-Version: 1.0
References: <20200912172643.9063-5-James.Bottomley@HansenPartnership.com>
 <202009131413.8dt8QEc8%lkp@intel.com> <1600016571.7833.9.camel@HansenPartnership.com>
 <20200915091140.GC3612@linux.intel.com>
In-Reply-To: <20200915091140.GC3612@linux.intel.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Tue, 15 Sep 2020 13:20:20 -0700
Message-ID: <CAKwvOdnDJKPJ__sVKX2HmLUWyNPo=b0ccLvyBLyWoFfC0EFkiA@mail.gmail.com>
Subject: Re: [PATCH v11 4/5] security: keys: trusted: use ASN.1 TPM2 key
 format for the blobs
To:     Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
        James Bottomley <James.Bottomley@hansenpartnership.com>
Cc:     kernel test robot <lkp@intel.com>, linux-integrity@vger.kernel.org,
        kbuild-all@lists.01.org,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Mimi Zohar <zohar@linux.ibm.com>,
        David Woodhouse <dwmw2@infradead.org>,
        keyrings@vger.kernel.org, David Howells <dhowells@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Tue, Sep 15, 2020 at 2:11 AM Jarkko Sakkinen
<jarkko.sakkinen@linux.intel.com> wrote:
>
> On Sun, Sep 13, 2020 at 10:02:51AM -0700, James Bottomley wrote:
> > On Sun, 2020-09-13 at 14:26 +0800, kernel test robot wrote:
> > > Hi James,
> > >
> > > I love your patch! Yet something to improve:
> > >
> > > [auto build test ERROR on integrity/next-integrity]
> > > [also build test ERROR on linus/master v5.9-rc4 next-20200911]
> > > [cannot apply to security/next-testing dhowells-fs/fscache-next]
> > > [If your patch is applied to the wrong git tree, kindly drop us a
> > > note.
> > > And when submitting patch, we suggest to use '--base' as documented
> > > in
> > > https://git-scm.com/docs/git-format-patch]
> > >
> > > url:    https://github.com/0day-ci/linux/commits/James-Bottomley/TPM-
> > > 2-0-trusted-key-rework/20200913-013201
> > > base:   https://git.kernel.org/pub/scm/linux/kernel/git/zohar/linux-i
> > > ntegrity.git next-integrity
> > > config: arm-randconfig-r013-20200913 (attached as .config)

arm-randconfig ^  You'll need to download and gunzip then use the config file.

> > > compiler: clang version 12.0.0 (https://github.com/llvm/llvm-project
> > > 3170d54842655d6d936aae32b7d0bc92fce7f22e)
> > > reproduce (this is a W=1 build):
> > >         wget https://raw.githubusercontent.com/intel/lkp-tests/master
> > > /sbin/make.cross -O ~/bin/make.cross
> > >         chmod +x ~/bin/make.cross
> > >         # install arm cross compiling tool for clang build
> > >         # apt-get install binutils-arm-linux-gnueabi
> > >         # save the attached .config to linux build tree
> > >         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross
> > > ARCH=arm
> > >
> > > If you fix the issue, kindly add following tag as appropriate
> > > Reported-by: kernel test robot <lkp@intel.com>
> > >
> > > All errors (new ones prefixed by >>):
> > >
> > > > > security/keys/trusted-keys/trusted_tpm2.c:19:10: fatal error:
> > > > > 'tpm2key.asn1.h' file not found
> > >
> > >    #include "tpm2key.asn1.h"
> > >             ^~~~~~~~~~~~~~~~
> > >    1 error generated.
> >
> > Do you have the actual build log for this?  On x86 the build process
> > builds any precursors first, which is the tpm2key.asn1.o, which
> > generates that header file, so we see:
> >
> >   ASN.1   security/keys/trusted-keys/tpm2key.asn1.[ch]
> >   CC [M]  security/keys/trusted-keys/trusted_tpm2.o
> >   CC [M]  security/keys/trusted-keys/tpm2-policy.o
> >   CC [M]  security/keys/trusted-keys/tpm2key.asn1.o
> >   LD [M]  security/keys/trusted-keys/trusted.o
> >
> > Is ARM doing a lazier version of that?  In which case the fix might be
> > to move trusted_tpm2.o to after tpm2key.asn1.o in the Makefile, this
> > line:
> >
> > trusted-y += trusted_tpm2.o tpm2key.asn1.o
> >
> > James
>
> You can try to reproduce the arm build with BuildRoot. That's what I
> usually do when bumping something like this with arm.

You shouldn't need buildroot for build failures (we use buildroot, for
boot testing).

For an arm build, you should be able to cross compile with:
$ ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- make CC=clang -j

(You can try without CC=clang first, may not be clang specific)
(You should install arm-linux-gnueabihf-gcc and the same for binutils.
Some distros have separate target triples without `hf` in them; either
should be fine for the kernel as long as your invocation of make
matches what you have installed).
-- 
Thanks,
~Nick Desaulniers
