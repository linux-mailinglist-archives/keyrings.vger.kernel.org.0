Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ADDF65881F2
	for <lists+keyrings@lfdr.de>; Tue,  2 Aug 2022 20:37:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237869AbiHBShF (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 2 Aug 2022 14:37:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237857AbiHBShD (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Tue, 2 Aug 2022 14:37:03 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FE04275CF
        for <keyrings@vger.kernel.org>; Tue,  2 Aug 2022 11:36:55 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id e15so13152178lfs.0
        for <keyrings@vger.kernel.org>; Tue, 02 Aug 2022 11:36:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=aurora.tech; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=0V0vFut6oA8ltHdEyyj9G6rE8xemZdZlYLyGMvFW5i4=;
        b=JbMbzCWRmy2/Iq8VzGanXbbRzWl9cc1EE2JwK+mM841qApg8exzR+ojIFePkA7dQsb
         gRvYUobGX7Snt7L3xK5hiI7zmrzrfLFRObO9mFClHnUkwfU6RNbXI69ns2zApTAL5gwY
         kR7qULTZV5hfS9jHk1j94fGdCQkp4OBZzlsDCSvL9fb11iscSOr5AmCiXIvg1FPe5NWO
         koW2x7Wj40zQPUC0l7K2Xgx4uTqPUvDr2YMa8LZhVKI2B+MeIHFWqwE8TEimAQrNInYn
         is/ADBfYIy6DYJUaZIuUiI0ETOFvlzjoNx0rvql7JSvU6PkaoZznCv80G6c9ccum3uVl
         vtog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=0V0vFut6oA8ltHdEyyj9G6rE8xemZdZlYLyGMvFW5i4=;
        b=H3etNl7hvVvCLgfcWC8G8cXSCxEtBTbV8MKR+Nm3T8H/5YJHVdklZNUPuwnEBpTnLn
         TefC3CDQ1AmAyl5X1aYOvTV0Zu9mlKTlY4B8hKthQMW2iTaqYACPXYyLbkff8qDOnPOo
         TbRZ0YQLzRGVsfCKEkY5Zwte89+CA7Zqj77trS/pyampurvbeHTrtB1fRBoPYyx69zMF
         wF5GOuZfXusZXdOm3gR0AHMOJz12FjWKMSX+5fm3sfeQe3PCIGSjxzCz5MOwapHa5DyC
         GteWWkuw9oiPB1zoUoNw2k4Qv5sSyxCNEMSOT7LPR2/nhTvgmbtk2ul1I1mVScSScs8F
         JlGA==
X-Gm-Message-State: ACgBeo0oWsj3OZBtY5zm6pGC0xXZ+hukYjrZp8Ef7qNb0KFxjRl5qAHF
        6ySndyYINemHcwJr7szGQtFoTHVyvbAtKWqxAYNWdQ==
X-Google-Smtp-Source: AA6agR70SjsuYYJddFRJXTUrFz/CWwlMCj2fILiDwxN6veWaZoGRKD8kCvsT07vO/4pAW16kbrglao8qW/EMdbXFqzc=
X-Received: by 2002:a05:6512:210a:b0:48a:eaaf:b889 with SMTP id
 q10-20020a056512210a00b0048aeaafb889mr6144760lfr.89.1659465413351; Tue, 02
 Aug 2022 11:36:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220504232102.469959-1-evgreen@chromium.org> <20220506160807.GA1060@bug>
 <CAE=gft6m75T0UC2DBhfFhuSMW6TK7aatD_04sQ18WosgGVsATw@mail.gmail.com>
 <CAJZ5v0gxq=EA_WWUiCR_w8o87iTHDR7OC5wi=GRBaAQS2ofd5w@mail.gmail.com>
 <CAE=gft6V6RLc-d4AOuRUVU2u1jMGghDRSrFqiCqMCLxemui8Pw@mail.gmail.com>
 <CAE=gft5OYAgosqmwNkk=Cwoooeg93Njmnzfz=gwCaLB0Ts+=sw@mail.gmail.com> <CAE=gft6sPkhNcz7+fJuDzQo2f8fM_0Wv_OWC9W2LyvXd6M6zeQ@mail.gmail.com>
In-Reply-To: <CAE=gft6sPkhNcz7+fJuDzQo2f8fM_0Wv_OWC9W2LyvXd6M6zeQ@mail.gmail.com>
From:   Matthew Garrett <mgarrett@aurora.tech>
Date:   Tue, 2 Aug 2022 11:36:43 -0700
Message-ID: <CAHSSk05JEcZfS2tc22F+m76T3vZt-mZ7zUQaGRgSanKaFc5xBg@mail.gmail.com>
Subject: Re: [PATCH 00/10] Encrypted Hibernation
To:     Evan Green <evgreen@chromium.org>
Cc:     "Rafael J. Wysocki" <rafael@kernel.org>,
        Pavel Machek <pavel@ucw.cz>,
        LKML <linux-kernel@vger.kernel.org>,
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
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Mon, Aug 1, 2022 at 3:33 PM Evan Green <evgreen@chromium.org> wrote:

> One more bump here, as we'd really love to get encrypted hibernation
> to a form upstream would accept if at all possible. We were
> considering landing this in our Chrome OS tree for now, then coming
> back in a couple months with a "we've been baking this ourselves and
> it's going so great, oooh yeah". I'm not sure if upstream would find
> that compelling or not. But in any case, some guidance towards making
> this more upstream friendly would be well appreciated.
>
> One thing I realized in attempting to pick this myself is that the
> trusted key blob format has moved to ASN.1. So I should really move
> the creation ticket to the new ASN.1 format (if I can figure out the
> right OID for that piece), which would allow me to drop a lot of the
> ugly stuff in tpm2_unpack_blob(). Maybe if I get no other comments
> I'll work on that and resend.

I've been revamping my TPM-backed verified hibernation implementation
based on this work, so I'd definitely be enthusiastic about it being
mergeable.
