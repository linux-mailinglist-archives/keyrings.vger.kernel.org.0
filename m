Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E0DA3F08FB
	for <lists+keyrings@lfdr.de>; Wed, 18 Aug 2021 18:23:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231223AbhHRQYM (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 18 Aug 2021 12:24:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229454AbhHRQYK (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 18 Aug 2021 12:24:10 -0400
Received: from mail-oo1-xc31.google.com (mail-oo1-xc31.google.com [IPv6:2607:f8b0:4864:20::c31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09218C061764;
        Wed, 18 Aug 2021 09:23:36 -0700 (PDT)
Received: by mail-oo1-xc31.google.com with SMTP id w13-20020a4ad02d0000b029028b14dc4d2dso860169oor.6;
        Wed, 18 Aug 2021 09:23:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=gwm8rfWs4pbHZgYeKQ0HHqBYYNUImXQM0xoxK3JFpm8=;
        b=L6XAtODTnyO324V7JB0avpD7yzceJVraqoDh8j0lj+DjUjOH10TmVzdYEwbjmrHSSQ
         J6kj5xeoCShEHVFbWIczLAIc38d8RlpqqoLCCl8kCP8XAMS3e+BoIqgb+1EoXAL71NN+
         /AlbrdWnrKAhgGpXoQBLNLC/fP6O89vurEG/CtZWTsW2ENF4yDUQH1PRS9NSBTkY7lTL
         eOuCWp3j2Y6Fg2mtENAOLpBBiIz4kKrKGyHRRe7t7ci6ELNcDmuGelwtDColqz8JCqlx
         zA90aAnbIBOWwc8zNp/2gYCyd/fyJ+4AkUq+u/Xuk/P5N19fWWXy+ilsIFOvVuwqO4oA
         KviA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=gwm8rfWs4pbHZgYeKQ0HHqBYYNUImXQM0xoxK3JFpm8=;
        b=R5ZP3tYr630ORfjVfeuRR8qtItG5uKc18CPm8B1xiXrGg6bHm8zdSLmNasxHpOPc6H
         z04HUU07CeCa42BpNo+cNmvlNpCa04IStsgdmj6pJUzmOHflhJmPwAyBuP8xjb44ZLbe
         g12YtNcppsv8uTgdyKAcozVL3fuljNHFYJpUOBBujmiUHyTgX/FHYqRgDdrUurTnYecQ
         CM/pC8c9U8SHSS9ur+G97abXQ1AMXldl7opeeWGELfLXIYb9HO+CX1b41yWVZq7IQbaw
         pfwqiWBcLbzuU4wr0CpLTL95MqDqiIVD+PQTJArCpavwzL7R/kpDYcMe3p+42faQYSZt
         LcUw==
X-Gm-Message-State: AOAM532Mgmzur4cpU3L0K8X9q26p2t2EOo30ROsVE10fd+Lrn4M/nVTF
        YTnNvGx1dBqCOAHdeymiliRUJDQsISs=
X-Google-Smtp-Source: ABdhPJx7d5BXtfu6iOvl+78IUNnpAKOjw36YDeRcvqVQ7wK5w2v18ymiyHYYqb47xPjKXeIq6mp6/g==
X-Received: by 2002:a4a:3c5c:: with SMTP id p28mr7383242oof.82.1629303815157;
        Wed, 18 Aug 2021 09:23:35 -0700 (PDT)
Received: from [10.0.2.15] (cpe-70-114-247-242.austin.res.rr.com. [70.114.247.242])
        by smtp.googlemail.com with ESMTPSA id o11sm99190otp.8.2021.08.18.09.23.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Aug 2021 09:23:34 -0700 (PDT)
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
From:   Denis Kenzior <denkenz@gmail.com>
Message-ID: <24606605-71ae-f918-b71a-480be7d68e43@gmail.com>
Date:   Wed, 18 Aug 2021 11:23:33 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAMj1kXEjHojAZ0_DPkogHAbmS6XAOFN3t8-4VB0+zN8ruTPVCg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Hi Ard,

>>   The previous ARC4 removal
>> already caused some headaches [0].
> 
> This is the first time this has been reported on an upstream kernel list.
> 
> As you know, I went out of my way to ensure that this removal would
> happen as smoothly as possible, which is why I contributed code to
> both iwd and libell beforehand, and worked with distros to ensure that
> the updated versions would land before the removal of ARC4 from the
> kernel.
> 
> It is unfortunate that one of the distros failed to take that into
> account for the backport of a newer kernel to an older distro release,
> but I don't think it is fair to blame that on the process.

Please don't misunderstand, I don't blame you at all.  I was in favor of ARC4 
removal since the kernel AF_ALG implementation was broken and the ell 
implementation had to work around that.  And you went the extra mile to make 
sure the migration was smooth.  The reported bug is still a fairly minor 
inconvenience in the grand scheme of things.

But, I'm not in favor of doing the same for MD4...

> 
>>   Please note that iwd does use MD4 for MSCHAP
>> and MSCHAPv2 based 802.1X authentication.
>>
> 
> Thanks for reporting that.
> 
> So what is your timeline for retaining MD4 support in iwd? You are
> aware that it has been broken since 1991, right? Please, consider
> having a deprecation path, so we can at least agree on *some* point in
> time (in 6 months, in 6 years, etc) where we can start culling this
> junk.
> 

That is not something that iwd has any control over though?  We have to support 
it for as long as there are  organizations using TTLS + MD5 or PEAPv0.  There 
are still surprisingly many today.

Regards,
-Denis
