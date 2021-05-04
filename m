Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E6BD37321C
	for <lists+keyrings@lfdr.de>; Tue,  4 May 2021 23:57:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232948AbhEDV6K (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 4 May 2021 17:58:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232667AbhEDV6J (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Tue, 4 May 2021 17:58:09 -0400
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com [IPv6:2607:f8b0:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C40D3C061761
        for <keyrings@vger.kernel.org>; Tue,  4 May 2021 14:57:13 -0700 (PDT)
Received: by mail-oi1-x22e.google.com with SMTP id d21so278846oic.11
        for <keyrings@vger.kernel.org>; Tue, 04 May 2021 14:57:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=h6nDWrO9L8CxbAXjtDgqv4B1xC4L9HAr7ltSEuwJLk8=;
        b=lp8Ds+q4uHoTq/2xNdc6nB8zMv9+EVRduoGZhmPcTiX40X3BRyVq20/wmbznOaJKXk
         48InIae6D+ySRAWfUzgcwxVE0xLGPx4ZpJGtdte6bTc/hYHkp3FD8UDSB6B4obl0gPal
         6Anx4jvxkyiRcU36eEj3cO21HPg5+rRJm7jyA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=h6nDWrO9L8CxbAXjtDgqv4B1xC4L9HAr7ltSEuwJLk8=;
        b=o6VxuhJAIAP5ZFBN4FuKLc0GnkMqHMvmyej/MsqeSTZqif886p4KZ/h0tc/EcG/I/0
         aXfButCUCRS9qkXznqSrExp7gQGTMPn0bI1roG4OKxM4NK0x/dqyBZHkyH24MB2dlAVT
         WHuErVeev+cDomRpIJOsS3IH7eDIn75vhw38eM2UycyH0neVW5BOZ3eDGGnQGZsFv1jP
         PonRJwrSpZXBsmZFFJdD60uYvGavC5WjCX4BknbQj9NMyK5ppolyn4C2yZgRPdXs2Oag
         t2EV00SL0bP3dWCSnqXeBpHSBdXiIWbjWvbYcFe4okvCjpMeghL7y/kyghc446+jByT1
         nCxA==
X-Gm-Message-State: AOAM5308fahLJmtowzFRUsleVtwqKMNw23dli1VJMDCXgdVCt6hTAzlM
        jcKxTJmLKgrXbJH9wdrjxtLSZ/EFukXt5UuV
X-Google-Smtp-Source: ABdhPJwbeZPeWg6GI16LALBfQ8Kii3x7G6oLeHrIoDavMKast6OmSBvDRPUXzEH0GzLxD8XR0khjrw==
X-Received: by 2002:a05:6808:488:: with SMTP id z8mr718096oid.135.1620165432970;
        Tue, 04 May 2021 14:57:12 -0700 (PDT)
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com. [209.85.210.53])
        by smtp.gmail.com with ESMTPSA id c95sm215465otb.80.2021.05.04.14.57.11
        for <keyrings@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 May 2021 14:57:12 -0700 (PDT)
Received: by mail-ot1-f53.google.com with SMTP id 92-20020a9d02e50000b029028fcc3d2c9eso3342otl.0
        for <keyrings@vger.kernel.org>; Tue, 04 May 2021 14:57:11 -0700 (PDT)
X-Received: by 2002:a05:6830:a:: with SMTP id c10mr21052802otp.21.1620165431621;
 Tue, 04 May 2021 14:57:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210220013255.1083202-1-matthewgarrett@google.com>
In-Reply-To: <20210220013255.1083202-1-matthewgarrett@google.com>
From:   Evan Green <evgreen@chromium.org>
Date:   Tue, 4 May 2021 14:56:35 -0700
X-Gmail-Original-Message-ID: <CAE=gft4HnQKP3RK1hOGpThccLPanQzWpssCsEyUQGLbTMpzrFw@mail.gmail.com>
Message-ID: <CAE=gft4HnQKP3RK1hOGpThccLPanQzWpssCsEyUQGLbTMpzrFw@mail.gmail.com>
Subject: Re: [PATCH 0/9] Enable hibernation when Lockdown is enabled
To:     LKML <linux-kernel@vger.kernel.org>
Cc:     linux-integrity@vger.kernel.org, linux-pm@vger.kernel.org,
        keyrings@vger.kernel.org, zohar@linux.ibm.com,
        "James E.J. Bottomley" <jejb@linux.ibm.com>, jarkko@kernel.org,
        Jonathan Corbet <corbet@lwn.net>, rjw@rjwysocki.net
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Does anyone know if this series is abandoned, or is Matthew planning
to do another spin? Email to matthewgarrett@google.com bounces.

-Evan
