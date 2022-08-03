Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E617758937A
	for <lists+keyrings@lfdr.de>; Wed,  3 Aug 2022 22:49:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238608AbiHCUtR (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 3 Aug 2022 16:49:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238676AbiHCUtQ (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 3 Aug 2022 16:49:16 -0400
Received: from mail-oa1-x29.google.com (mail-oa1-x29.google.com [IPv6:2001:4860:4864:20::29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC51D5C95C
        for <keyrings@vger.kernel.org>; Wed,  3 Aug 2022 13:49:15 -0700 (PDT)
Received: by mail-oa1-x29.google.com with SMTP id 586e51a60fabf-10ee900cce0so10152209fac.5
        for <keyrings@vger.kernel.org>; Wed, 03 Aug 2022 13:49:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qCvjB0XOGwom3VuKpUHiorVjWdQfyMRzQDadmEnUHfo=;
        b=iH2cHiyXqK9lCPc7UF2E5siG7sE1VBvgiD6bj0XQ2XOZEaHWJVTEvWFzAA+rrjMZ7J
         83IqAOQGL8q5iEALOWpLAFFRpwoS2W0T5hAzgenMRyTvAkanoMjyTA1vMnKZDjkRagYa
         mZErqeI7eut841LPwAGXKQTDKHa/GLL+Sd9GY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qCvjB0XOGwom3VuKpUHiorVjWdQfyMRzQDadmEnUHfo=;
        b=ZTyitFr3UQmVkzVxlunTCO55AQDXqnr2+yJ25pezbhapnOvh+JBy0xLASupaKPyuvB
         hwX6HU4082zPVHSGr0QrKBwF7mI/+2yRD9sVJt+J/LFttmIyx2Vqz674lXRFRPq0xu8Q
         TmKq5Cm2JcehrQnmbk7ohyxH+lorugoxH/+g7I4eG01ooNUVb7Pu7WvMtHeSMFuBRxNj
         VdE0TaZBUJnZ0NMw7b1NGuY2u0MZUg24qqXbMxFUJr2bcinnSImcRW+suZKn1ZhuUi1c
         S1uhX25QT8t0ljaLy7gfnfITZgMYUvxsbU0Qj+mAtkMgF91vDh810dkv+GWtFWyNymnZ
         6o2w==
X-Gm-Message-State: ACgBeo10DkVZjBVWV+HPnTZb2yXKpKaiOEL7rQl8f9YNBRlzwggdf+b0
        EYrhPKppjoFhkQ0RMcT72D1Eue+tyqiVAg==
X-Google-Smtp-Source: AA6agR4tgjkWMQbI4u3SsvImbEu2Z9HYjIJxnzDyKwsX49YbSOv89//Wk65+mYexaAQeuwmqcXmHqw==
X-Received: by 2002:a05:6870:d60a:b0:10e:4333:d773 with SMTP id a10-20020a056870d60a00b0010e4333d773mr2709359oaq.78.1659559754943;
        Wed, 03 Aug 2022 13:49:14 -0700 (PDT)
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com. [209.85.210.53])
        by smtp.gmail.com with ESMTPSA id z88-20020a9d24e1000000b0061b8653b0c9sm4237952ota.22.2022.08.03.13.49.13
        for <keyrings@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Aug 2022 13:49:14 -0700 (PDT)
Received: by mail-ot1-f53.google.com with SMTP id cm4-20020a056830650400b0063675a4dd74so3167811otb.10
        for <keyrings@vger.kernel.org>; Wed, 03 Aug 2022 13:49:13 -0700 (PDT)
X-Received: by 2002:a05:6830:290a:b0:618:b519:53f5 with SMTP id
 z10-20020a056830290a00b00618b51953f5mr9795854otu.237.1659559753343; Wed, 03
 Aug 2022 13:49:13 -0700 (PDT)
MIME-Version: 1.0
References: <20220504232102.469959-1-evgreen@chromium.org> <20220504161439.4.I32591db064b6cdc91850d777f363c9d05c985b39@changeid>
 <Yumskea9UJ9n0uPz@sol.localdomain>
In-Reply-To: <Yumskea9UJ9n0uPz@sol.localdomain>
From:   Evan Green <evgreen@chromium.org>
Date:   Wed, 3 Aug 2022 13:48:37 -0700
X-Gmail-Original-Message-ID: <CAE=gft4jTQY1N5X=Yyg6g6-e0EBPHKhnQxcX02NZU0mZxaTvwA@mail.gmail.com>
Message-ID: <CAE=gft4jTQY1N5X=Yyg6g6-e0EBPHKhnQxcX02NZU0mZxaTvwA@mail.gmail.com>
Subject: Re: [PATCH 04/10] security: keys: trusted: Allow storage of PCR
 values in creation data
To:     Eric Biggers <ebiggers@kernel.org>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Matthew Garrett <mgarrett@aurora.tech>,
        Daniil Lunev <dlunev@google.com>, zohar@linux.ibm.com,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        linux-integrity@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Gwendal Grignou <gwendal@chromium.org>,
        Jarkko Sakkinen <jarkko@kernel.org>,
        Linux PM <linux-pm@vger.kernel.org>,
        Matthew Garrett <matthewgarrett@google.com>,
        Matthew Garrett <mjg59@google.com>,
        David Howells <dhowells@redhat.com>,
        James Morris <jmorris@namei.org>,
        "Serge E. Hallyn" <serge@hallyn.com>, keyrings@vger.kernel.org,
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

On Tue, Aug 2, 2022 at 4:00 PM Eric Biggers <ebiggers@kernel.org> wrote:
>
> On Wed, May 04, 2022 at 04:20:56PM -0700, Evan Green wrote:
> > diff --git a/security/keys/trusted-keys/trusted_tpm1.c b/security/keys/trusted-keys/trusted_tpm1.c
> > index aa108bea6739b3..2975827c01bec0 100644
> > --- a/security/keys/trusted-keys/trusted_tpm1.c
> > +++ b/security/keys/trusted-keys/trusted_tpm1.c
> > @@ -713,6 +713,7 @@ enum {
> >       Opt_hash,
> >       Opt_policydigest,
> >       Opt_policyhandle,
> > +     Opt_creationpcrs,
> >  };
> >
> >  static const match_table_t key_tokens = {
> > @@ -725,6 +726,7 @@ static const match_table_t key_tokens = {
> >       {Opt_hash, "hash=%s"},
> >       {Opt_policydigest, "policydigest=%s"},
> >       {Opt_policyhandle, "policyhandle=%s"},
> > +     {Opt_creationpcrs, "creationpcrs=%s"},
> >       {Opt_err, NULL}
> >  };
> >
> > @@ -858,6 +860,13 @@ static int getoptions(char *c, struct trusted_key_payload *pay,
> >                               return -EINVAL;
> >                       opt->policyhandle = handle;
> >                       break;
> > +             case Opt_creationpcrs:
> > +                     if (!tpm2)
> > +                             return -EINVAL;
> > +                     res = kstrtoint(args[0].from, 16, &opt->creation_pcrs);
> > +                     if (res < 0)
> > +                             return -EINVAL;
> > +                     break;
>
> I thought that TPM1 is deprecated.  Are you sure you need more TPM1 features?

It seems that trusted_tpm1.c is not just TPM1 functions, but also
common functions that call TPM2 primitives. A few of these functions
(like this getoptions()) seem to even error out if !tpm_is_tpm2(chip).

-Evan
