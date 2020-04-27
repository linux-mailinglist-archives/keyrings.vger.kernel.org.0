Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E35D91BA7EC
	for <lists+keyrings@lfdr.de>; Mon, 27 Apr 2020 17:24:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727022AbgD0PYa (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Mon, 27 Apr 2020 11:24:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726539AbgD0PYa (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Mon, 27 Apr 2020 11:24:30 -0400
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com [IPv6:2a00:1450:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFDD7C03C1A8
        for <keyrings@vger.kernel.org>; Mon, 27 Apr 2020 08:24:29 -0700 (PDT)
Received: by mail-ed1-x543.google.com with SMTP id f12so13733521edn.12
        for <keyrings@vger.kernel.org>; Mon, 27 Apr 2020 08:24:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tLfkmnAmNVphbG9R0lr0hF06PEKfNMCkHl7LVzkw/sE=;
        b=S9/1RV0XeEBnzxqpE5Cu04AK9oPmaIKsXZfMBbLcDnlc0vKRrmMi0J0YbdjIgm5qbe
         5z5t8JpyPByEzAFOOZZjymrqvsscl9jU3WwvmWVJz1LIWkaxSwwL+qnWYogHgKuPWqYH
         bSfToHcp40y4Buyt20clBUotWNf8tTENoSH20jkmOecbaHJK9T2h6AO1buD0oAGpOoNi
         T66Ri9duCWOZ2Ut0D/7rlf+fJHTrXUDQ8WZbWP41wQRHrk7jwOAGBPJ1ygLUDQJCS74a
         YkuzCQqzS9CFxVe6Vg/EJI8p0225fyGl7yUhC0MwEPBQG0CANsP4jJ4meGImzQ0d7UWI
         NXSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tLfkmnAmNVphbG9R0lr0hF06PEKfNMCkHl7LVzkw/sE=;
        b=HofooxklAu7p5aQ4gvrWHyzv+ZaYJ+nTTNHcJjm/j1v7tOKhstixSPSE8sIts8AzBa
         UPMNycSLxBu35JH+3AwIQcJDeV/w8d8OAmvlvt6YcBSPJVyL50TF0mJ07gSD92qSyfaz
         64QUI0f2ADEZmCr8kgbJ679IllGOVbLNIk4tAQpxSNHCdBOjJTzuGW/zrcquoUPEV2o3
         XvjjpXfFBIftPk74Z3BXT5LWPQ3eAQ7+w2HipA9CKNitmuW5KmzLS3SyRR7qRiVS5s6n
         624dw65L3evQTtO4kMf5nDv3P9WGtjrLSFXi3IJvrNe0OIpLD/TEXfyJ033O9o9xqbIn
         gwcA==
X-Gm-Message-State: AGi0PuaVQDvXvnQAw7lpBTorXnpVev7RZvMk6Ov8hIuoyAG/7+NL4fT+
        AehbTk18mwCgAqKyvxOOsIf98pvGJGFpNfgKRByX
X-Google-Smtp-Source: APiQypLOcuYsweG3zdDR3Xg2WVeSZJ8Iwg7/3aFs+GmdwkODkXo2vz6N6dKj/SxkwlKgQ3ULvGfxkJgUWRmxcjrUSRM=
X-Received: by 2002:a50:d98b:: with SMTP id w11mr17688742edj.196.1588001068417;
 Mon, 27 Apr 2020 08:24:28 -0700 (PDT)
MIME-Version: 1.0
References: <CAHC9VhT95GJKNTMvTtmZL35UOoVwbGH-eDWZyELb5oZ5rQU+Tw@mail.gmail.com>
 <2136640.1587472186@warthog.procyon.org.uk> <CAHC9VhQnORRaRapbb1wrUsxweJCRJ+X+RdvKw8_U0pT0fuxZ6A@mail.gmail.com>
 <3834193.1587771802@warthog.procyon.org.uk> <CAHC9VhQbhG8-ZABtkZr1FXo9cuH4_nsbB=HP_fGvW+FNQ7iAXg@mail.gmail.com>
 <355576.1587996734@warthog.procyon.org.uk> <CAEjxPJ4ScTAbOOxd8FUa2XcfMqbNuWLxnHhRko=je2+0re8Ztg@mail.gmail.com>
In-Reply-To: <CAEjxPJ4ScTAbOOxd8FUa2XcfMqbNuWLxnHhRko=je2+0re8Ztg@mail.gmail.com>
From:   Paul Moore <paul@paul-moore.com>
Date:   Mon, 27 Apr 2020 11:24:17 -0400
Message-ID: <CAHC9VhRQfq+QsmdwkNfLs8bs8xGnBOA3_G=+--13sTmUkdjgCQ@mail.gmail.com>
Subject: Re: [PATCH] selinux: Fix use of KEY_NEED_* instead of KEY__* perms
To:     Stephen Smalley <stephen.smalley.work@gmail.com>
Cc:     David Howells <dhowells@redhat.com>, keyrings@vger.kernel.org,
        SElinux list <selinux@vger.kernel.org>,
        LSM List <linux-security-module@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Mon, Apr 27, 2020 at 10:36 AM Stephen Smalley
<stephen.smalley.work@gmail.com> wrote:
> On Mon, Apr 27, 2020 at 10:13 AM David Howells <dhowells@redhat.com> wrote:
> >
> > Paul Moore <paul@paul-moore.com> wrote:
> >
> > > Okay, can you send the next version of the patch to the SELinux list for
> > > review?
> >
> > Here you go.  Note that I did this a few days ago and I actually used EACCES
> > rather than EPERM.  Which one is one preferred for this?
>
> Generally SELinux returns EACCES unless the hook normally returns
> EPERM (e.g. capable).
> Should we use a build-time or runtime guard to catch introduction of
> new KEY_NEED values without corresponding SELinux
> permissions?
>
> >
> > David
> > ---
> > selinux: Fix use of KEY_NEED_* instead of KEY__* perms
> >
> > selinux_key_getsecurity() is passing the KEY_NEED_* permissions to
> > security_sid_to_context() instead of the KEY__* values.  It happens to work
>
> s/security_sid_to_context/avc_has_perm
>
> > because the values are all coincident.
>
> Shrug.  That was just a requirement on key permissions when they were
> introduced; same is true of capabilities.
> Not opposed to explicitly mapping them now but it isn't really a bug.

I haven't looked at the rest of the patch yet, but I wanted to make a
quick comment on this ... over the years I've seen a number of
problems that crop up because of cross-subsytem assumptions, unless
there is some performance critical path where the mapping is
problematic I would prefer to see a translation layer to help protect
SELinux.

-- 
paul moore
www.paul-moore.com
