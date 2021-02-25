Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F22D23251B5
	for <lists+keyrings@lfdr.de>; Thu, 25 Feb 2021 15:47:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229722AbhBYOpJ (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 25 Feb 2021 09:45:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57621 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232557AbhBYOpG (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 25 Feb 2021 09:45:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1614264217;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Bro6K1L61Sgcgif8LOhoB45JhdsJvdKQppn6eGahtEs=;
        b=gPhWLdv3OI+OeIZMYrQ5ZRZbo+UvgVybX2TzP0laWpswV3wAlPQLZ0KDN0fehyFvOYeOa1
        lBcUDJ52lYJX/FSdg0An0PWBMFBKZGLJqfdDOKVNm2wzklW+EZPBHU/K3L5gD5htJR8+2X
        eJVQUoArcuMDEFRZRhuWSaFtYhZDbJE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-98-ueaSdkpkNOq9pf5i1BRPjg-1; Thu, 25 Feb 2021 09:43:35 -0500
X-MC-Unique: ueaSdkpkNOq9pf5i1BRPjg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B3F2C86A066;
        Thu, 25 Feb 2021 14:43:33 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-119-68.rdu2.redhat.com [10.10.119.68])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 68B6C60861;
        Thu, 25 Feb 2021 14:43:32 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
        Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
        Kingdom.
        Registered in England and Wales under Company Registration No. 3798903
From:   David Howells <dhowells@redhat.com>
In-Reply-To: <B7E35D95-1A22-4277-B41B-B3FCC2E93743@oracle.com>
References: <B7E35D95-1A22-4277-B41B-B3FCC2E93743@oracle.com> <F6980CA4-737D-416A-BBE3-390CEBA8B192@oracle.com> <20210217165058.1336155-1-eric.snowberg@oracle.com> <3524595.1614124044@warthog.procyon.org.uk> <3731128.1614163916@warthog.procyon.org.uk>
To:     Eric Snowberg <eric.snowberg@oracle.com>
Cc:     dhowells@redhat.com, Jarkko Sakkinen <jarkko@kernel.org>,
        =?us-ascii?Q?=3D=3Futf-8=3FQ=3FMicka=3DC3=3DABl?=
         =?us-ascii?Q?=5FSala=3DC3=3DBCn=3F=3D?= <mic@linux.microsoft.com>,
        David Woodhouse <dwmw2@infradead.org>,
        keyrings@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] cert: Add kconfig dependency for validate_trust
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date:   Thu, 25 Feb 2021 14:43:31 +0000
Message-ID: <506021.1614264211@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Eric Snowberg <eric.snowberg@oracle.com> wrote:

> > I've added an extra config option to turn on SYSTEM_REVOCATION_LIST sup=
port.
>=20
> I believe this is ok.  However currently, whenever the kernel finds eithe=
r a
> EFI_CERT_SHA256_GUID or EFI_CERT_X509_SHA256_GUID entry in the dbx, it lo=
ads
> it into the blacklist keyring.  Then anytime signature validation takes
> place, these entries are referenced.  If there is a match, the signature
> check fails.  Now with the inclusion of EFI_CERT_X509_GUID, I question why
> we want to enable it thru a Kconfig option, when we don=E2=80=99t for the=
 other two
> types.

But we do.

mark_hash_blacklisted(), is_hash_blacklisted() and is_binary_blacklisted() =
do
nothing if CONFIG_SYSTEM_BLACKLIST_KEYRING=3Dn.

David

