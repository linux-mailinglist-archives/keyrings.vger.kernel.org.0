Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A1CA048E5FB
	for <lists+keyrings@lfdr.de>; Fri, 14 Jan 2022 09:22:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240522AbiANIW3 (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Fri, 14 Jan 2022 03:22:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239883AbiANIVS (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Fri, 14 Jan 2022 03:21:18 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 273CAC0617A6;
        Fri, 14 Jan 2022 00:21:12 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id BB04861E2E;
        Fri, 14 Jan 2022 08:21:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E35DFC36AEC;
        Fri, 14 Jan 2022 08:21:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1642148471;
        bh=epCDida4a4Ou2Fod/Q+FP4fZKEQDmGyRp8ACSKP+uw8=;
        h=From:To:Cc:Subject:Date:From;
        b=dG6o01Y9ONAiRtJ+NuDHQNWJnacHL1Ah31z9hF5XnPLnSRuEkFt4A5/0krr8G5aZ1
         1poED0aWds57+CvgVZX9IZ8frUZnHK+ne9vRG8MJJ7JTskcxeix8IZrCJ8YHlriON4
         I2SIjWsU5e89sOUJgLX+nK6dnH8txev7Z7pL994E/zD/TjA2G4Nldno1SwwiSQY5k4
         Y7Ur+8cC9vd0kNujBysvBBW+gN5Wg8j0D6jS302UXxDpHFZCWdZTqev8P1no1noqA+
         BCbJ9YYSZ0/vEsXw+M9krHgS6fW2GD6y1EtrFR1FkGgNlblQIRi9dpIGMVS9RvKq8Z
         omI83auNrwlOQ==
From:   Eric Biggers <ebiggers@kernel.org>
To:     linux-crypto@vger.kernel.org,
        Herbert Xu <herbert@gondor.apana.org.au>
Cc:     keyrings@vger.kernel.org, Vitaly Chikunov <vt@altlinux.org>,
        Denis Kenzior <denkenz@gmail.com>
Subject: [PATCH 0/3] crypto: more rsa-pkcs1pad fixes
Date:   Fri, 14 Jan 2022 00:19:36 -0800
Message-Id: <20220114081939.218416-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

This series fixes two more bugs in rsa-pkcs1pad.

Eric Biggers (3):
  crypto: rsa-pkcs1pad - correctly get hash from source scatterlist
  crypto: rsa-pkcs1pad - fix buffer overread in
    pkcs1pad_verify_complete()
  crypto: rsa-pkcs1pad - use clearer variable names

 crypto/rsa-pkcs1pad.c | 33 ++++++++++++++++++---------------
 1 file changed, 18 insertions(+), 15 deletions(-)

-- 
2.34.1

