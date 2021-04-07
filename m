Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B38D53561F7
	for <lists+keyrings@lfdr.de>; Wed,  7 Apr 2021 05:29:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348376AbhDGDaA (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 6 Apr 2021 23:30:00 -0400
Received: from out30-42.freemail.mail.aliyun.com ([115.124.30.42]:54127 "EHLO
        out30-42.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1348385AbhDGD3e (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Tue, 6 Apr 2021 23:29:34 -0400
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R841e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04394;MF=tianjia.zhang@linux.alibaba.com;NM=1;PH=DS;RN=20;SR=0;TI=SMTPD_---0UUlA.s5_1617766161;
Received: from B-455UMD6M-2027.local(mailfrom:tianjia.zhang@linux.alibaba.com fp:SMTPD_---0UUlA.s5_1617766161)
          by smtp.aliyun-inc.com(127.0.0.1);
          Wed, 07 Apr 2021 11:29:22 +0800
Subject: Re: [PATCH v2 0/2] support sign module with SM2-with-SM3 algorithm
To:     David Howells <dhowells@redhat.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        David Woodhouse <dwmw2@infradead.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Valentin Schneider <valentin.schneider@arm.com>,
        Nick Terrell <terrelln@fb.com>, KP Singh <kpsingh@google.com>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Vlastimil Babka <vbabka@suse.cz>, keyrings@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-crypto@vger.kernel.org,
        Jia Zhang <zhang.jia@linux.alibaba.com>
References: <20210324121525.16062-1-tianjia.zhang@linux.alibaba.com>
From:   Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
Message-ID: <aef1e8b9-c378-9f2e-881c-b81c4ecad028@linux.alibaba.com>
Date:   Wed, 7 Apr 2021 11:29:20 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210324121525.16062-1-tianjia.zhang@linux.alibaba.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

ping.

Thanks,
Tianjia

On 3/24/21 8:15 PM, Tianjia Zhang wrote:
> The kernel module signature supports the option to use the SM3 secure
> hash (OSCCA GM/T 0004-2012 SM3). SM2 and SM3 always appear in pairs.
> The former is used for signing and the latter is used for hash
> calculation.
> 
> To sign a kernel module, first, prepare openssl 3.0.0 alpha6 and a
> configuration file openssl.cnf with the following content:
> 
>    [ req ]
>    default_bits = 2048
>    distinguished_name = req_distinguished_name
>    prompt = no
>    string_mask = utf8only
>    x509_extensions = v3_req
> 
>    [ req_distinguished_name ]
>    C = CN
>    ST = HangZhou
>    L = foo
>    O = Test
>    OU = Test
>    CN = Test key
>    emailAddress = test@foo.com
> 
>    [ v3_req ]
>    basicConstraints=critical,CA:FALSE
>    keyUsage=digitalSignature
>    subjectKeyIdentifier=hash
>    authorityKeyIdentifier=keyid:always
> 
> Then we can use the following method to sign module with SM2-with-SM3
> algorithm combination:
> 
>    # generate CA key and self-signed CA certificate
>    openssl ecparam -genkey -name SM2 -text -out ca.key
>    openssl req -new -x509 -days 3650 -key ca.key \
>        -sm3 -sigopt "distid:1234567812345678" \
>        -subj "/O=testCA/OU=testCA/CN=testCA/emailAddress=ca@foo.com" \
>        -config openssl.cnf -out ca.crt
> 
>    # generate SM2 private key and sign request
>    openssl ecparam -genkey -name SM2 -text -out private.pem
>    openssl req -new -key private.pem -config openssl.cnf \
>        -sm3 -sigopt "distid:1234567812345678" -out csr.pem
> 
>    # generate SM2-with-SM3 certificate signed by CA
>    openssl x509 -req -days 3650 -sm3 -in csr.pem \
>        -sigopt "distid:1234567812345678" \
>        -vfyopt "distid:1234567812345678" \
>        -CA ca.crt -CAkey ca.key -CAcreateserial \
>        -extfile openssl.cnf -extensions v3_req \
>        -out cert.pem
> 
>    # sign module with SM2-with-SM3 algorithm
>    sign-file sm3 private.pem cert.pem test.ko test.ko.signed
> 
> At this point, we should built the CA certificate into the kernel, and
> then we can load the SM2-with-SM3 signed module normally.
> 
> ---
> v2 change:
>    - split one patch into twos.
>    - richer commit log.
> 
> Tianjia Zhang (2):
>    pkcs7: make parser enable SM2 and SM3 algorithms combination
>    init/Kconfig: support sign module with SM2-with-SM3 algorithm
> 
>   Documentation/admin-guide/module-signing.rst | 5 +++--
>   crypto/asymmetric_keys/pkcs7_parser.c        | 7 +++++++
>   init/Kconfig                                 | 5 +++++
>   3 files changed, 15 insertions(+), 2 deletions(-)
> 
