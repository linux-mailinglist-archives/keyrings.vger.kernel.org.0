Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F7C22DA743
	for <lists+keyrings@lfdr.de>; Tue, 15 Dec 2020 05:58:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725890AbgLOE6B (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Mon, 14 Dec 2020 23:58:01 -0500
Received: from mail.kernel.org ([198.145.29.99]:34398 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725535AbgLOE5x (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Mon, 14 Dec 2020 23:57:53 -0500
Date:   Tue, 15 Dec 2020 06:57:02 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1608008229;
        bh=kOjVmQdCAqW6cDtf74EVsL3eevU9FttJOVVYKFdveYI=;
        h=From:To:Cc:Subject:References:In-Reply-To:From;
        b=heWtiKZvsp7E+YSNyoxoDoqk2l8vAJ3AzOLPezP2wYKXKCW9NwpODvMg2PLxCGsus
         Z++3ezrHXmMZuCc8HtfwnO/mqvX89mgZOIXbadRgGEM+B+qNQPnzlAJsHbTgLcwU+f
         lbGgNWM4i3UYPMVloevHXJg7wc8P3G8zMNaotf7GAadsWHBeVYYYumzPacJitRveQJ
         z81D7CNeefQ4LVpnFzX1V6hi6rhxBkNXaXJJ7so5y2PlABeisBg+pSlC8Pg1NOdRZE
         TokPQbTr3k63xhDl5Uc4WN/P1UZYBtxSsRC8B6gtjWh42cYB6vmSHb7EGT9r/IndPT
         SZQ6LoTp1bDYg==
From:   Jarkko Sakkinen <jarkko@kernel.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     David Howells <dhowells@redhat.com>,
        "Alexander A. Klimov" <grandmaster@al2klimov.de>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Alex Shi <alex.shi@linux.alibaba.com>,
        Ben Boeckel <mathstuf@gmail.com>,
        Denis Efremov <efremov@linux.com>,
        Gabriel Krisman Bertazi <krisman@collabora.com>,
        Jann Horn <jannh@google.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        =?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@linux.microsoft.com>,
        Mimi Zohar <zohar@linux.vnet.ibm.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Tianjia Zhang <tianjia.zhang@linux.alibaba.com>,
        Tom Rix <trix@redhat.com>, YueHaibing <yuehaibing@huawei.com>,
        keyrings@vger.kernel.org,
        Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        LSM List <linux-security-module@vger.kernel.org>
Subject: Re: [GIT PULL] keys: Collected minor fixes and cleanups
Message-ID: <20201215045702.GA24600@kernel.org>
References: <2659836.1607940186@warthog.procyon.org.uk>
 <CAHk-=wido5stGfFtRzmW19bB1w2XQAuY8oxUtFN2ZWdk2Grq-w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wido5stGfFtRzmW19bB1w2XQAuY8oxUtFN2ZWdk2Grq-w@mail.gmail.com>
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Mon, Dec 14, 2020 at 12:49:27PM -0800, Linus Torvalds wrote:
> The pain just isn't worth it, but more importantly, you simply need to
> get your workflow in order, and not send me completely untested
> garbage that hasn't even been compiled.

I have now more bandwidth. It was mostly eaten by SGX, especially last
few months. Starting from next week, I'll start proactively test keyring
changes (I'm this week on vacation).

I've been thinking that maybe a two-folded approach would make sense for
keyring:

1. I would pick fixes to my linux-tpmdd where they would get quickly
   mirrored to linux-next. It's already taking changes for trusted
   keys, i.e. not solely for TPM changes.
2. Feature changes would go through David's tree.

>                Linus

/Jarkko
