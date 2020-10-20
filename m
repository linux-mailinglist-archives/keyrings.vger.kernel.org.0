Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C5C26293532
	for <lists+keyrings@lfdr.de>; Tue, 20 Oct 2020 08:50:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404570AbgJTGue (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 20 Oct 2020 02:50:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404564AbgJTGue (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Tue, 20 Oct 2020 02:50:34 -0400
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CED81C061755;
        Mon, 19 Oct 2020 23:50:32 -0700 (PDT)
Received: by mail-pf1-x432.google.com with SMTP id a200so614921pfa.10;
        Mon, 19 Oct 2020 23:50:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=dtVgW0MuBIZrvU3cBaxqWU1OtsP/NTcxRkKmiAbK34s=;
        b=IJQS2UShe77q/rYfjrodvDxpsKSpdQUAdHGuCSBePhhEP6ysQUN2hvOOOInBDamZ3w
         1/TsE9hlnW/GOzT7E7ta+DJvNA4p6u4x2yqkdKdXR5L0dnUkdJzK4xLtDNrFZgvVfIti
         7v4W4MxixMTlpzIUHR3nt4jT9F7sHEqYnKNPOhdb1OY974X+uYyZI96J0xhSfihq/0I9
         b0XRcHNkGkCAmwFhhwCpzF1unlknBXW3qARul235Tu03Y8fGtNAUir+kUxiqaP8bS9r5
         3EDvNKhyk7dMlrZVJZLfD/06Uh4QJLmGyqLyFsYcRsGKjyshnyKM+wvrDLlSG4uwcPJD
         RyNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=dtVgW0MuBIZrvU3cBaxqWU1OtsP/NTcxRkKmiAbK34s=;
        b=POsx+t7RIjrUdMOSU58uKdknxvn8SaNxI3Jc2ZrzFgFIQI6g21cP7GvhE3kgTfhk/x
         UxBlfzm86zuzTCGaaThjtEmx8FCRAshnRHKIlYPjKvklZ/K7rtYyZYGKPaDgrJ2FWKVy
         FT+2XSBLysmuy0p7RlKINd/hbpWTzbIpDVDzFGzNW2y2cGEx/DTgIb67IHWVDL5w2M9W
         iFsM4+YPnYJ3jgBTB0H7Jg5IM4CKlS27+3nj7BTeyW2R68JOJr9cZiaLHPeX3QAX4ARV
         Gs7gIDafH9snmmwwBIDxYp9qfaUgIKvtjnNaHCiOGkuDrV5ciWObkMHFiI20/GPfk2cm
         NS1Q==
X-Gm-Message-State: AOAM531gYxnOKvpgPf6YIGzdlevwqujdSY+917L4AjLxSJHW8w/vPZom
        XKwTcO9AhkN67lWSuKvF12ej1Px8g/9dYA==
X-Google-Smtp-Source: ABdhPJyW9SusjnvyGk8ZAS/YKY7G4a40X4OTOWCXIzkSlrlEdB2leVvvsyvt4CZEjMw+5WnFMTUu6Q==
X-Received: by 2002:a63:2547:: with SMTP id l68mr1446907pgl.241.1603176632318;
        Mon, 19 Oct 2020 23:50:32 -0700 (PDT)
Received: from linux-l9pv.suse ([124.11.22.254])
        by smtp.gmail.com with ESMTPSA id c203sm1026346pfb.96.2020.10.19.23.50.25
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 19 Oct 2020 23:50:27 -0700 (PDT)
From:   "Lee, Chun-Yi" <joeyli.kernel@gmail.com>
X-Google-Original-From: "Lee, Chun-Yi" <jlee@suse.com>
To:     David Howells <dhowells@redhat.com>
Cc:     Herbert Xu <herbert@gondor.apana.org.au>,
        "David S . Miller" <davem@davemloft.net>, keyrings@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
        "Lee, Chun-Yi" <jlee@suse.com>
Subject: [RFC PATCH 0/2] Check codeSigning extended key usage extension
Date:   Tue, 20 Oct 2020 14:49:59 +0800
Message-Id: <20201020065001.13836-1-jlee@suse.com>
X-Mailer: git-send-email 2.12.3
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

NIAP PP_OS certification requests that the OS shall validate the
CodeSigning extended key usage extension field for integrity
verifiction of exectable code:

    https://www.niap-ccevs.org/MMO/PP/-442-/
	FIA_X509_EXT.1.1

This patchset adds the logic for parsing the codeSigning EKU extension
field in X.509. And checking the CodeSigning EKU when verifying signature
of kernel module or kexec PE binary in PKCS#7.

Lee, Chun-Yi (2):
  X.509: Add CodeSigning extended key usage parsing
  PKCS#7: Check codeSigning EKU for kernel module and kexec pe
    verification

 certs/system_keyring.c                    |  2 +-
 crypto/asymmetric_keys/Kconfig            | 10 +++++++++
 crypto/asymmetric_keys/pkcs7_trust.c      | 37 ++++++++++++++++++++++++++++---
 crypto/asymmetric_keys/x509_cert_parser.c | 24 ++++++++++++++++++++
 include/crypto/pkcs7.h                    |  3 ++-
 include/crypto/public_key.h               |  1 +
 include/linux/oid_registry.h              |  5 +++++
 7 files changed, 77 insertions(+), 5 deletions(-)

-- 
2.16.4

