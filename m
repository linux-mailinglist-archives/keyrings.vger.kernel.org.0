Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 29B946430B4
	for <lists+keyrings@lfdr.de>; Mon,  5 Dec 2022 19:44:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230293AbiLESoA (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Mon, 5 Dec 2022 13:44:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232329AbiLESny (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Mon, 5 Dec 2022 13:43:54 -0500
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1526119C06
        for <keyrings@vger.kernel.org>; Mon,  5 Dec 2022 10:43:53 -0800 (PST)
Received: by mail-ej1-x632.google.com with SMTP id gh17so676040ejb.6
        for <keyrings@vger.kernel.org>; Mon, 05 Dec 2022 10:43:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wAi9wb/ccr1V0J6asFIl7Azn5bhshYuD4nE6CW5xW+g=;
        b=OPVtqaGQfZNdZ4DF7z8NeObdT3sHluUFseqPw49KCbN+wqTHkRGDlCNAdrUqnU5qq6
         M/dZcdpbg6LMDtINPMHagxvEiD/e+KnOjJz+nt7H4s3lp1pprnp3qe4GMLa/QhYvpUQp
         yZVn5ofbBDCap0LFHONiDAaGYHExRbkxKOdis=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wAi9wb/ccr1V0J6asFIl7Azn5bhshYuD4nE6CW5xW+g=;
        b=Dua7DNQraq1uX/bFiw8AYlolapmONw07PxxpvsyHirH3RGmNGuuSWb6uJlKO2wplZZ
         eYtBstjddg+js8Plall0XCdHPUJXBiEp5CIwIdfADXblJQmrl7T7x4Rvof7vmRfhA1RL
         DOSzAy4bMlcp+08VImb1C5b7OuOXI+Dso5HSRex6MPq9wuh8RbQyGayNbAo2EDcZfWUx
         NLiaHoJngM+/ouDpgWOkNJeEASi1Cd0tcTO76kZ6PQ4Rn/9mHjuGL7tUOisT+B2nqnXu
         kFSksWfNfFKLgOtS+dQA1hMFHYIYa7SnHVmAfryIaZFrwYBFA2a+QFKgpeG8CmnZuxXm
         KZvg==
X-Gm-Message-State: ANoB5plCMTSATReoMWHoKOk6hnFUBuY+/gXFi9s/eDtHZb/su4qldkVW
        UfMIZdEiRU6NOSJg4vkZJ1GExUn7y0ccXhv3
X-Google-Smtp-Source: AA0mqf4/L3Waah1xsYYjmoanDtkjM6LhVeeg8E4Wso9JEe9fwAGV11ntrOPFZJ3mZB0F+x4bwLg98Q==
X-Received: by 2002:a17:906:6057:b0:7c0:a90b:be7e with SMTP id p23-20020a170906605700b007c0a90bbe7emr19846603ejj.202.1670265832453;
        Mon, 05 Dec 2022 10:43:52 -0800 (PST)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com. [209.85.128.53])
        by smtp.gmail.com with ESMTPSA id v16-20020a1709061dd000b007b47749838asm6465641ejh.45.2022.12.05.10.43.52
        for <keyrings@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Dec 2022 10:43:52 -0800 (PST)
Received: by mail-wm1-f53.google.com with SMTP id l26so3225110wms.4
        for <keyrings@vger.kernel.org>; Mon, 05 Dec 2022 10:43:52 -0800 (PST)
X-Received: by 2002:a05:600c:4e4c:b0:3cf:87c6:890b with SMTP id
 e12-20020a05600c4e4c00b003cf87c6890bmr62524251wmq.194.1670265821267; Mon, 05
 Dec 2022 10:43:41 -0800 (PST)
MIME-Version: 1.0
References: <20221111231636.3748636-1-evgreen@chromium.org>
 <20221111151451.v5.4.Ieb1215f598bc9df56b0e29e5977eae4fcca25e15@changeid>
 <Y3FfhrgvBNey6T7V@sol.localdomain> <ff23b4e24222037959c2a784496c7ee91024e6c5.camel@linux.ibm.com>
 <CAE=gft63-jdKqKmepB+LXPm6WUWSnz+CMWcWWnyN1y-EnS4kVg@mail.gmail.com>
 <c31d1a3af53515f2a9d3f53eb27ce698e796f9b9.camel@linux.ibm.com>
 <CAE=gft6L6bMtzbqUfH_NAsFz2r0Nw7kkbCPXcr2nYj5n31FYQg@mail.gmail.com>
 <95ffac38780bf0ec6084cb354bfcb3b7bee686b9.camel@linux.ibm.com> <6f66f174af92a9b23bddd72945e94e888b0c9420.camel@linux.ibm.com>
In-Reply-To: <6f66f174af92a9b23bddd72945e94e888b0c9420.camel@linux.ibm.com>
From:   Evan Green <evgreen@chromium.org>
Date:   Mon, 5 Dec 2022 10:43:05 -0800
X-Gmail-Original-Message-ID: <CAE=gft4wvxOZ4CS2hJzYANRNbCtYUznmsEE-3n4=EDx-+L_f9Q@mail.gmail.com>
Message-ID: <CAE=gft4wvxOZ4CS2hJzYANRNbCtYUznmsEE-3n4=EDx-+L_f9Q@mail.gmail.com>
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

On Fri, Dec 2, 2022 at 1:03 PM James Bottomley <jejb@linux.ibm.com> wrote:
>
> On Mon, 2022-11-14 at 13:00 -0500, James Bottomley wrote:
> > On Mon, 2022-11-14 at 09:43 -0800, Evan Green wrote:
> > > On Mon, Nov 14, 2022 at 8:56 AM James Bottomley
> > > <jejb@linux.ibm.com>
> > > wrote:
> > [...]
> > > > Of course, since openssl_tpm2_engine is the complete reference
> > > > implementation that means I'll have to add the creation PCRs
> > > > implementation to it ... unless you'd like to do it?
> > >
> > > I am willing to help as I'm the one making the mess. How does it
> > > sequence along with your draft submission (before, after,
> > > simultaneous)?
> >
> > At the moment, just send patches.  The openssl_tpm2_engine is
> > developed on a groups.io mailing list:
> >
> > https://groups.io/g/openssl-tpm2-engine/
> >
> > You need an IETF specific tool (xml2rfc) to build the rfc from the
> > xml, but it's available in most distros as python3-xml2rfc.  If you
> > don't want to learn the IETF XML I can help you code up the patch to
> > add that to the draft spec.
>
> Just as a heads up, the patch series implementing signed policy (and
> thus taking option [3]) is on the mailing list for review:
>
> https://groups.io/g/openssl-tpm2-engine/message/296
>
> With apologies for the awful lack of threading in the groups.io
> interface.
>
> So you don't have to build the RFC yourself, I published the proposed
> update on my website:
>
> https://www.hansenpartnership.com/draft-bottomley-tpm2-keys.html
> https://www.hansenpartnership.com/draft-bottomley-tpm2-keys.txt
>
> If you want to use option [4] for the creation data, it's available.

Perfect, thanks James!
-Evan
