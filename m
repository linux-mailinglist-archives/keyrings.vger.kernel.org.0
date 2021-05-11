Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D84137A4EF
	for <lists+keyrings@lfdr.de>; Tue, 11 May 2021 12:50:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230343AbhEKKv2 (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 11 May 2021 06:51:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46586 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230237AbhEKKv2 (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Tue, 11 May 2021 06:51:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1620730221;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=pDKfMCSmDrYbYLb3RYYkSWVBebsV7OFYV2lkS/seTjY=;
        b=X9q1DzlmW/HnYe7Icm34QGpe5i7YvcCha+iuozrJVUwNKwFBmX2DD8aSbOIoPrXhhGebQj
        dYosQe6Mw1DLGMbvYxLvOjZJEf6c0fqS0HBoGMz11xZcjCZW2WEhdgCpX2GSFlY/dH2WQ0
        PklDF8B72XIEpw/8oFp6HQKRlUtIXFQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-235-k5-U_UGNPKSvNGkjgNC1IQ-1; Tue, 11 May 2021 06:50:19 -0400
X-MC-Unique: k5-U_UGNPKSvNGkjgNC1IQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 765F6107ACCA;
        Tue, 11 May 2021 10:50:17 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.33.36.3])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 4E850189A5;
        Tue, 11 May 2021 10:50:15 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
        Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
        Kingdom.
        Registered in England and Wales under Company Registration No. 3798903
From:   David Howells <dhowells@redhat.com>
In-Reply-To: <1620467481-110575-1-git-send-email-yang.lee@linux.alibaba.com>
References: <1620467481-110575-1-git-send-email-yang.lee@linux.alibaba.com>
To:     Yang Li <yang.lee@linux.alibaba.com>
Cc:     dhowells@redhat.com, jarkko@kernel.org, jmorris@namei.org,
        serge@hallyn.com, nathan@kernel.org, ndesaulniers@google.com,
        keyrings@vger.kernel.org, linux-security-module@vger.kernel.org,
        linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com
Subject: Re: [PATCH] Keys: Remove redundant initialization of cred
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <2499882.1620730214.1@warthog.procyon.org.uk>
Date:   Tue, 11 May 2021 11:50:14 +0100
Message-ID: <2499883.1620730214@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Yang Li <yang.lee@linux.alibaba.com> wrote:

> -	const struct cred *cred = current_cred();
> +	const struct cred *cred;

Good catch, but it's probably the wrong fix.

In that function, there is:

	const struct cred *cred = current_cred();
	...
	cred = get_current_cred();
	keyring = keyring_alloc(desc, cred->fsuid, cred->fsgid, cred, ...);
	put_cred(cred);
	...
	sprintf(uid_str, "%d", from_kuid(&init_user_ns, cred->fsuid));
	...

So we get the creds again, but with a ref, and then drop after calling
keyring_alloc()... and then access cred again, which is dodgy - but we get
away with it because cred is still pinned by our task_struct.

I think what is actually needed is to remove the get_current_cred() and the
put_cred() calls, in which case, you want this:

	Fixes: d84f4f992cbd ("CRED: Inaugurate COW credentials")

David

