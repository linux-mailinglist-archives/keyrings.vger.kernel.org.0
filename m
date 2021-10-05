Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 55DF3422F28
	for <lists+keyrings@lfdr.de>; Tue,  5 Oct 2021 19:25:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235599AbhJER1A (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 5 Oct 2021 13:27:00 -0400
Received: from mail.kernel.org ([198.145.29.99]:58624 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235351AbhJER07 (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Tue, 5 Oct 2021 13:26:59 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0FF6F61350;
        Tue,  5 Oct 2021 17:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1633454709;
        bh=DoaVxkaQfbnOf+3o+qFy6q0S/2R64repQVszE9mXb+8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=MxFVy8UWfmVAMk+Xtrj9nxFyd5CdgQueuHVxOK1MDG97N31aPgTeEmNy1/UeRuJ1L
         NaC2j88q8gRJnJpDdCW95/gWB/HkWp4Gk/C8wBY3WnmY5QBqzIThPGhmpH44gqbCqK
         U/QiArhEZ4es14Js0Bc+I4TEZJEbmMGYTUXcMtCFAQ+q727uy8VOOARFIv+xR6RSjB
         DUApKTUw35sCdHMyGRjHGBk2MqzCJqqYNdn5UvffHY+V3hNfJCaz5pIlrp9s2lDwNl
         HZCsseUd0kJrKBheuPb19ZufmpL965ep79znRBz4TKoOIzhGQUNHeLRwPrQzNuayxe
         ZEIRGlefQJ76A==
Date:   Tue, 5 Oct 2021 10:25:07 -0700
From:   Eric Biggers <ebiggers@kernel.org>
To:     Adam Langley <agl@google.com>
Cc:     Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org,
        David Howells <dhowells@redhat.com>,
        David Woodhouse <dwmw2@infradead.org>, keyrings@vger.kernel.org
Subject: Re: [PATCH 1/1] sign-file: Use OpenSSL provided define to compile
 out deprecated APIs
Message-ID: <YVyKc51r2tfMmQuO@gmail.com>
References: <20211005161833.1522737-1-lee.jones@linaro.org>
 <YVyE3Ax1PRtiBwf+@gmail.com>
 <CAL9PXLws4DjvPB=1KNpom3W52pXNauXQ4V==MprDx73YQ1-sgg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAL9PXLws4DjvPB=1KNpom3W52pXNauXQ4V==MprDx73YQ1-sgg@mail.gmail.com>
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Tue, Oct 05, 2021 at 10:14:58AM -0700, Adam Langley wrote:
> On Tue, Oct 5, 2021 at 10:01 AM Eric Biggers <ebiggers@kernel.org> wrote:
> > I ran into these same -Wdeprecated-declarations compiler warnings on another
> > project that uses the ENGINE API to access OpenSSL's support for PKCS#11 tokens.
> > The conclusion was that in OpenSSL 3.0, the new API for PKCS#11 support isn't
> > actually ready yet, so we had to keep using the ENGINE API and just add
> > -Wno-deprecated-declarations to the compiler flags.
> >
> > Your patch just removes support for PKCS#11 in that case, which seems
> > undesirable.  (Unless no one is actually using it?)
> 
> The patch removes support when OPENSSL_NO_ENGINE is defined, but
> that's not defined by default in OpenSSL 3.0. (Unless something
> changed recently.)
> 
> When OPENSSL_NO_ENGINE is defined, ENGINE support is not compiled into
> OpenSSL and the headers don't include the functions:
> https://github.com/openssl/openssl/blob/master/include/openssl/engine.h
> .

Okay so this patch is actually a build fix for when OpenSSL doesn't include
ENGINE support?  Currently this patch claims that it's removing the use of a
"deprecated" API, which is something entirely different.

- Eric
