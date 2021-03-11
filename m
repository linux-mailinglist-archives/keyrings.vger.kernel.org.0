Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E7ABE336EF9
	for <lists+keyrings@lfdr.de>; Thu, 11 Mar 2021 10:34:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231960AbhCKJeJ (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 11 Mar 2021 04:34:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22654 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231937AbhCKJeG (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 11 Mar 2021 04:34:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1615455246;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=RQg4MlrgZ5H1BtL2yvWxd343lPbOe8VMobn508aPtBQ=;
        b=ZUSMg9vOHgb7AoJz8P0cKWEp9k70zjHcHAi2ReaNbxpHSS8RQGEQm4LIudCFZQubEcYIiF
        wN/KxcrBvyiqCkExa0s6pDPKyxc0rTWFYmxfB9ok67ZZrD6Nwn4M9ZGt8nQYVGdjHvo1ti
        X502uk/OiZYgdsc7cowiUKCwAD6zEk4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-149-03jMDIHuPyOpg5XCrlF6UA-1; Thu, 11 Mar 2021 04:34:04 -0500
X-MC-Unique: 03jMDIHuPyOpg5XCrlF6UA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0197880159E;
        Thu, 11 Mar 2021 09:34:03 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-118-152.rdu2.redhat.com [10.10.118.152])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 0125D3CC7;
        Thu, 11 Mar 2021 09:34:01 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
        Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
        Kingdom.
        Registered in England and Wales under Company Registration No. 3798903
From:   David Howells <dhowells@redhat.com>
In-Reply-To: <91190.1615444370@turing-police>
References: <91190.1615444370@turing-police>
To:     =?us-ascii?Q?Valdis_=3D=3Futf-8=3FQ=3FKl=3Dc4=3D93tnieks=3F=3D?= 
        <valdis.kletnieks@vt.edu>
Cc:     dhowells@redhat.com, David Woodhouse <dwmw2@infradead.org>,
        keyrings@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: 'make O=' indigestion with module signing
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date:   Thu, 11 Mar 2021 09:34:01 +0000
Message-ID: <860945.1615455241@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Valdis Kl=C4=93tnieks <valdis.kletnieks@vt.edu> wrote:

> What i *expected* was that multiple builds with different O=3D would each
> generate themselves a unique signing key and put it in their own O=3D dir=
ectory
> and stay out of each other's way.

Hmmm...  Works for me.  I use separate build dirs all the time.

What version of the kernel are you using and what's the build command line -
in particular the full O=3D option?

David

