Return-Path: <keyrings+bounces-1822-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DAF4A93F73A
	for <lists+keyrings@lfdr.de>; Mon, 29 Jul 2024 16:06:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 721F0282773
	for <lists+keyrings@lfdr.de>; Mon, 29 Jul 2024 14:06:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 307F5148826;
	Mon, 29 Jul 2024 14:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="FYClwVgF"
X-Original-To: keyrings@vger.kernel.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F096548F7;
	Mon, 29 Jul 2024 14:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.185.170.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722261984; cv=pass; b=FRde3qGn/A9Tgrv/JYslXN6PNyr16babZAX2bD2Vly4qeXimNtQ9Q66aghmMEjCPdDctpffeCb5TiG4AdHJMD7/q/rdlX/gy2KpizAyHaIM/rA7nuSiyHB0eoVEsFxjwytpfoU494/zMf/PKiddeQYebvauw0WSJ6nrpc6aIjH8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722261984; c=relaxed/simple;
	bh=0o3cxwVIX6W+JSBJZMsbzybCNjUAO646XscSaOWFHcM=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=RPO7ErpND3eehexVy/nGiLLexh/keCRa61pbJNFjfG4XTL8YhdQkvL61zt7ovrFO+qerHaNOAui3azr2uEqnAmGsdaBZ2w1+8lubwKxBj/0OBZ2hLHpsbBxHFsGTCoYsNgzyxPULTdqR6X/3Lk5VLYhhAuzrD+bdBVY1eirG9Ag=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b=FYClwVgF; arc=pass smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from localhost (91-154-92-171.elisa-laajakaista.fi [91.154.92.171])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sakkinen)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4WXgBb2tF7z49Pxq;
	Mon, 29 Jul 2024 17:06:15 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1722261977;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=58xFwHqBtPauSUnJMDeUcsN8ZTBzN4flN8E7xsxQpJg=;
	b=FYClwVgFHKv02sXRaOC/ibIl0mC3QhLo/onAfUuqwzht9b1MdlyKDrzNZZFgWVgZgcFnhh
	Dz3gslwvtgp2+UC85ypVjqAA4anHMW6YxoIkdTal13COuw6MPAcMX31yqpP89+lZaxa4zO
	N1ZbKg1glD41auyQXvZra0BR/N6i8UaylUEx40bGvYdYOzvWC1sFBtqHK2SE00eaH+g9lo
	majts9ymKHijqgwSEY7qQJLwNWRkQjCT+T+wWjG9JYK3LeNQabPBm8DFK4KiXqP7TTdgfX
	lcuSNWNpRyTj1I27KEUV8LVAMIamXfMkR1jJXkzMZf6oyWfkbkAPJl1/fEHyfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1722261977;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=58xFwHqBtPauSUnJMDeUcsN8ZTBzN4flN8E7xsxQpJg=;
	b=cuTYR1eN2b37S5vLrAJxCP9GkBrE21BrlMNKBhXR1CmvuhbQpPKeHl+xf1xwt57AQekYdE
	pj++tpWNvSao1wv/7/2oxeNlAIO76cZiAEnAiOZA88m17S7ABGk+t6tZ1BqOdPh7Q66z8V
	10lqwBI/bMKuUWVCwzT//k1XofboxP92WCPvOCq/o5lCAFNepGZemCbWg/3Cf4FSf/W9P/
	/3JHtDYNan4hIuGJQneZbjyFe9zURNIkDhp2y/WSnlXvtiHKemRU6onOyTPaX4SvGr1q2O
	rgC8TzXGCskXvst9uPgcIygOgIXWRBsOuhxtbW6pBLvJvmsopcCxjaFbpVcjhA==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sakkinen smtp.mailfrom=jarkko.sakkinen@iki.fi
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1722261977; a=rsa-sha256;
	cv=none;
	b=lmx6rNhe5uPEUbPHVDLi9ffTrrvPbgmBMc1chO2Q2BLGJd31b19DCD+5TTiUpGgk01QxXm
	7MsmQg2enUCQy2jw4Y+kxMwl18fZjUhk3swVh/1fv4xYSzxTLbCUVMlMW+RovNi7LryiBf
	h3pdTcl7ScpE57ELLddpAH1n1hsj1C7EdLO+f+qg/aL2C1+DF8PO0U10ZLOwqt5upR8Xdn
	ieCyvlhIwSo7d6NlcJUvxhpnzxafoln4J2i0w3jTp35atZtLwdgBsubHKpUooZqriDaqzI
	swgQKlyGpU2lXNY2DAXdJ8KMVG8ekM2PJklXWnc+ccRhQHn1+VwHXbaZoc9Cpg==
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 29 Jul 2024 17:06:14 +0300
Message-Id: <D322X0D8UBYG.3FIRWQEBNURZF@iki.fi>
Cc: =?utf-8?q?G=C3=BCnther_Noack?= <gnoack@google.com>, "James Morris"
 <jmorris@namei.org>, "Jann Horn" <jannh@google.com>, "Kees Cook"
 <kees@kernel.org>, "Paul Moore" <paul@paul-moore.com>,
 <keyrings@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-security-module@vger.kernel.org>
Subject: Re: [PATCH v1] keys: Restrict KEYCTL_SESSION_TO_PARENT according to
 ptrace_may_access()
From: "Jarkko Sakkinen" <jarkko.sakkinen@iki.fi>
To: =?utf-8?q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>, "David Howells"
 <dhowells@redhat.com>, "Jarkko Sakkinen" <jarkko@kernel.org>
X-Mailer: aerc 0.18.0
References: <20240729125846.1043211-1-mic@digikod.net>
In-Reply-To: <20240729125846.1043211-1-mic@digikod.net>

On Mon Jul 29, 2024 at 3:58 PM EEST, Micka=C3=ABl Sala=C3=BCn wrote:
> A process can modify its parent's credentials with
> KEYCTL_SESSION_TO_PARENT when their EUID and EGID are the same.  This
> doesn't take into account all possible access controls.

Add a smoke test transcript here, which demonstrates the above
for A/B testing sake so that there is no need to invent one by
the reviewer.

Otherwise, it is too involved to give tested-by tag to this patch.

>
> Enforce the same access checks as for impersonating a process.
>
> The current credentials checks are untouch because they check against
> EUID and EGID, whereas ptrace_may_access() checks against UID and GID.
>
> Cc: David Howells <dhowells@redhat.com>
> Cc: G=C3=BCnther Noack <gnoack@google.com>
> Cc: James Morris <jmorris@namei.org>
> Cc: Jann Horn <jannh@google.com>
> Cc: Jarkko Sakkinen <jarkko@kernel.org>
> Cc: Kees Cook <kees@kernel.org>
> Cc: Paul Moore <paul@paul-moore.com>
> Fixes: ee18d64c1f63 ("KEYS: Add a keyctl to install a process's session k=
eyring on its parent [try #6]")
> Signed-off-by: Micka=C3=ABl Sala=C3=BCn <mic@digikod.net>
> Link: https://lore.kernel.org/r/20240729125846.1043211-1-mic@digikod.net
> ---
>  security/keys/keyctl.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/security/keys/keyctl.c b/security/keys/keyctl.c
> index ab927a142f51..511bf79fa14c 100644
> --- a/security/keys/keyctl.c
> +++ b/security/keys/keyctl.c
> @@ -21,6 +21,7 @@
>  #include <linux/security.h>
>  #include <linux/uio.h>
>  #include <linux/uaccess.h>
> +#include <linux/ptrace.h>
>  #include <keys/request_key_auth-type.h>
>  #include "internal.h"
> =20
> @@ -1687,6 +1688,10 @@ long keyctl_session_to_parent(void)
>  	    !gid_eq(pcred->sgid, mycred->egid))
>  		goto unlock;
> =20
> +	/* The child must be allowed to impersonate its parent process. */
> +	if (!ptrace_may_access(parent, PTRACE_MODE_ATTACH_REALCREDS))
> +		goto unlock;
> +
>  	/* the keyrings must have the same UID */
>  	if ((pcred->session_keyring &&
>  	     !uid_eq(pcred->session_keyring->uid, mycred->euid)) ||
>
> base-commit: 8400291e289ee6b2bf9779ff1c83a291501f017b


BR, Jarkko

