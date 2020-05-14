Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD9EE1D2F2A
	for <lists+keyrings@lfdr.de>; Thu, 14 May 2020 14:08:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726813AbgENMIv (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 14 May 2020 08:08:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726660AbgENMIv (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 14 May 2020 08:08:51 -0400
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com [IPv6:2607:f8b0:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0B9DC061A0C;
        Thu, 14 May 2020 05:08:50 -0700 (PDT)
Received: by mail-oi1-x242.google.com with SMTP id o7so24332965oif.2;
        Thu, 14 May 2020 05:08:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=A+X9SCzjiHq5xXgLxlXuhaaCXkfZMoRwiWFaO63ED7k=;
        b=LXh7ffCZ7cFjoQko7M2UBg/zWq9p8aiPR4eTHds9VYRdP1309rHAnoalOJjBr6ct7V
         +0sQS3y3xK3pOva3kdEuZIdgv76Bl7sL/iSq+BcPnLZhA9NLY7TKn1+thhpQ/oWWrHsB
         VLL0qE6Ex4lnVSR5TLvsMdnSzRhng1i/ALcL+I9hsvl5HlHxyvMXYSKYC3jzOO31bPGd
         JbBtNi0uxGrtGsAKckHXlPyJssie6gwIQ6ph+GUxyUEYSWGGdV3Qn3rgjKRMk1O0sSad
         wx1toFTSknj55aWQiV85BilRi7oKURdVecJotHMaNv2G/ooYLS8MQU1MEMqBnWk+kMuX
         f5jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=A+X9SCzjiHq5xXgLxlXuhaaCXkfZMoRwiWFaO63ED7k=;
        b=kckoFkEbgvGRtDwYwhkUvFlqdX3kngxI9RN1jr/IKllx9E692RWnB8b6yeuSvelNPC
         3FKE501weeWfAEU4YSPYCz2yUAQ1dOzSHwQVZgbr5sa5oFPvL02SRBb+CsiPVkCgakkT
         yPMCVRHq8hT5Tmp1QrkOHCb6D8KnhfMtfSPtgK7uFqAmH6narOdfsksjp5wLK9bUJjMO
         aeIgBaPNvFcwwhYFvTZJ/kZNm6zmLfMqrLEd9vQs9OgIMJBGU8ba6rh1Ne8t1+U5c2OO
         r87riGUyEK/4jAT1pV9zrGK2sgGObJFt4mvNglCCBZZRjaram2d6q7800iQtQRDw1p9V
         bTYA==
X-Gm-Message-State: AGi0PuYX8SZrXNaaB2d3SWkx9d2hBiMYSY0D20s2wDAQ/5erUmEcVA6m
        PGJr+1s8fb7gpFOhir/KtFHIuJYJiXsaGSzlkoQ=
X-Google-Smtp-Source: APiQypLdoNDtunLrzwY6UJBNb235eqap5Q5UO40EngNC8q2E7hBU6FcwYjZpL5ZutjYp3Tl1ArRVXwI9XIMfB500shk=
X-Received: by 2002:aca:5e0b:: with SMTP id s11mr28806064oib.160.1589458130415;
 Thu, 14 May 2020 05:08:50 -0700 (PDT)
MIME-Version: 1.0
References: <CAEjxPJ6pFdDfm55pv9bT3CV5DTFF9VqzRmG_Xi5bKNxPaGuOLg@mail.gmail.com>
 <158932282880.2885325.2688622278854566047.stgit@warthog.procyon.org.uk>
 <CAEjxPJ4=ZN_jKP2nX5mrMA3OxC8XLsYEmCPCD-78H4XQw=_hCA@mail.gmail.com> <3611507.1589411611@warthog.procyon.org.uk>
In-Reply-To: <3611507.1589411611@warthog.procyon.org.uk>
From:   Stephen Smalley <stephen.smalley.work@gmail.com>
Date:   Thu, 14 May 2020 08:08:39 -0400
Message-ID: <CAEjxPJ5Dw0Lf6DnUL01XSJZF9zu-ACnmxOkC0VHxGTzGcmbpRQ@mail.gmail.com>
Subject: Re: [PATCH] keys: Make the KEY_NEED_* perms an enum rather than a mask
To:     David Howells <dhowells@redhat.com>
Cc:     Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
        Paul Moore <paul@paul-moore.com>,
        Casey Schaufler <casey@schaufler-ca.com>,
        keyrings@vger.kernel.org, SElinux list <selinux@vger.kernel.org>,
        LSM List <linux-security-module@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Wed, May 13, 2020 at 7:13 PM David Howells <dhowells@redhat.com> wrote:
>
> Stephen Smalley <stephen.smalley.work@gmail.com> wrote:
>
> > >  (3) An override due to CAP_SYS_ADMIN.
> >
> > CAP_SYS_ADMIN should never skip SELinux checking.  Even for Smack,
> > there is a separate capability (CAP_MAC_ADMIN) for that purpose.
>
> The LSM doesn't get consulted at the moment.  With this patch, it will get
> consulted.
>
> > >  (4) An override due to an instantiation token being present.
> >
> > Not sure what this means but again we shouldn't skip SELinux checking
> > based on mere possession of an object capability (not a POSIX
> > capability).
>
> The kernel has delegated the instantiation of a key to the calling process and
> has given it a temporary key of type ".request_key_auth" which it has put into
> force with keyctl(KEYCTL_ASSUME_AUTHORITY).
>
> This authorisation token grants the caller the ability to (a) perform
> operations on the key it wouldn't otherwise have permission to do, (b) use the
> key instantiation keyctls and (c) temporarily search the keyrings of the
> caller of request_key() using the creds of that caller and to read/use the
> keys found therein if the caller was permitted to do so.
>
> > It would be better if the permission indicated the actual operation
> > (e.g. KEY_NEED_INVALIDATE_SPECIAL), and the decision whether to permit
> > CAP_SYS_ADMIN processes to override was left to the security modules.
> > SELinux doesn't automatically allow CAP_SYS_ADMIN processes to do
> > everything.
>
> These individual permissions don't exist yet.  I have an ACL patchset that
> allows me to add a greater range - though there's issues with SELinux there
> also.
>
> Also, the keyrings are specially marked to say that the sysadmin is allowed to
> flush them at the moment - but that can go away with the ACL stuff.
>
> > > +       switch (need_perm) {
> > > +       case KEY_NEED_UNLINK:
> > > +       case KEY_SYSADMIN_OVERRIDE:
> > > +       case KEY_AUTHTOKEN_OVERRIDE:
> > > +       case KEY_DEFER_PERM_CHECK:
> > >                 return 0;
> >
> > We really shouldn't be skipping any/all checking on CAP_SYS_ADMIN or
> > an AUTHTOKEN; those should still be subject to MAC policy.
>
> I'm not sure how to do that.
>
> Note that KEY_NEED_UNLINK *must not* be overruled by the MAC policy.  The
> value is only there because lookup_user_key() requires something to be put
> into that parameter - it's more of a courtesy thing, I suppose.
>
> Why should AUTHTOKEN be subject to MAC policy?  The kernel has told the
> process to go and instantiate a key.  It shouldn't really then turn around and
> tell the process "oh, but you're not actually allowed to do that".

On what basis did the kernel authorize the process to instantiate the
key?  At what point did a security module get involved in the decision
as to what process(es) are authorize to instantiate a key,
particularly for a process with a different credential/security
context?
