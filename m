Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E5588D95A2
	for <lists+keyrings@lfdr.de>; Wed, 16 Oct 2019 17:32:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404949AbfJPPcM (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 16 Oct 2019 11:32:12 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:41296 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404946AbfJPPcM (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 16 Oct 2019 11:32:12 -0400
Received: by mail-lj1-f196.google.com with SMTP id f5so24495826ljg.8
        for <keyrings@vger.kernel.org>; Wed, 16 Oct 2019 08:32:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=x4sUXBF9N+gOqGoXUSe/0E2VksmAjHdkiv7KSR2ftGI=;
        b=KN++Zn81C01LK7bngv2WQhecCB2pvDWa6MiPOCNK9giCb55GzPd38NprLWCi9y4Rmp
         G5JVpEFhN07gxtvQKkcodZ0c/iin5yb7op+6svXAeHTJxJPM5HZz2LuFX2hGczINIWnp
         zjAlhPJ3IIlR8ZNhwPZ4TPeH42AI6XYGcDMmI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=x4sUXBF9N+gOqGoXUSe/0E2VksmAjHdkiv7KSR2ftGI=;
        b=ZrBEe4BXDYupjPArE85MGWm68aBhXpY2Dt9zTi8IEPvzbiO5Qnx3vi0ZF5XGZmpKA7
         528sAp0tV6/v3O/5qWR2Kce5JPR6k7/9UfrQ/F4LrXfQUWOeZ8iJijYcGB9RaEWlZRmM
         nfZMaAf3b3qfeLMVSSCjDEyYeIAV3xZN53PunAXHQ8LzpYZleQ82VddSSK9pZYo25p8/
         8Tgw3PNbL5myINkGqKHtoRBNfmgaIRZYTPeUfHK9bRKUJIjEtYGyuIBABD9aTHVoGNa9
         spIRC0PjgIbfQR4k3ONMldHVuDqqlG7a//T7OTmUWwPX5g1vXv17xtSPPohINyCi86ro
         MEjQ==
X-Gm-Message-State: APjAAAUMqKiYpqwCFwB1dYNXhnstFyJNUVjmlY65M0NcNumFJu9QOBR0
        ZRN5CZuM4VlqfDprFBZRgjE0+NkQpCU=
X-Google-Smtp-Source: APXvYqx6vN1qlbnsoUh2WVStEsAFvbLjBEKoPyPqh20zWZeQL6gDGrl4/X5/dbk4quEUTsijPJEnEw==
X-Received: by 2002:a2e:8716:: with SMTP id m22mr14018032lji.102.1571239929394;
        Wed, 16 Oct 2019 08:32:09 -0700 (PDT)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com. [209.85.208.181])
        by smtp.gmail.com with ESMTPSA id e29sm6325498ljb.105.2019.10.16.08.32.05
        for <keyrings@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Oct 2019 08:32:06 -0700 (PDT)
Received: by mail-lj1-f181.google.com with SMTP id d1so24422464ljl.13
        for <keyrings@vger.kernel.org>; Wed, 16 Oct 2019 08:32:05 -0700 (PDT)
X-Received: by 2002:a2e:545:: with SMTP id 66mr4189350ljf.133.1571239925218;
 Wed, 16 Oct 2019 08:32:05 -0700 (PDT)
MIME-Version: 1.0
References: <157117606853.15019.15459271147790470307.stgit@warthog.procyon.org.uk>
 <157117608708.15019.1998141309054662114.stgit@warthog.procyon.org.uk>
 <CAHk-=whiz1sHXu8SVZKEC2dup=r5JMrftPtEt6ff9Ea8dyH8yQ@mail.gmail.com> <6900.1571235985@warthog.procyon.org.uk>
In-Reply-To: <6900.1571235985@warthog.procyon.org.uk>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Wed, 16 Oct 2019 08:31:48 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgMZR8TWpmRBPytGmWJX=C=-bCb5D2PsCx0LUNemAPexA@mail.gmail.com>
Message-ID: <CAHk-=wgMZR8TWpmRBPytGmWJX=C=-bCb5D2PsCx0LUNemAPexA@mail.gmail.com>
Subject: Re: [RFC PATCH 02/21] Add a prelocked wake-up
To:     David Howells <dhowells@redhat.com>
Cc:     Tim Chen <tim.c.chen@linux.intel.com>,
        Kan Liang <kan.liang@intel.com>,
        Casey Schaufler <casey@schaufler-ca.com>,
        Stephen Smalley <sds@tycho.nsa.gov>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Nicolas Dichtel <nicolas.dichtel@6wind.com>, raven@themaw.net,
        Christian Brauner <christian@brauner.io>,
        keyrings@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-block <linux-block@vger.kernel.org>,
        LSM List <linux-security-module@vger.kernel.org>,
        linux-fsdevel <linux-fsdevel@vger.kernel.org>,
        Linux API <linux-api@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Wed, Oct 16, 2019 at 7:26 AM David Howells <dhowells@redhat.com> wrote:
>
> Btw, is there any point in __wake_up_sync_key() taking a nr_exclusive
> argument since it clears WF_SYNC if nr_exclusive != 1 and doesn't make sense
> to be >1 anyway.

Ack, looks sane to me.

We have _very_ few users of nr_exclusive. I wonder if it's even worth
having at all, but it's definitely not worth it here.

I'd love for nr_exclusive to go away and be replaced by WF_ALL
instead. Right now it looks like there is one SGI driver that uses it,
and the sbitmap code. That was all I could find.

Oh well. You removing one case is at last a small amount of progress.

         Linus
