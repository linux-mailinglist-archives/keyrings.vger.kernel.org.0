Return-Path: <keyrings+bounces-1855-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 171749462DB
	for <lists+keyrings@lfdr.de>; Fri,  2 Aug 2024 20:09:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C0619282A0F
	for <lists+keyrings@lfdr.de>; Fri,  2 Aug 2024 18:09:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10E0315C145;
	Fri,  2 Aug 2024 18:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="ACbF5nWM"
X-Original-To: keyrings@vger.kernel.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36E451AE044;
	Fri,  2 Aug 2024 18:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.185.170.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722622151; cv=pass; b=Y3WHk/da6WAYwINkEoXM939xncGDISi7BvpkBW+/Tx252waEN4XkfUrpyg+osgi+CmPK3mcPrvzOuQApL4lLi+uBEy+4bNJe0r48jj8tNXxV27kihhfqJmpx0hCUCTaBVh/hZLUCsCL2skYgzzJvrcKLP3t/vprJ3ui38APdq9E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722622151; c=relaxed/simple;
	bh=mckU9+gz6DSlAgrX6gSpe0VOPad8wJakHaJ0LieK3s8=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=e+mMO3NQ+zhXSyr6bros9CXZpi8p21V/fZpC3W2mN1G//77Lbzc3PFfY1aWEqyM7nt/shp5eMv0FwSHefPAqdMDFwvKsZwZ1Cn72dAAroJeBg6miJ7StJ/ZZVKa12prG3fBsriQ5I0ti8CeBLiWHzZ9Q9TUWFWcpAfkfxGqqZU4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b=ACbF5nWM; arc=pass smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from localhost (91-154-92-171.elisa-laajakaista.fi [91.154.92.171])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sakkinen)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4WbDNx2rq7z49Pv3;
	Fri,  2 Aug 2024 21:09:05 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1722622146;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OMVVxNvfLe+9R+FxruMRvYStxvR1ayrAqCDhT6YJwrY=;
	b=ACbF5nWMVR2arAVNZtPIFhursbwA/gNjbjS0kfU97l5yYJryeDWabGh5Qeu9xmgmfgjvyH
	dV/XIQtfr9C3TTMUs6NFNANesAVLk0+24CMh2cNCeH7M76/Y2RVxMdlgnC9CIYmJJJL58w
	d8gzqosCLTKPT4N8oyRsXRkY3MYKGNQGEmS02uCitCMUKvPNIvpPqs27fiRHy/s0lu7gId
	whFpaFGOvFRmw1iv/tc7IsPbiFYWAaPedUlSVve1qRUv+Ecq4pV3/ZsvSP1SluoG4jrN0s
	DUSRySbzZwfjSeKuHGhEdH9FUSvF0XABstgngZod0rNyCBFtAgZgweWxXv43Gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1722622146;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OMVVxNvfLe+9R+FxruMRvYStxvR1ayrAqCDhT6YJwrY=;
	b=g8bHlnaZGckhdr3GKXS22WG5rVQIhwGS/DUvyfaKI0/MeMQiPd9VE9jZzp6s3cbuXIVCJQ
	NfdMOk6JEdOP28yNjYJ4Bz0/9FgA81gXLIGUIRNfp8Bye1pjILjdnOowwhtpARQ64Eyw3m
	vfBAhIxlAThNOo07LBhjftFClc3ASquNQWXdLKrejdkNk25mwyePEwk/97XEgWKDujNADA
	lnED3BeS003EQKrNE2klMZhaoJK5CkKPOHCCWLB1aurk1MWuI/Uj5fK9e4oSJ99MEPYpxh
	6zONbRrXzmG/RLGsl7X+iyPbLjBYeLg8r9yAOU7IOehIRhWtJ1m1t8fXuTd1vg==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sakkinen smtp.mailfrom=jarkko.sakkinen@iki.fi
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1722622146; a=rsa-sha256;
	cv=none;
	b=CLT/sn3ZU7/pEq3YDi7c4s9dTkwFrtZLkaRBPrdpKXTsqY8VzB85CxkS61tzuIB4uI9nqI
	Zf1MpA6sQMYDCR19EDLm5dMdTXK8oXD5RKdbRuhPo/ATswJlWKyydkyXtR7hy6azj1l5AE
	Bzsx93KTZWfYLQk8cVGkB1D8ERfYB2SZVuIpoSVL6cGpUihsXYDULOJ6ElV4sJtBahDf/0
	1eZtBTbclnTawvbS9wVUL++/rW7T2hB3vE7pigg3Ag+IP1XzP3aAyHbZiZGD5H/9hoDcQd
	X7tOE/M5Dt4vrZrqNLMqF3+yq/vVFLMvSEZEYmgUOndcghOmiaH/XdGgO1ORgg==
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 02 Aug 2024 21:09:04 +0300
Message-Id: <D35ML45KMWK8.1E29IC0VZO4CL@iki.fi>
Cc: <linux-kernel@vger.kernel.org>, <linux-security-module@vger.kernel.org>,
 <apparmor@lists.ubuntu.com>, <keyrings@vger.kernel.org>,
 <selinux@vger.kernel.org>
Subject: Re: [PATCH RFC] security/KEYS: get rid of cred_alloc_blank and
 cred_transfer
From: "Jarkko Sakkinen" <jarkko.sakkinen@iki.fi>
To: "Jann Horn" <jannh@google.com>, "Paul Moore" <paul@paul-moore.com>,
 "James Morris" <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>,
 "John Johansen" <john.johansen@canonical.com>, "David Howells"
 <dhowells@redhat.com>, "Jarkko Sakkinen" <jarkko@kernel.org>,
 =?utf-8?q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>,
 =?utf-8?q?G=C3=BCnther_Noack?= <gnoack@google.com>, "Stephen Smalley"
 <stephen.smalley.work@gmail.com>, "Ondrej Mosnacek" <omosnace@redhat.com>,
 "Casey Schaufler" <casey@schaufler-ca.com>
X-Mailer: aerc 0.17.0
References: <20240802-remove-cred-transfer-v1-1-b3fef1ef2ade@google.com>
In-Reply-To: <20240802-remove-cred-transfer-v1-1-b3fef1ef2ade@google.com>

On Fri Aug 2, 2024 at 4:10 PM EEST, Jann Horn wrote:
> cred_alloc_blank and cred_transfer were only necessary so that keyctl can
> allocate creds in the child and then asynchronously have the parent fill
> them in and apply them.
>
> Get rid of them by letting the child synchronously wait for the task work
> executing in the parent's context. This way, any errors that happen in th=
e
> task work can be plumbed back into the syscall return value in the child.
>
> Note that this requires using TWA_SIGNAL instead of TWA_RESUME, so the
> parent might observe some spurious -EGAIN syscall returns or such; but th=
e
> parent likely anyway has to be ready to deal with the side effects of
> receiving signals (since it'll probably get SIGCHLD when the child dies),
> so that probably isn't an issue.
>
> Signed-off-by: Jann Horn <jannh@google.com>
> ---
> This is a quickly hacked up demo of the approach I proposed at
> <https://lore.kernel.org/all/CAG48ez2bnvuX8i-D=3D5DxmfzEOKTWAf-DkgQq6aNC4=
WzSGoEGHg@mail.gmail.com/>
> to get rid of the cred_transfer stuff. Diffstat looks like this:
>
>  include/linux/cred.h          |   1 -
>  include/linux/lsm_hook_defs.h |   3 ---
>  include/linux/security.h      |  12 ------------
>  kernel/cred.c                 |  23 -----------------------
>  security/apparmor/lsm.c       |  19 -------------------
>  security/keys/internal.h      |   8 ++++++++
>  security/keys/keyctl.c        | 100 ++++++++++++++++++++++++++----------=
----------------------------------------------------------------
>  security/keys/process_keys.c  |  86 ++++++++++++++++++++++++++++++++++++=
++++++++++----------------------------------------
>  security/landlock/cred.c      |  11 ++---------
>  security/security.c           |  35 -----------------------------------
>  security/selinux/hooks.c      |  12 ------------
>  security/smack/smack_lsm.c    |  32 --------------------------------
>  12 files changed, 82 insertions(+), 260 deletions(-)
>
> What do you think? Synchronously waiting for task work is a bit ugly,
> but at least this condenses the uglyness in the keys subsystem instead
> of making the rest of the security subsystem deal with this stuff.

Why does synchronously waiting is ugly? Not sarcasm, I genuineily
interested of breaking that down in smaller pieces.

E.g. what disadvantages would be there from your point of view?

Only trying to form a common picture, that's all.

>
> Another approach to simplify things further would be to try to move
> the session keyring out of the creds entirely and just let the child
> update it directly with appropriate locking, but I don't know enough
> about the keys subsystem to know if that would maybe break stuff
> that relies on override_creds() also overriding the keyrings, or
> something like that.
> ---
>  include/linux/cred.h          |   1 -
>  include/linux/lsm_hook_defs.h |   3 --
>  include/linux/security.h      |  12 -----
>  kernel/cred.c                 |  23 ----------
>  security/apparmor/lsm.c       |  19 --------
>  security/keys/internal.h      |   8 ++++
>  security/keys/keyctl.c        | 100 +++++++++++-------------------------=
------
>  security/keys/process_keys.c  |  86 +++++++++++++++++++-----------------
>  security/landlock/cred.c      |  11 +----
>  security/security.c           |  35 ---------------
>  security/selinux/hooks.c      |  12 -----
>  security/smack/smack_lsm.c    |  32 --------------
>  12 files changed, 82 insertions(+), 260 deletions(-)

Given the large patch size:

1. If it is impossible to split some meaningful patches, i.e. patches
   that transform kernel tree from working state to another, I can
   cope with this.
2. Even for small chunks that can be split into their own logical
   pieces: please do that. Helps to review the main gist later on.

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
> diff --git a/security/keys/internal.h b/security/keys/internal.h
> index 2cffa6dc8255..2c5eadc04cf2 100644
> --- a/security/keys/internal.h
> +++ b/security/keys/internal.h
> @@ -157,12 +157,20 @@ extern struct key *request_key_and_link(struct key_=
type *type,
>  					unsigned long flags);
> =20
>  extern bool lookup_user_key_possessed(const struct key *key,
>  				      const struct key_match_data *match_data);
> =20
>  extern long join_session_keyring(const char *name);
> +
> +struct keyctl_session_to_parent_context {
> +	struct callback_head work;
> +	struct completion done;
> +	struct key *new_session_keyring;
> +	const struct cred *child_cred;
> +	int result;
> +};
>  extern void key_change_session_keyring(struct callback_head *twork);
> =20
>  extern struct work_struct key_gc_work;
>  extern unsigned key_gc_delay;
>  extern void keyring_gc(struct key *keyring, time64_t limit);
>  extern void keyring_restriction_gc(struct key *keyring,
> diff --git a/security/keys/keyctl.c b/security/keys/keyctl.c
> index ab927a142f51..116ef2dfa5a1 100644
> --- a/security/keys/keyctl.c
> +++ b/security/keys/keyctl.c
> @@ -1616,104 +1616,56 @@ long keyctl_get_security(key_serial_t keyid,
>   * parent process.
>   *
>   * The keyring must exist and must grant the caller LINK permission, and=
 the
>   * parent process must be single-threaded and must have the same effecti=
ve
>   * ownership as this process and mustn't be SUID/SGID.
>   *
> - * The keyring will be emplaced on the parent when it next resumes users=
pace.
> + * The keyring will be emplaced on the parent via a pseudo-signal.
>   *
>   * If successful, 0 will be returned.
>   */
>  long keyctl_session_to_parent(void)
>  {
> -	struct task_struct *me, *parent;
> -	const struct cred *mycred, *pcred;
> -	struct callback_head *newwork, *oldwork;
> +	struct keyctl_session_to_parent_context ctx;
> +	struct task_struct *parent;
>  	key_ref_t keyring_r;
> -	struct cred *cred;
>  	int ret;
> =20
>  	keyring_r =3D lookup_user_key(KEY_SPEC_SESSION_KEYRING, 0, KEY_NEED_LIN=
K);
>  	if (IS_ERR(keyring_r))
>  		return PTR_ERR(keyring_r);
> =20
> -	ret =3D -ENOMEM;
> -
> -	/* our parent is going to need a new cred struct, a new tgcred struct
> -	 * and new security data, so we allocate them here to prevent ENOMEM in
> -	 * our parent */
> -	cred =3D cred_alloc_blank();
> -	if (!cred)
> -		goto error_keyring;
> -	newwork =3D &cred->rcu;
> +	write_lock_irq(&tasklist_lock);
> +	parent =3D get_task_struct(rcu_dereference_protected(current->real_pare=
nt,
> +					lockdep_is_held(&tasklist_lock)));
> +	write_unlock_irq(&tasklist_lock);
> =20
> -	cred->session_keyring =3D key_ref_to_ptr(keyring_r);
> -	keyring_r =3D NULL;
> -	init_task_work(newwork, key_change_session_keyring);
> +	/* the parent mustn't be init and mustn't be a kernel thread */
> +	if (is_global_init(parent) || (READ_ONCE(parent->flags) & PF_KTHREAD) !=
=3D 0)
> +		goto put_task;
> =20
> -	me =3D current;
> -	rcu_read_lock();
> -	write_lock_irq(&tasklist_lock);
> +	ctx.new_session_keyring =3D key_ref_to_ptr(keyring_r);
> +	ctx.child_cred =3D current_cred();
> +	init_completion(&ctx.done);
> +	init_task_work(&ctx.work, key_change_session_keyring);
> +	ret =3D task_work_add(parent, &ctx.work, TWA_SIGNAL);
> +	if (ret)
> +		goto put_task;
> =20
> -	ret =3D -EPERM;
> -	oldwork =3D NULL;
> -	parent =3D rcu_dereference_protected(me->real_parent,
> -					   lockdep_is_held(&tasklist_lock));
> +	ret =3D wait_for_completion_killable(&ctx.done);
> =20
> -	/* the parent mustn't be init and mustn't be a kernel thread */
> -	if (parent->pid <=3D 1 || !parent->mm)
> -		goto unlock;
> -
> -	/* the parent must be single threaded */
> -	if (!thread_group_empty(parent))
> -		goto unlock;
> -
> -	/* the parent and the child must have different session keyrings or
> -	 * there's no point */
> -	mycred =3D current_cred();
> -	pcred =3D __task_cred(parent);
> -	if (mycred =3D=3D pcred ||
> -	    mycred->session_keyring =3D=3D pcred->session_keyring) {
> -		ret =3D 0;
> -		goto unlock;
> +	if (task_work_cancel(parent, &ctx.work)) {
> +		/* we got killed, task work has been cancelled */
> +	} else {
> +		/* task work is running or has been executed */
> +		wait_for_completion(&ctx.done);
> +		ret =3D ctx.result;
>  	}
> =20
> -	/* the parent must have the same effective ownership and mustn't be
> -	 * SUID/SGID */
> -	if (!uid_eq(pcred->uid,	 mycred->euid) ||
> -	    !uid_eq(pcred->euid, mycred->euid) ||
> -	    !uid_eq(pcred->suid, mycred->euid) ||
> -	    !gid_eq(pcred->gid,	 mycred->egid) ||
> -	    !gid_eq(pcred->egid, mycred->egid) ||
> -	    !gid_eq(pcred->sgid, mycred->egid))
> -		goto unlock;
> -
> -	/* the keyrings must have the same UID */
> -	if ((pcred->session_keyring &&
> -	     !uid_eq(pcred->session_keyring->uid, mycred->euid)) ||
> -	    !uid_eq(mycred->session_keyring->uid, mycred->euid))
> -		goto unlock;
> -
> -	/* cancel an already pending keyring replacement */
> -	oldwork =3D task_work_cancel_func(parent, key_change_session_keyring);
> -
> -	/* the replacement session keyring is applied just prior to userspace
> -	 * restarting */
> -	ret =3D task_work_add(parent, newwork, TWA_RESUME);
> -	if (!ret)
> -		newwork =3D NULL;
> -unlock:
> -	write_unlock_irq(&tasklist_lock);
> -	rcu_read_unlock();
> -	if (oldwork)
> -		put_cred(container_of(oldwork, struct cred, rcu));
> -	if (newwork)
> -		put_cred(cred);
> -	return ret;
> -
> -error_keyring:
> +put_task:
> +	put_task_struct(parent);
>  	key_ref_put(keyring_r);
>  	return ret;
>  }
> =20
>  /*
>   * Apply a restriction to a given keyring.
> diff --git a/security/keys/process_keys.c b/security/keys/process_keys.c
> index b5d5333ab330..199c5dd34792 100644
> --- a/security/keys/process_keys.c
> +++ b/security/keys/process_keys.c
> @@ -902,59 +902,65 @@ long join_session_keyring(const char *name)
>  error:
>  	abort_creds(new);
>  	return ret;
>  }
> =20
>  /*
> - * Replace a process's session keyring on behalf of one of its children =
when
> - * the target  process is about to resume userspace execution.
> + * Replace a process's session keyring on behalf of one of its children.
> + * This function runs in task context, while the child is blocked in
> + * keyctl_session_to_parent().
>   */
> -void key_change_session_keyring(struct callback_head *twork)
> +void key_change_session_keyring(struct callback_head *work)
>  {
> -	const struct cred *old =3D current_cred();
> -	struct cred *new =3D container_of(twork, struct cred, rcu);
> +	struct keyctl_session_to_parent_context *ctx =3D
> +		container_of(work, struct keyctl_session_to_parent_context, work);
> +	const struct cred *pcred =3D current_cred();
> +	const struct cred *ccred =3D ctx->child_cred;
> +	struct cred *new;
> =20
> -	if (unlikely(current->flags & PF_EXITING)) {
> -		put_cred(new);
> -		return;
> -	}
> +	/* do checks */
> +	ctx->result =3D -EPERM;
> +	if (unlikely(current->flags & PF_EXITING))
> +		goto out;
> =20
> -	/* If get_ucounts fails more bits are needed in the refcount */
> -	if (unlikely(!get_ucounts(old->ucounts))) {
> -		WARN_ONCE(1, "In %s get_ucounts failed\n", __func__);
> -		put_cred(new);
> -		return;
> -	}
> +	/* we must be single threaded */
> +	if (!thread_group_empty(current))
> +		goto out;
> +
> +	/*
> +	 * the parent must have the same effective ownership and mustn't be
> +	 * SUID/SGID
> +	 */
> +	if (!uid_eq(pcred->uid,	 ccred->euid) ||
> +	    !uid_eq(pcred->euid, ccred->euid) ||
> +	    !uid_eq(pcred->suid, ccred->euid) ||
> +	    !gid_eq(pcred->gid,	 ccred->egid) ||
> +	    !gid_eq(pcred->egid, ccred->egid) ||
> +	    !gid_eq(pcred->sgid, ccred->egid))
> +		goto out;
> +
> +	/* the keyrings must have the same UID */
> +	if ((pcred->session_keyring &&
> +	     !uid_eq(pcred->session_keyring->uid, ccred->euid)) ||
> +	    !uid_eq(ctx->new_session_keyring->uid, ccred->euid))
> +		goto out;
> +
> +
> +	/* okay, try to update creds */
> +	ctx->result =3D -ENOMEM;
> +	new =3D prepare_creds();
> +	if (!new)
> +		goto out;
> =20
> -	new->  uid	=3D old->  uid;
> -	new-> euid	=3D old-> euid;
> -	new-> suid	=3D old-> suid;
> -	new->fsuid	=3D old->fsuid;
> -	new->  gid	=3D old->  gid;
> -	new-> egid	=3D old-> egid;
> -	new-> sgid	=3D old-> sgid;
> -	new->fsgid	=3D old->fsgid;
> -	new->user	=3D get_uid(old->user);
> -	new->ucounts	=3D old->ucounts;
> -	new->user_ns	=3D get_user_ns(old->user_ns);
> -	new->group_info	=3D get_group_info(old->group_info);
> -
> -	new->securebits	=3D old->securebits;
> -	new->cap_inheritable	=3D old->cap_inheritable;
> -	new->cap_permitted	=3D old->cap_permitted;
> -	new->cap_effective	=3D old->cap_effective;
> -	new->cap_ambient	=3D old->cap_ambient;
> -	new->cap_bset		=3D old->cap_bset;
> -
> -	new->jit_keyring	=3D old->jit_keyring;
> -	new->thread_keyring	=3D key_get(old->thread_keyring);
> -	new->process_keyring	=3D key_get(old->process_keyring);
> -
> -	security_transfer_creds(new, old);
> +	key_put(new->session_keyring);
> +	new->session_keyring =3D key_get(ctx->new_session_keyring);
> =20
>  	commit_creds(new);
> +	ctx->result =3D 0;
> +out:
> +	complete_all(&ctx->done);
>  }
> =20
>  /*
>   * Make sure that root's user and user-session keyrings exist.
>   */
>  static int __init init_root_keyring(void)
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

Not going through everything but can we e.g. make a separe SMACK patch
prepending?

>  	LSM_HOOK_INIT(cred_free, smack_cred_free),
>  	LSM_HOOK_INIT(cred_prepare, smack_cred_prepare),
> -	LSM_HOOK_INIT(cred_transfer, smack_cred_transfer),
>  	LSM_HOOK_INIT(cred_getsecid, smack_cred_getsecid),
>  	LSM_HOOK_INIT(kernel_act_as, smack_kernel_act_as),
>  	LSM_HOOK_INIT(kernel_create_files_as, smack_kernel_create_files_as),
>  	LSM_HOOK_INIT(task_setpgid, smack_task_setpgid),
>  	LSM_HOOK_INIT(task_getpgid, smack_task_getpgid),
>  	LSM_HOOK_INIT(task_getsid, smack_task_getsid),
>
> ---
> base-commit: c0ecd6388360d930440cc5554026818895199923
> change-id: 20240802-remove-cred-transfer-493a3b696da2


BR, Jarkko

