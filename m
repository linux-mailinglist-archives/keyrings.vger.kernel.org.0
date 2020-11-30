Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 70E112C80E0
	for <lists+keyrings@lfdr.de>; Mon, 30 Nov 2020 10:24:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726249AbgK3JXH (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Mon, 30 Nov 2020 04:23:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:50472 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725902AbgK3JXH (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Mon, 30 Nov 2020 04:23:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1606728101;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=px5S5/2ACTb7LrXOQlU1HB+xECEC+xUcw2a+QHxz+2k=;
        b=dtar1mQqyd4f7Ib9fm2UhdwghASCZUGHVnkHBPBJH9JfbaOQZamFO/WYf6p446kHS1SB83
        S7HO6EcAgTFFsNRIK13brVxAR2/HZwQ/gQoK7CWJvaPTkVaP6UnN7SNrbbpN959rkmWt1t
        KUynsEoQywMtf87400LCeS1xu5E50Xs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-584-lg6gJ8jBN6KqDllTvU0sYw-1; Mon, 30 Nov 2020 04:21:39 -0500
X-MC-Unique: lg6gJ8jBN6KqDllTvU0sYw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D538C80B70A;
        Mon, 30 Nov 2020 09:21:36 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-112-159.rdu2.redhat.com [10.10.112.159])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 0011360C4D;
        Mon, 30 Nov 2020 09:21:32 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
        Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
        Kingdom.
        Registered in England and Wales under Company Registration No. 3798903
From:   David Howells <dhowells@redhat.com>
In-Reply-To: <20201129033859.GG39488@kernel.org>
References: <20201129033859.GG39488@kernel.org> <160649552401.2744658.15096366594785577090.stgit@warthog.procyon.org.uk>
To:     Jarkko Sakkinen <jarkko@kernel.org>
Cc:     dhowells@redhat.com,
        Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
        James Morris <jmorris@namei.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Jarkko Sakkinen <jarkko.sakkinen@iki.fi>,
        Jann Horn <jannh@google.com>,
        Gabriel Krisman Bertazi <krisman@collabora.com>,
        "Alexander A. Klimov" <grandmaster@al2klimov.de>,
        Ben Boeckel <mathstuf@gmail.com>,
        linux-security-module@vger.kernel.org,
        Denis Efremov <efremov@linux.com>, keyrings@vger.kernel.org,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Tom Rix <trix@redhat.com>,
        "Serge E. Hallyn" <serge@hallyn.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/9] keys: Miscellaneous fixes
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <3093310.1606728092.1@warthog.procyon.org.uk>
Date:   Mon, 30 Nov 2020 09:21:32 +0000
Message-ID: <3093311.1606728092@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Jarkko Sakkinen <jarkko@kernel.org> wrote:

> I think that looks good, thank you. I'm sending PR next week. Should I
> bundle those to that?

I've updated the branch to include an ack from you, plus added the
semicolon-removal patch and a #include-removal patch.

You can try sending them on, though I don't think any of them are really
critical patches (and we are in -rc6).

David

