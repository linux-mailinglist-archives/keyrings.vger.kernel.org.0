Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BE0DA24D7E
	for <lists+keyrings@lfdr.de>; Tue, 21 May 2019 13:02:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727534AbfEULCq (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 21 May 2019 07:02:46 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:37360 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726138AbfEULCp (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Tue, 21 May 2019 07:02:45 -0400
Received: by mail-ot1-f67.google.com with SMTP id r10so15937743otd.4
        for <keyrings@vger.kernel.org>; Tue, 21 May 2019 04:02:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xmbbl4/yPbmW/5hzHhWa8vSxB1+EqtnQJCpZ6Rh1wME=;
        b=nXRpENajJH4pVDRUoK5QlSP9bnXCvQisqT4xaq6vhzkn5KdYkYM23dGZb6JNJvqGHa
         toZKaBZt0zmlU+tdr193pErRWvXBxm6lotai4pPMR4zEOUiOLRouRzKrDbxCQl4bn0qg
         kFcwW01IVraO9z2Ie/0dK9dgHWnCtyf6OUk7S/XUVOA0JOnUMc5QPedJ7PgwX78yzqRF
         m4dbMG3o3azRqWHf+xi8FPw7Fisd6wqzsFyZ0QVhZmvbD4Cbq+VWnL2JPxo7IYeUqLmb
         2XvZvwrjdKG5dKr3pW3NpdZqBOw5Xb/25qEU1nENXdtGYYBabROGWAsB+oAXZRoBybwC
         4y6g==
X-Gm-Message-State: APjAAAWOaw6mHuKqpyff+ucZcLA6uYzPnt1I6UCW0slGA1XS7ANh3ERp
        pvJjWjwnpdzb7U3DWPI+96PolI/tkOSQHusEPWctdQ==
X-Google-Smtp-Source: APXvYqyMVJOHqzpVFlzUh6iYMBzNgHe3iskmeKSAa4z0tzhyZMrV2/JSf7fxJUnKMJDHM4obJ9Q243qu0PgSD7wF8A0=
X-Received: by 2002:a9d:6a8a:: with SMTP id l10mr47398758otq.197.1558436565213;
 Tue, 21 May 2019 04:02:45 -0700 (PDT)
MIME-Version: 1.0
References: <20190521100034.9651-1-omosnace@redhat.com> <A3BC3B07-6446-4631-862A-F661FB9D63B9@holtmann.org>
In-Reply-To: <A3BC3B07-6446-4631-862A-F661FB9D63B9@holtmann.org>
From:   Ondrej Mosnacek <omosnace@redhat.com>
Date:   Tue, 21 May 2019 13:02:34 +0200
Message-ID: <CAFqZXNtCNG2s_Rk_v332HJA5HVXsJYXDsyzfTNgSU_MJ-mMByA@mail.gmail.com>
Subject: Re: [PATCH] crypto: af_alg - implement keyring support
To:     Marcel Holtmann <marcel@holtmann.org>
Cc:     linux-crypto@vger.kernel.org,
        Herbert Xu <herbert@gondor.apana.org.au>,
        keyrings@vger.kernel.org, David Howells <dhowells@redhat.com>,
        Stephan Mueller <smueller@chronox.de>,
        Milan Broz <gmazyland@gmail.com>,
        Ondrej Kozina <okozina@redhat.com>,
        Daniel Zatovic <dzatovic@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Hi Marcel,

On Tue, May 21, 2019 at 12:48 PM Marcel Holtmann <marcel@holtmann.org> wrote:
> Hi Ondrej,
>
> > This patch adds new socket options to AF_ALG that allow setting key from
> > kernel keyring. For simplicity, each keyring key type (logon, user,
> > trusted, encrypted) has its own socket option name and the value is just
> > the key description string that identifies the key to be used. The key
> > description doesn't need to be NULL-terminated, but bytes after the
> > first zero byte are ignored.
>
> why use the description instead the actual key id? I wonder if a single socket option and a struct providing the key type and key id might be more useful.

I was basing this on the approach taken by dm-crypt/cryptsetup, which
is actually the main target consumer for this feature (cryptsetup
needs to be able to encrypt/decrypt data using a keyring key (possibly
unreadable by userspace) without having to create a temporary dm-crypt
mapping, which requires CAP_SYSADMIN). I'm not sure why they didn't
just use key IDs there... @Milan/Ondrej, what was you motivation for
using key descriptions rather than key IDs?

-- 
Ondrej Mosnacek <omosnace at redhat dot com>
Software Engineer, Security Technologies
Red Hat, Inc.
