Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 77921ED0C4
	for <lists+keyrings@lfdr.de>; Sat,  2 Nov 2019 23:04:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727322AbfKBWED (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Sat, 2 Nov 2019 18:04:03 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:37635 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727166AbfKBWEC (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Sat, 2 Nov 2019 18:04:02 -0400
Received: by mail-lj1-f196.google.com with SMTP id v2so13708501lji.4
        for <keyrings@vger.kernel.org>; Sat, 02 Nov 2019 15:04:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=vTCI0qHuBsBb0Kz5RbeswHqlSoPusOsIRcj6s1CCCCU=;
        b=XRll/5vMVkjx89KHnpq6WWB0oHHUpEHdiN6O6XIbNfDvJpLq9nAHdnvBRo0qcYtdlV
         dDebt2KT4z/UoQ3oT2Pk6vWaFBXKSztN5uuRAQNTvGwr3g3jPPeee0pGSv+auGk2TkT9
         /FiIqnPnAFsk6ubf5wFePKPpQhSpZfg8GPgik=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=vTCI0qHuBsBb0Kz5RbeswHqlSoPusOsIRcj6s1CCCCU=;
        b=s3H9ywtQmmlk16Fif/CCnkOY7p+aLswJaH7pwXJfP9jroieVWUdE9nCRRRstoFPIcH
         kz/xm9AwneY1+zOrIwQQsUsiMiM/DD2d+kyE4aM8Af4Kik9PncIWFRsyeDceQcdoOtPd
         Z7kvbkT+pZI8em9UyexdRxJRJlTdlwn9skUD5uGNyq5CukEl8/OTp/X0a8oBF6z+bUoY
         +VA3bYTDyRLWe5ctugVCLN+5uLPRtv/pvvfgqbShuNiDhgY2zHyd94mKy6NFHcgL5U8F
         1mxcICtGDyV9Qg8uReMwwwf8r/jHlNglARkyu7GF3za9d/P+i+B8xSi3WHaRBWnj54NI
         6drQ==
X-Gm-Message-State: APjAAAVx67rFoU3MCdHFsAlPw/7i0FQz+oQT5tn5fzOC8PJj83fzeHIc
        8SQ+HTEW/aiAluqEdRic1mMs1Xlg2Do=
X-Google-Smtp-Source: APXvYqxr+0O7nnjjR7lxYziWhZRgqc63IRcS5XWKqsJ9rDJTKxRPY2SdHZy3W9MsbD1+X3mq9zbWFg==
X-Received: by 2002:a05:651c:1202:: with SMTP id i2mr13395958lja.218.1572732240584;
        Sat, 02 Nov 2019 15:04:00 -0700 (PDT)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com. [209.85.208.174])
        by smtp.gmail.com with ESMTPSA id r4sm1919264ljn.64.2019.11.02.15.04.00
        for <keyrings@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 02 Nov 2019 15:04:00 -0700 (PDT)
Received: by mail-lj1-f174.google.com with SMTP id e9so389140ljp.13
        for <keyrings@vger.kernel.org>; Sat, 02 Nov 2019 15:04:00 -0700 (PDT)
X-Received: by 2002:a2e:3e18:: with SMTP id l24mr13611187lja.48.1572732239632;
 Sat, 02 Nov 2019 15:03:59 -0700 (PDT)
MIME-Version: 1.0
References: <25886.1572723272@warthog.procyon.org.uk> <CC3328CC-2F05-461E-AAC3-8DEBAB1BA162@amacapital.net>
In-Reply-To: <CC3328CC-2F05-461E-AAC3-8DEBAB1BA162@amacapital.net>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sat, 2 Nov 2019 15:03:43 -0700
X-Gmail-Original-Message-ID: <CAHk-=wj1BLz6s9cG9Ptk4ULxrTy=MkF7ZH=HF67d7M5HL1fd_A@mail.gmail.com>
Message-ID: <CAHk-=wj1BLz6s9cG9Ptk4ULxrTy=MkF7ZH=HF67d7M5HL1fd_A@mail.gmail.com>
Subject: Re: [RFC PATCH 11/10] pipe: Add fsync() support [ver #2]
To:     Andy Lutomirski <luto@amacapital.net>
Cc:     David Howells <dhowells@redhat.com>,
        Konstantin Khlebnikov <khlebnikov@yandex-team.ru>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Nicolas Dichtel <nicolas.dichtel@6wind.com>, raven@themaw.net,
        Christian Brauner <christian@brauner.io>,
        keyrings@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-block <linux-block@vger.kernel.org>,
        LSM List <linux-security-module@vger.kernel.org>,
        linux-fsdevel <linux-fsdevel@vger.kernel.org>,
        Linux API <linux-api@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Sat, Nov 2, 2019 at 1:31 PM Andy Lutomirski <luto@amacapital.net> wrote:
>
> Add in the fact that it=E2=80=99s not obvious that vmsplice *can* be used=
 correctly, and I=E2=80=99m wondering if we should just remove it or make i=
t just do write() under the hood.

Sure it can. Just don't modify the data you vmsplice. It's really that simp=
le.

That said, if we don't have any actual users, then we should look at
removing it (maybe turning it into "write()" as you say). Not because
it's hard to use, but simply because it probably doesn't have that
many uses.

               Linus
