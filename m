Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0DC1B1C21CB
	for <lists+keyrings@lfdr.de>; Sat,  2 May 2020 02:06:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726468AbgEBAGi (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Fri, 1 May 2020 20:06:38 -0400
Received: from mail.zx2c4.com ([192.95.5.64]:56769 "EHLO mail.zx2c4.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726455AbgEBAGh (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Fri, 1 May 2020 20:06:37 -0400
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4b72f3ef
        for <keyrings@vger.kernel.org>;
        Fri, 1 May 2020 23:54:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
        :references:in-reply-to:from:date:message-id:subject:to:cc
        :content-type; s=mail; bh=v8CEPhtYy//8RVs7R9SE4WuHeYE=; b=oXv897
        Q657xkDx/uTHMf9tPN9nwUAQKO4+uNSl0I4BzWTpQD+fXRjW9/RBEepdFdig2xm1
        nllfFwoutRERVt9h2VPXOQwngBptHZ+g88UyXsiiAGWrA5Jsd5x5W1f6V2dk7SQM
        Um+odStnhnbqZSTFEmeognyKhSBX8xxc2zJ9t4oFL4Shp2WkdMPHs4tx+/pj7rlM
        7tCn3j8chGy9TGVWXTkWehTQHBGXeL3dAMAGw0vmeuDcl3BCMkYlu8iHIoXZWCOt
        DooFfXksUk36UMDPV0X5xIgFwvmST/l1mtxbWVFxP33k9xqVFB6MbFa3gPPcUg91
        bdPq7HrSovZP7A+Q==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id bb2d192b (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
        for <keyrings@vger.kernel.org>;
        Fri, 1 May 2020 23:54:24 +0000 (UTC)
Received: by mail-il1-f173.google.com with SMTP id s10so5897695iln.11
        for <keyrings@vger.kernel.org>; Fri, 01 May 2020 17:06:29 -0700 (PDT)
X-Gm-Message-State: AGi0PuaOAsuSk14IqrV8K1ZGYm7DwSIGV80z5bvWHLaE4u3NURX5y9Z1
        PEaX/Zpilx3etsJbxIJgcoPiWHv82HYeYcnCyVY=
X-Google-Smtp-Source: APiQypJoG+c/aoKfXrAe0iv4v3ahcNqsCH+3jY9kSos4Xyt4xRI+UMJRcq73LeyQxG8swvg4SEpyofOIyMbfD9cBDZI=
X-Received: by 2002:a92:d4c4:: with SMTP id o4mr6399787ilm.38.1588377988977;
 Fri, 01 May 2020 17:06:28 -0700 (PDT)
MIME-Version: 1.0
References: <20200501222357.543312-1-Jason@zx2c4.com> <20200501230913.GB915@sol.localdomain>
In-Reply-To: <20200501230913.GB915@sol.localdomain>
From:   "Jason A. Donenfeld" <Jason@zx2c4.com>
Date:   Fri, 1 May 2020 18:06:17 -0600
X-Gmail-Original-Message-ID: <CAHmME9rpZGiwrK93=+6z8qBdDVs273MaR_boDd1xjjZRwbqpKQ@mail.gmail.com>
Message-ID: <CAHmME9rpZGiwrK93=+6z8qBdDVs273MaR_boDd1xjjZRwbqpKQ@mail.gmail.com>
Subject: Re: [PATCH] security/keys: rewrite big_key crypto to use Zinc
To:     Eric Biggers <ebiggers@kernel.org>
Cc:     David Howells <dhowells@redhat.com>, keyrings@vger.kernel.org,
        Andy Lutomirski <luto@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        kernel-hardening@lists.openwall.com
Content-Type: text/plain; charset="UTF-8"
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Hey Eric,

Thanks for the review.

I'll add `select CONFIG` as you suggested. I agree about trying to
move as much as possible out of crypto and into lib/crypto. Breaking
those dependency cycles won't be easy but perhaps it'll be possible to
chip away at that gradually. (I'd also lib a
lib/crypto/arch/{arch}/..., but I guess that's a separate discussion.)

I'll also change -EINVAL to -EBADMSG. Nice catch.

Regarding the buffer zeroing... are you sure? These buffers are
already being copied into filesystem caches and all sorts of places
over which we have zero control. At that point, does it matter? Or do
you argue that because it's still technically key material, we should
zero out both the plaintext and ciphertext everywhere we can, and
hopefully at some point the places where we can't will go away? IOW,
I'm fine doing that, but would like to learn your explicit reasoning
before.

Jason
