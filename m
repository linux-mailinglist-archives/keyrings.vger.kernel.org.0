Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C4013587CA
	for <lists+keyrings@lfdr.de>; Thu,  8 Apr 2021 17:06:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231848AbhDHPGS (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 8 Apr 2021 11:06:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56732 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232059AbhDHPGR (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 8 Apr 2021 11:06:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1617894365;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=E0p3yL+ASSb4kIMFODsQ6OMg+WKi8voPSOQ8W8M/8ng=;
        b=WRBZHVtC/HAMHLoXi8QJGRtSD/3KSJW2C2ApIdgSsRQgxKaSrlTBuBkXSG0oEh5jiNQWRE
        /4u3H/FWSr+Dr26RcecmYtTvYCu2uF7OKXKfaP+O6qLZ9jgmsofH8JrTVZqobx9QcoRCE6
        xEuM51WqhLQgqOdJcZxmqZ7BOxo4xZY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-571-IwbuC1WfO5CGdjKUhQ1UIg-1; Thu, 08 Apr 2021 11:06:02 -0400
X-MC-Unique: IwbuC1WfO5CGdjKUhQ1UIg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 75E4D6D581;
        Thu,  8 Apr 2021 15:05:59 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-119-35.rdu2.redhat.com [10.10.119.35])
        by smtp.corp.redhat.com (Postfix) with ESMTP id DFA2819C66;
        Thu,  8 Apr 2021 15:05:55 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
        Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
        Kingdom.
        Registered in England and Wales under Company Registration No. 3798903
From:   David Howells <dhowells@redhat.com>
In-Reply-To: <20210408141516.11369-19-varad.gautam@suse.com>
References: <20210408141516.11369-19-varad.gautam@suse.com> <20210408141516.11369-1-varad.gautam@suse.com>
To:     Varad Gautam <varad.gautam@suse.com>
Cc:     dhowells@redhat.com, linux-crypto@vger.kernel.org,
        herbert@gondor.apana.org.au, davem@davemloft.net, vt@altlinux.org,
        tianjia.zhang@linux.alibaba.com, keyrings@vger.kernel.org,
        linux-kernel@vger.kernel.org, jarkko@kernel.org,
        James Morris <jmorris@namei.org>,
        "Serge E. Hallyn" <serge@hallyn.com>,
        linux-security-module@vger.kernel.org (open list:SECURITY SUBSYSTEM)
Subject: Re: [PATCH v2 18/18] keyctl_pkey: Add pkey parameters slen and mgfhash for PSS
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <12845.1617894354.1@warthog.procyon.org.uk>
Date:   Thu, 08 Apr 2021 16:05:55 +0100
Message-ID: <12846.1617894355@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Varad Gautam <varad.gautam@suse.com> wrote:

> +	Opt_slen,		/* "slen=<salt-length>" eg. "slen=32" */

"slen" seems a bit unobvious.  Maybe "saltlen=..."?

David

