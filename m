Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8CDD1745E5C
	for <lists+keyrings@lfdr.de>; Mon,  3 Jul 2023 16:18:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229719AbjGCOSR (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Mon, 3 Jul 2023 10:18:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229656AbjGCOSQ (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Mon, 3 Jul 2023 10:18:16 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63486E60
        for <keyrings@vger.kernel.org>; Mon,  3 Jul 2023 07:18:14 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-307d20548adso5005470f8f.0
        for <keyrings@vger.kernel.org>; Mon, 03 Jul 2023 07:18:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688393893; x=1690985893;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=k7CiJPEXfB/mPmolwvUH6t7dx6TKSOIIJmAn9VAkdqw=;
        b=BT3omfXSB3tnc4/9PQPsSKSw7cx/qjf/1NXY1wt3Q4TvbbFW5ekgxa0mQcUZPMjfeV
         nM8RiwzvvoyJ8YKGKT5FlbFzg6VWUe1ppRtzVXStYS92HDR9bLci298+IUiKjgbWycmj
         357oGZdMtDCWBYAB3AC5EYdouPZuszAUAOjyrrzu4g4lQyE137pUUFAat5oP7luo0Ffd
         jeAu+K0XLk+mez5brGbWDwfh7yPI0sxUcG5bCkgcHR9FchvUxSe8xNCRVHoDfY3ZvY60
         eDIevhPL5HNFOTVeUEmDvudJGjbpjklwSJ4RYoBNeujQKVpYijBpMHecavNIWLClwfUB
         qzoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688393893; x=1690985893;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=k7CiJPEXfB/mPmolwvUH6t7dx6TKSOIIJmAn9VAkdqw=;
        b=BnDeeT8T/PocoD74G/esxKH1Zy6nmli6lC1UQ3aMBXvZi4jH5wbXFQazAmw6QSb4di
         NbF/ZFbXIAoUswo0SB6u5+Gh9muNKjzqWkdW0T8S1aNm07ZRXZajVM/l/o94Zx+u8biA
         5xaUS9yD0hMiOA7YmrwFfq9eqHYzgAOrZ+ODx9/XPAGgp7TzvVjF/DA65T0zDnxGijXe
         SOytUO3W7nI9epysE5JSSa6GQS3UzSjpDWEw35dyDnWami550S2EkRtSf8jPPQVV3WdX
         5h5YL0ypDfQE/luIz1KdNDRX2kP0TwT+uB9sf+VzfeSCx0HrNKYo6pu5rwfn3he7N810
         RMvA==
X-Gm-Message-State: ABy/qLYGwifvH8eb9G5YMrkTSvhqziOlKoBg99gm6tmyZHWD7PaSD9vy
        vK0Ng5tq9qNMYc26UfZV6v2edQ==
X-Google-Smtp-Source: APBJJlEfnqKOoSS2ucE8MaIOcLJR/x7mdTN0VM771Waqqjt25CgAaEUgofxqr6Xluv6cSjS6uVAUEA==
X-Received: by 2002:a5d:4f86:0:b0:30f:c42e:3299 with SMTP id d6-20020a5d4f86000000b0030fc42e3299mr7758185wru.60.1688393892860;
        Mon, 03 Jul 2023 07:18:12 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id q10-20020adfdfca000000b003141e629cb6sm9813243wrn.101.2023.07.03.07.18.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jul 2023 07:18:11 -0700 (PDT)
Date:   Mon, 3 Jul 2023 17:18:08 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Herbert Xu <herbert@gondor.apana.org.au>
Cc:     David Howells <dhowells@redhat.com>,
        "David S. Miller" <davem@davemloft.net>, keyrings@vger.kernel.org,
        linux-crypto@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] KEYS: asymmetric: Fix error codes
Message-ID: <c5e34c6a-da1e-4585-98c4-14701b0e093e@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

These error paths should return the appropriate error codes instead of
returning success.

Fixes: 63ba4d67594a ("KEYS: asymmetric: Use new crypto interface without scatterlists")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 crypto/asymmetric_keys/public_key.c | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/crypto/asymmetric_keys/public_key.c b/crypto/asymmetric_keys/public_key.c
index e787598cb3f7..773e159dbbcb 100644
--- a/crypto/asymmetric_keys/public_key.c
+++ b/crypto/asymmetric_keys/public_key.c
@@ -185,8 +185,10 @@ static int software_key_query(const struct kernel_pkey_params *params,
 
 	if (issig) {
 		sig = crypto_alloc_sig(alg_name, 0, 0);
-		if (IS_ERR(sig))
+		if (IS_ERR(sig)) {
+			ret = PTR_ERR(sig);
 			goto error_free_key;
+		}
 
 		if (pkey->key_is_private)
 			ret = crypto_sig_set_privkey(sig, key, pkey->keylen);
@@ -208,8 +210,10 @@ static int software_key_query(const struct kernel_pkey_params *params,
 		}
 	} else {
 		tfm = crypto_alloc_akcipher(alg_name, 0, 0);
-		if (IS_ERR(tfm))
+		if (IS_ERR(tfm)) {
+			ret = PTR_ERR(tfm);
 			goto error_free_key;
+		}
 
 		if (pkey->key_is_private)
 			ret = crypto_akcipher_set_priv_key(tfm, key, pkey->keylen);
@@ -300,8 +304,10 @@ static int software_key_eds_op(struct kernel_pkey_params *params,
 
 	if (issig) {
 		sig = crypto_alloc_sig(alg_name, 0, 0);
-		if (IS_ERR(sig))
+		if (IS_ERR(sig)) {
+			ret = PTR_ERR(sig);
 			goto error_free_key;
+		}
 
 		if (pkey->key_is_private)
 			ret = crypto_sig_set_privkey(sig, key, pkey->keylen);
@@ -313,8 +319,10 @@ static int software_key_eds_op(struct kernel_pkey_params *params,
 		ksz = crypto_sig_maxsize(sig);
 	} else {
 		tfm = crypto_alloc_akcipher(alg_name, 0, 0);
-		if (IS_ERR(tfm))
+		if (IS_ERR(tfm)) {
+			ret = PTR_ERR(tfm);
 			goto error_free_key;
+		}
 
 		if (pkey->key_is_private)
 			ret = crypto_akcipher_set_priv_key(tfm, key, pkey->keylen);
@@ -411,8 +419,10 @@ int public_key_verify_signature(const struct public_key *pkey,
 
 	key = kmalloc(pkey->keylen + sizeof(u32) * 2 + pkey->paramlen,
 		      GFP_KERNEL);
-	if (!key)
+	if (!key) {
+		ret = -ENOMEM;
 		goto error_free_tfm;
+	}
 
 	memcpy(key, pkey->key, pkey->keylen);
 	ptr = key + pkey->keylen;
-- 
2.39.2

