Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1D6A062ED5
	for <lists+keyrings@lfdr.de>; Tue,  9 Jul 2019 05:27:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726089AbfGIDZc (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Mon, 8 Jul 2019 23:25:32 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:34675 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726358AbfGIDZ2 (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Mon, 8 Jul 2019 23:25:28 -0400
Received: by mail-lf1-f68.google.com with SMTP id b29so12376698lfq.1
        for <keyrings@vger.kernel.org>; Mon, 08 Jul 2019 20:25:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=F3rWTmIZ2TItJD9vaocdwFtzxzYX0cQ1R1FA0/bqwWg=;
        b=FAQvo0GTz6RjfnQ70KNGhN3vKI7sj9c4duyQu/7bXaNXaeuHaVhHZSntRfoYxOA1Nl
         MSHo1X7i1Ty/AAb8O0talfCEVK5lTu33jFHYfQpTBxa8Muk8ppfQ1J+GXpb8abDF/41c
         OV0NwiPqxGUf8sgE+vzQzA+mjaR0V5jmed8tg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=F3rWTmIZ2TItJD9vaocdwFtzxzYX0cQ1R1FA0/bqwWg=;
        b=HO88XyUk6v4BkuM/gc9hrTWM8SHcmEq+2IPhCWJs+RIibhgI1oq1Tl52D2YLQ08aq4
         +VJdMaaCryg3cxZDSxi9VFoP1Tns6dFWAKCg35Qmg10y36DGSYEM9qn0ksFcB8fi5mpt
         /zLIZrAvzGtSQiCEGNC72t0DGKozTb/k4oMOxipiRcLekHy5TN5u1kXofohQ08znujzK
         +MQrhrM24rVVNxKaduKQ4h0PAM5aOZEPCXNs2AeWeVZU/PzkDxWWWrVSem65w+Ji/f80
         +eRsf8ANt3v0UwZm1XKeSyUXrZYCYjFYbXZkeD6gx4Iz/dALUjMa2vdsY+8BYxcUcvrB
         AXbQ==
X-Gm-Message-State: APjAAAU+DXunizeEjirYsUWgT9uZPDVbOrDdfpZ1z4dDiFl/umNn62q6
        B+vQhBIBys4cs7xHYv77bSCPrbDWMBQ=
X-Google-Smtp-Source: APXvYqwiOrXpFtaO4bmOYqf/5jdkboT+lZ2VjgYOGMjZk0AVnkDghlWpP8/R6DiNZAFOP73EBXBaJg==
X-Received: by 2002:a19:e008:: with SMTP id x8mr10234177lfg.103.1562642725190;
        Mon, 08 Jul 2019 20:25:25 -0700 (PDT)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com. [209.85.167.41])
        by smtp.gmail.com with ESMTPSA id q2sm3012757lfj.25.2019.07.08.20.25.24
        for <keyrings@vger.kernel.org>
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Mon, 08 Jul 2019 20:25:24 -0700 (PDT)
Received: by mail-lf1-f41.google.com with SMTP id c19so6704429lfm.10
        for <keyrings@vger.kernel.org>; Mon, 08 Jul 2019 20:25:24 -0700 (PDT)
X-Received: by 2002:a19:641a:: with SMTP id y26mr9564597lfb.29.1562642723658;
 Mon, 08 Jul 2019 20:25:23 -0700 (PDT)
MIME-Version: 1.0
References: <10976.1562256893@warthog.procyon.org.uk>
In-Reply-To: <10976.1562256893@warthog.procyon.org.uk>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Mon, 8 Jul 2019 20:25:07 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjEowdfG7v_4ttu3xhf9gqopj1+q1nGG86+mGfGDTEBBg@mail.gmail.com>
Message-ID: <CAHk-=wjEowdfG7v_4ttu3xhf9gqopj1+q1nGG86+mGfGDTEBBg@mail.gmail.com>
Subject: Re: keyrings pull requests for the next merge window
To:     David Howells <dhowells@redhat.com>
Cc:     LSM List <linux-security-module@vger.kernel.org>,
        Linux List Kernel Mailing <linux-kernel@vger.kernel.org>,
        James Morris <jmorris@namei.org>, keyrings@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

[ Adding a few mailing lists, since the thrust of my email is about
more people being around and involved, and the pull requests
themselves were indeed cc'd to the mailing lists too ]

On Thu, Jul 4, 2019 at 9:15 AM David Howells <dhowells@redhat.com> wrote:
>
> I have a bunch of keyrings patches to be pulled in during the merge window.  I
> believe you want security patches to go directly to you rather than through
> James now?
>
> I've divided these patches into four logical sets, though due to conflicting
> changes the sets are in a sequence, built one upon another.
>
> How do you want them presenting?  Do you want a pull request for each set, one
> for all of them or would you prefer they go through James's security tree?

So I was traveling when this email came in, but in the meantime you
sent the four pull requests and I have now pulled them all. You should
have gotten the pr-tracker-bot notification already (or it will happen
soon).

An initial very positive comment: the pull requests themselves with
all the explanations were very good. That part of the process worked
very well, I think.

I felt like I got an explanation of what I pulled, and I think the
merge commits themselves are the better for it, so that the
explanation now remains in the git history, and other people too can
see what got merged and why.

HOWEVER.

There are parts I really didn't much like was when I look at all the
individual commits themselves.

Again, the commit messages there are good and that part all looks fine.

BUT.

The history itself looks questionable. The dates don't make sense, and
the different branches were obviously all done together as a linear
history, rebased, and worked on as one single branch, . Fine - it was
then at least partitioned into sensible parts, and sometimes this is
how it really ends up working, but I did get the feeling that this was
all very artificial and more importantly I get the feeling that none
of the commits had any real-life exposure.

That lack of real-life exposure also shows in the almost complete lack
of any reviews, any commentary from other people, and absolutely
nobody else seems to have been involved. Not as an author, but not in
any other capacity either. There were a couple of initial commits that
had reviewed-by's, but apart from that there really was *no* sign of
any outside involvement at all.

I looked up a couple of the patches on patchwork too, and saw zero
discussion. Maybe the ones I picked just happened to have none, but I
really get the feeling that pretty much none of this had any external
input what-so-ever.

And that makes me unhappy.

In other words: the pull requests, the explanations, everything looked
very good and I enjoyed that part. I don't see any new warnings, and
everything built fine at every stage. I have no real technical
complaints from that angle.

But I absolutely abhor how this seems to all have been developed in a
complete and utter vacuum. That just fundamentally worries me.  I
can't point to anything being bad, but the lack of any kind of work
from anybody else just makes me antsy.

Is there really nobody else working or caring about this at all?

This is not new, and I do note that your afs work tends to have the
same pattern (but honestly, when it comes to one particular odd
filesystem or driver, it's not something I react to). It's just
perhaps more noticeable to me now that I pull directly, and it's much
more noticeable when it's a _subsystem_ rather than something like a
end-point driver/filesystem. I think the pulls themselves worked, and
I don't mind the direct pulling, but I *do* notice that I end up
minding the fact that now with the direct pulls, there's even _less_
of a "at least somebody else looked and cared".

Put another way: I'd like other people to be involved. Either as
reviewers, or as intermediate people, or _something_. The "David
Howells lives in his own world and nobody else looks at it and then he
sends it directly to Linus" model makes me somewhat unhappy.

Again, I'd like to stress that the pull requests themselves were fine,
and I have no complaints on that side and I have (at least as of yet)
no reason to worry about the code itself. It's really the "lone
developer sends directly to me" that stands out as not happening
elsewhere that I'm worried about.

Hmm?

                   Linus
