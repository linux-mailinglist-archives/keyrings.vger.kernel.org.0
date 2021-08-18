Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 384673F098E
	for <lists+keyrings@lfdr.de>; Wed, 18 Aug 2021 18:48:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232260AbhHRQsn (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 18 Aug 2021 12:48:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231898AbhHRQsl (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 18 Aug 2021 12:48:41 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 244CFC061764;
        Wed, 18 Aug 2021 09:48:06 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id x7so6191333ljn.10;
        Wed, 18 Aug 2021 09:48:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=N08ta0qJtTIK2gf8OVCv2MEM25Im0AdpsA2h7pD3mlA=;
        b=V/+AE2XTC8I9VQ9Pd8Xbngz+mF0PVQyETlVella1bkh2yP/YPaUwCEpCLF83twzyB7
         VYwQ5O4EzyccNtxDKA+GACdX5yOiMXOKjQWwivafE/xI28TqwUrTnGEjXb80G1UQd6BC
         JtJayBd4G/8XvWoMB1NIaHWVfzNPci7mWGBCaIl+zDKd56cH0UY5XJqd0ZbkZPOf+bLh
         fhr1EdBaLqBPeeNpCZvRO+xUxH09jRhUKzVGiO61yZnANMO5VN/iSxv8GLKiZ0iy5kO5
         dHUPoj2aY1m8EMZgmUKgCMpPvn1fnFWH6AD7XHb7RGqGAYHO7/zYG0OEL658lVZ2Y+bK
         +i1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=N08ta0qJtTIK2gf8OVCv2MEM25Im0AdpsA2h7pD3mlA=;
        b=NqLirxL9hTJT9etqJo3NE2qEqrNgP5sPsi46XOG0djU75gKdM2/POfm5W24JagKE6t
         xEmddiKJXrqmmkuKOkBA5Rl35GxFQcPhnB7uf+y92yUbM5RDVMU1kntewUTahmWkPovj
         VQ4r8PGSMK+u81j5OsPmpdlUr8swyr+0mIYZpyTT8lYmbDmkGXu1p+YqWyygxz9qncvh
         97Dv0Y+Dl23VJ/1xG7X2c3mNQg8hsfCAoERWCRYyMThxHUMNqIiT4ce+cEEDAV3oiTc1
         j8CKJuN6pU+OSxXyxldoLTc6iVXbLwqGIm5qXTOX8xPYFB0a/LBo6GKPiAQgM7Dse3fr
         wnig==
X-Gm-Message-State: AOAM532DTiqdhw0y/o5nPl75bjZ964DnQVeK7M1Lj5QAq4RCXronZWq1
        SEVOtprEtktoB5Yc51HZborSXlD1dX/EpC7Og7w=
X-Google-Smtp-Source: ABdhPJz0FVreExo7WwuVhK/RQgop4u87aHGeFStCLc3cV/q8Zv+pzdid5j/0qiQ5MdnAp3Wa8+SrbPw5YHkAhJ6evjE=
X-Received: by 2002:a2e:8e62:: with SMTP id t2mr8930768ljk.477.1629305284395;
 Wed, 18 Aug 2021 09:48:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210818144617.110061-1-ardb@kernel.org> <946591db-36aa-23db-a5c4-808546eab762@gmail.com>
 <CAMj1kXEjHojAZ0_DPkogHAbmS6XAOFN3t8-4VB0+zN8ruTPVCg@mail.gmail.com> <24606605-71ae-f918-b71a-480be7d68e43@gmail.com>
In-Reply-To: <24606605-71ae-f918-b71a-480be7d68e43@gmail.com>
From:   Steve French <smfrench@gmail.com>
Date:   Wed, 18 Aug 2021 11:47:53 -0500
Message-ID: <CAH2r5muhHnrAbu-yX3h1VPjW+2CUyUtSCzyoOs7MXw=fE7HA_Q@mail.gmail.com>
Subject: Re: [PATCH 0/2] crypto: remove MD4 generic shash
To:     Denis Kenzior <denkenz@gmail.com>
Cc:     Ard Biesheuvel <ardb@kernel.org>,
        Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Eric Biggers <ebiggers@kernel.org>,
        ronnie sahlberg <ronniesahlberg@gmail.com>,
        linux-cifs <linux-cifs@vger.kernel.org>,
        Steve French <sfrench@samba.org>,
        David Howells <dhowells@redhat.com>, keyrings@vger.kernel.org,
        samba-technical <samba-technical@lists.samba.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

I don't object to moving ARC4 and/or MD4 into cifs.ko, but we do have
to be careful that we don't make the defaults "less secure" as an
unintentional side effect.

The use of ARC4 and MD4 is the NTLMSSP authentication workflow is
relatively small (narrow use case), and NTLMSSP is the default for
many servers and clients - and some of the exploits do not apply in
the case of SMB2.1 and later (which is usually required on mount in
any case).

There is little argument that kerberos ("sec=krb5") is more secure and
does not rely on these algorithms ... but there are millions of
devices (probably over 100 million) that can support SMB3.1.1 (or at
least SMB3) mounts but couldn't realistically join a domain and use
"sec=krb5" so would be forced to use "guest" mounts (or in the case of
removing RC4 use less secure version of NTLMSSP).

In the longer term where I would like this to go is:
- make it easier to "require Kerberos" (in module load parameters for cifs.ko)
- make sure cifs.ko builds even if these algorithms are removed from
the kernel, and that mount by default isn't broken if the user chooses
to build without support for NTLMSSP, the default auth mechanism (ie
NTLMSSP being disabled because required crypto algorithms aren't
available)
- add support in Linux for a "peer to peer" auth mechanism (even if it
requires an upcall), perhaps one that is certificate based and one
that is not (and thus much easier to use) that we can plumb into
SPNEGO (RFC2478).    By comparison, it sounds like it is much easier
in Windows to add in additional authentication mechanisms (beyond
Kerberos, PKU2U and NTLMSSP) - see
https://docs.microsoft.com/en-us/previous-versions/windows/it-pro/windows-server-2012-r2-and-2012/jj852232(v=ws.11)
so perhaps we just need to do something similar for the kernel client
and samba and ksmbd where they call out to a library which is
configured to provide the SPNEGO blobs for the new stronger
peer-to-peer authentication mechanism the distro chooses to enable
(for cases where using Kerberos for authentication is not practical)

On Wed, Aug 18, 2021 at 11:24 AM Denis Kenzior <denkenz@gmail.com> wrote:
>
> Hi Ard,
>
> >>   The previous ARC4 removal
> >> already caused some headaches [0].
> >
> > This is the first time this has been reported on an upstream kernel list.
> >
> > As you know, I went out of my way to ensure that this removal would
> > happen as smoothly as possible, which is why I contributed code to
> > both iwd and libell beforehand, and worked with distros to ensure that
> > the updated versions would land before the removal of ARC4 from the
> > kernel.
> >
> > It is unfortunate that one of the distros failed to take that into
> > account for the backport of a newer kernel to an older distro release,
> > but I don't think it is fair to blame that on the process.
>
> Please don't misunderstand, I don't blame you at all.  I was in favor of ARC4
> removal since the kernel AF_ALG implementation was broken and the ell
> implementation had to work around that.  And you went the extra mile to make
> sure the migration was smooth.  The reported bug is still a fairly minor
> inconvenience in the grand scheme of things.
>
> But, I'm not in favor of doing the same for MD4...
>
> >
> >>   Please note that iwd does use MD4 for MSCHAP
> >> and MSCHAPv2 based 802.1X authentication.
> >>
> >
> > Thanks for reporting that.
> >
> > So what is your timeline for retaining MD4 support in iwd? You are
> > aware that it has been broken since 1991, right? Please, consider
> > having a deprecation path, so we can at least agree on *some* point in
> > time (in 6 months, in 6 years, etc) where we can start culling this
> > junk.
> >
>
> That is not something that iwd has any control over though?  We have to support
> it for as long as there are  organizations using TTLS + MD5 or PEAPv0.  There
> are still surprisingly many today.
>
> Regards,
> -Denis



-- 
Thanks,

Steve
