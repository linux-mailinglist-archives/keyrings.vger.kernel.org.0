Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F2CEB325846
	for <lists+keyrings@lfdr.de>; Thu, 25 Feb 2021 22:05:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233404AbhBYVCU (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 25 Feb 2021 16:02:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:31855 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234234AbhBYVAM (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 25 Feb 2021 16:00:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1614286721;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=3ZofdrozonSrpXzzHJj4sZQrAAT/WiE2QcpLH4zUhIM=;
        b=Px3sa+HCgv1dfN53X56cafMd/F4zNbcKV/pUN1JlmDVoMOrJEhZLO+PP97sjFFx5cfqHw9
        wd15TnyBo228p5NbSPpz0C3SzzUqsn9sDo6SSfWyHq2SESefWE0jhsDGWRUGj+G9RfzM0d
        hSYd+Zq3QQLiyEPtsmpehln52O5dRxg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-570-0yqDLGttM8eP9ofQzSG_Uw-1; Thu, 25 Feb 2021 15:58:37 -0500
X-MC-Unique: 0yqDLGttM8eP9ofQzSG_Uw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 44D551005501;
        Thu, 25 Feb 2021 20:58:35 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-119-68.rdu2.redhat.com [10.10.119.68])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 12E0D5D767;
        Thu, 25 Feb 2021 20:58:32 +0000 (UTC)
Subject: [PATCH 0/4] keys: Add EFI_CERT_X509_GUID support for dbx/mokx entries
From:   David Howells <dhowells@redhat.com>
To:     Eric Snowberg <eric.snowberg@oracle.com>
Cc:     Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
        Randy Dunlap <rdunlap@infradead.org>, keyrings@vger.kernel.org,
        James Bottomley <James.Bottomley@HansenPartnership.com>,
        =?utf-8?q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>,
        Jarkko Sakkinen <jarkko@kernel.org>,
        Arnd Bergmann <arnd@kernel.org>, dhowells@redhat.com,
        Jarkko Sakkinen <jarkko@kernel.org>,
        =?utf-8?q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>,
        keyrings@vger.kernel.org, linux-security-module@vger.kernel.org,
        linux-kernel@vger.kernel.org
Date:   Thu, 25 Feb 2021 20:58:32 +0000
Message-ID: <161428671215.677100.6372209948022011988.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.23
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
 - I've modified the first patch in the series to fix a configuration
   problem[4][5], to move the added functions to a more logical place within the
   file and to add kerneldoc comments.

Link: https://lore.kernel.org/r/20210122181054.32635-1-eric.snowberg@oracle.com [1]
Link: https://patchwork.kernel.org/project/linux-security-module/patch/20200916004927.64276-1-eric.snowberg@oracle.com/ [2]
Link: https://lore.kernel.org/patchwork/cover/1315485/ [3]
Link: https://lore.kernel.org/r/bc2c24e3-ed68-2521-0bf4-a1f6be4a895d@infradead.org/ [4]
Link: https://lore.kernel.org/r/20210225125638.1841436-1-arnd@kernel.org/ [5]

David
---
Eric Snowberg (4):
      certs: Add EFI_CERT_X509_GUID support for dbx entries
      certs: Move load_system_certificate_list to a common function
      certs: Add ability to preload revocation certs
      integrity: Load mokx variables into the blacklist keyring


 certs/Kconfig                                 |  8 +++
 certs/Makefile                                | 20 ++++++-
 certs/blacklist.c                             | 17 ++++++
 certs/common.c                                | 56 +++++++++++++++++++
 certs/common.h                                |  9 +++
 certs/revocation_certificates.S               | 21 +++++++
 certs/system_keyring.c                        | 49 +---------------
 scripts/Makefile                              |  1 +
 security/integrity/platform_certs/load_uefi.c | 20 ++++++-
 9 files changed, 150 insertions(+), 51 deletions(-)
 create mode 100644 certs/common.c
 create mode 100644 certs/common.h
 create mode 100644 certs/revocation_certificates.S


