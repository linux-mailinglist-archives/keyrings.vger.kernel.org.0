Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 39328DF263
	for <lists+keyrings@lfdr.de>; Mon, 21 Oct 2019 18:05:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729646AbfJUQF4 (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Mon, 21 Oct 2019 12:05:56 -0400
Received: from mail-qt1-f195.google.com ([209.85.160.195]:37234 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729634AbfJUQF4 (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Mon, 21 Oct 2019 12:05:56 -0400
Received: by mail-qt1-f195.google.com with SMTP id g50so7641072qtb.4
        for <keyrings@vger.kernel.org>; Mon, 21 Oct 2019 09:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=531cCBl4i9yQxVHY6Fc4jmInfUcTFsMFBRwLLqkbbsA=;
        b=J7m8XyLbnCcCFa+RkEUdG5aQ77qhKM2xKK6QuM8oOcwpzcbiNdS/9JQ7KHm5eohZ+g
         0KPgSRseqMPuYQ07ppyBTTjVZ+dlpfWvPN5i8MFVoOVMdK6LVvzEBtlJxbZBiE3ShkEi
         I0stg3FSjNkckzSGuEwjilGaEm1Uv+080YwkGYmY2q9688JWtfo6YO6wTTOyKRGLoHCA
         4wF0ppmavgG3PZYTMg3dNwAqDzBzpBoLpEXUkC/8VdD+K0KvVqulh4h/2Oi6M6hpiTQ5
         UPzd7k0Iy84JOsG/yGm8aHLFC4AS/owz2/KzFs2D6M7pSTnx7w988q0bGHsDrpv/M7pu
         ViTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=531cCBl4i9yQxVHY6Fc4jmInfUcTFsMFBRwLLqkbbsA=;
        b=F7dCQDr786oMOsh34mj75Jv/MpkbNZR77OLzyZ1yv+hY73E3kqg30aZXzPu8DOldnx
         kacW/GZgJQGuKdpZcIt5RSxQcRAr8hmVQrOJvXJTTTUbvOp762CZwQpo2yda/gXBBChw
         BFG13pzHbt+OdMHXXrhxueic6Z4VP23qn1llLjEZmQCqIkDl7/5wzPlStBSGfVt9Lpk8
         3CmCDB53P3gFIWe5Uz0WssTfdPqLe019iTzDFFFnQhrPmLKI5Hvis+hX3AU099Oc/N5W
         0uKfJJiMKARd6H6sYcusOfAKi99w8MKL50IbQmW2dMgHMHiF+eoerGL0ymwOod5MO0K8
         hILw==
X-Gm-Message-State: APjAAAVNqslKvuQ5HmnmOerr/NpYDqH6FPmRXZYu1QrYqTcQhq+5KM8S
        oELDKhTnpFMH8G69NMWxvBmya+qMZa7UHHWVjH8CCw==
X-Google-Smtp-Source: APXvYqx+V80R0g8ka4mvuphFpmFxHIfFs0r+6m1My9wPI75glpXldHuxqSk3nZBPJ2DOnrYuuGI+ifd5vi7AHNKn2uE=
X-Received: by 2002:ac8:3408:: with SMTP id u8mr25315451qtb.380.1571673953322;
 Mon, 21 Oct 2019 09:05:53 -0700 (PDT)
MIME-Version: 1.0
References: <000000000000830fe50595115344@google.com> <8509.1571673553@warthog.procyon.org.uk>
In-Reply-To: <8509.1571673553@warthog.procyon.org.uk>
From:   Dmitry Vyukov <dvyukov@google.com>
Date:   Mon, 21 Oct 2019 18:05:41 +0200
Message-ID: <CACT4Y+ZZ2tmUg9PAKouK5zhNw=BDWD7+jfo_JjB92Eb+g_gAQQ@mail.gmail.com>
Subject: Re: WARNING: refcount bug in find_key_to_update
To:     David Howells <dhowells@redhat.com>
Cc:     syzbot <syzbot+6455648abc28dbdd1e7f@syzkaller.appspotmail.com>,
        Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
        James Morris <jmorris@namei.org>, keyrings@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>,
        linux-security-module <linux-security-module@vger.kernel.org>,
        "Serge E. Hallyn" <serge@hallyn.com>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Mon, Oct 21, 2019 at 5:59 PM David Howells <dhowells@redhat.com> wrote:
>
> syzbot <syzbot+6455648abc28dbdd1e7f@syzkaller.appspotmail.com> wrote:
>
> > syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=11c8adab600000
>
> How do I tell what's been passed into the add_key for the encrypted key?

Hi David,

The easiest and most reliable would be to run it and dump the data in
the kernel function.
