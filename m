Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 37AA74E2FEC
	for <lists+keyrings@lfdr.de>; Mon, 21 Mar 2022 19:24:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352131AbiCUSZh (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Mon, 21 Mar 2022 14:25:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351581AbiCUSZf (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Mon, 21 Mar 2022 14:25:35 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 027B320F66
        for <keyrings@vger.kernel.org>; Mon, 21 Mar 2022 11:24:07 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id r23so18968744edb.0
        for <keyrings@vger.kernel.org>; Mon, 21 Mar 2022 11:24:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Znlv0HuHzVHaeUAmdIRV55nsLLlzSzHPvRIX7fedcUo=;
        b=dZCkQITWm7aAaXjcdC9aaJGWOSDwwhmiHMzz4T9vFTAIrBgplBxfZm25g+walJOkE/
         s/1+FK3Q8iyr12mvERqN/SQqQAx8+ypB1IxkVGIV+lbjLfch6NahK1lz9WUKIGbWGR+O
         E8IS8fJy3WHAEZa0+eSiOxCHHFxFvaGzoT6eqWf2r56tqqoqrFu3VkO5TgA3xK9qS83K
         w2IIw1WGHDs8sRYaMoc2DFd1XNRIWbdYPKvYXJv0nfEchin0hxv2AgKt5z2XBcK6yq7K
         HzJG2S05OOtbPXSquUIJ7TEcM50PtjqiTEyoJkHNlHnL/pml7b0fEo0Pch55ynrJWRjB
         DxzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Znlv0HuHzVHaeUAmdIRV55nsLLlzSzHPvRIX7fedcUo=;
        b=qRW4bDkPMroFjFhCZ9leSquCEvIHzD6PaNtxnG+YsKHnST16ECe1QTEgXEuQ82FqTY
         gA2vZQbvd7gZd+Lziql96IhXpaetwl0AJpil2gitmcDsSYTzO3ey5saPC8fh4sbJbcTK
         sGlKHrqRW8buZ+GVJLn/1wAyYd2of684axoqCl/GaP3K8JGXf9geQeW0wAcsTboNZ8Ug
         hIjvdUdy7k70mURY/Ayqs4XhuTz9SeDCfykRxoytf7tW57VU7EauI0x9DuplN0Q84wZe
         XRutswHaUJM21qMMRK2HWucLFEz8dM2N4CZAPFuZDKdQhz2Q4i5Lm0a31R7bQRTfaBxY
         aocQ==
X-Gm-Message-State: AOAM531L2YRMy5GAAZbGV1asmk56AFnKcttZkvEv/NoJd45MxZe5rqnE
        jlI/UcdebBTLXt6Po1HyxMr9RnWyBB8mYag7volK
X-Google-Smtp-Source: ABdhPJxssqPmh+qHcCzxF3xsED5nNaiei08foUJkKVXI+HTgBGne1+hBjJb9fvtjCFtPaT8nVral3z+eTHU4RmFkNkk=
X-Received: by 2002:a05:6402:42d4:b0:412:c26b:789 with SMTP id
 i20-20020a05640242d400b00412c26b0789mr24724801edc.232.1647887045389; Mon, 21
 Mar 2022 11:24:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220321174548.510516-1-mic@digikod.net> <20220321174548.510516-2-mic@digikod.net>
In-Reply-To: <20220321174548.510516-2-mic@digikod.net>
From:   Paul Moore <paul@paul-moore.com>
Date:   Mon, 21 Mar 2022 14:23:54 -0400
Message-ID: <CAHC9VhR+Ss5VAUHLutTvyS8g+agZy7d0YGcu_9dV1LBx_8ifNQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] certs: Explain the rational to call panic()
To:     =?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>
Cc:     Jarkko Sakkinen <jarkko@kernel.org>,
        David Howells <dhowells@redhat.com>,
        "David S . Miller" <davem@davemloft.net>,
        David Woodhouse <dwmw2@infradead.org>,
        Eric Snowberg <eric.snowberg@oracle.com>,
        keyrings@vger.kernel.org, linux-crypto@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        =?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@linux.microsoft.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Mon, Mar 21, 2022 at 1:45 PM Micka=C3=ABl Sala=C3=BCn <mic@digikod.net> =
wrote:
>
> From: Micka=C3=ABl Sala=C3=BCn <mic@linux.microsoft.com>
>
> The blacklist_init() function calls panic() for memory allocation
> errors.  This change documents the reason why we don't return -ENODEV.
>
> Suggested-by: Paul Moore <paul@paul-moore.com> [1]
> Requested-by: Jarkko Sakkinen <jarkko@kernel.org> [1]
> Link: https://lore.kernel.org/r/YjeW2r6Wv55Du0bJ@iki.fi [1]
> Signed-off-by: Micka=C3=ABl Sala=C3=BCn <mic@linux.microsoft.com>
> Link: https://lore.kernel.org/r/20220321174548.510516-2-mic@digikod.net
> ---
>  certs/blacklist.c | 8 ++++++++
>  1 file changed, 8 insertions(+)

I would suggest changing the second sentence as shown below, but
otherwise it looks good to me.

Reviewed-by: Paul Moore <paul@paul-moore.com>

> diff --git a/certs/blacklist.c b/certs/blacklist.c
> index 486ce0dd8e9c..ac26bcf9b9a5 100644
> --- a/certs/blacklist.c
> +++ b/certs/blacklist.c
> @@ -307,6 +307,14 @@ static int restrict_link_for_blacklist(struct key *d=
est_keyring,
>
>  /*
>   * Initialise the blacklist
> + *
> + * The blacklist_init() function is registered as an initcall via
> + * device_initcall().  As a result the functionality doesn't load and th=
e

"As a result if the blacklist_init() function fails for any reason the
kernel continues to execute."

> + * kernel continues on executing.  While cleanly returning -ENODEV could=
 be
> + * acceptable for some non-critical kernel parts, if the blacklist keyri=
ng
> + * fails to load it defeats the certificate/key based deny list for sign=
ed
> + * modules.  If a critical piece of security functionality that users ex=
pect to
> + * be present fails to initialize, panic()ing is likely the right thing =
to do.
>   */
>  static int __init blacklist_init(void)
>  {

--
paul-moore.com
