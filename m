Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C4231325188
	for <lists+keyrings@lfdr.de>; Thu, 25 Feb 2021 15:34:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231154AbhBYOd3 (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 25 Feb 2021 09:33:29 -0500
Received: from mail.kernel.org ([198.145.29.99]:56298 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232139AbhBYOd1 (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Thu, 25 Feb 2021 09:33:27 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 86F1464F06;
        Thu, 25 Feb 2021 14:32:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614263566;
        bh=pweKDcCfbwiPFpgl8eYLrSmwbhz1890DPEAEgI0kxXM=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=WaR3MzFHqW+EdsjzeI9f6EjF0XbqDCNLzBKDnmo5nM3B8P86LmTTK5OhSOanDdJzr
         J9xVZwTEcxW6yOQ3ESG8tJAynaLAXeu8VS8YsqJ+bWtmrMVItP0Su6qM0xnzp3a9H0
         RCs+0TdHYQPadlL6XTrTqQGAbs/7j+2gdnyo2/MP30HQnR59iolk6zglNS7ZRBjnwH
         /2mNxWBZyf4ef1gJPmP1+88/YrXRUayVUFvSdqWxLCsZ59KmvQSN9VZ1gDarGrSm7E
         /ZopQI5vVtJZL7SIrQWC2Zouaz7DQpHBlO875V2yqFIahV6Ga0i1hgK1lDnszX37QP
         b+2xnRN0G8RpQ==
Received: by mail-ot1-f49.google.com with SMTP id d9so5786356ote.12;
        Thu, 25 Feb 2021 06:32:46 -0800 (PST)
X-Gm-Message-State: AOAM532R6c1UZ12yahyQ7cKcfEZlD9ItveZFUdBF8jH2MOk7xvobHE95
        pll837jg5V+lPNx9+rhMSd9PuSANuSUmju4AayI=
X-Google-Smtp-Source: ABdhPJxtdthWZ8TUXpcqxTVamctwd2ch7Pb0DhXDRuDJl/T0ZFFF2LvSRKDa8UmjGVCGmOV4lrtoc0LOKBY8tmr4wE0=
X-Received: by 2002:a9d:6b8b:: with SMTP id b11mr2518462otq.210.1614263565720;
 Thu, 25 Feb 2021 06:32:45 -0800 (PST)
MIME-Version: 1.0
References: <20210225125638.1841436-1-arnd@kernel.org> <347810.1614262328@warthog.procyon.org.uk>
In-Reply-To: <347810.1614262328@warthog.procyon.org.uk>
From:   Arnd Bergmann <arnd@kernel.org>
Date:   Thu, 25 Feb 2021 15:32:29 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1dTn--2_3d6HXD0Dx13av8dJLB57790SQ2L0Ag0b_xaQ@mail.gmail.com>
Message-ID: <CAK8P3a1dTn--2_3d6HXD0Dx13av8dJLB57790SQ2L0Ag0b_xaQ@mail.gmail.com>
Subject: Re: [PATCH] certs: select PKCS7_MESSAGE_PARSER if needed
To:     David Howells <dhowells@redhat.com>
Cc:     David Woodhouse <dwmw2@infradead.org>,
        Eric Snowberg <eric.snowberg@oracle.com>,
        Jarkko Sakkinen <jarkko@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, keyrings@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Thu, Feb 25, 2021 at 3:12 PM David Howells <dhowells@redhat.com> wrote:
>
> Arnd Bergmann <arnd@kernel.org> wrote:
>
> > +     select PKCS7_MESSAGE_PARSER if INTEGRITY_PLATFORM_KEYRING
>
> I think a better way to do it is to add a separate config option for dealing
> with revocation certs, which is part of what I suggested here:
>
>         https://lore.kernel.org/keyrings/3731128.1614163916@warthog.procyon.org.uk/

Ok, sounds good. Can this make it into v5.12 though, or do we need an
intermediate
fix to avoid the build failure?

        Arnd
