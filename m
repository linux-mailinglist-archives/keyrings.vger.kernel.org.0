Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A01C8337A62
	for <lists+keyrings@lfdr.de>; Thu, 11 Mar 2021 18:05:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229901AbhCKRFV (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 11 Mar 2021 12:05:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53587 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229992AbhCKRFN (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 11 Mar 2021 12:05:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1615482312;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type;
        bh=psOPtICF11pXofHXlU7Z/Nk2n88gRhtlSBfRfAKoCVk=;
        b=P8hklgiDgtxKPNMTHq01F53SDPJzoo4jnnt2J8KtFTlmK4uRsF2DSQDXL3BXuCgvfze0Ra
        p/5hxwP2SYVOCqIklZwgJ+IURFhltEVDis8FYNk1mGiPo1sCYBPIjOJjl381IOkMymvHrp
        usn4iWZemJPSamNDIAGyJBjdouyabNw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-29-KeXUfcKpNEWteOEHWTYlUg-1; Thu, 11 Mar 2021 12:05:10 -0500
X-MC-Unique: KeXUfcKpNEWteOEHWTYlUg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AEB85100C661;
        Thu, 11 Mar 2021 17:05:08 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-118-152.rdu2.redhat.com [10.10.118.152])
        by smtp.corp.redhat.com (Postfix) with ESMTP id E91AE10023AF;
        Thu, 11 Mar 2021 17:05:06 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
        Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
        Kingdom.
        Registered in England and Wales under Company Registration No. 3798903
From:   David Howells <dhowells@redhat.com>
To:     torvalds@linux-foundation.org
cc:     dhowells@redhat.com, Jarkko Sakkinen <jarkko@kernel.org>,
        Eric Snowberg <eric.snowberg@oracle.com>,
        =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@linux.microsoft.com>,
        James Bottomley <James.Bottomley@HansenPartnership.com>,
        keyrings@vger.kernel.org, linux-security-module@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [GIT PULL] Add EFI_CERT_X509_GUID support for dbx/mokx entries
MIME-Version: 1.0
Content-Type: text/plain
Date:   Thu, 11 Mar 2021 17:05:06 +0000
Message-ID: <1884195.1615482306@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org


Hi Linus,

Here's a set of patches from Eric Snowberg[1] that add support for
EFI_CERT_X509_GUID entries in the dbx and mokx UEFI tables (such entries
cause matching certificates to be rejected).  These are currently ignored
and only the hash entries are made use of.  Additionally Eric included his
patches to allow such certificates to be preloaded.

These patches deal with CVE-2020-26541.

To quote Eric:

	This is the fifth patch series for adding support for
	EFI_CERT_X509_GUID entries [2].  It has been expanded to not only
	include dbx entries but also entries in the mokx.  Additionally my
	series to preload these certificate [3] has also been included.

	This series is based on v5.11-rc4.

Notes:

 (*) These patches fix a security loophole rather than actual fixing kernel
     breakage, so they could theoretically wait for the next merge window
     if you prefer.

 (*) Patch 3 adds the extract-cert target a second time.  I think make
     should just handle this, though it could be better to add a config
     option specifically for building that program (it's used by multiple
     options).

Changes:
 - Changed Jarkko's acks to his kernel.org address.

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
Link: https://lore.kernel.org/r/161428671215.677100.6372209948022011988.stgit@warthog.procyon.org.uk/ # v1
Link: https://lore.kernel.org/r/161433310139.902181.11787442834918634133.stgit@warthog.procyon.org.uk/ # v2
Link: https://lore.kernel.org/r/161529604216.163428.4905283330048991183.stgit@warthog.procyon.org.uk/ # v3
Link: https://lore.kernel.org/r/20210304175030.184131-1-eric.snowberg@oracle.com/ [7]

David
---
The following changes since commit 8f0bfc25c907f38e7f9dc498e8f43000d77327ef:

  watch_queue: rectify kernel-doc for init_watch() (2021-01-26 11:16:34 +0000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git tags/keys-cve-2020-26541-v3

for you to fetch changes up to ebd9c2ae369a45bdd9f8615484db09be58fc242b:

  integrity: Load mokx variables into the blacklist keyring (2021-03-11 16:34:48 +0000)

----------------------------------------------------------------
Fix CVE-2020-26541

----------------------------------------------------------------
Eric Snowberg (4):
      certs: Add EFI_CERT_X509_GUID support for dbx entries
      certs: Move load_system_certificate_list to a common function
      certs: Add ability to preload revocation certs
      integrity: Load mokx variables into the blacklist keyring

 certs/Kconfig                                      | 17 ++++++
 certs/Makefile                                     | 21 ++++++-
 certs/blacklist.c                                  | 64 ++++++++++++++++++++++
 certs/blacklist.h                                  |  2 +
 certs/common.c                                     | 57 +++++++++++++++++++
 certs/common.h                                     |  9 +++
 certs/revocation_certificates.S                    | 21 +++++++
 certs/system_keyring.c                             | 55 +++----------------
 include/keys/system_keyring.h                      | 15 +++++
 scripts/Makefile                                   |  1 +
 .../integrity/platform_certs/keyring_handler.c     | 11 ++++
 security/integrity/platform_certs/load_uefi.c      | 20 ++++++-
 12 files changed, 242 insertions(+), 51 deletions(-)
 create mode 100644 certs/common.c
 create mode 100644 certs/common.h
 create mode 100644 certs/revocation_certificates.S

