Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 094BF1D566D
	for <lists+keyrings@lfdr.de>; Fri, 15 May 2020 18:45:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726188AbgEOQpe (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Fri, 15 May 2020 12:45:34 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:44814 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726023AbgEOQpe (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Fri, 15 May 2020 12:45:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1589561133;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=+IBvKYnMRct6wIVYk1OHcT0bp5/WnDeiDsV8CVPaV/4=;
        b=QECgooPWYpPmKqiqQ9PAiKUs/Go7y+kcTQ5C5+KV/hSt/WlVczLsGAislwSOYX1NxquHav
        uvQGPMLs3XTBJI0pgLSDDMqCrzHnRRLdVgEli6IlBR5YkNAFxWApBHYV15i5LX8+H0rqCa
        UJMWE6KTun7QeC+B8E1l7bZkUgnXn+g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-311-00j2DJWnOzuUdvc1IhJFqw-1; Fri, 15 May 2020 12:45:29 -0400
X-MC-Unique: 00j2DJWnOzuUdvc1IhJFqw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9AF0218B6450;
        Fri, 15 May 2020 16:45:12 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-112-95.rdu2.redhat.com [10.10.112.95])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 94C9C579A0;
        Fri, 15 May 2020 16:45:10 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
        Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
        Kingdom.
        Registered in England and Wales under Company Registration No. 3798903
From:   David Howells <dhowells@redhat.com>
In-Reply-To: <CAEjxPJ5wW2qHYDsqKr5rjnRJ++4f2LXobCQkKZvWCSb_j0WN6w@mail.gmail.com>
References: <CAEjxPJ5wW2qHYDsqKr5rjnRJ++4f2LXobCQkKZvWCSb_j0WN6w@mail.gmail.com> <CAEjxPJ6pFdDfm55pv9bT3CV5DTFF9VqzRmG_Xi5bKNxPaGuOLg@mail.gmail.com> <158932282880.2885325.2688622278854566047.stgit@warthog.procyon.org.uk> <CAEjxPJ4=ZN_jKP2nX5mrMA3OxC8XLsYEmCPCD-78H4XQw=_hCA@mail.gmail.com> <3999877.1589475539@warthog.procyon.org.uk>
To:     Stephen Smalley <stephen.smalley.work@gmail.com>
Cc:     dhowells@redhat.com,
        Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
        Paul Moore <paul@paul-moore.com>,
        Casey Schaufler <casey@schaufler-ca.com>,
        keyrings@vger.kernel.org, SElinux list <selinux@vger.kernel.org>,
        LSM List <linux-security-module@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] keys: Move permissions checking decisions into the checking code
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <196729.1589561109.1@warthog.procyon.org.uk>
Content-Transfer-Encoding: quoted-printable
Date:   Fri, 15 May 2020 17:45:09 +0100
Message-ID: <196730.1589561109@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Stephen Smalley <stephen.smalley.work@gmail.com> wrote:

> >      (1) KEY_FLAG_KEEP in key->flags - The key may not be deleted and/=
or things
> >          may not be removed from the keyring.
> =

> Why can't they be deleted / removed?  They can't ever be deleted or
> removed or for some period of time?

This is only settable internally to keep special keys, such as the blackli=
st
loaded from the EFI BIOS, from being removed.

> >      (2) KEY_FLAG_ROOT_CAN_CLEAR in key->flags - The keyring can be cl=
eared by
> >          CAP_SYS_ADMIN.
> =

> Why do some keyrings get this flag and others do not?  Under what
> conditions?  Why is CAP_SYS_ADMIN the right capability for this?
> =

> >      (3) KEY_FLAG_ROOT_CAN_INVAL in key->flags - The key can be invali=
dated by
> >          CAP_SYS_ADMIN.
> =

> Ditto.

So that the sysadmin can clear, say, the NFS idmapper keyring or invalidat=
e
DNS lookup keys.

> >      (4) An appropriate auth token being set in cred->request_key_auth=
 that
> >          gives a process transient permission to view and instantiate =
a key.
> >          This is used by the kernel to delegate instantiation to users=
pace.
> =

> Is this ever allowed across different credentials?

The kernel upcalls by spawning a daemon.  I want to change this as it's no=
t
compatible with containers since namespaces make this problematic.

> When?

The request_key() system call will do this.  The normal use case is someth=
ing
like the AFS filesystem asking for a key so that it can do an operation.  =
The
possibility exists for the kernel to upcall, say, to something that does a=
klog
on behalf of the user - but aklog in turn needs to get the TGT out of the
keyrings.

> Why?  Is there a check between the different credentials before the
> auth token is created?

No.  I don't even know what the target creds will necessarily be at this
point.

> >     Note that this requires some tweaks to the testsuite as some of th=
e
> >     error codes change.
> =

> Which testsuite?  keyring or selinux or both?

The keyring testsuite.  No idea about the SELinux one.

> What error codes change (from what to what)?  Does this constitute an AB=
I
> change?

The following:

 (1) Passing the wrong type of key to KEYCTL_DH_COMPUTE now gets you
     EOPNOTSUPP rather than ENOKEY.  This is now as documented in the manu=
al
     page.

 (2) Passing key ID 0 or an invalid negative key ID to KEYCTL_DH_COMPUTE n=
ow
     gets you EINVAL rather than ENOKEY.

 (3) Passing key ID 0 or an invalid negative key ID to KEYCTL_READ now get=
s
     you EINVAL rather than ENOKEY.

Technically, it consistutes an ABI change, I suppose, but I think it is
probably sufficiently minor.

Or maybe on (2) and (3) I should go the other way.  You get ENOKEY for inv=
alid
key IDs (such as 0 or unsupported negative ones) across all callers of
lookup_user_key().  This would at least by consistent with the manual page=
s.

> I like moving more of the permission checking logic into the security
> modules and giving them greater visibility and control.  That said, I
> am somewhat concerned by the scale of this change, by the extent to
> which you are exposing keyring internals inside the security modules,
> and by the extent to which logic is getting duplicated in each
> security module.

It's what you asked for.

Now, I don't know if the LSM needs to know that the main keyutils permissi=
ons
checker invoked an override.  At least one of the overrides will have gone
through the LSM anyway when capable() was called.

> I'd suggest a more incremental approach, e.g. start with just the enum
> patch, then migrate the easy cases, then consider the more complicated
> cases.  And possibly we need multiple different security hooks for the
> keyring subsystem that are more specialized for the complicated cases.  =
If
> we authorize the delegation up front, we don't need to check it later.

I'll consider it.  But I really need to get what I'm going to include in t=
he
middle of the notifications patchset sorted now - or risk the notification=
s
and fsinfo patchsets getting bumped again.

Maybe what's needed is a pair of hooks whereby the call to capable() is
replaced with LSM hook specifically to ask about the overrides:

	security_key_use_sysadmin_override(key, cred);
	security_key_use_construction_override(key, cred);

And/or a hook to ask whether the process is allowed to do the request_key(=
)
call that they want:

	security_request_key(struct key_type *type,
			     const char *description,
			     struct key_tag *domain_tag,
			     const void *callout_info,
			     size_t callout_len,
			     void *aux);

I don't really want to do a "can the kernel delegate to process X?" hook j=
ust
at the moment, since I want to change/extend that code and I don't want to
commit to any particular security information being present yet.

I can go back to the enum patch for the moment if you and Casey can put up
with that for the moment?

David

