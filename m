Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 614296C1CE5
	for <lists+keyrings@lfdr.de>; Mon, 20 Mar 2023 17:53:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232305AbjCTQxe (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Mon, 20 Mar 2023 12:53:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233119AbjCTQxI (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Mon, 20 Mar 2023 12:53:08 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 876744492
        for <keyrings@vger.kernel.org>; Mon, 20 Mar 2023 09:44:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1679330587;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=B0FisYSfm9kuFrQMDPgRvKdE0PDmnVTD6y2Zx4F8MmM=;
        b=B+xGGklKNv8OsV8nE6BabzDklWrf7OFw7J39jh6u2jnb2sBn85T/mSyw3qEGKfTXdZJT05
        tGOmJY4llKYu/NDuDBOmk3J8E1qWt37Y3Wk4pMcHFC7DewMXFVWF6bECZSJfId3pGnDd5w
        Hghux5j/0ENgCCaEhzbxWYGXFFZox/M=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-86-IY2emvfBM3OHu724PysDtQ-1; Mon, 20 Mar 2023 12:43:06 -0400
X-MC-Unique: IY2emvfBM3OHu724PysDtQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 089B63813F28
        for <keyrings@vger.kernel.org>; Mon, 20 Mar 2023 16:43:06 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.33.36.18])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 9898C85768;
        Mon, 20 Mar 2023 16:43:05 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
        Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
        Kingdom.
        Registered in England and Wales under Company Registration No. 3798903
From:   David Howells <dhowells@redhat.com>
In-Reply-To: <20220510110444.14192-1-vdronov@redhat.com>
References: <20220510110444.14192-1-vdronov@redhat.com>
To:     Vladis Dronov <vdronov@redhat.com>
Cc:     dhowells@redhat.com, keyrings@vger.kernel.org
Subject: Re: [PATCH] man: fix a formatting on the keyctl.1 man page
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <2011813.1679330584.1@warthog.procyon.org.uk>
Date:   Mon, 20 Mar 2023 16:43:04 +0000
Message-ID: <2011814.1679330584@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Vladis Dronov <vdronov@redhat.com> wrote:

> Fix a formatting and a command output on
> the keyctl.1 man page in a couple of places.
> 
> Signed-off-by: Vladis Dronov <vdronov@redhat.com>

Applied.

David

