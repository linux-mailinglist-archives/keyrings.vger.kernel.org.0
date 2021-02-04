Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2520430EF6A
	for <lists+keyrings@lfdr.de>; Thu,  4 Feb 2021 10:17:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234812AbhBDJNg (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 4 Feb 2021 04:13:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27706 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235088AbhBDJNO (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 4 Feb 2021 04:13:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1612429907;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=83YswTIVs8A+BvG5Cq0qVYxzgxFpUOkWSz7G7FevllY=;
        b=IG1zvvL1JQ87DuPmWExMtlgsBiCTWFWXx61rZAi2LlOY8izKGih+X5T7jha02vfWq4ARP9
        d3oPUDqooLgmc91SAFQkkWAt7/+B7LO7CxR2bh2vlCLyYTO5c1REl4lwP4/WIS1btASj2j
        MlfEfM+PZKnegy41kJpRsoKkXcvu/ok=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-247-DN2S4fUUNAmCJnuiVqh5Kw-1; Thu, 04 Feb 2021 04:11:45 -0500
X-MC-Unique: DN2S4fUUNAmCJnuiVqh5Kw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AABC95B364;
        Thu,  4 Feb 2021 09:11:42 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-115-23.rdu2.redhat.com [10.10.115.23])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 771C171C9D;
        Thu,  4 Feb 2021 09:11:36 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
        Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
        Kingdom.
        Registered in England and Wales under Company Registration No. 3798903
From:   David Howells <dhowells@redhat.com>
In-Reply-To: <A5B5DEC0-E47A-4C3D-8E79-AF37B6C2E565@oracle.com>
References: <A5B5DEC0-E47A-4C3D-8E79-AF37B6C2E565@oracle.com> <20210122181054.32635-1-eric.snowberg@oracle.com> <1103491.1612369600@warthog.procyon.org.uk> <10e6616e-0598-9f33-2de9-4a5268bba586@digikod.net>
To:     Eric Snowberg <eric.snowberg@oracle.com>
Cc:     dhowells@redhat.com,
        =?us-ascii?Q?=3D=3Futf-8=3FQ=3FMicka=3DC3=3DABl?=
         =?us-ascii?Q?=5FSala=3DC3=3DBCn=3F=3D?= <mic@digikod.net>,
        dwmw2@infradead.org, Jarkko Sakkinen <jarkko@kernel.org>,
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
Date:   Thu, 04 Feb 2021 09:11:35 +0000
Message-ID: <1352221.1612429895@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Eric Snowberg <eric.snowberg@oracle.com> wrote:

> > On Feb 3, 2021, at 11:49 AM, Micka=C3=ABl Sala=C3=BCn <mic@digikod.net>=
 wrote:
> >=20
> > This looks good to me, and it still works for my use case. Eric's
> > patchset only looks for asymmetric keys in the blacklist keyring, so
> > even if we use the same keyring we don't look for the same key types. My
> > patchset only allows blacklist keys (i.e. hashes, not asymmetric keys)
> > to be added by user space (if authenticated), but because Eric's
> > asymmetric keys are loaded with KEY_ALLOC_BYPASS_RESTRICTION, it should
> > be OK for his use case.  There should be no interference between the two
> > new features, but I find it a bit confusing to have such distinct use of
> > keys from the same keyring depending on their type.
>=20
> I agree, it is a bit confusing.  What is the thought of having a dbx=20
> keyring, similar to how the platform keyring works?
>=20
> https://www.spinics.net/lists/linux-security-module/msg40262.html

That would be fine by me.

David

