Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8F42BAAB87
	for <lists+keyrings@lfdr.de>; Thu,  5 Sep 2019 20:51:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726837AbfIESvx (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 5 Sep 2019 14:51:53 -0400
Received: from mx1.redhat.com ([209.132.183.28]:41058 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388877AbfIESvx (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Thu, 5 Sep 2019 14:51:53 -0400
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com [209.85.221.71])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id BA59B7CB80
        for <keyrings@vger.kernel.org>; Thu,  5 Sep 2019 18:51:52 +0000 (UTC)
Received: by mail-wr1-f71.google.com with SMTP id t16so1408520wro.3
        for <keyrings@vger.kernel.org>; Thu, 05 Sep 2019 11:51:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/+X/R0y41DuJD8stDaaFF/mk4jlVxfRDTjRBOtakznc=;
        b=lG/U+H1X17ftu0CBMzD834FIotLKbkiNMFyiU7GtMsYjHiu+ZF5ywVTxG/ahHqvdw/
         mOpxWyPvRV8zh+yrUoKKPpzK8JTHMkIFBDMUvl8Bf1VxC5L0zHNTT0OBDpx5iDtsXSTW
         5/aY6bdDDIWU7SjMmAfRewWdwugr0ThYT9NjncnerIFZmYT5KqM9r96Jc+22WX5m/cUf
         StnaOiygFSXPGFDJ3xqJtmgU9h1kR+CVNi0eEvYR8/9jtadclcX7/UP0gFIJaEK+Ezls
         GFr0K7aCJljRWs3yemTIuR3oNdlPfmme0mWlm2ALkoczrzeh9phkRNjVIas6xKlzCD3Y
         hRgw==
X-Gm-Message-State: APjAAAUsnZ020gVrnuaWVqXgKKNP5xzfch08AwuKotgL++2NTyBJl9JR
        A0HA718Y8d8AspzK1dRUegcOshXwV4/0FjnFU+KWQ5ShMnjId0BZv/n1ESIfIWVqHDxvb0K4MSB
        LN59pOEx5eXmz2ZqchjA3ZfdxpMDM6hyYZFc=
X-Received: by 2002:a05:600c:21d1:: with SMTP id x17mr3763571wmj.123.1567709511265;
        Thu, 05 Sep 2019 11:51:51 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxxppOJbXRzr0HT1qBIm7hjC+zxuRCss37FvJwDjsHuKSxoe+byuVe16izziNYRTPD8dFxdzcLlPcTR/VI7zzA=
X-Received: by 2002:a05:600c:21d1:: with SMTP id x17mr3763540wmj.123.1567709510985;
 Thu, 05 Sep 2019 11:51:50 -0700 (PDT)
MIME-Version: 1.0
References: <156763534546.18676.3530557439501101639.stgit@warthog.procyon.org.uk>
 <CAHk-=wh5ZNE9pBwrnr5MX3iqkUP4nspz17rtozrSxs5-OGygNw@mail.gmail.com>
 <17703.1567702907@warthog.procyon.org.uk> <CAHk-=wjQ5Fpv0D7rxX0W=obx9xoOAxJ_Cr+pGCYOAi2S9FiCNg@mail.gmail.com>
 <11667f69-fbb5-28d2-3c31-7f865f2b93e5@redhat.com>
In-Reply-To: <11667f69-fbb5-28d2-3c31-7f865f2b93e5@redhat.com>
From:   Ray Strode <rstrode@redhat.com>
Date:   Thu, 5 Sep 2019 14:51:14 -0400
Message-ID: <CAKCoTu7ms4ckwDA_-onuJg+famnMzGZE9gGUcqqMz0kCAAECRg@mail.gmail.com>
Subject: Re: Why add the general notification queue and its sources
To:     Steven Whitehouse <swhiteho@redhat.com>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        David Howells <dhowells@redhat.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Nicolas Dichtel <nicolas.dichtel@6wind.com>, raven@themaw.net,
        keyrings@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-block <linux-block@vger.kernel.org>,
        Christian Brauner <christian@brauner.io>,
        LSM List <linux-security-module@vger.kernel.org>,
        linux-fsdevel <linux-fsdevel@vger.kernel.org>,
        Linux API <linux-api@vger.kernel.org>,
        Linux List Kernel Mailing <linux-kernel@vger.kernel.org>,
        David Lehman <dlehman@redhat.com>, Ian Kent <ikent@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Hi,

On Thu, Sep 5, 2019 at 2:37 PM Steven Whitehouse <swhiteho@redhat.com> wrote:
> The original reason for the mount notification mechanism was so that we
> are able to provide information to GUIs and similar filesystem and
> storage management tools, matching the state of the filesystem with the
> state of the underlying devices. This is part of a larger project
> entitled "Project Springfield" to try and provide better management
> tools for storage and filesystems. I've copied David Lehman in, since he
> can provide a wider view on this topic.
So one problem that I've heard discussed before is what happens in a thinp
setup when the disk space is overallocated and gets used up. IIRC, the
volumes just sort of eat themselves?

Getting proper notification of looming catastrophic failure to the
workstation user
before it's too late would be useful, indeed.

I don't know if this new mechanism dhowells has development can help with that,
and/or if solving that problem is part of the Project Springfield
initiative or not. Do you
know off hand?

--Ray
