Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 08F8360CE6
	for <lists+keyrings@lfdr.de>; Fri,  5 Jul 2019 23:03:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726061AbfGEVDt convert rfc822-to-8bit (ORCPT
        <rfc822;lists+keyrings@lfdr.de>); Fri, 5 Jul 2019 17:03:49 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60240 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725894AbfGEVDt (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Fri, 5 Jul 2019 17:03:49 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 0861E307D840;
        Fri,  5 Jul 2019 21:03:43 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-120-9.rdu2.redhat.com [10.10.120.9])
        by smtp.corp.redhat.com (Postfix) with ESMTP id B046945A8;
        Fri,  5 Jul 2019 21:03:40 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
        Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
        Kingdom.
        Registered in England and Wales under Company Registration No. 3798903
From:   David Howells <dhowells@redhat.com>
To:     torvalds@linux-foundation.org
cc:     dhowells@redhat.com, jmorris@namei.org, keyrings@vger.kernel.org,
        linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] Keys: Set 1 - Miscellany for 5.3
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <26701.1562360619.1@warthog.procyon.org.uk>
Content-Transfer-Encoding: 8BIT
Date:   Fri, 05 Jul 2019 22:03:39 +0100
Message-ID: <26702.1562360619@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.48]); Fri, 05 Jul 2019 21:03:48 +0000 (UTC)
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Hi Linus,

Here's my first block of keyrings changes for the next merge window.  I've
divided up the set into four blocks, but they need to be applied in order
as they would otherwise conflict with each other.

These are some miscellaneous keyrings fixes and improvements:

 (1) Fix a bunch of warnings from sparse, including missing RCU bits and
     kdoc-function argument mismatches

 (2) Implement a keyctl to allow a key to be moved from one keyring to
     another, with the option of prohibiting key replacement in the
     destination keyring.

 (3) Grant Link permission to possessors of request_key_auth tokens so that
     upcall servicing daemons can more easily arrange things such that only
     the necessary auth key is passed to the actual service program, and
     not all the auth keys a daemon might possesss.

 (4) Improvement in lookup_user_key().

 (5) Implement a keyctl to allow keyrings subsystem capabilities to be
     queried.

The keyutils next branch has commits to make available, document and test
the move-key and capabilities code:

	https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/keyutils.git/log

They're currently on the 'next' branch.

David
---
The following changes since commit a188339ca5a396acc588e5851ed7e19f66b0ebd9:

  Linux 5.2-rc1 (2019-05-19 15:47:09 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git tags/keys-misc-20190619

for you to fetch changes up to 45e0f30c30bb131663fbe1752974d6f2e39611e2:

  keys: Add capability-checking keyctl function (2019-06-19 13:27:45 +0100)

----------------------------------------------------------------
Keyrings miscellany

----------------------------------------------------------------
David Howells (9):
      keys: sparse: Fix key_fs[ug]id_changed()
      keys: sparse: Fix incorrect RCU accesses
      keys: sparse: Fix kdoc mismatches
      keys: Change keyring_serialise_link_sem to a mutex
      keys: Break bits out of key_unlink()
      keys: Hoist locking out of __key_link_begin()
      keys: Add a keyctl to move a key between keyrings
      keys: Grant Link permission to possessers of request_key auth keys
      keys: Add capability-checking keyctl function

Eric Biggers (1):
      keys: Reuse keyring_index_key::desc_len in lookup_user_key()

 Documentation/security/keys/core.rst |  21 +++
 include/linux/key.h                  |  13 +-
 include/uapi/linux/keyctl.h          |  17 +++
 kernel/cred.c                        |   4 +-
 security/keys/compat.c               |   6 +
 security/keys/internal.h             |   7 +
 security/keys/key.c                  |  27 +++-
 security/keys/keyctl.c               |  90 +++++++++++-
 security/keys/keyring.c              | 278 ++++++++++++++++++++++++++++-------
 security/keys/process_keys.c         |  26 ++--
 security/keys/request_key.c          |   9 +-
 security/keys/request_key_auth.c     |   4 +-
 12 files changed, 418 insertions(+), 84 deletions(-)
