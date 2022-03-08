Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3458E4D14CF
	for <lists+keyrings@lfdr.de>; Tue,  8 Mar 2022 11:31:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238797AbiCHKcL (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 8 Mar 2022 05:32:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232278AbiCHKcL (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Tue, 8 Mar 2022 05:32:11 -0500
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E065142EC2
        for <keyrings@vger.kernel.org>; Tue,  8 Mar 2022 02:31:14 -0800 (PST)
Received: by mail-wr1-x431.google.com with SMTP id b5so27766674wrr.2
        for <keyrings@vger.kernel.org>; Tue, 08 Mar 2022 02:31:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=7cvxFPpWa8OjKLitcZbcHObaEW+m/+U8qNIvX8ftcwE=;
        b=DUjzaS0YIXfCAFQjD7hrCXjOu1a9x7ToCLBgfluZnhMfPCmKHj0Vif7k5MfNy009uc
         AUeWB//v1OVvgq153ZU6aEhty9DYrp6s3jm6TtVQGN+vcp3r+G9sTJI0SljZ+koxDU4q
         I/8PMkSRf0xuREpStfISCcJORg2GHRNkMETR8FxjA6H9mVC2mqJmyIRp0JWHYE6ikBnp
         M7PsD1shCstrW2YIYp9a7ip3ypfMAT80BPf/sHYgMLkHnfvAe6+16Egz0zMVVSlqqJsT
         Ne33PrWhAF18QKJzn7dKpNDEm3aQP6Dj49CGbodIpr5u/tbcDb3GhujjQa85XwCbQ+QC
         7Q8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=7cvxFPpWa8OjKLitcZbcHObaEW+m/+U8qNIvX8ftcwE=;
        b=jgVtAK2e+/D/DjzIP0t+T4EJaShjTMUDcFz5hH8r9kQWv8XBNKNJIwLufJXGJgoYux
         a07rWwr1GMU2OaqhLFCpwjT04ZDj0OzyoQH2HiwW2zuYLpcGMt6NWkWdEwuyAedGTUM2
         JJEdSQNVBGx8s5TmrYxzE3mVfUxZ64At7joH/ezFJgex0GFMD04AV3ZmvWxKZP1LMvPh
         dgHlla403MXG7s4XYMQdjWh63vLnF1J40YusYhgxdZ0RRF297aDDKi8U/msPgEfcYrv3
         +d3z06qF7WB2x5iTLTKQQ3xf7lTMntCvMuK2vIg7JE5RLl3pOPu7cZpYA2q0OmsaSnog
         54zg==
X-Gm-Message-State: AOAM531vEmysdtnyQ1AWG5OQV1/qn/T8sTBkPFCYgpHzCDEcVWnRQQmi
        jWfkaPh1NoAbjcJHZ7Cdmk3G4w==
X-Google-Smtp-Source: ABdhPJzfUVdt42pdxI/yb443aVK4iO8CJ+/onT0Uk/wd27n6jOb+tiz4AkkukUcpfVYJbnHUHieX4w==
X-Received: by 2002:a05:6000:1885:b0:1fc:a88b:d358 with SMTP id a5-20020a056000188500b001fca88bd358mr4308283wri.139.1646735473453;
        Tue, 08 Mar 2022 02:31:13 -0800 (PST)
Received: from google.com (cpc155339-bagu17-2-0-cust87.1-3.cable.virginm.net. [86.27.177.88])
        by smtp.gmail.com with ESMTPSA id v2-20020adf8b42000000b001edc38024c9sm14765098wra.65.2022.03.08.02.31.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Mar 2022 02:31:13 -0800 (PST)
Date:   Tue, 8 Mar 2022 10:31:11 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     David Howells <dhowells@redhat.com>,
        David Woodhouse <dwmw2@infradead.org>
Cc:     Kees Cook <keescook@chromium.org>, keyrings@vger.kernel.org,
        Adam Langley <agl@google.com>, linux-kernel@vger.kernel.org,
        Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH v2 1/1] sign-file: Do not attempt to use the ENGINE_* API if
 it's not available
Message-ID: <Yicwb+Ceiu8JjVIS@google.com>
References: <20211005161833.1522737-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211005161833.1522737-1-lee.jones@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

OpenSSL's ENGINE API is deprecated in OpenSSL v3.0.

Use OPENSSL_NO_ENGINE to ensure the ENGINE API is only used if it is
present.  This will safeguard against compile errors when using SSL
implementations which lack support for this deprecated API.

Cc: David Howells <dhowells@redhat.com>
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: Eric Biggers <ebiggers@kernel.org>
Cc: Kees Cook <keescook@chromium.org>
Cc: keyrings@vger.kernel.org
Co-developed-by: Adam Langley <agl@google.com>
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
v2: Clear up subject and patch description to avoid confusion

scripts/sign-file.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/scripts/sign-file.c b/scripts/sign-file.c
index fbd34b8e8f578..fa3fa59db6669 100644
--- a/scripts/sign-file.c
+++ b/scripts/sign-file.c
@@ -135,7 +135,9 @@ static int pem_pw_cb(char *buf, int len, int w, void *v)
 static EVP_PKEY *read_private_key(const char *private_key_name)
 {
 	EVP_PKEY *private_key;
+	BIO *b;
 
+#ifndef OPENSSL_NO_ENGINE
 	if (!strncmp(private_key_name, "pkcs11:", 7)) {
 		ENGINE *e;
 
@@ -153,17 +155,16 @@ static EVP_PKEY *read_private_key(const char *private_key_name)
 		private_key = ENGINE_load_private_key(e, private_key_name,
 						      NULL, NULL);
 		ERR(!private_key, "%s", private_key_name);
-	} else {
-		BIO *b;
-
-		b = BIO_new_file(private_key_name, "rb");
-		ERR(!b, "%s", private_key_name);
-		private_key = PEM_read_bio_PrivateKey(b, NULL, pem_pw_cb,
-						      NULL);
-		ERR(!private_key, "%s", private_key_name);
-		BIO_free(b);
+		return private_key;
 	}
+#endif
 
+	b = BIO_new_file(private_key_name, "rb");
+	ERR(!b, "%s", private_key_name);
+	private_key = PEM_read_bio_PrivateKey(b, NULL, pem_pw_cb,
+					      NULL);
+	ERR(!private_key, "%s", private_key_name);
+	BIO_free(b);
 	return private_key;
 }
