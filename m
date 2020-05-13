Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA7981D13A8
	for <lists+keyrings@lfdr.de>; Wed, 13 May 2020 14:58:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731851AbgEMM6p (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 13 May 2020 08:58:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729345AbgEMM6p (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 13 May 2020 08:58:45 -0400
Received: from mail-oo1-xc44.google.com (mail-oo1-xc44.google.com [IPv6:2607:f8b0:4864:20::c44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA78DC061A0C;
        Wed, 13 May 2020 05:58:44 -0700 (PDT)
Received: by mail-oo1-xc44.google.com with SMTP id p123so2264058oop.12;
        Wed, 13 May 2020 05:58:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VpypxEyENRJvROK6xHUL5Ckp8cqPiu+d4URbR3v3TwI=;
        b=KD2wVadAGyIh11NpAP/DdtGIgop1WPoYhQk+DFExxk4bhPbEpAH1Qo7KIQHvFSw30R
         yFuPjY6oQTyfKGwpb+FgLCU9y/yJIhHIqe5a7PFAmDZAecHf/mit4+04qV0oNssK3i/j
         K2fLGCHafAXNCPyZUtYQjFWbK/6j5NzSQPtp6TqwHTQkUEg2ng6yh7lIyFvBArktiKwQ
         e0FLR3sD9HMws7w7vG+nySxH2y6KY/zGrOdVK+q5p/hRmH/ZorCkSsJGNh2oK7jaRM8e
         q1yrE1WztV87Ndk9Y+DF3ayPOjQ0XlDIGzCpASYeiiM9Mnsi4unJBS9n/nLQNAp66yn3
         ZMkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VpypxEyENRJvROK6xHUL5Ckp8cqPiu+d4URbR3v3TwI=;
        b=NYFmnIAWbITh9hYXpESi4af25X9RIqNEhk/7zzckFT1FJCIG+mzKmf24v8cDtEuO6R
         TSZG90Z7l7SENRUmrqm6pkR+ZWs3/E5Wn4mGnIlRv2jXpv+M7VKz8Cyc5JYiZ/o/Cx9u
         VqNlNIJXtrPN2cLZD7bGRvaj6PkcyIxO2uNec8dpaXWCpC7amYzv4Pn2I0pv16TdW9D0
         eVmQV6+0nW8qEbzyJBX7JW3r6oNfjx1ldfW9Ikadk9pjQwLkTSd5wjN4NpPWvTfQkJ29
         1SUNI9XB5mf+o7RlOpwfuL+k3lYKTyC+uAMjcfhzyicptBlIkgM8xqGLRtSJ5oCwS0k+
         0NsQ==
X-Gm-Message-State: AOAM533hVA2T77Rj26QKWVfQnlRryoC2h/rvaBo7PIWBm6B+OA4JqZGa
        hLYqMjyWcR83yTEcGLNGbFqkrQedYOnZ7WvM9VQ=
X-Google-Smtp-Source: ABdhPJzCzVPkb1YUyPt/lT+Z2bHmPg8/v0GHD5UerKMlhExlv0eM5dz2Pp1xlblcs6eQg9cH5CIJaQ+39t3PJEmw4Gg=
X-Received: by 2002:a4a:a2c4:: with SMTP id r4mr1160804ool.71.1589374724283;
 Wed, 13 May 2020 05:58:44 -0700 (PDT)
MIME-Version: 1.0
References: <CAEjxPJ6pFdDfm55pv9bT3CV5DTFF9VqzRmG_Xi5bKNxPaGuOLg@mail.gmail.com>
 <158932282880.2885325.2688622278854566047.stgit@warthog.procyon.org.uk>
In-Reply-To: <158932282880.2885325.2688622278854566047.stgit@warthog.procyon.org.uk>
From:   Stephen Smalley <stephen.smalley.work@gmail.com>
Date:   Wed, 13 May 2020 08:58:33 -0400
Message-ID: <CAEjxPJ4=ZN_jKP2nX5mrMA3OxC8XLsYEmCPCD-78H4XQw=_hCA@mail.gmail.com>
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

On Tue, May 12, 2020 at 6:33 PM David Howells <dhowells@redhat.com> wrote:
>
> Since the meaning of combining the KEY_NEED_* constants is undefined, make
> it so that you can't do that by turning them into an enum.
>
> The enum is also given some extra values to represent special
> circumstances, such as:
>
>  (1) The '0' value is reserved and causes a warning to trap the parameter
>      being unset.
>
>  (2) The key is to be unlinked and we require no permissions on it, only
>      the keyring, (this replaces the KEY_LOOKUP_FOR_UNLINK flag).
>
>  (3) An override due to CAP_SYS_ADMIN.

CAP_SYS_ADMIN should never skip SELinux checking.  Even for Smack,
there is a separate capability (CAP_MAC_ADMIN) for that purpose.

>  (4) An override due to an instantiation token being present.

Not sure what this means but again we shouldn't skip SELinux checking
based on mere possession of an object capability (not a POSIX
capability).

>
>  (5) The permissions check is being deferred to later key_permission()
>      calls.
>
> The extra values give the opportunity for LSMs to audit these situations.
> ---

> diff --git a/security/keys/keyctl.c b/security/keys/keyctl.c
> index 7d8de1c9a478..6763ee45e04d 100644
> --- a/security/keys/keyctl.c
> +++ b/security/keys/keyctl.c
> @@ -434,7 +434,7 @@ long keyctl_invalidate_key(key_serial_t id)
>
>                 /* Root is permitted to invalidate certain special keys */
>                 if (capable(CAP_SYS_ADMIN)) {
> -                       key_ref = lookup_user_key(id, 0, 0);
> +                       key_ref = lookup_user_key(id, 0, KEY_SYSADMIN_OVERRIDE);

It would be better if the permission indicated the actual operation
(e.g. KEY_NEED_INVALIDATE_SPECIAL), and the decision whether to permit
CAP_SYS_ADMIN processes to override was left to the security modules.
SELinux doesn't automatically allow CAP_SYS_ADMIN processes to do
everything.

> @@ -479,7 +479,8 @@ long keyctl_keyring_clear(key_serial_t ringid)
>
>                 /* Root is permitted to invalidate certain special keyrings */
>                 if (capable(CAP_SYS_ADMIN)) {
> -                       keyring_ref = lookup_user_key(ringid, 0, 0);
> +                       keyring_ref = lookup_user_key(ringid, 0,
> +                                                     KEY_SYSADMIN_OVERRIDE);

Ditto.

> @@ -663,7 +664,7 @@ long keyctl_describe_key(key_serial_t keyid,
>                                 key_put(instkey);
>                                 key_ref = lookup_user_key(keyid,
>                                                           KEY_LOOKUP_PARTIAL,
> -                                                         0);
> +                                                         KEY_AUTHTOKEN_OVERRIDE);

Similarly, it would be better if the permission indicated the
operation (e.g. KEY_NEED_DESCRIBE) rather than the means by which it
is being authorized.  A MAC scheme won't allow mere knowledge of a
token/password-capability to permit violation of its policy.

> @@ -1471,7 +1472,7 @@ long keyctl_set_timeout(key_serial_t id, unsigned timeout)
>                                 key_put(instkey);
>                                 key_ref = lookup_user_key(id,
>                                                           KEY_LOOKUP_PARTIAL,
> -                                                         0);
> +                                                         KEY_AUTHTOKEN_OVERRIDE);

Ditto.

> @@ -1579,7 +1580,8 @@ long keyctl_get_security(key_serial_t keyid,
>                         return PTR_ERR(instkey);
>                 key_put(instkey);
>
> -               key_ref = lookup_user_key(keyid, KEY_LOOKUP_PARTIAL, 0);
> +               key_ref = lookup_user_key(keyid, KEY_LOOKUP_PARTIAL,
> +                                         KEY_AUTHTOKEN_OVERRIDE);

Ditto

> diff --git a/security/selinux/hooks.c b/security/selinux/hooks.c
> index 0b4e32161b77..3ff6b6dfc5ca 100644
> --- a/security/selinux/hooks.c
> +++ b/security/selinux/hooks.c
> @@ -6541,20 +6541,31 @@ static void selinux_key_free(struct key *k)
>
>  static int selinux_key_permission(key_ref_t key_ref,
>                                   const struct cred *cred,
> -                                 unsigned perm)
> +                                 enum key_need_perm need_perm)
>  {
>         struct key *key;
>         struct key_security_struct *ksec;
> -       u32 sid;
> +       u32 perm, sid;
>
> -       /* if no specific permissions are requested, we skip the
> -          permission check. No serious, additional covert channels
> -          appear to be created. */
> -       if (perm == 0)
> +       switch (need_perm) {
> +       case KEY_NEED_UNLINK:
> +       case KEY_SYSADMIN_OVERRIDE:
> +       case KEY_AUTHTOKEN_OVERRIDE:
> +       case KEY_DEFER_PERM_CHECK:
>                 return 0;

We really shouldn't be skipping any/all checking on CAP_SYS_ADMIN or
an AUTHTOKEN; those should still be subject to MAC policy.
