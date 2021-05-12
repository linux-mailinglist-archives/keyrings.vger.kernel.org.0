Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B80537BF41
	for <lists+keyrings@lfdr.de>; Wed, 12 May 2021 16:05:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231185AbhELOGa (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 12 May 2021 10:06:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230357AbhELOGa (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 12 May 2021 10:06:30 -0400
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A7D3C061574;
        Wed, 12 May 2021 07:05:22 -0700 (PDT)
Received: by mail-pg1-x52f.google.com with SMTP id m37so18273601pgb.8;
        Wed, 12 May 2021 07:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=mfxukj8KJruE0lp3Fq4wTiQy2vf2/wXZ2rxnax+kkmQ=;
        b=rpmHPk/eofDrP9TFGnsan7MiOOzs+/ymHaTkwyVj4GeOywB548WPJv/VRNjyQY0npU
         SC/bvpC687fM0SQdcYzS8TlW6SU8djy0JnknsnV9AAHce8RCkUt7mMmuwgKWWIDljTNU
         ggo7jbMFzK6rNWGZOcyrxrSJSj1DaiQW5iOxOPHkQgXoVwes9Ii3Mi8YTbS1KmJRtarO
         688Mw/uf2Kr92Xzmp4SQFNx3Ub5JALtewsqSvYlQ3Y+mDLXIwmzHCZ0UBWtFr14Qm9Si
         uVmxGt8vn9x/Jz3/F19XcwOofEvACA0J+r+N/eJpZVpHkPWLsN2VXSUUQcd22bOiG90B
         Bngw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=mfxukj8KJruE0lp3Fq4wTiQy2vf2/wXZ2rxnax+kkmQ=;
        b=gvbSWCot8Gu+hqcajnAl+6zuaM/B5X7VTaEM6Yz5ZpZ5ZAnmqT5+bFokaqgvwBLxmp
         dfrfV+1D84gwbT4VoNzUXEgWrljtL5Qhril1gyHF7Q7Ua8CRsQLY0EwwEMOY7jgdr4fU
         P2fcKLn0W0IFe96UJmckamKff0cywsr3uFd1tHt4jW0Kw8BXtJkqFXvRpt7c78Z+VcoW
         FJ+8RQNog6Duj0nWSuPVbKlEfudYH6dEmESfRFuX06umIx7okFmmuoya4dghRVuIMlhe
         SSIdI29uL0tmzIQHhBI03aBwHu5R2YnkSWInuAaXDuZNeDtkUiuBwR9WU2HKiezGJCS3
         h4Pg==
X-Gm-Message-State: AOAM53368UEcwisY29c3dFjjOCS0rFgljV9b4fs2SpsChyPtkeD8q+ab
        vIdq8LV2n+pawwxgKS/Sn/WUHyMsxUI=
X-Google-Smtp-Source: ABdhPJzKjzHSffIR1haHs0lyG408f0+KjkiXI5+qC8IIwsHS8s6QkYkSxEIqKd4+ufGnT/FZJKZJ8A==
X-Received: by 2002:a62:6491:0:b029:28e:8c90:6b16 with SMTP id y139-20020a6264910000b029028e8c906b16mr35233085pfb.24.1620828321489;
        Wed, 12 May 2021 07:05:21 -0700 (PDT)
Received: from localhost.localdomain ([203.205.141.39])
        by smtp.gmail.com with ESMTPSA id in16sm28546pjb.14.2021.05.12.07.05.19
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 12 May 2021 07:05:20 -0700 (PDT)
From:   Hongbo Li <herbert.tencent@gmail.com>
To:     keyrings@vger.kernel.org, linux-crypto@vger.kernel.org,
        herbert@gondor.apana.org.au, dhowells@redhat.com,
        jarkko@kernel.org, tianjia.zhang@linux.alibaba.com,
        herberthbli@tencent.com
Cc:     linux-kernel@vger.kernel.org, Hongbo Li <herbert.tencent@gmail.com>
Subject: [PATCH 0/7] crypto: add eddsa support for x509
Date:   Wed, 12 May 2021 22:04:07 +0800
Message-Id: <1620828254-25545-1-git-send-email-herbert.tencent@gmail.com>
X-Mailer: git-send-email 1.8.3.1
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

From: Hongbo Li <herberthbli@tencent.com>

This series of patches add support for x509 cert signed by eddsa,
which is described in RFC8032 [1], currently ed25519 only.

According to RFC8032 section 4 [2], there're two variants: PureEdDSA and
HashEdDSA. These patches support PureEdDSA which named Ed25519.

Patch1 fix a memory leak bug in sm2.

Patch2 fix a mpi_resize bug, this bug will cause eddsa verification failed.

Patch3 exports some mpi common functions.

Patch4 makes x509 layer support eddsa.

Patch5 moves some common code in sm2 to separate files. These code is also
       used by eddsa.

Patch6 is the implementation of eddsa verification according to RFC8032
       section 5.1.7 [3].

Patch7 adds test vector for eddsa.

Test by the following script:

keyctl newring test @u

while :; do
    certfile="cert.der"

    openssl req \
            -x509 \
            -newkey ED25519 \
            -keyout key.pem \
            -days 365 \
            -subj '/CN=test' \
            -nodes \
            -outform der \
            -out ${certfile} 2>/dev/null

    exp=0
    id=$(keyctl padd asymmetric testkey %keyring:test < "${certfile}")
    rc=$?
    if [ $rc -ne $exp ]; then
        case "$exp" in
            0) echo "Error: Could not load ed25519 certificate $certfile!";
        esac
        exit 1
    else
        case "$rc" in
            0) printf "load ed25519 cert keyid: %-10s\n" $id;
        esac
    fi
done

Best Regards

Hongbo

[1] https://datatracker.ietf.org/doc/html/rfc8032
[2] https://datatracker.ietf.org/doc/html/rfc8032#section-4
[3] https://datatracker.ietf.org/doc/html/rfc8032#section-5.1.7

Hongbo Li (7):
  crypto: fix a memory leak in sm2
  lib/mpi: use kcalloc in mpi_resize
  lib/mpi: export some common function
  x509: add support for eddsa
  crypto: move common code in sm2 to ec_mpi.c and ec_mpi.h
  crypto: support ed25519 x509 cert
  crypto: add eddsa test vector

 crypto/Kconfig                            |  15 ++++
 crypto/Makefile                           |   4 +
 crypto/asymmetric_keys/public_key.c       |  73 +++++++++++++--
 crypto/asymmetric_keys/x509_cert_parser.c |  14 ++-
 crypto/asymmetric_keys/x509_public_key.c  |   4 +-
 crypto/sm2.c                              | 104 +---------------------
 crypto/testmgr.c                          |   6 ++
 crypto/testmgr.h                          |  32 +++++++
 include/linux/oid_registry.h              |   1 +
 lib/mpi/mpi-add.c                         |   4 +-
 lib/mpi/mpiutil.c                         |   2 +-
 11 files changed, 146 insertions(+), 113 deletions(-)

-- 
2.27.0

