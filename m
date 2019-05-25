Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 16DBB2A345
	for <lists+keyrings@lfdr.de>; Sat, 25 May 2019 09:04:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726702AbfEYHEI (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Sat, 25 May 2019 03:04:08 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:36021 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726145AbfEYHEH (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Sat, 25 May 2019 03:04:07 -0400
Received: by mail-wm1-f66.google.com with SMTP id v22so3885210wml.1;
        Sat, 25 May 2019 00:04:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=kWX+OUUqcyi03f+v1lZPgwPHwQ/bqqsdh7duztuN6mA=;
        b=N/pznNj/05VqqqSIBQYaQQOixwKnGQQOGi0anJ2tE2CXrTRFZwTd3nkzJiRy13Fq/Z
         lEw3+SW0m+XL+mrvKRZVdRmbfvbYMdm+5iutJfrbM0JJaAIAes/Bw74oA2qBjV/L7dYn
         yAjSANJ+kQLGMDaVUWyYl87gV02JGgLMc8Os9UGpTYo6v92rly8mmmyDssp+aigRIGoa
         fIznu1lL4a+IbMv+rYjJ9fNnMlXQmThU8NhIbzzjaFgiQrSTG2o+RXVzjLDicZ7MA3/9
         kSlIRkhh4dGpB4CV+1knGkgqN5/yQCwK1PUYYzsYHjIOZnbFt16EbJ4Jq/ec4YXkLwKo
         l4GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=kWX+OUUqcyi03f+v1lZPgwPHwQ/bqqsdh7duztuN6mA=;
        b=Xdf8CQMQ351b9V2uR0zflk5o26XrzJ7S7T4ttOkqmcSR81U0wk8nlCCdN5YH02nnWn
         v4PIToQD3DAvBvcubOwfM8vQ/fdWjFzzeNORwhN+fp3nNPE9O3vr0VFTdOK3UNsy6ECk
         1kPhB4JDmGehgL1k+0izjZX7/JLt3S3NGDLwBq69AnA7f+RgjUb0d9umEn4g6nzu9u+A
         YYhFeMR/vPNE4AyX/yGKXdJ5DkKjcUelJT4ZcsMij1FqZCRpbS5ehaGOCiPHdp78gs3o
         NP0CcQxA6lWKFRXM9cv8kfYFQ4MzMrrElZt5k0wC75gALV2/5FgYrxApi5AKK63S7V1C
         PG5Q==
X-Gm-Message-State: APjAAAUE4pfbufTwTDbkY3nTDKSBsyTdbX2DVopZPtOCP9EtVZl9QHba
        Ph+OqW+CcgGtZjA8ZX+Ehlw=
X-Google-Smtp-Source: APXvYqwG4rbkCjL3f62lCmqSBdQlhxHZg2VnvoSqRe53Xd9AUZisyLgi2roYlnWpx/Ufo4ntnVT9mQ==
X-Received: by 2002:a1c:9602:: with SMTP id y2mr10738166wmd.115.1558767845384;
        Sat, 25 May 2019 00:04:05 -0700 (PDT)
Received: from [192.168.8.100] (89-24-56-202.nat.epc.tmcz.cz. [89.24.56.202])
        by smtp.gmail.com with ESMTPSA id h6sm4131631wrm.47.2019.05.25.00.04.03
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 25 May 2019 00:04:04 -0700 (PDT)
Subject: Re: [PATCH] crypto: af_alg - implement keyring support
To:     Eric Biggers <ebiggers@kernel.org>,
        Ondrej Mosnacek <omosnace@redhat.com>
Cc:     linux-crypto@vger.kernel.org,
        Herbert Xu <herbert@gondor.apana.org.au>,
        keyrings@vger.kernel.org, David Howells <dhowells@redhat.com>,
        Stephan Mueller <smueller@chronox.de>,
        Milan Broz <gmazyland@gmail.com>,
        Ondrej Kozina <okozina@redhat.com>,
        Daniel Zatovic <dzatovic@redhat.com>
References: <20190521100034.9651-1-omosnace@redhat.com>
 <20190525031028.GA18491@sol.localdomain>
From:   Milan Broz <gmazyland@gmail.com>
Openpgp: preference=signencrypt
Message-ID: <217993a6-529a-804a-3212-588fb1ccd8e0@gmail.com>
Date:   Sat, 25 May 2019 09:04:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190525031028.GA18491@sol.localdomain>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On 25/05/2019 05:10, Eric Biggers wrote:
> On Tue, May 21, 2019 at 12:00:34PM +0200, Ondrej Mosnacek wrote:
>> This patch adds new socket options to AF_ALG that allow setting key from
>> kernel keyring. For simplicity, each keyring key type (logon, user,
>> trusted, encrypted) has its own socket option name and the value is just
>> the key description string that identifies the key to be used. The key
>> description doesn't need to be NULL-terminated, but bytes after the
>> first zero byte are ignored.
>>
>> Note that this patch also adds three socket option names that are
>> already defined and used in libkcapi [1], but have never been added to
>> the kernel...
>>
>> Tested via libkcapi with keyring patches [2] applied (user and logon key
>> types only).
>>
>> [1] https://github.com/smuellerDD/libkcapi
>> [2] https://github.com/WOnder93/libkcapi/compare/f283458...1fb501c
>>
>> Signed-off-by: Ondrej Mosnacek <omosnace@redhat.com>
> 
> The "interesting" thing about this is that given a key to which you have only
> Search permission, you can request plaintext-ciphertext pairs with it using any
> algorithm from the kernel's crypto API.  So if there are any really broken
> algorithms and they happen to take the correct length key, you can effectively
> read the key.  That's true even if you don't have Read permission on the key
> and/or the key is of the "logon" type which doesn't have a ->read() method.

Yes, also if non-root user has access to some key in keyring, he can effectively
use it from another context (for example simulate dmcrypt and decrypt an image
of another user). But this is about policy of storing keys in keyrings.

> Since this is already also true for dm-crypt and maybe some other features in
> the kernel, and there will be a new API for fscrypt that doesn't rely on "logon"
> keys with Search access thus avoiding this problem and many others
> (https://patchwork.kernel.org/cover/10951999/), I don't really care much whether
> this patch is applied.  But I wonder whether this is something you've actually
> considered, and what security properties you think you are achieving by using
> the Linux keyrings.

We use what kernel provides now. If there is a better way, we can switch to it.

The reason for using keyring for dmcrypt was to avoid sending key in plain
in every device-mapper ioctl structure. We use process keyring here, so
the key in keyring actually disappears after the setup utility finished its job.

The patch for crypto API is needed mainly for the "trusted" key type, that we
would like to support in dmcrypt as well. For integration in LUKS we need
to somehow validate that the key for particular dm-crypt device is valid.
If we cannot calculate a key digest directly (as LUKS does), we need to provide
some operation with the key from userspace (like HMAC) and compare known output.

This was the main reason for this patch. But I can imagine a lot of other
use cases where key in keyring actually simplifies things.

Milan
