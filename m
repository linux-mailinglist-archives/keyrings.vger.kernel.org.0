Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 098C33169D9
	for <lists+keyrings@lfdr.de>; Wed, 10 Feb 2021 16:15:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230339AbhBJPP3 (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 10 Feb 2021 10:15:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:41367 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229789AbhBJPPY (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 10 Feb 2021 10:15:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1612970038;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type;
        bh=64yAKhf/pzRpCahMyzllKj4FXtslcoEEd5sylPeTwZY=;
        b=KiXCV0Rc9ROQ7B5yqUjNd4WsTu/HqOoakVurBQ3XYG9LKgodQGGOA9BmxjMcYufh2GgWlY
        fsqlSnyZF0iQ3flDKzQ7axWKB0imWqOFCg1uh9/Ykf6opSMblIzuQcjZrCu/nMpt6sxzlK
        BYy051XThARySekMSSVOTvAz7SLjq40=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-368-O24rLHeQPGyF_cnHOTj5Bw-1; Wed, 10 Feb 2021 10:13:55 -0500
X-MC-Unique: O24rLHeQPGyF_cnHOTj5Bw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9F708107ACE3;
        Wed, 10 Feb 2021 15:13:53 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-115-23.rdu2.redhat.com [10.10.115.23])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 34A1E10013DB;
        Wed, 10 Feb 2021 15:13:51 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
        Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
        Kingdom.
        Registered in England and Wales under Company Registration No. 3798903
From:   David Howells <dhowells@redhat.com>
To:     torvalds@linux-foundation.org
cc:     dhowells@redhat.com, Jarkko Sakkinen <jarkko@kernel.org>,
        Eric Snowberg <eric.snowberg@oracle.com>,
        =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@linux.microsoft.com>,
        keyrings@vger.kernel.org, linux-security-module@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [GIT PULL] Add EFI_CERT_X509_GUID support for dbx/mokx entries
MIME-Version: 1.0
Content-Type: text/plain
Date:   Wed, 10 Feb 2021 15:13:50 +0000
Message-ID: <1323922.1612970030@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org


Hi Linus,

This set of patches from Eric Snowberg that add support for
EFI_CERT_X509_GUID entries in the dbx and mokx UEFI tables (such entries
cause matching certificates to be rejected).  These are currently ignored
and only the hash entries are made use of.

These patches fix CVE-2020-26541.

To quote Eric:

	This is the fifth patch series for adding support for
	EFI_CERT_X509_GUID entries [1].  It has been expanded to not only
	include dbx entries but also entries in the mokx.  Additionally my
	series to preload these certificate [2] has also been included.

	This series is based on v5.11-rc4.

	[1] https://patchwork.kernel.org/project/linux-security-module/patch/20200916004927.64276-1-eric.snowberg@oracle.com/
	[2] https://lore.kernel.org/patchwork/cover/1315485/

Note that this is based on top of the collected minor fixes I sent you a
preceding pull request for.  If you would rather this was not based on my
keys-misc branch, but was instead based on your tree directly, I can rebase
it.  Note that there would be very minor conflict between the two branches,
but I think git merge should be able to handle it automatically.

David
---
The following changes since commit 8f0bfc25c907f38e7f9dc498e8f43000d77327ef:

  watch_queue: rectify kernel-doc for init_watch() (2021-01-26 11:16:34 +0000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git tags/keys-cve-2020-26541

for you to fetch changes up to 0b641da796d30d00f3b055e7a94ce9426107428a:

  integrity: Load mokx variables into the blacklist keyring (2021-02-03 15:39:04 +0000)

----------------------------------------------------------------
Fix CVE-2020-26541

----------------------------------------------------------------
Eric Snowberg (4):
      certs: Add EFI_CERT_X509_GUID support for dbx entries
      certs: Move load_system_certificate_list to a common function
      certs: Add ability to preload revocation certs
      integrity: Load mokx variables into the blacklist keyring

 certs/Kconfig                                      |  8 ++++
 certs/Makefile                                     | 20 ++++++--
 certs/blacklist.c                                  | 49 +++++++++++++++++++
 certs/blacklist.h                                  | 12 +++++
 certs/common.c                                     | 56 ++++++++++++++++++++++
 certs/common.h                                     |  9 ++++
 certs/revocation_certificates.S                    | 21 ++++++++
 certs/system_keyring.c                             | 55 ++++-----------------
 include/keys/system_keyring.h                      | 11 +++++
 scripts/Makefile                                   |  1 +
 .../integrity/platform_certs/keyring_handler.c     | 11 +++++
 security/integrity/platform_certs/load_uefi.c      | 20 +++++++-
 12 files changed, 222 insertions(+), 51 deletions(-)
 create mode 100644 certs/common.c
 create mode 100644 certs/common.h
 create mode 100644 certs/revocation_certificates.S

