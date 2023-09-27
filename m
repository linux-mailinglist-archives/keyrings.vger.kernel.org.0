Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F3DDE7B0D75
	for <lists+keyrings@lfdr.de>; Wed, 27 Sep 2023 22:31:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229595AbjI0UbH (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 27 Sep 2023 16:31:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229460AbjI0UbH (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 27 Sep 2023 16:31:07 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F7D9122
        for <keyrings@vger.kernel.org>; Wed, 27 Sep 2023 13:31:04 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-3247d69ed2cso1538661f8f.0
        for <keyrings@vger.kernel.org>; Wed, 27 Sep 2023 13:31:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1695846662; x=1696451462; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1bPQ4W+m4k6grk2QsqsO+u/OMm6oUavQe8VAaeMpNSM=;
        b=BW6f9FnOowNXdemqNGSr9DVrx4990m1nUH2aWiyV2yZVmxNMyg/IXjg3rMvCOW+Qgh
         scfMaWZuPPs+dwYHXD0oJYlLdmtB8+ltLCf4VZhNI1XFXuNajppg2oKNhvosn7JmKl3T
         EU9dE2LKyj5r5MBo9uZJmwxkts8hSm+2Ga0WebP4qO0fTiS4miKG1WDy8WpyjLlGNJs6
         DoI/lp/gnjnbeAXxAbu9qKvybTT30hp69fdy7jGCB4I23xT8i5taj7EA1zJWFq4yVJ7P
         wzxY41RUbOvLvzYq7zsqB/hMPpidev2PkJR9RtALN+EbEegsVuZFb1+6JSFsgJ61pBBn
         whaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695846662; x=1696451462;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1bPQ4W+m4k6grk2QsqsO+u/OMm6oUavQe8VAaeMpNSM=;
        b=Afsiy3JzB2t4D68MlGwOUIfbFfwDCOv0dzSzcqA81Xzrq2Hky5SSa+lpGk6VdGNFsi
         fKOMRJMS8U5l8qQb9scjUhCmsswG/UAjN7esQ1V8o52Du2YphVKTs3U4SnbMQBeo7wUV
         wjLwJNgyf2240r6Qe7ZbnZRYcrtM1diEyi2hSlb68342vcFowBMTrVug77H+wkpE/vNH
         yJp2VBKP63z1O+LAyXyXlDmfgHPxW794BSzFVJgWSik+PxZxXocf5z+6eE4bdCapr9B2
         0d63oJ9a7mI2N90JYAh5BAQqjydanDFaael8niTVIMfLBMPSZzCvCPcn6prYaXXKnByb
         kf1w==
X-Gm-Message-State: AOJu0YwygO87MxMgwxezJDWo+DBMGntC8HywSuwYUCg8dQ8vpxPUIVUR
        r22NRmEoKzbWTH/H4+OW08pwQ/KdkWKkmebQldjX+w==
X-Google-Smtp-Source: AGHT+IGHhim/72mDyUSht5r5coAg+DnoIeszZ0PMJICln5voUh7kOaTJ+BemafS1Ina7CW/UDOHZ0LdSqDwwnM/oVG8=
X-Received: by 2002:adf:ee4b:0:b0:31a:e972:3601 with SMTP id
 w11-20020adfee4b000000b0031ae9723601mr2637429wro.54.1695846662401; Wed, 27
 Sep 2023 13:31:02 -0700 (PDT)
MIME-Version: 1.0
References: <20230908153056.3503975-1-gjoyce@linux.vnet.ibm.com>
 <20230908153056.3503975-2-gjoyce@linux.vnet.ibm.com> <20230913165612.GA2213586@dev-arch.thelio-3990X>
 <CAKwvOdnbKA-DiWRorWMR93JPFX-OjUjO=SQXSRf4=DpwzvZ=pQ@mail.gmail.com> <d07b66c55e957c78aff8ab9a6170747832cbc8c5.camel@linux.vnet.ibm.com>
In-Reply-To: <d07b66c55e957c78aff8ab9a6170747832cbc8c5.camel@linux.vnet.ibm.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Wed, 27 Sep 2023 13:30:47 -0700
Message-ID: <CAKwvOd=K_xNK71DpivVsyKOKWPo1XG78zGsAdZTWvj=tHmh2ZQ@mail.gmail.com>
Subject: Re: [PATCH v7 1/3 RESEND] block:sed-opal: SED Opal keystore
To:     gjoyce@linux.vnet.ibm.com
Cc:     Nathan Chancellor <nathan@kernel.org>, linux-block@vger.kernel.org,
        axboe@kernel.dk, jarkko@kernel.org, linuxppc-dev@lists.ozlabs.org,
        jonathan.derrick@linux.dev, brking@linux.vnet.ibm.com,
        msuchanek@suse.de, mpe@ellerman.id.au, nayna@linux.ibm.com,
        akpm@linux-foundation.org, keyrings@vger.kernel.org,
        llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
        USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Wed, Sep 27, 2023 at 1:26=E2=80=AFPM Greg Joyce <gjoyce@linux.vnet.ibm.c=
om> wrote:
>
> On Wed, 2023-09-13 at 13:49 -0700, Nick Desaulniers wrote:
> > On Wed, Sep 13, 2023 at 9:56=E2=80=AFAM Nathan Chancellor <nathan@kerne=
l.org>
> > wrote:
> > > Hi Greg,
> > >
> > > On Fri, Sep 08, 2023 at 10:30:54AM -0500, gjoyce@linux.vnet.ibm.com
> > >  wrote:
> > > > From: Greg Joyce <gjoyce@linux.vnet.ibm.com>
> > > >
> > > > Add read and write functions that allow SED Opal keys to stored
> > > > in a permanent keystore.
> > > >
> > > > Signed-off-by: Greg Joyce <gjoyce@linux.vnet.ibm.com>
> > > > Reviewed-by: Jonathan Derrick <jonathan.derrick@linux.dev>
> > > > ---
> > > >  block/Makefile               |  2 +-
> > > >  block/sed-opal-key.c         | 24 ++++++++++++++++++++++++
> > > >  include/linux/sed-opal-key.h | 15 +++++++++++++++
> > > >  3 files changed, 40 insertions(+), 1 deletion(-)
> > > >  create mode 100644 block/sed-opal-key.c
> > > >  create mode 100644 include/linux/sed-opal-key.h
> > > >
> > > > diff --git a/block/Makefile b/block/Makefile
> > > > index 46ada9dc8bbf..ea07d80402a6 100644
> > > > --- a/block/Makefile
> > > > +++ b/block/Makefile
> > > > @@ -34,7 +34,7 @@ obj-$(CONFIG_BLK_DEV_ZONED) +=3D blk-zoned.o
> > > >  obj-$(CONFIG_BLK_WBT)                +=3D blk-wbt.o
> > > >  obj-$(CONFIG_BLK_DEBUG_FS)   +=3D blk-mq-debugfs.o
> > > >  obj-$(CONFIG_BLK_DEBUG_FS_ZONED)+=3D blk-mq-debugfs-zoned.o
> > > > -obj-$(CONFIG_BLK_SED_OPAL)   +=3D sed-opal.o
> > > > +obj-$(CONFIG_BLK_SED_OPAL)   +=3D sed-opal.o sed-opal-key.o
> > > >  obj-$(CONFIG_BLK_PM)         +=3D blk-pm.o
> > > >  obj-$(CONFIG_BLK_INLINE_ENCRYPTION)  +=3D blk-crypto.o blk-crypto-
> > > > profile.o \
> > > >                                          blk-crypto-sysfs.o
> > > > diff --git a/block/sed-opal-key.c b/block/sed-opal-key.c
> > > > new file mode 100644
> > > > index 000000000000..16f380164c44
> > > > --- /dev/null
> > > > +++ b/block/sed-opal-key.c
> > > > @@ -0,0 +1,24 @@
> > > > +// SPDX-License-Identifier: GPL-2.0-only
> > > > +/*
> > > > + * SED key operations.
> > > > + *
> > > > + * Copyright (C) 2022 IBM Corporation
> > > > + *
> > > > + * These are the accessor functions (read/write) for SED Opal
> > > > + * keys. Specific keystores can provide overrides.
> > > > + *
> > > > + */
> > > > +
> > > > +#include <linux/kernel.h>
> > > > +#include <linux/errno.h>
> > > > +#include <linux/sed-opal-key.h>
> > > > +
> > > > +int __weak sed_read_key(char *keyname, char *key, u_int *keylen)
> > > > +{
> > > > +     return -EOPNOTSUPP;
> > > > +}
> > > > +
> > > > +int __weak sed_write_key(char *keyname, char *key, u_int keylen)
> > > > +{
> > > > +     return -EOPNOTSUPP;
> > > > +}
> > >
> > > This change causes a build failure for certain clang configurations
> > > due
> > > to an unfortunate issue [1] with recordmcount, clang's integrated
> > > assembler, and object files that contain a section with only weak
> > > functions/symbols (in this case, the .text section in sed-opal-
> > > key.c),
> > > resulting in
> > >
> > >   Cannot find symbol for section 2: .text.
> > >   block/sed-opal-key.o: failed
> > >
> > > when building this file.
> >
> > The definitions in
> > block/sed-opal-key.c
> > should be deleted. Instead, in
> > include/linux/sed-opal-key.h
> > CONFIG_PSERIES_PLPKS_SED should be used to define static inline
> > versions when CONFIG_PSERIES_PLPKS_SED is not defined.
> >
> > #ifdef CONFIG_PSERIES_PLPKS_SED
> > int sed_read_key(char *keyname, char *key, u_int *keylen);
> > int sed_write_key(char *keyname, char *key, u_int keylen);
> > #else
> > static inline
> > int sed_read_key(char *keyname, char *key, u_int *keylen) {
> >   return -EOPNOTSUPP;
> > }
> > static inline
> > int sed_write_key(char *keyname, char *key, u_int keylen);
> >   return -EOPNOTSUPP;
> > }
> > #endif
>
> This change will certainly work for pseries. The intent of the weak
> functions was to allow a different unknown permanent keystore to be the
> source for seeding SED Opal keys. It also kept platform specific code
> out of the block directory.
>
> I'm happy to switch to the approach above, if losing those two goals
> isn't a concern.

Assuming those would have mutually exclusive KConfigs, then the
pattern I describe would be preferred.

>
> >
> > > Is there any real reason to have a separate translation unit for
> > > these
> > > two functions versus just having them living in sed-opal.c? Those
> > > two
> > > object files share the same Kconfig dependency. I am happy to send
> > > a
> > > patch if that is an acceptable approach.
> > >
> > > [1]: https://github.com/ClangBuiltLinux/linux/issues/981
> > >
> > > Cheers,
> > > Nathan
> > >
> >
> >
>


--=20
Thanks,
~Nick Desaulniers
