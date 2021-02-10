Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 429A2316997
	for <lists+keyrings@lfdr.de>; Wed, 10 Feb 2021 16:00:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231784AbhBJO7Q (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 10 Feb 2021 09:59:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31096 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231774AbhBJO7A (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 10 Feb 2021 09:59:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1612969052;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=z2dPGwBXCWSVZ5g1pGm6UIqGI0ADcDy1IxFOAnmlTEE=;
        b=QzDF3vLj2CQafKLw1NTtknyaRd9MW/8vyDf/KHiFkcfoTdbNg5nEUDTbJ5l59n8qtZVjBy
        mgShMLmYfcUevpLct+0Ard1IFiSWyTfOTuzcCoYqmWyswOjjUaBeGxP4JVcpDTLKaE9+nA
        Ilw7pl/awho7Ah6C0gjqvYajMGWAeW4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-505-BUzlBjMCPu-BrVdmGJSJcQ-1; Wed, 10 Feb 2021 09:57:28 -0500
X-MC-Unique: BUzlBjMCPu-BrVdmGJSJcQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9451C192CC40;
        Wed, 10 Feb 2021 14:57:24 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-115-23.rdu2.redhat.com [10.10.115.23])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 517BE60657;
        Wed, 10 Feb 2021 14:57:20 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
        Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
        Kingdom.
        Registered in England and Wales under Company Registration No. 3798903
From:   David Howells <dhowells@redhat.com>
To:     torvalds@linux-foundation.org
cc:     dhowells@redhat.com, Jarkko Sakkinen <jarkko@kernel.org>,
        "Alexander A. Klimov" <grandmaster@al2klimov.de>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Alex Shi <alex.shi@linux.alibaba.com>,
        Ben Boeckel <mathstuf@gmail.com>,
        Denis Efremov <efremov@linux.com>,
        Gabriel Krisman Bertazi <krisman@collabora.com>,
        Jann Horn <jannh@google.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@linux.microsoft.com>,
        Mimi Zohar <zohar@linux.vnet.ibm.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Tianjia Zhang <tianjia.zhang@linux.alibaba.com>,
        Tom Rix <trix@redhat.com>, YueHaibing <yuehaibing@huawei.com>,
        keyrings@vger.kernel.org, linux-crypto@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org
Subject: 
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date:   Wed, 10 Feb 2021 14:57:19 +0000
Message-ID: <1322700.1612969039@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org


Hi Linus,

Here's a set of minor keyrings fixes/cleanups that I've collected from
various people for the upcoming merge window.

A couple of them might, in theory, be visible to userspace:

 (*) Make blacklist_vet_description() reject uppercase letters as they
     don't match the all-lowercase hex string generated for a blacklist
     search.

     This may want reconsideration in the future, but, currently, you can't
     add to the blacklist keyring from userspace and the only source of
     blacklist keys generates lowercase descriptions.

 (*) Fix blacklist_init() to use a new KEY_ALLOC_* flag to indicate that it
     wants KEY_FLAG_KEEP to be set rather than passing KEY_FLAG_KEEP into
     keyring_alloc() as KEY_FLAG_KEEP isn't a valid alloc flag.

     This isn't currently a problem as the blacklist keyring isn't
     currently writable by userspace.

The rest of the patches are cleanups and I don't think they should have any
visible effect.

I've fixed the compilation error, added another patch and rebased to
v5.11-rc4 since the last request.

David
---
The following changes since commit 19c329f6808995b142b3966301f217c831e7cf31:

  Linux 5.11-rc4 (2021-01-17 16:37:05 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git tags/=
keys-misc-20210126

for you to fetch changes up to 8f0bfc25c907f38e7f9dc498e8f43000d77327ef:

  watch_queue: rectify kernel-doc for init_watch() (2021-01-26 11:16:34 +00=
00)

----------------------------------------------------------------
Keyrings miscellany

----------------------------------------------------------------
Alex Shi (2):
      PKCS#7: drop function from kernel-doc pkcs7_validate_trust_one
      certs/blacklist: fix kernel doc interface issue

Alexander A. Klimov (1):
      encrypted-keys: Replace HTTP links with HTTPS ones

David Howells (1):
      certs: Fix blacklist flag type confusion

Denis Efremov (1):
      security/keys: use kvfree_sensitive()

Gabriel Krisman Bertazi (1):
      watch_queue: Drop references to /dev/watch_queue

Gustavo A. R. Silva (1):
      security: keys: Fix fall-through warnings for Clang

Jann Horn (1):
      keys: Remove outdated __user annotations

Krzysztof Kozlowski (1):
      KEYS: asymmetric: Fix kerneldoc

Lukas Bulwahn (1):
      watch_queue: rectify kernel-doc for init_watch()

Micka=C3=ABl Sala=C3=BCn (3):
      certs: Fix blacklisted hexadecimal hash string check
      PKCS#7: Fix missing include
      certs: Replace K{U,G}IDT_INIT() with GLOBAL_ROOT_{U,G}ID

Randy Dunlap (2):
      security: keys: delete repeated words in comments
      crypto: asymmetric_keys: fix some comments in pkcs7_parser.h

Tianjia Zhang (1):
      crypto: public_key: Remove redundant header file from public_key.h

Tom Rix (2):
      KEYS: remove redundant memset
      keys: remove trailing semicolon in macro definition

YueHaibing (1):
      crypto: pkcs7: Use match_string() helper to simplify the code

 Documentation/security/keys/core.rst     |  4 ++--
 certs/blacklist.c                        | 10 +++++-----
 certs/system_keyring.c                   |  5 +++--
 crypto/asymmetric_keys/asymmetric_type.c |  6 ++++--
 crypto/asymmetric_keys/pkcs7_parser.h    |  5 ++---
 crypto/asymmetric_keys/pkcs7_trust.c     |  2 +-
 crypto/asymmetric_keys/pkcs7_verify.c    |  9 ++++-----
 include/crypto/public_key.h              |  1 -
 include/keys/encrypted-type.h            |  2 +-
 include/linux/key.h                      |  5 +++--
 include/linux/verification.h             |  2 ++
 kernel/watch_queue.c                     |  2 +-
 samples/Kconfig                          |  2 +-
 samples/watch_queue/watch_test.c         |  2 +-
 security/integrity/ima/ima_mok.c         |  5 ++---
 security/keys/Kconfig                    |  8 ++++----
 security/keys/big_key.c                  |  9 +++------
 security/keys/key.c                      |  2 ++
 security/keys/keyctl.c                   |  2 +-
 security/keys/keyctl_pkey.c              |  2 --
 security/keys/keyring.c                  | 10 +++++-----
 security/keys/process_keys.c             |  1 +
 22 files changed, 48 insertions(+), 48 deletions(-)

