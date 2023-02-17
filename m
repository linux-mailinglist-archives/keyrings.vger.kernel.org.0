Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4832969B40A
	for <lists+keyrings@lfdr.de>; Fri, 17 Feb 2023 21:38:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229644AbjBQUiE (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Fri, 17 Feb 2023 15:38:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229510AbjBQUiE (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Fri, 17 Feb 2023 15:38:04 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 239AC60F9E
        for <keyrings@vger.kernel.org>; Fri, 17 Feb 2023 12:37:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1676666234;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=119wxXgezxpOHxSCYpEJOooTZ3WjAfPGcRTU8gk3U5w=;
        b=d86J21ES7p1SU2QCU2BOnyVKS2wbCRyqFmU96fitTR1I1PJsdYEcvsEMzhyszDiE1kX60k
        zSarOT1WIyXe6JlARvl0+MsQ8d5A1Us/gFrKpg1CvudjM8Zrkw66rVw9lCa46kF1OHqgyY
        3HIBnBkB0e2LQA55PgXuzMioUqWzrBY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-583-JyIrDOtpMwqtLzA6LL-r0A-1; Fri, 17 Feb 2023 15:37:08 -0500
X-MC-Unique: JyIrDOtpMwqtLzA6LL-r0A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BC7BD382C97B
        for <keyrings@vger.kernel.org>; Fri, 17 Feb 2023 20:37:07 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.33.36.24])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 5BC672166B30;
        Fri, 17 Feb 2023 20:37:07 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
        Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
        Kingdom.
        Registered in England and Wales under Company Registration No. 3798903
From:   David Howells <dhowells@redhat.com>
In-Reply-To: <20230217201435.39784-3-rharwood@redhat.com>
References: <20230217201435.39784-3-rharwood@redhat.com> <20230217201435.39784-1-rharwood@redhat.com>
To:     Robbie Harwood <rharwood@redhat.com>
Cc:     dhowells@redhat.com, keyrings@vger.kernel.org
Subject: Re: [PATCH v1 2/2] asymmetric_keys: log on fatal failures in PE/pkcs7
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <519728.1676666226.1@warthog.procyon.org.uk>
Date:   Fri, 17 Feb 2023 20:37:06 +0000
Message-ID: <519730.1676666226@warthog.procyon.org.uk>
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

Robbie Harwood <rharwood@redhat.com> wrote:

> These particular errors can be encountered while trying to kexec when
> secureboot lockdown is in place.  Without this change, even with a
> signed debug build, one still needs to reboot the machine to add the
> appropriate dyndbg parameters (since lockdown blocks debugfs).
> 
> Accordingly, upgrade all pr_debug() before fatal error into pr_info().

I wonder if they should then be pr_warn() instead.

> Signed-off-by: Robbie Harwood <rharwood@redhat.com>

Acked-by: David Howells <dhowells@redhat.com>

