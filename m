Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B069315452
	for <lists+keyrings@lfdr.de>; Tue,  9 Feb 2021 17:50:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233065AbhBIQtc (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 9 Feb 2021 11:49:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23188 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233197AbhBIQrw (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Tue, 9 Feb 2021 11:47:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1612889186;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=9bKjwgbZ1EP33vL7JsMvHcw8xSOrDL2Zn14AJKji9VU=;
        b=R+RjCt/NJDlo9uyxze+EHMXseJGc7qULXCph8rscMJv0RJwvefik0Z6VSyjGZ08pBuGv4m
        kbPAtzWLQppiNwWzt7nlJLyGP8IOTGLppfPWJiW5WyfVe4lwsw6kI8Z4O7JSZ9WtevdCX9
        aVyl8Z3SXYNj7Af3gfqFAMaY7/0NQK4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-499-alYt63OcOQKjNdkohcNTEQ-1; Tue, 09 Feb 2021 11:46:23 -0500
X-MC-Unique: alYt63OcOQKjNdkohcNTEQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 04A03107ACE8;
        Tue,  9 Feb 2021 16:46:21 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-115-23.rdu2.redhat.com [10.10.115.23])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 7C58A5D705;
        Tue,  9 Feb 2021 16:46:14 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
        Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
        Kingdom.
        Registered in England and Wales under Company Registration No. 3798903
From:   David Howells <dhowells@redhat.com>
In-Reply-To: <5055b9b4-2808-8816-d50c-e651bd88a7c3@digikod.net>
References: <5055b9b4-2808-8816-d50c-e651bd88a7c3@digikod.net> <74EC102D-BD18-4863-A7FB-C88439654C8C@oracle.com> <20210122181054.32635-1-eric.snowberg@oracle.com> <1103491.1612369600@warthog.procyon.org.uk> <10e6616e-0598-9f33-2de9-4a5268bba586@digikod.net> <A5B5DEC0-E47A-4C3D-8E79-AF37B6C2E565@oracle.com> <7924ce4c-ea94-9540-0730-bddae7c6af07@digikod.net> <BFC930B3-7994-4C5B-A8EF-1DD1C73F5750@oracle.com> <dc6a4524-3935-fda6-40a8-cebf80942cdf@digikod.net> <188DE1AF-A011-4631-B88A-2C4324DA013B@oracle.com> <99066eb7-53ac-41b0-46cf-36ea3d7f6590@digikod.net> <525705.1612876446@warthog.procyon.org.uk>
To:     =?us-ascii?Q?=3D=3FUTF-8=3FQ=3FMicka=3Dc3=3Dabl=5FSala=3Dc3=3Dbcn=3F?=
         =?us-ascii?Q?=3D?= <mic@digikod.net>,
        Eric Snowberg <eric.snowberg@oracle.com>
Cc:     dhowells@redhat.com, dwmw2@infradead.org,
        Jarkko Sakkinen <jarkko@kernel.org>,
        James.Bottomley@HansenPartnership.com, masahiroy@kernel.org,
        michal.lkml@markovi.net, jmorris@namei.org, serge@hallyn.com,
        ardb@kernel.org, Mimi Zohar <zohar@linux.ibm.com>,
        lszubowi@redhat.com, javierm@redhat.com, keyrings@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-security-module@vger.kernel.org,
        Tyler Hicks <tyhicks@linux.microsoft.com>
Subject: Re: Re: Conflict with =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn's?=
 blacklist patches [was [PATCH v5 0/4] Add EFI_CERT_X509_GUID support for
 dbx/mokx entries]
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date:   Tue, 09 Feb 2021 16:46:13 +0000
Message-ID: <595105.1612889173@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Micka=C3=ABl Sala=C3=BCn <mic@digikod.net> wrote:

> The only commit causing issues is commit f78e50c8f750 ("certs: Factor
> out the blacklist hash creation"). I think my last patch fix the issue,
> and I'm testing with the UEFI DBX, but I don't understand why this
> change would have an impact. In the meantime you can push Eric's commits
> first, I'll adapt my changes.

Okay.  In that case, I've dropped your branch from my keys-next branch for =
the
moment and remerged Eric's branch.

David

