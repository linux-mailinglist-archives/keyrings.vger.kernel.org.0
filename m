Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CDFD73CCDE1
	for <lists+keyrings@lfdr.de>; Mon, 19 Jul 2021 08:26:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233717AbhGSG36 (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Mon, 19 Jul 2021 02:29:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233626AbhGSG35 (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Mon, 19 Jul 2021 02:29:57 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 615EAC061766
        for <keyrings@vger.kernel.org>; Sun, 18 Jul 2021 23:26:58 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id y42so28339379lfa.3
        for <keyrings@vger.kernel.org>; Sun, 18 Jul 2021 23:26:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=3lPCqQljJf2IbScxAFf1031HOfRkixI8y+inmwaEQLU=;
        b=z2jvnSeXzDI9LPibiAzjKQbSIyzToX8RVGLxm1q6JUMlUH1kl0pL+3wgTp6oW882g1
         xyogIuA7XaCw1fRG5z7RhOMgH7biVV5AJlOQdCUiWu3H+tGYqv9Tt7WoqluESFL1MZMM
         OHBSr0ZQ02dme41z/gRxG57q+hi8wfHMVnKtqMsq3xhqnqG/s2gfePY6gNoS7TLPCo6k
         tke5hJgz9GFURVOKSr8GxysmbIi3gC/Mv9BHcGYzVkYS5BQUlGSei4TOQO5jBnXilObb
         DdjvuG4IVAo/JDgW2wnUXhK6joE88nG97kREx8s15jqnx1MJVFWv4ljjNeTnvwnZfN6v
         zioQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=3lPCqQljJf2IbScxAFf1031HOfRkixI8y+inmwaEQLU=;
        b=rX8V7dI8k9z/qTnit8Z6hrCNCk53SA2EK04TH6zhvCb4DxMC5ipgTUOW+OxQl826LY
         BtLWPXVfaW/yRmpaepttbC2lsUqSnz02kEQte4eqSFqeDgaxiD9WZVh4dj4Bo52MUSi4
         n8MNZ0c1VLcOjDHhNdIS6Il96PvuQBxVsAyuej7bFnunZDyNxo2YV1YX/btkkK4feUIb
         kiNUKLC9uZc/pO2YhjZ1pT3f1F7VG8yQBtGkiSFzpE3HovlAJ61r0LijN9GF+Xlt+FBi
         MetNWOG7upuLrF65erdZvfYshxItCrwvtQCKDHCkGC8BAWHz+3UIVO7JLNkoHTikHdQh
         uRag==
X-Gm-Message-State: AOAM5306o29vLG1fdNugVtnmvoWMj4ZY395Oy/777EcPvl+kF0ahViFY
        xekwFuPYtk5p5afZ1iJHtX7JbMx2uy6werQ7IU5ukQ==
X-Google-Smtp-Source: ABdhPJwcVB5VSPOP+/OH08BW5Jay0hN57oGFKlGhOhwsFjFhAJ5AjL1LvhtxB4k5IkyqvZfHbetmuyk5aibT9lfPDQ0=
X-Received: by 2002:a19:c757:: with SMTP id x84mr17381730lff.302.1626676016627;
 Sun, 18 Jul 2021 23:26:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210716081722.4130161-1-andreas@rammhold.de>
In-Reply-To: <20210716081722.4130161-1-andreas@rammhold.de>
From:   Sumit Garg <sumit.garg@linaro.org>
Date:   Mon, 19 Jul 2021 11:56:45 +0530
Message-ID: <CAFA6WYNu+XxESXKLUQ8k3TDY18n1Y-R7m9=iTp-BerU69wLWdg@mail.gmail.com>
Subject: Re: [PATCH] KEYS: trusted: Fix trusted key backends when building as module
To:     Andreas Rammhold <andreas@rammhold.de>
Cc:     James Bottomley <jejb@linux.ibm.com>,
        Jarkko Sakkinen <jarkko@kernel.org>,
        Mimi Zohar <zohar@linux.ibm.com>,
        David Howells <dhowells@redhat.com>,
        James Morris <jmorris@namei.org>,
        "Serge E . Hallyn" <serge@hallyn.com>,
        linux-integrity <linux-integrity@vger.kernel.org>,
        "open list:ASYMMETRIC KEYS" <keyrings@vger.kernel.org>,
        "open list:SECURITY SUBSYSTEM" 
        <linux-security-module@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Fri, 16 Jul 2021 at 13:54, Andreas Rammhold <andreas@rammhold.de> wrote:
>
> Before this commit the kernel could end up with no trusted key sources
> even thought both of the currently supported backends (tpm & tee) were

s/thought/though/

> compoiled as modules. This manifested in the trusted key type not being

s/compoiled/compiled/

> registered at all.
>
> When checking if a CONFIG_=E2=80=A6 preprocessor variable is defined we o=
nly
> test for the builtin (=3Dy) case and not the module (=3Dm) case. By using
> the IS_ENABLE(=E2=80=A6) macro we to test for both cases.
>

s/to/do/

> Signed-off-by: Andreas Rammhold <andreas@rammhold.de>
> ---
>  security/keys/trusted-keys/trusted_core.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>

Apart from minor nits above, add a corresponding fixes tag. With that:

Reviewed-by: Sumit Garg <sumit.garg@linaro.org>

-Sumit

> diff --git a/security/keys/trusted-keys/trusted_core.c b/security/keys/tr=
usted-keys/trusted_core.c
> index d5c891d8d353..fd640614b168 100644
> --- a/security/keys/trusted-keys/trusted_core.c
> +++ b/security/keys/trusted-keys/trusted_core.c
> @@ -27,10 +27,10 @@ module_param_named(source, trusted_key_source, charp,=
 0);
>  MODULE_PARM_DESC(source, "Select trusted keys source (tpm or tee)");
>
>  static const struct trusted_key_source trusted_key_sources[] =3D {
> -#if defined(CONFIG_TCG_TPM)
> +#if IS_ENABLED(CONFIG_TCG_TPM)
>         { "tpm", &trusted_key_tpm_ops },
>  #endif
> -#if defined(CONFIG_TEE)
> +#if IS_ENABLED(CONFIG_TEE)
>         { "tee", &trusted_key_tee_ops },
>  #endif
>  };
> --
> 2.32.0
>
