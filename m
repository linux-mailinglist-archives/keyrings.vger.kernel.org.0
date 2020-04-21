Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A6D991B2608
	for <lists+keyrings@lfdr.de>; Tue, 21 Apr 2020 14:29:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728773AbgDUM3y (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 21 Apr 2020 08:29:54 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:59779 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726018AbgDUM3y (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Tue, 21 Apr 2020 08:29:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1587472193;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=vh6eZbEF1kMu6TlhSUM325Zg26pqvmrP6AkbtLYSJ4g=;
        b=X1TLaqqMgOser4YjujU/XMO12P5hoP+kSsYbSfXk/6CFUNrMfNFm3QEeNRgGVJsONwoaf3
        lK1Ob6c0Srm/PR3GGoY8t4xbtp+M5nR0gs6tgSjHE/70iwVi7BW23lRY2sNE2DonCP4qnN
        75p/SfjBbASntIVAQ2qJds8R3MPEHjA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-497-qS76acq_Oxqm-3Sh3L-7Yg-1; Tue, 21 Apr 2020 08:29:49 -0400
X-MC-Unique: qS76acq_Oxqm-3Sh3L-7Yg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 380C6107ACC9;
        Tue, 21 Apr 2020 12:29:48 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-113-129.rdu2.redhat.com [10.10.113.129])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 307A55DA83;
        Tue, 21 Apr 2020 12:29:47 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
        Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
        Kingdom.
        Registered in England and Wales under Company Registration No. 3798903
From:   David Howells <dhowells@redhat.com>
In-Reply-To: <CAHC9VhT95GJKNTMvTtmZL35UOoVwbGH-eDWZyELb5oZ5rQU+Tw@mail.gmail.com>
References: <CAHC9VhT95GJKNTMvTtmZL35UOoVwbGH-eDWZyELb5oZ5rQU+Tw@mail.gmail.com>
To:     Paul Moore <paul@paul-moore.com>
Cc:     dhowells@redhat.com, keyrings@vger.kernel.org,
        selinux@vger.kernel.org, linux-security-module@vger.kernel.org
Subject: Re: Problem with 9ba09998baa9 ("selinux: Implement the watch_key security hook") in linux-next
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <2136639.1587472186.1@warthog.procyon.org.uk>
Content-Transfer-Encoding: quoted-printable
Date:   Tue, 21 Apr 2020 13:29:46 +0100
Message-ID: <2136640.1587472186@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Paul Moore <paul@paul-moore.com> wrote:

> ... in particular it is the fifth argument to avc_has_perm(),
> "KEY_NEED_VIEW" which is a problem.  KEY_NEED_VIEW is not a SELinux
> permission and would likely result in odd behavior when passed to
> avc_has_perm().

I think it works because KEY_NEED_VIEW happens to coincide with KEY__VIEW.=
  It
should just use KEY__VIEW instead.

> it probably makes the most sense to pull the permission mapping in
> selinux_key_permission() out into a separate function, e.g.
> key_perm_to_av(...)

Agreed.  How about the attached patch?  I wonder if I should do bit-by-bit
translation rather than using a switch?  But then it's difficult to decide
what it means if someone passes in two KEY_NEED_* flags OR'd together - is=
 it
either or both?

> and then use this newly created mapping function in [...]
> selinux_watch_key()

No, I think I should just hard-code KEY__VIEW there.

David
---
commit 70d1d82aa014ae4511976b4d80c17138006dddec
Author: David Howells <dhowells@redhat.com>
Date:   Tue Apr 21 13:15:16 2020 +0100

    selinux: Fix use of KEY_NEED_* instead of KEY__* perms
    =

    selinux_key_getsecurity() is passing the KEY_NEED_* permissions to
    security_sid_to_context() instead of the KEY__* values.  It happens to=
 work
    because the values are all coincident.
    =

    Fixes: d720024e94de ("[PATCH] selinux: add hooks for key subsystem")
    Reported-by: Paul Moore <paul@paul-moore.com>
    Signed-off-by: David Howells <dhowells@redhat.com>

diff --git a/security/selinux/hooks.c b/security/selinux/hooks.c
index 0b4e32161b77..32f7fa538c5f 100644
--- a/security/selinux/hooks.c
+++ b/security/selinux/hooks.c
@@ -6539,12 +6539,27 @@ static void selinux_key_free(struct key *k)
 	kfree(ksec);
 }
 =

+static unsigned int selinux_keyperm_to_av(unsigned int need_perm)
+{
+	switch (need_perm) {
+	case KEY_NEED_VIEW:	return KEY__VIEW;
+	case KEY_NEED_READ:	return KEY__READ;
+	case KEY_NEED_WRITE:	return KEY__WRITE;
+	case KEY_NEED_SEARCH:	return KEY__SEARCH;
+	case KEY_NEED_LINK:	return KEY__LINK;
+	case KEY_NEED_SETATTR:	return KEY__SETATTR;
+	default:
+		return 0;
+	}
+}
+
 static int selinux_key_permission(key_ref_t key_ref,
 				  const struct cred *cred,
-				  unsigned perm)
+				  unsigned need_perm)
 {
 	struct key *key;
 	struct key_security_struct *ksec;
+	unsigned int perm;
 	u32 sid;
 =

 	/* if no specific permissions are requested, we skip the
@@ -6553,6 +6568,7 @@ static int selinux_key_permission(key_ref_t key_ref,
 	if (perm =3D=3D 0)
 		return 0;
 =

+	perm =3D selinux_keyperm_to_av(need_perm);
 	sid =3D cred_sid(cred);
 =

 	key =3D key_ref_to_ptr(key_ref);

