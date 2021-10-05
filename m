Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D7C8422F44
	for <lists+keyrings@lfdr.de>; Tue,  5 Oct 2021 19:33:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234723AbhJERfh (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 5 Oct 2021 13:35:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234226AbhJERfd (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Tue, 5 Oct 2021 13:35:33 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6D85C061749
        for <keyrings@vger.kernel.org>; Tue,  5 Oct 2021 10:33:42 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id r18so71137wrg.6
        for <keyrings@vger.kernel.org>; Tue, 05 Oct 2021 10:33:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JyiTOdZCKa2gs/4fF39tBn5hwnBKvvKWvwW4x5Jkm5c=;
        b=S8s0woBANlfJ4LVp1+ZAi9xOpMdgFw1+X0LlCphYKhM7/92wLKUZ8w9Av7bX8YeBA4
         DEEVi/dQJOvv71jAg0ientWMPWT6QiQ9MYIppoAnFq08KjxzKeGworXByPq+HfD+Sk+/
         NZQ1CO45APzqKWX3waXhRqMoMFMKNU3vOyrd0zY5ftyC2Rs4RgIKS2O5XfLYTD7hGasa
         2RZefbC7jnISQZSHe8cs3gdO3Vsw32zdM2KMxfihl7RkAdw9UgglVVkkPtHk0zAPvtIr
         zyb6gUmBziUykdyaNOWqYrOQyxn+WALvY1m6GO4KZnl9I/J4kzPppztwYxpzmwX8M1uh
         rXUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JyiTOdZCKa2gs/4fF39tBn5hwnBKvvKWvwW4x5Jkm5c=;
        b=5UR/TlduBi5lDXi4O01q7rbKFLfJATk31ft2rlnKup/NE/9BFznnHUQ2ZdW6dTDqKq
         ebAyCBl2NGeLHx2D6drhYHrM2X85Hhjku5Bg9XXwK1QrcTQrdxjTbnK8Xvm41bxNQ/Tb
         c2pMR1LENeSPp7S/dpqJy7aUp3d2V8YkWy+EIs1m/LE6i4kOnDrLVZLxBoIksiFg34Xy
         2rGrrXZeaaUVA0X9d6f0JOyhxkItqWIS7mivo7ZqHBL3wrBaw/NAMqBStWnCDI7wsz+q
         d8gIos6a9eyVYB7hijCBmmOUo7j4go0BWnIPJEY6Hl7hFETWyv9R0XgPGj0RrEvamnNf
         VWJw==
X-Gm-Message-State: AOAM532t+QrTigep6IJXFAAW+PQeUEEKF38wxrdzFtJH2v9dmdz56QtR
        uYanvaj4JCNnBHRh2KeWReaPALcgZxtuKDnMXYpGZQ==
X-Google-Smtp-Source: ABdhPJyBb6QGWOezRgqZXf07NX3FGemGpdoO9hhjEy/Y0q0E4LirRxVrE9Km7R9lsNA2Cit2RpFUyr9w8942Q4LuBmI=
X-Received: by 2002:adf:bd84:: with SMTP id l4mr23681769wrh.420.1633455221157;
 Tue, 05 Oct 2021 10:33:41 -0700 (PDT)
MIME-Version: 1.0
References: <20211005161833.1522737-1-lee.jones@linaro.org>
 <YVyE3Ax1PRtiBwf+@gmail.com> <CAL9PXLws4DjvPB=1KNpom3W52pXNauXQ4V==MprDx73YQ1-sgg@mail.gmail.com>
 <YVyKc51r2tfMmQuO@gmail.com>
In-Reply-To: <YVyKc51r2tfMmQuO@gmail.com>
From:   Adam Langley <agl@google.com>
Date:   Tue, 5 Oct 2021 10:33:24 -0700
Message-ID: <CAL9PXLz7D=BHqG-Lpb1PNq=vC3CD4juyMUa+Swch1NiE0fD+2A@mail.gmail.com>
Subject: Re: [PATCH 1/1] sign-file: Use OpenSSL provided define to compile out
 deprecated APIs
To:     Eric Biggers <ebiggers@kernel.org>
Cc:     Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org,
        David Howells <dhowells@redhat.com>,
        David Woodhouse <dwmw2@infradead.org>, keyrings@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Tue, Oct 5, 2021 at 10:25 AM Eric Biggers <ebiggers@kernel.org> wrote:
> Okay so this patch is actually a build fix for when OpenSSL doesn't include
> ENGINE support?

Correct.

> Currently this patch claims that it's removing the use of a
> "deprecated" API, which is something entirely different.

The ENGINE API is deprecated in OpenSSL 3.0 but that change doesn't
remove support unless it has already been compiled out of OpenSSL
first.


Cheers

AGL
