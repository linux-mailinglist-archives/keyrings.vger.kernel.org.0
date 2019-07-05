Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B0ED760D02
	for <lists+keyrings@lfdr.de>; Fri,  5 Jul 2019 23:13:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727212AbfGEVNi convert rfc822-to-8bit (ORCPT
        <rfc822;lists+keyrings@lfdr.de>); Fri, 5 Jul 2019 17:13:38 -0400
Received: from mx1.redhat.com ([209.132.183.28]:41820 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727010AbfGEVNh (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Fri, 5 Jul 2019 17:13:37 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 2B2C1330260;
        Fri,  5 Jul 2019 21:13:37 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-120-9.rdu2.redhat.com [10.10.120.9])
        by smtp.corp.redhat.com (Postfix) with ESMTP id B35C719692;
        Fri,  5 Jul 2019 21:13:35 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
        Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
        Kingdom.
        Registered in England and Wales under Company Registration No. 3798903
From:   David Howells <dhowells@redhat.com>
To:     torvalds@linux-foundation.org
cc:     dhowells@redhat.com, jmorris@namei.org, keyrings@vger.kernel.org,
        linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] Keys: Set 2 - request_key() improvements for 5.3
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <27326.1562361214.1@warthog.procyon.org.uk>
Content-Transfer-Encoding: 8BIT
Date:   Fri, 05 Jul 2019 22:13:34 +0100
Message-ID: <27327.1562361214@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.29]); Fri, 05 Jul 2019 21:13:37 +0000 (UTC)
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Hi Linus,

Here's my second block of keyrings changes for the next merge window.

These are all request_key()-related, including a fix and some improvements:

 (1) Fix the lack of a Link permission check on a key found by
     request_key(), thereby enabling request_key() to link keys that don't
     grant this permission to the target keyring (which must still grant
     Write permission).

     Note that the key must be in the caller's keyrings already to be
     found.

 (2) Invalidate used request_key authentication keys rather than revoking
     them, so that they get cleaned up immediately rather than hanging
     around till the expiry time is passed.

 (3) Move the RCU locks outwards from the keyring search functions so that
     a request_key_rcu() can be provided.  This can be called in RCU mode,
     so it can't sleep and can't upcall - but it can be called from
     LOOKUP_RCU pathwalk mode.

 (4) Cache the latest positive result of request_key*() temporarily in
     task_struct so that filesystems that make a lot of request_key() calls
     during pathwalk can take advantage of it to avoid having to redo the
     searching.  This requires CONFIG_KEYS_REQUEST_CACHE=y.

     It is assumed that the key just found is likely to be used multiple
     times in each step in an RCU pathwalk, and is likely to be reused for
     the next step too.

     Note that the cleanup of the cache is done on TIF_NOTIFY_RESUME, just
     before userspace resumes, and on exit.

David
---
The following changes since commit 45e0f30c30bb131663fbe1752974d6f2e39611e2:

  keys: Add capability-checking keyctl function (2019-06-19 13:27:45 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git tags/keys-request-20190626

for you to fetch changes up to 3b8c4a08a471d56ecaaca939c972fdf5b8255629:

  keys: Kill off request_key_async{,_with_auxdata} (2019-06-26 20:58:13 +0100)

----------------------------------------------------------------
request_key improvements

----------------------------------------------------------------
David Howells (6):
      keys: Fix request_key() lack of Link perm check on found key
      keys: Invalidate used request_key authentication keys
      keys: Move the RCU locks outwards from the keyring search functions
      keys: Provide request_key_rcu()
      keys: Cache result of request_key*() temporarily in task_struct
      keys: Kill off request_key_async{,_with_auxdata}

 Documentation/security/keys/core.rst        |  38 ++------
 Documentation/security/keys/request-key.rst |  33 +++----
 include/keys/request_key_auth-type.h        |   1 +
 include/linux/key.h                         |  14 +--
 include/linux/sched.h                       |   5 +
 include/linux/tracehook.h                   |   7 ++
 kernel/cred.c                               |   9 ++
 security/keys/Kconfig                       |  18 ++++
 security/keys/internal.h                    |   6 +-
 security/keys/key.c                         |   4 +-
 security/keys/keyring.c                     |  16 ++--
 security/keys/proc.c                        |   4 +-
 security/keys/process_keys.c                |  41 ++++-----
 security/keys/request_key.c                 | 137 ++++++++++++++++++----------
 security/keys/request_key_auth.c            |  60 +++++++-----
 15 files changed, 229 insertions(+), 164 deletions(-)
