Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 740FD2723D
	for <lists+keyrings@lfdr.de>; Thu, 23 May 2019 00:28:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726363AbfEVW2F (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 22 May 2019 18:28:05 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47740 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725823AbfEVW2F (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Wed, 22 May 2019 18:28:05 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id DF8043083047;
        Wed, 22 May 2019 22:28:04 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-121-142.rdu2.redhat.com [10.10.121.142])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 1BBCB607D8;
        Wed, 22 May 2019 22:28:03 +0000 (UTC)
Subject: [PATCH 0/7] keys: Miscellany
From:   David Howells <dhowells@redhat.com>
To:     keyrings@vger.kernel.org
Cc:     dhowells@redhat.com, linux-security-module@vger.kernel.org,
        linux-kernel@vger.kernel.org
Date:   Wed, 22 May 2019 23:28:03 +0100
Message-ID: <155856408314.10428.17035328117829912815.stgit@warthog.procyon.org.uk>
User-Agent: StGit/unknown-version
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.46]); Wed, 22 May 2019 22:28:04 +0000 (UTC)
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org


Here are some miscellaneous keyrings fixes and improvements intended for
the next merge window:

 (1) Fix a bunch of warnings from sparse, including missing RCU bits and
     kdoc-function argument mismatches

 (2) Implement a keyctl to allow a key to be moved from one keyring to
     another, with the option of prohibiting key replacement in the
     destination keyring.

 (3) Grant Link permission to possessors of request_key_auth tokens so that
     upcall servicing daemons can more easily arrange things such that only
     the necessary auth key is passed to the actual service program, and
     not all the auth keys a daemon might possesss.

The patches can be found on the following branch:

	https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git/log/?h=keys-misc

David
---
David Howells (7):
      keys: sparse: Fix key_fs[ug]id_changed()
      keys: sparse: Fix incorrect RCU accesses
      keys: sparse: Fix kdoc mismatches
      keys: Break bits out of key_unlink()
      keys: Make __key_link_begin() handle lockdep nesting
      keys: Add a keyctl to move a key between keyrings
      keys: Grant Link permission to possessers of request_key auth keys


 include/linux/key.h              |   13 ++-
 include/uapi/linux/keyctl.h      |    3 +
 kernel/cred.c                    |    4 -
 security/keys/compat.c           |    3 +
 security/keys/internal.h         |    3 -
 security/keys/key.c              |    6 +
 security/keys/keyctl.c           |   58 ++++++++++++
 security/keys/keyring.c          |  178 ++++++++++++++++++++++++++++++++++----
 security/keys/process_keys.c     |   22 ++---
 security/keys/request_key.c      |    4 -
 security/keys/request_key_auth.c |    4 -
 11 files changed, 250 insertions(+), 48 deletions(-)

