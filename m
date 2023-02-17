Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2F70469B408
	for <lists+keyrings@lfdr.de>; Fri, 17 Feb 2023 21:37:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229523AbjBQUhR (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Fri, 17 Feb 2023 15:37:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229510AbjBQUhQ (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Fri, 17 Feb 2023 15:37:16 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DD7D604E5
        for <keyrings@vger.kernel.org>; Fri, 17 Feb 2023 12:36:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1676666189;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=YY/M+1uWmJjAoZXBdIpnul200AbBaSmLhynFa83irDw=;
        b=WwOmVLVv+vhxPGzDi4a4T8cMcX1kKquFGebpzr3hN2Ttch5N1er9SFvZ02VJ3RDCNiu5bT
        ZDmcZhuAeHm7TTUCs4yef5lUm4Fl+r8tT36hogF9Y9d6zE1OU5h0hGUSD4RWKMYuvoxK5G
        2ARcoGtaC8r4tOszD9zAYRnxKK4szf4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-613-RSVFPOsOPvqPiK4POUP3Yw-1; Fri, 17 Feb 2023 15:36:28 -0500
X-MC-Unique: RSVFPOsOPvqPiK4POUP3Yw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D30AC382C985
        for <keyrings@vger.kernel.org>; Fri, 17 Feb 2023 20:36:27 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.33.36.24])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 71C14140EBF4;
        Fri, 17 Feb 2023 20:36:27 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
        Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
        Kingdom.
        Registered in England and Wales under Company Registration No. 3798903
From:   David Howells <dhowells@redhat.com>
In-Reply-To: <20230217201435.39784-2-rharwood@redhat.com>
References: <20230217201435.39784-2-rharwood@redhat.com> <20230217201435.39784-1-rharwood@redhat.com>
To:     Robbie Harwood <rharwood@redhat.com>
Cc:     dhowells@redhat.com, keyrings@vger.kernel.org
Subject: Re: [PATCH v1 1/2] verify_pefile: relax wrapper length check
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <513394.1676666186.1@warthog.procyon.org.uk>
Content-Transfer-Encoding: quoted-printable
Date:   Fri, 17 Feb 2023 20:36:26 +0000
Message-ID: <513395.1676666186@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
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

> See-also: https://learn.microsoft.com/en-us/windows/win32/debug/pe-forma=
t#the-attribute-certificate-table-image-only
> See-also: https://github.com/rhboot/pesign

These should be "Link:" I think.

Apart from that:

Acked-by: David Howells <dhowells@redhat.com>

