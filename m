Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 807BF7CB360
	for <lists+keyrings@lfdr.de>; Mon, 16 Oct 2023 21:37:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232055AbjJPThN (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Mon, 16 Oct 2023 15:37:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229848AbjJPThM (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Mon, 16 Oct 2023 15:37:12 -0400
Received: from mail-oo1-xc32.google.com (mail-oo1-xc32.google.com [IPv6:2607:f8b0:4864:20::c32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C431BAB;
        Mon, 16 Oct 2023 12:37:09 -0700 (PDT)
Received: by mail-oo1-xc32.google.com with SMTP id 006d021491bc7-57b635e3fd9so2471339eaf.3;
        Mon, 16 Oct 2023 12:37:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697485029; x=1698089829; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6paLYXnAOeT4tceyUbnVYWZhYebDk9ZkaF8qziV46gI=;
        b=D9fY2qXBh5rY4rWj1hDfYnYdQwHDCFpqbT46Erk6nwdVaCUBW/1rfkD7yWPKdr062A
         +uBlyHtx+BG4fybriSnSqKiiK6/DreatAkt6ySIjlYiXtnfnxWE00OWEJLnRdYGb3DoD
         qXsXsxeOpqCqbFYQOXoI0wRJsOj2Iiqnh4jwqaY9zaoOEGJNjpR4KrMjT6kJjcArj+tr
         wDKFa4akf3C91dQVUuRTq5KIIbAkFca2I+ifwxNM59kQE1PDya+/YKDMWqGCgg3qXAgM
         27L/G/A1GLADzJnetvCro0P9bA3BSIcmKQdiWRhCKpEp3gZgKUN0IbEnoEqczVoBE8DY
         ImjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697485029; x=1698089829;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6paLYXnAOeT4tceyUbnVYWZhYebDk9ZkaF8qziV46gI=;
        b=RgTZV3YTU7Ehlwr8LJBooAZkzicWmPo05TrDSzSZP3L4ec2KGPqimd+HAKsP0v+ZOn
         IZzPjXd9oXIZtwhYy/AySrZ6wW4fHDOYR/vHSPxcr+m0KwHzvrEDoqDFeY+dcGYTFDHA
         Dw0qIHkx6SM3XZ8DwC84SmrQ/rD3nso5o7OnPMava2pW1VoTkIe9w8pbWMExsYvV0hOG
         CN4h2meouGxFl7YDy8bKY0VB0pJhxd+a7VqdW8pr87JUhKJZNx/BqetZ9mR0bOg5XXrB
         4aFbnCjFAi7TwU4yCIXUmSvLEjUqyWKJge8cvOwT1m0ZQNcvTIV+CVAaXn9qUjKCQyOW
         j2Eg==
X-Gm-Message-State: AOJu0YzTAp/ZBPZkpCvk9LSuUTG989sB1XIxRRZwSbga+N29rf23e8xh
        U3S3NhEKo9B015eNy9zrba72+JabLdY=
X-Google-Smtp-Source: AGHT+IFc9rNzmOqhTCFE6BUhJ6YD93zHnSgXPyXNU/RzuxqQUpqznmaJdYgREjmKVe2h3pzdw9dtQQ==
X-Received: by 2002:a05:6820:1503:b0:57e:1c6a:d551 with SMTP id ay3-20020a056820150300b0057e1c6ad551mr23130oob.3.1697485029043;
        Mon, 16 Oct 2023 12:37:09 -0700 (PDT)
Received: from [172.16.49.130] (cpe-70-114-247-242.austin.res.rr.com. [70.114.247.242])
        by smtp.googlemail.com with ESMTPSA id e18-20020a056820061200b0057b722edbd5sm1201979oow.1.2023.10.16.12.37.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Oct 2023 12:37:08 -0700 (PDT)
Message-ID: <99eb29ee-3ebd-443e-ac33-32a8e4676afe@gmail.com>
Date:   Mon, 16 Oct 2023 14:37:07 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] KEYS: asymmetric: Fix sign/verify on pkcs1pad without a
 hash
Content-Language: en-US
To:     Herbert Xu <herbert@gondor.apana.org.au>
Cc:     Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        James Prestwood <prestwoj@gmail.com>,
        David Howells <dhowells@redhat.com>, keyrings@vger.kernel.org,
        Jarkko Sakkinen <jarkko@kernel.org>
References: <ab4d8025-a4cc-48c6-a6f0-1139e942e1db@gmail.com>
 <ZSc/9nUuF/d24iO6@gondor.apana.org.au> <ZSda3l7asdCr06kA@gondor.apana.org.au>
 <be96d2e7-592e-467e-9ad2-3f69a69cf844@gmail.com>
 <ZSdn29PDrs6hzjV9@gondor.apana.org.au>
 <1d22cd18-bc2a-4273-8087-e74030fbf373@gmail.com>
 <ZSgChGwi1r9CILPI@gondor.apana.org.au>
 <c917020d-0cb0-4289-a2e3-d9a0fa28151a@gmail.com>
 <ZSz12KHsfJmZGjKz@gondor.apana.org.au>
From:   Denis Kenzior <denkenz@gmail.com>
In-Reply-To: <ZSz12KHsfJmZGjKz@gondor.apana.org.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Hi Herbert,

On 10/16/23 03:35, Herbert Xu wrote:
> On Thu, Oct 12, 2023 at 10:08:46AM -0500, Denis Kenzior wrote:
>>
>> Looks like something took out the ability to run sign/verify without a hash
>> on asymmetric keys.
> 
> Indeed this is what it was.  Please try this patch.  Thanks!
> 

I can confirm that this fix does make all unit tests pass again.  Feel free to add:

Tested-by: Denis Kenzior <denkenz@gmail.com>

Regards,
-Denis
