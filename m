Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26C75322FE1
	for <lists+keyrings@lfdr.de>; Tue, 23 Feb 2021 18:46:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233751AbhBWRqK (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 23 Feb 2021 12:46:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:35828 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233794AbhBWRqC (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Tue, 23 Feb 2021 12:46:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1614102276;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=w4TvOd5ViWOKQi/Wx7BwXFqaCkAgT3HmAHVmSL0o44o=;
        b=YvPxFsQ2AbRNBqfi6F1ysquntg724wUFKowrWlZfE6dZdWt8NdVxUcIAyppE0ayfElE9y5
        nSJkmfMjgKGsQ+fh6ZKA37QTxki62/luVKTnqkTmkvamPVCPjDNqbSqh0kZBI4bPPJxdhH
        60fxvY0FnpbrKQU1fpMd3hFxTnk8nFI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-458-RYDG_V6LM3edxTTVmWMdOA-1; Tue, 23 Feb 2021 12:44:34 -0500
X-MC-Unique: RYDG_V6LM3edxTTVmWMdOA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F1383107ACF8;
        Tue, 23 Feb 2021 17:44:32 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-119-68.rdu2.redhat.com [10.10.119.68])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 783E060CFB;
        Tue, 23 Feb 2021 17:44:31 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
        Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
        Kingdom.
        Registered in England and Wales under Company Registration No. 3798903
From:   David Howells <dhowells@redhat.com>
In-Reply-To: <1323922.1612970030@warthog.procyon.org.uk>
References: <1323922.1612970030@warthog.procyon.org.uk>
To:     torvalds@linux-foundation.org
Cc:     dhowells@redhat.com, Jarkko Sakkinen <jarkko@kernel.org>,
        Eric Snowberg <eric.snowberg@oracle.com>,
        =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@linux.microsoft.com>,
        keyrings@vger.kernel.org, linux-security-module@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [GIT PULL] Add EFI_CERT_X509_GUID support for dbx/mokx entries
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <3493920.1614102270.1@warthog.procyon.org.uk>
Content-Transfer-Encoding: quoted-printable
Date:   Tue, 23 Feb 2021 17:44:30 +0000
Message-ID: <3493921.1614102270@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

David Howells <dhowells@redhat.com> wrote:

> This set of patches from Eric Snowberg that add support for
> EFI_CERT_X509_GUID entries in the dbx and mokx UEFI tables (such entries
> cause matching certificates to be rejected).  These are currently ignore=
d
> and only the hash entries are made use of.
> =

> These patches fix CVE-2020-26541.
> =

> To quote Eric:
> =

> 	This is the fifth patch series for adding support for
> 	EFI_CERT_X509_GUID entries [1].  It has been expanded to not only
> 	include dbx entries but also entries in the mokx.  Additionally my
> 	series to preload these certificate [2] has also been included.
> =

> 	This series is based on v5.11-rc4.
> =

> 	[1] https://patchwork.kernel.org/project/linux-security-module/patch/20=
200916004927.64276-1-eric.snowberg@oracle.com/
> 	[2] https://lore.kernel.org/patchwork/cover/1315485/
> =

> Note that this is based on top of the collected minor fixes I sent you a
> preceding pull request for.  If you would rather this was not based on m=
y
> keys-misc branch, but was instead based on your tree directly, I can reb=
ase
> it.  Note that there would be very minor conflict between the two branch=
es,
> but I think git merge should be able to handle it automatically.

Please drop this request for now.  It turns out there's a broken dependenc=
y
in there:

	https://lore.kernel.org/keyrings/20210217165058.1336155-1-eric.snowberg@o=
racle.com/

I'll look at folding that in, but I'm not sure Eric's solution is the righ=
t
one.  I suspect there needs to be something in Kconfig somewhere.

David

