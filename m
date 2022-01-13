Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BEA0248E14E
	for <lists+keyrings@lfdr.de>; Fri, 14 Jan 2022 00:56:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238320AbiAMX4f (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 13 Jan 2022 18:56:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235897AbiAMX4e (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 13 Jan 2022 18:56:34 -0500
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70079C061574;
        Thu, 13 Jan 2022 15:56:34 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id BA57CCE2149;
        Thu, 13 Jan 2022 23:56:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7877CC36AEA;
        Thu, 13 Jan 2022 23:56:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1642118190;
        bh=CIrMY2d564B25U9ecs9IOid6+J96xKYmMQwVY4s4OKw=;
        h=From:To:Cc:Subject:Date:From;
        b=RGBBByxt1s7qrcMG5bZwANt1SaGSGQwJYnr56Dq1Gl45WhhTwkTN7JbMA4KWBe2ng
         B+jvZHEDK0iIJ5VHizNxr0veC2i9CXUpcOqSKh/b3Y4DhYmeUstu8PFvpWM27/YHfR
         3hiYIUCTYHgvI3qftu3CZQfmhasg31tf/z7CmvrFQFc6qGYCtAVePws4uE2VB46vNz
         3cxDt1dbXJUnxyQ2wPbKMYkzErjMgt74C5dz6zfjt+JesaiJ1zqKXDg5qB5s8Soe4i
         7Q+fnqZ0Om4k7q42CMbSFCFWRVG7XGAZLRpGa65L5WaCUsKRLdLNE+rIoP9iEDTWKQ
         DLn1NzwE8lJ9Q==
From:   Eric Biggers <ebiggers@kernel.org>
To:     keyrings@vger.kernel.org, David Howells <dhowells@redhat.com>,
        Jarkko Sakkinen <jarkko@kernel.org>
Cc:     Denis Kenzior <denkenz@gmail.com>,
        Marcel Holtmann <marcel@holtmann.org>,
        James Morris <james.morris@microsoft.com>,
        linux-crypto@vger.kernel.org
Subject: [PATCH 0/3] KEYS: fixes for asym_tpm keys
Date:   Thu, 13 Jan 2022 15:54:37 -0800
Message-Id: <20220113235440.90439-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

This series fixes some bugs in asym_tpm.c.

Eric Biggers (3):
  KEYS: asym_tpm: fix buffer overreads in extract_key_parameters()
  KEYS: asym_tpm: fix incorrect comment
  KEYS: asym_tpm: rename derive_pub_key()

 crypto/asymmetric_keys/asym_tpm.c | 44 +++++++++++++++++++------------
 1 file changed, 27 insertions(+), 17 deletions(-)


base-commit: feb7a43de5ef625ad74097d8fd3481d5dbc06a59
-- 
2.34.1

