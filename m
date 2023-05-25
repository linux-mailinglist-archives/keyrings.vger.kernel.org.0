Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 95594711902
	for <lists+keyrings@lfdr.de>; Thu, 25 May 2023 23:25:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241134AbjEYVZQ (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 25 May 2023 17:25:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230290AbjEYVZP (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 25 May 2023 17:25:15 -0400
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com [IPv6:2607:f8b0:4864:20::1131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51A621A4
        for <keyrings@vger.kernel.org>; Thu, 25 May 2023 14:25:13 -0700 (PDT)
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-561e5014336so2125067b3.1
        for <keyrings@vger.kernel.org>; Thu, 25 May 2023 14:25:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1685049912; x=1687641912;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SwImV3hCdNQ/cPrrcGQnqX5yRqt1VqU5w9NHupD1Oqw=;
        b=ausE72tZUtVgq3OE6jbQbIa/leBFAJauIufQqHDIWfCOK4tCyZN5yxLDRb+KYU8/Zi
         oqAQZ2nr6BWCKdGk2hGXP86m3oMIGlkr3rbq9VZb31pmbTHapV845qHjkkZ1KojhqrIw
         JnDgGO+tJC8rU+QFwiO6vl/OV3Md+MSo+TCTLwUd6C1u8LrR68VK7NVhBIom/Jhp2IZK
         RJT3zzAtpRW/4ReAzrsVkdji92WSUVA3rPu/jj9UDFalEB4Cx6pHU+0uCb3Vc7zCnVt1
         Ql8Kf52bgRIh4hgzkiWx+dYbocVSSDq57/yRveM9eDaKW3mEQQzY3PY5OvGiXDPa7qbm
         mrEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685049912; x=1687641912;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SwImV3hCdNQ/cPrrcGQnqX5yRqt1VqU5w9NHupD1Oqw=;
        b=YwCwdS/+Wlxwv/7r+8+tXFmKq5gg7dNGVDbbjv4PmzwQx7iqnwomlLwNpt20rPF4gf
         Myxn0PYVBTmttr6VQZ8A86tjTj3RbjT1CDIqbz7c6fwPrGOkvrf11+hnRjF7n57oeryR
         i6P60bi680CjNCQray8+IEu6lEIOaU4VzYn3lGB3wCklO1RLdXNunPxhPBw9YFrno6xa
         4A29BHXSHZvCKVTs07atGd5ab6HC42gVRLQrueYiAq46NvkHLkp3voq/PluKxaFci8be
         5rKyRCUlzSNLQfYMsFqYc2cvGQCsfV9rqi9MIn0Sck/+pYYPogp6Z2aSI4tjpIMtDNq7
         H8vg==
X-Gm-Message-State: AC+VfDwMHlzcrcgPgalK0bAraIFDEAPeu5d3KtBEVnGi4sQEhV/rPHgh
        LQWMTvCh4zMRISEPx6w+hjlZ5uPwg9BkO9/2h3KY
X-Google-Smtp-Source: ACHHUZ6tdm6/gLqOUrZ5Geqc/0P5xwmBz4FTleHnApASZm8S5p/ciH5MUryggJKU3jHvSAobWc0g5dx0IAaX8ic7tMY=
X-Received: by 2002:a0d:d911:0:b0:561:cb5c:17ac with SMTP id
 b17-20020a0dd911000000b00561cb5c17acmr1091519ywe.27.1685049912500; Thu, 25
 May 2023 14:25:12 -0700 (PDT)
MIME-Version: 1.0
References: <20230511123252.723185-1-cgzones@googlemail.com>
 <CAHC9VhTcso+RTEOkGOCDxyMscznEXrUhp+quDWvATUhEzEOhRQ@mail.gmail.com> <CAJ2a_DfRGq+Cg_U7+Rsie9Bywxquu9CuMwYUGNv3+Sg9=wt9Og@mail.gmail.com>
In-Reply-To: <CAJ2a_DfRGq+Cg_U7+Rsie9Bywxquu9CuMwYUGNv3+Sg9=wt9Og@mail.gmail.com>
From:   Paul Moore <paul@paul-moore.com>
Date:   Thu, 25 May 2023 17:25:01 -0400
Message-ID: <CAHC9VhSbZ5YheAVec5a=Xht85mNu6wRjeYaoqPGSiHjFP2NN6Q@mail.gmail.com>
Subject: Re: [PATCH] security: keys: perform capable check only on privileged operations
To:     =?UTF-8?Q?Christian_G=C3=B6ttsche?= <cgzones@googlemail.com>,
        Jarkko Sakkinen <jarkko@kernel.org>
Cc:     selinux@vger.kernel.org, David Howells <dhowells@redhat.com>,
        James Morris <jmorris@namei.org>,
        "Serge E. Hallyn" <serge@hallyn.com>, keyrings@vger.kernel.org,
        linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Tue, May 23, 2023 at 2:33=E2=80=AFPM Christian G=C3=B6ttsche
<cgzones@googlemail.com> wrote:
> On Fri, 19 May 2023 at 23:08, Paul Moore <paul@paul-moore.com> wrote:
> > On Thu, May 11, 2023 at 8:33=E2=80=AFAM Christian G=C3=B6ttsche
> > <cgzones@googlemail.com> wrote:
> > >
> > > If the current task fails the check for the queried capability via
> > > `capable(CAP_SYS_ADMIN)` LSMs like SELinux generate a denial message.
> > > Issuing such denial messages unnecessarily can lead to a policy autho=
r
> > > granting more privileges to a subject than needed to silence them.
> > >
> > > Reorder CAP_SYS_ADMIN checks after the check whether the operation is
> > > actually privileged.
> > >
> > > Signed-off-by: Christian G=C3=B6ttsche <cgzones@googlemail.com>
> > > ---
> > >  security/keys/keyctl.c | 11 ++++++++---
> > >  1 file changed, 8 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/security/keys/keyctl.c b/security/keys/keyctl.c
> > > index d54f73c558f7..19be69fa4d05 100644
> > > --- a/security/keys/keyctl.c
> > > +++ b/security/keys/keyctl.c
> > > @@ -980,14 +980,19 @@ long keyctl_chown_key(key_serial_t id, uid_t us=
er, gid_t group)
> > >         ret =3D -EACCES;
> > >         down_write(&key->sem);
> > >
> > > -       if (!capable(CAP_SYS_ADMIN)) {
> > > +       {
> > > +               bool is_privileged_op =3D false;
> > > +
> > >                 /* only the sysadmin can chown a key to some other UI=
D */
> > >                 if (user !=3D (uid_t) -1 && !uid_eq(key->uid, uid))
> > > -                       goto error_put;
> > > +                       is_privileged_op =3D true;
> > >
> > >                 /* only the sysadmin can set the key's GID to a group=
 other
> > >                  * than one of those that the current process subscri=
bes to */
> > >                 if (group !=3D (gid_t) -1 && !gid_eq(gid, key->gid) &=
& !in_group_p(gid))
> > > +                       is_privileged_op =3D true;
> > > +
> > > +               if (is_privileged_op && !capable(CAP_SYS_ADMIN))
> > >                         goto error_put;
> > >         }
> >
> > Hmm.  Using braces just to create a new scope is a bit hacky; I'll
> > admit to using it to quickly create new local variables, but I only do
> > so in debug/test situations, not production code.
> >
> > What if you move the CAP_SYS_ADMIN check down into the if-conditional
> > where the code checks to see if CAP_SYS_ADMIN is needed when changing
> > the UID?  It should be possible to structure the CAP_SYS_ADMIN check
> > such that it is only executed if needed.  It's a little more
> > complicated in the GID case, but I believe it should be doable.
>
> This complication I exactly wanted to avoid.  For me the inner scope
> encapsulates the all the logic around the capability check just fine
> and is quite readable.  An alternative would be to create a new
> function performing the checks and call it via
>
>     if (!chown_key_capable(key, user, uid, group, gid))
>         got error_put;
>
> A minor inconvenience is the number of needed arguments (and the
> actual code after inlining should be the same to the inner scope in
> the end).

Well, lucky for you, Jarkko and David maintain the keys code, not me,
and Jarkko seems to like your patch just fine :)

Jarkko, I assume you'll be taking this via the keys tree?

--=20
paul-moore.com
