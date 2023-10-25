Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C25717D6C7F
	for <lists+keyrings@lfdr.de>; Wed, 25 Oct 2023 14:58:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344265AbjJYM5w (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 25 Oct 2023 08:57:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234947AbjJYM5v (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 25 Oct 2023 08:57:51 -0400
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51D0ACC
        for <keyrings@vger.kernel.org>; Wed, 25 Oct 2023 05:57:49 -0700 (PDT)
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com [209.85.221.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 7612F3FD3C
        for <keyrings@vger.kernel.org>; Wed, 25 Oct 2023 12:57:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1698238666;
        bh=YZ12GF+aERDoIF3r6TEMZGT37W8A+JNypJswAaYxRhM=;
        h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
         To:Cc:Content-Type;
        b=Nq3lJYRjmvlNFzhC88nKA+acZLBDUj9Ov5G9LL4MuBCW+ekeopmaP6jh1I3O7zSi3
         VHcgE4W3aVos+T3jx4sC9AuqdjMKXzFYdSIp7QtXybesE78Tp0Y+I9/UCodeFPk9vy
         bhlFQn1hVxFVdvg+jlfaHTMdnjHRibS57BNgxU/3ADQoqprN+STbnIyn84Fqeue9z4
         wueAES6fHVy8EtziuEz7fG/7tmbevvB9wpoMp9MhLoHG/JlQYoWmizinkzN1jdNFyW
         rMz82xE0dxseXyB0G1AIoOTTCiGq4xJIkoTNpvV6GCnM4v2+Sif16TcizvuwguCX3v
         qRT5RAREbrXog==
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-32d9cd6eb0bso2281719f8f.0
        for <keyrings@vger.kernel.org>; Wed, 25 Oct 2023 05:57:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698238664; x=1698843464;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YZ12GF+aERDoIF3r6TEMZGT37W8A+JNypJswAaYxRhM=;
        b=p7DrUviM4x3peIppARKe5b2MNeZJzqjXOn6R+tih6kaB5iBxS4ElRjR3u/MkXydbeQ
         A/lEc3fR4Y2YuOGe0aixwl+F7bAJ5afwiUDmeXe9KINtMLFFxPOR62km0vFIBRQ2rlBw
         oBKBGlaP1EmhP3mCMkA2vtFNglvfMXZYxJoyckV1dFMXe7sglzqr7nuabbtauoGcDBsu
         sQG1hD6Ty0LZFWqyjzWg8ORPShDXZZw7qtifeOJzK1is4b1R6tATi3ZVG55ZV3E7TxTa
         PQUjD+TOU68DzTBGhwlomI4d1tdznOQ2g7CJ7AHFLcLkcYE7MF/ert/0gDigpzuF2Yzq
         w/3A==
X-Gm-Message-State: AOJu0Yz76Mb/toFmmd+e4E9lrqNags2j1R8C8oPtwloV/q2h3uhGse4h
        YzCaGZecL3otuba4v7XsxYIDmc7L3eQenKtDPln12XSGNR4X8yqZi5bYgOakM9qakOr9OUu279c
        Z8Zu40XuOBWcUUeDsgX9zkDgodERgcnoI7Hlznn2CfQZ+b48A0kMy
X-Received: by 2002:adf:edc2:0:b0:32d:a57b:8c8d with SMTP id v2-20020adfedc2000000b0032da57b8c8dmr12438006wro.69.1698238664539;
        Wed, 25 Oct 2023 05:57:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHaI9gj2ovxx4sLpIcOCYpedqxIgHFi3Wcs69w/nw0GZB5lBOAnarl0/VEXOqC/394g7rDDa9Lg2WtTwOg2eIM=
X-Received: by 2002:adf:edc2:0:b0:32d:a57b:8c8d with SMTP id
 v2-20020adfedc2000000b0032da57b8c8dmr12437987wro.69.1698238664182; Wed, 25
 Oct 2023 05:57:44 -0700 (PDT)
MIME-Version: 1.0
References: <20231025104212.12738-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20231025104212.12738-1-lukas.bulwahn@gmail.com>
From:   Dimitri John Ledkov <dimitri.ledkov@canonical.com>
Date:   Wed, 25 Oct 2023 13:57:08 +0100
Message-ID: <CADWks+ZoLs1FUJx0sSg5FBYK5BtD+Po7bRORVT4uBLM6QJxXJQ@mail.gmail.com>
Subject: Re: [PATCH] docs: module-signing: adjust guide after sha1 and sha224
 support is gone
To:     Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc:     Herbert Xu <herbert@gondor.apana.org.au>,
        David Howells <dhowells@redhat.com>,
        David Woodhouse <dwmw2@infradead.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Luis Chamberlain <mcgrof@kernel.org>,
        linux-modules@vger.kernel.org, keyrings@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-doc@vger.kernel.org,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Hi,

On Wed, 25 Oct 2023 at 11:42, Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
>
> Commit 16ab7cb5825f ("crypto: pkcs7 - remove sha1 support") and commit
> fc3225fd6f1e ("module: Do not offer sha224 for built-in module signing")
> removes sha1 and sha224 support for kernel module signing.
>
> Adjust the module-signing admin guide documentation to those changes.
>
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>

Note I have submitted this change as part of the patch series that
adds SHA-3 over at
https://lore.kernel.org/linux-crypto/20231022182208.188714-1-dimitri.ledkov@canonical.com/T/#m81c32a65341a4de39596b72743ba38d46899016f

But indeed, if that patch series doesn't make it into the cryptodev
tree, then this documentation should go in, and the sha-3 one rebased
/ adjusted.

Sorry for not patching documentation at the same time as the code
changes that made documentation out of date.

Acked-by: Dimitri John ledkov <dimitri.ledkov@canonical.com>

> ---
>  Documentation/admin-guide/module-signing.rst | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/Documentation/admin-guide/module-signing.rst b/Documentation/admin-guide/module-signing.rst
> index 2898b2703297..e3ea1def4c0c 100644
> --- a/Documentation/admin-guide/module-signing.rst
> +++ b/Documentation/admin-guide/module-signing.rst
> @@ -30,8 +30,8 @@ This facility uses X.509 ITU-T standard certificates to encode the public keys
>  involved.  The signatures are not themselves encoded in any industrial standard
>  type.  The facility currently only supports the RSA public key encryption
>  standard (though it is pluggable and permits others to be used).  The possible
> -hash algorithms that can be used are SHA-1, SHA-224, SHA-256, SHA-384, and
> -SHA-512 (the algorithm is selected by data in the signature).
> +hash algorithms that can be used are SHA-256, SHA-384, and SHA-512 (the
> +algorithm is selected by data in the signature).
>
>
>  ==========================
> @@ -81,8 +81,6 @@ This has a number of options available:
>       sign the modules with:
>
>          =============================== ==========================================
> -       ``CONFIG_MODULE_SIG_SHA1``      :menuselection:`Sign modules with SHA-1`
> -       ``CONFIG_MODULE_SIG_SHA224``    :menuselection:`Sign modules with SHA-224`
>         ``CONFIG_MODULE_SIG_SHA256``    :menuselection:`Sign modules with SHA-256`
>         ``CONFIG_MODULE_SIG_SHA384``    :menuselection:`Sign modules with SHA-384`
>         ``CONFIG_MODULE_SIG_SHA512``    :menuselection:`Sign modules with SHA-512`
> --
> 2.17.1
>


-- 
okurrr,

Dimitri
