Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9EC9C623829
	for <lists+keyrings@lfdr.de>; Thu, 10 Nov 2022 01:30:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232107AbiKJAaS (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 9 Nov 2022 19:30:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231827AbiKJAaR (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 9 Nov 2022 19:30:17 -0500
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4261E12623
        for <keyrings@vger.kernel.org>; Wed,  9 Nov 2022 16:30:16 -0800 (PST)
Received: by mail-ej1-x62a.google.com with SMTP id bj12so1051901ejb.13
        for <keyrings@vger.kernel.org>; Wed, 09 Nov 2022 16:30:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nlqLQiiaOaZsIVqPkpURbCqECGxlhLAGf8/oZgDPEwg=;
        b=TibEJ/dS9oqIAlyw0U4d9Y17tk1l/5W9NiA/VJLZylVbn2FOy3zk5VI/yoCYNAuGoE
         Oc/Um2qfEuVCzsSWM/0hQdPyYt1cE7yzSxpdx7nS7ovvnFNjrDg/SO+IHB7dUcl1WCSg
         iWprIbuqzyqir3yxeR8YrLGkhepBTjIioA0E0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nlqLQiiaOaZsIVqPkpURbCqECGxlhLAGf8/oZgDPEwg=;
        b=Xb9cRaboAmjLSf3hO3c6BFvUbMDCEhH86DGt2NFuB+zhJOkwE8q2F+n0opb4DK9X7x
         cNVQZ5e5an5XqaKClK8+0XwHo1aArJRsS2OM5zzT4ti5tbl5WdatOXiwgay/Fm9+MsnU
         kzjeauJs9mJQq5QFPUt1IYpHwvOscO4B8Bb+nBP57oMoSby9MB2aI/UqGYgWqcvtrFsf
         3cbP2wt6INfbJa/mKNUm4+0brCGGDufPmPX1j8NWIiGX+lI2qoo1+UryYB+W8tA3L2e8
         BDpsnWjRjIL+Mi3ic8FIOnlbNIqdnplmdwATu35oqISYXKeRJkTTBFFkbCdD9lXH5MK4
         /vuA==
X-Gm-Message-State: ACrzQf2TaHp4MBWfkIYIPC/sZRQTrtkpkMWwk2XlvBpL+N4M67uyo8eh
        liUJu0aO+N5E3aYKWP/8E0A9Z1F9eRVq5A==
X-Google-Smtp-Source: AMsMyM4HVQo+YeSRTceSYwgJ/QcFoMZzbNpNQFdqVRhkulQ7SZP2qMLaC/wmBqoWgMYZgJII9kBPlA==
X-Received: by 2002:a17:906:ecf3:b0:7ad:fe28:a6f5 with SMTP id qt19-20020a170906ecf300b007adfe28a6f5mr36982438ejb.495.1668040214703;
        Wed, 09 Nov 2022 16:30:14 -0800 (PST)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com. [209.85.221.43])
        by smtp.gmail.com with ESMTPSA id vl2-20020a170907b60200b0078d0981516esm6462733ejc.38.2022.11.09.16.30.13
        for <keyrings@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Nov 2022 16:30:14 -0800 (PST)
Received: by mail-wr1-f43.google.com with SMTP id bk15so107721wrb.13
        for <keyrings@vger.kernel.org>; Wed, 09 Nov 2022 16:30:13 -0800 (PST)
X-Received: by 2002:adf:e44f:0:b0:236:59a3:c5a8 with SMTP id
 t15-20020adfe44f000000b0023659a3c5a8mr40946801wrm.396.1668040203082; Wed, 09
 Nov 2022 16:30:03 -0800 (PST)
MIME-Version: 1.0
References: <20221103180120.752659-1-evgreen@chromium.org> <20221103105558.v4.4.Ieb1215f598bc9df56b0e29e5977eae4fcca25e15@changeid>
 <202211041132.E8CB636@keescook> <CAE=gft4+KHVd_cNApo6EcTtxSDQDNB-nPXdus-0K8pQdWF+tiw@mail.gmail.com>
In-Reply-To: <CAE=gft4+KHVd_cNApo6EcTtxSDQDNB-nPXdus-0K8pQdWF+tiw@mail.gmail.com>
From:   Evan Green <evgreen@chromium.org>
Date:   Wed, 9 Nov 2022 16:29:26 -0800
X-Gmail-Original-Message-ID: <CAE=gft6O6WFbVL4mQ6trS4UkfkvNEFcUT0eN+6QAsXbf6DLdvQ@mail.gmail.com>
Message-ID: <CAE=gft6O6WFbVL4mQ6trS4UkfkvNEFcUT0eN+6QAsXbf6DLdvQ@mail.gmail.com>
Subject: Re: [PATCH v4 04/11] security: keys: trusted: Include TPM2 creation data
To:     Kees Cook <keescook@chromium.org>
Cc:     linux-kernel@vger.kernel.org, corbet@lwn.net,
        linux-pm@vger.kernel.org, rjw@rjwysocki.net, gwendal@chromium.org,
        apronin@chromium.org, Pavel Machek <pavel@ucw.cz>,
        Matthew Garrett <mgarrett@aurora.tech>,
        linux-integrity@vger.kernel.org, jejb@linux.ibm.com,
        zohar@linux.ibm.com, dlunev@google.com,
        Eric Biggers <ebiggers@kernel.org>,
        Ben Boeckel <me@benboeckel.net>, jarkko@kernel.org,
        David Howells <dhowells@redhat.com>,
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

On Mon, Nov 7, 2022 at 12:11 PM Evan Green <evgreen@chromium.org> wrote:
>
> On Fri, Nov 4, 2022 at 11:33 AM Kees Cook <keescook@chromium.org> wrote:
> >
> > On Thu, Nov 03, 2022 at 11:01:12AM -0700, Evan Green wrote:
> > > In addition to the private key and public key, the TPM2_Create
> > > command may also return creation data, a creation hash, and a creation
> > > ticket. These fields allow the TPM to attest to the contents of a
> > > specified set of PCRs at the time the trusted key was created. Encrypted
> > > hibernation will use this to ensure that PCRs settable only by the
> > > kernel were set properly at the time of creation, indicating this is an
> > > authentic hibernate key.
> > >
> > > Encode these additional parameters into the ASN.1 created to represent
> > > the key blob. The new fields are made optional so that they don't bloat
> > > key blobs which don't need them, and to ensure interoperability with
> > > old blobs.
> > >
> > > Signed-off-by: Evan Green <evgreen@chromium.org>
> >
> > There's a lot of open-coded math for the bounds checking. I didn't
> > immediately see any problems, but it'd be nice if there was a way to
> > hook a fuzzer up to this, or at least write some KUnit tests to check
> > boundary conditions explicitly.
> >
> > Reviewed-by: Kees Cook <keescook@chromium.org>
>
> Thank you! Yes, agreed about all the bounds checking. I could probably
> pull out the "check for src + 2 > end, then get_unaligned_be16()" into
> a helper function. Let me see if that makes things look better or ends
> up looking the same.

A helper function cleaned this up nicely, so I'll send that in the
next spin but not yet pick up your reviewed tag.
