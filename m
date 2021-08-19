Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A9EE33F1EC8
	for <lists+keyrings@lfdr.de>; Thu, 19 Aug 2021 19:10:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231411AbhHSRLJ (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 19 Aug 2021 13:11:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230459AbhHSRLI (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 19 Aug 2021 13:11:08 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA92CC061575;
        Thu, 19 Aug 2021 10:10:31 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id z2so14499901lft.1;
        Thu, 19 Aug 2021 10:10:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Rt9r8foKOvZ5SSHXtY6wyrnjmVskOSD8TkF1Gg1rNU0=;
        b=gAJy411CGDX+HFRkV9Ei2t/kwmWFWaHD+xZTKJozq8ZgAhoy9r205hC0gn6uaPmctx
         X19n6w9YjwM7ZKcADbpS/4PvFoNhAucsZ76nk6gC5snqN2+Q7BOiFnXcrve9Cb74uU8z
         8hbwgxkpc9ynXrMD+UYpyp/NF0V1K3cEYrBorYLpZlvS4dhWAYMc8giIwTdgBA/jLXFy
         U4D0DqJddetkAEEA0RajHL++S77wp8fIvwBRlrQTT8LhDL7UCGvIv98cYmg6YuMoOtQE
         SqnLM2zp2kPm2VcFcm4eeB6bP8X0DmJNziyg0eOFQNu9u+1iuqPMS89LIf3hQsK4ph2o
         c2aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Rt9r8foKOvZ5SSHXtY6wyrnjmVskOSD8TkF1Gg1rNU0=;
        b=PojjqovzE8/PUds5gVRoXbQT/c+i0SIqJYVVJOG+Es2Ra2zi5Y9+JPrXTcpqVZa+NZ
         2o3VMFtELlsODfg88ezdYNxNGji7mxmc0cVzZegDqkeY1DskT3YPG3L5W3V/Tx1ddp4l
         s8LEgKGZeIPf4X3bGUyAVfCFO5l0FWb1m4/kKvBwDuc9Ow0/uOFBckMjVFREV+V0BFH+
         u+RO/TjrGGJmfKb4N2hB4nY8LOQlpy/+qTGCtTgAr5FPdQuFlecbGk4mlt8SeznaqPeG
         eS13TdG2/xVCP6fFN612c5zfaK9NiVWglCmSis50PT6b8HDh2Ld56L1MZsBjhw7NjAYG
         Vhzg==
X-Gm-Message-State: AOAM533u4hGqtN051z5niyffs2APet22XRnLhxPEDM+D91oBWmx1ScFd
        qTdeM8dO/Ovtoj6pB3b3j0/nSBXyamgMVRnODm8=
X-Google-Smtp-Source: ABdhPJwRmM2SdGcXYA+7pfMJAJ60TZ/eAP/4ZABuOl1fhOc+0mAmvPCgSh8qEW2NeVclfDYVIO8LwcvPMtgsVZZfzps=
X-Received: by 2002:a19:c796:: with SMTP id x144mr11188920lff.395.1629393030147;
 Thu, 19 Aug 2021 10:10:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210818144617.110061-1-ardb@kernel.org> <946591db-36aa-23db-a5c4-808546eab762@gmail.com>
 <CAMj1kXEjHojAZ0_DPkogHAbmS6XAOFN3t8-4VB0+zN8ruTPVCg@mail.gmail.com> <1cbfe2bbb46ab48bf6dddee9a15a7c04c99db8f7.camel@kernel.org>
In-Reply-To: <1cbfe2bbb46ab48bf6dddee9a15a7c04c99db8f7.camel@kernel.org>
From:   Steve French <smfrench@gmail.com>
Date:   Thu, 19 Aug 2021 12:10:19 -0500
Message-ID: <CAH2r5mv59hrujeJzReUsYtGkTQ7VH01L7FKH5rUpdmJW92HHCA@mail.gmail.com>
Subject: Re: [PATCH 0/2] crypto: remove MD4 generic shash
To:     Jarkko Sakkinen <jarkko@kernel.org>
Cc:     Ard Biesheuvel <ardb@kernel.org>,
        Denis Kenzior <denkenz@gmail.com>,
        Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Eric Biggers <ebiggers@kernel.org>,
        ronnie sahlberg <ronniesahlberg@gmail.com>,
        linux-cifs <linux-cifs@vger.kernel.org>,
        Steve French <sfrench@samba.org>,
        David Howells <dhowells@redhat.com>, keyrings@vger.kernel.org,
        Shyam Prasad N <nspmangalore@gmail.com>,
        Andrew Bartlett <abartlet@samba.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Thu, Aug 19, 2021 at 5:42 AM Jarkko Sakkinen <jarkko@kernel.org> wrote:
>
> On Wed, 2021-08-18 at 18:10 +0200, Ard Biesheuvel wrote:
> > On Wed, 18 Aug 2021 at 16:51, Denis Kenzior <denkenz@gmail.com>
> > wrote:
> > > Hi Ard,
> > >
> > > On 8/18/21 9:46 AM, Ard Biesheuvel wrote:
> > > > As discussed on the list [0], MD4 is still being relied upon by
> > > > the CIFS
> > > > driver, even though successful attacks on MD4 are as old as Linux
> > > > itself.
> > > >
> > > > So let's move the code into the CIFS driver, and remove it from
> > > > the
> > > > crypto API so that it is no longer exposed to other subsystems or
> > > > to
> > > > user space via AF_ALG.
> > > >
> > >
> > > Can we please stop removing algorithms from AF_ALG?
> >
> > I don't think we can, to be honest. We need to have a deprecation
> > path
> > for obsolete and insecure algorithms: the alternative is to keep
> > supporting a long tail of broken crypto indefinitely.
>
> I think you are ignoring the fact that by doing that you might be
> removing a migration path to more secure algorithms, for some legacy
> systems.
>
> I.e. in some cases this might mean sticking to insecure algorithm *and*
> old kernel for unnecessary long amount of time because migration is
> more costly.
>
> Perhaps there could be a comman-line parameter or similar to enable
> legacy crypto?

There are.   For example less secure NTLMv1 is disabled in the build.
On the command line "sec=krb5" will use kerberos, and we can move that
to be the default,
or at least autonegotiate it, but will require some minor changes to
cifs-utils to detect if
plausible Kerberos ticket is available for this mount before
requesting krb5 automatically.

But ... we already have parameters to disable SMB1, and in fact if you
mount with
"mount -t smb3 ..." we won't let you use SMB1 or SMB2 so we get the
security advantages
of preventing man-in-the-middle attacks during negotiation and encryption etc.
In addition, SMB1 can be disabled completely by simply doing

"echo 1  > /sys/module/cifs/parameters/disable_legacy_dialects"

but even without that, to mount insecurely with SMB1 requires
specifying it (vers=1.0) on the command line.

In addition requiring the strongest encryption can be set by

"echo 1 > /sys/module/parameters/cifs/require_gcm_256"


Although moving to a peer to peer auth solution better than NTLMSSP is
something important to do ASAP
(we should follow up e.g. on making sure we work with the "peer to
peer Kerberos" (which is used by Apple
for this purpose) see e.g.
https://discussions-cn-prz.apple.com/en/thread/252949265)

Andrew Bartlett's note explains the bigger picture well:

"I would echo that, and also just remind folks that MD4 in NTLMSSP is
used as a compression only, it has no security value.  The security
would be the same if the password was compressed with MD4, SHA1 or
SHA256 - the security comes from the complexity of the password and the
HMAC-MD5 rounds inside NTLMv2.

I'll also mention the use of MD4, which is used to re-encrypt a short-
term key with the long-term key out of the NTLMv2 scheme.  This
thankfully is an unchecksumed simple RC4 round of one random value with
another, so not subject to known-plaintext attacks here. I know neither
MD4 nor HMAC-MD5 is not flavour of the month any more,
with good reason, but we would not want to go with way of NFSv4 which
is, as I understand it, full Kerberos or bust (so folks choose no
protection)."

"Thankfully only the HMAC-MD5 step in what you mention is
cryptographically significant, the rest are just very lossy compression
algorithms."



--
Thanks,

Steve
