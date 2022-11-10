Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 95474624129
	for <lists+keyrings@lfdr.de>; Thu, 10 Nov 2022 12:15:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230411AbiKJLPJ (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 10 Nov 2022 06:15:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230409AbiKJLOw (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 10 Nov 2022 06:14:52 -0500
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17E1D6F377
        for <keyrings@vger.kernel.org>; Thu, 10 Nov 2022 03:14:33 -0800 (PST)
Received: by mail-pg1-x532.google.com with SMTP id 78so1468577pgb.13
        for <keyrings@vger.kernel.org>; Thu, 10 Nov 2022 03:14:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bINLLU9PD1pEzI3atyU2ZEDrwA88CdhG/1pr/Rzw2KY=;
        b=nsvQUFkPM65XhIKwogsU8yFQC96WEi+N/yF/Dm226uiIActc6A0bN6qqFIDPuQTlGJ
         vSf3dKVDaWeHQI9uq4/xMdRAeTm9KCEMxaOSTLMPDh61pJ5qzfk3I9Mb0/Yb7rtMNGEs
         CXJ9v7vfNey2imsN19gPKiwrgxV5UfhaYy6f7lp4iQgVkFkfj4rbRhY/58VL0NzyXjVb
         OAV925LQimY7UTD1i+RDWzYd84ifVYVHZqfNO1DV05CbmgmLUbuJ0DmK0pAzSSO35/rf
         1It/xD8LsK/bqdsfqwHPB64W4hjmHerEViFIRsarzGZxkQpv+rtH8wOPI2VwmPgozU8i
         gFKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bINLLU9PD1pEzI3atyU2ZEDrwA88CdhG/1pr/Rzw2KY=;
        b=pyekvEOfQgoV3z1NzB6kQL1XPFGEFFjJL2adaYrar43F1pRSnIElp8LXGMH06qcsqP
         p50dlnNawKiR2GMlSomtJpsFyWhYmbqPwlmYiW+FAZWOgd2gQv3IpoIIf43LDvJ+II8k
         eJWI5gCd/vIiNPc7UnKeApmAhBoR1+srvz2dkeoKvxB8AXk+NMV8uz7hgzNM5rCcRFfw
         StpneCtkn4c9+uigkbUiHcByvqZPoG1Y8WlMYZNAQokzHxwVYstkMTLU3FKaAH0tpeXB
         k2Q43ZsClTSvk9osYYGltPwuJZyUXrVsEfJPKLpcX+ZkeBcyfPnBmmvZWNEkdsHJW5mC
         GGxg==
X-Gm-Message-State: ACrzQf2keUV9Mc3Du/SczGErnV7TucfEqvvy2pLcDLVHu2a9yVIoZHPu
        wWM9Iw+meK3x5bfQrVB2ZAtK6kk/XEMYIxegNUFhQDJVbgCZpg==
X-Google-Smtp-Source: AMsMyM7pNQARAbULI6QCzZi6RINV5taBDWPVxndnKjwvl2BvAbsPjPGxaHD5QBaBNVTFXQNULJkyAtUYpbUEcMd9T/A=
X-Received: by 2002:a63:db42:0:b0:45c:9c73:d72e with SMTP id
 x2-20020a63db42000000b0045c9c73d72emr53321246pgi.181.1668078871936; Thu, 10
 Nov 2022 03:14:31 -0800 (PST)
MIME-Version: 1.0
References: <20221110111140.1999538-1-sumit.garg@linaro.org>
In-Reply-To: <20221110111140.1999538-1-sumit.garg@linaro.org>
From:   Sumit Garg <sumit.garg@linaro.org>
Date:   Thu, 10 Nov 2022 16:44:20 +0530
Message-ID: <CAFA6WYMKSjvgNgbf=cJXiTE3LitS-whtRbqJW1cdkHMJ1TsdUg@mail.gmail.com>
Subject: Re: [PATCH] KEYS: trusted: tee: Make registered shm dependency explicit
To:     keyrings@vger.kernel.org, Jarkko Sakkinen <jarkko@kernel.org>
Cc:     jejb@linux.ibm.com, zohar@linux.ibm.com,
        linux-integrity@vger.kernel.org,
        linux-security-module@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jerome Forissier <jerome.forissier@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

+ Jarkko (Apologies I accidently missed you while sending the original patch).

On Thu, 10 Nov 2022 at 16:42, Sumit Garg <sumit.garg@linaro.org> wrote:
>
> TEE trusted keys support depends on registered shared memory support
> since the key buffers are needed to be registered with OP-TEE. So make
> that dependency explicit to not register trusted keys support if
> underlying implementation doesn't support registered shared memory.
>
> Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
> Tested-by: Jerome Forissier <jerome.forissier@linaro.org>
> ---
>  security/keys/trusted-keys/trusted_tee.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/security/keys/trusted-keys/trusted_tee.c b/security/keys/trusted-keys/trusted_tee.c
> index c8626686ee1b..ac3e270ade69 100644
> --- a/security/keys/trusted-keys/trusted_tee.c
> +++ b/security/keys/trusted-keys/trusted_tee.c
> @@ -219,7 +219,8 @@ static int trusted_tee_get_random(unsigned char *key, size_t key_len)
>
>  static int optee_ctx_match(struct tee_ioctl_version_data *ver, const void *data)
>  {
> -       if (ver->impl_id == TEE_IMPL_ID_OPTEE)
> +       if (ver->impl_id == TEE_IMPL_ID_OPTEE &&
> +           ver->gen_caps & TEE_GEN_CAP_REG_MEM)
>                 return 1;
>         else
>                 return 0;
> --
> 2.34.1
>
