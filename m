Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DABBED8360
	for <lists+keyrings@lfdr.de>; Wed, 16 Oct 2019 00:14:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389079AbfJOWOe (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 15 Oct 2019 18:14:34 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:34753 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389222AbfJOWOd (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Tue, 15 Oct 2019 18:14:33 -0400
Received: by mail-lj1-f193.google.com with SMTP id j19so21901235lja.1
        for <keyrings@vger.kernel.org>; Tue, 15 Oct 2019 15:14:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=d/Zz9M4vXV5ymfLbgnz4oj5mAYZiyyFZ4Ij6h9abXFA=;
        b=AlIXJO/ZLBv/p7d/ORSQnj90qcyxXZ/L4tcwMN1ksd4hi9eaymWS714WViotqQRLhk
         vIRHrilEHfQt3hkm1+JjO4o2Ud7MKCdkuXafJuo44Fo4GYyzQ/9AmESct2Xx7IfOK7Ok
         haqnjvvfI/PnFSGBeuzLe9ZId2U0u1ulJkPj0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=d/Zz9M4vXV5ymfLbgnz4oj5mAYZiyyFZ4Ij6h9abXFA=;
        b=LzY3tUanmfJFy0iyvMqQb1jqjo+mADumFnv/pjUBI4rJh0H8VBlNOa+Y4g0gux55pz
         PtpfoA2ZcNQkF7fObChgJ2fv3/KV+2d5uQDIoYSWlSw9dkcpd8Fs8MEUxnNQsBHc9U4F
         9NahjiAqNzletDkiR/aqY5VicmWx3cI4GZfxsWK6OOz816kD7DopBxGreafWges7bcgl
         E4raKi3sF7Fl4RRL6NNCsQe2coqfn2EptA2r5f3NPjt4YX9HIgwZR5fw8lrOoe7D3/5E
         Yz7lSyXp736Fzv9yxS3zRtuHNU1X7B/Q8iFYIVS++7scxi/k7bEwD6s67jvygGUis7v/
         2ouw==
X-Gm-Message-State: APjAAAUBdIDthz/lT96nornbRpjiT4uiAkrm4tSjYIc/Iu8Z9js0Jnj+
        JOxsPAHaJyRX7ljicJGh+AxUWZWc7Bo=
X-Google-Smtp-Source: APXvYqzaCjZMD38OFJllw62jf6ecevNB5OXz7fHFCbVYZZAohIfqxmHvourvuI/AHEugaPvKN58yIw==
X-Received: by 2002:a2e:8e87:: with SMTP id z7mr14695948ljk.9.1571177670941;
        Tue, 15 Oct 2019 15:14:30 -0700 (PDT)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com. [209.85.208.181])
        by smtp.gmail.com with ESMTPSA id n5sm6391094ljh.54.2019.10.15.15.14.27
        for <keyrings@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Oct 2019 15:14:28 -0700 (PDT)
Received: by mail-lj1-f181.google.com with SMTP id y23so21844003lje.9
        for <keyrings@vger.kernel.org>; Tue, 15 Oct 2019 15:14:27 -0700 (PDT)
X-Received: by 2002:a2e:6a04:: with SMTP id f4mr23595993ljc.97.1571177667184;
 Tue, 15 Oct 2019 15:14:27 -0700 (PDT)
MIME-Version: 1.0
References: <157117606853.15019.15459271147790470307.stgit@warthog.procyon.org.uk>
 <157117608708.15019.1998141309054662114.stgit@warthog.procyon.org.uk>
In-Reply-To: <157117608708.15019.1998141309054662114.stgit@warthog.procyon.org.uk>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Tue, 15 Oct 2019 15:14:10 -0700
X-Gmail-Original-Message-ID: <CAHk-=whiz1sHXu8SVZKEC2dup=r5JMrftPtEt6ff9Ea8dyH8yQ@mail.gmail.com>
Message-ID: <CAHk-=whiz1sHXu8SVZKEC2dup=r5JMrftPtEt6ff9Ea8dyH8yQ@mail.gmail.com>
Subject: Re: [RFC PATCH 02/21] Add a prelocked wake-up
To:     David Howells <dhowells@redhat.com>,
        Tim Chen <tim.c.chen@linux.intel.com>,
        Kan Liang <kan.liang@intel.com>
Cc:     Casey Schaufler <casey@schaufler-ca.com>,
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

On Tue, Oct 15, 2019 at 2:48 PM David Howells <dhowells@redhat.com> wrote:
>
> Add a wakeup call for a case whereby the caller already has the waitqueue
> spinlock held.

That naming is crazy.

We already have helper functions like this, and they are just called
"wake_up_locked()".

So the "prelocked" naming is just odd. Make it be
wake_up_interruptible_sync_poll_locked().

The helper function should likely be

  void __wake_up_locked_sync_key(struct wait_queue_head *wq_head,
unsigned int mode, void *key)
  {
        __wake_up_common(wq_head, mode, 1, WF_SYNC, key, NULL);
  }
  EXPORT_SYMBOL_GPL(__wake_up_locked_sync_key);

to match the other naming patterns there.

[ Unrelated ]

Looking at that mess of functions, I also wonder if we should try to
just remove the bookmark code again. It was cute, and it was useful,
but I think the problem with the page lock list may have been fixed by
commit 9a1ea439b16b ("mm: put_and_wait_on_page_locked() while page is
migrated") which avoids the retry condition with
migrate_page_move_mapping().

Tim/Kan? Do you have the problematic load still?

              Linus
