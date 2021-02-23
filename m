Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B00513234A4
	for <lists+keyrings@lfdr.de>; Wed, 24 Feb 2021 01:47:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230367AbhBXAbh (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 23 Feb 2021 19:31:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:51012 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232715AbhBWXtF (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Tue, 23 Feb 2021 18:49:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1614124050;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=S3lDmdXQJ0fMVsJregzwrL9TnBkf6/AZ2jUUlf2xCxo=;
        b=ibeYbKlMJq3rp/rTBtaWkwamq+HgHokxSTu1BrFGYlqmZEx6QAta+FIzGSOrFA+Rm/ajAQ
        lVctdiGQTNOY5jsxqgjmCGlBwjWa3Ns9xnbSVsaFA732El1p0k9Z1gUXmGE6MuSmpm5TJk
        aUGRcAKP0/fr2FyB0JpPqGo5SflJJxE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-442-A3EId0ghNOuFY5OcsKpkMQ-1; Tue, 23 Feb 2021 18:47:28 -0500
X-MC-Unique: A3EId0ghNOuFY5OcsKpkMQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B81F1100A25F;
        Tue, 23 Feb 2021 23:47:26 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-119-68.rdu2.redhat.com [10.10.119.68])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 57E6D7771C;
        Tue, 23 Feb 2021 23:47:25 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
        Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
        Kingdom.
        Registered in England and Wales under Company Registration No. 3798903
From:   David Howells <dhowells@redhat.com>
In-Reply-To: <20210217165058.1336155-1-eric.snowberg@oracle.com>
References: <20210217165058.1336155-1-eric.snowberg@oracle.com>
To:     Eric Snowberg <eric.snowberg@oracle.com>
Cc:     dhowells@redhat.com, jarkko@kernel.org, mic@linux.microsoft.com,
        dwmw2@infradead.org, keyrings@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] cert: Add kconfig dependency for validate_trust
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <3524594.1614124044.1@warthog.procyon.org.uk>
Content-Transfer-Encoding: quoted-printable
Date:   Tue, 23 Feb 2021 23:47:24 +0000
Message-ID: <3524595.1614124044@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Eric Snowberg <eric.snowberg@oracle.com> wrote:

> The kernel test robot reports when building with Kconfig
> CONFIG_INTEGRITY_PLATFORM_KEYRING defined and =

> CONFIG_SYSTEM_DATA_VERIFICATION undefined:
> =

> ld.lld: error: undefined symbol: pkcs7_validate_trust
> referenced by blacklist.c:128 (certs/blacklist.c:128)
>              blacklist.o:(is_key_on_revocation_list) in archive certs/bu=
ilt-in.a
> =

> Make CONFIG_SYSTEM_DATA_VERIFICATION a dependency for validate_trust.
> =

> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Eric Snowberg <eric.snowberg@oracle.com>

I wonder if it's better to provide a separate config option for the revoca=
tion
list, say:

	config SYSTEM_REVOCATION_LIST
		bool "Add revocation certs to the blacklist keyring"
		depends on SYSTEM_BLACKLIST_KEYRING
		depends on PKCS7_MESSAGE_PARSER
		help
		  ...

and use that in blacklist.c.

In keys/system_keyring.h, is_key_on_revocation_list() can then be defaulte=
d to
return 0 if that is disabled.

Btw, I've just noticed that add_key_to_revocation_list() and
is_key_on_revocation_list() lack kernel doc comments.

David

