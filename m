Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B4908E2F17
	for <lists+keyrings@lfdr.de>; Thu, 24 Oct 2019 12:32:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2438820AbfJXKcc (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 24 Oct 2019 06:32:32 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:30349 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S2438819AbfJXKcb (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 24 Oct 2019 06:32:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1571913150;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=LIKdOL11Ozx/PWJsb0Bia7eThEnrLMvgCNlbfPe+qhE=;
        b=A6haLsmVQpo3jaotn9t6Ons4ZkJCmT8W9/6y0h7sUEF2S4sectGklcYlaZirfZw1lEt00Z
        TVk5Mm9iStR5aEF692QjLseNb4oel55Nj3NGs+QU0y6TLXcUUxy8bvH5KWTFzCFtEsc0H0
        2+0a001R51C/itA4tz1DRHg9dkuoAwM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-52-kf6BhbzrPzCAs2tEP3KZ1A-1; Thu, 24 Oct 2019 06:32:29 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C9DA8107AD33;
        Thu, 24 Oct 2019 10:32:26 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-121-40.rdu2.redhat.com [10.10.121.40])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 14CB41001B30;
        Thu, 24 Oct 2019 10:32:23 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
        Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
        Kingdom.
        Registered in England and Wales under Company Registration No. 3798903
From:   David Howells <dhowells@redhat.com>
In-Reply-To: <157186186167.3995.7568100174393739543.stgit@warthog.procyon.org.uk>
References: <157186186167.3995.7568100174393739543.stgit@warthog.procyon.org.uk> <157186182463.3995.13922458878706311997.stgit@warthog.procyon.org.uk>
To:     torvalds@linux-foundation.org
Cc:     dhowells@redhat.com, Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Peter Zijlstra <peterz@infradead.org>,
        nicolas.dichtel@6wind.com, raven@themaw.net,
        Christian Brauner <christian@brauner.io>,
        keyrings@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-block@vger.kernel.org, linux-security-module@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, linux-api@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 04/10] pipe: Use head and tail pointers for the ring, not cursor and length [ver #2]
MIME-Version: 1.0
Content-ID: <13193.1571913143.1@warthog.procyon.org.uk>
Date:   Thu, 24 Oct 2019 11:32:23 +0100
Message-ID: <13194.1571913143@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: kf6BhbzrPzCAs2tEP3KZ1A-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

I've pushed to git a new version that fixes an incomplete conversion in
pipe_zero(), ports the powerpc virtio_console driver and fixes a comment in
splice.

David

