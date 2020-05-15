Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4DC421D5320
	for <lists+keyrings@lfdr.de>; Fri, 15 May 2020 17:06:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726188AbgEOPGc (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Fri, 15 May 2020 11:06:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726140AbgEOPGb (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Fri, 15 May 2020 11:06:31 -0400
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com [IPv6:2607:f8b0:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2698C061A0C;
        Fri, 15 May 2020 08:06:30 -0700 (PDT)
Received: by mail-ot1-x344.google.com with SMTP id 63so2125515oto.8;
        Fri, 15 May 2020 08:06:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=37rPaVirt9XFwClnSBrwkFy9t98lCKr8fqc0wxeBqbQ=;
        b=MPEJnav0wmHisAiDR2w3zemBM3f2eft4Lu2hyl6UgNLm64xKttZ8VCns7GP4XN8R1b
         Sp4HbB/z7Jdp9fA/566ZRfZ65n3RknpeHN36kWGOVh1Y5HQQsSpvqFD3gKIPv85z3rSb
         t/Z8vAyqQxYTh71PTSjC2gLcNC9zxPuLMUzkOVFZY5sDoRcrnT8N8FDbAZ9OSbDtkndR
         62xZLpAJTdQ/hMqlFxbAXf+Pw7n0PCp05eyxyeacagdMrfGM+izusdh9eGubyMwu9J0t
         OURKLPntMmiVHAhsrBgJkD6enwkXRpFlKasScbF9TycKoDyL9oMXo+hzcpmBz+DhyR51
         FTXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=37rPaVirt9XFwClnSBrwkFy9t98lCKr8fqc0wxeBqbQ=;
        b=uL4Q8Cn0nRbwxve4plikM/AFrqOlJuI4tjOQE+MMZq1ad6tZtcaloeBPSPTSLKzGCX
         /DOO7Wk2U8sYr4KwVzzAU1lAts3UelTRRZNb6/cl1gKz7PpxBYfHZ0jNBVgUx+SgzQVP
         PjiStxnC1bNpoD2DDBveZezw4HVq4rkQ6tWpr771HDFB1rGOaIt6kH1tx46FIOYIxhBf
         FrpMML4jBOBWo0iENAa7Rn7Pt9seHySdTNJ+5Qc6uQc+l7iaFruH4EDNrfah34+Xs/Yc
         OsyECatjFrqTLQLPcAvCzL791QTY/84tAz1NTpAhzaR0Ay90Ox4MEf3rewf6uKHEVQTW
         j3wQ==
X-Gm-Message-State: AOAM530OgGj+JsDcTAWFFgI0SWZinHB4e8cZhJVP2Ia0xlSxKDj+inUq
        ZNxneaaszuQqxqI8vLlez3SdwfbF0oZXlKK+qIp8cv8V
X-Google-Smtp-Source: ABdhPJzk/TdecIuYME/TbHJhuVxtzCM9/2TfvlIcp1YRHPbhNTokdedEGTsjL7EV3EvLZvWppABE9grOvae5hhi/HOg=
X-Received: by 2002:a9d:398b:: with SMTP id y11mr1775480otb.135.1589555189997;
 Fri, 15 May 2020 08:06:29 -0700 (PDT)
MIME-Version: 1.0
References: <CAEjxPJ6pFdDfm55pv9bT3CV5DTFF9VqzRmG_Xi5bKNxPaGuOLg@mail.gmail.com>
 <158932282880.2885325.2688622278854566047.stgit@warthog.procyon.org.uk>
 <CAEjxPJ4=ZN_jKP2nX5mrMA3OxC8XLsYEmCPCD-78H4XQw=_hCA@mail.gmail.com> <3999877.1589475539@warthog.procyon.org.uk>
In-Reply-To: <3999877.1589475539@warthog.procyon.org.uk>
From:   Stephen Smalley <stephen.smalley.work@gmail.com>
Date:   Fri, 15 May 2020 11:06:19 -0400
Message-ID: <CAEjxPJ5wW2qHYDsqKr5rjnRJ++4f2LXobCQkKZvWCSb_j0WN6w@mail.gmail.com>
Subject: Re: [PATCH] keys: Move permissions checking decisions into the
 checking code
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

On Thu, May 14, 2020 at 12:59 PM David Howells <dhowells@redhat.com> wrote:
>
> How about this then?
>
> David
> ---
> commit fa37b6c7e2f86d16ede1e0e3cb73857152d51825
> Author: David Howells <dhowells@redhat.com>
> Date:   Thu May 14 17:48:55 2020 +0100
>
>     keys: Move permissions checking decisions into the checking code
>
>     Overhaul the permissions checking, moving the decisions of which permits to
>     request for what operation and what overrides to allow into the permissions
>     checking functions in keyrings, SELinux and Smack.
>
>     To this end, the KEY_NEED_* constants are turned into an enum and expanded
>     in number to cover operation types individually.
>
>     Note that some more tweaking is probably needed to separate kernel uses,
>     e.g. AFS using rxrpc keys, from direct userspace users.
>
>     Some overrides are available and this needs to be handled specially:
>
>      (1) KEY_FLAG_KEEP in key->flags - The key may not be deleted and/or things
>          may not be removed from the keyring.

Why can't they be deleted / removed?  They can't ever be deleted or
removed or for some period of time?

>      (2) KEY_FLAG_ROOT_CAN_CLEAR in key->flags - The keyring can be cleared by
>          CAP_SYS_ADMIN.

Why do some keyrings get this flag and others do not?  Under what
conditions?  Why is CAP_SYS_ADMIN the right capability for this?

>      (3) KEY_FLAG_ROOT_CAN_INVAL in key->flags - The key can be invalidated by
>          CAP_SYS_ADMIN.

Ditto.

>      (4) An appropriate auth token being set in cred->request_key_auth that
>          gives a process transient permission to view and instantiate a key.
>          This is used by the kernel to delegate instantiation to userspace.

Is this ever allowed across different credentials?  When?  Why?  Is
there a check between the different credentials before the auth token
is created?

>     Note that this requires some tweaks to the testsuite as some of the error
>     codes change.

Which testsuite?  keyring or selinux or both?  What error codes change
(from what to what)?  Does this constitute an ABI change?

I like moving more of the permission checking logic into the security
modules and giving them greater visibility and control.  That said, I
am somewhat concerned by the scale of this change, by the extent to
which you are exposing keyring internals inside the security modules,
and by the extent to which logic is getting duplicated in each
security module.  I'd suggest a more incremental approach, e.g. start
with just the enum patch, then migrate the easy cases, then consider
the more complicated cases.  And possibly we need multiple different
security hooks for the keyring subsystem that are more specialized for
the complicated cases.  If we authorize the delegation up front, we
don't need to check it later.
