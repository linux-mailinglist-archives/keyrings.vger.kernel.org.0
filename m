Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 02D5618BA89
	for <lists+keyrings@lfdr.de>; Thu, 19 Mar 2020 16:08:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727002AbgCSPI0 (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 19 Mar 2020 11:08:26 -0400
Received: from us-smtp-delivery-74.mimecast.com ([63.128.21.74]:25391 "EHLO
        us-smtp-delivery-74.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726912AbgCSPI0 (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 19 Mar 2020 11:08:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1584630506;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=bXGQDPALVgGe/Cxxrk54dWxaO19HYxLjSsoq3aIGpkM=;
        b=WVrQddrzWhbZaY1qrRPLIJ8TEXIXLTj0gxVC3Yv0XyXq0fjn7n8w9xGmBAflBkcfnNpyee
        DxVqpFJHCSOTSrTGYI5w+r7Ie8N8meslv6lRzmVWoPZAEts+k0m9lXkLQKyjRK17ffxVg9
        pR6Pr041d8jnWbkaoDUICg//c/LD7AU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-460-zVapkhVxMsO_Go7aTXfEYw-1; Thu, 19 Mar 2020 11:08:24 -0400
X-MC-Unique: zVapkhVxMsO_Go7aTXfEYw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0D9661857C00;
        Thu, 19 Mar 2020 15:08:23 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-113-126.rdu2.redhat.com [10.10.113.126])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 175FC3D92;
        Thu, 19 Mar 2020 15:08:21 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
        Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
        Kingdom.
        Registered in England and Wales under Company Registration No. 3798903
From:   David Howells <dhowells@redhat.com>
In-Reply-To: <8cc77e68-244e-3ac8-dea6-edc51cf372df@cn.fujitsu.com>
References: <8cc77e68-244e-3ac8-dea6-edc51cf372df@cn.fujitsu.com> <20200228033009.GA932@sol.localdomain> <1582864911-30823-1-git-send-email-xuyang2018.jy@cn.fujitsu.com> <20200303041732.GA14653@sol.localdomain>
To:     Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Cc:     dhowells@redhat.com, Eric Biggers <ebiggers@kernel.org>,
        jarkko.sakkinen@linux.intel.com, keyrings@vger.kernel.org
Subject: Re: [PATCH v3] KEYS: reaching the keys quotas correctly
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <3166160.1584630501.1@warthog.procyon.org.uk>
Date:   Thu, 19 Mar 2020 15:08:21 +0000
Message-ID: <3166161.1584630501@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

How about:

	keys: Fix the keys quotas limit check

It's a bit unfortunate that "key" is also usable as an adjective.

David

