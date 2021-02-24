Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3BFFA323BFF
	for <lists+keyrings@lfdr.de>; Wed, 24 Feb 2021 13:41:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234606AbhBXMlr (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 24 Feb 2021 07:41:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:50218 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233712AbhBXMlp (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 24 Feb 2021 07:41:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1614170419;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=6EZ7KLEv3f4muyBgg157B8HXJbUua7sKn+XXr3ZDJJA=;
        b=WW0EoG/qiYYOvdLEcgOatRStdS97LzlsER9TsdsQdaYA2/RiFwBWWhQfKgiXWf4/V14g8W
        zkMsLZpKgMj0m3aIRXIvDY6/9yX5YT80Iupxb3HkBuBTy+fIpmORwn1z6kLvGz1M3Ud8WR
        BcgM7kuFQZEuQlzf4XglmMkq9hnPAFs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-542-37emOvHfNWqbgD09ybzS-g-1; Wed, 24 Feb 2021 07:40:15 -0500
X-MC-Unique: 37emOvHfNWqbgD09ybzS-g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EE09C835E20;
        Wed, 24 Feb 2021 12:40:12 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-119-68.rdu2.redhat.com [10.10.119.68])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 561B95D6A8;
        Wed, 24 Feb 2021 12:40:11 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
        Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
        Kingdom.
        Registered in England and Wales under Company Registration No. 3798903
From:   David Howells <dhowells@redhat.com>
In-Reply-To: <30122760-0492-1f32-cb37-7d2f84560cab@digikod.net>
References: <30122760-0492-1f32-cb37-7d2f84560cab@digikod.net> <F6980CA4-737D-416A-BBE3-390CEBA8B192@oracle.com> <20210217165058.1336155-1-eric.snowberg@oracle.com> <3524595.1614124044@warthog.procyon.org.uk> <3731128.1614163916@warthog.procyon.org.uk>
To:     =?us-ascii?Q?=3D=3FUTF-8=3FQ=3FMicka=3Dc3=3Dabl=5FSala=3Dc3=3Dbcn=3F?=
         =?us-ascii?Q?=3D?= <mic@digikod.net>
Cc:     dhowells@redhat.com, Eric Snowberg <eric.snowberg@oracle.com>,
        Jarkko Sakkinen <jarkko@kernel.org>,
        =?us-ascii?Q?=3D=3FUTF-8=3FQ=3FMicka=3Dc3=3Dabl?=
         =?us-ascii?Q?=5FSala=3Dc3=3Dbcn=3F=3D?= <mic@linux.microsoft.com>,
        David Woodhouse <dwmw2@infradead.org>,
        keyrings@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] cert: Add kconfig dependency for validate_trust
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date:   Wed, 24 Feb 2021 12:40:10 +0000
Message-ID: <3739954.1614170410@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Micka=C3=ABl Sala=C3=BCn <mic@digikod.net> wrote:

> > +config SYSTEM_REVOCATION_LIST
> > +	bool "Provide system-wide ring of revocation certificates"
> > +	depends on SYSTEM_BLACKLIST_KEYRING
> > +	depends on PKCS7_MESSAGE_PARSER=3Dy
>=20
> The function verify_pkcs7_message_sig() (which is patched) is only
> available if CONFIG_SYSTEM_DATA_VERIFICATION is defined.

That shouldn't matter, at least from a building point of view, since
verify_pkcs7_message_sig() uses the new facility rather than being a
dependency of it - and there's a fallback in place in case you don't want
SYSTEM_REVOCATION_LIST.  Note that SYSTEM_DATA_VERIFICATION also doesn't
depend on or select SYSTEM_BLACKLIST_KEYRING - it will use it if it's enabl=
ed,
but not otherwise.

> I suggest to use the same dependencies as for my dynamic authenticated
> blacklist keyring patchset.

This, you mean?

	config SYSTEM_BLACKLIST_AUTH_UPDATE
		bool "Allow root to add signed blacklist keys"
		depends on SYSTEM_BLACKLIST_KEYRING
		depends on SYSTEM_DATA_VERIFICATION

I.e.:

	config SYSTEM_REVOCATION_LIST
		bool "Provide system-wide ring of revocation certificates"
		depends on SYSTEM_BLACKLIST_KEYRING
		depends on SYSTEM_DATA_VERIFICATION
		depends on PKCS7_MESSAGE_PARSER=3Dy

I suppose you could argue the it that way since it's only used for that
purpose.  Note that it does need the PKCS7 dep since it explicitly uses that
code.

> Could you please not move those functions? It makes the patch more
> readable and avoids merge conflicts (e.g. with the dynamic authenticated
> blacklist keyring patchset). Thanks.

I would suggest merging these changes in so that the error is not found by
bisection.  But the functions really are mislocated:-/

David

