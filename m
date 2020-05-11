Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5851A1CE79A
	for <lists+keyrings@lfdr.de>; Mon, 11 May 2020 23:41:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725912AbgEKVlm (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Mon, 11 May 2020 17:41:42 -0400
Received: from mail.zx2c4.com ([192.95.5.64]:34659 "EHLO mail.zx2c4.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725860AbgEKVll (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Mon, 11 May 2020 17:41:41 -0400
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1a5631ff
        for <keyrings@vger.kernel.org>;
        Mon, 11 May 2020 21:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
        :references:in-reply-to:from:date:message-id:subject:to:cc
        :content-type; s=mail; bh=j4FycMwidlQ6IKag2VUkMXIbW38=; b=0St7aj
        +n3YMOdGYwo1TV6LnPuyAJTAmhlInyZPK1XOh55yI3C6WEVnpAjb7OfaHIy6U+f3
        IcKXyoEgrS9OoitJQXonMh17/ofsWx4pXW13NS7qVSHLba3qIEFfQvFQsN2DUdmy
        iqaFyM9t5e+npaoOvQALxi7oYEiqzbUuQP+UsCUf4xDS0m7zOQzRFcfUnIwXtj0z
        dCBB4dYBFcX1ZUyEBP+elrsZbaf6sSllqKSiIpy/klRbb9Q30mmyd5/btNVBxD/1
        odQ/VScn1PXQn3qKvQeUpdoJr+HrIToc6onhmXqjiP81lczIno39FlLyrygGO/Z4
        NcInansAFZ+jh8RQ==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id dfdd03ae (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
        for <keyrings@vger.kernel.org>;
        Mon, 11 May 2020 21:28:17 +0000 (UTC)
Received: by mail-il1-f182.google.com with SMTP id c18so10243197ile.5
        for <keyrings@vger.kernel.org>; Mon, 11 May 2020 14:41:38 -0700 (PDT)
X-Gm-Message-State: AGi0PuY5vx7i8le/IidLyxJqBvTuAU9Py6xvPFElk99NTUDutRgr2cEP
        D5Bj97ciCCUOJUeXMzdnxuIC/0/xS2Hes4LiL50=
X-Google-Smtp-Source: APiQypJBPLVHh+khEqzaRN4BTLpEuERK6fnjt+5kSc4dHWU4I3WSPSVGkvIWG2WX6VYfjyn5bioAW45CFYQfoy9n4Nw=
X-Received: by 2002:a92:8752:: with SMTP id d18mr486885ilm.224.1589233297940;
 Mon, 11 May 2020 14:41:37 -0700 (PDT)
MIME-Version: 1.0
References: <CAHmME9rvp4JrER0RPp=VgYwYL87jntwW8vWNANzubH3Ah_8Oow@mail.gmail.com>
 <20200502001942.626523-1-Jason@zx2c4.com> <20200510211738.GA52708@sol.localdomain>
In-Reply-To: <20200510211738.GA52708@sol.localdomain>
From:   "Jason A. Donenfeld" <Jason@zx2c4.com>
Date:   Mon, 11 May 2020 15:41:27 -0600
X-Gmail-Original-Message-ID: <CAHmME9oXiTmVuOYmG=K3ijWK+zP2yB9a2CFjbLx_5fkDiH30Tg@mail.gmail.com>
Message-ID: <CAHmME9oXiTmVuOYmG=K3ijWK+zP2yB9a2CFjbLx_5fkDiH30Tg@mail.gmail.com>
Subject: Re: [PATCH v2] security/keys: rewrite big_key crypto to use Zinc
To:     Eric Biggers <ebiggers@kernel.org>
Cc:     David Howells <dhowells@redhat.com>, keyrings@vger.kernel.org,
        Andy Lutomirski <luto@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        kernel-hardening@lists.openwall.com
Content-Type: text/plain; charset="UTF-8"
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Sun, May 10, 2020 at 3:17 PM Eric Biggers <ebiggers@kernel.org> wrote:
> The commit message should say "lib/crypto", not Zinc.  Nothing in the source
> tree actually says Zinc, so it will confuse people who haven't read all the
> previous discussions.

Old commit message from a few years ago. Will adjust.

>
> >               /* read file to kernel and decrypt */
> > -             ret = kernel_read(file, buf->virt, enclen, &pos);
> > +             ret = kernel_read(file, buf, enclen, &pos);
> >               if (ret >= 0 && ret != enclen) {
> >                       ret = -EIO;
> >                       goto err_fput;
> > +             } else if (ret < 0) {
> > +                     goto err_fput;
> >               }
>
> It would make sense to write this as the following, to make it consistent with
> how the return value of kernel_write() is checked in big_key_preparse():
>
>                 ret = kernel_read(file, buf, enclen, &pos);
>                 if (ret != enclen) {
>                         if (ret >= 0)
>                                 ret = -ENOMEM;
>                         goto err_fput;
>                 }

Will do, and will send a v3 with your reviewed-by.

Jason
