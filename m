Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D91621D7ABA
	for <lists+keyrings@lfdr.de>; Mon, 18 May 2020 16:09:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726945AbgEROJb (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Mon, 18 May 2020 10:09:31 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:56086 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727882AbgEROJa (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Mon, 18 May 2020 10:09:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1589810969;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=vQQaQ/avTvuFtQHQK1QliBct9lrv4FiG5moHpisL6LI=;
        b=eGzBqRqHcn8eTZR91QroswJMToB09lreMdqq51kNELIz2k8R5Y+YCgchc/CASqMGcqPjHa
        l3vFsS98B5AXLLQx/iwTyk4iggWeKZnIqkyfUbqzmbrXnE59e49LuM45g6H9Wwv0E+f/iC
        lJXiC8DfV7i2tc+0fYJVRLFKQmDSQjg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-246-gfvETf5vNiG1UPgFGIFTpA-1; Mon, 18 May 2020 10:09:25 -0400
X-MC-Unique: gfvETf5vNiG1UPgFGIFTpA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4F526460;
        Mon, 18 May 2020 14:09:24 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-112-95.rdu2.redhat.com [10.10.112.95])
        by smtp.corp.redhat.com (Postfix) with ESMTP id BE7015C1B2;
        Mon, 18 May 2020 14:09:22 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
        Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
        Kingdom.
        Registered in England and Wales under Company Registration No. 3798903
From:   David Howells <dhowells@redhat.com>
In-Reply-To: <20200516003917.2035545-2-list.lkml.keyrings@me.benboeckel.net>
References: <20200516003917.2035545-2-list.lkml.keyrings@me.benboeckel.net> <20200516003917.2035545-1-list.lkml.keyrings@me.benboeckel.net>
To:     Ben Boeckel <me@benboeckel.net>
Cc:     dhowells@redhat.com, keyrings@vger.kernel.org,
        Ben Boeckel <mathstuf@gmail.com>,
        jarkko.sakkinen@linux.intel.com, corbet@lwn.net,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] Documentation: security: core.rst: add missing argument
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <870600.1589810961.1@warthog.procyon.org.uk>
Date:   Mon, 18 May 2020 15:09:21 +0100
Message-ID: <870601.1589810961@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Ben Boeckel <me@benboeckel.net> wrote:

>  	long keyctl(KEYCTL_PKEY_QUERY,
>  		    key_serial_t key_id, unsigned long reserved,
> +		    const char* params,
>  		    struct keyctl_pkey_query *info);

"const char *params".  I fixed that and applied it.

David

