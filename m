Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F0B962C69FE
	for <lists+keyrings@lfdr.de>; Fri, 27 Nov 2020 17:46:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731768AbgK0Qpg (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Fri, 27 Nov 2020 11:45:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:24657 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731485AbgK0Qpf (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Fri, 27 Nov 2020 11:45:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1606495534;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=BFzxJ0LqFvUbcYcFeHzyf+vWZiMH5SU2REmsbBd10N8=;
        b=SiP6sadTQQ5QvNNHUYycSFt6xlYyQTpBMGRMSq23rPLx4X9lseOi18PG+f6vXmnFmMZaiM
        ybllgDEiITznKQhgBZWCPcidfLb6HF3CdJWw7MdLMd7dsR+Mb029tM+tFvADM/lv78EG6g
        RTc9XgKc411gMr5Fhal6Je92weRomAE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-410-hJyyTcCMPxWe0M8Pz4bx4g-1; Fri, 27 Nov 2020 11:45:30 -0500
X-MC-Unique: hJyyTcCMPxWe0M8Pz4bx4g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 801403FD1;
        Fri, 27 Nov 2020 16:45:28 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-112-159.rdu2.redhat.com [10.10.112.159])
        by smtp.corp.redhat.com (Postfix) with ESMTP id C393060BF1;
        Fri, 27 Nov 2020 16:45:24 +0000 (UTC)
Subject: [PATCH 0/9] keys: Miscellaneous fixes
From:   David Howells <dhowells@redhat.com>
To:     Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Cc:     James Morris <jmorris@namei.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Jarkko Sakkinen <jarkko.sakkinen@iki.fi>,
        Jann Horn <jannh@google.com>,
        Gabriel Krisman Bertazi <krisman@collabora.com>,
        Jarkko Sakkinen <jarkko@kernel.org>,
        "Alexander A. Klimov" <grandmaster@al2klimov.de>,
        Ben Boeckel <mathstuf@gmail.com>,
        linux-security-module@vger.kernel.org,
        Denis Efremov <efremov@linux.com>, keyrings@vger.kernel.org,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Tom Rix <trix@redhat.com>,
        "Serge E. Hallyn" <serge@hallyn.com>, dhowells@redhat.com,
        keyrings@vger.kernel.org, linux-kernel@vger.kernel.org
Date:   Fri, 27 Nov 2020 16:45:24 +0000
Message-ID: <160649552401.2744658.15096366594785577090.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.23
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org


Hi Jarkko,

I've collected together a bunch of minor keyrings fixes, but I'm not sure
there's anything that can't wait for the next merge window.

The patches can be found on the following branch:

	https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git/log/?h=keys-fixes

David
---
Alexander A. Klimov (1):
      encrypted-keys: Replace HTTP links with HTTPS ones

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

Randy Dunlap (2):
      security: keys: delete repeated words in comments
      crypto: asymmetric_keys: fix some comments in pkcs7_parser.h

Tom Rix (1):
      KEYS: remove redundant memset


 Documentation/security/keys/core.rst     |  4 ++--
 crypto/asymmetric_keys/asymmetric_type.c |  6 ++++--
 crypto/asymmetric_keys/pkcs7_parser.h    |  5 ++---
 include/keys/encrypted-type.h            |  2 +-
 samples/Kconfig                          |  2 +-
 samples/watch_queue/watch_test.c         |  2 +-
 security/keys/Kconfig                    |  8 ++++----
 security/keys/big_key.c                  |  9 +++------
 security/keys/keyctl.c                   |  2 +-
 security/keys/keyctl_pkey.c              |  2 --
 security/keys/keyring.c                  | 10 +++++-----
 11 files changed, 24 insertions(+), 28 deletions(-)


