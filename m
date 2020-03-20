Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 95DD818C95E
	for <lists+keyrings@lfdr.de>; Fri, 20 Mar 2020 09:59:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726602AbgCTI7c (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Fri, 20 Mar 2020 04:59:32 -0400
Received: from us-smtp-delivery-74.mimecast.com ([216.205.24.74]:46636 "EHLO
        us-smtp-delivery-74.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726232AbgCTI7c (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Fri, 20 Mar 2020 04:59:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1584694770;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=MHbNt8+nZTfk377bXnCR8K6G8LUG3EI1MJ/vvpQK+eU=;
        b=B9WPJTsfB1L5BjP78fsK+fzxmicaAHs2uKaafHCSX2ypa9wtKQsNlThADONtq9WTya0jdc
        TxlShH3GqeYxP5mOjhv1b/PtEkaE3AjCM92dpP1igmsy2npGNFZjtPLC8vzWB/v4JWB1DI
        XgYc8LaPkIeZA20Y0ZLouin2FxwXai8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-385-Nq5C8QRNNDi52pOmcKV1fA-1; Fri, 20 Mar 2020 04:59:27 -0400
X-MC-Unique: Nq5C8QRNNDi52pOmcKV1fA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E99FC8017CC;
        Fri, 20 Mar 2020 08:59:25 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-113-126.rdu2.redhat.com [10.10.113.126])
        by smtp.corp.redhat.com (Postfix) with ESMTP id C4E2A73879;
        Fri, 20 Mar 2020 08:59:24 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
        Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
        Kingdom.
        Registered in England and Wales under Company Registration No. 3798903
From:   David Howells <dhowells@redhat.com>
In-Reply-To: <20200320014513.GA183331@linux.intel.com>
References: <20200320014513.GA183331@linux.intel.com> <20200319211528.GA167847@linux.intel.com> <8cc77e68-244e-3ac8-dea6-edc51cf372df@cn.fujitsu.com> <20200228033009.GA932@sol.localdomain> <1582864911-30823-1-git-send-email-xuyang2018.jy@cn.fujitsu.com> <20200303041732.GA14653@sol.localdomain> <3166161.1584630501@warthog.procyon.org.uk> <3203731.1584653413@warthog.procyon.org.uk>
To:     Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Cc:     dhowells@redhat.com, Yang Xu <xuyang2018.jy@cn.fujitsu.com>,
        Eric Biggers <ebiggers@kernel.org>, keyrings@vger.kernel.org
Subject: Re: [PATCH v3] KEYS: reaching the keys quotas correctly
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <3285405.1584694764.1@warthog.procyon.org.uk>
Date:   Fri, 20 Mar 2020 08:59:24 +0000
Message-ID: <3285407.1584694764@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com> wrote:

> > > Unfortunately it is already hanging here:
> > > 
> > > https://www.lkml.org/lkml/2020/3/15/314
> > 
> > Hanging? Or queued?
> 
> Not yet queued.
> 
> Should I request to withdraw it? There is still time to do that.

I was making up a series of fix patches to send to Linus.  If you want to send
your queue instead, you can stick my Acked-by on this patch.

David

