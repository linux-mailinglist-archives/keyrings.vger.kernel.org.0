Return-Path: <keyrings+bounces-1873-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DA3E9539B2
	for <lists+keyrings@lfdr.de>; Thu, 15 Aug 2024 20:12:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 49F07287E1E
	for <lists+keyrings@lfdr.de>; Thu, 15 Aug 2024 18:12:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC7E84778C;
	Thu, 15 Aug 2024 18:12:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X7r4+VAf"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B48A53BBC1;
	Thu, 15 Aug 2024 18:12:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723745547; cv=none; b=FBoe0O56UxbjY5ncb/9ISPEuYIYVaLuRy5beRHV48MnicnOdrWlAEkxpAZEOoQR4GCUCdgxkfkIAJfpBd7eGjLNYcG8+URstpYQujt2Y6PLFY4PfNAIngflGthjpf7daZyp82WJf9l4pVn+bbW5k0epaiTKBNMQ36KsoNB7HaGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723745547; c=relaxed/simple;
	bh=fMqj5NIFdJA5Vk5aEHchBIKt7Z0tV8H75qpAOsYUcV0=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=AAvWFpYoHdoLijXRySmf3fM2MMvjt/E1du951OmeVZb0aLoJhQ/kaivQo0mi5kH4/10Ys2sGxpSZvs/6DSjGb2UYBW0KuIqoyhdsX09oMnwCyyUvu9z/07Ts6ZBvECyOXFRlV4Q3lYYQIBGoom2IgP+yOb8Ng84mreaCOrInXy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X7r4+VAf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7AE5C4AF0D;
	Thu, 15 Aug 2024 18:12:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723745547;
	bh=fMqj5NIFdJA5Vk5aEHchBIKt7Z0tV8H75qpAOsYUcV0=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=X7r4+VAfOEl9dlglr36HV7AlPmQAqm6bMYTKqnPIvIL56vpalahuVRS1UqGZGGQUp
	 oI1d/RWCcswo+HFtg4rLarHx5Cim1RzgaRX1ZLnA+VMD8uadyRTuI43dh4ajZEFkCW
	 1fzsvdeGgPV+Oto5hmts4jRwaVepzlBGsLl1uZLRV8BzKHHxfY0hDOII45bIGUmrcx
	 Gm5gNLt0ijM0W9xE6TPHmQKP3lyhPHOiU2gq/zLqNlEXSF7W0gwutSsMCw66Xrlv6B
	 etflFniO4NFdtGB6rQd+dx2JH2m9uRPwsVpOoL9gUu1whM38gC7xmy40JwbupiCyIG
	 r940ohEohNJPQ==
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 15 Aug 2024 21:12:23 +0300
Message-Id: <D3GOSQRRFUKW.3QBKLT3TBJA8Q@kernel.org>
Cc: <linux-kernel@vger.kernel.org>, <linux-security-module@vger.kernel.org>,
 <apparmor@lists.ubuntu.com>, <keyrings@vger.kernel.org>,
 <selinux@vger.kernel.org>
Subject: Re: [PATCH v2 2/2] security: remove unused
 cred_alloc_blank/cred_transfer helpers
From: "Jarkko Sakkinen" <jarkko@kernel.org>
To: "Jann Horn" <jannh@google.com>, "Paul Moore" <paul@paul-moore.com>,
 "James Morris" <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>,
 "John Johansen" <john.johansen@canonical.com>, "David Howells"
 <dhowells@redhat.com>, =?utf-8?q?Micka=C3=ABl_Sala=C3=BCn?=
 <mic@digikod.net>, =?utf-8?q?G=C3=BCnther_Noack?= <gnoack@google.com>,
 "Stephen Smalley" <stephen.smalley.work@gmail.com>, "Ondrej Mosnacek"
 <omosnace@redhat.com>, "Casey Schaufler" <casey@schaufler-ca.com>
X-Mailer: aerc 0.17.0
References: <20240805-remove-cred-transfer-v2-0-a2aa1d45e6b8@google.com>
 <20240805-remove-cred-transfer-v2-2-a2aa1d45e6b8@google.com>
In-Reply-To: <20240805-remove-cred-transfer-v2-2-a2aa1d45e6b8@google.com>

On Mon Aug 5, 2024 at 2:54 PM EEST, Jann Horn wrote:
> Now that they're unused thanks to the preceding commit, remove
> cred_alloc_blank(), security_transfer_creds(), and the corresponding LSM
> hook implementations.
>
> Signed-off-by: Jann Horn <jannh@google.com>
> ---
>  include/linux/cred.h          |  1 -
>  include/linux/lsm_hook_defs.h |  3 ---
>  include/linux/security.h      | 12 ------------
>  kernel/cred.c                 | 23 -----------------------
>  security/apparmor/lsm.c       | 19 -------------------
>  security/landlock/cred.c      | 11 ++---------
>  security/security.c           | 35 -----------------------------------
>  security/selinux/hooks.c      | 12 ------------
>  security/smack/smack_lsm.c    | 32 --------------------------------
>  9 files changed, 2 insertions(+), 146 deletions(-)
>
> diff --git a/include/linux/cred.h b/include/linux/cred.h
> index 2976f534a7a3..54b5105d4cd5 100644
> --- a/include/linux/cred.h
> +++ b/include/linux/cred.h
> @@ -147,13 +147,12 @@ struct cred {
>  } __randomize_layout;
> =20
>  extern void __put_cred(struct cred *);
>  extern void exit_creds(struct task_struct *);
>  extern int copy_creds(struct task_struct *, unsigned long);
>  extern const struct cred *get_task_cred(struct task_struct *);
> -extern struct cred *cred_alloc_blank(void);
>  extern struct cred *prepare_creds(void);
>  extern struct cred *prepare_exec_creds(void);
>  extern int commit_creds(struct cred *);
>  extern void abort_creds(struct cred *);
>  extern const struct cred *override_creds(const struct cred *);
>  extern void revert_creds(const struct cred *);
> diff --git a/include/linux/lsm_hook_defs.h b/include/linux/lsm_hook_defs.=
h
> index 855db460e08b..1d75075cb607 100644
> --- a/include/linux/lsm_hook_defs.h
> +++ b/include/linux/lsm_hook_defs.h
> @@ -204,18 +204,15 @@ LSM_HOOK(int, 0, file_receive, struct file *file)
>  LSM_HOOK(int, 0, file_open, struct file *file)
>  LSM_HOOK(int, 0, file_post_open, struct file *file, int mask)
>  LSM_HOOK(int, 0, file_truncate, struct file *file)
>  LSM_HOOK(int, 0, task_alloc, struct task_struct *task,
>  	 unsigned long clone_flags)
>  LSM_HOOK(void, LSM_RET_VOID, task_free, struct task_struct *task)
> -LSM_HOOK(int, 0, cred_alloc_blank, struct cred *cred, gfp_t gfp)
>  LSM_HOOK(void, LSM_RET_VOID, cred_free, struct cred *cred)
>  LSM_HOOK(int, 0, cred_prepare, struct cred *new, const struct cred *old,
>  	 gfp_t gfp)
> -LSM_HOOK(void, LSM_RET_VOID, cred_transfer, struct cred *new,
> -	 const struct cred *old)
>  LSM_HOOK(void, LSM_RET_VOID, cred_getsecid, const struct cred *c, u32 *s=
ecid)
>  LSM_HOOK(int, 0, kernel_act_as, struct cred *new, u32 secid)
>  LSM_HOOK(int, 0, kernel_create_files_as, struct cred *new, struct inode =
*inode)
>  LSM_HOOK(int, 0, kernel_module_request, char *kmod_name)
>  LSM_HOOK(int, 0, kernel_load_data, enum kernel_load_data_id id, bool con=
tents)
>  LSM_HOOK(int, 0, kernel_post_load_data, char *buf, loff_t size,
> diff --git a/include/linux/security.h b/include/linux/security.h
> index 1390f1efb4f0..a366c2a03f55 100644
> --- a/include/linux/security.h
> +++ b/include/linux/security.h
> @@ -421,16 +421,14 @@ int security_file_send_sigiotask(struct task_struct=
 *tsk,
>  int security_file_receive(struct file *file);
>  int security_file_open(struct file *file);
>  int security_file_post_open(struct file *file, int mask);
>  int security_file_truncate(struct file *file);
>  int security_task_alloc(struct task_struct *task, unsigned long clone_fl=
ags);
>  void security_task_free(struct task_struct *task);
> -int security_cred_alloc_blank(struct cred *cred, gfp_t gfp);
>  void security_cred_free(struct cred *cred);
>  int security_prepare_creds(struct cred *new, const struct cred *old, gfp=
_t gfp);
> -void security_transfer_creds(struct cred *new, const struct cred *old);
>  void security_cred_getsecid(const struct cred *c, u32 *secid);
>  int security_kernel_act_as(struct cred *new, u32 secid);
>  int security_kernel_create_files_as(struct cred *new, struct inode *inod=
e);
>  int security_kernel_module_request(char *kmod_name);
>  int security_kernel_load_data(enum kernel_load_data_id id, bool contents=
);
>  int security_kernel_post_load_data(char *buf, loff_t size,
> @@ -1117,32 +1115,22 @@ static inline int security_task_alloc(struct task=
_struct *task,
>  	return 0;
>  }
> =20
>  static inline void security_task_free(struct task_struct *task)
>  { }
> =20
> -static inline int security_cred_alloc_blank(struct cred *cred, gfp_t gfp=
)
> -{
> -	return 0;
> -}
> -
>  static inline void security_cred_free(struct cred *cred)
>  { }
> =20
>  static inline int security_prepare_creds(struct cred *new,
>  					 const struct cred *old,
>  					 gfp_t gfp)
>  {
>  	return 0;
>  }
> =20
> -static inline void security_transfer_creds(struct cred *new,
> -					   const struct cred *old)
> -{
> -}
> -
>  static inline void security_cred_getsecid(const struct cred *c, u32 *sec=
id)
>  {
>  	*secid =3D 0;
>  }
> =20
>  static inline int security_kernel_act_as(struct cred *cred, u32 secid)
> diff --git a/kernel/cred.c b/kernel/cred.c
> index 075cfa7c896f..b2f6130cd6b7 100644
> --- a/kernel/cred.c
> +++ b/kernel/cred.c
> @@ -163,35 +163,12 @@ const struct cred *get_task_cred(struct task_struct=
 *task)
> =20
>  	rcu_read_unlock();
>  	return cred;
>  }
>  EXPORT_SYMBOL(get_task_cred);
> =20
> -/*
> - * Allocate blank credentials, such that the credentials can be filled i=
n at a
> - * later date without risk of ENOMEM.
> - */
> -struct cred *cred_alloc_blank(void)
> -{
> -	struct cred *new;
> -
> -	new =3D kmem_cache_zalloc(cred_jar, GFP_KERNEL);
> -	if (!new)
> -		return NULL;
> -
> -	atomic_long_set(&new->usage, 1);
> -	if (security_cred_alloc_blank(new, GFP_KERNEL_ACCOUNT) < 0)
> -		goto error;
> -
> -	return new;
> -
> -error:
> -	abort_creds(new);
> -	return NULL;
> -}
> -
>  /**
>   * prepare_creds - Prepare a new set of credentials for modification
>   *
>   * Prepare a new set of task credentials for modification.  A task's cre=
ds
>   * shouldn't generally be modified directly, therefore this function is =
used to
>   * prepare a new copy, which the caller then modifies and then commits b=
y
> diff --git a/security/apparmor/lsm.c b/security/apparmor/lsm.c
> index 808060f9effb..089d53978d9e 100644
> --- a/security/apparmor/lsm.c
> +++ b/security/apparmor/lsm.c
> @@ -74,39 +74,22 @@ static DEFINE_PER_CPU(struct aa_local_cache, aa_local=
_buffers);
>  static void apparmor_cred_free(struct cred *cred)
>  {
>  	aa_put_label(cred_label(cred));
>  	set_cred_label(cred, NULL);
>  }
> =20
> -/*
> - * allocate the apparmor part of blank credentials
> - */
> -static int apparmor_cred_alloc_blank(struct cred *cred, gfp_t gfp)
> -{
> -	set_cred_label(cred, NULL);
> -	return 0;
> -}
> -
>  /*
>   * prepare new cred label for modification by prepare_cred block
>   */
>  static int apparmor_cred_prepare(struct cred *new, const struct cred *ol=
d,
>  				 gfp_t gfp)
>  {
>  	set_cred_label(new, aa_get_newest_label(cred_label(old)));
>  	return 0;
>  }
> =20
> -/*
> - * transfer the apparmor data to a blank set of creds
> - */
> -static void apparmor_cred_transfer(struct cred *new, const struct cred *=
old)
> -{
> -	set_cred_label(new, aa_get_newest_label(cred_label(old)));
> -}
> -
>  static void apparmor_task_free(struct task_struct *task)
>  {
> =20
>  	aa_free_task_ctx(task_ctx(task));
>  }
> =20
> @@ -1504,16 +1487,14 @@ static struct security_hook_list apparmor_hooks[]=
 __ro_after_init =3D {
>  		      apparmor_socket_getpeersec_dgram),
>  	LSM_HOOK_INIT(sock_graft, apparmor_sock_graft),
>  #ifdef CONFIG_NETWORK_SECMARK
>  	LSM_HOOK_INIT(inet_conn_request, apparmor_inet_conn_request),
>  #endif
> =20
> -	LSM_HOOK_INIT(cred_alloc_blank, apparmor_cred_alloc_blank),
>  	LSM_HOOK_INIT(cred_free, apparmor_cred_free),
>  	LSM_HOOK_INIT(cred_prepare, apparmor_cred_prepare),
> -	LSM_HOOK_INIT(cred_transfer, apparmor_cred_transfer),
> =20
>  	LSM_HOOK_INIT(bprm_creds_for_exec, apparmor_bprm_creds_for_exec),
>  	LSM_HOOK_INIT(bprm_committing_creds, apparmor_bprm_committing_creds),
>  	LSM_HOOK_INIT(bprm_committed_creds, apparmor_bprm_committed_creds),
> =20
>  	LSM_HOOK_INIT(task_free, apparmor_task_free),
> diff --git a/security/landlock/cred.c b/security/landlock/cred.c
> index db9fe7d906ba..786af18c4a1c 100644
> --- a/security/landlock/cred.c
> +++ b/security/landlock/cred.c
> @@ -11,41 +11,34 @@
> =20
>  #include "common.h"
>  #include "cred.h"
>  #include "ruleset.h"
>  #include "setup.h"
> =20
> -static void hook_cred_transfer(struct cred *const new,
> -			       const struct cred *const old)
> +static int hook_cred_prepare(struct cred *const new,
> +			     const struct cred *const old, const gfp_t gfp)
>  {
>  	struct landlock_ruleset *const old_dom =3D landlock_cred(old)->domain;
> =20
>  	if (old_dom) {
>  		landlock_get_ruleset(old_dom);
>  		landlock_cred(new)->domain =3D old_dom;
>  	}
> -}
> -
> -static int hook_cred_prepare(struct cred *const new,
> -			     const struct cred *const old, const gfp_t gfp)
> -{
> -	hook_cred_transfer(new, old);
>  	return 0;
>  }
> =20
>  static void hook_cred_free(struct cred *const cred)
>  {
>  	struct landlock_ruleset *const dom =3D landlock_cred(cred)->domain;
> =20
>  	if (dom)
>  		landlock_put_ruleset_deferred(dom);
>  }
> =20
>  static struct security_hook_list landlock_hooks[] __ro_after_init =3D {
>  	LSM_HOOK_INIT(cred_prepare, hook_cred_prepare),
> -	LSM_HOOK_INIT(cred_transfer, hook_cred_transfer),
>  	LSM_HOOK_INIT(cred_free, hook_cred_free),
>  };
> =20
>  __init void landlock_add_cred_hooks(void)
>  {
>  	security_add_hooks(landlock_hooks, ARRAY_SIZE(landlock_hooks),
> diff --git a/security/security.c b/security/security.c
> index 8cee5b6c6e6d..4fb81de5cf80 100644
> --- a/security/security.c
> +++ b/security/security.c
> @@ -3057,35 +3057,12 @@ void security_task_free(struct task_struct *task)
>  	call_void_hook(task_free, task);
> =20
>  	kfree(task->security);
>  	task->security =3D NULL;
>  }
> =20
> -/**
> - * security_cred_alloc_blank() - Allocate the min memory to allow cred_t=
ransfer
> - * @cred: credentials
> - * @gfp: gfp flags
> - *
> - * Only allocate sufficient memory and attach to @cred such that
> - * cred_transfer() will not get ENOMEM.
> - *
> - * Return: Returns 0 on success, negative values on failure.
> - */
> -int security_cred_alloc_blank(struct cred *cred, gfp_t gfp)
> -{
> -	int rc =3D lsm_cred_alloc(cred, gfp);
> -
> -	if (rc)
> -		return rc;
> -
> -	rc =3D call_int_hook(cred_alloc_blank, cred, gfp);
> -	if (unlikely(rc))
> -		security_cred_free(cred);
> -	return rc;
> -}
> -
>  /**
>   * security_cred_free() - Free the cred's LSM blob and associated resour=
ces
>   * @cred: credentials
>   *
>   * Deallocate and clear the cred->security field in a set of credentials=
.
>   */
> @@ -3124,24 +3101,12 @@ int security_prepare_creds(struct cred *new, cons=
t struct cred *old, gfp_t gfp)
>  	rc =3D call_int_hook(cred_prepare, new, old, gfp);
>  	if (unlikely(rc))
>  		security_cred_free(new);
>  	return rc;
>  }
> =20
> -/**
> - * security_transfer_creds() - Transfer creds
> - * @new: target credentials
> - * @old: original credentials
> - *
> - * Transfer data from original creds to new creds.
> - */
> -void security_transfer_creds(struct cred *new, const struct cred *old)
> -{
> -	call_void_hook(cred_transfer, new, old);
> -}
> -
>  /**
>   * security_cred_getsecid() - Get the secid from a set of credentials
>   * @c: credentials
>   * @secid: secid value
>   *
>   * Retrieve the security identifier of the cred structure @c.  In case o=
f
> diff --git a/security/selinux/hooks.c b/security/selinux/hooks.c
> index 55c78c318ccd..8a659475cc12 100644
> --- a/security/selinux/hooks.c
> +++ b/security/selinux/hooks.c
> @@ -4007,23 +4007,12 @@ static int selinux_cred_prepare(struct cred *new,=
 const struct cred *old,
>  	struct task_security_struct *tsec =3D selinux_cred(new);
> =20
>  	*tsec =3D *old_tsec;
>  	return 0;
>  }
> =20
> -/*
> - * transfer the SELinux data to a blank set of creds
> - */
> -static void selinux_cred_transfer(struct cred *new, const struct cred *o=
ld)
> -{
> -	const struct task_security_struct *old_tsec =3D selinux_cred(old);
> -	struct task_security_struct *tsec =3D selinux_cred(new);
> -
> -	*tsec =3D *old_tsec;
> -}
> -
>  static void selinux_cred_getsecid(const struct cred *c, u32 *secid)
>  {
>  	*secid =3D cred_sid(c);
>  }
> =20
>  /*
> @@ -7213,13 +7202,12 @@ static struct security_hook_list selinux_hooks[] =
__ro_after_init =3D {
>  	LSM_HOOK_INIT(file_receive, selinux_file_receive),
> =20
>  	LSM_HOOK_INIT(file_open, selinux_file_open),
> =20
>  	LSM_HOOK_INIT(task_alloc, selinux_task_alloc),
>  	LSM_HOOK_INIT(cred_prepare, selinux_cred_prepare),
> -	LSM_HOOK_INIT(cred_transfer, selinux_cred_transfer),
>  	LSM_HOOK_INIT(cred_getsecid, selinux_cred_getsecid),
>  	LSM_HOOK_INIT(kernel_act_as, selinux_kernel_act_as),
>  	LSM_HOOK_INIT(kernel_create_files_as, selinux_kernel_create_files_as),
>  	LSM_HOOK_INIT(kernel_module_request, selinux_kernel_module_request),
>  	LSM_HOOK_INIT(kernel_load_data, selinux_kernel_load_data),
>  	LSM_HOOK_INIT(kernel_read_file, selinux_kernel_read_file),
> diff --git a/security/smack/smack_lsm.c b/security/smack/smack_lsm.c
> index 4164699cd4f6..4cc658deb08b 100644
> --- a/security/smack/smack_lsm.c
> +++ b/security/smack/smack_lsm.c
> @@ -2050,27 +2050,12 @@ static int smack_file_open(struct file *file)
>  }
> =20
>  /*
>   * Task hooks
>   */
> =20
> -/**
> - * smack_cred_alloc_blank - "allocate" blank task-level security credent=
ials
> - * @cred: the new credentials
> - * @gfp: the atomicity of any memory allocations
> - *
> - * Prepare a blank set of credentials for modification.  This must alloc=
ate all
> - * the memory the LSM module might require such that cred_transfer() can
> - * complete without error.
> - */
> -static int smack_cred_alloc_blank(struct cred *cred, gfp_t gfp)
> -{
> -	init_task_smack(smack_cred(cred), NULL, NULL);
> -	return 0;
> -}
> -
> =20
>  /**
>   * smack_cred_free - "free" task-level security credentials
>   * @cred: the credentials in question
>   *
>   */
> @@ -2113,27 +2098,12 @@ static int smack_cred_prepare(struct cred *new, c=
onst struct cred *old,
> =20
>  	rc =3D smk_copy_relabel(&new_tsp->smk_relabel, &old_tsp->smk_relabel,
>  				gfp);
>  	return rc;
>  }
> =20
> -/**
> - * smack_cred_transfer - Transfer the old credentials to the new credent=
ials
> - * @new: the new credentials
> - * @old: the original credentials
> - *
> - * Fill in a set of blank credentials from another set of credentials.
> - */
> -static void smack_cred_transfer(struct cred *new, const struct cred *old=
)
> -{
> -	struct task_smack *old_tsp =3D smack_cred(old);
> -	struct task_smack *new_tsp =3D smack_cred(new);
> -
> -	init_task_smack(new_tsp, old_tsp->smk_task, old_tsp->smk_task);
> -}
> -
>  /**
>   * smack_cred_getsecid - get the secid corresponding to a creds structur=
e
>   * @cred: the object creds
>   * @secid: where to put the result
>   *
>   * Sets the secid to contain a u32 version of the smack label.
> @@ -5107,16 +5077,14 @@ static struct security_hook_list smack_hooks[] __=
ro_after_init =3D {
>  	LSM_HOOK_INIT(file_set_fowner, smack_file_set_fowner),
>  	LSM_HOOK_INIT(file_send_sigiotask, smack_file_send_sigiotask),
>  	LSM_HOOK_INIT(file_receive, smack_file_receive),
> =20
>  	LSM_HOOK_INIT(file_open, smack_file_open),
> =20
> -	LSM_HOOK_INIT(cred_alloc_blank, smack_cred_alloc_blank),
>  	LSM_HOOK_INIT(cred_free, smack_cred_free),
>  	LSM_HOOK_INIT(cred_prepare, smack_cred_prepare),
> -	LSM_HOOK_INIT(cred_transfer, smack_cred_transfer),
>  	LSM_HOOK_INIT(cred_getsecid, smack_cred_getsecid),
>  	LSM_HOOK_INIT(kernel_act_as, smack_kernel_act_as),
>  	LSM_HOOK_INIT(kernel_create_files_as, smack_kernel_create_files_as),
>  	LSM_HOOK_INIT(task_setpgid, smack_task_setpgid),
>  	LSM_HOOK_INIT(task_getpgid, smack_task_getpgid),
>  	LSM_HOOK_INIT(task_getsid, smack_task_getsid),

I'll give this reviewd-by as soon as getting some feedback David
on 1/2. I mean this is dead obvious with a condition.

BR, Jarkko

