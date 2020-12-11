Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E3482D7440
	for <lists+keyrings@lfdr.de>; Fri, 11 Dec 2020 11:54:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393689AbgLKKxT (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Fri, 11 Dec 2020 05:53:19 -0500
Received: from mail.kernel.org ([198.145.29.99]:53878 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2393603AbgLKKwh (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Fri, 11 Dec 2020 05:52:37 -0500
Date:   Fri, 11 Dec 2020 12:51:46 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1607683916;
        bh=HveGjGXQtRluuYEASxXKc/5EZsIEMlo+x9anuUBY7A4=;
        h=From:To:Cc:Subject:References:In-Reply-To:From;
        b=rEJRKfw4Gchzzkhu5A1Sa4eAosJ0vA5YWvT0fUcSab8bVF2XBfiwragJPNINoDHKu
         dWpsxkhRCKQemkKc4K0Ia7FPtK9SqtMcWhFc4rxp3dg/H0SubzU6LDEYj2JH8VsPgO
         w/oFEBySJAYUa51vC27DYySZj0X8J2kdoPuHcDQn2iUbp+Fzr7E7DBcZPuAwIr5OE+
         Fc+j9nlVX736g17PKtmrZs56ipC5Z4zxrP+6SyWamcF1sC3HpTw8i6K3sQOcloMl9N
         wCcWrOPu5hBxYM71T0dtafTaflZVV+4HNuzQpXOIoPeUXdhESLvQxG5KNvyioXvUHk
         E9h+JvKRzArUw==
From:   Jarkko Sakkinen <jarkko@kernel.org>
To:     David Howells <dhowells@redhat.com>
Cc:     Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
        "Alexander A. Klimov" <grandmaster@al2klimov.de>,
        Petko Manolov <petkan@mip-labs.com>,
        "Serge E. Hallyn" <serge@hallyn.com>, linux-kernel@vger.kernel.org,
        YueHaibing <yuehaibing@huawei.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Jann Horn <jannh@google.com>, linux-crypto@vger.kernel.org,
        Ben Boeckel <mathstuf@gmail.com>, keyrings@vger.kernel.org,
        Gabriel Krisman Bertazi <krisman@collabora.com>,
        linux-security-module@vger.kernel.org,
        Randy Dunlap <rdunlap@infradead.org>,
        Mimi Zohar <zohar@linux.vnet.ibm.com>,
        Tom Rix <trix@redhat.com>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Alex Shi <alex.shi@linux.alibaba.com>,
        Jarkko Sakkinen <jarkko.sakkinen@iki.fi>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        James Morris <jmorris@namei.org>,
        Denis Efremov <efremov@linux.com>,
        =?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@linux.microsoft.com>,
        David Woodhouse <dwmw2@infradead.org>,
        "David S. Miller" <davem@davemloft.net>,
        Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
Subject: Re: [PATCH 00/18] keys: Miscellaneous fixes
Message-ID: <20201211105146.GF12091@kernel.org>
References: <160751606428.1238376.14935502103503420781.stgit@warthog.procyon.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <160751606428.1238376.14935502103503420781.stgit@warthog.procyon.org.uk>
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Wed, Dec 09, 2020 at 12:14:24PM +0000, David Howells wrote:
> 
> Hi Jarkko,
> 
> I've extended my collection of minor keyrings fixes for the next merge
> window.  Anything else I should add (or anything I should drop)?
> 
> The patches can be found on the following branch:
> 
> 	https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git/log/?h=keys-fixes
> 
> David

Looks good to me.

/Jarkko

> ---
> Alex Shi (2):
>       PKCS#7: drop function from kernel-doc pkcs7_validate_trust_one
>       certs/blacklist: fix kernel doc interface issue
> 
> Alexander A. Klimov (1):
>       encrypted-keys: Replace HTTP links with HTTPS ones
> 
> David Howells (1):
>       certs: Fix blacklist flag type confusion
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
> Mickaël Salaün (3):
>       certs: Fix blacklisted hexadecimal hash string check
>       PKCS#7: Fix missing include
>       certs: Replace K{U,G}IDT_INIT() with GLOBAL_ROOT_{U,G}ID
> 
> Randy Dunlap (2):
>       security: keys: delete repeated words in comments
>       crypto: asymmetric_keys: fix some comments in pkcs7_parser.h
> 
> Tianjia Zhang (1):
>       crypto: public_key: Remove redundant header file from public_key.h
> 
> Tom Rix (2):
>       KEYS: remove redundant memset
>       keys: remove trailing semicolon in macro definition
> 
> YueHaibing (1):
>       crypto: pkcs7: Use match_string() helper to simplify the code
> 
> 
>  Documentation/security/keys/core.rst     |  4 ++--
>  certs/blacklist.c                        | 10 +++++-----
>  certs/system_keyring.c                   |  5 +++--
>  crypto/asymmetric_keys/asymmetric_type.c |  6 ++++--
>  crypto/asymmetric_keys/pkcs7_parser.h    |  5 ++---
>  crypto/asymmetric_keys/pkcs7_trust.c     |  2 +-
>  crypto/asymmetric_keys/pkcs7_verify.c    |  9 ++++-----
>  include/crypto/public_key.h              |  1 -
>  include/keys/encrypted-type.h            |  2 +-
>  include/linux/key.h                      |  5 +++--
>  include/linux/verification.h             |  2 ++
>  samples/Kconfig                          |  2 +-
>  samples/watch_queue/watch_test.c         |  2 +-
>  security/integrity/ima/ima_mok.c         |  3 +--
>  security/keys/Kconfig                    |  8 ++++----
>  security/keys/big_key.c                  |  9 +++------
>  security/keys/key.c                      |  2 ++
>  security/keys/keyctl.c                   |  2 +-
>  security/keys/keyctl_pkey.c              |  2 --
>  security/keys/keyring.c                  | 10 +++++-----
>  20 files changed, 45 insertions(+), 46 deletions(-)
> 
> 
> 
