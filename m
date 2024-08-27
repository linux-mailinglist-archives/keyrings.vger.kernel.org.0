Return-Path: <keyrings+bounces-1926-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 053489616ED
	for <lists+keyrings@lfdr.de>; Tue, 27 Aug 2024 20:24:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2A3751C220BE
	for <lists+keyrings@lfdr.de>; Tue, 27 Aug 2024 18:24:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 920031D2F67;
	Tue, 27 Aug 2024 18:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lK7+yL6E"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 665F31D2F5C;
	Tue, 27 Aug 2024 18:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724783062; cv=none; b=m6ftjoRl6zSbvpBt/M4NOsCUJcWm9kfrZ1TgqMMzu2pANmdsfQYTCBOpg1yMIWDvcJkQssu9fY8yed8BKeB7j2JC4x/O9yv5gff9iZX9c6WHW3hAigu9eNXWhWAa1QDJ7ofAzYet3xzdUxtuWcKKPmL4BzvWT6NWb2iafYrpS/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724783062; c=relaxed/simple;
	bh=hUsevjWbTWQmzJWw63SEIYhUyZpFvPnfguEiTmgBRrk=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=Gg6l5CMThOQa8xC7Vbp7iYM6SDGa2xmje32NApdXVCIrj+PhZYG980QJMGuPqyNlsdrlpjwc30/YyZcAdB/5OnARlY/+IybHFcQxqq92U822u3lXrZq8rXN3SK0DDH22qYBBAGbI+Ik48Yz6EtW/funjPxhDwjs/uczx2XhHBDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lK7+yL6E; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CD42C4DE03;
	Tue, 27 Aug 2024 18:24:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724783061;
	bh=hUsevjWbTWQmzJWw63SEIYhUyZpFvPnfguEiTmgBRrk=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=lK7+yL6Ej1o4+DIoOwn97vdKzgzgTiXEDyW8sNzcSb8gwCIfI9L3XIZsVu5XalCeM
	 XxBfo39lhr6gE6LqInB08vgHjd3qN4J+4FbH74pzoi/YsKu8lk4Tn6o3p625vphYGd
	 +xhNQnTiaKdkOjXrpap+WtVXXpgkf1nFEEDy4HjaUyWM46FaPrN1IPW9S/ofZsYEqQ
	 nEB9VcpoICpJeBDafhdWO2vS3W6jNzHz9bGbyVzY7q/trCu7Ck4nq3hB9tDDCybHh0
	 j5nBiSQ3TBBhCsH8EaboA8pBsgsWUs1Hisdg9mzqEUNifiRMIJh7xS6kjvjgAJ5r6O
	 N1NPGbwNsB9sQ==
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 27 Aug 2024 21:24:18 +0300
Message-Id: <D3QWKEINML37.2DGN2KEH1N173@kernel.org>
Subject: Re: [PATCH 5/7] keys: Use key_get() instead of __key_get()
From: "Jarkko Sakkinen" <jarkko@kernel.org>
To: "David Howells" <dhowells@redhat.com>
Cc: <keyrings@vger.kernel.org>, <linux-security-module@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.17.0
References: <20240821123616.60401-1-dhowells@redhat.com>
 <20240821123616.60401-6-dhowells@redhat.com>
In-Reply-To: <20240821123616.60401-6-dhowells@redhat.com>

On Wed Aug 21, 2024 at 3:36 PM EEST, David Howells wrote:
> Switch users of __key_get() over to key_get() so that they benefit from t=
he
> future tracepointage thereof also and remove __key_get().
>
> Signed-off-by: David Howells <dhowells@redhat.com>
> cc: Jarkko Sakkinen <jarkko@kernel.org>
> cc: keyrings@vger.kernel.org
> cc: linux-security-module@vger.kernel.org
> ---
>  Documentation/security/keys/core.rst |  1 -
>  crypto/asymmetric_keys/restrict.c    |  6 +++---
>  include/linux/key.h                  |  6 ------
>  security/keys/keyring.c              |  4 ++--
>  security/keys/process_keys.c         | 15 ++++++---------
>  5 files changed, 11 insertions(+), 21 deletions(-)
>
> diff --git a/Documentation/security/keys/core.rst b/Documentation/securit=
y/keys/core.rst
> index 326b8a973828..0b179540d885 100644
> --- a/Documentation/security/keys/core.rst
> +++ b/Documentation/security/keys/core.rst
> @@ -1217,7 +1217,6 @@ payload contents" for more information.
>   *  Extra references can be made to a key by calling one of the followin=
g
>      functions::
> =20
> -	struct key *__key_get(struct key *key);
>  	struct key *key_get(struct key *key);
> =20
>      Keys so references will need to be disposed of by calling key_put() =
when
> diff --git a/crypto/asymmetric_keys/restrict.c b/crypto/asymmetric_keys/r=
estrict.c
> index afcd4d101ac5..1ea7bfd4e5d7 100644
> --- a/crypto/asymmetric_keys/restrict.c
> +++ b/crypto/asymmetric_keys/restrict.c
> @@ -267,20 +267,20 @@ static int key_or_keyring_common(struct key *dest_k=
eyring,
>  			if (!sig->auth_ids[0] && !sig->auth_ids[1]) {
>  				if (asymmetric_key_id_same(signer_ids[2],
>  							   sig->auth_ids[2]))
> -					key =3D __key_get(trusted);
> +					key =3D key_get(trusted);
> =20
>  			} else if (!sig->auth_ids[0] || !sig->auth_ids[1]) {
>  				const struct asymmetric_key_id *auth_id;
> =20
>  				auth_id =3D sig->auth_ids[0] ?: sig->auth_ids[1];
>  				if (match_either_id(signer_ids, auth_id))
> -					key =3D __key_get(trusted);
> +					key =3D key_get(trusted);
> =20
>  			} else if (asymmetric_key_id_same(signer_ids[1],
>  							  sig->auth_ids[1]) &&
>  				   match_either_id(signer_ids,
>  						   sig->auth_ids[0])) {
> -				key =3D __key_get(trusted);
> +				key =3D key_get(trusted);
>  			}
>  		} else {
>  			return -EOPNOTSUPP;
> diff --git a/include/linux/key.h b/include/linux/key.h
> index 50a19e5f9e45..80d736813b89 100644
> --- a/include/linux/key.h
> +++ b/include/linux/key.h
> @@ -304,12 +304,6 @@ extern void key_put(struct key *key);
>  extern bool key_put_tag(struct key_tag *tag);
>  extern void key_remove_domain(struct key_tag *domain_tag);
> =20
> -static inline struct key *__key_get(struct key *key)
> -{
> -	refcount_inc(&key->usage);
> -	return key;
> -}
> -
>  static inline void key_ref_put(key_ref_t key_ref)
>  {
>  	key_put(key_ref_to_ptr(key_ref));
> diff --git a/security/keys/keyring.c b/security/keys/keyring.c
> index 7f02b913c560..e77d927f1d4d 100644
> --- a/security/keys/keyring.c
> +++ b/security/keys/keyring.c
> @@ -1122,7 +1122,7 @@ key_ref_t find_key_to_update(key_ref_t keyring_ref,
>  		kleave(" =3D NULL [x]");
>  		return NULL;
>  	}
> -	__key_get(key);
> +	key_get(key);
>  	kleave(" =3D {%d}", key->serial);
>  	return make_key_ref(key, is_key_possessed(keyring_ref));
>  }
> @@ -1367,7 +1367,7 @@ int __key_link_check_live_key(struct key *keyring, =
struct key *key)
>  void __key_link(struct key *keyring, struct key *key,
>  		struct assoc_array_edit **_edit)
>  {
> -	__key_get(key);
> +	key_get(key);
>  	assoc_array_insert_set_object(*_edit, keyring_key_to_ptr(key));
>  	assoc_array_apply_edit(*_edit);
>  	*_edit =3D NULL;
> diff --git a/security/keys/process_keys.c b/security/keys/process_keys.c
> index b5d5333ab330..01291b2d0888 100644
> --- a/security/keys/process_keys.c
> +++ b/security/keys/process_keys.c
> @@ -333,7 +333,7 @@ int install_session_keyring_to_cred(struct cred *cred=
, struct key *keyring)
>  		if (IS_ERR(keyring))
>  			return PTR_ERR(keyring);
>  	} else {
> -		__key_get(keyring);
> +		key_get(keyring);
>  	}
> =20
>  	/* install the keyring */
> @@ -641,7 +641,7 @@ key_ref_t lookup_user_key(key_serial_t id, unsigned l=
ong lflags,
>  		}
> =20
>  		key =3D ctx.cred->thread_keyring;
> -		__key_get(key);
> +		key_get(key);
>  		key_ref =3D make_key_ref(key, 1);
>  		break;
> =20
> @@ -658,8 +658,7 @@ key_ref_t lookup_user_key(key_serial_t id, unsigned l=
ong lflags,
>  			goto reget_creds;
>  		}
> =20
> -		key =3D ctx.cred->process_keyring;
> -		__key_get(key);
> +		key =3D key_get(ctx.cred->process_keyring);
>  		key_ref =3D make_key_ref(key, 1);
>  		break;
> =20
> @@ -688,8 +687,7 @@ key_ref_t lookup_user_key(key_serial_t id, unsigned l=
ong lflags,
>  			goto reget_creds;
>  		}
> =20
> -		key =3D ctx.cred->session_keyring;
> -		__key_get(key);
> +		key =3D key_get(ctx.cred->session_keyring);
>  		key_ref =3D make_key_ref(key, 1);
>  		break;
> =20
> @@ -717,7 +715,7 @@ key_ref_t lookup_user_key(key_serial_t id, unsigned l=
ong lflags,
>  		if (!key)
>  			goto error;
> =20
> -		__key_get(key);
> +		key_get(key);
>  		key_ref =3D make_key_ref(key, 1);
>  		break;
> =20
> @@ -732,8 +730,7 @@ key_ref_t lookup_user_key(key_serial_t id, unsigned l=
ong lflags,
>  			key =3D NULL;
>  		} else {
>  			rka =3D ctx.cred->request_key_auth->payload.data[0];
> -			key =3D rka->dest_keyring;
> -			__key_get(key);
> +			key =3D key_get(rka->dest_keyring);
>  		}
>  		up_read(&ctx.cred->request_key_auth->sem);
>  		if (!key)

Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>

BR, Jarkko

