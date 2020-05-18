Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF3481D7C7D
	for <lists+keyrings@lfdr.de>; Mon, 18 May 2020 17:14:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727006AbgERPOj (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Mon, 18 May 2020 11:14:39 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:25339 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726958AbgERPOi (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Mon, 18 May 2020 11:14:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1589814877;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=C+olTwBlgSs4ipAcCb7zDXuZrql0pCto2QpWo685kbA=;
        b=ClDV2rCPBwsRvRaVucckDOXOWNJw7crMBeqzX8g72GEniNgdQwXuoZOSpf2xuuRiPTN4MX
        Pz5HUevxC3bruDbRuFJtFrA9navtiWuL15z4genNQiuzbI68KUaMw4xPKBlmDju6+iA/un
        vddlhvmnRCA7uUWqZ8gOD4wtMoMRfls=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-286-xJOkJ08JPgCBHtTeqDKQdg-1; Mon, 18 May 2020 11:14:26 -0400
X-MC-Unique: xJOkJ08JPgCBHtTeqDKQdg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B19341853B04;
        Mon, 18 May 2020 15:14:25 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-112-95.rdu2.redhat.com [10.10.112.95])
        by smtp.corp.redhat.com (Postfix) with ESMTP id C01AB2B7BB;
        Mon, 18 May 2020 15:14:24 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
        Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
        Kingdom.
        Registered in England and Wales under Company Registration No. 3798903
From:   David Howells <dhowells@redhat.com>
In-Reply-To: <20200507185710.GA14910@embeddedor>
References: <20200507185710.GA14910@embeddedor>
To:     "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc:     dhowells@redhat.com,
        Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
        keyrings@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] KEYS: Replace zero-length array with flexible-array
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <932085.1589814863.1@warthog.procyon.org.uk>
Date:   Mon, 18 May 2020 16:14:24 +0100
Message-ID: <932086.1589814864@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Gustavo A. R. Silva <gustavoars@kernel.org> wrote:

> The current codebase makes use of the zero-length array language
> extension to the C90 standard, but the preferred mechanism to declare
> variable-length types such as these ones is a flexible array member[1][2],
> introduced in C99:
> 
> struct foo {
>         int stuff;
>         struct boo array[];
> };
> 
> By making use of the mechanism above, we will get a compiler warning
> in case the flexible array does not occur last in the structure, which
> will help us prevent some kind of undefined behavior bugs from being
> inadvertently introduced[3] to the codebase from now on.
> 
> Also, notice that, dynamic memory allocations won't be affected by
> this change:
> 
> "Flexible array members have incomplete type, and so the sizeof operator
> may not be applied. As a quirk of the original implementation of
> zero-length arrays, sizeof evaluates to zero."[1]
> 
> sizeof(flexible-array-member) triggers a warning because flexible array
> members have incomplete type[1]. There are some instances of code in
> which the sizeof operator is being incorrectly/erroneously applied to
> zero-length arrays and the result is zero. Such instances may be hiding
> some bugs. So, this work (flexible-array member conversions) will also
> help to get completely rid of those sorts of issues.
> 
> This issue was found with the help of Coccinelle.
> 
> [1] https://gcc.gnu.org/onlinedocs/gcc/Zero-Length.html
> [2] https://github.com/KSPP/linux/issues/21
> [3] commit 76497732932f ("cxgb3/l2t: Fix undefined behaviour")
> 
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Applied to keys-next.

