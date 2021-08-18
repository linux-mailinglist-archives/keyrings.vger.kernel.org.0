Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A1A63F0E76
	for <lists+keyrings@lfdr.de>; Thu, 19 Aug 2021 01:04:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234638AbhHRXEi (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 18 Aug 2021 19:04:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229478AbhHRXEi (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 18 Aug 2021 19:04:38 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6F81C061764;
        Wed, 18 Aug 2021 16:04:02 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id g13so8148229lfj.12;
        Wed, 18 Aug 2021 16:04:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8Z1R2fYrOTNobmlJ+3vB5EQ4usNEedoji07UX/UXLZ0=;
        b=bhiznbVnEElfdRFu5TOHs3MZd9U86RLjG+RsUU898sYZlmi8E4xAcRhy+WpNWWeCDY
         /z1H9MCRx3dojy3XQXAbMs02Ix0261vSBEEYzSnps/vmwNL6fX0oE69uOaJQrt1w00Mu
         giLOtN7RVaT1P84/tTtRJa7B0bXTIsnZY8KZQ+xc6FUeCt3JgHjytvqvLl7PlVeRSoc5
         skImqy9Yd2S3yyKtHodkB7JEG5vGrYxkvr65UTuuw2qAANVDDsRHQ6aimPJ/ajaOfHt2
         VPKv6u5AiLvavRpMsuFaAEUjAvxREtwsF/sD1agnKfjPa3dLSyRoyLOjyvbgMq9IXxiH
         Z/VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8Z1R2fYrOTNobmlJ+3vB5EQ4usNEedoji07UX/UXLZ0=;
        b=JgXA78q8ahQFUVl8r8NyvC6Iw3mR7K9LgUYhM4lQZmzxtvZTW3a0xteMNxfNrtylzJ
         SF2MdikMG+qD21A3rlINhat5nYytFQFf3cm+oZXcmsi27DQKQPdcwbQVM5OIH5zu8wlj
         lSFXFHaK8hRPVhHLgBApRyG48H2MCws5mRhYSyFkhRGkYnLqZHv5/96X/mnIpTrdcB8y
         VOuXzrg6CnODEpYi/ixi+rYTJ0cTJduILpU/P/IQiVYXETte5ZDWNJvq3+ER9BObYdAb
         WtoMKt9yeLAXw6lYrLwhstLIWNKGT489FtKKY23/KC2JtBhoENE3oycAmHgK7g6OADiZ
         dbxA==
X-Gm-Message-State: AOAM532/soaUl8ESDW1WIrS3zGYmrsFmj+0MsL2uf9dxi4hR7YH1kJ7n
        bFDY/qe8Vo0ebsgxR2NbMdFhRixTvIye/2lMJ1E=
X-Google-Smtp-Source: ABdhPJze8nwhCjJoYbyQoJXtKIj01aYAK41g4x9FgD9H5Tboj6ecAbU6Kj8CjIoc6WnoqS7daB/gMc5AuEvdi/DKyQE=
X-Received: by 2002:ac2:4350:: with SMTP id o16mr8377063lfl.184.1629327841043;
 Wed, 18 Aug 2021 16:04:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210818144617.110061-1-ardb@kernel.org> <946591db-36aa-23db-a5c4-808546eab762@gmail.com>
 <CAMj1kXEjHojAZ0_DPkogHAbmS6XAOFN3t8-4VB0+zN8ruTPVCg@mail.gmail.com>
 <24606605-71ae-f918-b71a-480be7d68e43@gmail.com> <CAMj1kXEO8PwLfT8uAYgeFF7T3TznWz4E=R1JArvCdKXk8qiAMQ@mail.gmail.com>
 <e2462d50-57e9-b7d7-bc07-0f365a01d215@gmail.com>
In-Reply-To: <e2462d50-57e9-b7d7-bc07-0f365a01d215@gmail.com>
From:   Steve French <smfrench@gmail.com>
Date:   Wed, 18 Aug 2021 18:03:50 -0500
Message-ID: <CAH2r5muUQT5EX0Z=9MFr=QHGaajF5unwnDwib8CN0hbKP7J4Rw@mail.gmail.com>
Subject: Re: [PATCH 0/2] crypto: remove MD4 generic shash
To:     Denis Kenzior <denkenz@gmail.com>
Cc:     Ard Biesheuvel <ardb@kernel.org>,
        Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Eric Biggers <ebiggers@kernel.org>,
        ronnie sahlberg <ronniesahlberg@gmail.com>,
        linux-cifs <linux-cifs@vger.kernel.org>,
        Steve French <sfrench@samba.org>,
        David Howells <dhowells@redhat.com>, keyrings@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Wed, Aug 18, 2021 at 5:22 PM Denis Kenzior <denkenz@gmail.com> wrote:
>
> Hi Ard,
>
> >> That is not something that iwd has any control over though?  We have to support
> >> it for as long as there are  organizations using TTLS + MD5 or PEAPv0.  There
>
> Ah, my brain said MSCHAP but my fingers typed MD5.
>
> >> are still surprisingly many today.
> >>
> >
> > Does that code rely on MD4 as well?
> >
>
> But the answer is yes.  Both PEAP and TTLS use MSCHAP or MSCHAPv2 in some form.
>   These are commonly used for Username/Password based WPA(2|3)-Enterprise
> authentication.  Think 'eduroam' for example.

Can you give some background here?  IIRC MS-CHAPv2 is much worse than
the NTLMSSP case
in cifs.ko (where RC4/MD5 is used narrowly).   Doesn't MS-CHAPv2 depend on DES?



-- 
Thanks,

Steve
