Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6A56568274E
	for <lists+keyrings@lfdr.de>; Tue, 31 Jan 2023 09:48:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231129AbjAaIsN (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 31 Jan 2023 03:48:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231358AbjAaIrv (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Tue, 31 Jan 2023 03:47:51 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 947F44CE6E
        for <keyrings@vger.kernel.org>; Tue, 31 Jan 2023 00:43:37 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jlu@pengutronix.de>)
        id 1pMmEl-0002nx-L2; Tue, 31 Jan 2023 09:43:31 +0100
Received: from [2a0a:edc0:0:1101:1d::39] (helo=dude03.red.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <jlu@pengutronix.de>)
        id 1pMmEl-001eKs-IY; Tue, 31 Jan 2023 09:43:30 +0100
Received: from jlu by dude03.red.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <jlu@pengutronix.de>)
        id 1pMmEj-005vrV-Rx; Tue, 31 Jan 2023 09:43:29 +0100
From:   Jan Luebbe <jlu@pengutronix.de>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Jan Luebbe <jlu@pengutronix.de>,
        David Howells <dhowells@redhat.com>,
        David Woodhouse <dwmw2@infradead.org>,
        keyrings@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH v2 0/2] Fix module signing with PKCS#11 URIs
Date:   Tue, 31 Jan 2023 09:43:21 +0100
Message-Id: <20230131084323.1414010-1-jlu@pengutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: jlu@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: keyrings@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Hi,

here are two patches to fix kernel module signing when using a key via
PKCS#11, including the case where the URI contains semicolons to
separate components.

Compared to v1, I've used the change suggested by Masahiro Yamada in the
first patch.

Jan Luebbe (2):
  certs: Fix build error when PKCS#11 URI contains semicolon
  kbuild: modinst: Fix build error when CONFIG_MODULE_SIG_KEY is a
    PKCS#11 URI

 certs/Makefile           | 4 ++--
 scripts/Makefile.modinst | 6 +++++-
 2 files changed, 7 insertions(+), 3 deletions(-)

-- 
2.30.2

