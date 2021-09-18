Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF68F4104FA
	for <lists+keyrings@lfdr.de>; Sat, 18 Sep 2021 10:07:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235163AbhIRIJF (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Sat, 18 Sep 2021 04:09:05 -0400
Received: from out30-54.freemail.mail.aliyun.com ([115.124.30.54]:45271 "EHLO
        out30-54.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S243677AbhIRIJF (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Sat, 18 Sep 2021 04:09:05 -0400
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R191e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e01424;MF=tianjia.zhang@linux.alibaba.com;NM=1;PH=DS;RN=17;SR=0;TI=SMTPD_---0Uolxtge_1631952457;
Received: from localhost(mailfrom:tianjia.zhang@linux.alibaba.com fp:SMTPD_---0Uolxtge_1631952457)
          by smtp.aliyun-inc.com(127.0.0.1);
          Sat, 18 Sep 2021 16:07:38 +0800
From:   Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
To:     David Howells <dhowells@redhat.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Elvira Khabirova <e.khabirova@omp.ru>,
        Vitaly Chikunov <vt@altlinux.org>,
        Stefan Berger <stefanb@linux.ibm.com>,
        Eric Biggers <ebiggers@google.com>,
        Eric Biggers <ebiggers@kernel.org>,
        Mimi Zohar <zohar@linux.ibm.com>,
        "Gilad Ben-Yossef" <gilad@benyossef.com>,
        Pascal van Leeuwen <pvanleeuwen@rambus.com>,
        keyrings@vger.kernel.org, linux-crypto@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jia Zhang <zhang.jia@linux.alibaba.com>,
        "YiLin . Li" <YiLin.Li@linux.alibaba.com>
Cc:     Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
Subject: [PATCH v4 0/2] pkcs7: support SM2/SM3 and EC-RDSA/streebog algorithms
Date:   Sat, 18 Sep 2021 16:07:35 +0800
Message-Id: <20210918080737.17252-1-tianjia.zhang@linux.alibaba.com>
X-Mailer: git-send-email 2.19.1.3.ge56e4f7
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

This series of patches integrates the two patches sended separately,
resolves the conflict, and rebases on the latest code.

The two patches respectively support the SM2/SM3 and EC-RDSA/streebog
algorithm combinations for the pkcs7 parser.

Elvira Khabirova (1):
  pkcs7: support EC-RDSA/streebog in SignerInfo

Tianjia Zhang (1):
  pkcs7: parser support SM2 and SM3 algorithms combination

 crypto/asymmetric_keys/pkcs7_parser.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

-- 
2.19.1.3.ge56e4f7

