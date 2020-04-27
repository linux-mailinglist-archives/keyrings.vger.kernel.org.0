Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC48F1BA688
	for <lists+keyrings@lfdr.de>; Mon, 27 Apr 2020 16:36:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727853AbgD0OgN (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Mon, 27 Apr 2020 10:36:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727022AbgD0OgM (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Mon, 27 Apr 2020 10:36:12 -0400
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com [IPv6:2607:f8b0:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99101C0610D5;
        Mon, 27 Apr 2020 07:36:12 -0700 (PDT)
Received: by mail-ot1-x344.google.com with SMTP id m18so26442083otq.9;
        Mon, 27 Apr 2020 07:36:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LiXqxk1FAYH4sYxIS4dLWNdHsjjAg5MIEcm2d8xjZLs=;
        b=upLT3F2f2SUUazJCxAwVkqF8IWjTMcluF7M4OxII3ThxKaot9zPyCWjOMd/HxxYZxV
         RR5K2kiko7ma5K9hVRZ+30K6DgecgD3ZcWbnHBA2gn7YYdSYKEQDs+KvZQn+MMIplfmv
         oaIFXit0pITugbtP+m494BA/gJwmurzLUmbo0lYTMgDli+Bjpnfi61ran141DfUBdNDr
         OoC0XkDS+VfuIcmfr4jBDkcKBy/lWEqB1ZtJ4JFVrLaBC5tY9Gw3HZ9+7t59uGZrLgGV
         rXTd6QjfVtDsacCqlHCaIF1m8U1f/S7rdHJ6WmcdZslsz5+qkb+dQwDxkYiHWh5tSpwR
         EK0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LiXqxk1FAYH4sYxIS4dLWNdHsjjAg5MIEcm2d8xjZLs=;
        b=Mt0sckCyEqiZkYoLL6jdDFMfoKh+EGdCDxrXpzsxLj3ouq9eXVRZ2IN/QPyD39xDN8
         8FIqC8sResF4/QzzSjvyjzWAZG37WypvrRoAdpVb59McH0Yzzr4IhrlWi5qisvQ8ChRI
         SXNnlHMgFMIFloOkCGTxacGZCBIIoj1UJwLtRjiYF55koMweGKEGqZL3d51xj20yTxHi
         LuBNwBr4aJVCXbk28AM+ccCqNr8MshFnbm1GGsu2RlG/kvtOOGb9LNtPicE6CWJ0BCxY
         Wczkc4o+qrXTxSq3mDVHBfEBUw5gMOc+zXp/Rwpl9nMHIlxKDxj3eUKcahkqEamtVQ3q
         5lWQ==
X-Gm-Message-State: AGi0PuYA3hUvJvw5rjfEn/WDgDdUwPdgR9UYbw7/Ksi7/8t+QfAl8GyS
        YpOOeGfRtELzs82HftyGsh8EKb3+ahHfG1tKcBg=
X-Google-Smtp-Source: APiQypKr2wVnU+h6UFhPIcjr+jGdONz+CNc4uIYMeuCHe/LhqpurV05xd+S3U97kS0QjPt1kn3R4kQPB1n111AKZKaM=
X-Received: by 2002:a9d:2c08:: with SMTP id f8mr18957402otb.135.1587998172010;
 Mon, 27 Apr 2020 07:36:12 -0700 (PDT)
MIME-Version: 1.0
References: <CAHC9VhT95GJKNTMvTtmZL35UOoVwbGH-eDWZyELb5oZ5rQU+Tw@mail.gmail.com>
 <2136640.1587472186@warthog.procyon.org.uk> <CAHC9VhQnORRaRapbb1wrUsxweJCRJ+X+RdvKw8_U0pT0fuxZ6A@mail.gmail.com>
 <3834193.1587771802@warthog.procyon.org.uk> <CAHC9VhQbhG8-ZABtkZr1FXo9cuH4_nsbB=HP_fGvW+FNQ7iAXg@mail.gmail.com>
 <355576.1587996734@warthog.procyon.org.uk>
In-Reply-To: <355576.1587996734@warthog.procyon.org.uk>
From:   Stephen Smalley <stephen.smalley.work@gmail.com>
Date:   Mon, 27 Apr 2020 10:36:00 -0400
Message-ID: <CAEjxPJ4ScTAbOOxd8FUa2XcfMqbNuWLxnHhRko=je2+0re8Ztg@mail.gmail.com>
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

Generally SELinux returns EACCES unless the hook normally returns
EPERM (e.g. capable).
Should we use a build-time or runtime guard to catch introduction of
new KEY_NEED values without corresponding SELinux
permissions?

>
> David
> ---
> selinux: Fix use of KEY_NEED_* instead of KEY__* perms
>
> selinux_key_getsecurity() is passing the KEY_NEED_* permissions to
> security_sid_to_context() instead of the KEY__* values.  It happens to work

s/security_sid_to_context/avc_has_perm

> because the values are all coincident.

Shrug.  That was just a requirement on key permissions when they were
introduced; same is true of capabilities.
Not opposed to explicitly mapping them now but it isn't really a bug.

>
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
>         sid = cred_sid(cred);
>
>         key = key_ref_to_ptr(key_ref);
>
