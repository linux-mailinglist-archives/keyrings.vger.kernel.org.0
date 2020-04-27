Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 98A861BAAA0
	for <lists+keyrings@lfdr.de>; Mon, 27 Apr 2020 19:02:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726208AbgD0RCr (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Mon, 27 Apr 2020 13:02:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726177AbgD0RCr (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Mon, 27 Apr 2020 13:02:47 -0400
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com [IPv6:2607:f8b0:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76479C0610D5;
        Mon, 27 Apr 2020 10:02:47 -0700 (PDT)
Received: by mail-ot1-x342.google.com with SMTP id e26so27485774otr.2;
        Mon, 27 Apr 2020 10:02:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=e0fXzGs4f9aNXR2W7dYy8FjIeSOd2Yya7hIgPIMI7uo=;
        b=NM9hysM11sfD8vwzfLhQDaw6ABxBNUtSRTFSd+u8ApLK/WMu0pSH0bUkWARSu352a9
         hC/Q1vtxChnjov2f0y9RLc+eTEJwxuqzqvaPaIsysHcynPvfzWb8llGsjPkxrftuJ5C0
         /Fk6tZv6NZcjpDw6vXFuBbK4nqwal6FIewc8wq5bJBaLBA+KzQfw2+1yGn98IbZtsgsQ
         GavfBx0HfaiRlZ6ONFL3zVxURIzCBOU2DOlFpJD4zhoR1SNDd9lOVcqpx4iH4gWQJQ1B
         xnKq4vt9qRowy9TIm8Bb1hDvPUiF/1+RmJnYc3wSt1evSpH3EdKb0cgTaaATaHgWU6X1
         9fTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=e0fXzGs4f9aNXR2W7dYy8FjIeSOd2Yya7hIgPIMI7uo=;
        b=Dx/mD9k1wFUlXMQFrjDklwmUprXCgHfdIKNqvCe30oh+T12cuULDs9DXr1XdKxUPd+
         ZDpqMC5I6us2sfeVOdb4tU/GotNQHRz2IZDofBDVEEMsJBU/3307yHZXQpfNJUzv2di1
         rw8sSrCtWKLKW/Nmno3sITLuwgnXdSWqpLVSIcybq1KZE3l9zgBpoOKI6taXgByZoi9R
         vI8SrxGxKGDLguKlFjy9whAEhrOS4G20oz+f2T0vormED6AYM3AoSu97yirNUwcJRi02
         4U/w9GWrj9bZHmjo+LGA5ZK01maIZIXW4p4vZM4vBkdrpj40KT+FmafV9RFJ7a3zHo1u
         Ptgg==
X-Gm-Message-State: AGi0PuYLkCGXv7vIMk1Bxi39ogjt1Ip5V37WrHYXoCtXZ1EuRJCZtBr+
        2eBkPSbSfkoNEvEznk3pfX6I6Ks9m/RGDuJ3l5FVSA==
X-Google-Smtp-Source: APiQypJSbHuZa8OrNpi2BUViQsnNXwinUSaWwNO5FRMc538QyD2Szv7df3XSOyfoxsXZiuSgvFLQff12EW/s1KeKVFQ=
X-Received: by 2002:aca:4c0b:: with SMTP id z11mr15987844oia.92.1588006966862;
 Mon, 27 Apr 2020 10:02:46 -0700 (PDT)
MIME-Version: 1.0
References: <CAHC9VhT95GJKNTMvTtmZL35UOoVwbGH-eDWZyELb5oZ5rQU+Tw@mail.gmail.com>
 <2136640.1587472186@warthog.procyon.org.uk> <CAHC9VhQnORRaRapbb1wrUsxweJCRJ+X+RdvKw8_U0pT0fuxZ6A@mail.gmail.com>
 <3834193.1587771802@warthog.procyon.org.uk> <CAHC9VhQbhG8-ZABtkZr1FXo9cuH4_nsbB=HP_fGvW+FNQ7iAXg@mail.gmail.com>
 <355576.1587996734@warthog.procyon.org.uk>
In-Reply-To: <355576.1587996734@warthog.procyon.org.uk>
From:   Stephen Smalley <stephen.smalley.work@gmail.com>
Date:   Mon, 27 Apr 2020 13:02:35 -0400
Message-ID: <CAEjxPJ4S0wpAtXoD1f-54qrriRC8y_hj9T5-vKOGDmf1XhOLrQ@mail.gmail.com>
Subject: Re: [PATCH] selinux: Fix use of KEY_NEED_* instead of KEY__* perms
To:     David Howells <dhowells@redhat.com>
Cc:     Paul Moore <paul@paul-moore.com>, keyrings@vger.kernel.org,
        SElinux list <selinux@vger.kernel.org>,
        LSM List <linux-security-module@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Mon, Apr 27, 2020 at 10:13 AM David Howells <dhowells@redhat.com> wrote:
>
> Paul Moore <paul@paul-moore.com> wrote:
>
> > Okay, can you send the next version of the patch to the SELinux list for
> > review?
>
> Here you go.  Note that I did this a few days ago and I actually used EACCES
> rather than EPERM.  Which one is one preferred for this?
>
> David
> ---
> selinux: Fix use of KEY_NEED_* instead of KEY__* perms
>
> selinux_key_getsecurity() is passing the KEY_NEED_* permissions to
> security_sid_to_context() instead of the KEY__* values.  It happens to work
> because the values are all coincident.

Both function names in the above description are wrong.

> Fixes: d720024e94de ("[PATCH] selinux: add hooks for key subsystem")
> Reported-by: Paul Moore <paul@paul-moore.com>
> Signed-off-by: David Howells <dhowells@redhat.com>
> ---
>  security/selinux/hooks.c |   22 ++++++++++++++++++++--
>  1 file changed, 20 insertions(+), 2 deletions(-)
>
> diff --git a/security/selinux/hooks.c b/security/selinux/hooks.c
> index 0b4e32161b77..6087955b49d8 100644
> --- a/security/selinux/hooks.c
> +++ b/security/selinux/hooks.c
> @@ -6539,20 +6539,38 @@ static void selinux_key_free(struct key *k)
>         kfree(ksec);
>  }
>
> +static unsigned int selinux_keyperm_to_av(unsigned int need_perm)
> +{
> +       switch (need_perm) {
> +       case KEY_NEED_VIEW:     return KEY__VIEW;
> +       case KEY_NEED_READ:     return KEY__READ;
> +       case KEY_NEED_WRITE:    return KEY__WRITE;
> +       case KEY_NEED_SEARCH:   return KEY__SEARCH;
> +       case KEY_NEED_LINK:     return KEY__LINK;
> +       case KEY_NEED_SETATTR:  return KEY__SETATTR;
> +       default:

Possibly WARN() or BUG() here?  Or BUILD_BUG_ON(KEY_NEED_ALL != 0x3f)
to force an update here
whenever a new key permission is defined?

> +               return 0;
> +       }
> +}
> +
>  static int selinux_key_permission(key_ref_t key_ref,
>                                   const struct cred *cred,
> -                                 unsigned perm)
> +                                 unsigned need_perm)
>  {
>         struct key *key;
>         struct key_security_struct *ksec;
> +       unsigned int perm;
>         u32 sid;
>
>         /* if no specific permissions are requested, we skip the
>            permission check. No serious, additional covert channels
>            appear to be created. */
> -       if (perm == 0)
> +       if (need_perm == 0)
>                 return 0;
>
> +       perm = selinux_keyperm_to_av(need_perm);
> +       if (perm == 0)
> +               return -EACCES;

We should log or audit some kind of message here, whether via WARN(),
audit_log(), or something, to avoid silent denials.

>         sid = cred_sid(cred);
>
>         key = key_ref_to_ptr(key_ref);
>
