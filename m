Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 83A382FAF5
	for <lists+keyrings@lfdr.de>; Thu, 30 May 2019 13:35:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726515AbfE3LfR (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 30 May 2019 07:35:17 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:41923 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726232AbfE3LfR (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 30 May 2019 07:35:17 -0400
Received: by mail-ot1-f66.google.com with SMTP id l25so5251363otp.8
        for <keyrings@vger.kernel.org>; Thu, 30 May 2019 04:35:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LVnce3jB8qedAfJGJ7Bmf8R/L8NNVzJuyZ0yFdQiU5Q=;
        b=k6MoCJPC3+jJ/kOsSY4Luizts3pUunh6CG5+kGmpg6AXQyjg15vjVlAVaYMVndrqaj
         cFTJxYilaJUZGZ+cQQe5E3MybyTXlQ58Ia/gVdx5QTQHEK9owVoNcTMIdmwNHOdSXoYG
         zbFLJS2Isb1tXT8RWpxIeJ1E6QGSNqPVXEjuJwlt3b1uiFqJOHdkXeRk+GjHS8cpqr9w
         Zq8WGvCgDgWuvuybEJCzfwDymJRhYoGZxwM9mZJZdaH6+ujc29aJkEJsu90e86SYKUg3
         H31D8zVbGe1IbM4CYPr+FRH38XHiVh4tFhvHWNGhy1MXwvyTG6I/VG8oWwp5AuUj48R1
         rpzQ==
X-Gm-Message-State: APjAAAUeVncVo+ybn4bQRuCdGrZjAs3Hw4ZHVHo11ZSV1Pl8g64kKP6Q
        PR0o3vFAkWWT+/qWXAfxpkT4Cl9kO2SMoImCQfcXGg==
X-Google-Smtp-Source: APXvYqze9D0B23wAuYwPwVSUg4KoI4VYR+x3k6uO1ZDTdbleukYCFOCnMP4fmD+qvZtLk+kEdKys8ine8a7dSGo2WTk=
X-Received: by 2002:a05:6830:154c:: with SMTP id l12mr2185607otp.66.1559216117035;
 Thu, 30 May 2019 04:35:17 -0700 (PDT)
MIME-Version: 1.0
References: <20190521100034.9651-1-omosnace@redhat.com> <20190530071400.jpadh2fjjaqzyw6m@gondor.apana.org.au>
In-Reply-To: <20190530071400.jpadh2fjjaqzyw6m@gondor.apana.org.au>
From:   Ondrej Mosnacek <omosnace@redhat.com>
Date:   Thu, 30 May 2019 13:35:06 +0200
Message-ID: <CAFqZXNt0NP090oKtF3Zsq4bvvZ7peH8YNBa-9hiqk_AAXgc0kQ@mail.gmail.com>
Subject: Re: [PATCH] crypto: af_alg - implement keyring support
To:     Herbert Xu <herbert@gondor.apana.org.au>
Cc:     linux-crypto@vger.kernel.org, keyrings@vger.kernel.org,
        David Howells <dhowells@redhat.com>,
        Stephan Mueller <smueller@chronox.de>,
        Milan Broz <gmazyland@gmail.com>,
        Ondrej Kozina <okozina@redhat.com>,
        Daniel Zatovic <dzatovic@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Thu, May 30, 2019 at 10:12 AM Herbert Xu <herbert@gondor.apana.org.au> wrote:
> On Tue, May 21, 2019 at 12:00:34PM +0200, Ondrej Mosnacek wrote:
> >
> > @@ -256,6 +362,48 @@ static int alg_setsockopt(struct socket *sock, int level, int optname,
> >                       goto unlock;
> >
> >               err = alg_setkey(sk, optval, optlen);
> > +#ifdef CONFIG_KEYS
> > +             break;
> > +     case ALG_SET_KEY_KEYRING_LOGON:
> > +             if (sock->state == SS_CONNECTED)
> > +                     goto unlock;
> > +             if (!type->setkey)
> > +                     goto unlock;
> > +
> > +             err = alg_setkey_keyring(sk, &alg_keyring_type_logon,
> > +                                      optval, optlen);
> > +             break;
> > +     case ALG_SET_KEY_KEYRING_USER:
> > +             if (sock->state == SS_CONNECTED)
> > +                     goto unlock;
> > +             if (!type->setkey)
> > +                     goto unlock;
> > +
> > +             err = alg_setkey_keyring(sk, &alg_keyring_type_user,
> > +                                      optval, optlen);
> > +#if IS_REACHABLE(CONFIG_TRUSTED_KEYS)
> > +             break;
> > +     case ALG_SET_KEY_KEYRING_TRUSTED:
> > +             if (sock->state == SS_CONNECTED)
> > +                     goto unlock;
> > +             if (!type->setkey)
> > +                     goto unlock;
> > +
> > +             err = alg_setkey_keyring(sk, &alg_keyring_type_trusted,
> > +                                      optval, optlen);
> > +#endif
> > +#if IS_REACHABLE(CONFIG_ENCRYPTED_KEYS)
> > +             break;
> > +     case ALG_SET_KEY_KEYRING_ENCRYPTED:
> > +             if (sock->state == SS_CONNECTED)
> > +                     goto unlock;
> > +             if (!type->setkey)
> > +                     goto unlock;
> > +
> > +             err = alg_setkey_keyring(sk, &alg_keyring_type_encrypted,
> > +                                      optval, optlen);
> > +#endif
> > +#endif /* CONFIG_KEYS */
> >               break;
>
> What's with the funky placement of "break" outside of the ifdefs?

I swear that checkpatch.pl was complaining when I did it the normal
way, but now I tried it again and it isn't complaining anymore...
Perhaps in the meantime I rebased onto a more recent tree where this
checkpatch.pl quirk has been fixed... I'll remove the funk in future
revisions.

>
> > diff --git a/include/uapi/linux/if_alg.h b/include/uapi/linux/if_alg.h
> > index bc2bcdec377b..f2d777901f00 100644
> > --- a/include/uapi/linux/if_alg.h
> > +++ b/include/uapi/linux/if_alg.h
> > @@ -35,6 +35,13 @@ struct af_alg_iv {
> >  #define ALG_SET_OP                   3
> >  #define ALG_SET_AEAD_ASSOCLEN                4
> >  #define ALG_SET_AEAD_AUTHSIZE                5
> > +#define ALG_SET_PUBKEY                       6 /* reserved for future use */
> > +#define ALG_SET_DH_PARAMETERS                7 /* reserved for future use */
> > +#define ALG_SET_ECDH_CURVE           8 /* reserved for future use */
>
> Why do you need to reserve these values?

Because libkcapi already assumes these values [1] and has code that
uses them. Reserving will allow existing builds of libkcapi to work
correctly once the functionality actually lands in the kernel (if that
ever happens). Of course, it is libkcapi's fault to assume values for
these symbols (in released code) before they are commited in the
kernel, but it seemed easier to just add them along with this patch
rather than creating a confusing situation.

[1] https://github.com/smuellerDD/libkcapi/blob/master/lib/internal.h#L54

-- 
Ondrej Mosnacek <omosnace at redhat dot com>
Software Engineer, Security Technologies
Red Hat, Inc.
