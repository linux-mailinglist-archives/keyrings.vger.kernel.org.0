Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C99B22E7BB
	for <lists+keyrings@lfdr.de>; Thu, 30 May 2019 00:01:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726099AbfE2WBi convert rfc822-to-8bit (ORCPT
        <rfc822;lists+keyrings@lfdr.de>); Wed, 29 May 2019 18:01:38 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55476 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726054AbfE2WBh (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Wed, 29 May 2019 18:01:37 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 9E3A630917AA;
        Wed, 29 May 2019 22:01:37 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-120-173.rdu2.redhat.com [10.10.120.173])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 8BB01189D4;
        Wed, 29 May 2019 22:01:36 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
        Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
        Kingdom.
        Registered in England and Wales under Company Registration No. 3798903
From:   David Howells <dhowells@redhat.com>
To:     James Morris <jmorris@namei.org>
cc:     dhowells@redhat.com, keyrings@vger.kernel.org,
        linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] keys: Miscellany
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <18288.1559167295.1@warthog.procyon.org.uk>
Content-Transfer-Encoding: 8BIT
Date:   Wed, 29 May 2019 23:01:35 +0100
Message-ID: <18289.1559167295@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.41]); Wed, 29 May 2019 22:01:37 +0000 (UTC)
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Hi James,

Here are some miscellaneous keyrings fixes and improvements intended for
the next merge window, if you could pull them please.

 (1) Fix a bunch of warnings from sparse, including missing RCU bits and
     kdoc-function argument mismatches

 (2) Implement a keyctl to allow a key to be moved from one keyring to
     another, with the option of prohibiting key replacement in the
     destination keyring.

 (3) Grant Link permission to possessors of request_key_auth tokens so that
     upcall servicing daemons can more easily arrange things such that only
     the necessary auth key is passed to the actual service program, and
     not all the auth keys a daemon might possesss.

Changes: I made the change you suggested on patch 6 and added the
reviewed-by's to patches 1-5 and 7.

David
---
The following changes since commit a188339ca5a396acc588e5851ed7e19f66b0ebd9:

  Linux 5.2-rc1 (2019-05-19 15:47:09 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git tags/keys-misc-20190529

for you to fetch changes up to 39de363a48ae151d766512c8e73a5564a3096c82:

  keys: Grant Link permission to possessers of request_key auth keys (2019-05-29 22:34:52 +0100)

----------------------------------------------------------------
Miscellaneous keyrings development

----------------------------------------------------------------
David Howells (7):
      keys: sparse: Fix key_fs[ug]id_changed()
      keys: sparse: Fix incorrect RCU accesses
      keys: sparse: Fix kdoc mismatches
      keys: Break bits out of key_unlink()
      keys: Make __key_link_begin() handle lockdep nesting
      keys: Add a keyctl to move a key between keyrings
      keys: Grant Link permission to possessers of request_key auth keys

 Documentation/security/keys/core.rst |  21 +++++
 include/linux/key.h                  |  13 ++-
 include/uapi/linux/keyctl.h          |   3 +
 kernel/cred.c                        |   4 +-
 security/keys/compat.c               |   3 +
 security/keys/internal.h             |   3 +-
 security/keys/key.c                  |   6 +-
 security/keys/keyctl.c               |  56 ++++++++++-
 security/keys/keyring.c              | 178 ++++++++++++++++++++++++++++++-----
 security/keys/process_keys.c         |  22 ++---
 security/keys/request_key.c          |   4 +-
 security/keys/request_key_auth.c     |   4 +-
 12 files changed, 269 insertions(+), 48 deletions(-)
