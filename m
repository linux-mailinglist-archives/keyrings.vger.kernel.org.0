Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0856933245B
	for <lists+keyrings@lfdr.de>; Tue,  9 Mar 2021 12:47:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230183AbhCILqs (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 9 Mar 2021 06:46:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:41215 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229553AbhCILq1 (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Tue, 9 Mar 2021 06:46:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1615290386;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=HdTaXsQxd+FqPWUSVRaEgIQyzhznpJI3o8r6KsqiM/0=;
        b=S29DMdVC2SEY0OjuaJRDZHbjrTyJKHDMJ3RUvkSL9iRbx7a1SpcqvPcrD2k/WHFNjvpSpT
        kw1rcsvYiWp8J/GrTR4BkFzFRSbZwfr2xcJEh8MY7iO/IdGWk2KhvRoVoqgIUWcR+9xhZj
        jPnRpvi8XFyQ07LV5jAuTXkYh4joh98=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-498-vOXecCFHNH2A5oCCpZfuxA-1; Tue, 09 Mar 2021 06:46:24 -0500
X-MC-Unique: vOXecCFHNH2A5oCCpZfuxA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6981319067E1;
        Tue,  9 Mar 2021 11:46:23 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-118-152.rdu2.redhat.com [10.10.118.152])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 17B6A100239A;
        Tue,  9 Mar 2021 11:46:21 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
        Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
        Kingdom.
        Registered in England and Wales under Company Registration No. 3798903
From:   David Howells <dhowells@redhat.com>
In-Reply-To: <77085577-01EB-48F5-868B-E7A1813363A1@oracle.com>
References: <77085577-01EB-48F5-868B-E7A1813363A1@oracle.com> <20210304175030.184131-1-eric.snowberg@oracle.com> <147604.1614981032@warthog.procyon.org.uk>
To:     Eric Snowberg <eric.snowberg@oracle.com>
Cc:     dhowells@redhat.com, Randy Dunlap <rdunlap@infradead.org>,
        Jarkko Sakkinen <jarkko@kernel.org>, nathan@kernel.org,
        David Woodhouse <dwmw2@infradead.org>,
        keyrings@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] certs: Fix wrong kconfig option used for x509_revocation_list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date:   Tue, 09 Mar 2021 11:46:21 +0000
Message-ID: <157933.1615290381@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Eric Snowberg <eric.snowberg@oracle.com> wrote:

> >> @@ -11,7 +11,7 @@ hostprogs-always-$(CONFIG_ASN1)				+=3D asn1_compiler
> >> hostprogs-always-$(CONFIG_MODULE_SIG_FORMAT)		+=3D sign-file
> >> hostprogs-always-$(CONFIG_SYSTEM_TRUSTED_KEYRING)	+=3D extract-cert
> >> hostprogs-always-$(CONFIG_SYSTEM_EXTRA_CERTIFICATE)	+=3D insert-sys-ce=
rt
> >> - hostprogs-always-$(CONFIG_SYSTEM_BLACKLIST_KEYRING)	+=3D extract-cert
> >> +hostprogs-always-$(CONFIG_SYSTEM_REVOCATION_LIST)	+=3D extract-cert
> >=20
> > Hmmm...  We have extract-cert listed twice.  Does that matter, I wonder?
>=20
> Isn=E2=80=99t this necessary, since one could build with either=20
> CONFIG_SYSTEM_REVOCATION_LIST or CONFIG_SYSTEM_TRUSTED_KEYRING, without=20
> the other being defined?

Well, it could be handled with its own Kconfig, say CONFIG_BUILD_EXTRACT_CE=
RT,
but that would seem like overkill.  I think make should handle a dependency
being listed multiple times for a target, but it might make sense to list t=
hem
next to each other.

David

