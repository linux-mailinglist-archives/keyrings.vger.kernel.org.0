Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B4666637AE2
	for <lists+keyrings@lfdr.de>; Thu, 24 Nov 2022 15:00:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230415AbiKXOAt (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 24 Nov 2022 09:00:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230255AbiKXOAf (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 24 Nov 2022 09:00:35 -0500
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E1C313F4AB
        for <keyrings@vger.kernel.org>; Thu, 24 Nov 2022 05:58:34 -0800 (PST)
Received: by mail-wm1-x336.google.com with SMTP id j5-20020a05600c410500b003cfa9c0ea76so1301380wmi.3
        for <keyrings@vger.kernel.org>; Thu, 24 Nov 2022 05:58:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FLYGIY1cjSaO8iMr+6IveYVeTtbbWK2zYM30V3Bwty4=;
        b=fUMAZbkFZkyQCLNk7f66kU61yfocH/0UqmdSp0zdUHTGOZ79YhOTbvqMNBl3qGhN91
         5kjEnU8oWNbqaBNlok68y7eHenJUWKDR0noHJJ85VfBpN0Y+Dt6sVhUpkWei1ZLensFO
         UQJKjDgLInKe1XEXKarXu8sQTV4rmW7n/Yb60=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FLYGIY1cjSaO8iMr+6IveYVeTtbbWK2zYM30V3Bwty4=;
        b=Uu3nyiVZdgZNM3zygWiAajm2FhZc9g/ThBIMaw4xLOOQqwbKxSaGFjN2sa6I4YgKJn
         toeddoX1UdL8f9UXIkS3OoamE9+dmNUQcNLFCDMGh+h2CMzrhmy9Kl899n2EsO1H0u5m
         EZj7nX9dYYOEn5AAOKIBrvDToIHRroxgPt3CrOY1UAnMli/wnA86VEXKOopLUB52HfTF
         tyMrdL8kniTokeklWKJXu1CUkO43UlzQejuymaE3XWDZtsDdZTHtYDQy4CfogxNvPluG
         xbnhEEgQjkoeEKQaXdf+txlnRy9GFuyLw04r1qQTSlDvMXqvZ1aEgvpGa4hQafbMHEhL
         zWrA==
X-Gm-Message-State: ANoB5pnr1IVh47G/159fpdKxEYFe4WoeErgZAwEcLZEqmB4YBMwCNXp1
        UrMD9S1VUzf3G86cWNAwCnn17A==
X-Google-Smtp-Source: AA0mqf4/QBhLyxEoDVdGqBp609ooHToWLVOwDE/1LbsJTnLrEg3y4oxHdGyVwSH6CRxaRz0UtmWzIg==
X-Received: by 2002:a05:600c:1d09:b0:3cf:6ab3:4a0b with SMTP id l9-20020a05600c1d0900b003cf6ab34a0bmr26840189wms.91.1669298311983;
        Thu, 24 Nov 2022 05:58:31 -0800 (PST)
Received: from localhost.localdomain ([2a09:bac1:28c0:140::15:1b6])
        by smtp.gmail.com with ESMTPSA id n14-20020a5d660e000000b00241bee11825sm1371440wru.103.2022.11.24.05.58.30
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 24 Nov 2022 05:58:31 -0800 (PST)
From:   Ignat Korchagin <ignat@cloudflare.com>
To:     Herbert Xu <herbert@gondor.apana.org.au>,
        "David S . Miller" <davem@davemloft.net>,
        linux-crypto@vger.kernel.org, David Howells <dhowells@redhat.com>,
        keyrings@vger.kernel.org
Cc:     kernel-team@cloudflare.com, Ignat Korchagin <ignat@cloudflare.com>
Subject: [RESEND PATCH v2 0/4] crypto, keys: add ECDSA signature support to key retention service
Date:   Thu, 24 Nov 2022 13:58:08 +0000
Message-Id: <20221124135812.26999-1-ignat@cloudflare.com>
X-Mailer: git-send-email 2.37.1 (Apple Git-137.1)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Changes from v1:
  * fixed code format

Kernel Key Retention Service[1] is a useful building block to build secure
production key management systems. One of its interesting features is
support for asymmetric keys: we can allow a process to use a certain key
(decrypt or sign data) without actually allowing the process to read the
cryptographic key material. By doing so we protect our code from certain
type of attacks, where a process memory memory leak actually leaks a
potentially highly sensitive cryptographic material.

But unfortunately only RSA algorithm was supported until now, because
in-kernel ECDSA implementation supported signature verifications only.

This patchset implements in-kernel ECDSA signature generation and adds
support for ECDSA signing in the key retention service. The key retention
service support was taken out of a previous unmerged patchset from Lei He[2]

[1]: https://www.kernel.org/doc/html/latest/security/keys/core.html
[2]: https://patchwork.kernel.org/project/linux-crypto/list/?series=653034&state=*

Original posting: https://patchwork.kernel.org/project/keyrings/cover/20221014100737.94742-1-ignat@cloudflare.com/

Ignat Korchagin (2):
  crypto: add ECDSA signature generation support
  crypto: add ECDSA test vectors from RFC 6979

lei he (2):
  crypto: pkcs8 parser support ECDSA private keys
  crypto: remove unused field in pkcs8_parse_context

 crypto/Kconfig                        |   3 +-
 crypto/Makefile                       |   4 +-
 crypto/asymmetric_keys/pkcs8.asn1     |   2 +-
 crypto/asymmetric_keys/pkcs8_parser.c |  46 +++-
 crypto/ecc.c                          |  19 +-
 crypto/ecdsa.c                        | 373 +++++++++++++++++++++++++-
 crypto/ecprivkey.asn1                 |   6 +
 crypto/testmgr.c                      |  18 ++
 crypto/testmgr.h                      | 333 +++++++++++++++++++++++
 include/crypto/internal/ecc.h         |  10 +
 10 files changed, 792 insertions(+), 22 deletions(-)
 create mode 100644 crypto/ecprivkey.asn1

-- 
2.30.2

