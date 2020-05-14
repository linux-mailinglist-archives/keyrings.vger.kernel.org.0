Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E85331D335E
	for <lists+keyrings@lfdr.de>; Thu, 14 May 2020 16:46:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728108AbgENOp6 (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 14 May 2020 10:45:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727050AbgENOpx (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 14 May 2020 10:45:53 -0400
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com [IPv6:2607:f8b0:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EC73C061A0F;
        Thu, 14 May 2020 07:45:53 -0700 (PDT)
Received: by mail-ot1-x343.google.com with SMTP id t3so2552405otp.3;
        Thu, 14 May 2020 07:45:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ABi21lm1YVWqXpRMwlP2aGmVIPQvBoihfVQI7RJ+5RQ=;
        b=C9M8nB170wRNxb2gFqjdcjuJvHWeIOmGX0N7cl/Q1fPs22QPLpuR7HdjO/+5eE4gwE
         jwrNYVJwjN5ncCRdMAS9IfhrhzM6GKGozt7NJa7Tjgf8O3nxtLArXtu3QujKL9vv+dY7
         7WHnMw6FX71uZqXIKVz/uvNgI7t6qIxd//+5vUaI4IOmBBPaVvFOrXZNFlCud8+zEnBq
         BGQuPlgbjXhNzGBTs0uhmTI8rfDKGE0bUeBtqkrrBZcs4hvnYt8X4bmun+h3DS/p7hsI
         tY9TgmIrPfd5eUWxMsThcZL7A8v45VAL+W0zUqtXyspuVS/lSTu46RNvwFCxEVNtgqe2
         hMHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ABi21lm1YVWqXpRMwlP2aGmVIPQvBoihfVQI7RJ+5RQ=;
        b=Fcu3ZJvmlwIZbGuMstrT0o4hxYGUIpbkf2tPryA58yBNNmlzVIHGKF9C8AuUsH2lzN
         aF24GeAO0d66yshyTcFOhz6IHXZqHeZ54yKY9ynb3GjHVQnWbbWGkmvOH5DUGpFae/fW
         LPc0sFgzzBWO0cm5n7HoEJY4AnRWICT00rw+zefi04Xjhhk9uu1D8LR7XaPvutAezFkv
         qrcaiKHsWRCMdmFwd9jTHFFqRo8++KR/65Qkl6BjIC2D+yiwPpUxO2VXjkq687G0dQDu
         RDYM6WRvFd23sg8t9tQ6PHUfCz0DOkIZBOIr3EuWtBC3hfv0ENWF7GH0mFZzIqX77plK
         ztRg==
X-Gm-Message-State: AOAM531YVdNc8UUfDnfRCdTWC/zqDpt+eRReAo0yHe9hoIsP7I/GKGvb
        U3nFJmQ5DxcHBgFhgjkK1Pl3GBpefLvONCj6CtU=
X-Google-Smtp-Source: ABdhPJzz26XPZOat1SoQ12vWoBFitMxzcVkQPUSEc6Izcm6DiLLPxYe7PZqxHT9JaIz8ygeud7EBo+Laij1AF1cRYgs=
X-Received: by 2002:a05:6830:1152:: with SMTP id x18mr3543685otq.89.1589467552395;
 Thu, 14 May 2020 07:45:52 -0700 (PDT)
MIME-Version: 1.0
References: <CAEjxPJ6pFdDfm55pv9bT3CV5DTFF9VqzRmG_Xi5bKNxPaGuOLg@mail.gmail.com>
 <158932282880.2885325.2688622278854566047.stgit@warthog.procyon.org.uk>
 <CAEjxPJ4=ZN_jKP2nX5mrMA3OxC8XLsYEmCPCD-78H4XQw=_hCA@mail.gmail.com>
 <3611507.1589411611@warthog.procyon.org.uk> <CAEjxPJ5Dw0Lf6DnUL01XSJZF9zu-ACnmxOkC0VHxGTzGcmbpRQ@mail.gmail.com>
In-Reply-To: <CAEjxPJ5Dw0Lf6DnUL01XSJZF9zu-ACnmxOkC0VHxGTzGcmbpRQ@mail.gmail.com>
From:   Stephen Smalley <stephen.smalley.work@gmail.com>
Date:   Thu, 14 May 2020 10:45:40 -0400
Message-ID: <CAEjxPJ72Y+G5wJEzYT_Ekth07nHzTS5Oh+8ss7Xc90-_Qq6wWw@mail.gmail.com>
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

On Thu, May 14, 2020 at 8:08 AM Stephen Smalley
<stephen.smalley.work@gmail.com> wrote:
>
> On Wed, May 13, 2020 at 7:13 PM David Howells <dhowells@redhat.com> wrote:
> >
> > Stephen Smalley <stephen.smalley.work@gmail.com> wrote:
> >
> > > >  (3) An override due to CAP_SYS_ADMIN.
> > >
> > > CAP_SYS_ADMIN should never skip SELinux checking.  Even for Smack,
> > > there is a separate capability (CAP_MAC_ADMIN) for that purpose.
> >
> > The LSM doesn't get consulted at the moment.  With this patch, it will get
> > consulted.
> >
> > > >  (4) An override due to an instantiation token being present.
> > >
> > > Not sure what this means but again we shouldn't skip SELinux checking
> > > based on mere possession of an object capability (not a POSIX
> > > capability).
> >
> > The kernel has delegated the instantiation of a key to the calling process and
> > has given it a temporary key of type ".request_key_auth" which it has put into
> > force with keyctl(KEYCTL_ASSUME_AUTHORITY).
> >
> > This authorisation token grants the caller the ability to (a) perform
> > operations on the key it wouldn't otherwise have permission to do, (b) use the
> > key instantiation keyctls and (c) temporarily search the keyrings of the
> > caller of request_key() using the creds of that caller and to read/use the
> > keys found therein if the caller was permitted to do so.
> >
> > > It would be better if the permission indicated the actual operation
> > > (e.g. KEY_NEED_INVALIDATE_SPECIAL), and the decision whether to permit
> > > CAP_SYS_ADMIN processes to override was left to the security modules.
> > > SELinux doesn't automatically allow CAP_SYS_ADMIN processes to do
> > > everything.
> >
> > These individual permissions don't exist yet.  I have an ACL patchset that
> > allows me to add a greater range - though there's issues with SELinux there
> > also.
> >
> > Also, the keyrings are specially marked to say that the sysadmin is allowed to
> > flush them at the moment - but that can go away with the ACL stuff.
> >
> > > > +       switch (need_perm) {
> > > > +       case KEY_NEED_UNLINK:
> > > > +       case KEY_SYSADMIN_OVERRIDE:
> > > > +       case KEY_AUTHTOKEN_OVERRIDE:
> > > > +       case KEY_DEFER_PERM_CHECK:
> > > >                 return 0;
> > >
> > > We really shouldn't be skipping any/all checking on CAP_SYS_ADMIN or
> > > an AUTHTOKEN; those should still be subject to MAC policy.
> >
> > I'm not sure how to do that.
> >
> > Note that KEY_NEED_UNLINK *must not* be overruled by the MAC policy.  The
> > value is only there because lookup_user_key() requires something to be put
> > into that parameter - it's more of a courtesy thing, I suppose.
> >
> > Why should AUTHTOKEN be subject to MAC policy?  The kernel has told the
> > process to go and instantiate a key.  It shouldn't really then turn around and
> > tell the process "oh, but you're not actually allowed to do that".
>
> On what basis did the kernel authorize the process to instantiate the
> key?  At what point did a security module get involved in the decision
> as to what process(es) are authorize to instantiate a key,
> particularly for a process with a different credential/security
> context?

BTW I'm not saying you have to change this patch since IIUC it merely
preserves the existing behavior for these special cases.  But we will
want to address these gaps (or clarify that no real gap exists) in LSM
control over key operations going forward.
