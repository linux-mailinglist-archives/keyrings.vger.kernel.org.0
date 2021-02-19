Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8CDCD31F6B9
	for <lists+keyrings@lfdr.de>; Fri, 19 Feb 2021 10:48:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229999AbhBSJra (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Fri, 19 Feb 2021 04:47:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24558 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229527AbhBSJr1 (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Fri, 19 Feb 2021 04:47:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1613727960;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=6750kAKaPhDhZsGVTXRm//lcDc2aIOL0pby2BbIRZu4=;
        b=iDCScewCRDKxBTSioCc2JSp1zIDxbpSVyRRPJeJ8muswsMryE/ZU9s4T+XIRf6+EWJgdKI
        7+cqqGNdhhUybeRBV4PtUaONrtdb9nRXUNjh2n5xHvThxAkLbzQvbW741yLbWyJVVij4sG
        cDXxPGfdeoAQ/iuSCUnRdUcBjYABsS0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-367-6UWakb5WPqKC9DI7zpEG0g-1; Fri, 19 Feb 2021 04:45:56 -0500
X-MC-Unique: 6UWakb5WPqKC9DI7zpEG0g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ACD86804036;
        Fri, 19 Feb 2021 09:45:54 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-119-68.rdu2.redhat.com [10.10.119.68])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 270E56267C;
        Fri, 19 Feb 2021 09:45:52 +0000 (UTC)
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
Date:   Fri, 19 Feb 2021 09:45:52 +0000
Message-ID: <2152657.1613727952@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org


Micka=C3=ABl Sala=C3=BCn <mic@digikod.net> wrote:

> No, the current thread contains an old version with an error in the
> patch for ima_mok_init(). Please take the last series (fixing this
> patch) that I rebased on your next branch:
> https://lore.kernel.org/keyrings/20210210120410.471693-1-mic@digikod.net/

Are you referring to the comma rather than a bar here?

 				KEY_ALLOC_NOT_IN_QUOTA,
+				KEY_ALLOC_SET_KEEP,

I fixed that in my branch:

-                               KEY_ALLOC_NOT_IN_QUOTA,
+                               KEY_ALLOC_NOT_IN_QUOTA |
+                               KEY_ALLOC_SET_KEEP,

I'll repost the series.

David

