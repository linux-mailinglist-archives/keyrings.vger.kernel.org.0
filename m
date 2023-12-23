Return-Path: <keyrings+bounces-330-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 29DF181D733
	for <lists+keyrings@lfdr.de>; Sun, 24 Dec 2023 00:17:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CF7A71F21D72
	for <lists+keyrings@lfdr.de>; Sat, 23 Dec 2023 23:17:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5898220B3E;
	Sat, 23 Dec 2023 23:17:25 +0000 (UTC)
X-Original-To: keyrings@vger.kernel.org
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F26771D527
	for <keyrings@vger.kernel.org>; Sat, 23 Dec 2023 23:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-35fc8389a58so32070395ab.3
        for <keyrings@vger.kernel.org>; Sat, 23 Dec 2023 15:17:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703373442; x=1703978242;
        h=cc:to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qUZpK4dHEqnEesO3MJLqD1Yf+ic5Z6+dFQBYzrg0joE=;
        b=KM8n2GMWnluxHjXqyHFf0nRyBUrdI3qTjDFVhM7sPf6tYWZXKRhtUgAoyumGxelzUE
         lbCuxiAsDPfCchPA5Um6sXsL7gRlXNbeHxWJk5M2UIArx2D6T0EoqCtasJrPr14Bwm6c
         5rJvVX15RP6uocawMw1/Q0h2tlkG69sb6BVcWvrce7jKrnH0A7bo8TXgCBBXB/6YYwht
         lVrHUaMSQyDLxu4ROSuMfnDQCyj9Dz9ApVr41VwgbEY76nOKdoWdb6ZiNpWPcWT6WsVr
         r7sDpBlksKKrc2UCitUX8LMWgFJng/ZcoEAKPZuU/k9ioS0NjAqZI7W42wWO/XsZg4Pp
         mimQ==
X-Gm-Message-State: AOJu0Yyu5zZNE8XhKiciKYemtViM4uq5doXYVMiL1BsX/Qo9+C+T8FTt
	dZGh0gt/OfBx4pWrqaZEYRK8DTSiHkJNsOfmCbkpkOmtGMzN
X-Google-Smtp-Source: AGHT+IHXWjhzq5UX73UJ2Svrl/Lqi/8ZJ7ThNCsst+jNgaqcVzGKDEiQwZy6MgHE5E7M3QOiHQEDc7a4HbTzfF7igPd97frRll+/
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:218a:b0:35f:ebc7:6065 with SMTP id
 j10-20020a056e02218a00b0035febc76065mr240526ila.1.1703373442281; Sat, 23 Dec
 2023 15:17:22 -0800 (PST)
Date: Sat, 23 Dec 2023 15:17:22 -0800
In-Reply-To: <2591733.1703373433@warthog.procyon.org.uk>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000f27a0d060d358835@google.com>
Subject: Re: [syzbot] [net?] KASAN: slab-out-of-bounds Read in dns_resolver_preparse
From: syzbot <syzbot+94bbb75204a05da3d89f@syzkaller.appspotmail.com>
To: dhowells@redhat.com
Cc: davem@davemloft.net, dhowells@redhat.com, edumazet@google.com, 
	jarkko@kernel.org, jmorris@namei.org, keyrings@vger.kernel.org, 
	kuba@kernel.org, linux-kernel@vger.kernel.org, 
	linux-security-module@vger.kernel.org, netdev@vger.kernel.org, 
	pabeni@redhat.com, paul@paul-moore.com, serge@hallyn.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

> #syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git

want either no args or 2 args (repo, branch), got 5

>
> diff --git a/net/dns_resolver/dns_key.c b/net/dns_resolver/dns_key.c
> index 2a6d363763a2..f18ca02aa95a 100644
> --- a/net/dns_resolver/dns_key.c
> +++ b/net/dns_resolver/dns_key.c
> @@ -91,8 +91,6 @@ const struct cred *dns_resolver_cache;
>  static int
>  dns_resolver_preparse(struct key_preparsed_payload *prep)
>  {
> -	const struct dns_server_list_v1_header *v1;
> -	const struct dns_payload_header *bin;
>  	struct user_key_payload *upayload;
>  	unsigned long derrno;
>  	int ret;
> @@ -103,27 +101,28 @@ dns_resolver_preparse(struct key_preparsed_payload *prep)
>  		return -EINVAL;
>  
>  	if (data[0] == 0) {
> +		const struct dns_server_list_v1_header *v1;
> +
>  		/* It may be a server list. */
> -		if (datalen <= sizeof(*bin))
> +		if (datalen <= sizeof(*v1))
>  			return -EINVAL;
>  
> -		bin = (const struct dns_payload_header *)data;
> -		kenter("[%u,%u],%u", bin->content, bin->version, datalen);
> -		if (bin->content != DNS_PAYLOAD_IS_SERVER_LIST) {
> +		v1 = (const struct dns_server_list_v1_header *)data;
> +		kenter("[%u,%u],%u", v1->hdr.content, v1->hdr.version, datalen);
> +		if (v1->hdr.content != DNS_PAYLOAD_IS_SERVER_LIST) {
>  			pr_warn_ratelimited(
>  				"dns_resolver: Unsupported content type (%u)\n",
> -				bin->content);
> +				v1->hdr.content);
>  			return -EINVAL;
>  		}
>  
> -		if (bin->version != 1) {
> +		if (v1->hdr.version != 1) {
>  			pr_warn_ratelimited(
>  				"dns_resolver: Unsupported server list version (%u)\n",
> -				bin->version);
> +				v1->hdr.version);
>  			return -EINVAL;
>  		}
>  
> -		v1 = (const struct dns_server_list_v1_header *)bin;
>  		if ((v1->status != DNS_LOOKUP_GOOD &&
>  		     v1->status != DNS_LOOKUP_GOOD_WITH_BAD)) {
>  			if (prep->expiry == TIME64_MAX)
>

