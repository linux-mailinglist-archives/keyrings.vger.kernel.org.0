Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6F8AF37D48
	for <lists+keyrings@lfdr.de>; Thu,  6 Jun 2019 21:34:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726642AbfFFTeP (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 6 Jun 2019 15:34:15 -0400
Received: from mail.kernel.org ([198.145.29.99]:55048 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726077AbfFFTeO (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Thu, 6 Jun 2019 15:34:14 -0400
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9B9A8208C0
        for <keyrings@vger.kernel.org>; Thu,  6 Jun 2019 19:34:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1559849653;
        bh=Bp9xchL8n3xgevCioLqnZ63AUKcEYYQAzSzsygrBl6U=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=RBRtIyBB6JRNznHrIhb4q1KHnYr5tws3QEzDnGMgH4rteOcBCigXhZ9nMd0Yy72WM
         dLzTX5FWJGe450kCl9RNQMeRZEIvpIEfPi5acLNT0YcKLyMWzeHigcuL9dnQYPIUpz
         Lf00gil1T+3Mfh5KAZ8jFRh0a+kgF3EQo9n2ER1M=
Received: by mail-wr1-f47.google.com with SMTP id p11so3617228wre.7
        for <keyrings@vger.kernel.org>; Thu, 06 Jun 2019 12:34:13 -0700 (PDT)
X-Gm-Message-State: APjAAAX+q3tkesEvJ3wYzr6jD3JKK/flyopoOdr6wMk7SZUsrHkgEKQ8
        PQPXPRPD6Dck1mCHYR4S9ua72yX1nTcXdG1e+xVSmA==
X-Google-Smtp-Source: APXvYqyO0ntp0Z78do7NHqcK5WkwMIKd2ggjzZIlWltFYH5IsItDZMYnUyFRT0pbmOUPFNCMQaXV3mrI0CbuFbD87wc=
X-Received: by 2002:adf:ef48:: with SMTP id c8mr9349668wrp.352.1559849652241;
 Thu, 06 Jun 2019 12:34:12 -0700 (PDT)
MIME-Version: 1.0
References: <155981411940.17513.7137844619951358374.stgit@warthog.procyon.org.uk>
 <155981413016.17513.10540579988392555403.stgit@warthog.procyon.org.uk>
 <176F8189-3BE9-4B8C-A4D5-8915436338FB@amacapital.net> <11031.1559833574@warthog.procyon.org.uk>
 <CALCETrUukxNNhbBAifxz1EADzLOvYKoh9oqqZFJteU+MMhh1ig@mail.gmail.com> <e434a62a-d92a-c6e2-cda1-309ac99d4d5c@schaufler-ca.com>
In-Reply-To: <e434a62a-d92a-c6e2-cda1-309ac99d4d5c@schaufler-ca.com>
From:   Andy Lutomirski <luto@kernel.org>
Date:   Thu, 6 Jun 2019 12:34:00 -0700
X-Gmail-Original-Message-ID: <CALCETrVc=PpCjSC-pjcjr0WMKtgVXWijwB3FX+tSp5VOH2bCpg@mail.gmail.com>
Message-ID: <CALCETrVc=PpCjSC-pjcjr0WMKtgVXWijwB3FX+tSp5VOH2bCpg@mail.gmail.com>
Subject: Re: [PATCH 01/10] security: Override creds in __fput() with last
 fputter's creds [ver #3]
To:     Casey Schaufler <casey@schaufler-ca.com>
Cc:     Andy Lutomirski <luto@kernel.org>,
        David Howells <dhowells@redhat.com>,
        Al Viro <viro@zeniv.linux.org.uk>, raven@themaw.net,
        Linux FS Devel <linux-fsdevel@vger.kernel.org>,
        Linux API <linux-api@vger.kernel.org>,
        linux-block@vger.kernel.org, keyrings@vger.kernel.org,
        LSM List <linux-security-module@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>, Jann Horn <jannh@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Thu, Jun 6, 2019 at 12:09 PM Casey Schaufler <casey@schaufler-ca.com> wrote:
>
> On 6/6/2019 10:18 AM, Andy Lutomirski wrote:
> > On Thu, Jun 6, 2019 at 8:06 AM David Howells <dhowells@redhat.com> wrote:
> >> Andy Lutomirski <luto@amacapital.net> wrote:

> > Casey, I think you need to state your requirement in a way that's well
> > defined, and I think you need to make a compelling case that your
> > requirement is indeed worth dictating the design of parts of the
> > kernel outside LSM.
>
> Err, no, I don't believe so. There's a whole lot more
> going on in this discussion than just what's going on
> within the LSMs. Using examples from the LSMs makes it
> easier, because their policies are better defined than
> the "legacy" policies are. The most important part of the
> discussion is about ensuring that the event mechanism
> doesn't circumvent the legacy policies. Yes, I understand
> that you don't know what that means, or has to do with
> anything.
>
>

Indeed, I do not know what you have in mind about making sure this
mechanism doesn't circumvent legacy policies.  Can you elaborate?

--Andy
