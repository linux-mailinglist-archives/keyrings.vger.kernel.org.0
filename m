Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA6E32D718E
	for <lists+keyrings@lfdr.de>; Fri, 11 Dec 2020 09:20:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405516AbgLKITl (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Fri, 11 Dec 2020 03:19:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405451AbgLKITE (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Fri, 11 Dec 2020 03:19:04 -0500
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BACCC0613CF;
        Fri, 11 Dec 2020 00:18:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
         s=20161220; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=Q/1c6zPVM2kb71FCgSBD6/BH9IEEPXCHItl80hWLcm0=; b=u/yNH50V0yU1iD8Syex+KFHGGA
        y0LTrZM6Bv1aX/OLuM9ZrAIceytMk7Qy8++YBOjHUyCjZO8/AOU2vmdSzYDuI/XbTKaU1R9StBqiw
        Y1k9eMua+bF4q40NniX6vk3DKVDCZLzGboS+52kpRzqFljtyzD59mcsjRm69LUOcHa6thJceOcqq0
        XioQ2+Awe9qJypEOhbqQBW6OOSAriepEoy/WCLjBAOKhRqhV/HorrsQHP9hbTenfflOxgxRSqi6Yu
        GcA+bh+KyJk5c4v0w91QmIbSpqLybY+aV+gRsHgC8DzRvLzWSv1LlIUv+dWqko9BhzgqFR+cYKTNS
        ch7+3Yqw==;
Received: from 83-245-197-237.elisa-laajakaista.fi ([83.245.197.237] helo=kapsi.fi)
        by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <jarkko.sakkinen@iki.fi>)
        id 1kndcl-0006qP-07; Fri, 11 Dec 2020 10:17:59 +0200
Date:   Fri, 11 Dec 2020 10:17:57 +0200
From:   Jarkko Sakkinen <jarkko.sakkinen@iki.fi>
To:     David Howells <dhowells@redhat.com>
Cc:     Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
        "Alexander A. Klimov" <grandmaster@al2klimov.de>,
        Petko Manolov <petkan@mip-labs.com>,
        "Serge E. Hallyn" <serge@hallyn.com>, linux-kernel@vger.kernel.org,
        YueHaibing <yuehaibing@huawei.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Jann Horn <jannh@google.com>, linux-crypto@vger.kernel.org,
        Jarkko Sakkinen <jarkko@kernel.org>,
        Ben Boeckel <mathstuf@gmail.com>, keyrings@vger.kernel.org,
        Gabriel Krisman Bertazi <krisman@collabora.com>,
        linux-security-module@vger.kernel.org,
        Randy Dunlap <rdunlap@infradead.org>,
        Mimi Zohar <zohar@linux.vnet.ibm.com>,
        Tom Rix <trix@redhat.com>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Alex Shi <alex.shi@linux.alibaba.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        James Morris <jmorris@namei.org>,
        Denis Efremov <efremov@linux.com>,
        =?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@linux.microsoft.com>,
        David Woodhouse <dwmw2@infradead.org>,
        "David S. Miller" <davem@davemloft.net>,
        Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
Subject: Re: [PATCH 00/18] keys: Miscellaneous fixes
Message-ID: <20201211081757.GA3789@kapsi.fi>
References: <160751606428.1238376.14935502103503420781.stgit@warthog.procyon.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <160751606428.1238376.14935502103503420781.stgit@warthog.procyon.org.uk>
X-SA-Exim-Connect-IP: 83.245.197.237
X-SA-Exim-Mail-From: jarkko.sakkinen@iki.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Wed, Dec 09, 2020 at 12:14:24PM +0000, David Howells wrote:
> 
> Hi Jarkko,
> 
> I've extended my collection of minor keyrings fixes for the next merge
> window.  Anything else I should add (or anything I should drop)?

Looks good to me. I dropped the keys fixes that I had previously in
my tree that I saw in yours.


/Jarkko

> 
> The patches can be found on the following branch:
> 
> 	https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git/log/?h=keys-fixes
> 
> David
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
