Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D72D31F2A6
	for <lists+keyrings@lfdr.de>; Thu, 18 Feb 2021 23:58:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230125AbhBRW5W (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 18 Feb 2021 17:57:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48709 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230049AbhBRW5Q (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 18 Feb 2021 17:57:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1613688950;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Bto2giLcm9LzJ3vW7pdmAX2pydiCtw2Lsum5Poih1uE=;
        b=Aqt24iPIQi/MVTVTb0nk3rdbHnabj+75cNmb3BmYemj7aEvFLO+KYRcCJY70U3BS3SGrqE
        PSKZf1/c1UfQCGV+j1bCTF68VlL06N6pJL4o9MD1nv71JXHNdeINN3mnzYgH2m6qzXaN6B
        HxujbVvYnPSxaHTBJtMwYq7O2ARSV9o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-157-LoTsrVf5Odakt9F_aaswNA-1; Thu, 18 Feb 2021 17:55:46 -0500
X-MC-Unique: LoTsrVf5Odakt9F_aaswNA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C433C107ACE4;
        Thu, 18 Feb 2021 22:55:44 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-119-68.rdu2.redhat.com [10.10.119.68])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 1DA2D18F0A;
        Thu, 18 Feb 2021 22:55:42 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
        Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
        Kingdom.
        Registered in England and Wales under Company Registration No. 3798903
From:   David Howells <dhowells@redhat.com>
In-Reply-To: <ca631011-08c2-d44d-cce9-436a6a08405f@digikod.net>
References: <ca631011-08c2-d44d-cce9-436a6a08405f@digikod.net> <160751619550.1238376.2380930476046994051.stgit@warthog.procyon.org.uk> <160751606428.1238376.14935502103503420781.stgit@warthog.procyon.org.uk> <2031808.1613665474@warthog.procyon.org.uk>
To:     =?us-ascii?Q?=3D=3FUTF-8=3FQ=3FMicka=3Dc3=3Dabl=5FSala=3Dc3=3Dbcn=3F?=
         =?us-ascii?Q?=3D?= <mic@digikod.net>
Cc:     dhowells@redhat.com, Jarkko Sakkinen <jarkko@kernel.org>,
        =?us-ascii?Q?=3D=3FUTF-8=3FQ=3FMicka=3Dc3=3Dabl?=
         =?us-ascii?Q?=5FSala=3Dc3=3Dbcn=3F=3D?= <mic@linux.microsoft.com>,
        Mimi Zohar <zohar@linux.vnet.ibm.com>,
        David Woodhouse <dwmw2@infradead.org>,
        keyrings@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 17/18] certs: Fix blacklist flag type confusion
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date:   Thu, 18 Feb 2021 22:55:36 +0000
Message-ID: <2106667.1613688936@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Micka=C3=ABl Sala=C3=BCn <mic@digikod.net> wrote:

> > Can I transfer your acks from:
> >=20
> > 	https://lore.kernel.org/lkml/20210121155513.539519-5-mic@digikod.net/
> >=20
> > to here?
>=20
> No, the current thread contains an old version with an error in the
> patch for ima_mok_init(). Please take the last series (fixing this
> patch) that I rebased on your next branch:
> https://lore.kernel.org/keyrings/20210210120410.471693-1-mic@digikod.net/

Is there a quick fix for the error?  If I replace your patches I'll probably
have to withdraw my pull request for this cycle.

David

