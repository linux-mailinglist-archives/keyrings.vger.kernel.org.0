Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D1016367909
	for <lists+keyrings@lfdr.de>; Thu, 22 Apr 2021 06:57:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231657AbhDVE6I (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 22 Apr 2021 00:58:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230319AbhDVE6I (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 22 Apr 2021 00:58:08 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4A78C06138B
        for <keyrings@vger.kernel.org>; Wed, 21 Apr 2021 21:57:32 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id u25so12005484ljg.7
        for <keyrings@vger.kernel.org>; Wed, 21 Apr 2021 21:57:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3NuQntm4wDv9MBIYmbhUV1/aZhcaT4rEOjbMSEroJD8=;
        b=wChnreTA33JvAZ/IZq57uBxB9vvUpjR9M9BtHIiyxZ+ZbiSVDV2ZD6qhw0wsBJNd40
         e9ZHf6Bf7kIRI5EpnaEZ5Zx9j9r26sod548QDWNm7DYc44uELT7yK8X7q2t2pPYR4VaO
         zNN3rhk03Ky+V6FWhKpgW31vN3Q0BYDX4NuNVoqf+TyfciG8x4CiU1nGsq9Hm1bzsknz
         M0c8ADrNxsV2nRnZKT++Viqz6YirPYZQib/y/P/3CCGiMAlJGdYR1KTuLg4zmIwygy36
         e5tZzyloI33yARf9MnU1jefYfmRDwkfU86gNbTlF/Ql+ksEyfZ/yL3ckk4y756wj2ZSC
         ghgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3NuQntm4wDv9MBIYmbhUV1/aZhcaT4rEOjbMSEroJD8=;
        b=o75d+ZtKj7HgTHXWNM1i0HlfgH9H1nEUB0jF4Yf1It5Yiy5k4e41auMfUEXpivoNMm
         RgVsXET5LujqRjJVUlCL/MbQM5lUMcmnmSUOu8tI2cFokNJ34L3LnX/G9O4UUiuAwx+P
         th6xL1cV2IJ++wndsirpkEG191BVpDWBCWC4nbsA4ExRbow11uqOph0YK7a5m/ro9diB
         jPR5htpCZPXfAg0RFiFbeAOpaa3FM6aS3YaKw2OrXMLH3FmHLMJhQIjvdi1mBrQyJFc5
         w3hgu/jiqaEQBguCSpHPF7DdSnMxEeauFonQBH86UaOE9bUUhU9oJ1n888MH0xm34auu
         nYAA==
X-Gm-Message-State: AOAM530pwX0v3ui09PcDbFtIxa5r+87THbZ0LeOQ2Lg5GXdYifk7UOQT
        4yUlzAwg9tn33cKBs0QXt/PVYEqbdOzdnFGiYXRf6THSk3qDjA==
X-Google-Smtp-Source: ABdhPJweczUKrlVDs60oA+A1ydd3yA9VHcenXWBPhHxhGYqel+6IMblGLcCj3qdAROrlrtfvSRUiDAN1kBs1XAgGVtI=
X-Received: by 2002:a2e:d02:: with SMTP id 2mr1143391ljn.152.1619067450949;
 Wed, 21 Apr 2021 21:57:30 -0700 (PDT)
MIME-Version: 1.0
References: <c1b82b603a28934cc45b9dc486688c306aab644e.camel@HansenPartnership.com>
In-Reply-To: <c1b82b603a28934cc45b9dc486688c306aab644e.camel@HansenPartnership.com>
From:   Sumit Garg <sumit.garg@linaro.org>
Date:   Thu, 22 Apr 2021 10:27:19 +0530
Message-ID: <CAFA6WYMJ2hHXoFk_v5MFge7EdZZwtrWW==UVvJBH31xmC7TbiA@mail.gmail.com>
Subject: Re: [PATCH] KEYS: trusted: fix TPM trusted keys for generic framework
To:     James Bottomley <James.Bottomley@hansenpartnership.com>
Cc:     linux-integrity <linux-integrity@vger.kernel.org>,
        "open list:ASYMMETRIC KEYS" <keyrings@vger.kernel.org>,
        Jarkko Sakkinen <jarkko@kernel.org>,
        Mimi Zohar <zohar@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Thu, 22 Apr 2021 at 04:22, James Bottomley
<James.Bottomley@hansenpartnership.com> wrote:
>
> The generic framework patch broke the current TPM trusted keys because
> it doesn't correctly remove the values consumed by the generic parser
> before passing them on to the implementation specific parser.  Fix
> this by having the generic parser return the string minus the consumed
> tokens.
>
> Additionally, there may be no tokens left for the implementation
> specific parser, so make it handle the NULL case correctly and finally
> fix a TPM 1.2 specific check for no keyhandle.
>
> Fixes: 5d0682be3189 ("KEYS: trusted: Add generic trusted keys framework")
> Tested-by: Sumit Garg <sumit.garg@linaro.org>
> Signed-off-by: James Bottomley <James.Bottomley@HansenPartnership.com>
> ---
>  security/keys/trusted-keys/trusted_core.c | 24 +++++++++++------------
>  security/keys/trusted-keys/trusted_tpm1.c |  5 ++++-
>  2 files changed, 16 insertions(+), 13 deletions(-)
>

Reviewed-by: Sumit Garg <sumit.garg@linaro.org>

-Sumit

> diff --git a/security/keys/trusted-keys/trusted_core.c b/security/keys/trusted-keys/trusted_core.c
> index 90774793f0b1..d5c891d8d353 100644
> --- a/security/keys/trusted-keys/trusted_core.c
> +++ b/security/keys/trusted-keys/trusted_core.c
> @@ -62,7 +62,7 @@ static const match_table_t key_tokens = {
>   *
>   * On success returns 0, otherwise -EINVAL.
>   */
> -static int datablob_parse(char *datablob, struct trusted_key_payload *p)
> +static int datablob_parse(char **datablob, struct trusted_key_payload *p)
>  {
>         substring_t args[MAX_OPT_ARGS];
>         long keylen;
> @@ -71,14 +71,14 @@ static int datablob_parse(char *datablob, struct trusted_key_payload *p)
>         char *c;
>
>         /* main command */
> -       c = strsep(&datablob, " \t");
> +       c = strsep(datablob, " \t");
>         if (!c)
>                 return -EINVAL;
>         key_cmd = match_token(c, key_tokens, args);
>         switch (key_cmd) {
>         case Opt_new:
>                 /* first argument is key size */
> -               c = strsep(&datablob, " \t");
> +               c = strsep(datablob, " \t");
>                 if (!c)
>                         return -EINVAL;
>                 ret = kstrtol(c, 10, &keylen);
> @@ -89,7 +89,7 @@ static int datablob_parse(char *datablob, struct trusted_key_payload *p)
>                 break;
>         case Opt_load:
>                 /* first argument is sealed blob */
> -               c = strsep(&datablob, " \t");
> +               c = strsep(datablob, " \t");
>                 if (!c)
>                         return -EINVAL;
>                 p->blob_len = strlen(c) / 2;
> @@ -140,7 +140,7 @@ static int trusted_instantiate(struct key *key,
>  {
>         struct trusted_key_payload *payload = NULL;
>         size_t datalen = prep->datalen;
> -       char *datablob;
> +       char *datablob, *orig_datablob;
>         int ret = 0;
>         int key_cmd;
>         size_t key_len;
> @@ -148,7 +148,7 @@ static int trusted_instantiate(struct key *key,
>         if (datalen <= 0 || datalen > 32767 || !prep->data)
>                 return -EINVAL;
>
> -       datablob = kmalloc(datalen + 1, GFP_KERNEL);
> +       orig_datablob = datablob = kmalloc(datalen + 1, GFP_KERNEL);
>         if (!datablob)
>                 return -ENOMEM;
>         memcpy(datablob, prep->data, datalen);
> @@ -160,7 +160,7 @@ static int trusted_instantiate(struct key *key,
>                 goto out;
>         }
>
> -       key_cmd = datablob_parse(datablob, payload);
> +       key_cmd = datablob_parse(&datablob, payload);
>         if (key_cmd < 0) {
>                 ret = key_cmd;
>                 goto out;
> @@ -196,7 +196,7 @@ static int trusted_instantiate(struct key *key,
>                 ret = -EINVAL;
>         }
>  out:
> -       kfree_sensitive(datablob);
> +       kfree_sensitive(orig_datablob);
>         if (!ret)
>                 rcu_assign_keypointer(key, payload);
>         else
> @@ -220,7 +220,7 @@ static int trusted_update(struct key *key, struct key_preparsed_payload *prep)
>         struct trusted_key_payload *p;
>         struct trusted_key_payload *new_p;
>         size_t datalen = prep->datalen;
> -       char *datablob;
> +       char *datablob, *orig_datablob;
>         int ret = 0;
>
>         if (key_is_negative(key))
> @@ -231,7 +231,7 @@ static int trusted_update(struct key *key, struct key_preparsed_payload *prep)
>         if (datalen <= 0 || datalen > 32767 || !prep->data)
>                 return -EINVAL;
>
> -       datablob = kmalloc(datalen + 1, GFP_KERNEL);
> +       orig_datablob = datablob = kmalloc(datalen + 1, GFP_KERNEL);
>         if (!datablob)
>                 return -ENOMEM;
>
> @@ -243,7 +243,7 @@ static int trusted_update(struct key *key, struct key_preparsed_payload *prep)
>
>         memcpy(datablob, prep->data, datalen);
>         datablob[datalen] = '\0';
> -       ret = datablob_parse(datablob, new_p);
> +       ret = datablob_parse(&datablob, new_p);
>         if (ret != Opt_update) {
>                 ret = -EINVAL;
>                 kfree_sensitive(new_p);
> @@ -267,7 +267,7 @@ static int trusted_update(struct key *key, struct key_preparsed_payload *prep)
>         rcu_assign_keypointer(key, new_p);
>         call_rcu(&p->rcu, trusted_rcu_free);
>  out:
> -       kfree_sensitive(datablob);
> +       kfree_sensitive(orig_datablob);
>         return ret;
>  }
>
> diff --git a/security/keys/trusted-keys/trusted_tpm1.c b/security/keys/trusted-keys/trusted_tpm1.c
> index 798dc7820084..469394550801 100644
> --- a/security/keys/trusted-keys/trusted_tpm1.c
> +++ b/security/keys/trusted-keys/trusted_tpm1.c
> @@ -747,6 +747,9 @@ static int getoptions(char *c, struct trusted_key_payload *pay,
>
>         opt->hash = tpm2 ? HASH_ALGO_SHA256 : HASH_ALGO_SHA1;
>
> +       if (!c)
> +               return 0;
> +
>         while ((p = strsep(&c, " \t"))) {
>                 if (*p == '\0' || *p == ' ' || *p == '\t')
>                         continue;
> @@ -944,7 +947,7 @@ static int trusted_tpm_unseal(struct trusted_key_payload *p, char *datablob)
>                 goto out;
>         dump_options(options);
>
> -       if (!options->keyhandle) {
> +       if (!options->keyhandle && !tpm2) {
>                 ret = -EINVAL;
>                 goto out;
>         }
> --
> 2.26.2
>
>
