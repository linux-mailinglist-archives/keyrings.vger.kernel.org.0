Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 537424D5011
	for <lists+keyrings@lfdr.de>; Thu, 10 Mar 2022 18:17:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233282AbiCJRRG (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 10 Mar 2022 12:17:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242630AbiCJRRF (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 10 Mar 2022 12:17:05 -0500
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com [IPv6:2607:f8b0:4864:20::d34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54291186212
        for <keyrings@vger.kernel.org>; Thu, 10 Mar 2022 09:16:03 -0800 (PST)
Received: by mail-io1-xd34.google.com with SMTP id d62so7189534iog.13
        for <keyrings@vger.kernel.org>; Thu, 10 Mar 2022 09:16:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=im9f7by7aGXOO+TZZQNnb2KIlOuQvzBKwx8HD64EYiA=;
        b=Eib/uCZyn0+INuEMXw5mnfIb0ym7lVaTFBob1AYHWH1yDsWLS+oO37W6XBwro4GEaM
         G+mgaQ/wxOrrJuamrtWFxVZKUr5iIXfalnEMOILIOmwW1zxkHp2VZARoRmVVxZUbJ/1f
         OXk3aG+sDTRLBtd5FXPmgr8EntaLdX1n++g9bLWjrYtuMggosleaJw8YZsFQOKR8ZDcz
         5kXoDBTb/U7lPpNNP7CAZfO+Fr5NSFHwzd5kKVJ4y6MCjAsrdtJTzuEc2rF252DfPWJK
         7oYlKN56iyw1mGBFXC8whWtcluDpanz2W3zq3SuUYcoq0+5UJxw8FSgrHSfvwgAEX52Z
         hYdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=im9f7by7aGXOO+TZZQNnb2KIlOuQvzBKwx8HD64EYiA=;
        b=hEnvUrJ4nt86mQvIxGVR/THmoqcvkUlZYx85fuy7MzAxx/68sO5eOFC8d3ayzy1WqD
         7hLFiCx7uPpM8r3WTxM7KxFt+H4UlpfpDbAxpVR1frvgHMFURm8eVJBt1CF6sBi5WFG2
         A8bjMSkVQG0oRof9KT7QirLRugE8f9u/RPNdXM85FgUAiA4swk4nYNUnMC+zEoFMU55x
         ZTusyRmr4rHPzaO6psTbXkv96YOLm88n/6VLts3G/kw8OzwtpNsAE+WExd3HGpUohAJn
         sGtmKEzVWJECmtY/E1+x4XYjQcxUFuw2u8kkEkrk9NQBGUZewjYqRROi3MHSST8kAUp5
         eC7A==
X-Gm-Message-State: AOAM5323a7YQBTP7edJYcubpEyHdHpeWjWqBA/Tk22Ylxo8Gu2WQMVc5
        BWeJgkvg8ugLZatCfkKjz40u2jN5CSKQl8hdDiORaQ==
X-Google-Smtp-Source: ABdhPJyVN/Dg8yK30V4HA9/fOQMTChhT+M2KPf05rK/HCxdRlxCMHJNoc+M5jEXqmzruXZSNcn4HWvqUI1h2JEQEPd0=
X-Received: by 2002:a05:6638:f95:b0:314:58f9:5896 with SMTP id
 h21-20020a0566380f9500b0031458f95896mr4926817jal.228.1646932562537; Thu, 10
 Mar 2022 09:16:02 -0800 (PST)
MIME-Version: 1.0
References: <20211005161833.1522737-1-lee.jones@linaro.org>
 <Yicwb+Ceiu8JjVIS@google.com> <202203100851.C00D9AB73@keescook>
In-Reply-To: <202203100851.C00D9AB73@keescook>
From:   Adam Langley <agl@google.com>
Date:   Thu, 10 Mar 2022 09:15:45 -0800
Message-ID: <CAL9PXLwnBE3jMucyTJ6Yo3nM7MiYWFZokrwXvAGer=0cjsuuiw@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] sign-file: Do not attempt to use the ENGINE_* API
 if it's not available
To:     Kees Cook <keescook@chromium.org>
Cc:     Lee Jones <lee.jones@linaro.org>,
        David Howells <dhowells@redhat.com>,
        David Woodhouse <dwmw2@infradead.org>,
        keyrings@vger.kernel.org, linux-kernel@vger.kernel.org,
        Eric Biggers <ebiggers@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Thu, Mar 10, 2022 at 8:52 AM Kees Cook <keescook@chromium.org> wrote:
>
> On Tue, Mar 08, 2022 at 10:31:11AM +0000, Lee Jones wrote:
> > OpenSSL's ENGINE API is deprecated in OpenSSL v3.0.
> >
> > Use OPENSSL_NO_ENGINE to ensure the ENGINE API is only used if it is
> > present.  This will safeguard against compile errors when using SSL
> > implementations which lack support for this deprecated API.
>
> On Fedora rawhide, I'm still seeing a bunch of warnings:
>
> scripts/sign-file.c: In function 'display_openssl_errors':
> scripts/sign-file.c:89:9: warning: 'ERR_get_error_line' is deprecated: Since OpenSSL 3.0 [-Wdeprecat
> ed-declarations]

The `display_openssl_errors` function should probably just call
ERR_print_errors_fp:
https://www.openssl.org/docs/man1.0.2/man3/ERR_print_errors_fp.html

The `drain_openssl_errors` function should probably just call
ERR_clear_error:
https://www.openssl.org/docs/man3.0/man3/ERR_clear_error.html


Cheers

AGL
