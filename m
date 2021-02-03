Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 97B2630DFBB
	for <lists+keyrings@lfdr.de>; Wed,  3 Feb 2021 17:29:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234292AbhBCQ2Y (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 3 Feb 2021 11:28:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47943 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233269AbhBCQ2V (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 3 Feb 2021 11:28:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1612369614;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=TJ27nuib/BMh125sOPWVUK4Tvaq9/Z2cw9xS+xjyBBk=;
        b=IxH4EDpJRB30krIyyHqtjGx0Pr0Dgl+ZyzGGZ7gSLtaGlHKdiT9NTGcbR+fwK/3eawlxjt
        H7hEv4f6hdW4dMxIN+pLQFz0h+FywIk1LRur6JaRisQTrw1a2XWW2pTABsG5FMLaSXSgM3
        mnlHz0YHecuOtoKxyHQCaqC6drL1bOw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-283-YscSzPlHPqmodnkxCaSjFQ-1; Wed, 03 Feb 2021 11:26:53 -0500
X-MC-Unique: YscSzPlHPqmodnkxCaSjFQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8B0AA100C61B;
        Wed,  3 Feb 2021 16:26:50 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-115-23.rdu2.redhat.com [10.10.115.23])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 3A3875B4A1;
        Wed,  3 Feb 2021 16:26:41 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
        Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
        Kingdom.
        Registered in England and Wales under Company Registration No. 3798903
From:   David Howells <dhowells@redhat.com>
In-Reply-To: <20210122181054.32635-1-eric.snowberg@oracle.com>
References: <20210122181054.32635-1-eric.snowberg@oracle.com>
To:     Eric Snowberg <eric.snowberg@oracle.com>,
        =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>
Cc:     dhowells@redhat.com, dwmw2@infradead.org, jarkko@kernel.org,
        James.Bottomley@HansenPartnership.com, masahiroy@kernel.org,
        michal.lkml@markovi.net, jmorris@namei.org, serge@hallyn.com,
        ardb@kernel.org, zohar@linux.ibm.com, lszubowi@redhat.com,
        javierm@redhat.com, keyrings@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-security-module@vger.kernel.org
Subject: Conflict with =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn's?= blacklist
 patches [was [PATCH v5 0/4] Add EFI_CERT_X509_GUID support for dbx/mokx
 entries]
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date:   Wed, 03 Feb 2021 16:26:40 +0000
Message-ID: <1103491.1612369600@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org


Eric Snowberg <eric.snowberg@oracle.com> wrote:

> This is the fifth patch series for adding support for=20
> EFI_CERT_X509_GUID entries [1].  It has been expanded to not only include
> dbx entries but also entries in the mokx.  Additionally my series to
> preload these certificate [2] has also been included.

Okay, I've tentatively applied this to my keys-next branch.  However, it
conflicts minorly with Micka=C3=ABl Sala=C3=BCn's patches that I've previou=
sly merged on
the same branch.  Can you have a look at the merge commit

	https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git/comm=
it/?h=3Dkeys-next&id=3Dfdbbe7ceeb95090d09c33ce0497e0394c82aa33d

	(the top patch of my keys-next branch)

to see if that is okay by both of you?  If so, can you give it a whirl?

Thanks,
David

