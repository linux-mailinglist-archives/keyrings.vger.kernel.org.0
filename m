Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45B9B1D1952
	for <lists+keyrings@lfdr.de>; Wed, 13 May 2020 17:26:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732383AbgEMP0F (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 13 May 2020 11:26:05 -0400
Received: from sonic307-15.consmr.mail.ne1.yahoo.com ([66.163.190.38]:39341
        "EHLO sonic307-15.consmr.mail.ne1.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1732221AbgEMP0F (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 13 May 2020 11:26:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1589383561; bh=TMGR1UN7/Df/12y0+sSTFY1ZUXI7g5K3jbPy+our/LQ=; h=Subject:To:Cc:References:From:Date:In-Reply-To:From:Subject; b=cqH6uDSYltY/CwwXJvwEYGSgSeD+7fBgXpU1tU64N6EfMGRmQVj2JnLSLkvg+a9FUm1zj7VeITjOPNTT3fFqAFouCCZHTAGV5w/fnIUNxPkVY81e8pLBHslfYjHE3nE3lCmju3jqFYqBQov5da9hgiinXm3qhJICARVXxkBFT5/UNiLErmGqJ7xzJgjO4E/GAKkKZZl1ZFlNWNAus8wLt7zODEbYb8ZGHvylgttEdcUQavUy3zXHY9+SaKTwH76+HCNw8ALrWcMa+JZdvggFWsPpB1HOHKt1DKUNoZOui6xCYNTp+8sYWZE/pk1DR1zP8Ltbv50hvMW8ylC9Tz1nGg==
X-YMail-OSG: iv7mQMYVM1mYmi4p80AUwJ6ESFYYuGHLa_5FvdwSRKVWVU_N8bztU_jJV9VKxk1
 EBn8aelY36RRSR7TEWySqqnQOjoK.MKFKfoBoE1Orj84KjGAo9c.h59HW24l_cnenM3IcJjhsAe6
 hc8Sl7pDaap3130vEcEkxZTItFfuPRJiLjhoMErbdGu4vvm3Nds_YAJiklRn3WK3W1W7TYwjntfu
 qGiCyA6WtwmQWf74iKp621vpnMWmML9Bu5j1z8Isgj5Jgw0qzfyNQIXfQp1yU6QbDW76AbIeCcSB
 R60EX1Qv5Kr2AGh.Vcca9KcfTc82puBnuSoxI47XrnWGt4ImIbbWb21t0A5QavK9UzZB_WBS2tr6
 h7Ho7YTgQPyODd3R8_njHM4wth4fX0cDaZSBvo0nu.Ar6H.asOt5h20.zyBjnXAnLFA4WmQeUfJo
 8QN4DhuK0kr0UnSkCG5akreo1RhZ3F.A.FXJtC623Y9_S2wSNUqtr3MoMRTdpYV5E1l4WK3LokbA
 Ebwu5pnLWNFwVK6aykNbelxZPRtiQNaqdDx9y3NS0t_SNRTsoyAqhpv6YOiUB99XqjhTPpk8Xa4J
 tssjXpV2h6sZwltXbJo5rJ70r19yxLq9_AmeXLEkZJ78SZqROn.sUDSVgJWKdjax7fuvRVPfRDhY
 PAvr5.HAjGp4EOV_HIAUVOABed.PbbA8O0IDlGvd8bKC.LNQwXg243Xiv0wSlJfCxlPQmr7wUDjN
 E4NlP6ep2xwqELSMBGel8fT9ec2bM1ld6azdqkA5oDK_qMWxpdVDCCEMRmXk9glneM0HZVhvkQ13
 2T2K7hMJ0EOo7696yWG3.JbyAOyfFOiS96fXB132ps0q76AmB5LaVY4hy7DyPtRSHglP4wJ3kPko
 qYPQON2lFCnbCvoxNaZ.h3mISvjxNzOUTn.x9nK9AjdmsjhJeTtIdrpLqwKvx6VRoL2yC5ExCZ3O
 KDkhm3HdfGabh_EyNyol2q1wAh1AkoRK6gLcQcn8pUM6rWofjoV.l8mM.8bddxzAmoWE5TtybbzQ
 AGku1cApMMysXajjDxdv2R6ViXIol6hTajfV44hjS6aJlnO38XHac._BvzWpg_oCPGttZtnY3C5k
 vuYFPO.3br4ehSWaM2iiLadDouULPW8FH0N2dy5vcZjCfqykZ0hWoZfZMpjh1zbu15Yao8Mv_Hpj
 qeglUYAXTsPR9hhSHXgOjlhKUNGVEEwOt0vekzj9TysMUXy73KxUbfxtwfEp7t1spRYiDipLZ6Kf
 veXv7TxVixaTYDiVOO5SbI5YGmfWufqHoARg_p4xEeX4cgfbsR7oz1ySf6vPtI3VsvxdVdt1jOCI
 S2KooP6uAIEmdaAFVnAyZxLASDZ2y6pualouHOEvRfqdlp6QJLAj9Z.eWC8dnJiSHd5XKKJ9SU81
 f.6QAcKXpOd4yPIrH
Received: from sonic.gate.mail.ne1.yahoo.com by sonic307.consmr.mail.ne1.yahoo.com with HTTP; Wed, 13 May 2020 15:26:01 +0000
Received: by smtp432.mail.ne1.yahoo.com (VZM Hermes SMTP Server) with ESMTPA ID d262d1ddfc5fb8cbf9b16099537660f0;
          Wed, 13 May 2020 15:25:56 +0000 (UTC)
Subject: Re: [PATCH] keys: Make the KEY_NEED_* perms an enum rather than a
 mask
To:     David Howells <dhowells@redhat.com>, stephen.smalley.work@gmail.com
Cc:     Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
        Paul Moore <paul@paul-moore.com>, keyrings@vger.kernel.org,
        selinux@vger.kernel.org, linux-security-module@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Casey Schaufler <casey@schaufler-ca.com>
References: <CAEjxPJ6pFdDfm55pv9bT3CV5DTFF9VqzRmG_Xi5bKNxPaGuOLg@mail.gmail.com>
 <158932282880.2885325.2688622278854566047.stgit@warthog.procyon.org.uk>
From:   Casey Schaufler <casey@schaufler-ca.com>
Autocrypt: addr=casey@schaufler-ca.com; keydata=
 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
 abzjfg==
Message-ID: <004ec27a-cc3a-c75c-952b-ff371b82b8d1@schaufler-ca.com>
Date:   Wed, 13 May 2020 08:25:55 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <158932282880.2885325.2688622278854566047.stgit@warthog.procyon.org.uk>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
X-Mailer: WebService/1.1.15904 hermes Apache-HttpAsyncClient/4.1.4 (Java/11.0.6)
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On 5/12/2020 3:33 PM, David Howells wrote:
> Since the meaning of combining the KEY_NEED_* constants is undefined, m=
ake
> it so that you can't do that by turning them into an enum.
>
> The enum is also given some extra values to represent special
> circumstances, such as:
>
>  (1) The '0' value is reserved and causes a warning to trap the paramet=
er
>      being unset.
>
>  (2) The key is to be unlinked and we require no permissions on it, onl=
y
>      the keyring, (this replaces the KEY_LOOKUP_FOR_UNLINK flag).
>
>  (3) An override due to CAP_SYS_ADMIN.
>
>  (4) An override due to an instantiation token being present.
>
>  (5) The permissions check is being deferred to later key_permission()
>      calls.
>
> The extra values give the opportunity for LSMs to audit these situation=
s.
>
> Signed-off-by: David Howells <dhowells@redhat.com>
> cc: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
> cc: Paul Moore <paul@paul-moore.com>
> cc: Stephen Smalley <stephen.smalley.work@gmail.com>
> cc: Casey Schaufler <casey@schaufler-ca.com>
> cc: keyrings@vger.kernel.org
> cc: selinux@vger.kernel.org
> ---
>
>  include/linux/key.h          |   30 ++++++++++++++++-----------
>  include/linux/security.h     |    6 +++--
>  security/keys/internal.h     |    8 ++++---
>  security/keys/keyctl.c       |   16 ++++++++-------
>  security/keys/permission.c   |   31 ++++++++++++++++++++++------
>  security/keys/process_keys.c |   46 ++++++++++++++++++++--------------=
--------
>  security/security.c          |    6 +++--
>  security/selinux/hooks.c     |   25 ++++++++++++++++-------
>  security/smack/smack_lsm.c   |   31 +++++++++++++++++++++-------
>  9 files changed, 124 insertions(+), 75 deletions(-)
>
> diff --git a/include/linux/key.h b/include/linux/key.h
> index b99b40db08fc..0f2e24f13c2b 100644
> --- a/include/linux/key.h
> +++ b/include/linux/key.h
> @@ -71,6 +71,23 @@ struct net;
> =20
>  #define KEY_PERM_UNDEF	0xffffffff
> =20
> +/*
> + * The permissions required on a key that we're looking up.
> + */
> +enum key_need_perm {
> +	KEY_NEED_UNSPECIFIED,	/* Needed permission unspecified */
> +	KEY_NEED_VIEW,		/* Require permission to view attributes */
> +	KEY_NEED_READ,		/* Require permission to read content */
> +	KEY_NEED_WRITE,		/* Require permission to update / modify */
> +	KEY_NEED_SEARCH,	/* Require permission to search (keyring) or find (k=
ey) */
> +	KEY_NEED_LINK,		/* Require permission to link */
> +	KEY_NEED_SETATTR,	/* Require permission to change attributes */
> +	KEY_NEED_UNLINK,	/* Require permission to unlink key */
> +	KEY_SYSADMIN_OVERRIDE,	/* Special: override by CAP_SYS_ADMIN */
> +	KEY_AUTHTOKEN_OVERRIDE,	/* Special: override by possession of auth to=
ken */
> +	KEY_DEFER_PERM_CHECK,	/* Special: permission check is deferred */
> +};
> +
>  struct seq_file;
>  struct user_struct;
>  struct signal_struct;
> @@ -420,20 +437,9 @@ static inline key_serial_t key_serial(const struct=
 key *key)
>  extern void key_set_timeout(struct key *, unsigned);
> =20
>  extern key_ref_t lookup_user_key(key_serial_t id, unsigned long flags,=

> -				 key_perm_t perm);
> +				 enum key_need_perm need_perm);
>  extern void key_free_user_ns(struct user_namespace *);
> =20
> -/*
> - * The permissions required on a key that we're looking up.
> - */
> -#define	KEY_NEED_VIEW	0x01	/* Require permission to view attributes */=

> -#define	KEY_NEED_READ	0x02	/* Require permission to read content */
> -#define	KEY_NEED_WRITE	0x04	/* Require permission to update / modify *=
/
> -#define	KEY_NEED_SEARCH	0x08	/* Require permission to search (keyring)=
 or find (key) */
> -#define	KEY_NEED_LINK	0x10	/* Require permission to link */
> -#define	KEY_NEED_SETATTR 0x20	/* Require permission to change attribut=
es */
> -#define	KEY_NEED_ALL	0x3f	/* All the above permissions */
> -
>  static inline short key_read_state(const struct key *key)
>  {
>  	/* Barrier versus mark_key_instantiated(). */
> diff --git a/include/linux/security.h b/include/linux/security.h
> index e7914e4e0b02..57aac14e3418 100644
> --- a/include/linux/security.h
> +++ b/include/linux/security.h
> @@ -1767,8 +1767,8 @@ static inline int security_path_chroot(const stru=
ct path *path)
> =20
>  int security_key_alloc(struct key *key, const struct cred *cred, unsig=
ned long flags);
>  void security_key_free(struct key *key);
> -int security_key_permission(key_ref_t key_ref,
> -			    const struct cred *cred, unsigned perm);
> +int security_key_permission(key_ref_t key_ref, const struct cred *cred=
,
> +			    enum key_need_perm need_perm);
>  int security_key_getsecurity(struct key *key, char **_buffer);
> =20
>  #else
> @@ -1786,7 +1786,7 @@ static inline void security_key_free(struct key *=
key)
> =20
>  static inline int security_key_permission(key_ref_t key_ref,
>  					  const struct cred *cred,
> -					  unsigned perm)
> +					  enum key_need_perm need_perm)
>  {
>  	return 0;
>  }
> diff --git a/security/keys/internal.h b/security/keys/internal.h
> index 28e17f4f3328..1fc17cb317a9 100644
> --- a/security/keys/internal.h
> +++ b/security/keys/internal.h
> @@ -167,7 +167,6 @@ extern bool lookup_user_key_possessed(const struct =
key *key,
>  				      const struct key_match_data *match_data);
>  #define KEY_LOOKUP_CREATE	0x01
>  #define KEY_LOOKUP_PARTIAL	0x02
> -#define KEY_LOOKUP_FOR_UNLINK	0x04
> =20
>  extern long join_session_keyring(const char *name);
>  extern void key_change_session_keyring(struct callback_head *twork);
> @@ -183,7 +182,7 @@ extern void key_gc_keytype(struct key_type *ktype);=

> =20
>  extern int key_task_permission(const key_ref_t key_ref,
>  			       const struct cred *cred,
> -			       key_perm_t perm);
> +			       enum key_need_perm need_perm);
> =20
>  static inline void notify_key(struct key *key,
>  			      enum key_notification_subtype subtype, u32 aux)
> @@ -205,9 +204,10 @@ static inline void notify_key(struct key *key,
>  /*
>   * Check to see whether permission is granted to use a key in the desi=
red way.
>   */
> -static inline int key_permission(const key_ref_t key_ref, unsigned per=
m)
> +static inline int key_permission(const key_ref_t key_ref,
> +				 enum key_need_perm need_perm)
>  {
> -	return key_task_permission(key_ref, current_cred(), perm);
> +	return key_task_permission(key_ref, current_cred(), need_perm);
>  }
> =20
>  extern struct key_type key_type_request_key_auth;
> diff --git a/security/keys/keyctl.c b/security/keys/keyctl.c
> index 7d8de1c9a478..6763ee45e04d 100644
> --- a/security/keys/keyctl.c
> +++ b/security/keys/keyctl.c
> @@ -434,7 +434,7 @@ long keyctl_invalidate_key(key_serial_t id)
> =20
>  		/* Root is permitted to invalidate certain special keys */
>  		if (capable(CAP_SYS_ADMIN)) {
> -			key_ref =3D lookup_user_key(id, 0, 0);
> +			key_ref =3D lookup_user_key(id, 0, KEY_SYSADMIN_OVERRIDE);
>  			if (IS_ERR(key_ref))
>  				goto error;
>  			if (test_bit(KEY_FLAG_ROOT_CAN_INVAL,
> @@ -479,7 +479,8 @@ long keyctl_keyring_clear(key_serial_t ringid)
> =20
>  		/* Root is permitted to invalidate certain special keyrings */
>  		if (capable(CAP_SYS_ADMIN)) {
> -			keyring_ref =3D lookup_user_key(ringid, 0, 0);
> +			keyring_ref =3D lookup_user_key(ringid, 0,
> +						      KEY_SYSADMIN_OVERRIDE);
>  			if (IS_ERR(keyring_ref))
>  				goto error;
>  			if (test_bit(KEY_FLAG_ROOT_CAN_CLEAR,
> @@ -563,7 +564,7 @@ long keyctl_keyring_unlink(key_serial_t id, key_ser=
ial_t ringid)
>  		goto error;
>  	}
> =20
> -	key_ref =3D lookup_user_key(id, KEY_LOOKUP_FOR_UNLINK, 0);
> +	key_ref =3D lookup_user_key(id, KEY_LOOKUP_PARTIAL, KEY_NEED_UNLINK);=

>  	if (IS_ERR(key_ref)) {
>  		ret =3D PTR_ERR(key_ref);
>  		goto error2;
> @@ -663,7 +664,7 @@ long keyctl_describe_key(key_serial_t keyid,
>  				key_put(instkey);
>  				key_ref =3D lookup_user_key(keyid,
>  							  KEY_LOOKUP_PARTIAL,
> -							  0);
> +							  KEY_AUTHTOKEN_OVERRIDE);
>  				if (!IS_ERR(key_ref))
>  					goto okay;
>  			}
> @@ -833,7 +834,7 @@ long keyctl_read_key(key_serial_t keyid, char __use=
r *buffer, size_t buflen)
>  	size_t key_data_len;
> =20
>  	/* find the key first */
> -	key_ref =3D lookup_user_key(keyid, 0, 0);
> +	key_ref =3D lookup_user_key(keyid, 0, KEY_DEFER_PERM_CHECK);
>  	if (IS_ERR(key_ref)) {
>  		ret =3D -ENOKEY;
>  		goto out;
> @@ -1471,7 +1472,7 @@ long keyctl_set_timeout(key_serial_t id, unsigned=
 timeout)
>  				key_put(instkey);
>  				key_ref =3D lookup_user_key(id,
>  							  KEY_LOOKUP_PARTIAL,
> -							  0);
> +							  KEY_AUTHTOKEN_OVERRIDE);
>  				if (!IS_ERR(key_ref))
>  					goto okay;
>  			}
> @@ -1579,7 +1580,8 @@ long keyctl_get_security(key_serial_t keyid,
>  			return PTR_ERR(instkey);
>  		key_put(instkey);
> =20
> -		key_ref =3D lookup_user_key(keyid, KEY_LOOKUP_PARTIAL, 0);
> +		key_ref =3D lookup_user_key(keyid, KEY_LOOKUP_PARTIAL,
> +					  KEY_AUTHTOKEN_OVERRIDE);
>  		if (IS_ERR(key_ref))
>  			return PTR_ERR(key_ref);
>  	}
> diff --git a/security/keys/permission.c b/security/keys/permission.c
> index 085f907b64ac..4a61f804e80f 100644
> --- a/security/keys/permission.c
> +++ b/security/keys/permission.c
> @@ -13,7 +13,7 @@
>   * key_task_permission - Check a key can be used
>   * @key_ref: The key to check.
>   * @cred: The credentials to use.
> - * @perm: The permissions to check for.
> + * @need_perm: The permission required.
>   *
>   * Check to see whether permission is granted to use a key in the desi=
red way,
>   * but permit the security modules to override.
> @@ -24,12 +24,30 @@
>   * permissions bits or the LSM check.
>   */
>  int key_task_permission(const key_ref_t key_ref, const struct cred *cr=
ed,
> -			unsigned perm)
> +			enum key_need_perm need_perm)
>  {
>  	struct key *key;
> -	key_perm_t kperm;
> +	key_perm_t kperm, mask;
>  	int ret;
> =20
> +	switch (need_perm) {
> +	default:
> +		WARN_ON(1);
> +		return -EACCES;
> +	case KEY_NEED_UNLINK:
> +	case KEY_SYSADMIN_OVERRIDE:
> +	case KEY_AUTHTOKEN_OVERRIDE:
> +	case KEY_DEFER_PERM_CHECK:
> +		goto lsm;
> +
> +	case KEY_NEED_VIEW:	mask =3D KEY_OTH_VIEW;	break;
> +	case KEY_NEED_READ:	mask =3D KEY_OTH_READ;	break;
> +	case KEY_NEED_WRITE:	mask =3D KEY_OTH_WRITE;	break;
> +	case KEY_NEED_SEARCH:	mask =3D KEY_OTH_SEARCH;	break;
> +	case KEY_NEED_LINK:	mask =3D KEY_OTH_LINK;	break;
> +	case KEY_NEED_SETATTR:	mask =3D KEY_OTH_SETATTR;	break;
> +	}
> +
>  	key =3D key_ref_to_ptr(key_ref);
> =20
>  	/* use the second 8-bits of permissions for keys the caller owns */
> @@ -64,13 +82,12 @@ int key_task_permission(const key_ref_t key_ref, co=
nst struct cred *cred,
>  	if (is_key_possessed(key_ref))
>  		kperm |=3D key->perm >> 24;
> =20
> -	kperm =3D kperm & perm & KEY_NEED_ALL;
> -
> -	if (kperm !=3D perm)
> +	if ((kperm & mask) !=3D mask)
>  		return -EACCES;
> =20
>  	/* let LSM be the final arbiter */
> -	return security_key_permission(key_ref, cred, perm);
> +lsm:
> +	return security_key_permission(key_ref, cred, need_perm);
>  }
>  EXPORT_SYMBOL(key_task_permission);
> =20
> diff --git a/security/keys/process_keys.c b/security/keys/process_keys.=
c
> index 09541de31f2f..7e0232db1707 100644
> --- a/security/keys/process_keys.c
> +++ b/security/keys/process_keys.c
> @@ -609,7 +609,7 @@ bool lookup_user_key_possessed(const struct key *ke=
y,
>   * returned key reference.
>   */
>  key_ref_t lookup_user_key(key_serial_t id, unsigned long lflags,
> -			  key_perm_t perm)
> +			  enum key_need_perm need_perm)
>  {
>  	struct keyring_search_context ctx =3D {
>  		.match_data.cmp		=3D lookup_user_key_possessed,
> @@ -773,35 +773,33 @@ key_ref_t lookup_user_key(key_serial_t id, unsign=
ed long lflags,
> =20
>  	/* unlink does not use the nominated key in any way, so can skip all
>  	 * the permission checks as it is only concerned with the keyring */
> -	if (lflags & KEY_LOOKUP_FOR_UNLINK) {
> -		ret =3D 0;
> -		goto error;
> -	}
> -
> -	if (!(lflags & KEY_LOOKUP_PARTIAL)) {
> -		ret =3D wait_for_key_construction(key, true);
> -		switch (ret) {
> -		case -ERESTARTSYS:
> -			goto invalid_key;
> -		default:
> -			if (perm)
> +	if (need_perm !=3D KEY_NEED_UNLINK) {
> +		if (!(lflags & KEY_LOOKUP_PARTIAL)) {
> +			ret =3D wait_for_key_construction(key, true);
> +			switch (ret) {
> +			case -ERESTARTSYS:
> +				goto invalid_key;
> +			default:
> +				if (need_perm !=3D KEY_AUTHTOKEN_OVERRIDE &&
> +				    need_perm !=3D KEY_DEFER_PERM_CHECK)
> +					goto invalid_key;
> +			case 0:
> +				break;
> +			}
> +		} else if (need_perm !=3D KEY_DEFER_PERM_CHECK) {
> +			ret =3D key_validate(key);
> +			if (ret < 0)
>  				goto invalid_key;
> -		case 0:
> -			break;
>  		}
> -	} else if (perm) {
> -		ret =3D key_validate(key);
> -		if (ret < 0)
> +
> +		ret =3D -EIO;
> +		if (!(lflags & KEY_LOOKUP_PARTIAL) &&
> +		    key_read_state(key) =3D=3D KEY_IS_UNINSTANTIATED)
>  			goto invalid_key;
>  	}
> =20
> -	ret =3D -EIO;
> -	if (!(lflags & KEY_LOOKUP_PARTIAL) &&
> -	    key_read_state(key) =3D=3D KEY_IS_UNINSTANTIATED)
> -		goto invalid_key;
> -
>  	/* check the permissions */
> -	ret =3D key_task_permission(key_ref, ctx.cred, perm);
> +	ret =3D key_task_permission(key_ref, ctx.cred, need_perm);
>  	if (ret < 0)
>  		goto invalid_key;
> =20
> diff --git a/security/security.c b/security/security.c
> index c73334ab2882..af32d4cd0462 100644
> --- a/security/security.c
> +++ b/security/security.c
> @@ -2398,10 +2398,10 @@ void security_key_free(struct key *key)
>  	call_void_hook(key_free, key);
>  }
> =20
> -int security_key_permission(key_ref_t key_ref,
> -			    const struct cred *cred, unsigned perm)
> +int security_key_permission(key_ref_t key_ref, const struct cred *cred=
,
> +			    enum key_need_perm need_perm)
>  {
> -	return call_int_hook(key_permission, 0, key_ref, cred, perm);
> +	return call_int_hook(key_permission, 0, key_ref, cred, need_perm);
>  }
> =20
>  int security_key_getsecurity(struct key *key, char **_buffer)
> diff --git a/security/selinux/hooks.c b/security/selinux/hooks.c
> index 0b4e32161b77..3ff6b6dfc5ca 100644
> --- a/security/selinux/hooks.c
> +++ b/security/selinux/hooks.c
> @@ -6541,20 +6541,31 @@ static void selinux_key_free(struct key *k)
> =20
>  static int selinux_key_permission(key_ref_t key_ref,
>  				  const struct cred *cred,
> -				  unsigned perm)
> +				  enum key_need_perm need_perm)
>  {
>  	struct key *key;
>  	struct key_security_struct *ksec;
> -	u32 sid;
> +	u32 perm, sid;
> =20
> -	/* if no specific permissions are requested, we skip the
> -	   permission check. No serious, additional covert channels
> -	   appear to be created. */
> -	if (perm =3D=3D 0)
> +	switch (need_perm) {
> +	case KEY_NEED_UNLINK:
> +	case KEY_SYSADMIN_OVERRIDE:
> +	case KEY_AUTHTOKEN_OVERRIDE:
> +	case KEY_DEFER_PERM_CHECK:
>  		return 0;
> +	default:
> +		WARN_ON(1);
> +		return -EPERM;
> =20
> -	sid =3D cred_sid(cred);
> +	case KEY_NEED_VIEW:	perm =3D KEY__VIEW;	break;
> +	case KEY_NEED_READ:	perm =3D KEY__READ;	break;
> +	case KEY_NEED_WRITE:	perm =3D KEY__WRITE;	break;
> +	case KEY_NEED_SEARCH:	perm =3D KEY__SEARCH;	break;
> +	case KEY_NEED_LINK:	perm =3D KEY__LINK;	break;
> +	case KEY_NEED_SETATTR:	perm =3D KEY__SETATTR;	break;
> +	}
> =20
> +	sid =3D cred_sid(cred);
>  	key =3D key_ref_to_ptr(key_ref);
>  	ksec =3D key->security;
> =20
> diff --git a/security/smack/smack_lsm.c b/security/smack/smack_lsm.c
> index 8c61d175e195..627ca7dc9b27 100644
> --- a/security/smack/smack_lsm.c
> +++ b/security/smack/smack_lsm.c
> @@ -4230,13 +4230,14 @@ static void smack_key_free(struct key *key)
>   * smack_key_permission - Smack access on a key
>   * @key_ref: gets to the object
>   * @cred: the credentials to use
> - * @perm: requested key permissions
> + * @need_perm: requested key permission
>   *
>   * Return 0 if the task has read and write to the object,
>   * an error code otherwise
>   */
>  static int smack_key_permission(key_ref_t key_ref,
> -				const struct cred *cred, unsigned perm)
> +				const struct cred *cred,
> +				enum key_need_perm need_perm)
>  {
>  	struct key *keyp;
>  	struct smk_audit_info ad;
> @@ -4247,8 +4248,26 @@ static int smack_key_permission(key_ref_t key_re=
f,
>  	/*
>  	 * Validate requested permissions
>  	 */
> -	if (perm & ~KEY_NEED_ALL)
> -		return -EINVAL;
> +	switch (need_perm) {
> +	default:
> +		return -EACCES;

Put the default at the end of the switch.
Because that's just the way it's done.

Is the change from -EINVAL to -EACCES a bug fix?
Does it introduce an incompatibility?

> +	case KEY_NEED_UNSPECIFIED:
> +	case KEY_NEED_UNLINK:
> +	case KEY_SYSADMIN_OVERRIDE:
> +	case KEY_AUTHTOKEN_OVERRIDE:
> +	case KEY_DEFER_PERM_CHECK:
> +		return 0;
> +	case KEY_NEED_READ:
> +	case KEY_NEED_SEARCH:
> +	case KEY_NEED_VIEW:
> +		request |=3D MAY_READ;
> +		break;
> +	case KEY_NEED_WRITE:
> +	case KEY_NEED_LINK:
> +	case KEY_NEED_SETATTR:
> +		request |=3D MAY_WRITE;
> +		break;
> +	}
> =20
>  	keyp =3D key_ref_to_ptr(key_ref);
>  	if (keyp =3D=3D NULL)
> @@ -4273,10 +4292,6 @@ static int smack_key_permission(key_ref_t key_re=
f,
>  	ad.a.u.key_struct.key =3D keyp->serial;
>  	ad.a.u.key_struct.key_desc =3D keyp->description;
>  #endif
> -	if (perm & (KEY_NEED_READ | KEY_NEED_SEARCH | KEY_NEED_VIEW))
> -		request |=3D MAY_READ;
> -	if (perm & (KEY_NEED_WRITE | KEY_NEED_LINK | KEY_NEED_SETATTR))
> -		request |=3D MAY_WRITE;
>  	rc =3D smk_access(tkp, keyp->security, request, &ad);
>  	rc =3D smk_bu_note("key access", tkp, keyp->security, request, rc);
>  	return rc;
>
>

