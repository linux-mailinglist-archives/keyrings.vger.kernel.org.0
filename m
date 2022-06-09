Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 223D25454E3
	for <lists+keyrings@lfdr.de>; Thu,  9 Jun 2022 21:25:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234404AbiFITZx (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 9 Jun 2022 15:25:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232297AbiFITZx (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 9 Jun 2022 15:25:53 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F4784F445
        for <keyrings@vger.kernel.org>; Thu,  9 Jun 2022 12:25:51 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id gl15so35539271ejb.4
        for <keyrings@vger.kernel.org>; Thu, 09 Jun 2022 12:25:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VSgagsbvkmfJHY7CYmbuTXz5MyIqb1Bl1J/7nYFzNlM=;
        b=FVNNymOhRuplBcsV+zXBVZLeFMvqgJpfsBbgHGD7f/pNHtK4ouPMt7jThFW/F+cKNY
         INVY/vpRSk7QrdC8+hxmXbR8tsr13n5fNakRr3iCk8by11ygyGQgOGMCfosktXQTZhvv
         hwTUDZkiW3d/p8nCw8vhYtpNnLdiu7ZxBkKwE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VSgagsbvkmfJHY7CYmbuTXz5MyIqb1Bl1J/7nYFzNlM=;
        b=QPewNXRoRuuUVYNDhwBKxmofO9+XDwf6X1Md6GxMvVBYVEB8k4m0LwwR8KQZX041pT
         1j12s0xI/MEB9FPQnLHBwanXGXJot3mGkCwosY8uBVpMjh3zDMRTsdLmL/fWrSlE2UJn
         zYvm2aQqBJa1esAriMLYia/TXarLsBf3YeYvU9kUNu4eoJZQSIT0ytz/biTyOPDwjO/o
         uGBw9mWweznVMzodNX9nvkcjGB+QlNmKQdnuZU2g/nshxQwU4Vei3VCIOcU6X/U7LeVq
         GN6I0SiDXhVrODIlK+VOXguk5t7myuMY7wszGxXYojjJBXH8nusSjgHo/Wu54RBJAWqw
         KjvA==
X-Gm-Message-State: AOAM533TenbGX3n3LVdbgkuE672WNSHS1dW7PuLWVDe9roJx6Y42dMlT
        EkEuGclG4Jhs+Vs9R3+zeMuixFE/3MO2JSSn
X-Google-Smtp-Source: ABdhPJyTqFrSzba7JIZ4jogfDSh4WfxY4Svlg7s7fBtk8X6cgPN//9MuEgN7acxJprDJvlPRHPTEwQ==
X-Received: by 2002:a17:907:6282:b0:6e0:c64a:60a7 with SMTP id nd2-20020a170907628200b006e0c64a60a7mr37477786ejc.349.1654802749689;
        Thu, 09 Jun 2022 12:25:49 -0700 (PDT)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com. [209.85.221.50])
        by smtp.gmail.com with ESMTPSA id v3-20020a056402348300b0042dccb44e88sm4154978edc.23.2022.06.09.12.25.48
        for <keyrings@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jun 2022 12:25:48 -0700 (PDT)
Received: by mail-wr1-f50.google.com with SMTP id k16so33731126wrg.7
        for <keyrings@vger.kernel.org>; Thu, 09 Jun 2022 12:25:48 -0700 (PDT)
X-Received: by 2002:a5d:6da3:0:b0:219:bcdd:97cd with SMTP id
 u3-20020a5d6da3000000b00219bcdd97cdmr3118138wrs.274.1654802747974; Thu, 09
 Jun 2022 12:25:47 -0700 (PDT)
MIME-Version: 1.0
References: <CA+icZUUFdsEyNybVORm4x7_bAyoc0zTnudtNdgnTqjvbYXJRYA@mail.gmail.com>
 <CA+icZUWxyNeZnEBDpDWxGc-qJ-jHwR0rJMBhk1a8StPHRgC6qA@mail.gmail.com>
 <CA+icZUW7y3JxQ3dCB8Wy83EjEyYj7z55nFUw-kZ+V4We22HZZg@mail.gmail.com>
 <CA+icZUVyp2CdX7m72GY-=DtK9J+64uHeWPr5-cvo8haQm_4hUw@mail.gmail.com>
 <CA+icZUWiYYQbAav7VxVsT0ikqCeLckym08Au8oSeyYjvJHcNbg@mail.gmail.com>
 <CA+icZUUOQcc4uiVbv+tJzPr_ED7e4tD0u9tC8mcn2BRe3sdPAg@mail.gmail.com>
 <CAHk-=wiOrXUr0wqHL+hfkzGg_+b7UvtLeB=59KsX8W939bTY-A@mail.gmail.com>
 <CA+icZUUma1B8KFWF-ed9sjXH4QpCRZ+B2pON3uAFkTUs77tMzw@mail.gmail.com> <20220609192308.GB10732@1wt.eu>
In-Reply-To: <20220609192308.GB10732@1wt.eu>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Thu, 9 Jun 2022 12:25:31 -0700
X-Gmail-Original-Message-ID: <CAHk-=wimC_B+nCJrXwuvWULz6ycFFmRMT1Uc+PeM5wJdma_VFw@mail.gmail.com>
Message-ID: <CAHk-=wimC_B+nCJrXwuvWULz6ycFFmRMT1Uc+PeM5wJdma_VFw@mail.gmail.com>
Subject: Re: [Linux v5.17.9] -Wdeprecated-declarations warnings with LLVM-14
 and OpenSSL v3.0.x
To:     Willy Tarreau <w@1wt.eu>
Cc:     Sedat Dilek <sedat.dilek@gmail.com>,
        Kees Cook <keescook@chromium.org>, keyrings@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Salvatore Bonaccorso <carnil@debian.org>,
        David Woodhouse <dwmw2@infradead.org>,
        David Howells <dhowells@redhat.com>,
        Tasmiya Nalatwad <tasmiya@linux.vnet.ibm.com>,
        James Bottomley <James.Bottomley@hansenpartnership.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Thu, Jun 9, 2022 at 12:23 PM Willy Tarreau <w@1wt.eu> wrote:
>
> IIRC you can also disable the deprecation warnings by defining the
> OPENSSL_SUPPRESS_DEPRECATED macro. It doesn't require to change the
> compiler's options and allows us to put our head in the sand.

That one had the downside that you have to know what you're doing to
make such a change ;)

I just wanted to be able to start doing pulls again after mistakenly
thinking that an upgrade would be pain-free.

                    Linus
