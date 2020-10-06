Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4EACF285099
	for <lists+keyrings@lfdr.de>; Tue,  6 Oct 2020 19:18:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726100AbgJFRSz (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 6 Oct 2020 13:18:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725902AbgJFRSz (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Tue, 6 Oct 2020 13:18:55 -0400
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com [IPv6:2607:f8b0:4864:20::d44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57893C061755
        for <keyrings@vger.kernel.org>; Tue,  6 Oct 2020 10:18:55 -0700 (PDT)
Received: by mail-io1-xd44.google.com with SMTP id 67so10516235iob.8
        for <keyrings@vger.kernel.org>; Tue, 06 Oct 2020 10:18:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=I6As+tbZ1PVgTFGvFSCRPXZj6ZSlm0syTjoHQ6opSYM=;
        b=DKdy9DTKNNLDoY9BX457bgC04+Pw9GZwTxSJqXrUkLOW2NWp9KYwocFfbWAi5UI2yI
         0fCkzJiL6UTIf4KEOf1UlNVBPRAekagWiXhV4bV0Wh9/GIIKQWWiZ7E195lk6IcTybSJ
         bjQAGgyL3zegEZ9h3jpL6tZ6ZCWXgEapEYCgjQRqZR4dMIJ9XKSlAjz3l91eN4dMz89o
         iEDcr9sfYnXLbzLrv1z8B7/yugfFcqpwXSl744BM/0eNdYR3xeWz/nZTWBRBcGFbk2f1
         lQCGY1Q2nxJI3ZeUduKEAZLOKxONYLTYODO7tti7Izy/UUKjCPMJR213IblV6WDQe/Fh
         99Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=I6As+tbZ1PVgTFGvFSCRPXZj6ZSlm0syTjoHQ6opSYM=;
        b=LaGC81HfuYh4CgTXXWweZ/ikmE0LKhh10YtcEC6dHgTP4Nm2Un3/dB6zTjSBIC0p+q
         VWQygxGtiygg3U/N9R6xNaYYWccYvCDKcPg6m8Mv1IA7pMLe7v0lR1Hafp4Mtx4Tkmuu
         72tasr80fWjGyQVSkOPS2Ov7B+FlL1PoD9wwLAhXuuQsy/Hc0WIGV3iFBSHiIZA83/rF
         eFOBO2dI9oamSLmTV4ls9L2x4s1YviNCQp7FEf8pfTI3Hvtiu2+oWaZB8o8g8RO61xDP
         1pxuyn4nd6DD6jUS29KlG6Zemk2BwrV6kAM530ZLIPWVAZKExRtq+Dtv1izwhFvluFGo
         kOyw==
X-Gm-Message-State: AOAM530PxnP7CLaibzM4NArxMtFcHSFfhrjQ7XQ7m4j4BihWbdRFshj3
        DmmsSBjjqyfmveFxE6UCy0qdsLoZ8R9j/AsO8swFoYhcvI9uyg==
X-Google-Smtp-Source: ABdhPJxwq6nYJEjdHukxeLJhuivteaTzhO7GV3vTI6Voo3AuBs2R/LttS35tKueByBdh32KZhdoNHS8BXaHebxmllTg=
X-Received: by 2002:a6b:4e0a:: with SMTP id c10mr1987868iob.120.1602004734651;
 Tue, 06 Oct 2020 10:18:54 -0700 (PDT)
MIME-Version: 1.0
References: <20201005225258.200181-1-anatol.pomozov@gmail.com>
 <20201006155624.GC111447@linux.intel.com> <20201006155656.GD111447@linux.intel.com>
In-Reply-To: <20201006155656.GD111447@linux.intel.com>
From:   Anatol Pomozov <anatol.pomozov@gmail.com>
Date:   Tue, 6 Oct 2020 10:18:43 -0700
Message-ID: <CAOMFOmWbxPZ4=XKPkX89DaGhGez94NZopexYUj7hA7rDXb9x0g@mail.gmail.com>
Subject: Re: [PATCH v2] encrypted-keys: Print more useful debug info if
 encryption algo is not available
To:     Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Cc:     keyrings@vger.kernel.org, zohar@linux.ibm.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Hi

On Tue, Oct 6, 2020 at 8:59 AM Jarkko Sakkinen
<jarkko.sakkinen@linux.intel.com> wrote:
>
> On Tue, Oct 06, 2020 at 06:56:28PM +0300, Jarkko Sakkinen wrote:
> > On Mon, Oct 05, 2020 at 03:52:58PM -0700, Anatol Pomozov wrote:
> > > It helps to improve a cryptic message "encrypted_key failed to alloc_cipher (-2)".
> > > Adding algo name makes it easier to understand what cipher has failed.
> > >
> > > Signed-off-by: Anatol Pomozov <anatol.pomozov@gmail.com>
> >
> > NAK, because you are missing David Howells from the CC list.
>
> Oh and also me. You are essentially missing all the keyring maintainers.

The MAINTAINERS file states following:

KEYS-ENCRYPTED
M:      Mimi Zohar <zohar@linux.ibm.com>
L:      linux-integrity@vger.kernel.org
L:      keyrings@vger.kernel.org
S:      Supported
F:      Documentation/security/keys/trusted-encrypted.rst
F:      include/keys/encrypted-type.h
F:      security/keys/encrypted-keys/

Everything seems fine as I included the official maintainer and the
project maillist.

If David is not subscribed to the project maillist I'll be glad to CC
him as well.
