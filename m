Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 723A5444376
	for <lists+keyrings@lfdr.de>; Wed,  3 Nov 2021 15:27:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231816AbhKCO3u (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 3 Nov 2021 10:29:50 -0400
Received: from smtp-out1.suse.de ([195.135.220.28]:56740 "EHLO
        smtp-out1.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230527AbhKCO3t (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 3 Nov 2021 10:29:49 -0400
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
        by smtp-out1.suse.de (Postfix) with ESMTP id 6FCE5218D9;
        Wed,  3 Nov 2021 14:27:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1635949632; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
        bh=Dog1kS0Nm8BT5xToDrdeBUJVtPUNFmm5wWj5SRd7+2I=;
        b=BORuspiw5Z2g1pJmzhS/Mn/w26i3SRVFn4yIidQgmvBEwaNrAoDYRkIsdA1J7ZtN8oUtx8
        /m/9RbtrEeXQNjK/UZyI0IkzAkQWSeNrBkGMWK3WLWwzXhx80V04K9Q+i1p/2b8Bc5IJu7
        aTVOKIZI7QIiWwdudr4Z694kUKcYpiU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1635949632;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
        bh=Dog1kS0Nm8BT5xToDrdeBUJVtPUNFmm5wWj5SRd7+2I=;
        b=FTgDDkPGlsImvWmFW+/Zw3OfT/3JwHgMG85BIekvkJkkoZVThpg3GQtPj8HmbLxg9F/bCi
        t/ooTeugcRuWZkDw==
Received: from kitsune.suse.cz (kitsune.suse.cz [10.100.12.127])
        by relay2.suse.de (Postfix) with ESMTP id 3C1A9A3B84;
        Wed,  3 Nov 2021 14:27:11 +0000 (UTC)
From:   Michal Suchanek <msuchanek@suse.de>
To:     keyrings@vger.kernel.org
Cc:     Michal Suchanek <msuchanek@suse.de>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Heiko Carstens <hca@linux.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Alexander Gordeev <agordeev@linux.ibm.com>,
        David Howells <dhowells@redhat.com>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Jessica Yu <jeyu@kernel.org>, Rob Herring <robh@kernel.org>,
        Lakshmi Ramasubramanian <nramas@linux.microsoft.com>,
        Thiago Jung Bauermann <bauerman@linux.ibm.com>,
        Hari Bathini <hbathini@linux.ibm.com>,
        Frank van der Linden <fllinden@amazon.com>,
        linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        linux-s390@vger.kernel.org
Subject: [PATCH 0/3] KEXEC_SIG with appended signature
Date:   Wed,  3 Nov 2021 15:27:05 +0100
Message-Id: <cover.1635948742.git.msuchanek@suse.de>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

S390 uses appended signature for kernel but implements the check
separately from module loader.

Support for secure boot on powerpc with appended signature is planned -
grub patches submitted upstream but not yet merged.

This is an attempt at unified appended signature verification.

Thanks

Michal

Michal Suchanek (3):
  s390/kexec_file: Don't opencode appended signature verification.
  module: strip the signature marker in the verification function.
  powerpc/kexec_file: Add KEXEC_SIG support.

 arch/powerpc/Kconfig                  | 11 +++++++
 arch/powerpc/kexec/elf_64.c           | 14 +++++++++
 arch/s390/kernel/machine_kexec_file.c | 42 +++------------------------
 include/linux/verification.h          |  3 ++
 kernel/module-internal.h              |  2 --
 kernel/module.c                       | 11 +++----
 kernel/module_signing.c               | 32 ++++++++++++++------
 7 files changed, 59 insertions(+), 56 deletions(-)

-- 
2.31.1

