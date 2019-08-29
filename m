Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E8E04A281A
	for <lists+keyrings@lfdr.de>; Thu, 29 Aug 2019 22:35:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727108AbfH2Ufw (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 29 Aug 2019 16:35:52 -0400
Received: from mail-qk1-f195.google.com ([209.85.222.195]:43268 "EHLO
        mail-qk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726935AbfH2Ufw (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 29 Aug 2019 16:35:52 -0400
Received: by mail-qk1-f195.google.com with SMTP id m2so4191384qkd.10
        for <keyrings@vger.kernel.org>; Thu, 29 Aug 2019 13:35:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RwAJd+yd0IHYBNHAV7fCCrM9vL3MpZyP9N1UYgI+Vvg=;
        b=JW2cpYvyaL4mmGE2R7DOzMa4AJ/DM+h3IfoAZdswm7p6Mkj9/r9zpXcwK+A13DF1ir
         RwVoKwpcnWttcolBsaeyBwSi2kkO5yEVlbLWMDvFs0jefnJQrwetlhm1AiUWCEobQsiI
         hwGSGP3kmdrwRIVi3drRpxVBs568eKOL0g2RBxd4XOuQRMSjV/H2LhSwJnr/mAmC6xNf
         84p5LaZswdxHTKW9RK5PZycoa2GRBhAJ1/pta1mltzPsIdJeNSLFIRo8sBQqpxU0V8OD
         TE5LZyzTB2vEAe07VO9TeNgGYAGO/rUOwxoaSf7paDU5e4HkABd4xrHoAh1JHk0v+BH0
         903A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RwAJd+yd0IHYBNHAV7fCCrM9vL3MpZyP9N1UYgI+Vvg=;
        b=GdJFCBMAA4TsznfZIltRNbtQSvNxoZ3rI9bHO8Avv7M+/O389tdx3d8Vm8ECIAXq9Q
         L8XRSuRUUIjtcFr+H/mLe9jiYSOcRibKOAGg1qGFjYc28duz/4KMEvnS+k6ix8kPlEwo
         evCOu8HQUdrzE61APvzvxg9YMi+37OMLa32GuERMo5DUZEMb8cL4+N0/TW+0wOerw0HG
         BqEjlxRNUcMl+CTvrlLcoKcR1OFQKtwBkZzUBaGsWnuR5ymjM9BgXV5WdjRiYj4VPP4d
         /RLTlD1mw2pSiPDdO8IVEGhzonI0FALtSwaFuX74ns0WfcsuzjpGibZjxobAKWZe2R8T
         A3dg==
X-Gm-Message-State: APjAAAUcOlkKKdT+WotIS7P60Wn7V0dVYPK6qWn1Z3xK9kl/2kePRe9B
        JwmuE4iY8foJ/lXyoWfkJQ5G1LHk
X-Google-Smtp-Source: APXvYqzAYqbcas5tFWoSSz3RWMEYkCWCl20Zm/BCdzm2x/7UVjGZHg/nv+5E16qjrEdkjjh6DDCU2g==
X-Received: by 2002:a37:9a13:: with SMTP id c19mr11747677qke.378.1567110951734;
        Thu, 29 Aug 2019 13:35:51 -0700 (PDT)
Received: from localhost (tripoint.kitware.com. [66.194.253.20])
        by smtp.gmail.com with ESMTPSA id h8sm2392836qth.84.2019.08.29.13.35.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2019 13:35:51 -0700 (PDT)
From:   Ben Boeckel <mathstuf@gmail.com>
To:     keyrings@vger.kernel.org
Cc:     Ben Boeckel <mathstuf@gmail.com>, dhowells@redhat.com
Subject: [PATCH 6/9] tests/instantiating: test the unlinked keyid
Date:   Thu, 29 Aug 2019 16:35:31 -0400
Message-Id: <20190829203542.4410-9-mathstuf@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190829203542.4410-1-mathstuf@gmail.com>
References: <20190829203542.4410-1-mathstuf@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Testing the `0` ID just repeats the "BAD KEY" tests at the beginning of
the file.

Signed-off-by: Ben Boeckel <mathstuf@gmail.com>
---
 tests/keyctl/instantiating/bad-args/runtest.sh | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tests/keyctl/instantiating/bad-args/runtest.sh b/tests/keyctl/instantiating/bad-args/runtest.sh
index 1922282..a585e20 100644
--- a/tests/keyctl/instantiating/bad-args/runtest.sh
+++ b/tests/keyctl/instantiating/bad-args/runtest.sh
@@ -42,11 +42,11 @@ unlink_key --wait $keyid @s
 
 # check that a non-existent key ID fails correctly
 marker "CHECK NON-EXISTENT KEY ID"
-instantiate_key --fail 0 a @p
+instantiate_key --fail $keyid a @p
 expect_error EPERM
-pinstantiate_key --fail a 0 @p
+pinstantiate_key --fail a $keyid @p
 expect_error EPERM
-negate_key --fail 0 10 @p
+negate_key --fail $keyid 10 @p
 expect_error EPERM
 
 echo "++++ FINISHED TEST: $result" >>$OUTPUTFILE
-- 
2.21.0

