Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A41DE332688
	for <lists+keyrings@lfdr.de>; Tue,  9 Mar 2021 14:21:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230502AbhCINUz (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 9 Mar 2021 08:20:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:28799 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230359AbhCINUv (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Tue, 9 Mar 2021 08:20:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1615296050;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=oqjFmXr7Z0U4gVq3pN5bRJg7YwywfJ8dExoMh5aIhRc=;
        b=Yo44m4vA98fXB9O8EXxWm3QDbah4v6sP8KSshet1tElvuIY8NtUz2U0dkuZasT4ymxEqrR
        qNfuZYet4LYUaPVi93I2lCcgpXoA+JsGHOGdHUT/l8N+XF70VkoU09liDk6Y0A72rFey98
        GvPGIenIX5aQ56ujd0t2XyM8gf2vk20=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-298-nPDBKQ41PQKmVf1mjW6jMw-1; Tue, 09 Mar 2021 08:20:47 -0500
X-MC-Unique: nPDBKQ41PQKmVf1mjW6jMw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 80582881D4D;
        Tue,  9 Mar 2021 13:20:45 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-118-152.rdu2.redhat.com [10.10.118.152])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 1417B1001901;
        Tue,  9 Mar 2021 13:20:42 +0000 (UTC)
Subject: [PATCH v3 0/4] keys: Add EFI_CERT_X509_GUID support for dbx/mokx
 entries
From:   David Howells <dhowells@redhat.com>
To:     Eric Snowberg <eric.snowberg@oracle.com>
Cc:     Jarkko Sakkinen <jarkko@kernel.org>,
        Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
        James Bottomley <James.Bottomley@HansenPartnership.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        =?utf-8?q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>,
        Arnd Bergmann <arnd@kernel.org>, keyrings@vger.kernel.org,
        dhowells@redhat.com, Jarkko Sakkinen <jarkko@kernel.org>,
        =?utf-8?q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>,
        keyrings@vger.kernel.org, linux-security-module@vger.kernel.org,
        linux-kernel@vger.kernel.org
Date:   Tue, 09 Mar 2021 13:20:42 +0000
Message-ID: <161529604216.163428.4905283330048991183.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.23
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org


Here's my take on v5 of Eric Snowberg's patches[1]:

This series of patches adds support for EFI_CERT_X509_GUID entries [2].  It has
been expanded to not only include dbx entries but also entries in the mokx.
Additionally Eric included his patches to preload these certificate [3].

The patches can be found on the following branch:

	https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git/log/?h=keys-cve-2020-26541-branch

Changes:

ver #3:
 - Rolled in changes from Eric to fix conditional building issues[7].

ver #2:
 - Rolled in a fix to the second patch to include certs/common.h in
   certs/common.c[6].

ver #1:
 - I've modified the first patch in the series to fix a configuration
   problem[4][5], to move the added functions to a more logical place
   within thefile and to add kerneldoc comments.

Link: https://lore.kernel.org/r/20210122181054.32635-1-eric.snowberg@oracle.com [1]
Link: https://patchwork.kernel.org/project/linux-security-module/patch/20200916004927.64276-1-eric.snowberg@oracle.com/ [2]
Link: https://lore.kernel.org/patchwork/cover/1315485/ [3]
Link: https://lore.kernel.org/r/bc2c24e3-ed68-2521-0bf4-a1f6be4a895d@infradead.org/ [4]
Link: https://lore.kernel.org/r/20210225125638.1841436-1-arnd@kernel.org/ [5]
Link: https://lore.kernel.org/r/EDA280F9-F72D-4181-93C7-CDBE95976FF7@oracle.com/ [6]
Link: https://lore.kernel.org/r/161428671215.677100.6372209948022011988.stgit@warthog.procyon.org.uk/ # v1 posting
Link: https://lore.kernel.org/r/161433310139.902181.11787442834918634133.stgit@warthog.procyon.org.uk/ # v2 posting
Link: https://lore.kernel.org/r/20210304175030.184131-1-eric.snowberg@oracle.com/ [7]

David
---
Eric Snowberg (4):
      certs: Add EFI_CERT_X509_GUID support for dbx entries
      certs: Move load_system_certificate_list to a common function
      certs: Add ability to preload revocation certs
      integrity: Load mokx variables into the blacklist keyring


 certs/Kconfig                                 |  8 +++
 certs/Makefile                                | 21 ++++++-
 certs/blacklist.c                             | 21 +++++++
 certs/common.c                                | 57 +++++++++++++++++++
 certs/common.h                                |  9 +++
 certs/revocation_certificates.S               | 21 +++++++
 certs/system_keyring.c                        | 49 +---------------
 scripts/Makefile                              |  1 +
 security/integrity/platform_certs/load_uefi.c | 20 ++++++-
 9 files changed, 156 insertions(+), 51 deletions(-)
 create mode 100644 certs/common.c
 create mode 100644 certs/common.h
 create mode 100644 certs/revocation_certificates.S


