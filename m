Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 087786B9913
	for <lists+keyrings@lfdr.de>; Tue, 14 Mar 2023 16:28:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230521AbjCNP26 (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 14 Mar 2023 11:28:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231300AbjCNP2x (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Tue, 14 Mar 2023 11:28:53 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B2DA618F
        for <keyrings@vger.kernel.org>; Tue, 14 Mar 2023 08:28:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1678807691;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=tFZcXuDyeJBIxrVmYzzLtkzEjwn3oIsWa8FwG7Q8XSc=;
        b=PvygWPKiuiaYdV8Hos8DacreQ5ysCL/cKX5CmoRtVdo3Yu257IHWWe2lb0jZy3u/Wi3btB
        bOHtLQHPcKbB6eFR+ejekH6vPtK0LJqKM5ivBknvz2vozqWwnAyfo7bo3/wToEpMAdT9Co
        iwcphv8CwqYzIpi8bm7RnAm0kK7oDTo=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-520-7oRTjnlfMn-E7l0Udje91w-1; Tue, 14 Mar 2023 11:27:34 -0400
X-MC-Unique: 7oRTjnlfMn-E7l0Udje91w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9F1C228043C3;
        Tue, 14 Mar 2023 15:27:33 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.33.36.18])
        by smtp.corp.redhat.com (Postfix) with ESMTP id CA4544042AC5;
        Tue, 14 Mar 2023 15:27:32 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
        Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
        Kingdom.
        Registered in England and Wales under Company Registration No. 3798903
From:   David Howells <dhowells@redhat.com>
In-Reply-To: <ZBBVYX7O7QV8TFL7@kernel.org>
References: <ZBBVYX7O7QV8TFL7@kernel.org> <CAGypqWw951d=zYRbdgNR4snUDvJhWL=q3=WOyh7HhSJupjz2vA@mail.gmail.com> <c0530ea97166463bd2129da160c3ef0e6c72a8fb.camel@kernel.org> <CAGypqWwhTDX2F5m4o-og40j5ddJrM2MWiheDMjbB07Qqb3NuEw@mail.gmail.com>
To:     Jarkko Sakkinen <jarkko@kernel.org>
Cc:     dhowells@redhat.com, Bharath SM <bharathsm.hsk@gmail.com>,
        keyrings@vger.kernel.org, Bharath S M <bharathsm@microsoft.com>,
        Shyam Prasad N <nspmangalore@gmail.com>,
        Steve French <smfrench@gmail.com>
Subject: Re: [PATCH] KEYS: Do not cache key in task struct if key is requested from kernel thread
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <3711675.1678807652.1@warthog.procyon.org.uk>
Content-Transfer-Encoding: quoted-printable
Date:   Tue, 14 Mar 2023 15:27:32 +0000
Message-ID: <3711676.1678807652@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Jarkko Sakkinen <jarkko@kernel.org> wrote:

> Please summarize this to the commit message it is useful stuff. With
> this report included the patch could should also have a fixes tag.

I've expanded the commit message to:

    keys: Do not cache key in task struct if key is requested from kernel =
thread
    =

    The key which gets cached in task structure from a kernel thread does =
not
    get invalidated even after expiry.  Due to which, a new key request fr=
om
    kernel thread will be served with the cached key if it's present in ta=
sk
    struct irrespective of the key validity.  The change is to not cache k=
ey in
    task_struct when key requested from kernel thread so that kernel threa=
d
    gets a valid key on every key request.
    =

    The problem has been seen with the cifs module doing DNS lookups from =
a
    kernel thread and the results getting pinned by being attached to that
    kernel thread's cache - and thus not something that can be easily got =
rid
    of.  The cache would ordinarily be cleared by notify-resume, but kerne=
l
    threads don't do that.
    =

    This isn't seen with AFS because AFS is doing request_key() within the
    kernel half of a user thread - which will do notify-resume.
    =

    Signed-off-by: Bharath SM <bharathsm@microsoft.com>
    Signed-off-by: David Howells <dhowells@redhat.com>
    cc: Jarkko Sakkinen <jarkko@kernel.org>
    cc: Shyam Prasad N <nspmangalore@gmail.com>
    cc: Steve French <smfrench@gmail.com>
    cc: keyrings@vger.kernel.org
    cc: linux-cifs@vger.kernel.org
    cc: linux-fsdevel@vger.kernel.org

David

