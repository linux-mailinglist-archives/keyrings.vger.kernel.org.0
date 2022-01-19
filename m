Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 697D64931AD
	for <lists+keyrings@lfdr.de>; Wed, 19 Jan 2022 01:15:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235497AbiASAPA (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 18 Jan 2022 19:15:00 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:47614 "EHLO
        ams.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343884AbiASAO5 (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Tue, 18 Jan 2022 19:14:57 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 761D9B8173C;
        Wed, 19 Jan 2022 00:14:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8C52C340E0;
        Wed, 19 Jan 2022 00:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1642551295;
        bh=gDal28dMenmj0jRHl5VU8y1nh/h8BfgK45BJmvTBgIY=;
        h=From:To:Cc:Subject:Date:From;
        b=gMz0MAq+/r5cEse4AFL3qNRXnw0a/7X//BgMx9OdMM9poOcXbzmS1HFWijNt6w6rs
         q7v5kFLGtYZ6xIs+j0nkwqjnpnUCMPlTU8n+iqXUj96pO/4duJ36RUXFPfkQ2M80Ao
         zXHutNWx8rIoinoFcZD0Vu/DsLtf1cBWw4OTsHNWaUaO22vbeygl6wm3+nSShCYGo/
         qI/0wzC9brDdJtrC6lQ9eivOi1rUXNpSQEtCacaykzVEDDFmTwsnwalErDEo4931ej
         5j5WuiSv4g9m39uwlkEDq2Ji2nl9kpsJTLy97yXyvOPP8+ahevnRSy8zqBXH33AcyZ
         XidWYy2geQ6uw==
From:   Eric Biggers <ebiggers@kernel.org>
To:     linux-crypto@vger.kernel.org,
        Herbert Xu <herbert@gondor.apana.org.au>
Cc:     keyrings@vger.kernel.org, Vitaly Chikunov <vt@altlinux.org>,
        Denis Kenzior <denkenz@gmail.com>
Subject: [PATCH v2 0/5] crypto: rsa-pkcs1pad fixes
Date:   Tue, 18 Jan 2022 16:13:01 -0800
Message-Id: <20220119001306.85355-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

This series fixes some bugs in rsa-pkcs1pad.

Changed v1 => v2:
   - Added patch "crypto: rsa-pkcs1pad - only allow with rsa"
     (previously was a standalone patch)
   - Added patch "crypto: rsa-pkcs1pad - restore signature length check"

Eric Biggers (5):
  crypto: rsa-pkcs1pad - only allow with rsa
  crypto: rsa-pkcs1pad - correctly get hash from source scatterlist
  crypto: rsa-pkcs1pad - restore signature length check
  crypto: rsa-pkcs1pad - fix buffer overread in
    pkcs1pad_verify_complete()
  crypto: rsa-pkcs1pad - use clearer variable names

 crypto/rsa-pkcs1pad.c | 38 +++++++++++++++++++++++---------------
 1 file changed, 23 insertions(+), 15 deletions(-)

-- 
2.34.1

