Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9355A1D5C5F
	for <lists+keyrings@lfdr.de>; Sat, 16 May 2020 00:27:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726541AbgEOW11 (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Fri, 15 May 2020 18:27:27 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:28991 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726183AbgEOW10 (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Fri, 15 May 2020 18:27:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1589581643;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=1T6UEsq2WKJ6GrIU2koyw3xYAs7/3rkCVLHez0w6p0E=;
        b=hhibuMUIINEOEAXHJMYjp6viSpmkjmZFu0y/o8DzQAaK8uQ30cJPvYdVb+THj+rwbLl7mR
        zGZ8mGTgClnaIc8N/8Y5Zc2Fwm1ZOejLeGujRZqJpEH/jGF9EYarKb9KEV8ROg1fH9Ac7n
        PznS7ULBmGeafeY56ynG5T2MbIcUuWw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-157-6A-o573gMGmMLnna7tBGuA-1; Fri, 15 May 2020 18:27:21 -0400
X-MC-Unique: 6A-o573gMGmMLnna7tBGuA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5FD3D80183C;
        Fri, 15 May 2020 22:27:20 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-112-95.rdu2.redhat.com [10.10.112.95])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 63F6A78B20;
        Fri, 15 May 2020 22:27:18 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
        Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
        Kingdom.
        Registered in England and Wales under Company Registration No. 3798903
From:   David Howells <dhowells@redhat.com>
In-Reply-To: <CAEjxPJ6JGZxF_G63Y7M-CQpmt5Sqp2uFF4oEKS6NpNLZxXhXcA@mail.gmail.com>
References: <CAEjxPJ6JGZxF_G63Y7M-CQpmt5Sqp2uFF4oEKS6NpNLZxXhXcA@mail.gmail.com> <CAEjxPJ6pFdDfm55pv9bT3CV5DTFF9VqzRmG_Xi5bKNxPaGuOLg@mail.gmail.com> <158932282880.2885325.2688622278854566047.stgit@warthog.procyon.org.uk> <CAEjxPJ4=ZN_jKP2nX5mrMA3OxC8XLsYEmCPCD-78H4XQw=_hCA@mail.gmail.com> <3999877.1589475539@warthog.procyon.org.uk> <CAEjxPJ5wW2qHYDsqKr5rjnRJ++4f2LXobCQkKZvWCSb_j0WN6w@mail.gmail.com> <196730.1589561109@warthog.procyon.org.uk>
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
Content-ID: <277189.1589581637.1@warthog.procyon.org.uk>
Content-Transfer-Encoding: quoted-printable
Date:   Fri, 15 May 2020 23:27:17 +0100
Message-ID: <277190.1589581637@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Stephen Smalley <stephen.smalley.work@gmail.com> wrote:

> > I can go back to the enum patch for the moment if you and Casey can pu=
t up
> > with that for the moment?
> =

> Yes, let's do that.

Okay.  I'll use the attached.  I've added a note into the commit message t=
o
indicate what should be done in future.  I won't put the other patch into =
my
keys-next branch yet as it will conflict with this.

David
---
commit e9c98329b2201e6df4edb34dc386e6ef1eeeb78b
Author: David Howells <dhowells@redhat.com>
Date:   Tue May 12 15:16:29 2020 +0100

    keys: Make the KEY_NEED_* perms an enum rather than a mask
    =

    Since the meaning of combining the KEY_NEED_* constants is undefined, =
make
    it so that you can't do that by turning them into an enum.
    =

    The enum is also given some extra values to represent special
    circumstances, such as:
    =

     (1) The '0' value is reserved and causes a warning to trap the parame=
ter
         being unset.
    =

     (2) The key is to be unlinked and we require no permissions on it, on=
ly
         the keyring, (this replaces the KEY_LOOKUP_FOR_UNLINK flag).
    =

     (3) An override due to CAP_SYS_ADMIN.
    =

     (4) An override due to an instantiation token being present.
    =

     (5) The permissions check is being deferred to later key_permission()
         calls.
    =

    The extra values give the opportunity for LSMs to audit these situatio=
ns.
    =

    [Note: This really needs overhauling so that lookup_user_key() tells
     key_task_permission() and the LSM what operation is being done and le=
aves
     it to those functions to decide how to map that onto the available
     permits.  However, I don't really want to make these change in the mi=
ddle
     of the notifications patchset.]
    =

    Signed-off-by: David Howells <dhowells@redhat.com>
    cc: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
    cc: Paul Moore <paul@paul-moore.com>
    cc: Stephen Smalley <stephen.smalley.work@gmail.com>
    cc: Casey Schaufler <casey@schaufler-ca.com>
    cc: keyrings@vger.kernel.org
    cc: selinux@vger.kernel.org

diff --git a/include/linux/key.h b/include/linux/key.h
index b99b40db08fc..0f2e24f13c2b 100644
--- a/include/linux/key.h
+++ b/include/linux/key.h
@@ -71,6 +71,23 @@ struct net;
 =

 #define KEY_PERM_UNDEF	0xffffffff
 =

+/*
+ * The permissions required on a key that we're looking up.
+ */
+enum key_need_perm {
+	KEY_NEED_UNSPECIFIED,	/* Needed permission unspecified */
+	KEY_NEED_VIEW,		/* Require permission to view attributes */
+	KEY_NEED_READ,		/* Require permission to read content */
+	KEY_NEED_WRITE,		/* Require permission to update / modify */
+	KEY_NEED_SEARCH,	/* Require permission to search (keyring) or find (key)=
 */
+	KEY_NEED_LINK,		/* Require permission to link */
+	KEY_NEED_SETATTR,	/* Require permission to change attributes */
+	KEY_NEED_UNLINK,	/* Require permission to unlink key */
+	KEY_SYSADMIN_OVERRIDE,	/* Special: override by CAP_SYS_ADMIN */
+	KEY_AUTHTOKEN_OVERRIDE,	/* Special: override by possession of auth token=
 */
+	KEY_DEFER_PERM_CHECK,	/* Special: permission check is deferred */
+};
+
 struct seq_file;
 struct user_struct;
 struct signal_struct;
@@ -420,20 +437,9 @@ static inline key_serial_t key_serial(const struct ke=
y *key)
 extern void key_set_timeout(struct key *, unsigned);
 =

 extern key_ref_t lookup_user_key(key_serial_t id, unsigned long flags,
-				 key_perm_t perm);
+				 enum key_need_perm need_perm);
 extern void key_free_user_ns(struct user_namespace *);
 =

-/*
- * The permissions required on a key that we're looking up.
- */
-#define	KEY_NEED_VIEW	0x01	/* Require permission to view attributes */
-#define	KEY_NEED_READ	0x02	/* Require permission to read content */
-#define	KEY_NEED_WRITE	0x04	/* Require permission to update / modify */
-#define	KEY_NEED_SEARCH	0x08	/* Require permission to search (keyring) or=
 find (key) */
-#define	KEY_NEED_LINK	0x10	/* Require permission to link */
-#define	KEY_NEED_SETATTR 0x20	/* Require permission to change attributes =
*/
-#define	KEY_NEED_ALL	0x3f	/* All the above permissions */
-
 static inline short key_read_state(const struct key *key)
 {
 	/* Barrier versus mark_key_instantiated(). */
diff --git a/include/linux/security.h b/include/linux/security.h
index e7914e4e0b02..57aac14e3418 100644
--- a/include/linux/security.h
+++ b/include/linux/security.h
@@ -1767,8 +1767,8 @@ static inline int security_path_chroot(const struct =
path *path)
 =

 int security_key_alloc(struct key *key, const struct cred *cred, unsigned=
 long flags);
 void security_key_free(struct key *key);
-int security_key_permission(key_ref_t key_ref,
-			    const struct cred *cred, unsigned perm);
+int security_key_permission(key_ref_t key_ref, const struct cred *cred,
+			    enum key_need_perm need_perm);
 int security_key_getsecurity(struct key *key, char **_buffer);
 =

 #else
@@ -1786,7 +1786,7 @@ static inline void security_key_free(struct key *key=
)
 =

 static inline int security_key_permission(key_ref_t key_ref,
 					  const struct cred *cred,
-					  unsigned perm)
+					  enum key_need_perm need_perm)
 {
 	return 0;
 }
diff --git a/security/keys/internal.h b/security/keys/internal.h
index 28e17f4f3328..1fc17cb317a9 100644
--- a/security/keys/internal.h
+++ b/security/keys/internal.h
@@ -167,7 +167,6 @@ extern bool lookup_user_key_possessed(const struct key=
 *key,
 				      const struct key_match_data *match_data);
 #define KEY_LOOKUP_CREATE	0x01
 #define KEY_LOOKUP_PARTIAL	0x02
-#define KEY_LOOKUP_FOR_UNLINK	0x04
 =

 extern long join_session_keyring(const char *name);
 extern void key_change_session_keyring(struct callback_head *twork);
@@ -183,7 +182,7 @@ extern void key_gc_keytype(struct key_type *ktype);
 =

 extern int key_task_permission(const key_ref_t key_ref,
 			       const struct cred *cred,
-			       key_perm_t perm);
+			       enum key_need_perm need_perm);
 =

 static inline void notify_key(struct key *key,
 			      enum key_notification_subtype subtype, u32 aux)
@@ -205,9 +204,10 @@ static inline void notify_key(struct key *key,
 /*
  * Check to see whether permission is granted to use a key in the desired=
 way.
  */
-static inline int key_permission(const key_ref_t key_ref, unsigned perm)
+static inline int key_permission(const key_ref_t key_ref,
+				 enum key_need_perm need_perm)
 {
-	return key_task_permission(key_ref, current_cred(), perm);
+	return key_task_permission(key_ref, current_cred(), need_perm);
 }
 =

 extern struct key_type key_type_request_key_auth;
diff --git a/security/keys/keyctl.c b/security/keys/keyctl.c
index 7d8de1c9a478..6763ee45e04d 100644
--- a/security/keys/keyctl.c
+++ b/security/keys/keyctl.c
@@ -434,7 +434,7 @@ long keyctl_invalidate_key(key_serial_t id)
 =

 		/* Root is permitted to invalidate certain special keys */
 		if (capable(CAP_SYS_ADMIN)) {
-			key_ref =3D lookup_user_key(id, 0, 0);
+			key_ref =3D lookup_user_key(id, 0, KEY_SYSADMIN_OVERRIDE);
 			if (IS_ERR(key_ref))
 				goto error;
 			if (test_bit(KEY_FLAG_ROOT_CAN_INVAL,
@@ -479,7 +479,8 @@ long keyctl_keyring_clear(key_serial_t ringid)
 =

 		/* Root is permitted to invalidate certain special keyrings */
 		if (capable(CAP_SYS_ADMIN)) {
-			keyring_ref =3D lookup_user_key(ringid, 0, 0);
+			keyring_ref =3D lookup_user_key(ringid, 0,
+						      KEY_SYSADMIN_OVERRIDE);
 			if (IS_ERR(keyring_ref))
 				goto error;
 			if (test_bit(KEY_FLAG_ROOT_CAN_CLEAR,
@@ -563,7 +564,7 @@ long keyctl_keyring_unlink(key_serial_t id, key_serial=
_t ringid)
 		goto error;
 	}
 =

-	key_ref =3D lookup_user_key(id, KEY_LOOKUP_FOR_UNLINK, 0);
+	key_ref =3D lookup_user_key(id, KEY_LOOKUP_PARTIAL, KEY_NEED_UNLINK);
 	if (IS_ERR(key_ref)) {
 		ret =3D PTR_ERR(key_ref);
 		goto error2;
@@ -663,7 +664,7 @@ long keyctl_describe_key(key_serial_t keyid,
 				key_put(instkey);
 				key_ref =3D lookup_user_key(keyid,
 							  KEY_LOOKUP_PARTIAL,
-							  0);
+							  KEY_AUTHTOKEN_OVERRIDE);
 				if (!IS_ERR(key_ref))
 					goto okay;
 			}
@@ -833,7 +834,7 @@ long keyctl_read_key(key_serial_t keyid, char __user *=
buffer, size_t buflen)
 	size_t key_data_len;
 =

 	/* find the key first */
-	key_ref =3D lookup_user_key(keyid, 0, 0);
+	key_ref =3D lookup_user_key(keyid, 0, KEY_DEFER_PERM_CHECK);
 	if (IS_ERR(key_ref)) {
 		ret =3D -ENOKEY;
 		goto out;
@@ -1471,7 +1472,7 @@ long keyctl_set_timeout(key_serial_t id, unsigned ti=
meout)
 				key_put(instkey);
 				key_ref =3D lookup_user_key(id,
 							  KEY_LOOKUP_PARTIAL,
-							  0);
+							  KEY_AUTHTOKEN_OVERRIDE);
 				if (!IS_ERR(key_ref))
 					goto okay;
 			}
@@ -1579,7 +1580,8 @@ long keyctl_get_security(key_serial_t keyid,
 			return PTR_ERR(instkey);
 		key_put(instkey);
 =

-		key_ref =3D lookup_user_key(keyid, KEY_LOOKUP_PARTIAL, 0);
+		key_ref =3D lookup_user_key(keyid, KEY_LOOKUP_PARTIAL,
+					  KEY_AUTHTOKEN_OVERRIDE);
 		if (IS_ERR(key_ref))
 			return PTR_ERR(key_ref);
 	}
diff --git a/security/keys/permission.c b/security/keys/permission.c
index 085f907b64ac..4a61f804e80f 100644
--- a/security/keys/permission.c
+++ b/security/keys/permission.c
@@ -13,7 +13,7 @@
  * key_task_permission - Check a key can be used
  * @key_ref: The key to check.
  * @cred: The credentials to use.
- * @perm: The permissions to check for.
+ * @need_perm: The permission required.
  *
  * Check to see whether permission is granted to use a key in the desired=
 way,
  * but permit the security modules to override.
@@ -24,12 +24,30 @@
  * permissions bits or the LSM check.
  */
 int key_task_permission(const key_ref_t key_ref, const struct cred *cred,
-			unsigned perm)
+			enum key_need_perm need_perm)
 {
 	struct key *key;
-	key_perm_t kperm;
+	key_perm_t kperm, mask;
 	int ret;
 =

+	switch (need_perm) {
+	default:
+		WARN_ON(1);
+		return -EACCES;
+	case KEY_NEED_UNLINK:
+	case KEY_SYSADMIN_OVERRIDE:
+	case KEY_AUTHTOKEN_OVERRIDE:
+	case KEY_DEFER_PERM_CHECK:
+		goto lsm;
+
+	case KEY_NEED_VIEW:	mask =3D KEY_OTH_VIEW;	break;
+	case KEY_NEED_READ:	mask =3D KEY_OTH_READ;	break;
+	case KEY_NEED_WRITE:	mask =3D KEY_OTH_WRITE;	break;
+	case KEY_NEED_SEARCH:	mask =3D KEY_OTH_SEARCH;	break;
+	case KEY_NEED_LINK:	mask =3D KEY_OTH_LINK;	break;
+	case KEY_NEED_SETATTR:	mask =3D KEY_OTH_SETATTR;	break;
+	}
+
 	key =3D key_ref_to_ptr(key_ref);
 =

 	/* use the second 8-bits of permissions for keys the caller owns */
@@ -64,13 +82,12 @@ int key_task_permission(const key_ref_t key_ref, const=
 struct cred *cred,
 	if (is_key_possessed(key_ref))
 		kperm |=3D key->perm >> 24;
 =

-	kperm =3D kperm & perm & KEY_NEED_ALL;
-
-	if (kperm !=3D perm)
+	if ((kperm & mask) !=3D mask)
 		return -EACCES;
 =

 	/* let LSM be the final arbiter */
-	return security_key_permission(key_ref, cred, perm);
+lsm:
+	return security_key_permission(key_ref, cred, need_perm);
 }
 EXPORT_SYMBOL(key_task_permission);
 =

diff --git a/security/keys/process_keys.c b/security/keys/process_keys.c
index 09541de31f2f..7e0232db1707 100644
--- a/security/keys/process_keys.c
+++ b/security/keys/process_keys.c
@@ -609,7 +609,7 @@ bool lookup_user_key_possessed(const struct key *key,
  * returned key reference.
  */
 key_ref_t lookup_user_key(key_serial_t id, unsigned long lflags,
-			  key_perm_t perm)
+			  enum key_need_perm need_perm)
 {
 	struct keyring_search_context ctx =3D {
 		.match_data.cmp		=3D lookup_user_key_possessed,
@@ -773,35 +773,33 @@ key_ref_t lookup_user_key(key_serial_t id, unsigned =
long lflags,
 =

 	/* unlink does not use the nominated key in any way, so can skip all
 	 * the permission checks as it is only concerned with the keyring */
-	if (lflags & KEY_LOOKUP_FOR_UNLINK) {
-		ret =3D 0;
-		goto error;
-	}
-
-	if (!(lflags & KEY_LOOKUP_PARTIAL)) {
-		ret =3D wait_for_key_construction(key, true);
-		switch (ret) {
-		case -ERESTARTSYS:
-			goto invalid_key;
-		default:
-			if (perm)
+	if (need_perm !=3D KEY_NEED_UNLINK) {
+		if (!(lflags & KEY_LOOKUP_PARTIAL)) {
+			ret =3D wait_for_key_construction(key, true);
+			switch (ret) {
+			case -ERESTARTSYS:
+				goto invalid_key;
+			default:
+				if (need_perm !=3D KEY_AUTHTOKEN_OVERRIDE &&
+				    need_perm !=3D KEY_DEFER_PERM_CHECK)
+					goto invalid_key;
+			case 0:
+				break;
+			}
+		} else if (need_perm !=3D KEY_DEFER_PERM_CHECK) {
+			ret =3D key_validate(key);
+			if (ret < 0)
 				goto invalid_key;
-		case 0:
-			break;
 		}
-	} else if (perm) {
-		ret =3D key_validate(key);
-		if (ret < 0)
+
+		ret =3D -EIO;
+		if (!(lflags & KEY_LOOKUP_PARTIAL) &&
+		    key_read_state(key) =3D=3D KEY_IS_UNINSTANTIATED)
 			goto invalid_key;
 	}
 =

-	ret =3D -EIO;
-	if (!(lflags & KEY_LOOKUP_PARTIAL) &&
-	    key_read_state(key) =3D=3D KEY_IS_UNINSTANTIATED)
-		goto invalid_key;
-
 	/* check the permissions */
-	ret =3D key_task_permission(key_ref, ctx.cred, perm);
+	ret =3D key_task_permission(key_ref, ctx.cred, need_perm);
 	if (ret < 0)
 		goto invalid_key;
 =

diff --git a/security/security.c b/security/security.c
index c73334ab2882..af32d4cd0462 100644
--- a/security/security.c
+++ b/security/security.c
@@ -2398,10 +2398,10 @@ void security_key_free(struct key *key)
 	call_void_hook(key_free, key);
 }
 =

-int security_key_permission(key_ref_t key_ref,
-			    const struct cred *cred, unsigned perm)
+int security_key_permission(key_ref_t key_ref, const struct cred *cred,
+			    enum key_need_perm need_perm)
 {
-	return call_int_hook(key_permission, 0, key_ref, cred, perm);
+	return call_int_hook(key_permission, 0, key_ref, cred, need_perm);
 }
 =

 int security_key_getsecurity(struct key *key, char **_buffer)
diff --git a/security/selinux/hooks.c b/security/selinux/hooks.c
index 0b4e32161b77..0de048705f0e 100644
--- a/security/selinux/hooks.c
+++ b/security/selinux/hooks.c
@@ -6541,20 +6541,43 @@ static void selinux_key_free(struct key *k)
 =

 static int selinux_key_permission(key_ref_t key_ref,
 				  const struct cred *cred,
-				  unsigned perm)
+				  enum key_need_perm need_perm)
 {
 	struct key *key;
 	struct key_security_struct *ksec;
-	u32 sid;
+	u32 perm, sid;
 =

-	/* if no specific permissions are requested, we skip the
-	   permission check. No serious, additional covert channels
-	   appear to be created. */
-	if (perm =3D=3D 0)
+	switch (need_perm) {
+	case KEY_NEED_VIEW:
+		perm =3D KEY__VIEW;
+		break;
+	case KEY_NEED_READ:
+		perm =3D KEY__READ;
+		break;
+	case KEY_NEED_WRITE:
+		perm =3D KEY__WRITE;
+		break;
+	case KEY_NEED_SEARCH:
+		perm =3D KEY__SEARCH;
+		break;
+	case KEY_NEED_LINK:
+		perm =3D KEY__LINK;
+		break;
+	case KEY_NEED_SETATTR:
+		perm =3D KEY__SETATTR;
+		break;
+	case KEY_NEED_UNLINK:
+	case KEY_SYSADMIN_OVERRIDE:
+	case KEY_AUTHTOKEN_OVERRIDE:
+	case KEY_DEFER_PERM_CHECK:
 		return 0;
+	default:
+		WARN_ON(1);
+		return -EPERM;
 =

-	sid =3D cred_sid(cred);
+	}
 =

+	sid =3D cred_sid(cred);
 	key =3D key_ref_to_ptr(key_ref);
 	ksec =3D key->security;
 =

diff --git a/security/smack/smack_lsm.c b/security/smack/smack_lsm.c
index 8c61d175e195..0d6bb53efe74 100644
--- a/security/smack/smack_lsm.c
+++ b/security/smack/smack_lsm.c
@@ -4230,13 +4230,14 @@ static void smack_key_free(struct key *key)
  * smack_key_permission - Smack access on a key
  * @key_ref: gets to the object
  * @cred: the credentials to use
- * @perm: requested key permissions
+ * @need_perm: requested key permission
  *
  * Return 0 if the task has read and write to the object,
  * an error code otherwise
  */
 static int smack_key_permission(key_ref_t key_ref,
-				const struct cred *cred, unsigned perm)
+				const struct cred *cred,
+				enum key_need_perm need_perm)
 {
 	struct key *keyp;
 	struct smk_audit_info ad;
@@ -4247,8 +4248,26 @@ static int smack_key_permission(key_ref_t key_ref,
 	/*
 	 * Validate requested permissions
 	 */
-	if (perm & ~KEY_NEED_ALL)
+	switch (need_perm) {
+	case KEY_NEED_READ:
+	case KEY_NEED_SEARCH:
+	case KEY_NEED_VIEW:
+		request |=3D MAY_READ;
+		break;
+	case KEY_NEED_WRITE:
+	case KEY_NEED_LINK:
+	case KEY_NEED_SETATTR:
+		request |=3D MAY_WRITE;
+		break;
+	case KEY_NEED_UNSPECIFIED:
+	case KEY_NEED_UNLINK:
+	case KEY_SYSADMIN_OVERRIDE:
+	case KEY_AUTHTOKEN_OVERRIDE:
+	case KEY_DEFER_PERM_CHECK:
+		return 0;
+	default:
 		return -EINVAL;
+	}
 =

 	keyp =3D key_ref_to_ptr(key_ref);
 	if (keyp =3D=3D NULL)
@@ -4273,10 +4292,6 @@ static int smack_key_permission(key_ref_t key_ref,
 	ad.a.u.key_struct.key =3D keyp->serial;
 	ad.a.u.key_struct.key_desc =3D keyp->description;
 #endif
-	if (perm & (KEY_NEED_READ | KEY_NEED_SEARCH | KEY_NEED_VIEW))
-		request |=3D MAY_READ;
-	if (perm & (KEY_NEED_WRITE | KEY_NEED_LINK | KEY_NEED_SETATTR))
-		request |=3D MAY_WRITE;
 	rc =3D smk_access(tkp, keyp->security, request, &ad);
 	rc =3D smk_bu_note("key access", tkp, keyp->security, request, rc);
 	return rc;

