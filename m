Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A1995146C5D
	for <lists+keyrings@lfdr.de>; Thu, 23 Jan 2020 16:12:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728911AbgAWPMJ (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 23 Jan 2020 10:12:09 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:30893 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728900AbgAWPMJ (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 23 Jan 2020 10:12:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1579792329;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=TOTDTwuaI0Kk0LUy5rbPDT0f6tV/bdzpgd5A51iAmQw=;
        b=Liw91XNpW2Keht2Q1ClXCZRASkSQSrbbFXovrJg/eoSftPuVRrPTVROh56KtVBukmsKYQ8
        ukzjF39WdaasFdnPCRrFDGbUV8enhva+T6FdJ/tB7ocu+QX6jDutvGNybly36j43iyq3vv
        /8gPWvnKtrXZBCmCyraUHglegnx6sjE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-207-dY3-Hz3EOVSB5G3kVMwjQA-1; Thu, 23 Jan 2020 10:12:04 -0500
X-MC-Unique: dY3-Hz3EOVSB5G3kVMwjQA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EED9D18B5F95;
        Thu, 23 Jan 2020 15:12:02 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-120-49.rdu2.redhat.com [10.10.120.49])
        by smtp.corp.redhat.com (Postfix) with ESMTP id A3DED8CCCB;
        Thu, 23 Jan 2020 15:12:01 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
        Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
        Kingdom.
        Registered in England and Wales under Company Registration No. 3798903
From:   David Howells <dhowells@redhat.com>
In-Reply-To: <8ee40192da117d9cdf4eab1e63ab5f77b359801c.camel@btinternet.com>
References: <8ee40192da117d9cdf4eab1e63ab5f77b359801c.camel@btinternet.com>
To:     Stephen Smalley <sds@tycho.nsa.gov>
Cc:     dhowells@redhat.com,
        Richard Haines <richard_c_haines@btinternet.com>,
        keyrings@vger.kernel.org, selinux@vger.kernel.org,
        linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: SELinux: How to split permissions for keys?
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <4057699.1579792320.1@warthog.procyon.org.uk>
Content-Transfer-Encoding: quoted-printable
Date:   Thu, 23 Jan 2020 15:12:00 +0000
Message-ID: <4057700.1579792320@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Hi Stephen,

I have patches to split the permissions that are used for keys to make the=
m a
bit finer grained and easier to use - and also to move to ACLs rather than
fixed masks.  See patch "keys: Replace uid/gid/perm permissions checking w=
ith
an ACL" here:

	https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git/log=
/?h=3Dkeys-acl

However, I may not have managed the permission mask transformation inside
SELinux correctly.  Could you lend an eyeball?  The change to the permissi=
ons
model is as follows:

    The SETATTR permission is split to create two new permissions:
    =

     (1) SET_SECURITY - which allows the key's owner, group and ACL to be
         changed and a restriction to be placed on a keyring.
    =

     (2) REVOKE - which allows a key to be revoked.
    =

    The SEARCH permission is split to create:
    =

     (1) SEARCH - which allows a keyring to be search and a key to be foun=
d.
    =

     (2) JOIN - which allows a keyring to be joined as a session keyring.
    =

     (3) INVAL - which allows a key to be invalidated.
    =

    The WRITE permission is also split to create:
    =

     (1) WRITE - which allows a key's content to be altered and links to b=
e
         added, removed and replaced in a keyring.
    =

     (2) CLEAR - which allows a keyring to be cleared completely.  This is
         split out to make it possible to give just this to an administrat=
or.
    =

     (3) REVOKE - see above.

The change to SELinux is attached below.

Should the split be pushed down into the SELinux policy rather than trying=
 to
calculate it?

Thanks,
David
---
diff --git a/security/selinux/hooks.c b/security/selinux/hooks.c
index 116b4d644f68..c8db5235b01f 100644
--- a/security/selinux/hooks.c
+++ b/security/selinux/hooks.c
@@ -6556,6 +6556,7 @@ static int selinux_key_permission(key_ref_t key_ref,
 {
 	struct key *key;
 	struct key_security_struct *ksec;
+	unsigned oldstyle_perm;
 	u32 sid;
 =

 	/* if no specific permissions are requested, we skip the
@@ -6564,13 +6565,26 @@ static int selinux_key_permission(key_ref_t key_re=
f,
 	if (perm =3D=3D 0)
 		return 0;
 =

+	oldstyle_perm =3D perm & (KEY_NEED_VIEW | KEY_NEED_READ | KEY_NEED_WRITE=
 |
+				KEY_NEED_SEARCH | KEY_NEED_LINK);
+	if (perm & KEY_NEED_SETSEC)
+		oldstyle_perm |=3D OLD_KEY_NEED_SETATTR;
+	if (perm & KEY_NEED_INVAL)
+		oldstyle_perm |=3D KEY_NEED_SEARCH;
+	if (perm & KEY_NEED_REVOKE && !(perm & OLD_KEY_NEED_SETATTR))
+		oldstyle_perm |=3D KEY_NEED_WRITE;
+	if (perm & KEY_NEED_JOIN)
+		oldstyle_perm |=3D KEY_NEED_SEARCH;
+	if (perm & KEY_NEED_CLEAR)
+		oldstyle_perm |=3D KEY_NEED_WRITE;
+
 	sid =3D cred_sid(cred);
 =

 	key =3D key_ref_to_ptr(key_ref);
 	ksec =3D key->security;
 =

 	return avc_has_perm(&selinux_state,
-			    sid, ksec->sid, SECCLASS_KEY, perm, NULL);
+			    sid, ksec->sid, SECCLASS_KEY, oldstyle_perm, NULL);
 }
 =

 static int selinux_key_getsecurity(struct key *key, char **_buffer)

