Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 38947197BA8
	for <lists+keyrings@lfdr.de>; Mon, 30 Mar 2020 14:16:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729848AbgC3MQt (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Mon, 30 Mar 2020 08:16:49 -0400
Received: from us-smtp-delivery-74.mimecast.com ([63.128.21.74]:58164 "EHLO
        us-smtp-delivery-74.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729705AbgC3MQt (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Mon, 30 Mar 2020 08:16:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1585570608;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=MYQJfg4bEedYd4dU8QQfrS68QqFoT2gft/lQom/VKLY=;
        b=U3hulI/s95L2K2IEtt8V3PaAv8X3/en3gEBW6wvO4SAY7rM2o7noLcPpInE7lUCiz0SETd
        nRyJ9VIdc2xaIrvnIx1fe9LMPoT68MUGg0ohFpOcyZCBpbtBn8OuFE3bje7qoghC0h3SCC
        kk5KXsV9gzBjmY6CsdMAK2lyTQcj46I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-134-TLrIXIIFMxS2aU19Htzoog-1; Mon, 30 Mar 2020 08:16:44 -0400
X-MC-Unique: TLrIXIIFMxS2aU19Htzoog-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 97F21801E74;
        Mon, 30 Mar 2020 12:16:43 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-112-66.rdu2.redhat.com [10.10.112.66])
        by smtp.corp.redhat.com (Postfix) with ESMTP id B092596F88;
        Mon, 30 Mar 2020 12:16:39 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
        Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
        Kingdom.
        Registered in England and Wales under Company Registration No. 3798903
From:   David Howells <dhowells@redhat.com>
To:     torvalds@linux-foundation.org
cc:     dhowells@redhat.com, jarkko.sakkinen@linux.intel.com,
        longman@redhat.com, keyrings@vger.kernel.org,
        linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] keys: Fix key->sem vs mmap_sem issue when reading key
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <1437196.1585570598.1@warthog.procyon.org.uk>
Content-Transfer-Encoding: quoted-printable
Date:   Mon, 30 Mar 2020 13:16:38 +0100
Message-ID: <1437197.1585570598@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Hi Linus,

Here's a couple of patches that fix a circular dependency between holding
key->sem and mm->mmap_sem when reading data from a key.  One potential
issue is that a filesystem looking to use a key inside, say, ->readpages()
could deadlock if the key being read is the key that's required and the
buffer the key is being read into is on a page that needs to be fetched.

The case actually detected is a bit more involved - with a filesystem
calling request_key() and locking the target keyring for write - which
could be being read.

[Note: kbuild spotted a compiler(?) warning that I've not seen before,
 complaining "The scope of the variable 'oldxdr' can be reduced.
 [variableScope]".  It's unhappy that a variable that's declared at the to=
p
 of the function hasn't been moved into an interior for-loop.  Is this
 something we're now requiring?  Anyway, I'd prefer to fix that with a
 follow up patch through the net tree rather than go for a 9th iteration o=
n
 these patches.]

Thanks,
David
---
The following changes since commit 1b649e0bcae71c118c1333e02249a7510ba7f70=
a:

  Merge git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net (2020-03-=
25 13:58:05 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git tags=
/keys-fixes-20200329

for you to fetch changes up to 4f0882491a148059a52480e753b7f07fc550e188:

  KEYS: Avoid false positive ENOMEM error on key read (2020-03-29 12:40:41=
 +0100)

----------------------------------------------------------------
Keyrings fixes

----------------------------------------------------------------
Waiman Long (2):
      KEYS: Don't write out to userspace while holding key semaphore
      KEYS: Avoid false positive ENOMEM error on key read

 include/keys/big_key-type.h               |   2 +-
 include/keys/user-type.h                  |   3 +-
 include/linux/key-type.h                  |   2 +-
 net/dns_resolver/dns_key.c                |   2 +-
 net/rxrpc/key.c                           |  27 +++-----
 security/keys/big_key.c                   |  11 ++--
 security/keys/encrypted-keys/encrypted.c  |   7 +-
 security/keys/internal.h                  |  12 ++++
 security/keys/keyctl.c                    | 103 +++++++++++++++++++++++++=
-----
 security/keys/keyring.c                   |   6 +-
 security/keys/request_key_auth.c          |   7 +-
 security/keys/trusted-keys/trusted_tpm1.c |  14 +---
 security/keys/user_defined.c              |   5 +-
 13 files changed, 126 insertions(+), 75 deletions(-)

