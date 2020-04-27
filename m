Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 24B741BA5F4
	for <lists+keyrings@lfdr.de>; Mon, 27 Apr 2020 16:12:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727981AbgD0OMV (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Mon, 27 Apr 2020 10:12:21 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:56267 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727925AbgD0OMV (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Mon, 27 Apr 2020 10:12:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1587996739;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=NpI8PJYyNx+laG2NFVc7Zvkxuqud3siibCd4t0XswQE=;
        b=P+oRgMLsXLOYMmcd+C6R6IdMY/SFDB7v1Fojrov+G5ZiX4/20C0GhdbgdDAdwmuRhk2u26
        eXFnc9H2mfec57A9LH+ualQa7J22AsyNW2UBMAPrMkvsluQqaC9K1G4iQ074iz4eyzFwId
        SIWNhbnneB82ASfTtmWz3RfROIHWH0U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-415-mPMDvgv5OHy5VX1yAxRaYg-1; Mon, 27 Apr 2020 10:12:17 -0400
X-MC-Unique: mPMDvgv5OHy5VX1yAxRaYg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8612510524FF;
        Mon, 27 Apr 2020 14:12:16 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-113-129.rdu2.redhat.com [10.10.113.129])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 84E3260BEC;
        Mon, 27 Apr 2020 14:12:15 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
        Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
        Kingdom.
        Registered in England and Wales under Company Registration No. 3798903
From:   David Howells <dhowells@redhat.com>
In-Reply-To: <CAHC9VhQbhG8-ZABtkZr1FXo9cuH4_nsbB=HP_fGvW+FNQ7iAXg@mail.gmail.com>
References: <CAHC9VhQbhG8-ZABtkZr1FXo9cuH4_nsbB=HP_fGvW+FNQ7iAXg@mail.gmail.com> <CAHC9VhT95GJKNTMvTtmZL35UOoVwbGH-eDWZyELb5oZ5rQU+Tw@mail.gmail.com> <2136640.1587472186@warthog.procyon.org.uk> <CAHC9VhQnORRaRapbb1wrUsxweJCRJ+X+RdvKw8_U0pT0fuxZ6A@mail.gmail.com> <3834193.1587771802@warthog.procyon.org.uk>
To:     Paul Moore <paul@paul-moore.com>
Cc:     dhowells@redhat.com, keyrings@vger.kernel.org,
        selinux@vger.kernel.org, linux-security-module@vger.kernel.org
Subject: [PATCH] selinux: Fix use of KEY_NEED_* instead of KEY__* perms
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <355575.1587996734.1@warthog.procyon.org.uk>
Date:   Mon, 27 Apr 2020 15:12:14 +0100
Message-ID: <355576.1587996734@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Paul Moore <paul@paul-moore.com> wrote:

> Okay, can you send the next version of the patch to the SELinux list for
> review?

Here you go.  Note that I did this a few days ago and I actually used EACCES
rather than EPERM.  Which one is one preferred for this?

David
---
selinux: Fix use of KEY_NEED_* instead of KEY__* perms

selinux_key_getsecurity() is passing the KEY_NEED_* permissions to
security_sid_to_context() instead of the KEY__* values.  It happens to work
because the values are all coincident.

Fixes: d720024e94de ("[PATCH] selinux: add hooks for key subsystem")
Reported-by: Paul Moore <paul@paul-moore.com>
Signed-off-by: David Howells <dhowells@redhat.com>
---
 security/selinux/hooks.c |   22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/security/selinux/hooks.c b/security/selinux/hooks.c
index 0b4e32161b77..6087955b49d8 100644
--- a/security/selinux/hooks.c
+++ b/security/selinux/hooks.c
@@ -6539,20 +6539,38 @@ static void selinux_key_free(struct key *k)
 	kfree(ksec);
 }
 
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
 
 	/* if no specific permissions are requested, we skip the
 	   permission check. No serious, additional covert channels
 	   appear to be created. */
-	if (perm == 0)
+	if (need_perm == 0)
 		return 0;
 
+	perm = selinux_keyperm_to_av(need_perm);
+	if (perm == 0)
+		return -EACCES;
 	sid = cred_sid(cred);
 
 	key = key_ref_to_ptr(key_ref);

