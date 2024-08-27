Return-Path: <keyrings+bounces-1923-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BDB8F9616DE
	for <lists+keyrings@lfdr.de>; Tue, 27 Aug 2024 20:23:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F0BCE1C22F85
	for <lists+keyrings@lfdr.de>; Tue, 27 Aug 2024 18:23:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E30D1D2F7E;
	Tue, 27 Aug 2024 18:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ShLcw5Eb"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A44C1D2F49;
	Tue, 27 Aug 2024 18:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724782985; cv=none; b=KXcJYwYlH7Jv94sGbMotCbSFpju1UrH+Lm8NqqnIc4ID/uRXHwRl4cRS2EXXeN68YC5BUc28j3qFHc8i3z7BtQrauwntrwifmESynF2w+VXLiajk9VS4OamoQ3t+pxgyPi9i2I9bkCytu4SLgkQDNzk66Be02RAKCA1FyYMDXAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724782985; c=relaxed/simple;
	bh=r85rajG2yDYjVTPgQ/vfB0pCdDo4IKhXLQULuqEJp10=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=Scri7d93yW9QAEQ0LnaHrvq4MKyOCcO0t2OWLOIUs7ewR5M0m5Q+FK8TC7n7KTlnxYOjaeKyX4n9mcBUhiz9vD1xPcPfdIdKvY0hfGHduVO9ah8u3uIz+9qU5YgNtH3F6DznSaj0ExwyW/Gu7eU56MKLaJ63WKljz9TBdt35kEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ShLcw5Eb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5438AC4AF09;
	Tue, 27 Aug 2024 18:23:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724782984;
	bh=r85rajG2yDYjVTPgQ/vfB0pCdDo4IKhXLQULuqEJp10=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=ShLcw5Eb9guf/o2af83nX32iqoek7YnU1k8qeS2XOYaeP6WKkRZUA8UjQeZxNKrw9
	 jH6HAcqyJyfFU/Fq4OGpNvgj3/9KLnWZCZAu3DhZrT4l8mv+D0nfPgqdkJ8x+koUv/
	 6m/3vl7KtO8jf6fBHGYq8YCwFxXjq5ZibFF66BnhSQfTAFVi8v382SveBPuaqvMQQl
	 E/9FwIalIi1AYLOU5MBOFfz6zybKN9r/YCI90gmkQjhhzHaAdA5FRBrj8ffrkvOyQz
	 4jB0TQhYWn5JOPMOtK7eGkjDvcoHjynwFOXk1tF+gsrLTbfPXN/POLYE51D8jPdFLK
	 FbDIOVX5jCcrg==
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 27 Aug 2024 21:23:01 +0300
Message-Id: <D3QWJEX4QDU8.3CVMNNDFDANVW@kernel.org>
Cc: <keyrings@vger.kernel.org>, <linux-security-module@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/7] keys: Extract struct key_user to its own header for
 tracing purposes
From: "Jarkko Sakkinen" <jarkko@kernel.org>
To: "David Howells" <dhowells@redhat.com>
X-Mailer: aerc 0.17.0
References: <20240821123616.60401-1-dhowells@redhat.com>
 <20240821123616.60401-3-dhowells@redhat.com>
In-Reply-To: <20240821123616.60401-3-dhowells@redhat.com>

On Wed Aug 21, 2024 at 3:36 PM EEST, David Howells wrote:
> Extract the key_user struct  to its own header file to make it easier to
> access from tracepoints.
>
> Signed-off-by: David Howells <dhowells@redhat.com>
> cc: Jarkko Sakkinen <jarkko@kernel.org>
> cc: keyrings@vger.kernel.org
> cc: linux-security-module@vger.kernel.org
> ---
>  include/keys/key_user.h  | 35 +++++++++++++++++++++++++++++++++++
>  security/keys/internal.h | 20 +-------------------
>  2 files changed, 36 insertions(+), 19 deletions(-)
>  create mode 100644 include/keys/key_user.h
>
> diff --git a/include/keys/key_user.h b/include/keys/key_user.h
> new file mode 100644
> index 000000000000..e9c383d8116e
> --- /dev/null
> +++ b/include/keys/key_user.h
> @@ -0,0 +1,35 @@
> +/* User quota tracking for keys.
> + *
> + * Copyright (C) 2024 Red Hat, Inc. All Rights Reserved.
> + * Written by David Howells (dhowells@redhat.com)
> + *
> + * This program is free software; you can redistribute it and/or
> + * modify it under the terms of the GNU General Public Licence
> + * as published by the Free Software Foundation; either version
> + * 2 of the Licence, or (at your option) any later version.
> + */
> +
> +#ifndef _KEYS_KEY_USER_H
> +#define _KEYS_KEY_USER_H
> +
> +/*
> + * Keep track of keys for a user.
> + *
> + * This needs to be separate to user_struct to avoid a refcount-loop
> + * (user_struct pins some keyrings which pin this struct).
> + *
> + * We also keep track of keys under request from userspace for this UID =
here.
> + */
> +struct key_user {
> +	struct rb_node		node;
> +	struct mutex		cons_lock;	/* construction initiation lock */
> +	spinlock_t		lock;
> +	refcount_t		usage;		/* for accessing qnkeys & qnbytes */
> +	atomic_t		nkeys;		/* number of keys */
> +	atomic_t		nikeys;		/* number of instantiated keys */
> +	kuid_t			uid;
> +	int			qnkeys;		/* number of keys allocated to this user */
> +	int			qnbytes;	/* number of bytes allocated to this user */
> +};
> +
> +#endif /* _KEYS_KEY_USER_H */
> diff --git a/security/keys/internal.h b/security/keys/internal.h
> index 8ba87127e446..33c929a6bb97 100644
> --- a/security/keys/internal.h
> +++ b/security/keys/internal.h
> @@ -19,6 +19,7 @@
>  #include <linux/compat.h>
>  #include <linux/mm.h>
>  #include <linux/vmalloc.h>
> +#include <keys/key_user.h>
> =20
>  struct iovec;
> =20
> @@ -43,25 +44,6 @@ extern struct key_type key_type_user;
>  extern struct key_type key_type_logon;
> =20
>  /***********************************************************************=
******/
> -/*
> - * Keep track of keys for a user.
> - *
> - * This needs to be separate to user_struct to avoid a refcount-loop
> - * (user_struct pins some keyrings which pin this struct).
> - *
> - * We also keep track of keys under request from userspace for this UID =
here.
> - */
> -struct key_user {
> -	struct rb_node		node;
> -	struct mutex		cons_lock;	/* construction initiation lock */
> -	spinlock_t		lock;
> -	refcount_t		usage;		/* for accessing qnkeys & qnbytes */
> -	atomic_t		nkeys;		/* number of keys */
> -	atomic_t		nikeys;		/* number of instantiated keys */
> -	kuid_t			uid;
> -	int			qnkeys;		/* number of keys allocated to this user */
> -	int			qnbytes;	/* number of bytes allocated to this user */
> -};
> =20
>  extern struct rb_root	key_user_tree;
>  extern spinlock_t	key_user_lock;


Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>


BR, Jarkko

