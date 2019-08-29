Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 53E0CA283F
	for <lists+keyrings@lfdr.de>; Thu, 29 Aug 2019 22:43:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726619AbfH2Unh (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 29 Aug 2019 16:43:37 -0400
Received: from mail-qk1-f177.google.com ([209.85.222.177]:37593 "EHLO
        mail-qk1-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726526AbfH2Unh (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 29 Aug 2019 16:43:37 -0400
Received: by mail-qk1-f177.google.com with SMTP id s14so4266589qkm.4
        for <keyrings@vger.kernel.org>; Thu, 29 Aug 2019 13:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bAoNbjAllZdcELU1B+DoBCuV11RmiWhSKzEmqF8B7f0=;
        b=KL1/DmgD+Aeu1gRXLc3ijuwsur3uPrkevZHDf3fkzykOgM7v+XfIiPEclDJpOM8PAS
         w0tqPWBqKx1VDrJD22Xs0NNSPm7S4tunij3BSlyJN409y3tRgLmiVSrIbWNOmk843mQh
         EysisbfnVE/FsKcJa89qY2il5qGqIPL48YUSoWmy6DuugEXR8WM0auqvv17JrXg4yi7O
         t4oHtREtBXv+YEbga2iUMasbDr30oUN1FEzTfeWPFp1O/0ctPzfau6I1THUoE9Ia3Cv7
         RMf4wbXrLtI4YEmOhmhv+ipvomGjfB9yxUhN/QBOmfn97w1PV78wqWoSTeYm5XXDYUpj
         FEtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bAoNbjAllZdcELU1B+DoBCuV11RmiWhSKzEmqF8B7f0=;
        b=B0aPFwcYBr0x2utHdbCEZ/Mg1WQpPCDlWanCisAPQzBPB3kZbcX2ubBrkx2YyBxUKw
         ATZkXkSgM3eSuBGL3zY37x1+LEsLEGa8Wrqu3edSVf3VMoZAxlOwVKqvwq8mD2ecB2em
         002dh65WFNzk3+0fV9Zacvh0nZZ1jkk9z6g37V7wuRoOhhJYtWBXHc9UH+D7NIsT5gU0
         6jBaM05NLgLTEpqKHMIQIKx2dQEtZATzkFjDoKYaVea9UnkjTNQSrphFeNhAT+pkfeuL
         5MvGa08jXePz7fmqqrbpGftAbUpoDD0kr5jRVLwbLdatH+jFrI5gJKvwngr69soh9dpk
         TbHQ==
X-Gm-Message-State: APjAAAWGR7luZI2Q9XpcM3Lfdut3qDsFRNKmBU5ZEAcDhQyQdu8DPiHU
        Z7XUApbpHOYM0Xu/ETddZeWiDv0q
X-Google-Smtp-Source: APXvYqwU46s5ljbim/oWOhOK83cennbpbzNcRoi5SeyLE9cJH0MvNcpBZNmUyWWWpKijJdUPkqNYEQ==
X-Received: by 2002:a37:444b:: with SMTP id r72mr11584416qka.361.1567111416363;
        Thu, 29 Aug 2019 13:43:36 -0700 (PDT)
Received: from localhost (tripoint.kitware.com. [66.194.253.20])
        by smtp.gmail.com with ESMTPSA id 143sm1815272qkl.114.2019.08.29.13.43.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2019 13:43:36 -0700 (PDT)
From:   Ben Boeckel <mathstuf@gmail.com>
To:     keyrings@vger.kernel.org
Cc:     Ben Boeckel <mathstuf@gmail.com>, dhowells@redhat.com
Subject: [PATCH v2 00/13] Test suite tidiness
Date:   Thu, 29 Aug 2019 16:43:08 -0400
Message-Id: <20190829204322.8015-1-mathstuf@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190829203542.4410-1-mathstuf@gmail.com>
References: <20190829203542.4410-1-mathstuf@gmail.com>
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

