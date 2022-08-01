Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1F8635873FB
	for <lists+keyrings@lfdr.de>; Tue,  2 Aug 2022 00:34:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235358AbiHAWdy (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Mon, 1 Aug 2022 18:33:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235433AbiHAWdm (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Mon, 1 Aug 2022 18:33:42 -0400
Received: from mail-oa1-x2a.google.com (mail-oa1-x2a.google.com [IPv6:2001:4860:4864:20::2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE93546D88
        for <keyrings@vger.kernel.org>; Mon,  1 Aug 2022 15:33:39 -0700 (PDT)
Received: by mail-oa1-x2a.google.com with SMTP id 586e51a60fabf-10ee900cce0so3365664fac.5
        for <keyrings@vger.kernel.org>; Mon, 01 Aug 2022 15:33:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LI7JfBTHXcIfr/9UgMaMzqcZcXHkE1NiQIHzTU9OMbY=;
        b=cF+PM2YAd/AUT5qzQ0nJgW7ok1vFg9j5ZWOyJvGxFUYr7Zvy6AanzGkLbB529Gl+Qc
         YO0AcazHdcSnFyDrtq047WoUQLzvGI1DZh5TKK7xC0VpxBOn4CICGP0cnP5x/zklP9Qi
         99CZwd4H+SfwuCwqCcvmMHs1IXVcieCMIfit0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LI7JfBTHXcIfr/9UgMaMzqcZcXHkE1NiQIHzTU9OMbY=;
        b=BdX0gMFzRda5IB5enV73fxKN8F6B4a11Xa1oPi/s4yecWmIakSAtnq5FueNvMec5lR
         2moD6tUGekgHMyoNbGYgYQC06UlRCUtXMQ+Rp1xHWkAvHZLUXSXqsEIaJz63GuNFnaPZ
         za1EER7EpmCk245xssYOpC17PMyTn2Uk8+xWukVe6VuKE0TrDDb5IzfUgX7ofsFzfYqz
         3C1KwgWETsubJF1FlbnZ2SMis+CjtYN4D3Ks9Or4zLcir39S6CkgaowTQMO3KTmttFif
         0oqoEdluL6w/KSGqsu5Npu7FAkSokLLUAEY5Sy29NgN9keQ7PpRo6IDaR75EGgrkEVQM
         bFbw==
X-Gm-Message-State: ACgBeo1NzM0dZz/TlCxGh6sIKX9W+yfh12Be9Qt3/cpjH+n4rZMSZ6Xv
        adnB2O8RYU5nLDelkP4FL0R0+dCH7NOYSg==
X-Google-Smtp-Source: AA6agR4ewxQRMuQdBiOJcJY+LpCLl/1Bdu2lj8OhoT6Y1d/OGVcZdYxJBfU30J/V6wr+c8u7Gf1xmA==
X-Received: by 2002:a05:6870:b52c:b0:10e:e9e2:81b2 with SMTP id v44-20020a056870b52c00b0010ee9e281b2mr1932771oap.75.1659393218847;
        Mon, 01 Aug 2022 15:33:38 -0700 (PDT)
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com. [209.85.160.43])
        by smtp.gmail.com with ESMTPSA id o16-20020a056870911000b000f342d078fasm3348021oae.52.2022.08.01.15.33.38
        for <keyrings@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Aug 2022 15:33:38 -0700 (PDT)
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-10ea7d8fbf7so10114669fac.7
        for <keyrings@vger.kernel.org>; Mon, 01 Aug 2022 15:33:38 -0700 (PDT)
X-Received: by 2002:a05:6808:14d4:b0:33b:1489:8752 with SMTP id
 f20-20020a05680814d400b0033b14898752mr7607300oiw.174.1659393206929; Mon, 01
 Aug 2022 15:33:26 -0700 (PDT)
MIME-Version: 1.0
References: <20220504232102.469959-1-evgreen@chromium.org> <20220506160807.GA1060@bug>
 <CAE=gft6m75T0UC2DBhfFhuSMW6TK7aatD_04sQ18WosgGVsATw@mail.gmail.com>
 <CAJZ5v0gxq=EA_WWUiCR_w8o87iTHDR7OC5wi=GRBaAQS2ofd5w@mail.gmail.com>
 <CAE=gft6V6RLc-d4AOuRUVU2u1jMGghDRSrFqiCqMCLxemui8Pw@mail.gmail.com> <CAE=gft5OYAgosqmwNkk=Cwoooeg93Njmnzfz=gwCaLB0Ts+=sw@mail.gmail.com>
In-Reply-To: <CAE=gft5OYAgosqmwNkk=Cwoooeg93Njmnzfz=gwCaLB0Ts+=sw@mail.gmail.com>
From:   Evan Green <evgreen@chromium.org>
Date:   Mon, 1 Aug 2022 15:32:50 -0700
X-Gmail-Original-Message-ID: <CAE=gft6sPkhNcz7+fJuDzQo2f8fM_0Wv_OWC9W2LyvXd6M6zeQ@mail.gmail.com>
Message-ID: <CAE=gft6sPkhNcz7+fJuDzQo2f8fM_0Wv_OWC9W2LyvXd6M6zeQ@mail.gmail.com>
Subject: Re: [PATCH 00/10] Encrypted Hibernation
To:     "Rafael J. Wysocki" <rafael@kernel.org>
Cc:     Pavel Machek <pavel@ucw.cz>, LKML <linux-kernel@vger.kernel.org>,
        Matthew Garrett <mgarrett@aurora.tech>,
        Daniil Lunev <dlunev@google.com>, zohar@linux.ibm.com,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        linux-integrity@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Gwendal Grignou <gwendal@chromium.org>,
        Jarkko Sakkinen <jarkko@kernel.org>,
        Linux PM <linux-pm@vger.kernel.org>,
        David Howells <dhowells@redhat.com>,
        Hao Wu <hao.wu@rubrik.com>, James Morris <jmorris@namei.org>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Len Brown <len.brown@intel.com>,
        Peter Huewe <peterhuewe@gmx.de>,
        "Serge E. Hallyn" <serge@hallyn.com>, axelj <axelj@axis.com>,
        keyrings@vger.kernel.org,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        linux-security-module@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Thu, Jun 16, 2022 at 8:42 AM Evan Green <evgreen@chromium.org> wrote:
>
> On Tue, May 17, 2022 at 10:34 AM Evan Green <evgreen@chromium.org> wrote:
> >
> > Hi Rafael,
> >
> > On Tue, May 17, 2022 at 9:06 AM Rafael J. Wysocki <rafael@kernel.org> wrote:
> > >
> > > On Mon, May 9, 2022 at 6:44 PM Evan Green <evgreen@chromium.org> wrote:
> > > >
> > > > On Fri, May 6, 2022 at 9:08 AM Pavel Machek <pavel@ucw.cz> wrote:
> > > > >
> > > > > Hi!
> > > > >
> > > > > > We are exploring enabling hibernation in some new scenarios. However,
> > > > > > our security team has a few requirements, listed below:
> > > > > > 1. The hibernate image must be encrypted with protection derived from
> > > > > >    both the platform (eg TPM) and user authentication data (eg
> > > > > >    password).
> > > > > > 2. Hibernation must not be a vector by which a malicious userspace can
> > > > > >    escalate to the kernel.
> > > > >
> > > > > Can you (or your security team) explain why requirement 2. is needed?
> > > > >
> > > > > On normal systems, trusted userspace handles kernel upgrades (for example),
> > > > > so it can escalate to kernel priviledges.
> > > > >
> > > >
> > > > Our systems are a little more sealed up than a normal distro, we use
> > > > Verified Boot [1]. To summarize, RO firmware with an embedded public
> > > > key verifies that the kernel+commandline was signed by Google. The
> > > > commandline includes the root hash of the rootfs as well (where the
> > > > modules live). So when an update is applied (A/B style, including the
> > > > whole rootfs), assuming the RO firmware stayed RO (which requires
> > > > physical measures to defeat), we can guarantee that the kernel,
> > > > commandline, and rootfs have not been tampered with.
> > > >
> > > > Verified boot gives us confidence that on each boot, we're at least
> > > > starting from known code. This makes it more challenging for an
> > > > attacker to persist an exploit across reboot. With the kernel and
> > > > modules verified, we try to make it non-trivial for someone who does
> > > > manage to gain root execution once from escalating to kernel
> > > > execution. Hibernation would be one obvious escalation route, so we're
> > > > hoping to find a way to enable it without handing out that easy
> > > > primitive.
> > > >
> > > > [1] https://www.chromium.org/chromium-os/chromiumos-design-docs/verified-boot/
> > >
> > > So I guess this really is an RFC.
> >
> > Yes, I suppose it is.
> >
> > >
> > > Honestly, I need more time to go through this and there are pieces of
> > > it that need to be looked at other people (like the TPM-related
> > > changes).
> >
> > No problem, thanks for the reply to let me know. I expect some back
> > and forth in terms of what should be hidden behind abstractions and
> > where exactly things should live. But I wanted to get this out to
> > upstream as early as I could, just to get initial reactions on the
> > overall concept and design. Looking forward to hearing your thoughts
> > when you get a chance, and let me know if there are others I should be
> > adding that I've missed.
>
> Gentle bump in case this dropped off of radars, I'd still appreciate
> any feedback folks had on this series.

One more bump here, as we'd really love to get encrypted hibernation
to a form upstream would accept if at all possible. We were
considering landing this in our Chrome OS tree for now, then coming
back in a couple months with a "we've been baking this ourselves and
it's going so great, oooh yeah". I'm not sure if upstream would find
that compelling or not. But in any case, some guidance towards making
this more upstream friendly would be well appreciated.

One thing I realized in attempting to pick this myself is that the
trusted key blob format has moved to ASN.1. So I should really move
the creation ticket to the new ASN.1 format (if I can figure out the
right OID for that piece), which would allow me to drop a lot of the
ugly stuff in tpm2_unpack_blob(). Maybe if I get no other comments
I'll work on that and resend.

-Evan
