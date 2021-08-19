Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6096F3F21F3
	for <lists+keyrings@lfdr.de>; Thu, 19 Aug 2021 22:55:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235105AbhHSUzl (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 19 Aug 2021 16:55:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230112AbhHSUzl (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 19 Aug 2021 16:55:41 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F7C1C061575;
        Thu, 19 Aug 2021 13:55:04 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id i6so10782867edu.1;
        Thu, 19 Aug 2021 13:55:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Fu4yiy3AdpwUCvHBML2Yz3vXweroU4C9d+Qt5DyD9jw=;
        b=ErZvoegxJ1AeS50zyQW/bSWsBaIFiMo5EkTIGhIpN605bIY/48tRRFkv3KKdN4LKyL
         zpkrVwzFpqJeQwTxKOuL7TEBLZw0ibGnZQpLINxHJTrUJlyX7z/nNf42t8YLqJqrHxeK
         uoaqeB3uM3kCu/AQWn8iBD/ivv3RVNQKOWcBwrcEi9hqgOpj+KGD8qz3T2n2NNyW2Y+d
         ImNa/mvqoEU+kn7AnlOW2qVXv7W3dXXuWnXnUrsbDPx2+6fPVqBPWxX9FWKx8eS52NNY
         TK0GULfbJQMA846MjgWTcp98hhr1RAokd1QVtC4FNMLUM76w+A5jjNEAo2p0nqdynt1g
         Zx+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Fu4yiy3AdpwUCvHBML2Yz3vXweroU4C9d+Qt5DyD9jw=;
        b=MnC6uoIvzXUN1jw3Ob1NTywNQqk2kNliygQlMtpQg8d9xlw+f+6DKtuGuNwb8X/NF+
         oN2OEEcHDsi/i2bsH5Be5eno7wePyVtFqklE0tLJgE3LOdtL3f93MK7lLurzejwqduRH
         UUGf4p6jMuFS2DbiljUsMKV1aSE5tYr+hgIwmlC7lGhQuoO4Tw6n4ZK1hBrBgO10yyrI
         SfLrP0oJMYCnLNWk4X97dcqQvqcq/9aZM/KWvEnxCd1x0T5sBB8EobTsyxSxYClw8pU3
         //wON+3EZOlanMwtPFh1RaTjRFQzaIjYgVfqNqDfnW30hojI042s/by/j8uMSDqRd01H
         U+Sw==
X-Gm-Message-State: AOAM5324J7WlLvSqtlWPNK3NIEPlLFDaGTGCMfn7OVQpok0SO2SSCweU
        XYDOankX+IFV//ZKeEvrZu/t9k8e9LFdOR6Z9k4=
X-Google-Smtp-Source: ABdhPJwrmXHkch9lzr152Aim8ThMHI8tpPrqRQ2ZcNrTi2HimZb860dIBPsTs+4qFo+At9j/9FnpdzrnXI6Rio0AVUc=
X-Received: by 2002:a05:6402:b7a:: with SMTP id cb26mr18511036edb.33.1629406503028;
 Thu, 19 Aug 2021 13:55:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210818144617.110061-1-ardb@kernel.org> <946591db-36aa-23db-a5c4-808546eab762@gmail.com>
 <CAMj1kXEjHojAZ0_DPkogHAbmS6XAOFN3t8-4VB0+zN8ruTPVCg@mail.gmail.com>
 <1cbfe2bbb46ab48bf6dddee9a15a7c04c99db8f7.camel@kernel.org> <CAH2r5mv59hrujeJzReUsYtGkTQ7VH01L7FKH5rUpdmJW92HHCA@mail.gmail.com>
In-Reply-To: <CAH2r5mv59hrujeJzReUsYtGkTQ7VH01L7FKH5rUpdmJW92HHCA@mail.gmail.com>
From:   ronnie sahlberg <ronniesahlberg@gmail.com>
Date:   Fri, 20 Aug 2021 06:54:51 +1000
Message-ID: <CAN05THTBE6inHnY3JZ6-+HF-wz9You1-iC7PGAJ1=fCoxuVO0g@mail.gmail.com>
Subject: Re: [PATCH 0/2] crypto: remove MD4 generic shash
To:     Steve French <smfrench@gmail.com>
Cc:     Jarkko Sakkinen <jarkko@kernel.org>,
        Ard Biesheuvel <ardb@kernel.org>,
        Denis Kenzior <denkenz@gmail.com>,
        Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Eric Biggers <ebiggers@kernel.org>,
        linux-cifs <linux-cifs@vger.kernel.org>,
        Steve French <sfrench@samba.org>,
        David Howells <dhowells@redhat.com>, keyrings@vger.kernel.org,
        Shyam Prasad N <nspmangalore@gmail.com>,
        Andrew Bartlett <abartlet@samba.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Fri, Aug 20, 2021 at 3:10 AM Steve French <smfrench@gmail.com> wrote:
>
> On Thu, Aug 19, 2021 at 5:42 AM Jarkko Sakkinen <jarkko@kernel.org> wrote:
> >
> > On Wed, 2021-08-18 at 18:10 +0200, Ard Biesheuvel wrote:
> > > On Wed, 18 Aug 2021 at 16:51, Denis Kenzior <denkenz@gmail.com>
> > > wrote:
> > > > Hi Ard,
> > > >
> > > > On 8/18/21 9:46 AM, Ard Biesheuvel wrote:
> > > > > As discussed on the list [0], MD4 is still being relied upon by
> > > > > the CIFS
> > > > > driver, even though successful attacks on MD4 are as old as Linux
> > > > > itself.
> > > > >
> > > > > So let's move the code into the CIFS driver, and remove it from
> > > > > the
> > > > > crypto API so that it is no longer exposed to other subsystems or
> > > > > to
> > > > > user space via AF_ALG.
> > > > >
> > > >
> > > > Can we please stop removing algorithms from AF_ALG?
> > >
> > > I don't think we can, to be honest. We need to have a deprecation
> > > path
> > > for obsolete and insecure algorithms: the alternative is to keep
> > > supporting a long tail of broken crypto indefinitely.
> >
> > I think you are ignoring the fact that by doing that you might be
> > removing a migration path to more secure algorithms, for some legacy
> > systems.
> >
> > I.e. in some cases this might mean sticking to insecure algorithm *and*
> > old kernel for unnecessary long amount of time because migration is
> > more costly.
> >
> > Perhaps there could be a comman-line parameter or similar to enable
> > legacy crypto?
>
> There are.   For example less secure NTLMv1 is disabled in the build.
> On the command line "sec=krb5" will use kerberos, and we can move that
> to be the default,
> or at least autonegotiate it, but will require some minor changes to
> cifs-utils to detect if
> plausible Kerberos ticket is available for this mount before
> requesting krb5 automatically.
>
> But ... we already have parameters to disable SMB1, and in fact if you
> mount with
> "mount -t smb3 ..." we won't let you use SMB1 or SMB2 so we get the
> security advantages
> of preventing man-in-the-middle attacks during negotiation and encryption etc.
> In addition, SMB1 can be disabled completely by simply doing
>
> "echo 1  > /sys/module/cifs/parameters/disable_legacy_dialects"
>
> but even without that, to mount insecurely with SMB1 requires
> specifying it (vers=1.0) on the command line.
>
> In addition requiring the strongest encryption can be set by
>
> "echo 1 > /sys/module/parameters/cifs/require_gcm_256"
>
>
> Although moving to a peer to peer auth solution better than NTLMSSP is
> something important to do ASAP

Agreed. We need a new peer-to-peer authentication mechanism.
But this is storage so things move slowly and we can't remove a feature
that hundreds of millions of people depend on and break their environments
just because "need tickbox".

As an example of how long it takes to migrate to a different solution
in mass deployed storage technologies
just look at SMB1. The whole industry has been working hard and as
fast as possible to move away from
SMB1 since 2006 and we are still NOT at the stage where we can delete
this functionality.
Disable it by default for some configurations but delete? No.

Even if we get a new peer-to-peer mechanism today, it will take up to
20 years before we will be able to delete
MD4 support in the linux kernel for CIFS.   Unless we want a wildly
disruptive event where we either
break storage for hundreds of millions of people   or we force them to
remain on 5.13 for the next 20 years.

Storage is not the same as a cell-phone,  or some consumer device
where you can drop support or break them
every few years.  The timelines for migrating in storage is measured in decades.


But I guess we will have a loadable module for MD4 in cifs that both
the cifs client and the cifs server will be able to use.
Other subsystems that have hard dependency on MD4 and can not just
break their users can probably also just
use the cifs_md4 module too if they want to.
At least we can try to avoid a situation where we will have multiple
different MD4 implementations for the next decade or two in the
kernel.


> (we should follow up e.g. on making sure we work with the "peer to
> peer Kerberos" (which is used by Apple
> for this purpose) see e.g.
> https://discussions-cn-prz.apple.com/en/thread/252949265)
>
> Andrew Bartlett's note explains the bigger picture well:
>
> "I would echo that, and also just remind folks that MD4 in NTLMSSP is
> used as a compression only, it has no security value.  The security
> would be the same if the password was compressed with MD4, SHA1 or
> SHA256 - the security comes from the complexity of the password and the
> HMAC-MD5 rounds inside NTLMv2.
>
> I'll also mention the use of MD4, which is used to re-encrypt a short-
> term key with the long-term key out of the NTLMv2 scheme.  This
> thankfully is an unchecksumed simple RC4 round of one random value with
> another, so not subject to known-plaintext attacks here. I know neither
> MD4 nor HMAC-MD5 is not flavour of the month any more,
> with good reason, but we would not want to go with way of NFSv4 which
> is, as I understand it, full Kerberos or bust (so folks choose no
> protection)."
>
> "Thankfully only the HMAC-MD5 step in what you mention is
> cryptographically significant, the rest are just very lossy compression
> algorithms."
>
>
>
> --
> Thanks,
>
> Steve
