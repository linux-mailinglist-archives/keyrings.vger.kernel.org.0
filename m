Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E70EC1D00FB
	for <lists+keyrings@lfdr.de>; Tue, 12 May 2020 23:38:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729619AbgELViv (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 12 May 2020 17:38:51 -0400
Received: from mail.zx2c4.com ([192.95.5.64]:56637 "EHLO mail.zx2c4.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726268AbgELViv (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Tue, 12 May 2020 17:38:51 -0400
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c74cb3a6;
        Tue, 12 May 2020 21:25:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
        :references:in-reply-to:from:date:message-id:subject:to:cc
        :content-type; s=mail; bh=QHZdxdAznvbCsAtmKjiWvIM9Rkw=; b=MvD3Lb
        oVsAoirYLJSrJWid+5RlALnx2IRewi5D0XBFtensY47q3F11/1CtwFB5Eegu/rI1
        Pid6Wx2EvUYjZPfmZGjw9K8P6wYoy6QkCFrPmSyueGYQT0ehJ+ObAbPUH/MO80YR
        lgG2lkNpdMeTNMDZJrtZbEKLjK/ohUsVlltq0XSXirzYqVDik4HdhkLxhPByleUi
        nIVklcGJio1YXP5DG4ogblcqJZJ0R7MUkdxyQhzMhK8vZhyd40aaYk8jf5X45I5k
        3BNLQAauYx/2QdATKBVB+tr2WW5c6Ps2riW9WvCxzbdw/kouf6sYczcIznGhlmMf
        v+IXNN0GTccJmRDQ==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id f53c83df (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
        Tue, 12 May 2020 21:25:19 +0000 (UTC)
Received: by mail-il1-f181.google.com with SMTP id i16so13931834ils.12;
        Tue, 12 May 2020 14:38:49 -0700 (PDT)
X-Gm-Message-State: AGi0PuY6o6lu3NBCAfLDr9gJXtIkUWEA4C1W+rxpmoLqJ0VIYWS/jhbf
        3fwi8NXmonZdVSTK685BGcsurJDyP9L5vLDtA/0=
X-Google-Smtp-Source: APiQypJzMvF0pm2HCVQ5PwdpsSCqC6FjWIGTFESdbJ/delouG0Mi5pZJuKDQJHB5ZYDpPpJ7fdbGT//MYh2mBmx/jhU=
X-Received: by 2002:a92:8752:: with SMTP id d18mr6109118ilm.224.1589319528551;
 Tue, 12 May 2020 14:38:48 -0700 (PDT)
MIME-Version: 1.0
References: <CAHmME9oXiTmVuOYmG=K3ijWK+zP2yB9a2CFjbLx_5fkDiH30Tg@mail.gmail.com>
 <20200511215101.302530-1-Jason@zx2c4.com> <2620780.1589289425@warthog.procyon.org.uk>
In-Reply-To: <2620780.1589289425@warthog.procyon.org.uk>
From:   "Jason A. Donenfeld" <Jason@zx2c4.com>
Date:   Tue, 12 May 2020 15:38:37 -0600
X-Gmail-Original-Message-ID: <CAHmME9q-TxHo5o63rxHzKwV_kWV9u+MoxBQM5Yz3hODGCj7RhQ@mail.gmail.com>
Message-ID: <CAHmME9q-TxHo5o63rxHzKwV_kWV9u+MoxBQM5Yz3hODGCj7RhQ@mail.gmail.com>
Subject: Re: [PATCH v3] security/keys: rewrite big_key crypto to use library interface
To:     David Howells <dhowells@redhat.com>
Cc:     keyrings@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        Andy Lutomirski <luto@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        kernel-hardening@lists.openwall.com,
        Eric Biggers <ebiggers@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Hi David,

So long as that ->update function:
1. Deletes the old on-disk data.
2. Deletes the old key from the inode.
3. Generates a new key using get_random_bytes.
4. Stores that new key in the inode.
5. Encrypts the updated data afresh with the new key.
6. Puts the updated data onto disk,

then this is fine with me, and feel free to have my Acked-by if you
want. But if it doesn't do that -- i.e. if it tries to reuse the old
key or similar -- then this isn't fine. But it sounds like from what
you've described that things are actually fine, in which case, I guess
it makes sense to apply your patch ontop of mine and commit these.

Jason
