Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C432188CC3
	for <lists+keyrings@lfdr.de>; Sat, 10 Aug 2019 20:28:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726014AbfHJS21 (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Sat, 10 Aug 2019 14:28:27 -0400
Received: from out0-156.mail.aliyun.com ([140.205.0.156]:34300 "EHLO
        out0-156.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725862AbfHJS20 (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Sat, 10 Aug 2019 14:28:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=alibaba-inc.com; s=default;
        t=1565461704; h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type;
        bh=iBGkeVlRiDneaOi3FXFXaVAp22xHQP20SWMoEX+C9JY=;
        b=inGOZF0q7/uhLD98QucOeC6/N6hd1IaiZTKyK2wlwltE2scwiEmeYfHUgxJqUpZMHNdEA8UAGLPfL8chMvwatFJVQJLEbvHc/KmEEOjWdHtdlX+/Y26zemrxIOysFFlTi2pvZZtw0kXhiXeiS6Zv0g/jRMaO1r/aVsdj8r+bw60=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R111e4;CH=green;DM=||false|;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01l07440;MF=yihao.wyh@alibaba-inc.com;NM=1;PH=DS;RN=4;SR=0;TI=SMTPD_---.F9m5eqJ_1565461704;
Received: from ali-186590dcce93-2.local(mailfrom:yihao.wyh@alibaba-inc.com fp:SMTPD_---.F9m5eqJ_1565461704)
          by smtp.aliyun-inc.com(127.0.0.1);
          Sun, 11 Aug 2019 02:28:24 +0800
To:     David Howells <dhowells@redhat.com>, keyrings@vger.kernel.org
Cc:     Jia Zhang <zhang.jia@linux.alibaba.com>
From:   "Yihao Wu" <yihao.wyh@alibaba-inc.com>
Subject: [PATCH] KEYS: pass expiry from X.509 cert to key structure
Message-ID: <ebc38740-53b8-0008-9697-c4d39e98a958@alibaba-inc.com>
Date:   Sun, 11 Aug 2019 02:29:00 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Expiry time is not utilized by X.509 cert yet. This patch reads expiry
from X.509 cert into key_preparsed_payload. Then it is passed to key
structure when the key is being instantiated.

Signed-off-by: Yihao Wu <wuyihao@linux.alibaba.com>
---
 crypto/asymmetric_keys/x509_public_key.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/crypto/asymmetric_keys/x509_public_key.c b/crypto/asymmetric_keys/x509_public_key.c
index d964cc82b69c..6315da3b21c3 100644
--- a/crypto/asymmetric_keys/x509_public_key.c
+++ b/crypto/asymmetric_keys/x509_public_key.c
@@ -227,6 +227,7 @@ static int x509_key_preparse(struct key_preparsed_payload *prep)
     prep->payload.data[asym_auth] = cert->sig;
     prep->description = desc;
     prep->quotalen = 100;
+    prep->expiry = cert->valid_to;
 
     /* We've finished with the certificate */
     cert->pub = NULL;
-- 
2.21.0


