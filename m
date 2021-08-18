Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C80B3F0719
	for <lists+keyrings@lfdr.de>; Wed, 18 Aug 2021 16:51:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239494AbhHROwF (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 18 Aug 2021 10:52:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239503AbhHROwC (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 18 Aug 2021 10:52:02 -0400
Received: from mail-oo1-xc2a.google.com (mail-oo1-xc2a.google.com [IPv6:2607:f8b0:4864:20::c2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B11AC061764;
        Wed, 18 Aug 2021 07:51:27 -0700 (PDT)
Received: by mail-oo1-xc2a.google.com with SMTP id s21-20020a4ae5550000b02902667598672bso755269oot.12;
        Wed, 18 Aug 2021 07:51:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=+bbFXXS4AUH+4Uo350h85t8IAXg3cWG9O/P4kXCHnNA=;
        b=hYYGxJWm/IFY+gxyVvdM23NVgRHzkQ/bDRgxNK/XhL02u1AFg3KIXKvv3wdolWhbmH
         HO/3tAg+XL7OQxKcAl1JmXs5WhW+QXjwffM/NoVQcc+XpH0v8MVvqBgTiWJ+z6vIfNfU
         89r9L49QGPZA/suDi5xMmJkPUWHY2OaJRK+ukJQc9vDkXRktx/ww7uSIyOoK4rbot37V
         Bb+bhFN+TN1wF3C4MwzaOWJoH+9d7A/dnM3krlEr9g7Bjn3k0bQpxHyCAeeSYKrroFRu
         P/yUSsFsBztoscvZLu0BRW6kQMHBCKBlAyaESPcwBDpdgzqdwQylWCKk2ciFbEfL6kA7
         7NVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=+bbFXXS4AUH+4Uo350h85t8IAXg3cWG9O/P4kXCHnNA=;
        b=GE2K4i0YxIsf41QX5nUxunpr3h56tHnLMB081um2zuqfnDMbRUabQoetG5/XBz97PX
         XVgEKcF2aTUL2UU2xJrb5JLDw0rXyQ5plZ9BiuME6GWSLU5Xjj+oEMDO5yLCDpFPYQfU
         tijlaWA+nfwPrXMAZ2Z406xJ7N0l+r65a4bLmWY3ft2GfE4i8yOj0kldG3X7PjEYuf1y
         iWYfKSx9eGyPy6G/AQ+OAE37LaDgFHKAH7HREqYTUYOpn+YzN0aKV1dc0gujOKm7ntJp
         eTVghy2+T00P4eyT8X+4A5xfl7wBjPdDFY7EDHTFX8O+oRJZKPRy5XKGrwjU7KCJQcG9
         Kkjw==
X-Gm-Message-State: AOAM532FA0X+1IOv+oJ+aWxFNAITbmqK1ieDMWC/5EWuy0WWFcksnFsk
        8ZvAoM55Z+QRNRvHpjRVsdn7/9FmBIs=
X-Google-Smtp-Source: ABdhPJxKz2DnEM92PxyX6D0oqH8ZYO+19X/A9Yv47aQfUfE3gUsuOAWX6JjM75KVnkFXL5cJ2QhDhw==
X-Received: by 2002:a4a:3956:: with SMTP id x22mr7090558oog.77.1629298285617;
        Wed, 18 Aug 2021 07:51:25 -0700 (PDT)
Received: from [10.0.2.15] (cpe-70-114-247-242.austin.res.rr.com. [70.114.247.242])
        by smtp.googlemail.com with ESMTPSA id u15sm56689oiu.43.2021.08.18.07.51.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Aug 2021 07:51:25 -0700 (PDT)
Subject: Re: [PATCH 0/2] crypto: remove MD4 generic shash
To:     Ard Biesheuvel <ardb@kernel.org>, linux-crypto@vger.kernel.org
Cc:     herbert@gondor.apana.org.au, Eric Biggers <ebiggers@kernel.org>,
        ronnie sahlberg <ronniesahlberg@gmail.com>,
        linux-cifs <linux-cifs@vger.kernel.org>,
        Steve French <sfrench@samba.org>,
        David Howells <dhowells@redhat.com>, keyrings@vger.kernel.org
References: <20210818144617.110061-1-ardb@kernel.org>
From:   Denis Kenzior <denkenz@gmail.com>
Message-ID: <946591db-36aa-23db-a5c4-808546eab762@gmail.com>
Date:   Wed, 18 Aug 2021 09:51:24 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210818144617.110061-1-ardb@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Hi Ard,

On 8/18/21 9:46 AM, Ard Biesheuvel wrote:
> As discussed on the list [0], MD4 is still being relied upon by the CIFS
> driver, even though successful attacks on MD4 are as old as Linux
> itself.
> 
> So let's move the code into the CIFS driver, and remove it from the
> crypto API so that it is no longer exposed to other subsystems or to
> user space via AF_ALG.
> 

Can we please stop removing algorithms from AF_ALG?  The previous ARC4 removal 
already caused some headaches [0].  Please note that iwd does use MD4 for MSCHAP 
and MSCHAPv2 based 802.1X authentication.

Regards,
-Denis

[0] https://bugs.launchpad.net/ubuntu/+source/iwd/+bug/1938650
