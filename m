Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0FCE52D7F09
	for <lists+keyrings@lfdr.de>; Fri, 11 Dec 2020 20:06:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391471AbgLKTEm (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Fri, 11 Dec 2020 14:04:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389455AbgLKTEi (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Fri, 11 Dec 2020 14:04:38 -0500
Received: from smtp-bc0d.mail.infomaniak.ch (smtp-bc0d.mail.infomaniak.ch [IPv6:2001:1600:3:17::bc0d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9962C0613D3;
        Fri, 11 Dec 2020 11:03:44 -0800 (PST)
Received: from smtp-3-0000.mail.infomaniak.ch (unknown [10.4.36.107])
        by smtp-2-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4Ct0Yp75lPzlhF8B;
        Fri, 11 Dec 2020 20:03:42 +0100 (CET)
Received: from localhost (unknown [23.97.221.149])
        by smtp-3-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4Ct0Ym6xrMzlh8T4;
        Fri, 11 Dec 2020 20:03:40 +0100 (CET)
From:   =?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>
To:     David Howells <dhowells@redhat.com>,
        David Woodhouse <dwmw2@infradead.org>,
        Jarkko Sakkinen <jarkko@kernel.org>
Cc:     =?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>,
        "David S . Miller" <davem@davemloft.net>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        James Morris <jmorris@namei.org>,
        =?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@linux.microsoft.com>,
        Mimi Zohar <zohar@linux.ibm.com>,
        "Serge E . Hallyn" <serge@hallyn.com>, keyrings@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-integrity@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org
Subject: [PATCH v2 0/5] Enable root to update the blacklist keyring
Date:   Fri, 11 Dec 2020 20:03:25 +0100
Message-Id: <20201211190330.2586116-1-mic@digikod.net>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Hi,

This second patch series includes some minor fixes and remove the 4 fix
patches picked by David Howells.  This patch series can then be applied
on top of
https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git/log/?h=keys-fixes

The goal of these patches is to add a new configuration option to enable
the root user to load signed keys in the blacklist keyring.  This
keyring is useful to "untrust" certificates or files.  Enabling to
safely update this keyring without recompiling the kernel makes it more
usable.

Previous patch series:
https://lore.kernel.org/lkml/20201120180426.922572-1-mic@digikod.net/

Regards,

Mickaël Salaün (5):
  certs: Make blacklist_vet_description() more strict
  certs: Factor out the blacklist hash creation
  certs: Check that builtin blacklist hashes are valid
  certs: Allow root user to append signed hashes to the blacklist
    keyring
  tools/certs: Add print-cert-tbs-hash.sh

 MAINTAINERS                                   |   2 +
 certs/.gitignore                              |   1 +
 certs/Kconfig                                 |  10 +
 certs/Makefile                                |  15 +-
 certs/blacklist.c                             | 202 ++++++++++++++----
 crypto/asymmetric_keys/x509_public_key.c      |   3 +-
 include/keys/system_keyring.h                 |  14 +-
 scripts/check-blacklist-hashes.awk            |  37 ++++
 .../platform_certs/keyring_handler.c          |  26 +--
 tools/certs/print-cert-tbs-hash.sh            |  91 ++++++++
 10 files changed, 326 insertions(+), 75 deletions(-)
 create mode 100755 scripts/check-blacklist-hashes.awk
 create mode 100755 tools/certs/print-cert-tbs-hash.sh


base-commit: 1b91ea77dfeb2c5924ab940f2e43177c78a37d8f
-- 
2.29.2

