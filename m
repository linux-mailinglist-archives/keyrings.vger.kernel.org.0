Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE1241BBE4E
	for <lists+keyrings@lfdr.de>; Tue, 28 Apr 2020 14:54:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726826AbgD1Myv (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 28 Apr 2020 08:54:51 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:38483 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726836AbgD1Myv (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Tue, 28 Apr 2020 08:54:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1588078490;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=Q/j1WNR+YBrs98DzytkVX7oMWOtSdD3iLwhSY7RR9Xc=;
        b=H6iefjNOa/q/ImgVVTb8NnG01n4QWbFSiBhsRcI5b/RaG7oH86hGNdN2v1OqzOwu2NLKgP
        LW1mmVgQ7QzMy5BZoXZXk4uAFbXNscDYrmyHiWf5G+4hr/SOuTnlCrs0Y8jkvnkjNwkqRW
        HTQEqBozQWOoxq72gTNk39MH0UXMJYM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-473-f54CFXXxMBOApRvjB_eRig-1; Tue, 28 Apr 2020 08:54:48 -0400
X-MC-Unique: f54CFXXxMBOApRvjB_eRig-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 09677800C78;
        Tue, 28 Apr 2020 12:54:47 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-113-129.rdu2.redhat.com [10.10.113.129])
        by smtp.corp.redhat.com (Postfix) with ESMTP id A4AA019C4F;
        Tue, 28 Apr 2020 12:54:45 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
        Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
        Kingdom.
        Registered in England and Wales under Company Registration No. 3798903
From:   David Howells <dhowells@redhat.com>
In-Reply-To: <CAHC9VhT95GJKNTMvTtmZL35UOoVwbGH-eDWZyELb5oZ5rQU+Tw@mail.gmail.com>
References: <CAHC9VhT95GJKNTMvTtmZL35UOoVwbGH-eDWZyELb5oZ5rQU+Tw@mail.gmail.com>
To:     Paul Moore <paul@paul-moore.com>,
        Stephen Smalley <stephen.smalley.work@gmail.com>
Cc:     dhowells@redhat.com, keyrings@vger.kernel.org,
        selinux@vger.kernel.org, linux-security-module@vger.kernel.org
Subject: [PATCH] selinux: Fix use of KEY_NEED_* instead of KEY__* perms [v2]
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <924657.1588078484.1@warthog.procyon.org.uk>
Date:   Tue, 28 Apr 2020 13:54:44 +0100
Message-ID: <924658.1588078484@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

selinux: Fix use of KEY_NEED_* instead of KEY__* perms
    
selinux_key_permission() is passing the KEY_NEED_* permissions to
avc_has_perm() instead of the KEY__* values.  It happens to work because
the values are all coincident.

Fixes: d720024e94de ("[PATCH] selinux: add hooks for key subsystem")
Reported-by: Paul Moore <paul@paul-moore.com>
Signed-off-by: David Howells <dhowells@redhat.com>
---
 security/selinux/hooks.c |   23 +++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/security/selinux/hooks.c b/security/selinux/hooks.c
index 0b4e32161b77..4b6624e5dab4 100644
--- a/security/selinux/hooks.c
+++ b/security/selinux/hooks.c
@@ -6539,20 +6539,39 @@ static void selinux_key_free(struct key *k)
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
+		WARN_ON(1);
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
+		return -EPERM;
 	sid = cred_sid(cred);
 
 	key = key_ref_to_ptr(key_ref);

