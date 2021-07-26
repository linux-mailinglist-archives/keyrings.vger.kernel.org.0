Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 17CAB3D52DB
	for <lists+keyrings@lfdr.de>; Mon, 26 Jul 2021 07:35:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231646AbhGZEw4 (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Mon, 26 Jul 2021 00:52:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229851AbhGZEwz (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Mon, 26 Jul 2021 00:52:55 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 894DCC0613C1
        for <keyrings@vger.kernel.org>; Sun, 25 Jul 2021 22:33:23 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id g13so13294014lfj.12
        for <keyrings@vger.kernel.org>; Sun, 25 Jul 2021 22:33:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PRU68iKUPw5S0tl4mVxd5yJKI+6qFQ7X97+eA0nBCAE=;
        b=p6sLAgt5tOdHwc0wNad/P+hdEygwdLuthLS5kmbCb6gazGK8X1ASirlTkcieZGF86K
         sYjq6RB/lXQ46mN1HDPlF93oERNTXG6b3WkN3YEc5DDKl5rDFu8PGo8+8cmXMIUUpx+D
         4LW+OWCkmkHeKYwwOpOrPkh0D1+f727nFn0jSDTSHmNZov17Ih9kE1wcCVxA8iKxVnv6
         3nwWTv90vVtw0hqXi4WuQACKsK4UELXPezda6iEZcs2ibfjqvXb9Ye1KgYbqUmQuJ4QX
         YUtEkV80FAugV7VEK4wz4I32PPJZAtUGa5CYp52ovSzdnXwtEt9xm7KG5cPWNFM74FXx
         5BrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PRU68iKUPw5S0tl4mVxd5yJKI+6qFQ7X97+eA0nBCAE=;
        b=V5Fp/EsQcaTqjT+D+Qt/1A3/qS4OnLlMb/Ywq2XY8nYgwkfOQ8IznJUtXQtOovlSLH
         R3j3WK3ef++3Q4Vv7xwudR+godhDpMg7XFtYDc5h8c39X5f0iHXtbX6ykGOd7/fdulkG
         vyIN/IT9PwgnGs0k0vspw52ApzLl/3QXFv5/ofElWpDv4xE0HOZspC9dWAqrDb8+gllM
         pc6E4gQRpcqYGk+ztffQuk7eUsAbFM4QjAJo+eitl2ZUznr3SyKcQwEvU6djDGoR7hZA
         KQGZFdGBtzjI+efs63llT0CDVoB23A9oCYvR7ZGF6xDCQwGWRL0e0N61izGcvyzROVIj
         kuOA==
X-Gm-Message-State: AOAM5319x6vtzSgwp6Ih6IpIoDbGq0Fg1VPJR56w2lqVi0aqqjtaUZbH
        DL9ug7CQXUfT31yefHzfLuNlJmOho5v81bYm8O2Ytw==
X-Google-Smtp-Source: ABdhPJySjGAMkvYVAYkYNpAfNDgDRSCahZbm8y1hFRqwSZ3PmVRMxfjoqqrcouvYItmqWhyW1BiT/rzUxlkL0kC3RcE=
X-Received: by 2002:a19:c757:: with SMTP id x84mr11736748lff.302.1627277601795;
 Sun, 25 Jul 2021 22:33:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210723172121.156687-1-colin.king@canonical.com>
In-Reply-To: <20210723172121.156687-1-colin.king@canonical.com>
From:   Sumit Garg <sumit.garg@linaro.org>
Date:   Mon, 26 Jul 2021 11:03:10 +0530
Message-ID: <CAFA6WYOugaWGj-RoHzikk8L_-vHY6XX8NOKoJL08--Oh4WeM6w@mail.gmail.com>
Subject: Re: [PATCH] security: keys: trusted: Fix memory leaks on allocated blob
To:     Colin King <colin.king@canonical.com>
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
        kernel-janitors@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Hi Colin,

On Fri, 23 Jul 2021 at 22:51, Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> There are several error return paths that don't kfree the allocated
> blob, leading to memory leaks. Ensure blob is initialized to null as
> some of the error return paths in function tpm2_key_decode do not
> change blob. Add an error return path to kfree blob and use this on
> the current leaky returns.
>

It looks like there are still leaky return paths left such as
tpm_buf_init() failure etc. which needs to be fixed as well.

With that addressed, feel free to add:

Acked-by: Sumit Garg <sumit.garg@linaro.org>

-Sumit

> Addresses-Coverity: ("Resource leak")
> Fixes: f2219745250f ("security: keys: trusted: use ASN.1 TPM2 key format for the blobs")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  security/keys/trusted-keys/trusted_tpm2.c | 30 ++++++++++++++++-------
>  1 file changed, 21 insertions(+), 9 deletions(-)
>
> diff --git a/security/keys/trusted-keys/trusted_tpm2.c b/security/keys/trusted-keys/trusted_tpm2.c
> index 0165da386289..930c67f98611 100644
> --- a/security/keys/trusted-keys/trusted_tpm2.c
> +++ b/security/keys/trusted-keys/trusted_tpm2.c
> @@ -366,7 +366,7 @@ static int tpm2_load_cmd(struct tpm_chip *chip,
>         unsigned int private_len;
>         unsigned int public_len;
>         unsigned int blob_len;
> -       u8 *blob, *pub;
> +       u8 *blob = NULL, *pub;
>         int rc;
>         u32 attrs;
>
> @@ -378,22 +378,30 @@ static int tpm2_load_cmd(struct tpm_chip *chip,
>         }
>
>         /* new format carries keyhandle but old format doesn't */
> -       if (!options->keyhandle)
> -               return -EINVAL;
> +       if (!options->keyhandle) {
> +               rc = -EINVAL;
> +               goto err;
> +       }
>
>         /* must be big enough for at least the two be16 size counts */
> -       if (payload->blob_len < 4)
> -               return -EINVAL;
> +       if (payload->blob_len < 4) {
> +               rc = -EINVAL;
> +               goto err;
> +       }
>
>         private_len = get_unaligned_be16(blob);
>
>         /* must be big enough for following public_len */
> -       if (private_len + 2 + 2 > (payload->blob_len))
> -               return -E2BIG;
> +       if (private_len + 2 + 2 > (payload->blob_len)) {
> +               rc = -E2BIG;
> +               goto err;
> +       }
>
>         public_len = get_unaligned_be16(blob + 2 + private_len);
> -       if (private_len + 2 + public_len + 2 > payload->blob_len)
> -               return -E2BIG;
> +       if (private_len + 2 + public_len + 2 > payload->blob_len) {
> +               rc = -E2BIG;
> +               goto err;
> +       }
>
>         pub = blob + 2 + private_len + 2;
>         /* key attributes are always at offset 4 */
> @@ -441,6 +449,10 @@ static int tpm2_load_cmd(struct tpm_chip *chip,
>                 rc = -EPERM;
>
>         return rc;
> +
> +err:
> +       kfree(blob);
> +       return rc;
>  }
>
>  /**
> --
> 2.31.1
>
