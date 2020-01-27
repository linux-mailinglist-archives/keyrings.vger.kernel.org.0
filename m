Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BD73E14A326
	for <lists+keyrings@lfdr.de>; Mon, 27 Jan 2020 12:39:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727520AbgA0Ljn (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Mon, 27 Jan 2020 06:39:43 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:32845 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1730294AbgA0Ljm (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Mon, 27 Jan 2020 06:39:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1580125181;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=+7W2zyC7XytaLgF9eenYTPBkYQQ7A4oiE0WMio8GFgc=;
        b=aleUufWQ3l8GX2Fyc9Nmzpuq9Cz4t2LbQ4SaZTAU98/Nzk9QRXqiAx6/Lb4d+KnqSBLIxH
        21Z+GhkyqwvpG/a9EWeWA8qHLtzJcJHw69HFD+a4AO0UL8gkPaJdfXadMVZzqxsZwYy5ch
        NKRxCTYJanF3Xt9kWOgz0ISQNZ8Gnt0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-115-UkgspV3UPPaycqOGmDdcFA-1; Mon, 27 Jan 2020 06:39:38 -0500
X-MC-Unique: UkgspV3UPPaycqOGmDdcFA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8D139DB82;
        Mon, 27 Jan 2020 11:39:36 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-120-99.rdu2.redhat.com [10.10.120.99])
        by smtp.corp.redhat.com (Postfix) with ESMTP id F3DD287026;
        Mon, 27 Jan 2020 11:39:34 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
        Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
        Kingdom.
        Registered in England and Wales under Company Registration No. 3798903
From:   David Howells <dhowells@redhat.com>
In-Reply-To: <af9dcaa7-6e4f-281a-2bae-fb605cc55d2d@virtuozzo.com>
References: <af9dcaa7-6e4f-281a-2bae-fb605cc55d2d@virtuozzo.com>
To:     Vasily Averin <vvs@virtuozzo.com>
Cc:     dhowells@redhat.com, keyrings@vger.kernel.org,
        linux-security-module@vger.kernel.org,
        Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
        James Morris <jmorris@namei.org>,
        "Serge E. Hallyn" <serge@hallyn.com>
Subject: Re: [PATCH 1/1] proc_keys_next should increase position index
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <1451507.1580125174.1@warthog.procyon.org.uk>
Date:   Mon, 27 Jan 2020 11:39:34 +0000
Message-ID: <1451508.1580125174@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

I don't see the effect you're talking about with /proc/keys.  I see the
following:

	[root@andromeda ~]# dd if=/proc/keys bs=40 skip=1
	dd: /proc/keys: cannot skip to specified offset

and then it follows up with the normal content with no obvious duplicates (the
lines are numbered ascendingly in the first column).

I think I may be being confused by what you mean by "the last line".

David

