Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 57CEA6B98D8
	for <lists+keyrings@lfdr.de>; Tue, 14 Mar 2023 16:19:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231281AbjCNPTn (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 14 Mar 2023 11:19:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231670AbjCNPTj (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Tue, 14 Mar 2023 11:19:39 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86CFBA568C
        for <keyrings@vger.kernel.org>; Tue, 14 Mar 2023 08:18:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1678807123;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=OB8UmA3TyK//k5pjqN7J8vE+g35JvOJU+Pzqo6cEscs=;
        b=EwBVdCitakMOj3g5Kz70IIHIxLDgUJ4bqb5C7Cu6ypWJ/oCEXnPXH9Whp3Ot1RkjP4/aIC
        ZSql4bBOMVPhweYY1ETT8t7FOzBQty8MA0SQ8S28q4ABJijGnZMuxeK0q/Vb2enicn9QOV
        n9f7WxX0dXHjvSyEjDALsZDZ11S8TyI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-512-Q2wXxMiiPOOAtSW4AGZzRA-1; Tue, 14 Mar 2023 11:18:39 -0400
X-MC-Unique: Q2wXxMiiPOOAtSW4AGZzRA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3976E3C11A04;
        Tue, 14 Mar 2023 15:18:39 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.33.36.18])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 67E0A2166B26;
        Tue, 14 Mar 2023 15:18:38 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
        Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
        Kingdom.
        Registered in England and Wales under Company Registration No. 3798903
From:   David Howells <dhowells@redhat.com>
In-Reply-To: <CAGypqWw951d=zYRbdgNR4snUDvJhWL=q3=WOyh7HhSJupjz2vA@mail.gmail.com>
References: <CAGypqWw951d=zYRbdgNR4snUDvJhWL=q3=WOyh7HhSJupjz2vA@mail.gmail.com>
To:     Bharath SM <bharathsm.hsk@gmail.com>
Cc:     dhowells@redhat.com, jarkko@kernel.org, keyrings@vger.kernel.org,
        Bharath S M <bharathsm@microsoft.com>,
        Shyam Prasad N <nspmangalore@gmail.com>,
        Steve French <smfrench@gmail.com>
Subject: Re: [PATCH] KEYS: Do not cache key in task struct if key is requested from kernel thread
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <3689577.1678807117.1@warthog.procyon.org.uk>
Date:   Tue, 14 Mar 2023 15:18:37 +0000
Message-ID: <3689578.1678807117@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Bharath SM <bharathsm.hsk@gmail.com> wrote:

> diff --git a/security/keys/request_key.c b/security/keys/request_key.c
> index 2da4404276f0..07a0ef2baacd 100644
> --- a/security/keys/request_key.c
> +++ b/security/keys/request_key.c
> @@ -38,9 +38,12 @@ static void cache_requested_key(struct key *key)
>  #ifdef CONFIG_KEYS_REQUEST_CACHE
>         struct task_struct *t = current;
> 
> -       key_put(t->cached_requested_key);
> -       t->cached_requested_key = key_get(key);
> -       set_tsk_thread_flag(t, TIF_NOTIFY_RESUME);
> +       /* Do not cache key if it is a kernel thread */
> +       if (!(t->flags & PF_KTHREAD)) {
> +               key_put(t->cached_requested_key);
> +               t->cached_requested_key = key_get(key);
> +               set_tsk_thread_flag(t, TIF_NOTIFY_RESUME);
> +       }
>  #endif
>  }

It seems all the tabs got converted into spaces.  I'll manually apply it.

David

