Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 180BB545508
	for <lists+keyrings@lfdr.de>; Thu,  9 Jun 2022 21:34:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344385AbiFITef (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 9 Jun 2022 15:34:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243699AbiFITee (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 9 Jun 2022 15:34:34 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46F3F1C4253
        for <keyrings@vger.kernel.org>; Thu,  9 Jun 2022 12:34:33 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id c2so32489381edf.5
        for <keyrings@vger.kernel.org>; Thu, 09 Jun 2022 12:34:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EYQS2BycOf2pIc7BMF0PksT1jBEDsJyPkRGFI48wG5A=;
        b=GR0eghBFetA/j6CagqMDEwUFzE+B9kpynm9G6QNbHgsjl7/cAHE5AYAKh5139WJKBj
         wqJkXf8QMAGWnsKKoPHnpmiBJlu01XcjwFySmIQb38tx9rm0VNlZUILbApILoprIS7ia
         wJalCu8RTlTiXdd0uo29QU+WUu+7y0ADcD0OU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EYQS2BycOf2pIc7BMF0PksT1jBEDsJyPkRGFI48wG5A=;
        b=0euMo28JV2CaOJxPSk5ApHvksGnfas70fvGOa3Z3IDGwuGUroDRcHyl2Y+4UGxnqpP
         aWXwxM3GhBHmLsKF8YStDBheKe4Pxa0Zgxn4Au3MJktA5EhQX+YgemRqN0m4fw6M5DoI
         ke+ga0+ayQL94G0GQc8hoM3XNjgf0GY+SWIWT3Tb+rlhwVpyafPuWaFgKSQD4JgxUJRa
         3GFtAfFzA7YZBPPG3Xx5Y6VlQsZKDMpm5cHQ9YL/eKNSpdqhSqFPb52AJs4CvMwiBXR2
         HqIYBVEkz0MoZAFw+l9ZTZHWNWreoMf1Gmrk1dYHwuso37lZ/OVkON3rvGrpS3Ex+YGi
         FWCw==
X-Gm-Message-State: AOAM533K7aeW2RsPug14Vv58AGVy3uIJcU/9CIpA7B+a3bDx3WP9Iz4X
        g9ljlT+bW3Sa54MCjuoZqzZvJ990zdDqmW0X
X-Google-Smtp-Source: ABdhPJzocMppG6rHaZkDo3T6bzsXQWOHvcJpZVfa5GY/MPjXbQNWNTi/DhjQp5WYQuFV6BwJ0CizAw==
X-Received: by 2002:a05:6402:684:b0:431:503e:76e6 with SMTP id f4-20020a056402068400b00431503e76e6mr27916539edy.308.1654803271548;
        Thu, 09 Jun 2022 12:34:31 -0700 (PDT)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com. [209.85.128.46])
        by smtp.gmail.com with ESMTPSA id ck11-20020a0564021c0b00b0042de3d661d2sm15000707edb.1.2022.06.09.12.34.30
        for <keyrings@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jun 2022 12:34:30 -0700 (PDT)
Received: by mail-wm1-f46.google.com with SMTP id l2-20020a05600c4f0200b0039c55c50482so109230wmq.0
        for <keyrings@vger.kernel.org>; Thu, 09 Jun 2022 12:34:30 -0700 (PDT)
X-Received: by 2002:a05:600c:4ec9:b0:39c:69c7:715d with SMTP id
 g9-20020a05600c4ec900b0039c69c7715dmr5003770wmq.154.1654803269839; Thu, 09
 Jun 2022 12:34:29 -0700 (PDT)
MIME-Version: 1.0
References: <CA+icZUUFdsEyNybVORm4x7_bAyoc0zTnudtNdgnTqjvbYXJRYA@mail.gmail.com>
 <CA+icZUWxyNeZnEBDpDWxGc-qJ-jHwR0rJMBhk1a8StPHRgC6qA@mail.gmail.com>
 <CA+icZUW7y3JxQ3dCB8Wy83EjEyYj7z55nFUw-kZ+V4We22HZZg@mail.gmail.com>
 <CA+icZUVyp2CdX7m72GY-=DtK9J+64uHeWPr5-cvo8haQm_4hUw@mail.gmail.com>
 <CA+icZUWiYYQbAav7VxVsT0ikqCeLckym08Au8oSeyYjvJHcNbg@mail.gmail.com>
 <CA+icZUUOQcc4uiVbv+tJzPr_ED7e4tD0u9tC8mcn2BRe3sdPAg@mail.gmail.com>
 <CAHk-=wiOrXUr0wqHL+hfkzGg_+b7UvtLeB=59KsX8W939bTY-A@mail.gmail.com>
 <CA+icZUUma1B8KFWF-ed9sjXH4QpCRZ+B2pON3uAFkTUs77tMzw@mail.gmail.com>
 <20220609192308.GB10732@1wt.eu> <CAHk-=wimC_B+nCJrXwuvWULz6ycFFmRMT1Uc+PeM5wJdma_VFw@mail.gmail.com>
 <20220609193238.GD10732@1wt.eu>
In-Reply-To: <20220609193238.GD10732@1wt.eu>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Thu, 9 Jun 2022 12:34:13 -0700
X-Gmail-Original-Message-ID: <CAHk-=wg8t3S3kWjzTywO5RTv4QrTSYYapEw10kFgD-dRLt08ug@mail.gmail.com>
Message-ID: <CAHk-=wg8t3S3kWjzTywO5RTv4QrTSYYapEw10kFgD-dRLt08ug@mail.gmail.com>
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

On Thu, Jun 9, 2022 at 12:32 PM Willy Tarreau <w@1wt.eu> wrote:
>
> Finally we did better and disabled engines completely!

Some day that fix will make it to me, and I can remove that ugly pragma.

                Linus
