Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C2FE493209
	for <lists+keyrings@lfdr.de>; Wed, 19 Jan 2022 01:55:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350516AbiASAzO (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 18 Jan 2022 19:55:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350544AbiASAzL (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Tue, 18 Jan 2022 19:55:11 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5487CC061574;
        Tue, 18 Jan 2022 16:55:11 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E2051614DC;
        Wed, 19 Jan 2022 00:55:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21430C340E0;
        Wed, 19 Jan 2022 00:55:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1642553710;
        bh=NGkBY5pZL1xINxMqyx1wMnRtQ+uGBnKSSP3TCy+p67Q=;
        h=From:To:Cc:Subject:Date:From;
        b=DXC3OO8ayneOE2iP8tHftJuPV1NAPew7G3gpOTGI6o43NNzsEs9FtgBXzkJ4PTH1X
         W4Udhhd/bZ0YCAGvkNGHmibhh0E9H4EZkVfjcvj9KgTM9862dcI54AsvjZ0pjvOalV
         +P/mngFxyPOwqa9Mar7mB+f5UhCc/1R9HXUZAowU8vOCu+C2y0tNXnR7R/IkLKFknz
         TKx9rV94pj9J/34/ZrEE8pgNci+OkKhxTIj/SK4f8S/HWm5FBi2+zLH2/dtbF2dpiW
         KQuEp89CjrBZOcnooUbNK99Tnb4t1D48d4kGm1pQE4OaaX1GPGvGf6jeAEAIjkjE9u
         OQpvsPa0B6uVQ==
From:   Eric Biggers <ebiggers@kernel.org>
To:     keyrings@vger.kernel.org, David Howells <dhowells@redhat.com>,
        Jarkko Sakkinen <jarkko@kernel.org>
Cc:     linux-crypto@vger.kernel.org
Subject: [PATCH v2 0/4] KEYS: x509: various cleanups
Date:   Tue, 18 Jan 2022 16:54:32 -0800
Message-Id: <20220119005436.119072-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

This series cleans up a few things in the X.509 certificate parser.

Changed v1 => v2:
  - Renamed label in patch 3
  - Added Acked-by's

Eric Biggers (4):
  KEYS: x509: clearly distinguish between key and signature algorithms
  KEYS: x509: remove unused fields
  KEYS: x509: remove never-set ->unsupported_key flag
  KEYS: x509: remove dead code that set ->unsupported_sig

 crypto/asymmetric_keys/pkcs7_verify.c     |  7 ++---
 crypto/asymmetric_keys/x509.asn1          |  2 +-
 crypto/asymmetric_keys/x509_cert_parser.c | 34 ++++++++++++-----------
 crypto/asymmetric_keys/x509_parser.h      |  1 -
 crypto/asymmetric_keys/x509_public_key.c  | 18 ------------
 5 files changed, 21 insertions(+), 41 deletions(-)

-- 
2.34.1

