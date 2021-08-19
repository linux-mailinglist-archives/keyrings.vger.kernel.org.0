Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 359EF3F1E74
	for <lists+keyrings@lfdr.de>; Thu, 19 Aug 2021 18:56:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229981AbhHSQ47 (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 19 Aug 2021 12:56:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229548AbhHSQ47 (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 19 Aug 2021 12:56:59 -0400
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com [IPv6:2607:f8b0:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB642C061575;
        Thu, 19 Aug 2021 09:56:22 -0700 (PDT)
Received: by mail-oi1-x229.google.com with SMTP id t35so9322768oiw.9;
        Thu, 19 Aug 2021 09:56:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=i2gbj7G7HBNjxMMAYhYLQe8DyR1uM3Beytnzkyrqm2w=;
        b=E5ZdojLIBb5f/jbn9oD7NZCyiGEfL7kcevdndmyg+JVvIzMXCTRZRDV+8GEEMk07Eg
         AFQGdc6wXOn0uaxcbwVXkWbVCntAzjNmFCi0iXWW4kINejhR2YkQCl0AS5kgb4GQbDuE
         4ET12KfRmXTgJ/XyKmjSQVR1EwUHYT108DIQeWgEUnTHlpuzF+uDfCWOmhOcTj9Z1sB7
         JIWhWtV219Jbs2z15DcUsaKVO0t6DfARJaWqon5RvMw1FI3yu7FheCxvCupt9GcbBMes
         ZjIeBTQPOg9CLivabIZ3evjNFtzdN14TXTuZ/HoPpxkHXE+F6HeV6mPiKfr3Mm+sxU0+
         a9gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=i2gbj7G7HBNjxMMAYhYLQe8DyR1uM3Beytnzkyrqm2w=;
        b=t46NE39WdyM58T/NZLZg2HJ3C0ydzXi5Fx8wUgARXG0NldBbWvCOO0BZW9dTsOhzPw
         VDW+TJO6z2FFSq4Mppj2iK00cwOzAvs7owMvCywRBq4vDnwTq/q9WMH0j2wdJwL2jzSb
         0sJ7FG0hq1wFfUS8ABlmVkSDn/ckoMqM1A6bOpagEQMG/GvwR3FxiaUN10k5fwIgI9Ki
         Ma1Qup8jFhkNXRZXLOgIQPIftsk7QRjLkVuF2ICLrgEQyFK8fZT6hrwCKC8ZKwTV6f/D
         2Ic6xggr22AGga9DsStMzIWEVvcoiE4JcoTcpdpWV2rTBvONHSZivZjQ8u1ec1+YZNpG
         d1FA==
X-Gm-Message-State: AOAM533B9uTzUxXTk6Uq5yBYFmoip3tWaSsCvp6j0Yy1sJv4F7McaDJP
        3KnVJK9E196VRqcSBA//fmxPjcscPts=
X-Google-Smtp-Source: ABdhPJzmOEAQn8TFcTvrsrE8s6/LmYlIPVWuFWUq5v8j57GKYajgcZdfUybMb5Bxtd8g16QtLbudLg==
X-Received: by 2002:a05:6808:220c:: with SMTP id bd12mr3485319oib.157.1629392182091;
        Thu, 19 Aug 2021 09:56:22 -0700 (PDT)
Received: from [10.0.2.15] (cpe-70-114-247-242.austin.res.rr.com. [70.114.247.242])
        by smtp.googlemail.com with ESMTPSA id y138sm758744oie.22.2021.08.19.09.56.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Aug 2021 09:56:21 -0700 (PDT)
Subject: Re: [PATCH 0/2] crypto: remove MD4 generic shash
To:     Steve French <smfrench@gmail.com>
Cc:     Ard Biesheuvel <ardb@kernel.org>,
        Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Eric Biggers <ebiggers@kernel.org>,
        ronnie sahlberg <ronniesahlberg@gmail.com>,
        linux-cifs <linux-cifs@vger.kernel.org>,
        Steve French <sfrench@samba.org>,
        David Howells <dhowells@redhat.com>, keyrings@vger.kernel.org
References: <20210818144617.110061-1-ardb@kernel.org>
 <946591db-36aa-23db-a5c4-808546eab762@gmail.com>
 <CAMj1kXEjHojAZ0_DPkogHAbmS6XAOFN3t8-4VB0+zN8ruTPVCg@mail.gmail.com>
 <24606605-71ae-f918-b71a-480be7d68e43@gmail.com>
 <CAMj1kXEO8PwLfT8uAYgeFF7T3TznWz4E=R1JArvCdKXk8qiAMQ@mail.gmail.com>
 <e2462d50-57e9-b7d7-bc07-0f365a01d215@gmail.com>
 <CAH2r5muUQT5EX0Z=9MFr=QHGaajF5unwnDwib8CN0hbKP7J4Rw@mail.gmail.com>
From:   Denis Kenzior <denkenz@gmail.com>
Message-ID: <a2934f93-e4cf-4cd1-c9c4-fa68dbae9277@gmail.com>
Date:   Thu, 19 Aug 2021 11:56:20 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAH2r5muUQT5EX0Z=9MFr=QHGaajF5unwnDwib8CN0hbKP7J4Rw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Hi Steve,

>> But the answer is yes.  Both PEAP and TTLS use MSCHAP or MSCHAPv2 in some form.
>>    These are commonly used for Username/Password based WPA(2|3)-Enterprise
>> authentication.  Think 'eduroam' for example.
> 
> Can you give some background here?  IIRC MS-CHAPv2 is much worse than
> the NTLMSSP case

What background are you looking for?  iwd [0] is a wifi management daemon, so we 
implement various EAP [1] and wifi authentication protocols.

> in cifs.ko (where RC4/MD5 is used narrowly).   Doesn't MS-CHAPv2 depend on DES?
> 

You are quite correct.  MSCHAPv2 also uses DES for generating the responses. 
EAP with TTLS+MSCHAPv2 and PEAP+MSCHAPv2 are two of the most deployed variants 
of WPA-Enterprise authentication using Username + Password.

Deprecating MD4, MD5, SHA1 or DES would be quite disruptive for us.  We are 
using these through AF_ALG userspace API, so if they're removed, some 
combination of kernel + iwd version will break.  We went through this with ARC4, 
and while that was justified, I don't think the same justification exists for MD4.

[0] https://git.kernel.org/pub/scm/network/wireless/iwd.git
[1] https://en.wikipedia.org/wiki/Extensible_Authentication_Protocol

Regards,
-Denis
