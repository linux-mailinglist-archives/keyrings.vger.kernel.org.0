Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 251B76B6BC9
	for <lists+keyrings@lfdr.de>; Sun, 12 Mar 2023 22:37:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230316AbjCLVhe (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Sun, 12 Mar 2023 17:37:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230179AbjCLVhd (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Sun, 12 Mar 2023 17:37:33 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEFEA3252A
        for <keyrings@vger.kernel.org>; Sun, 12 Mar 2023 14:37:32 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 72FCEB80C67
        for <keyrings@vger.kernel.org>; Sun, 12 Mar 2023 21:37:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B60F0C433EF;
        Sun, 12 Mar 2023 21:37:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1678657050;
        bh=P70CTC9oNBp5btzH762KtKSlK15P461q94+kUBYs3KQ=;
        h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
        b=YwPtXPjDMC8cOfkYdhDDzOk0kcgYkay9A6+fbRZe75RoSmC72TrKHWQcxg+rSJZ+F
         itlI9ICUJj9n+wSt2kzTXkUfKqciDbf9TNHpO0DmjpWoa3Yx2S9pArrNZoBfFWmLHb
         93pDuYuR9Kiv5nDBirYZtp6Rus8FlsYfxXFRrNqj+ZADAi/hwsumpdJUo49rd12hRR
         NbniiXGzXdEsiimX/QSXtG4+tEZrMYf4lHVw+VlFng8wb9wCGeIzGzWc4eCU/DWRJA
         6cAo3ym4UAOvBxcMbZI3LzBshNyCv1jHplA1+E134qXsLxkeqPzLore/iKGE4d3sNy
         cQJG+e0DV3NSA==
Message-ID: <c0530ea97166463bd2129da160c3ef0e6c72a8fb.camel@kernel.org>
Subject: Re: [PATCH] KEYS: Do not cache key in task struct if key is
 requested from kernel thread
From:   Jarkko Sakkinen <jarkko@kernel.org>
To:     Bharath SM <bharathsm.hsk@gmail.com>,
        David Howells <dhowells@redhat.com>, keyrings@vger.kernel.org
Cc:     Bharath S M <bharathsm@microsoft.com>,
        Shyam Prasad N <nspmangalore@gmail.com>,
        Steve French <smfrench@gmail.com>
Date:   Sun, 12 Mar 2023 23:37:27 +0200
In-Reply-To: <CAGypqWw951d=zYRbdgNR4snUDvJhWL=q3=WOyh7HhSJupjz2vA@mail.gmail.com>
References: <CAGypqWw951d=zYRbdgNR4snUDvJhWL=q3=WOyh7HhSJupjz2vA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1-0ubuntu1 
MIME-Version: 1.0
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Mon, 2023-03-13 at 00:23 +0530, Bharath SM wrote:
> The key which gets cached in task structure from a kernel thread does not
> get invalidated even after expiry. Due to which, a new key request from
> kernel thread will be served with the cached key if it's present in task
> struct irrespective of the key validity.
> The change is to not cache key in task_struct when key requested from ker=
nel
> thread so that kernel thread gets a valid key on every key request.
>=20
> Signed-off-by: Bharath SM <bharathsm@microsoft.com>

What is the context where you bumped into this?

> ---
> =C2=A0security/keys/request_key.c | 9 ++++++---
> =C2=A01 file changed, 6 insertions(+), 3 deletions(-)
>=20
> diff --git a/security/keys/request_key.c b/security/keys/request_key.c
> index 2da4404276f0..07a0ef2baacd 100644
> --- a/security/keys/request_key.c
> +++ b/security/keys/request_key.c
> @@ -38,9 +38,12 @@ static void cache_requested_key(struct key *key)
> =C2=A0#ifdef CONFIG_KEYS_REQUEST_CACHE
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct task_struct *t =3D curr=
ent;
>=20
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 key_put(t->cached_requested_key);
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 t->cached_requested_key =3D key_get=
(key);
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 set_tsk_thread_flag(t, TIF_NOTIFY_R=
ESUME);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Do not cache key if it is a kern=
el thread */
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!(t->flags & PF_KTHREAD)) {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 key_put(t->cached_requested_key);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 t->cached_requested_key =3D key_get(key);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 set_tsk_thread_flag(t, TIF_NOTIFY_RESUME);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> =C2=A0#endif
> =C2=A0}
>=20
> --
> 2.25.1

BR, Jarkko
