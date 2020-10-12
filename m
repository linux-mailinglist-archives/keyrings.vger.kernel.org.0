Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA7B728C35A
	for <lists+keyrings@lfdr.de>; Mon, 12 Oct 2020 22:52:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731643AbgJLUwk (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Mon, 12 Oct 2020 16:52:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731636AbgJLUwh (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Mon, 12 Oct 2020 16:52:37 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D46E2C0613D5
        for <keyrings@vger.kernel.org>; Mon, 12 Oct 2020 13:52:36 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id p15so18173579ljj.8
        for <keyrings@vger.kernel.org>; Mon, 12 Oct 2020 13:52:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QZJDE0LxTTi9B9pOZfxlFtYKGuuGTodrK8rV5HWhrO4=;
        b=GjHnMLrS07E8AP7Dcii/uIy8pv2eT/es+lQ8T/I5GAQ7DoHqwPCHggnxLOUEC60EJS
         gCQ836OmO6CN2XXQQHj7JUe9mNmcLy8Hncv28JKgiwljDH9Z8+8jH+QPKHNsTg8BYzBK
         T06kgGyFXHC88oSrwGnrEQG8M8I5uXPNXCSI4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QZJDE0LxTTi9B9pOZfxlFtYKGuuGTodrK8rV5HWhrO4=;
        b=jV/+IL2//QCyKp6mQ/7ddzVOh82oG9ENnLZDJyHDw6FmjvDcXEJDK3ngkv9rbS7riU
         LSFnsx6NYPftQT1aa/hsZg6G/Af8P0OY7AC8tYinsTdZbjjSWaHJyM1rOe0KUqGhu1Sh
         D8CtRv7xWyneoOFW+FwIWU66FnpGVzzzQ8SEHX4fImwgppV6PRxLOSHmzhaGPXRHas7x
         wxoo7hXGDRiq0felszyifuAY+IRizpt/bm0c9OjwlBJEV6GuEYK3u8WbFT9QDpmecOCF
         HU3neNzA3XfNmHghLjwOMK4VE3e4ODKHj/z4p5uy+qn2p/SeC8ZmtZ5S4hiuTzSxZPSC
         6abg==
X-Gm-Message-State: AOAM533Pu3rbXBw3OrrMAbrNhIgY6tDcBhkZS1FqkajOuBbJGnezj458
        8DSo8wZIejeuaVb4aszXGlwY554eCRc6cg==
X-Google-Smtp-Source: ABdhPJxp6G9WTlsRVjlPIMEOWcT2kOHumHLPIY5cV2q4XH5azBeTDioY7pVFUtJ8aRfJOL/yBiZ89g==
X-Received: by 2002:a2e:879a:: with SMTP id n26mr11566635lji.347.1602535954952;
        Mon, 12 Oct 2020 13:52:34 -0700 (PDT)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com. [209.85.167.42])
        by smtp.gmail.com with ESMTPSA id n125sm2950888lfd.7.2020.10.12.13.52.31
        for <keyrings@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2020 13:52:32 -0700 (PDT)
Received: by mail-lf1-f42.google.com with SMTP id r127so19677787lff.12
        for <keyrings@vger.kernel.org>; Mon, 12 Oct 2020 13:52:31 -0700 (PDT)
X-Received: by 2002:a19:4186:: with SMTP id o128mr7972344lfa.148.1602535951534;
 Mon, 12 Oct 2020 13:52:31 -0700 (PDT)
MIME-Version: 1.0
References: <CAKgNAkjMBGeAwF=2MKK758BhxvW58wYTgYKB2V-gY1PwXxrH+Q@mail.gmail.com>
 <CAHk-=wig1HDZzkDEOxsxUjr7jMU_R5Z1s+v_JnFBv4HtBfP7QQ@mail.gmail.com> <81229415-fb97-51f7-332c-d5e468bcbf2a@gmail.com>
In-Reply-To: <81229415-fb97-51f7-332c-d5e468bcbf2a@gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Mon, 12 Oct 2020 13:52:15 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgjR7Nd4CyDoi3SH9kPJp_Td9S-hhFJZMqvp6GS1Ww8eg@mail.gmail.com>
Message-ID: <CAHk-=wgjR7Nd4CyDoi3SH9kPJp_Td9S-hhFJZMqvp6GS1Ww8eg@mail.gmail.com>
Subject: Re: Regression: epoll edge-triggered (EPOLLET) for pipes/FIFOs
To:     "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Cc:     Alexander Viro <aviro@redhat.com>,
        David Howells <dhowells@redhat.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Nicolas Dichtel <nicolas.dichtel@6wind.com>,
        Ian Kent <raven@themaw.net>,
        Christian Brauner <christian@brauner.io>,
        keyrings@vger.kernel.org,
        "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
        Linux API <linux-api@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>,
        Davide Libenzi <davidel@xmailserver.org>
Content-Type: multipart/mixed; boundary="00000000000021becd05b17f7ab4"
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

--00000000000021becd05b17f7ab4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2020 at 1:30 PM Michael Kerrisk (man-pages)
<mtk.manpages@gmail.com> wrote:
>
> [CC +=3D Davide]

I'm not sure how active Davide is any more..

> I don't think this is correct. The epoll(7) manual page
> sill carries the text written long ago by Davide Libenzi,
> the creator of epoll:
>
>     Since  even with edge-triggered epoll, multiple events can be gen=E2=
=80=90
>     erated upon receipt of multiple chunks of data, the caller has the
>     option  to specify the EPOLLONESHOT flag, to tell epoll to disable
>     the associated file descriptor after the receipt of an event  with
>     epoll_wait(2).
>
> My reading of that text is that in the scenario that I describe a
> readiness notification should be generated at step 3 (and indeed
> should be generated whenever additional data bleeds into the channel).

Hmm.

That is unfortunate, because it basically exposes an internal wait
queue implementation decision, not actual real semantics.

I suspect it's easy enough to "fix" the regression with the attached
patch. It's pretty nonsensical, but I guess there's not a lot of
downside - if the pipe wasn't empty, there normally shouldn't be any
non-epoll readers anyway.

I'm busy merging, mind testing this odd patch out? It is _entirely_
untested, but from the symptoms I think it's the obvious fix.

I did the same thing for the "reader starting out from a full pipe" case to=
o.

               Linus

--00000000000021becd05b17f7ab4
Content-Type: application/octet-stream; name=patch
Content-Disposition: attachment; filename=patch
Content-Transfer-Encoding: base64
Content-ID: <f_kg70ii6h0>
X-Attachment-Id: f_kg70ii6h0

IGZzL3BpcGUuYyB8IDEzICsrKysrKy0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlv
bnMoKyksIDcgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZnMvcGlwZS5jIGIvZnMvcGlwZS5j
CmluZGV4IDBhYzE5NzY1OGEyZC4uZTYwNTY1YmI4MTI1IDEwMDY0NAotLS0gYS9mcy9waXBlLmMK
KysrIGIvZnMvcGlwZS5jCkBAIC0yMjgsMTQgKzIyOCwxMyBAQCBwaXBlX3JlYWQoc3RydWN0IGtp
b2NiICppb2NiLCBzdHJ1Y3QgaW92X2l0ZXIgKnRvKQogCV9fcGlwZV9sb2NrKHBpcGUpOwogCiAJ
LyoKLQkgKiBXZSBvbmx5IHdha2UgdXAgd3JpdGVycyBpZiB0aGUgcGlwZSB3YXMgZnVsbCB3aGVu
IHdlIHN0YXJ0ZWQKLQkgKiByZWFkaW5nIGluIG9yZGVyIHRvIGF2b2lkIHVubmVjZXNzYXJ5IHdh
a2V1cHMuCisJICogRXBvbGwgd2FudHMgdXMgdG8gd2FrZSB0aGluZ3MgdXAgd2hldGhlciBpdCB3
YXMgZnVsbCBvciBub3QuCiAJICoKIAkgKiBCdXQgd2hlbiB3ZSBkbyB3YWtlIHVwIHdyaXRlcnMs
IHdlIGRvIHNvIHVzaW5nIGEgc3luYyB3YWtldXAKIAkgKiAoV0ZfU1lOQyksIGJlY2F1c2Ugd2Ug
d2FudCB0aGVtIHRvIGdldCBnb2luZyBhbmQgZ2VuZXJhdGUgbW9yZQogCSAqIGRhdGEgZm9yIHVz
LgogCSAqLwotCXdhc19mdWxsID0gcGlwZV9mdWxsKHBpcGUtPmhlYWQsIHBpcGUtPnRhaWwsIHBp
cGUtPm1heF91c2FnZSk7CisJd2FzX2Z1bGwgPSB0cnVlOwogCWZvciAoOzspIHsKIAkJdW5zaWdu
ZWQgaW50IGhlYWQgPSBwaXBlLT5oZWFkOwogCQl1bnNpZ25lZCBpbnQgdGFpbCA9IHBpcGUtPnRh
aWw7CkBAIC00MjksOCArNDI4LDggQEAgcGlwZV93cml0ZShzdHJ1Y3Qga2lvY2IgKmlvY2IsIHN0
cnVjdCBpb3ZfaXRlciAqZnJvbSkKICNlbmRpZgogCiAJLyoKLQkgKiBPbmx5IHdha2UgdXAgaWYg
dGhlIHBpcGUgc3RhcnRlZCBvdXQgZW1wdHksIHNpbmNlCi0JICogb3RoZXJ3aXNlIHRoZXJlIHNo
b3VsZCBiZSBubyByZWFkZXJzIHdhaXRpbmcuCisJICogRXBvbGwgbm9uc2Vuc2ljYWxseSB3YW50
cyBhIHdha2V1cCB3aGVoZXIgdGhlIHBpcGUgd2FzCisJICogYWxyZWFkeSBlbXB0eSBvciBub3Qu
CiAJICoKIAkgKiBJZiBpdCB3YXNuJ3QgZW1wdHkgd2UgdHJ5IHRvIG1lcmdlIG5ldyBkYXRhIGlu
dG8KIAkgKiB0aGUgbGFzdCBidWZmZXIuCkBAIC00NDAsOSArNDM5LDkgQEAgcGlwZV93cml0ZShz
dHJ1Y3Qga2lvY2IgKmlvY2IsIHN0cnVjdCBpb3ZfaXRlciAqZnJvbSkKIAkgKiBzcGFubmluZyBt
dWx0aXBsZSBwYWdlcy4KIAkgKi8KIAloZWFkID0gcGlwZS0+aGVhZDsKLQl3YXNfZW1wdHkgPSBw
aXBlX2VtcHR5KGhlYWQsIHBpcGUtPnRhaWwpOworCXdhc19lbXB0eSA9IHRydWU7CiAJY2hhcnMg
PSB0b3RhbF9sZW4gJiAoUEFHRV9TSVpFLTEpOwotCWlmIChjaGFycyAmJiAhd2FzX2VtcHR5KSB7
CisJaWYgKGNoYXJzICYmICFwaXBlX2VtcHR5KGhlYWQsIHBpcGUtPnRhaWwpKSB7CiAJCXVuc2ln
bmVkIGludCBtYXNrID0gcGlwZS0+cmluZ19zaXplIC0gMTsKIAkJc3RydWN0IHBpcGVfYnVmZmVy
ICpidWYgPSAmcGlwZS0+YnVmc1soaGVhZCAtIDEpICYgbWFza107CiAJCWludCBvZmZzZXQgPSBi
dWYtPm9mZnNldCArIGJ1Zi0+bGVuOwo=
--00000000000021becd05b17f7ab4--
