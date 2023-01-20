Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C145675DE1
	for <lists+keyrings@lfdr.de>; Fri, 20 Jan 2023 20:21:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230297AbjATTVS (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Fri, 20 Jan 2023 14:21:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230285AbjATTVR (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Fri, 20 Jan 2023 14:21:17 -0500
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71459C63AF
        for <keyrings@vger.kernel.org>; Fri, 20 Jan 2023 11:21:16 -0800 (PST)
Received: by mail-pj1-x1029.google.com with SMTP id y3-20020a17090a390300b00229add7bb36so5849153pjb.4
        for <keyrings@vger.kernel.org>; Fri, 20 Jan 2023 11:21:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8SDRSdhk6EPykAw/g+Wl8hh3w6cuRY9QuwzZ8iaDbYE=;
        b=erXn/iE6iiZjbHA68rk3r66LhlmEmI7xCR/nOyeiE8l5IpFc7vk/4JEYq/P4spmPox
         uS4/kD5WPpbGZsniUvTUpGe9xZNDWMKs82nxqzsqaT1BqDz4RNqJQyJ42MfeAowuorwJ
         RvwxYIKQj26CjI54rPaQDEtVyzvyDffjT/cf0vhwdY539e+SZ9xQNuBaUDwx19qMtZ3L
         qX048waUOdaFW5AXRIgWF+NQDDYiU+TZVghGzHQGZ46YDO+rt6apX4QHcZJxSsjw7365
         ZxJ0jurd8opU6xSw6LvaScv02k7JxgVPdVGmN3mSBu+vEsKFmFMNWDq5+sSEZn4W6oFq
         QVOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8SDRSdhk6EPykAw/g+Wl8hh3w6cuRY9QuwzZ8iaDbYE=;
        b=WcQCv/fALPmf0ZNEBnXmWUQY5kJhFrKGzCz9b89ddgvqaj9OJmXD7YgWHSBZgysTYf
         FApB5IFe+ga7XVszFGl0ER6OGjsikgdhOEs7vnFyiwiEiJd08epbg+Zh7+4Th58lkbOS
         rvJqCOL2BYgz/Ma2oksU4Z6oXTaPVD+PWgIYchjkFzl+0HTGBWa2FHiyM8IXg+tcn+6/
         YRt7H2jHIlfu34jMNgk/IrKiTkqBa5BKnhkvqSiCbi9vVQG/s18n378FnUiUjQmHeEsd
         8cnyuPh5E8OkZGOL5K0wtn+pVYqCf0sHdG99mYAaWkMno4w5qlgW/kNQyBDTG4SZnTAA
         Dt/A==
X-Gm-Message-State: AFqh2kqrW+WgXVIkYxsJoU/4gvCCHtM0jAMUMhHocm+bI0loPcmq9x2L
        JuemX7+D5ECJRdPyUqWctxR9D6Z18HfGZV1+p0N/
X-Google-Smtp-Source: AMrXdXuJbuMwEO0e7v3IjYffd4x3UmGyhnjQEzqwX4NQeML3LdO9TXhtdelhymz58k8pwIt5Px+CkOw7dym9Qnyw4lQ=
X-Received: by 2002:a17:90a:17a1:b0:229:9ffe:135b with SMTP id
 q30-20020a17090a17a100b002299ffe135bmr1700587pja.72.1674242475803; Fri, 20
 Jan 2023 11:21:15 -0800 (PST)
MIME-Version: 1.0
References: <20221207105430.248613-1-roberto.sassu@huaweicloud.com>
In-Reply-To: <20221207105430.248613-1-roberto.sassu@huaweicloud.com>
From:   Paul Moore <paul@paul-moore.com>
Date:   Fri, 20 Jan 2023 14:21:04 -0500
Message-ID: <CAHC9VhRSLh9y7KBCOhpvK2cwPmhyMr2dudhjcsEZ-Qmovi86Nw@mail.gmail.com>
Subject: Re: [PATCH] public_key: Add a comment to public_key_signature struct definition
To:     Roberto Sassu <roberto.sassu@huaweicloud.com>, dhowells@redhat.com
Cc:     herbert@gondor.apana.org.au, davem@davemloft.net,
        zohar@linux.ibm.com, dmitry.kasatkin@gmail.com, jmorris@namei.org,
        serge@hallyn.com, ebiggers@kernel.org, keyrings@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-integrity@vger.kernel.org,
        linux-security-module@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Roberto Sassu <roberto.sassu@huawei.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Wed, Dec 7, 2022 at 5:55 AM Roberto Sassu
<roberto.sassu@huaweicloud.com> wrote:
>
> From: Roberto Sassu <roberto.sassu@huawei.com>
>
> public_key_verify_signature() calls sg_set_buf() to set the signature and
> digest for the signature verification.
>
> As sg_set_buf() requires the buffer to be in physically contiguous memory,
> see commit ac4e97abce9b8 ("scatterlist: sg_set_buf() argument must be in
> linear mapping"), mention that in a comment for the signature and digest
> fields of the public_key_signature structure.
>
> Link: https://lore.kernel.org/linux-integrity/Y4pIpxbjBdajymBJ@sol.localdomain/
> Suggested-by: Eric Biggers <ebiggers@kernel.org>
> Signed-off-by: Roberto Sassu <roberto.sassu@huawei.com>
> ---
>  include/crypto/public_key.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

This seems especially important considering the BUG_ON that could be triggered.

David, are you going to pick this up?

Reviewed-by: Paul Moore <paul@paul-moore.com>

> diff --git a/include/crypto/public_key.h b/include/crypto/public_key.h
> index 68f7aa2a7e55..6d623e063034 100644
> --- a/include/crypto/public_key.h
> +++ b/include/crypto/public_key.h
> @@ -37,8 +37,8 @@ extern void public_key_free(struct public_key *key);
>   */
>  struct public_key_signature {
>         struct asymmetric_key_id *auth_ids[3];
> -       u8 *s;                  /* Signature */
> -       u8 *digest;
> +       u8 *s;                  /* Signature (in physically contiguous mem) */
> +       u8 *digest;             /* Digest (in physically contiguous mem) */
>         u32 s_size;             /* Number of bytes in signature */
>         u32 digest_size;        /* Number of bytes in digest */
>         const char *pkey_algo;
> --
> 2.25.1

-- 
paul-moore.com
