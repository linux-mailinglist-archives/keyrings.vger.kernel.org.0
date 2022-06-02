Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8505253B18E
	for <lists+keyrings@lfdr.de>; Thu,  2 Jun 2022 04:12:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233165AbiFBBbu (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 1 Jun 2022 21:31:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233160AbiFBBbt (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 1 Jun 2022 21:31:49 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8784911474
        for <keyrings@vger.kernel.org>; Wed,  1 Jun 2022 18:31:47 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id fd25so4406109edb.3
        for <keyrings@vger.kernel.org>; Wed, 01 Jun 2022 18:31:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=k62nV7Jswjfh4J4CVA+J/+R723CZLyDDE2S4baqnCag=;
        b=H5FDe3jnuN+KGmzQtMY8FjzxIp5OgCVrg5TLH2gAYextyJrNTj0AvwoN6LuojxpTVR
         72gGqG52f8sxiemwN6dFAEz/4wR4xwg2kVv6Zf25KN/MGnHvxc86UCA3A5IdMufuJYk+
         qu7dPwyLLlHdNnFN2Wb9UYnpaxdFjlic3+Lto=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=k62nV7Jswjfh4J4CVA+J/+R723CZLyDDE2S4baqnCag=;
        b=Gtju1p8kOxon11DXYvKOCgxZfzdnRb/X2jYYBREZo7BkhAvgcY90VRZtNEFX4urxnw
         M2ujELDShuR6snGgqcoQUXexh4hljTcaKge6Z21RuwWevm4stpQPKzRipUOPirYU0DlS
         EauGhMVigN40iTtwePUU1kuKxFZm6LFhZWu4QcTGCfGuaSacfLsZ+WeoXDBmeAVcWva6
         sHclWkGFXlNKdSGj20Ki7/0r/y3SiCTJZctmQZSgn/ocUsf4Izv2C6wTuVVcJZvMatWL
         ebUXzJmAaAJVKAdhMjzkjgnz2wbsyvlZ+PhsljC4g16hjXaB6S1vsHhPOUmwRZPqC75D
         Qzcw==
X-Gm-Message-State: AOAM533TklNFenxZ0defwSJqXsgjFX30qB6H6xswb/xl5KBUHSSYfdT/
        9WrjEAv7sphO9aHOOioMi31eAPdhVsp9s/7n
X-Google-Smtp-Source: ABdhPJzyrwC4fsh76mthLX713nyAtz2bmVBycITipi33dVjrKesVCB5MaPciGslKE6tc3yF2Wir20Q==
X-Received: by 2002:a05:6402:34c1:b0:42b:4047:20b8 with SMTP id w1-20020a05640234c100b0042b404720b8mr2810542edc.88.1654133505832;
        Wed, 01 Jun 2022 18:31:45 -0700 (PDT)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com. [209.85.221.46])
        by smtp.gmail.com with ESMTPSA id o19-20020a1709061b1300b006fed85c1a8fsm1256470ejg.202.2022.06.01.18.31.44
        for <keyrings@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jun 2022 18:31:45 -0700 (PDT)
Received: by mail-wr1-f46.google.com with SMTP id q7so4499284wrg.5
        for <keyrings@vger.kernel.org>; Wed, 01 Jun 2022 18:31:44 -0700 (PDT)
X-Received: by 2002:a05:6000:1b0f:b0:210:313a:ef2a with SMTP id
 f15-20020a0560001b0f00b00210313aef2amr1547932wrz.281.1654133504250; Wed, 01
 Jun 2022 18:31:44 -0700 (PDT)
MIME-Version: 1.0
References: <165295023086.3361286.8662079860706628540.stgit@warthog.procyon.org.uk>
 <8735go11v0.fsf@stepbren-lnx.us.oracle.com>
In-Reply-To: <8735go11v0.fsf@stepbren-lnx.us.oracle.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Wed, 1 Jun 2022 18:31:28 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjHHg_buCqw=Q2OtRWoFpD67OxsQ0jMzao+6rGM6hRE0A@mail.gmail.com>
Message-ID: <CAHk-=wjHHg_buCqw=Q2OtRWoFpD67OxsQ0jMzao+6rGM6hRE0A@mail.gmail.com>
Subject: Re: [PATCH] assoc_array: Fix BUG_ON during garbage collect
To:     Stephen Brennan <stephen.s.brennan@oracle.com>
Cc:     David Howells <dhowells@redhat.com>,
        stable <stable@vger.kernel.org>,
        Jarkko Sakkinen <jarkko@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        keyrings@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Wed, Jun 1, 2022 at 3:00 PM Stephen Brennan
<stephen.s.brennan@oracle.com> wrote:
>
> Just wanted to check on this patch as the 5.19 window closes. David, are
> you planning on taking this through a particular tree, or is the ask for
> Linus to pick it directly?

Ok, picked up directly.

These fall through the cracks partly because it's not obvious what
they are for. Sometimes I get pull requests from DavidH, and sometimes
I get random patches, and while the pull requests are fairly
unambiguous ("please pull") the same is not necessarily true of the
patches. Are they for discussion, an RFC, or fro applying...

So then I pretty much guess.

                 Linus
