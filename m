Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EDE92422FC3
	for <lists+keyrings@lfdr.de>; Tue,  5 Oct 2021 20:11:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234987AbhJESM5 (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 5 Oct 2021 14:12:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229626AbhJESM4 (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Tue, 5 Oct 2021 14:12:56 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00110C061749
        for <keyrings@vger.kernel.org>; Tue,  5 Oct 2021 11:11:05 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id l18-20020a05600c4f1200b002f8cf606262so4039889wmq.1
        for <keyrings@vger.kernel.org>; Tue, 05 Oct 2021 11:11:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=2AmJ6vZK0+G0ZrvpMt62Pt7w266KkCvO13RMS0+WCJU=;
        b=sVPFNmYDN9rlhW4zEqU1EsMTyqIJmDi/EVk/iWjtAob+VydsVOgdQs82Q2j2aQO4c+
         KaVex6CE91yxhnfqLt/+sI9MI3kVk+fb9G/SJ9sTqOyt0m7u77hJPRMlvLlSudw8snnu
         xoWdKbPaKtdXjauiTd6SbBgtJQpLmfR5Fs0qQlLaHrgUALCbUhMHl7dobqlZgt7dQ8En
         j2QausMBjQplsY/Mbyi1Gg4/6pOXG2aTBLDI9iI3tV/aBAxZ3hGa3lz60uC6B5FQmGsE
         qkkgT3X1vYkiL5J4yiGDpqOx26O1ozxmyB/fOTdhE8LRDUpyolsB0piuGehEmXgtrL0J
         fzpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=2AmJ6vZK0+G0ZrvpMt62Pt7w266KkCvO13RMS0+WCJU=;
        b=Fc7LC25uMf8nfsOF0UbR9ddE2vubXJlf51uIrL6tKYyCHXBO1p8R2azgqYiBxF7OdW
         DCUZfcnmoKUWm5i9EtCIAPuF63QU1AJ86kdk2LDPQkGZbcJCTrpUREoKhqw5dT7DPTcV
         2zUkc9MzPi4gxReX0+09mjYl97OpzPNbY3HFIl3IKKdHAe1OwEGy5rzDm6G0JHWng4eE
         Ezq16KLx4QBYKkAbcmW8vjhyzkbRFc8w0kJX0MnprGmdAjxHYl9n1CBGYtoZGcOwbafV
         Gb7RoJUaLAhRrAfJf2zRhgfkW+reLhPZdeJ4MJJPcTw2eT4lESqiX+qW2IfSVb7qCrZJ
         tvOg==
X-Gm-Message-State: AOAM532n7u7+c0DLIzNlxtcj+38Ic8GSeP4W2lYkESWA7QIc0aFF1/VC
        JxntEBTGg0mWczm2Fsc4WRrFAw==
X-Google-Smtp-Source: ABdhPJxnZhnLFFMNigyT2txst7cmyByaKs7DgCAzOet4jhC/l/LC7or09f6Q0aiqSjRE4FQA9oEGQQ==
X-Received: by 2002:a1c:2904:: with SMTP id p4mr4911298wmp.49.1633457464303;
        Tue, 05 Oct 2021 11:11:04 -0700 (PDT)
Received: from google.com ([95.148.6.175])
        by smtp.gmail.com with ESMTPSA id k17sm18491847wrq.7.2021.10.05.11.11.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Oct 2021 11:11:03 -0700 (PDT)
Date:   Tue, 5 Oct 2021 19:11:02 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Eric Biggers <ebiggers@kernel.org>
Cc:     Adam Langley <agl@google.com>, linux-kernel@vger.kernel.org,
        David Howells <dhowells@redhat.com>,
        David Woodhouse <dwmw2@infradead.org>, keyrings@vger.kernel.org
Subject: Re: [PATCH 1/1] sign-file: Use OpenSSL provided define to compile
 out deprecated APIs
Message-ID: <YVyVNkijABL7CxnM@google.com>
References: <20211005161833.1522737-1-lee.jones@linaro.org>
 <YVyE3Ax1PRtiBwf+@gmail.com>
 <CAL9PXLws4DjvPB=1KNpom3W52pXNauXQ4V==MprDx73YQ1-sgg@mail.gmail.com>
 <YVyKc51r2tfMmQuO@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YVyKc51r2tfMmQuO@gmail.com>
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Tue, 05 Oct 2021, Eric Biggers wrote:

> On Tue, Oct 05, 2021 at 10:14:58AM -0700, Adam Langley wrote:
> > On Tue, Oct 5, 2021 at 10:01 AM Eric Biggers <ebiggers@kernel.org> wrote:
> > > I ran into these same -Wdeprecated-declarations compiler warnings on another
> > > project that uses the ENGINE API to access OpenSSL's support for PKCS#11 tokens.
> > > The conclusion was that in OpenSSL 3.0, the new API for PKCS#11 support isn't
> > > actually ready yet, so we had to keep using the ENGINE API and just add
> > > -Wno-deprecated-declarations to the compiler flags.
> > >
> > > Your patch just removes support for PKCS#11 in that case, which seems
> > > undesirable.  (Unless no one is actually using it?)
> > 
> > The patch removes support when OPENSSL_NO_ENGINE is defined, but
> > that's not defined by default in OpenSSL 3.0. (Unless something
> > changed recently.)
> > 
> > When OPENSSL_NO_ENGINE is defined, ENGINE support is not compiled into
> > OpenSSL and the headers don't include the functions:
> > https://github.com/openssl/openssl/blob/master/include/openssl/engine.h
> > .
> 
> Okay so this patch is actually a build fix for when OpenSSL doesn't include
> ENGINE support?

Correct.

> Currently this patch claims that it's removing the use of a
> "deprecated" API, which is something entirely different.

I see your point.

Happy to rejig the commit message if that would help.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
