Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA2FA1BC15C
	for <lists+keyrings@lfdr.de>; Tue, 28 Apr 2020 16:32:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727831AbgD1Ocu (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 28 Apr 2020 10:32:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726900AbgD1Oct (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Tue, 28 Apr 2020 10:32:49 -0400
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com [IPv6:2607:f8b0:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2DB8C03C1AB;
        Tue, 28 Apr 2020 07:32:49 -0700 (PDT)
Received: by mail-ot1-x344.google.com with SMTP id 72so32941424otu.1;
        Tue, 28 Apr 2020 07:32:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=S9O+qEGepab6RJdFbrok2ycX7POmXBOtItF8KMBeyuU=;
        b=nvH4F5yjhXle1GqR1ABGl4NiS/lfVAzG3yFs0J6upzSeNyTbEmQcLkIYxM6aX12AMX
         VpOK+N6tQ6Sm8V8D7ov1w8J/KTgoEoAD4nlnaL4BwBL+I6Prmzh0uH/3G/t6jWJtFR1h
         IaNDJbntQbIRN3TD7CulwCtN+4HHKulociq7mD9m3r9ttKmuYJ+QPOMcrWNWHerfXbEl
         5vR7R4epzZDfTmOgRf6GTnyQE09GtNRzYRsXdThy8OSXkB1jAsZlEJUTi9+NvD0kILY7
         PDQ7FED3K703XNqdD+6Zbi95hJgATUGVUrzbvnA+TI7iDCqfjWuArV0pyd2bOWWVVDu1
         4xvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=S9O+qEGepab6RJdFbrok2ycX7POmXBOtItF8KMBeyuU=;
        b=ukc8Yqtn8qM2cycK//eF2iEfrN8i9QL01+nM3qqSM7Y3tJ2tYLaYTAiIBshEa6DU94
         NJS9/t8SyPH2rsZTzDtR62s8nHLujI+Ev7eP1blGj/jKB+E3+UWvhCBMGMT5V+zpxyi0
         9aAZyFIYBMXPiDyh/QdqiL2zKRY1oF5Zk1mK8pHCU44B5ZT3Pi+VVpScndUpxN14uSIk
         Vfn62kqDckmeoe2JQXnbQGSLBu3+QZNFVCBP1MmPv2YB7b7VhOFpPQFld25LcAhgq1wP
         Vbj8iB5PQ1FNNzeUluJrLKhZe/d12mpt7dsuZEOt3T/pZItmi/UE8pTigJ617jkbWq/X
         caLg==
X-Gm-Message-State: AGi0PuaOQDheMzE8WEPeFTcRiNLRR4QiKz1ffFMVeCYvXXkmUP+QIycS
        T2Ihpy1VVBN2iIPjmsVlJz1p0zkvnWNLcdCqjW8=
X-Google-Smtp-Source: APiQypLRBDRQ2abUWLki7t3cM7p+gjAaOBCFGgraRIDWxpRqJv1rYzmtwWH+xZKUKM8D205UNhdjCSpCpR2BmQJs3Aw=
X-Received: by 2002:aca:4c0b:: with SMTP id z11mr3075639oia.92.1588084369181;
 Tue, 28 Apr 2020 07:32:49 -0700 (PDT)
MIME-Version: 1.0
References: <CAHC9VhT95GJKNTMvTtmZL35UOoVwbGH-eDWZyELb5oZ5rQU+Tw@mail.gmail.com>
 <924658.1588078484@warthog.procyon.org.uk>
In-Reply-To: <924658.1588078484@warthog.procyon.org.uk>
From:   Stephen Smalley <stephen.smalley.work@gmail.com>
Date:   Tue, 28 Apr 2020 10:32:37 -0400
Message-ID: <CAEjxPJ5+DtZfX36OLYiLbU=1tGZcPUWFUi1=mFfx=ntehtvd3Q@mail.gmail.com>
Subject: Re: [PATCH] selinux: Fix use of KEY_NEED_* instead of KEY__* perms [v2]
To:     David Howells <dhowells@redhat.com>
Cc:     Paul Moore <paul@paul-moore.com>, keyrings@vger.kernel.org,
        SElinux list <selinux@vger.kernel.org>,
        LSM List <linux-security-module@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Tue, Apr 28, 2020 at 8:54 AM David Howells <dhowells@redhat.com> wrote:
>
> selinux: Fix use of KEY_NEED_* instead of KEY__* perms
>
> selinux_key_permission() is passing the KEY_NEED_* permissions to
> avc_has_perm() instead of the KEY__* values.  It happens to work because
> the values are all coincident.
>
> Fixes: d720024e94de ("[PATCH] selinux: add hooks for key subsystem")
> Reported-by: Paul Moore <paul@paul-moore.com>
> Signed-off-by: David Howells <dhowells@redhat.com>
> ---
>  security/selinux/hooks.c |   23 +++++++++++++++++++++--
>  1 file changed, 21 insertions(+), 2 deletions(-)
>
> diff --git a/security/selinux/hooks.c b/security/selinux/hooks.c
> index 0b4e32161b77..4b6624e5dab4 100644
> --- a/security/selinux/hooks.c
> +++ b/security/selinux/hooks.c
> @@ -6539,20 +6539,39 @@ static void selinux_key_free(struct key *k)
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
> +               WARN_ON(1);
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
> +               return -EPERM;
>         sid = cred_sid(cred);
>
>         key = key_ref_to_ptr(key_ref);

1) Are we guaranteed that the caller only ever passes a single
KEY_NEED_* perm at a time (i.e. hook is never called with a bitmask
of multiple permissions)?  Where is that guarantee enforced?

2) We had talked about adding a BUILD_BUG_ON() or other build-time
guard to ensure that new KEY_NEED_* permissions
are not added without updating SELinux.  We already have similar
constructs for catching new capabilities (#if CAP_LAST_CAP > 63 #error
...), socket address families (#if PF_MAX > 45 #error ...),  RTM_* and
XFRM_MSG* values.
