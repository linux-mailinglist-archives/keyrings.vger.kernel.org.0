Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DDCABD83D6
	for <lists+keyrings@lfdr.de>; Wed, 16 Oct 2019 00:37:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732857AbfJOWhk (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 15 Oct 2019 18:37:40 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:38851 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732851AbfJOWhk (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Tue, 15 Oct 2019 18:37:40 -0400
Received: by mail-lf1-f67.google.com with SMTP id u28so15752637lfc.5
        for <keyrings@vger.kernel.org>; Tue, 15 Oct 2019 15:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fon9Xqueqx/Fq0wGHnHqEDUCXyflZLUwsevU6fmx6jE=;
        b=SIEI+eyzsLvgKQSWy68fNU4waAO3JnvS6nzHr5/fZu5+F3lS+ninFSB5dUKCVryHZ+
         kl8H8QJRcmYfRoBpcYQdlcvyFYmbnE5AhMRuYRji7sgqsBgEDlqfBvGU7GUQWJu2UMf7
         6W/csLC8ZHTI+HN72RKiuRYhkxOOMexsvDhzA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fon9Xqueqx/Fq0wGHnHqEDUCXyflZLUwsevU6fmx6jE=;
        b=ufZKAUlSyMoJVaUWiUrlNU1f3aB/K1TN1q7M5PCYz4wd8IsiYYMBol6rAdJSKmrAtw
         VW+CQl+aNDedO780L28AmwrpaURD8YyCQcTEeTua2nEmLZjmrB53ZpXSASFTnr6ICWtB
         7olflwnrobS74xLgaHN/5fJCmdDzPE4DwCOpCs9Gqvs/3Hb1+6s+lJ09fAxnV+ucG7iC
         WYa9JHp+dO5flxbxOIEqj5MfNbwE0JHWGj84+2BYcTWjmCOMpvVo/KnlOd6NdICe5BPu
         JJdPT+tFwgUQET7yu29QvybXmF07PeXuW1kH7yDg9u5YDK6h3e85VYCfVAdnSSirQASG
         iPRw==
X-Gm-Message-State: APjAAAUxsbgVNVcURnwLdutJpvV1zcvMsFt2tkldHs9nyo9QC39I4nEd
        sXXWknoFwSgMi90IIoYyXrsiVt6Iim0=
X-Google-Smtp-Source: APXvYqzfdxQmHqsMMe/A/In8UnO6ht17F5sM4K2q3icQVk0y538SpBz+VXPI7XCMpS3ONXljwZFxFQ==
X-Received: by 2002:a19:ee0f:: with SMTP id g15mr22510333lfb.23.1571179056839;
        Tue, 15 Oct 2019 15:37:36 -0700 (PDT)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com. [209.85.167.53])
        by smtp.gmail.com with ESMTPSA id c26sm6037419ljj.45.2019.10.15.15.37.36
        for <keyrings@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Oct 2019 15:37:36 -0700 (PDT)
Received: by mail-lf1-f53.google.com with SMTP id t8so15707667lfc.13
        for <keyrings@vger.kernel.org>; Tue, 15 Oct 2019 15:37:36 -0700 (PDT)
X-Received: by 2002:a19:5504:: with SMTP id n4mr4230778lfe.106.1571178744104;
 Tue, 15 Oct 2019 15:32:24 -0700 (PDT)
MIME-Version: 1.0
References: <157117606853.15019.15459271147790470307.stgit@warthog.procyon.org.uk>
In-Reply-To: <157117606853.15019.15459271147790470307.stgit@warthog.procyon.org.uk>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Tue, 15 Oct 2019 15:32:08 -0700
X-Gmail-Original-Message-ID: <CAHk-=whfCy+WCZ5SXZGi4QEhxXm=EjZjj4R9+o4q-QR3saMyfg@mail.gmail.com>
Message-ID: <CAHk-=whfCy+WCZ5SXZGi4QEhxXm=EjZjj4R9+o4q-QR3saMyfg@mail.gmail.com>
Subject: Re: [RFC PATCH 00/21] pipe: Keyrings, Block and USB notifications
To:     David Howells <dhowells@redhat.com>
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

Aside from the two small comments, the pipe side looked reasonable,
but I stopped looking when the patches moved on to the notificaiton
part, and maybe I missed something in the earlier ones too.

Which does bring me to the meat of this email: can we please keep the
pipe cleanups and prepwork (and benchmarking) as a separate patch
series? I'd like that to be done separately from the notification
code, since it's re-organization and cleanup - while the eventual goal
is to be able to add messages to the pipe atomically, I think the
series makes sense (and should make sense) on its own.

          Linus
