Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 98379628596
	for <lists+keyrings@lfdr.de>; Mon, 14 Nov 2022 17:39:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237937AbiKNQiz (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Mon, 14 Nov 2022 11:38:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237844AbiKNQij (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Mon, 14 Nov 2022 11:38:39 -0500
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 899DA65FD
        for <keyrings@vger.kernel.org>; Mon, 14 Nov 2022 08:33:43 -0800 (PST)
Received: by mail-ej1-x633.google.com with SMTP id bj12so29614389ejb.13
        for <keyrings@vger.kernel.org>; Mon, 14 Nov 2022 08:33:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fdHhTpZNmQxUEi2mbASnWXi91JoJlz5SqgpuzvGvbqs=;
        b=Ck1gj2RHs6kKr8eo0lLZILNZm9cTLBmDBgd3gbZIiMsgfnGD3JCQsqadXh2xLzzWDB
         1lPmOGx9KUAFcKRtzpsAkB/jzN2nyVsb7J2RGxm+IgmxzSWRs+xzhCPqnycw71njMhHU
         0JqDeR+Ls0TsMcPMDlQtzx7Tuxw277l1DoPnQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fdHhTpZNmQxUEi2mbASnWXi91JoJlz5SqgpuzvGvbqs=;
        b=0NQC8zCcGL3YBzb1x8C0GmDYuUj81/L4JKVZ32PTPvbZSeHv3u4bwtzn5kWKRUCsrO
         3soSJfxmMPMdqF+D7+wLL5bhxQFTdjXjRpfN8Q7uIFRI53uagrmCvXoUdQf5GImPqsYF
         5FUZCM7qBl6wvimn3zwXaFeXfHEYq4h5WVXsmJyXthMyRWPfrKx5z7Wmn/JCY2I7jZz9
         o5mdxy+75xbJ5TXBpodUlZ2csuJGRxgZiFTRCU+ZK7c64NWXTSvBfdjOo04UsEe57NJw
         i6VTGY1HhdrFHOU6qzuak4Sz3SbjUshvvVvAV7xmN3DU0XRU4q2JHu0NOul+5CTqQjyM
         8fOw==
X-Gm-Message-State: ANoB5pmXgWbtJkZYmPVJK7rnxvUm0KypVjMYltLI4D3eRh7/YP6MhkBA
        0BXkmMM3LuGOutkisf9K4sGAcZeYEFSY2A==
X-Google-Smtp-Source: AA0mqf7j4t3EwrtaYbQ+V2P91EWiqqvVDDa0c0dOWR0ZOchd8DingNgENA3pjBrZAKCXPm18PIaHEg==
X-Received: by 2002:a17:906:a015:b0:7ad:b868:f096 with SMTP id p21-20020a170906a01500b007adb868f096mr10564667ejy.295.1668443622934;
        Mon, 14 Nov 2022 08:33:42 -0800 (PST)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com. [209.85.128.48])
        by smtp.gmail.com with ESMTPSA id e1-20020aa7d7c1000000b00463c367024bsm4951550eds.63.2022.11.14.08.33.42
        for <keyrings@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Nov 2022 08:33:42 -0800 (PST)
Received: by mail-wm1-f48.google.com with SMTP id 5so7869388wmo.1
        for <keyrings@vger.kernel.org>; Mon, 14 Nov 2022 08:33:42 -0800 (PST)
X-Received: by 2002:a05:600c:4e0e:b0:3cf:87c6:890b with SMTP id
 b14-20020a05600c4e0e00b003cf87c6890bmr8708365wmq.194.1668443611668; Mon, 14
 Nov 2022 08:33:31 -0800 (PST)
MIME-Version: 1.0
References: <20221111231636.3748636-1-evgreen@chromium.org>
 <20221111151451.v5.4.Ieb1215f598bc9df56b0e29e5977eae4fcca25e15@changeid>
 <Y3FfhrgvBNey6T7V@sol.localdomain> <ff23b4e24222037959c2a784496c7ee91024e6c5.camel@linux.ibm.com>
In-Reply-To: <ff23b4e24222037959c2a784496c7ee91024e6c5.camel@linux.ibm.com>
From:   Evan Green <evgreen@chromium.org>
Date:   Mon, 14 Nov 2022 08:32:55 -0800
X-Gmail-Original-Message-ID: <CAE=gft63-jdKqKmepB+LXPm6WUWSnz+CMWcWWnyN1y-EnS4kVg@mail.gmail.com>
Message-ID: <CAE=gft63-jdKqKmepB+LXPm6WUWSnz+CMWcWWnyN1y-EnS4kVg@mail.gmail.com>
Subject: Re: [PATCH v5 04/11] security: keys: trusted: Include TPM2 creation data
To:     jejb@linux.ibm.com
Cc:     Eric Biggers <ebiggers@kernel.org>, linux-kernel@vger.kernel.org,
        corbet@lwn.net, linux-integrity@vger.kernel.org,
        gwendal@chromium.org, dianders@chromium.org, apronin@chromium.org,
        Pavel Machek <pavel@ucw.cz>, Ben Boeckel <me@benboeckel.net>,
        rjw@rjwysocki.net, Kees Cook <keescook@chromium.org>,
        dlunev@google.com, zohar@linux.ibm.com,
        Matthew Garrett <mgarrett@aurora.tech>, jarkko@kernel.org,
        linux-pm@vger.kernel.org, David Howells <dhowells@redhat.com>,
        James Morris <jmorris@namei.org>,
        Paul Moore <paul@paul-moore.com>,
        "Serge E. Hallyn" <serge@hallyn.com>, keyrings@vger.kernel.org,
        linux-security-module@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Sun, Nov 13, 2022 at 7:32 PM James Bottomley <jejb@linux.ibm.com> wrote:
>
> On Sun, 2022-11-13 at 13:20 -0800, Eric Biggers wrote:
> > On Fri, Nov 11, 2022 at 03:16:29PM -0800, Evan Green wrote:
> > > diff --git a/security/keys/trusted-keys/tpm2key.asn1
> > > b/security/keys/trusted-keys/tpm2key.asn1
> > > index f57f869ad60068..608f8d9ca95fa8 100644
> > > --- a/security/keys/trusted-keys/tpm2key.asn1
> > > +++ b/security/keys/trusted-keys/tpm2key.asn1
> > > @@ -7,5 +7,18 @@ TPMKey ::= SEQUENCE {
> > >         emptyAuth       [0] EXPLICIT BOOLEAN OPTIONAL,
> > >         parent          INTEGER ({tpm2_key_parent}),
> > >         pubkey          OCTET STRING ({tpm2_key_pub}),
> > > -       privkey         OCTET STRING ({tpm2_key_priv})
> > > +       privkey         OCTET STRING ({tpm2_key_priv}),
> > > +       ---
> > > +       --- A TPM2B_CREATION_DATA struct as returned from the
> > > TPM2_Create command.
> > > +       ---
> > > +       creationData    [1] EXPLICIT OCTET STRING OPTIONAL
> > > ({tpm2_key_creation_data}),
> > > +       ---
> > > +       --- A TPM2B_DIGEST of the creationHash as returned from the
> > > TPM2_Create
> > > +       --- command.
> > > +       ---
> > > +       creationHash    [2] EXPLICIT OCTET STRING OPTIONAL
> > > ({tpm2_key_creation_hash}),
> > > +       ---
> > > +       --- A TPMT_TK_CREATION ticket as returned from the
> > > TPM2_Create command.
> > > +       ---
> > > +       creationTk      [3] EXPLICIT OCTET STRING OPTIONAL
> > > ({tpm2_key_creation_tk})
> > >         }
> >
> > The commit that added this file claimed:
> >
> >         "The benefit of the ASN.1 format is that it's a standard and
> > thus the
> >         exported key can be used by userspace tools
> > (openssl_tpm2_engine,
> >         openconnect and tpm2-tss-engine"
> >
> > Are these new fields in compliance with whatever standard that was
> > referring to?
>
> Not really, no.  The current use case (and draft standard) is already
> using [1] for policies and [2] for importable keys:
>
> https://git.kernel.org/pub/scm/linux/kernel/git/jejb/openssl_tpm2_engine.git/tree/doc/draft-bottomley-tpm2-keys.xml
>
> I'm actually planning to use [3] for signed policies.  There's no
> reason why you can't use [4] though.  Since the creation data, hash and
> ticket are likely used as a job lot, it strikes me they should be a
> single numbered optional sequence instead of individually numbered,
> since you're unlikely to have one without the others.

Thanks, I was hoping James might pipe up and tell me what to do.
Grouping them as a single numbered optional sequence sounds reasonable
to me. Is your draft too far along to squeeze this in? If it is and
I'm on my own to draft up and submit this, I would definitely
appreciate any pointers on getting started you might have.

I notice the draft and the code seem to be out of alignment. I'm
unfamiliar with this process, is the idea to get through all the
iterations and land the standard, then fix up the code? What happens
to existing data handed out in the old format?

-Evan
