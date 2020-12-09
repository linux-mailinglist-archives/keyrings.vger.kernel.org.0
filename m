Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C7F02D41DF
	for <lists+keyrings@lfdr.de>; Wed,  9 Dec 2020 13:16:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729864AbgLIMQX (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 9 Dec 2020 07:16:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48380 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731307AbgLIMQR (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 9 Dec 2020 07:16:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1607516090;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=hyA2PO8n71MXxUKu/m0tSLtuCTd/rvDr3IPFkb7YJtc=;
        b=ie4e8ElvKvhLca9lExLV1WOc0fGx6DhBUZPMV8thq43TelZrPjjj0q6N85E+5X2MzU/1lX
        EjPZtsvW3NRGF+qRCKgjP/wW2/Co4huAUpA8c9gOWwgAZ61VfYpAeHRWOsdid2J9c8xop5
        mCa5OxEYfHMj/k0C/WQr8QnssjaAjDU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-157-g6j_3dX3Nh2n2wD4Cvb9CQ-1; Wed, 09 Dec 2020 07:14:46 -0500
X-MC-Unique: g6j_3dX3Nh2n2wD4Cvb9CQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8A808100F770;
        Wed,  9 Dec 2020 12:14:30 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-116-67.rdu2.redhat.com [10.10.116.67])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 4C08D5C1D0;
        Wed,  9 Dec 2020 12:14:24 +0000 (UTC)
Subject: [PATCH 00/18] keys: Miscellaneous fixes
From:   David Howells <dhowells@redhat.com>
To:     Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Cc:     "Alexander A. Klimov" <grandmaster@al2klimov.de>,
        Petko Manolov <petkan@mip-labs.com>,
        "Serge E. Hallyn" <serge@hallyn.com>, linux-kernel@vger.kernel.org,
        YueHaibing <yuehaibing@huawei.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Jann Horn <jannh@google.com>, linux-crypto@vger.kernel.org,
        Jarkko Sakkinen <jarkko@kernel.org>,
        Ben Boeckel <mathstuf@gmail.com>, keyrings@vger.kernel.org,
        Gabriel Krisman Bertazi <krisman@collabora.com>,
        linux-security-module@vger.kernel.org,
        Randy Dunlap <rdunlap@infradead.org>,
        Mimi Zohar <zohar@linux.vnet.ibm.com>,
        Tom Rix <trix@redhat.com>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Alex Shi <alex.shi@linux.alibaba.com>,
        Jarkko Sakkinen <jarkko.sakkinen@iki.fi>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        James Morris <jmorris@namei.org>,
        Denis Efremov <efremov@linux.com>,
        =?utf-8?q?Micka=C3=ABl_Sala=C3=BCn?= <mic@linux.microsoft.com>,
        David Woodhouse <dwmw2@infradead.org>,
        "David S. Miller" <davem@davemloft.net>,
        Tianjia Zhang <tianjia.zhang@linux.alibaba.com>,
        dhowells@redhat.com, keyrings@vger.kernel.org,
        linux-kernel@vger.kernel.org
Date:   Wed, 09 Dec 2020 12:14:24 +0000
Message-ID: <160751606428.1238376.14935502103503420781.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.23
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org


Hi Jarkko,

I've extended my collection of minor keyrings fixes for the next merge
window.  Anything else I should add (or anything I should drop)?

The patches can be found on the following branch:

	https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git/log/?h=keys-fixes

David
---
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

Mickaël Salaün (3):
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
 samples/Kconfig                          |  2 +-
 samples/watch_queue/watch_test.c         |  2 +-
 security/integrity/ima/ima_mok.c         |  3 +--
 security/keys/Kconfig                    |  8 ++++----
 security/keys/big_key.c                  |  9 +++------
 security/keys/key.c                      |  2 ++
 security/keys/keyctl.c                   |  2 +-
 security/keys/keyctl_pkey.c              |  2 --
 security/keys/keyring.c                  | 10 +++++-----
 20 files changed, 45 insertions(+), 46 deletions(-)


