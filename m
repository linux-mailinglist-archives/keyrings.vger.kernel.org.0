Return-Path: <keyrings+bounces-1863-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 70AEF947AA0
	for <lists+keyrings@lfdr.de>; Mon,  5 Aug 2024 13:54:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C7898B21E63
	for <lists+keyrings@lfdr.de>; Mon,  5 Aug 2024 11:54:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0D00156C67;
	Mon,  5 Aug 2024 11:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="F+kOkJoA"
X-Original-To: keyrings@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4F9F155CB2
	for <keyrings@vger.kernel.org>; Mon,  5 Aug 2024 11:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722858883; cv=none; b=XfGQzJff00S5PDQvqfwRU3MlVI44g08+qxs4WiQfIJZtKAs6Zu0N+yll+Rdo+Wr3Ov2IlLfpgYkHTZLVkox+zbsf7ungjsGg3uHPzU2p+JQl74IyzD9XeY0CC15I4lsfiZerrqm4x8S++6kmrftUp2felYRWmK3IhYsz4rAHzP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722858883; c=relaxed/simple;
	bh=Re7tlwQwkReWAxTPm//VWabZ0bUWqQj6ogEK+qQNCnA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NCgUnGxSJTQosBYrS/vZodg+E7ZxjHkHOJRiBRQMfs6xmPOSZI11etKDOGPLZPiXenZRSl1nKYEooTb3AFlbhGRIwU8XG+5pvhAy9xlEeQFv5GxBasAzVgbTwSNXyeNZTrOU2DfWRti4DojuJ/5eJVf1wJsMobKS6y6qIgLpS3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=F+kOkJoA; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-42807cb6afdso63055e9.1
        for <keyrings@vger.kernel.org>; Mon, 05 Aug 2024 04:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722858880; x=1723463680; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O4C4qGfYc/H4rRnmI2/dH087dXNS+hc43XiseqKD6D0=;
        b=F+kOkJoAyojXfe8CUNJpW/P5IqYbx8/4lckF24hZBTfdkQhhrYj1+jifKvgHfeMKNe
         q00R7PCVoAtfi2/yKGxlHGCKm0TKAQwdcl4acnLahFRIdVlP0Ynq82Rm8sMK4+SBMT8h
         RwnlHWUNZYnrPvLvbqVaI7zZpS7pGRfYYxQw0wdQXSr4SIBtqeRg5z5+WIhAe5jEkqs+
         DjhRZVDD7GESGRDEjwvhWCMLOU82xq7EiVaFP/WLGhLbFdecoAfg9QoS2TKnVe1mPWIL
         rXCMUWH1vxDPfj1PWl2w2Q7HIPm2rEqM5d9LWsZqsJNLsl5X004i3x/qXfodTGKhIOUU
         y+QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722858880; x=1723463680;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O4C4qGfYc/H4rRnmI2/dH087dXNS+hc43XiseqKD6D0=;
        b=S6RlcQZg1yg4yJvddESBMtQBlCo8XYem5+yXzro5sPbFn6yVDODY+n1cs5/KDvPg1S
         qCaA0auAZMBINh5rTLxI1AhUgVgEniDAaZaMpUUtezuLsCn3vnBX26n/orH0qG3Tf2Ua
         vV0rDdDujJc9JxEv1gPILBfNNMPKDHA5C9HGLC2fzUgfSmroBaq60NmlxJ2lRtNSf7lM
         iAnVqt+UaWzFd/i/pEMoHiBxBP52H6h7X7d1A/6W/EayUTguiBtVvF7czbkFXSGFsOft
         ul1XyFFVOof/97lGDWl31Skvmn56V0xb75PzBWo7BxG1gx7MKv7f1Tf9NKh4kdAeAjIK
         oNIg==
X-Forwarded-Encrypted: i=1; AJvYcCX6mp42fLnXAV1EpizfJj/3emkqkim2ckjh9wi/Q7d1obW5PkN8OQajIGiugS1B5qcmPaq6vlmdZzz9xPrM3Om+uKcZKx/ollc=
X-Gm-Message-State: AOJu0YyC6dmiUvM0A3d63yk6TmdwPZNRB/5XY8yLxgCMYIb+yj1Lk/bZ
	CR0yTq0oudn/cnDOFAeFAMBSVPUWFDeOkdGhya5LeT3UBikvn35z3pPTSsh0VQ==
X-Google-Smtp-Source: AGHT+IE1/OZGyVcZgXAgUHQazzFTNZJNCMvdxs7WfSOWX/jWwoi5cjyKhNoe5QUmALmlbH6g2NVRCA==
X-Received: by 2002:a05:600c:1d98:b0:426:66fd:5fac with SMTP id 5b1f17b1804b1-428ef4b075fmr2788055e9.2.1722858879274;
        Mon, 05 Aug 2024 04:54:39 -0700 (PDT)
Received: from localhost ([2a00:79e0:9d:4:ca74:8a49:a6f6:b872])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4282b89acacsm198653965e9.9.2024.08.05.04.54.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Aug 2024 04:54:38 -0700 (PDT)
From: Jann Horn <jannh@google.com>
Date: Mon, 05 Aug 2024 13:54:23 +0200
Subject: [PATCH v2 1/2] KEYS: use synchronous task work for changing parent
 credentials
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240805-remove-cred-transfer-v2-1-a2aa1d45e6b8@google.com>
References: <20240805-remove-cred-transfer-v2-0-a2aa1d45e6b8@google.com>
In-Reply-To: <20240805-remove-cred-transfer-v2-0-a2aa1d45e6b8@google.com>
To: Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, 
 "Serge E. Hallyn" <serge@hallyn.com>, 
 John Johansen <john.johansen@canonical.com>, 
 David Howells <dhowells@redhat.com>, Jarkko Sakkinen <jarkko@kernel.org>, 
 =?utf-8?q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>, 
 =?utf-8?q?G=C3=BCnther_Noack?= <gnoack@google.com>, 
 Stephen Smalley <stephen.smalley.work@gmail.com>, 
 Ondrej Mosnacek <omosnace@redhat.com>, 
 Casey Schaufler <casey@schaufler-ca.com>
Cc: linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org, 
 apparmor@lists.ubuntu.com, keyrings@vger.kernel.org, 
 selinux@vger.kernel.org, Jann Horn <jannh@google.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1722858874; l=10749;
 i=jannh@google.com; s=20240730; h=from:subject:message-id;
 bh=Re7tlwQwkReWAxTPm//VWabZ0bUWqQj6ogEK+qQNCnA=;
 b=dh3V3tyfNzFbCFftjs+fDtLLfOxy69vgTOAR6QAyWmTf4hIsZ7OUTcaxl2ebeCrK2jXHyeFPL
 V+z9D3vebI9AtEpTHfNrluIoKDOlXLzW6i0oRzYKNXzDHb3teuENXd+
X-Developer-Key: i=jannh@google.com; a=ed25519;
 pk=AljNtGOzXeF6khBXDJVVvwSEkVDGnnZZYqfWhP1V+C8=

keyctl_session_to_parent() involves posting task work to the parent task,
with work function key_change_session_keyring.
Because the task work in the parent runs asynchronously, no errors can be
returned back to the caller of keyctl_session_to_parent(), and therefore
the work function key_change_session_keyring() can't be allowed to fail due
to things like memory allocation failure or permission checks - all
allocations and checks have to happen in the child.

This is annoying for two reasons:

 - It is the only reason why cred_alloc_blank() and
   security_transfer_creds() are necessary.
 - It means we can't do synchronous permission checks.

Rewrite keyctl_session_to_parent() to run task work on the parent
synchronously, so that any errors that happen in the task work can be
plumbed back into the syscall return value in the child.
This allows us to get rid of cred_alloc_blank() and
security_transfer_creds() in a later commit, and it will make it possible
to write more reliable security checks for this operation.

Note that this requires using TWA_SIGNAL instead of TWA_RESUME, so the
parent might observe some spurious -EAGAIN syscall returns or such; but the
parent likely anyway has to be ready to deal with the side effects of
receiving signals (since it'll probably get SIGCHLD when the child dies),
so that probably isn't an issue.

Signed-off-by: Jann Horn <jannh@google.com>
---
 security/keys/internal.h     |   8 ++++
 security/keys/keyctl.c       | 107 +++++++++++++------------------------------
 security/keys/process_keys.c |  86 ++++++++++++++++++----------------
 3 files changed, 87 insertions(+), 114 deletions(-)

diff --git a/security/keys/internal.h b/security/keys/internal.h
index 2cffa6dc8255..2c5eadc04cf2 100644
--- a/security/keys/internal.h
+++ b/security/keys/internal.h
@@ -157,12 +157,20 @@ extern struct key *request_key_and_link(struct key_type *type,
 					unsigned long flags);
 
 extern bool lookup_user_key_possessed(const struct key *key,
 				      const struct key_match_data *match_data);
 
 extern long join_session_keyring(const char *name);
+
+struct keyctl_session_to_parent_context {
+	struct callback_head work;
+	struct completion done;
+	struct key *new_session_keyring;
+	const struct cred *child_cred;
+	int result;
+};
 extern void key_change_session_keyring(struct callback_head *twork);
 
 extern struct work_struct key_gc_work;
 extern unsigned key_gc_delay;
 extern void keyring_gc(struct key *keyring, time64_t limit);
 extern void keyring_restriction_gc(struct key *keyring,
diff --git a/security/keys/keyctl.c b/security/keys/keyctl.c
index ab927a142f51..e4cfe5c4594a 100644
--- a/security/keys/keyctl.c
+++ b/security/keys/keyctl.c
@@ -1616,104 +1616,63 @@ long keyctl_get_security(key_serial_t keyid,
  * parent process.
  *
  * The keyring must exist and must grant the caller LINK permission, and the
  * parent process must be single-threaded and must have the same effective
  * ownership as this process and mustn't be SUID/SGID.
  *
- * The keyring will be emplaced on the parent when it next resumes userspace.
+ * The keyring will be emplaced on the parent via a pseudo-signal.
  *
  * If successful, 0 will be returned.
  */
 long keyctl_session_to_parent(void)
 {
-	struct task_struct *me, *parent;
-	const struct cred *mycred, *pcred;
-	struct callback_head *newwork, *oldwork;
+	struct keyctl_session_to_parent_context ctx;
+	struct task_struct *parent;
 	key_ref_t keyring_r;
-	struct cred *cred;
 	int ret;
 
 	keyring_r = lookup_user_key(KEY_SPEC_SESSION_KEYRING, 0, KEY_NEED_LINK);
 	if (IS_ERR(keyring_r))
 		return PTR_ERR(keyring_r);
 
-	ret = -ENOMEM;
-
-	/* our parent is going to need a new cred struct, a new tgcred struct
-	 * and new security data, so we allocate them here to prevent ENOMEM in
-	 * our parent */
-	cred = cred_alloc_blank();
-	if (!cred)
-		goto error_keyring;
-	newwork = &cred->rcu;
+	write_lock_irq(&tasklist_lock);
+	parent = get_task_struct(rcu_dereference_protected(current->real_parent,
+					lockdep_is_held(&tasklist_lock)));
+	write_unlock_irq(&tasklist_lock);
 
-	cred->session_keyring = key_ref_to_ptr(keyring_r);
-	keyring_r = NULL;
-	init_task_work(newwork, key_change_session_keyring);
+	/* the parent mustn't be init and mustn't be a kernel thread */
+	if (is_global_init(parent) || (READ_ONCE(parent->flags) & PF_KTHREAD) != 0)
+		goto put_task;
 
-	me = current;
-	rcu_read_lock();
-	write_lock_irq(&tasklist_lock);
+	ctx.new_session_keyring = key_ref_to_ptr(keyring_r);
+	ctx.child_cred = current_cred();
+	init_completion(&ctx.done);
+	init_task_work(&ctx.work, key_change_session_keyring);
+	ret = task_work_add(parent, &ctx.work, TWA_SIGNAL);
+	if (ret)
+		goto put_task;
 
-	ret = -EPERM;
-	oldwork = NULL;
-	parent = rcu_dereference_protected(me->real_parent,
-					   lockdep_is_held(&tasklist_lock));
+	ret = wait_for_completion_interruptible(&ctx.done);
 
-	/* the parent mustn't be init and mustn't be a kernel thread */
-	if (parent->pid <= 1 || !parent->mm)
-		goto unlock;
-
-	/* the parent must be single threaded */
-	if (!thread_group_empty(parent))
-		goto unlock;
-
-	/* the parent and the child must have different session keyrings or
-	 * there's no point */
-	mycred = current_cred();
-	pcred = __task_cred(parent);
-	if (mycred == pcred ||
-	    mycred->session_keyring == pcred->session_keyring) {
-		ret = 0;
-		goto unlock;
+	if (task_work_cancel(parent, &ctx.work)) {
+		/*
+		 * We got interrupted and the task work was canceled before it
+		 * could execute.
+		 * Use -ERESTARTNOINTR instead of -ERESTARTSYS for
+		 * compatibility - the manpage does not list -EINTR as a
+		 * possible error for keyctl().
+		 */
+		ret = -ERESTARTNOINTR;
+	} else {
+		/* task work is running or has been executed */
+		wait_for_completion(&ctx.done);
+		ret = ctx.result;
 	}
 
-	/* the parent must have the same effective ownership and mustn't be
-	 * SUID/SGID */
-	if (!uid_eq(pcred->uid,	 mycred->euid) ||
-	    !uid_eq(pcred->euid, mycred->euid) ||
-	    !uid_eq(pcred->suid, mycred->euid) ||
-	    !gid_eq(pcred->gid,	 mycred->egid) ||
-	    !gid_eq(pcred->egid, mycred->egid) ||
-	    !gid_eq(pcred->sgid, mycred->egid))
-		goto unlock;
-
-	/* the keyrings must have the same UID */
-	if ((pcred->session_keyring &&
-	     !uid_eq(pcred->session_keyring->uid, mycred->euid)) ||
-	    !uid_eq(mycred->session_keyring->uid, mycred->euid))
-		goto unlock;
-
-	/* cancel an already pending keyring replacement */
-	oldwork = task_work_cancel_func(parent, key_change_session_keyring);
-
-	/* the replacement session keyring is applied just prior to userspace
-	 * restarting */
-	ret = task_work_add(parent, newwork, TWA_RESUME);
-	if (!ret)
-		newwork = NULL;
-unlock:
-	write_unlock_irq(&tasklist_lock);
-	rcu_read_unlock();
-	if (oldwork)
-		put_cred(container_of(oldwork, struct cred, rcu));
-	if (newwork)
-		put_cred(cred);
-	return ret;
-
-error_keyring:
+put_task:
+	put_task_struct(parent);
 	key_ref_put(keyring_r);
 	return ret;
 }
 
 /*
  * Apply a restriction to a given keyring.
diff --git a/security/keys/process_keys.c b/security/keys/process_keys.c
index b5d5333ab330..199c5dd34792 100644
--- a/security/keys/process_keys.c
+++ b/security/keys/process_keys.c
@@ -902,59 +902,65 @@ long join_session_keyring(const char *name)
 error:
 	abort_creds(new);
 	return ret;
 }
 
 /*
- * Replace a process's session keyring on behalf of one of its children when
- * the target  process is about to resume userspace execution.
+ * Replace a process's session keyring on behalf of one of its children.
+ * This function runs in task context, while the child is blocked in
+ * keyctl_session_to_parent().
  */
-void key_change_session_keyring(struct callback_head *twork)
+void key_change_session_keyring(struct callback_head *work)
 {
-	const struct cred *old = current_cred();
-	struct cred *new = container_of(twork, struct cred, rcu);
+	struct keyctl_session_to_parent_context *ctx =
+		container_of(work, struct keyctl_session_to_parent_context, work);
+	const struct cred *pcred = current_cred();
+	const struct cred *ccred = ctx->child_cred;
+	struct cred *new;
 
-	if (unlikely(current->flags & PF_EXITING)) {
-		put_cred(new);
-		return;
-	}
+	/* do checks */
+	ctx->result = -EPERM;
+	if (unlikely(current->flags & PF_EXITING))
+		goto out;
 
-	/* If get_ucounts fails more bits are needed in the refcount */
-	if (unlikely(!get_ucounts(old->ucounts))) {
-		WARN_ONCE(1, "In %s get_ucounts failed\n", __func__);
-		put_cred(new);
-		return;
-	}
+	/* we must be single threaded */
+	if (!thread_group_empty(current))
+		goto out;
+
+	/*
+	 * the parent must have the same effective ownership and mustn't be
+	 * SUID/SGID
+	 */
+	if (!uid_eq(pcred->uid,	 ccred->euid) ||
+	    !uid_eq(pcred->euid, ccred->euid) ||
+	    !uid_eq(pcred->suid, ccred->euid) ||
+	    !gid_eq(pcred->gid,	 ccred->egid) ||
+	    !gid_eq(pcred->egid, ccred->egid) ||
+	    !gid_eq(pcred->sgid, ccred->egid))
+		goto out;
+
+	/* the keyrings must have the same UID */
+	if ((pcred->session_keyring &&
+	     !uid_eq(pcred->session_keyring->uid, ccred->euid)) ||
+	    !uid_eq(ctx->new_session_keyring->uid, ccred->euid))
+		goto out;
+
+
+	/* okay, try to update creds */
+	ctx->result = -ENOMEM;
+	new = prepare_creds();
+	if (!new)
+		goto out;
 
-	new->  uid	= old->  uid;
-	new-> euid	= old-> euid;
-	new-> suid	= old-> suid;
-	new->fsuid	= old->fsuid;
-	new->  gid	= old->  gid;
-	new-> egid	= old-> egid;
-	new-> sgid	= old-> sgid;
-	new->fsgid	= old->fsgid;
-	new->user	= get_uid(old->user);
-	new->ucounts	= old->ucounts;
-	new->user_ns	= get_user_ns(old->user_ns);
-	new->group_info	= get_group_info(old->group_info);
-
-	new->securebits	= old->securebits;
-	new->cap_inheritable	= old->cap_inheritable;
-	new->cap_permitted	= old->cap_permitted;
-	new->cap_effective	= old->cap_effective;
-	new->cap_ambient	= old->cap_ambient;
-	new->cap_bset		= old->cap_bset;
-
-	new->jit_keyring	= old->jit_keyring;
-	new->thread_keyring	= key_get(old->thread_keyring);
-	new->process_keyring	= key_get(old->process_keyring);
-
-	security_transfer_creds(new, old);
+	key_put(new->session_keyring);
+	new->session_keyring = key_get(ctx->new_session_keyring);
 
 	commit_creds(new);
+	ctx->result = 0;
+out:
+	complete_all(&ctx->done);
 }
 
 /*
  * Make sure that root's user and user-session keyrings exist.
  */
 static int __init init_root_keyring(void)

-- 
2.46.0.rc2.264.g509ed76dc8-goog


