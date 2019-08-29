Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7D545A2812
	for <lists+keyrings@lfdr.de>; Thu, 29 Aug 2019 22:35:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726661AbfH2Ufq (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 29 Aug 2019 16:35:46 -0400
Received: from mail-qt1-f174.google.com ([209.85.160.174]:37622 "EHLO
        mail-qt1-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726526AbfH2Ufq (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 29 Aug 2019 16:35:46 -0400
Received: by mail-qt1-f174.google.com with SMTP id y26so5260232qto.4
        for <keyrings@vger.kernel.org>; Thu, 29 Aug 2019 13:35:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bAoNbjAllZdcELU1B+DoBCuV11RmiWhSKzEmqF8B7f0=;
        b=WN9lXKlZaA7YJ/kBeAnIAECcIF8VkvQSuOQxv3CGbtJ4QSPQXJbou2FbtM4f/9xXWp
         VhqgUPjH8a/jLm1vVN5gyvTfMHP6EZyluSm5ArFDNWoNTvMvfAfyl/1M+cRqKiGOBxOY
         etyrX5t5BRngdwda4Hc1nVzK6PXxBduND2oBli2Z8K8mhPv3rRahaX6BXor1GksC+CpP
         QJWYM5cxdDTUgcnB0cuwyJPiy6xeA2a5+eEAjECIFZFxvgmxwebS4WpIMjXH1TUjsEGr
         8B+RnRI8hLgyPOtrT7mq/XJEQTM2p/xhM2Vh7YiKT/8SX7OxQhd/6SVXHELHe+EFXpFz
         czrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bAoNbjAllZdcELU1B+DoBCuV11RmiWhSKzEmqF8B7f0=;
        b=RnW9khTEDI0alrnkrV3RPMbzYj8XSSZfgsdXEIo+UT9+tQxPVIfVxvMYUi657PG/hS
         5SzgtT9nSEo7DGwVT8wYOpirGck5HgDQUYvF9rgjwbLu+zYX0kyb5hANyLaK3n3bn2MT
         0bDfHxPJBNz3jsvBdpzGpAXnTH52JHRrgB8JPIr3Kfn5JlLuO6EvVcEJLQh7i4kARoye
         e54nGbiosIup2UVoHzurGlZllKgTlhksnnU7yQvr8m1L+MAuxlh1iZN1kSij7sAiLReN
         Po+Iu/KkZ+TMymS38kpXqGqO8W4jXOXSjScK8lkAmvmfTfNrl/wZLummbMU+RJRhjF5M
         g5aA==
X-Gm-Message-State: APjAAAXYsJWZT+7UgzLHN20oku717wmi06I8Lg07os1jTSpmn6SRniL9
        DSx7CtymIxbg+tJXTTBDET9liFPE
X-Google-Smtp-Source: APXvYqyEduYW4a4/DQi+jAJTahafUPBwVtKKeextEDFsyrx8D3aZE4+5feWItPL/tsx7nVw4pEmKqw==
X-Received: by 2002:ad4:50d1:: with SMTP id e17mr8124166qvq.9.1567110945093;
        Thu, 29 Aug 2019 13:35:45 -0700 (PDT)
Received: from localhost (tripoint.kitware.com. [66.194.253.20])
        by smtp.gmail.com with ESMTPSA id q123sm1656509qkf.52.2019.08.29.13.35.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2019 13:35:44 -0700 (PDT)
From:   Ben Boeckel <mathstuf@gmail.com>
To:     keyrings@vger.kernel.org
Cc:     Ben Boeckel <mathstuf@gmail.com>, dhowells@redhat.com
Subject: [PATCH 00/13] Test suite tidiness
Date:   Thu, 29 Aug 2019 16:35:23 -0400
Message-Id: <20190829203542.4410-1-mathstuf@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

A collection of minor patches to the test suite I discovered while
porting to the Rust bindings I've been working on:

    https://github.com/mathstuf/rust-keyutils
    https://github.com/mathstuf/rust-keyutils/pull/34 (for the porting of the test suite)

Mostly typos, relocating some tests to what seems to be more sensible
location, fixing some copy/pasta, and adding some missed test cases.
The patches were developed against master, but have been rebased here
against `next` to make it easier to add to it. If that is incorrect, I
can rebase onto `master` and respin.

Note that I'm sending these for review now, but I'll be on vacation for
a few weeks. Feel free to leave review comments; I'll act on them once I
return.

Thanks,

--Ben

Ben Boeckel (13):
  tests/toolbox: detect endianness with PIE executables
  tests: fix some typos in marker lines
  tests: remove some trailing whitespace
  keyctl: unify spelling of "unparsable"
  tests: fix typos in test comments
  tests/revoke: test key revokation in the revoke tests
  tests/timeout: test actions on an expired keyring as well
  tests/instantiating: test the unlinked keyid
  test/instantiating: test bad arguments for `keyctl reject`
  tests/reading: fix test comment
  tests/reading: remove revokation test
  tests/search: test searching with a mismatched type
  tests/search: test a found key without search permissions

 keyctl.c                                      |  6 ++--
 tests/keyctl/add/bad-args/runtest.sh          |  2 +-
 tests/keyctl/clear/valid/runtest.sh           |  2 +-
 tests/keyctl/dh_compute/bad-args/runtest.sh   |  2 +-
 .../keyctl/instantiating/bad-args/runtest.sh  | 20 ++++++++++--
 tests/keyctl/link/recursion/runtest.sh        |  2 +-
 tests/keyctl/newring/bad-args/runtest.sh      |  2 +-
 tests/keyctl/padd/bad-args/runtest.sh         |  2 +-
 tests/keyctl/pupdate/userupdate/runtest.sh    | 10 +++---
 tests/keyctl/reading/valid/runtest.sh         |  8 +----
 tests/keyctl/requesting/bad-args/runtest.sh   |  2 +-
 tests/keyctl/requesting/piped/runtest.sh      |  4 +--
 tests/keyctl/requesting/valid/runtest.sh      |  4 +--
 tests/keyctl/revoke/valid/runtest.sh          | 20 ++++++++++++
 tests/keyctl/search/bad-args/runtest.sh       |  2 +-
 tests/keyctl/search/valid/runtest.sh          | 13 +++++---
 tests/keyctl/session/bad-args/runtest.sh      |  2 +-
 tests/keyctl/timeout/valid/runtest.sh         | 32 +++++++++----------
 tests/keyctl/unlink/all/runtest.sh            |  2 +-
 tests/keyctl/unlink/valid/runtest.sh          |  4 +--
 tests/keyctl/update/userupdate/runtest.sh     | 14 ++++----
 tests/toolbox.inc.sh                          | 26 +++++++++++++--
 22 files changed, 117 insertions(+), 64 deletions(-)

-- 
2.21.0

