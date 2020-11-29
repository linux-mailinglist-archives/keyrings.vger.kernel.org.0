Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF0212C776F
	for <lists+keyrings@lfdr.de>; Sun, 29 Nov 2020 04:40:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726844AbgK2Djr (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Sat, 28 Nov 2020 22:39:47 -0500
Received: from mail.kernel.org ([198.145.29.99]:46380 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726841AbgK2Djr (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Sat, 28 Nov 2020 22:39:47 -0500
Received: from kernel.org (83-245-197-237.elisa-laajakaista.fi [83.245.197.237])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1B55320705;
        Sun, 29 Nov 2020 03:39:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606621146;
        bh=Ou2HjfK4HkVcrfqQVdAE8u9BWkH9gpBgAV9dAjD69xA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=uBmWxmRQE5pwoptYvr30VdVX/ZCKbAginq3BLBJC917BlX+fxQRVlOD50AThpOFxa
         wrcew6s8UgPkCIw4rH6bDU2WAmCH2hHGbCUZ8KJHO4lY4fUM3i3VNZXiC82Gvt0IoP
         57LDqG9xev6cyDMjYl1KaN+Yodr4hEWyHle0BpF0=
Date:   Sun, 29 Nov 2020 05:38:59 +0200
From:   Jarkko Sakkinen <jarkko@kernel.org>
To:     David Howells <dhowells@redhat.com>
Cc:     Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
        James Morris <jmorris@namei.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Jarkko Sakkinen <jarkko.sakkinen@iki.fi>,
        Jann Horn <jannh@google.com>,
        Gabriel Krisman Bertazi <krisman@collabora.com>,
        "Alexander A. Klimov" <grandmaster@al2klimov.de>,
        Ben Boeckel <mathstuf@gmail.com>,
        linux-security-module@vger.kernel.org,
        Denis Efremov <efremov@linux.com>, keyrings@vger.kernel.org,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Tom Rix <trix@redhat.com>,
        "Serge E. Hallyn" <serge@hallyn.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/9] keys: Miscellaneous fixes
Message-ID: <20201129033859.GG39488@kernel.org>
References: <160649552401.2744658.15096366594785577090.stgit@warthog.procyon.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <160649552401.2744658.15096366594785577090.stgit@warthog.procyon.org.uk>
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Fri, Nov 27, 2020 at 04:45:24PM +0000, David Howells wrote:
> 
> Hi Jarkko,
> 
> I've collected together a bunch of minor keyrings fixes, but I'm not sure
> there's anything that can't wait for the next merge window.
> 
> The patches can be found on the following branch:
> 
> 	https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git/log/?h=keys-fixes
> 
> David


I think that looks good, thank you. I'm sending PR next week. Should I
bundle those to that?

/Jarkko


> ---
> Alexander A. Klimov (1):
>       encrypted-keys: Replace HTTP links with HTTPS ones
> 
> Denis Efremov (1):
>       security/keys: use kvfree_sensitive()
> 
> Gabriel Krisman Bertazi (1):
>       watch_queue: Drop references to /dev/watch_queue
> 
> Gustavo A. R. Silva (1):
>       security: keys: Fix fall-through warnings for Clang
> 
> Jann Horn (1):
>       keys: Remove outdated __user annotations
> 
> Krzysztof Kozlowski (1):
>       KEYS: asymmetric: Fix kerneldoc
> 
> Randy Dunlap (2):
>       security: keys: delete repeated words in comments
>       crypto: asymmetric_keys: fix some comments in pkcs7_parser.h
> 
> Tom Rix (1):
>       KEYS: remove redundant memset
> 
> 
>  Documentation/security/keys/core.rst     |  4 ++--
>  crypto/asymmetric_keys/asymmetric_type.c |  6 ++++--
>  crypto/asymmetric_keys/pkcs7_parser.h    |  5 ++---
>  include/keys/encrypted-type.h            |  2 +-
>  samples/Kconfig                          |  2 +-
>  samples/watch_queue/watch_test.c         |  2 +-
>  security/keys/Kconfig                    |  8 ++++----
>  security/keys/big_key.c                  |  9 +++------
>  security/keys/keyctl.c                   |  2 +-
>  security/keys/keyctl_pkey.c              |  2 --
>  security/keys/keyring.c                  | 10 +++++-----
>  11 files changed, 24 insertions(+), 28 deletions(-)
> 
> 
> 
