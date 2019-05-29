Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5159A2E780
	for <lists+keyrings@lfdr.de>; Wed, 29 May 2019 23:35:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726099AbfE2Vey (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 29 May 2019 17:34:54 -0400
Received: from mx1.redhat.com ([209.132.183.28]:33540 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726018AbfE2Vey (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Wed, 29 May 2019 17:34:54 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 0B38A8F91C;
        Wed, 29 May 2019 21:34:49 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-120-173.rdu2.redhat.com [10.10.120.173])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 33D3D9CAE;
        Wed, 29 May 2019 21:34:45 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
        Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
        Kingdom.
        Registered in England and Wales under Company Registration No. 3798903
From:   David Howells <dhowells@redhat.com>
In-Reply-To: <alpine.LRH.2.21.1905290646010.31297@namei.org>
References: <alpine.LRH.2.21.1905290646010.31297@namei.org> <155856408314.10428.17035328117829912815.stgit@warthog.procyon.org.uk> <155856412507.10428.15987388402707639951.stgit@warthog.procyon.org.uk>
To:     James Morris <jmorris@namei.org>
Cc:     dhowells@redhat.com, keyrings@vger.kernel.org,
        linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/7] keys: Add a keyctl to move a key between keyrings
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <19363.1559165684.1@warthog.procyon.org.uk>
Date:   Wed, 29 May 2019 22:34:44 +0100
Message-ID: <19364.1559165684@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.26]); Wed, 29 May 2019 21:34:54 +0000 (UTC)
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

James Morris <jmorris@namei.org> wrote:

> > +
> > +	if (flags & ~KEYCTL_MOVE_EXCL)
> > +		return -EINVAL;
> > +
> > +	key_ref = lookup_user_key(id, KEY_LOOKUP_CREATE, KEY_NEED_LINK);
> > +	if (IS_ERR(key_ref)) {
> > +		ret = PTR_ERR(key_ref);
> > +		goto error;
> > +	}
> 
> This could probably be a simple return, as there is no cleanup.

Changed.

David
