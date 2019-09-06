Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 301FBAC0AA
	for <lists+keyrings@lfdr.de>; Fri,  6 Sep 2019 21:41:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393408AbfIFTlk convert rfc822-to-8bit (ORCPT
        <rfc822;lists+keyrings@lfdr.de>); Fri, 6 Sep 2019 15:41:40 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50926 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2393381AbfIFTlk (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Fri, 6 Sep 2019 15:41:40 -0400
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com [209.85.221.69])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id CCE7EC04D312
        for <keyrings@vger.kernel.org>; Fri,  6 Sep 2019 19:41:39 +0000 (UTC)
Received: by mail-wr1-f69.google.com with SMTP id l6so3001935wrn.2
        for <keyrings@vger.kernel.org>; Fri, 06 Sep 2019 12:41:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=52DIK7NJqgCF0lriDxmYd5biSt16yJkilPd+S1AphLw=;
        b=Dx0noblIaYhZ93iS5+hv/bjjc5PAzxzV/AksH670omvPasZLmY2G4zEKUH4qgjwgYJ
         RsCXHN5DkjVDbem6Sh+lXMFr+v+gNeK4Low9CC5JhxEhQVMIuuv4VewSavI6EN5J+4Ib
         NRr+Rikz6njX7ga7/BB94GWvLg8MZixMXx4MRXZih/nEvOPNWxz8nmZPFD9jfpmQgo6H
         M+VDmnufA/xwKQLp1YJkTUVdh9CXt6H/++CpeASu+p0Rtq5LGOxULsAVF+k0VehLBnfw
         RNgpmCJbGvVxo0Rxj5V0ZgES5LNzLyCzsY9S/3uucWZgVHpIPP+1XJuqSYO9YQkrOsUN
         2Onw==
X-Gm-Message-State: APjAAAWu70n356xitdlac0E8ZPRglqEavcnmmHtk3EkMneUFYZGjiJNE
        mjHKJEn27Mor/KL/iqzzL2qUGuw8GDfLHqK4tHtQ8xkxJQhKw/x1JK4aj21e+RBEN9HJ3O1TrXK
        T3/18m1yxavaqt75TCKJcnRHkob5Zh7jGaY8=
X-Received: by 2002:a05:600c:21d1:: with SMTP id x17mr7889446wmj.123.1567798898422;
        Fri, 06 Sep 2019 12:41:38 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxRrLCtnVzxTSoLuDOtC+daCshtNVcy84u/UeLIXysZdasC4bvLIHhDt5U2jH6ScpVJJ6HgYq0HtFjLJ/mny5c=
X-Received: by 2002:a05:600c:21d1:: with SMTP id x17mr7889420wmj.123.1567798898173;
 Fri, 06 Sep 2019 12:41:38 -0700 (PDT)
MIME-Version: 1.0
References: <156763534546.18676.3530557439501101639.stgit@warthog.procyon.org.uk>
 <CAHk-=wh5ZNE9pBwrnr5MX3iqkUP4nspz17rtozrSxs5-OGygNw@mail.gmail.com>
 <17703.1567702907@warthog.procyon.org.uk> <CAHk-=wjQ5Fpv0D7rxX0W=obx9xoOAxJ_Cr+pGCYOAi2S9FiCNg@mail.gmail.com>
 <CAKCoTu7ms_Mr-q08d9XB3uascpzwBa5LF9JTT2aq8uUsoFE8aQ@mail.gmail.com>
 <CAHk-=wjcsxQ8QB_v=cwBQw4pkJg7pp-bBsdWyPivFO_OeF-y+g@mail.gmail.com> <CAKCoTu70E9cbVu=jVG4EiXnTNiG-znvri6Omh2t++1zRw+639Q@mail.gmail.com>
In-Reply-To: <CAKCoTu70E9cbVu=jVG4EiXnTNiG-znvri6Omh2t++1zRw+639Q@mail.gmail.com>
From:   Ray Strode <rstrode@redhat.com>
Date:   Fri, 6 Sep 2019 15:41:01 -0400
Message-ID: <CAKCoTu4h0t5YU5eVUbaj+=jKAZpkNBZjDyr6Y1kON9ywv=ceUA@mail.gmail.com>
Subject: Re: Why add the general notification queue and its sources
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     David Howells <dhowells@redhat.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Steven Whitehouse <swhiteho@redhat.com>,
        Nicolas Dichtel <nicolas.dichtel@6wind.com>, raven@themaw.net,
        keyrings@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-block <linux-block@vger.kernel.org>,
        Christian Brauner <christian@brauner.io>,
        LSM List <linux-security-module@vger.kernel.org>,
        linux-fsdevel <linux-fsdevel@vger.kernel.org>,
        Linux API <linux-api@vger.kernel.org>,
        Linux List Kernel Mailing <linux-kernel@vger.kernel.org>,
        Al Viro <viro@zeniv.linux.org.uk>,
        "Ray, Debarshi" <debarshi.ray@gmail.com>,
        Robbie Harwood <rharwood@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Hi,

On Fri, Sep 6, 2019 at 3:32 PM Ray Strode <rstrode@redhat.com> wrote:
> of course, one advantage of having the tickets kernel side is nfs could
> in theory access them directly, rather than up calling back to userspace...
No, that's not true actually, it's still going to need to go to
userspace to do hairy
context setup i guess...

so 🤷 dunno.
