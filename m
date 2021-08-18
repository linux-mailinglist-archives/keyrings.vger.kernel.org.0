Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E9483F0E16
	for <lists+keyrings@lfdr.de>; Thu, 19 Aug 2021 00:22:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234436AbhHRWWj (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 18 Aug 2021 18:22:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234106AbhHRWWj (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 18 Aug 2021 18:22:39 -0400
Received: from mail-oo1-xc2d.google.com (mail-oo1-xc2d.google.com [IPv6:2607:f8b0:4864:20::c2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E815AC061764;
        Wed, 18 Aug 2021 15:22:03 -0700 (PDT)
Received: by mail-oo1-xc2d.google.com with SMTP id f33-20020a4a89240000b029027c19426fbeso1185813ooi.8;
        Wed, 18 Aug 2021 15:22:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=446XeKN6la3Gf4IiVbqvIQKczNYKP9CofBBzjjzfNpI=;
        b=GzhHD86vkveFp8RxPTEAxpZP/lNR+IzZtKGSMOFrGQTkF/DzmS/cLeGVwKJz/ATezA
         c722T8dw+f5fIvco/F9Ixe4Rl+8vm3d3pKoCcyXtcs+06ODYurNbXvKr9lRYMZYY8+5K
         xJewTH/X0jyPfBLrq42kH7VGMHjcNew+t8wMVwtSBJJnn2yvHbhVLmGUuDyewCs671Kb
         nYkkLRh+GyWYe7uPJvNwztl5sBe1t9NPpQU90ebx5iEnHlRx1eL+zMBCf/rVO5xTK0FY
         BbUW0AIdT46XHMXFcuKtPVMFycLPDhImaUb6fnbd5oWy+o0fJdfdoyIvU3Uz6QYqSO7L
         Zz1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=446XeKN6la3Gf4IiVbqvIQKczNYKP9CofBBzjjzfNpI=;
        b=sMnbKUKrtuT9qMa57hIRA0+DE64+hZ/T3toT7BWrUoP/UKjmJW9l5Q/TmyNBOIVqow
         FsMkAFxb8+dQ87uRUX4BcwM/D2d3VIWu7r+JXJ1hh/fZP+2CwgmBtpUEYBnPyKKSQLU9
         FxD6Wn4YsGu2YNB522+KuoqoVyFDj7StKfmddjil3YoOq64v2N5SnBUnW5Zy5l2z018x
         jHxIwo9YkpmaSAvxppWU82QC8TnwPOTcLqxShSpqI+V3sfRFsbcRmRD5EqMO48QOhVvy
         W56TYDD/368X4w8zS+Ogn0F9vy7avGOf8luM1roBKhkjUDpDpfozNUHgPvPOXtQgnlRS
         HTJg==
X-Gm-Message-State: AOAM531i6YQcyuI+0OCUY6jItA63EVK2fKT5tv9BfowSIeautkUKiqel
        7blD9h4W1IyGOkeDwY0uQB2Ptstpz+A=
X-Google-Smtp-Source: ABdhPJwS219SLQa7OsG5O4XnPmF2FdvwONKuxV1Fyh0hvLt5eBFqhy1G4wD4jf3S1HMC8q1UuEBi1A==
X-Received: by 2002:a4a:e907:: with SMTP id z7mr8637974ood.20.1629325323221;
        Wed, 18 Aug 2021 15:22:03 -0700 (PDT)
Received: from [10.0.2.15] (cpe-70-114-247-242.austin.res.rr.com. [70.114.247.242])
        by smtp.googlemail.com with ESMTPSA id r2sm315225oig.1.2021.08.18.15.22.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Aug 2021 15:22:02 -0700 (PDT)
Subject: Re: [PATCH 0/2] crypto: remove MD4 generic shash
To:     Ard Biesheuvel <ardb@kernel.org>
Cc:     Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
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
From:   Denis Kenzior <denkenz@gmail.com>
Message-ID: <e2462d50-57e9-b7d7-bc07-0f365a01d215@gmail.com>
Date:   Wed, 18 Aug 2021 17:22:00 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAMj1kXEO8PwLfT8uAYgeFF7T3TznWz4E=R1JArvCdKXk8qiAMQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Hi Ard,

>> That is not something that iwd has any control over though?  We have to support
>> it for as long as there are  organizations using TTLS + MD5 or PEAPv0.  There

Ah, my brain said MSCHAP but my fingers typed MD5.

>> are still surprisingly many today.
>>
> 
> Does that code rely on MD4 as well?
> 

But the answer is yes.  Both PEAP and TTLS use MSCHAP or MSCHAPv2 in some form. 
  These are commonly used for Username/Password based WPA(2|3)-Enterprise 
authentication.  Think 'eduroam' for example.

MD4 is used to hash the plaintext password, but the hash is sent inside a TLS 
tunnel, so there's really no immediate crypto weakness concern?  At least 
there's not a replacement on the horizon as far as I know.  EAP-PWD has its own 
problems and I doubt certificate based authentication will overtake 
username/password any time soon.

Regards,
-Denis
