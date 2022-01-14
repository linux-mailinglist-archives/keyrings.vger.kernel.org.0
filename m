Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9296F48EC0A
	for <lists+keyrings@lfdr.de>; Fri, 14 Jan 2022 15:54:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241989AbiANOyZ (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Fri, 14 Jan 2022 09:54:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241984AbiANOyY (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Fri, 14 Jan 2022 09:54:24 -0500
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com [IPv6:2607:f8b0:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72C99C061574;
        Fri, 14 Jan 2022 06:54:24 -0800 (PST)
Received: by mail-ot1-x333.google.com with SMTP id w19-20020a056830061300b0058f1dd48932so10267632oti.11;
        Fri, 14 Jan 2022 06:54:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=pFk4FnAoo/XUxDU2DlGmU853axjm7alTesmmXVICC58=;
        b=C4NZYZuZvR68FJCRcIwU32oSx9Q8zHABsda0TWftHEkun3uE+4OsSkQwwRcA3ZOKSn
         dNnHBoa+wU0X5lV5HKPkHTdvIEHFRMnd0vDr3iDFM+71ocGL5DQ5xJCtdKUSIl7WrhyG
         GDtysUlnYIp6M83CT0jRMz1DH61uEzZXHIIJlPwmXnVbgU3ayxL7gbWC6it3CeNgNjT2
         OHG69qzHoXxn8sgBHQccziTw5jZCqv2yIvkxgaxOyu+Wi/VZFngy3K237a+gJEu0Z7BQ
         /NOeQ9lNEShJ9sAM+wpRfyKZC4zG717hMU9mFv3dGXm1dGBhDfddmo20sfM3HYP0Z8vN
         FYZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=pFk4FnAoo/XUxDU2DlGmU853axjm7alTesmmXVICC58=;
        b=yN7Z2G/u8YT8SXEs59dE9j8dEEaZGK9kWjmUUuSQXSHP2Ls4hPP6+HYCVETeIocJC3
         U3gAsbcPnJe9qmmCNlB95X004l07ca5Y0ncIAOUidPqy8FXcJndxpFEWKAW65SUH1wJi
         MG3lIRMv2qLo936GbnNeGty97BTf09gugwE9ELsepoZL8r9t9n+qsTOBhhQjfEnZdG8c
         cJU1bWWk3aBPgu6YgQ+3jrBgZ+ble8Tzt8I6HxNBliAHev5qtIMxWlIJJTh+x7NtAOsG
         zO5kDKW/CoQJF+h35riEsUqbLDhD/rdTd92Sv4lpn6lgQV0DKOC84krm07lMunNaV+mw
         9sFg==
X-Gm-Message-State: AOAM532VuSZ2upARGeOFAjLeAr1wBRuPvxkwBy5Fx8tUjkIuKAvlhpO0
        7w+vAvMdKW5KqwKrpIpePxY=
X-Google-Smtp-Source: ABdhPJzlP9bqSlR9IkCUHgI2cIiVNHnp5w66+rDcbUqiTrKjNv+Gb7mVW2tTqUMG/N3hGRDw6Nr1Aw==
X-Received: by 2002:a9d:7987:: with SMTP id h7mr6941847otm.60.1642172063865;
        Fri, 14 Jan 2022 06:54:23 -0800 (PST)
Received: from [10.0.2.15] (cpe-70-114-247-242.austin.res.rr.com. [70.114.247.242])
        by smtp.googlemail.com with ESMTPSA id z24sm1833132otk.20.2022.01.14.06.54.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Jan 2022 06:54:23 -0800 (PST)
Message-ID: <b21cf62d-92d1-5180-a303-e55714683d13@gmail.com>
Date:   Fri, 14 Jan 2022 08:54:22 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 0/3] KEYS: fixes for asym_tpm keys
Content-Language: en-US
To:     Eric Biggers <ebiggers@kernel.org>, keyrings@vger.kernel.org,
        David Howells <dhowells@redhat.com>,
        Jarkko Sakkinen <jarkko@kernel.org>
Cc:     Marcel Holtmann <marcel@holtmann.org>,
        James Morris <james.morris@microsoft.com>,
        linux-crypto@vger.kernel.org
References: <20220113235440.90439-1-ebiggers@kernel.org>
From:   Denis Kenzior <denkenz@gmail.com>
In-Reply-To: <20220113235440.90439-1-ebiggers@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Hi Eric,

On 1/13/22 17:54, Eric Biggers wrote:
> This series fixes some bugs in asym_tpm.c.
> 
> Eric Biggers (3):
>    KEYS: asym_tpm: fix buffer overreads in extract_key_parameters()
>    KEYS: asym_tpm: fix incorrect comment
>    KEYS: asym_tpm: rename derive_pub_key()
> 
>   crypto/asymmetric_keys/asym_tpm.c | 44 +++++++++++++++++++------------
>   1 file changed, 27 insertions(+), 17 deletions(-)
> 
> 
> base-commit: feb7a43de5ef625ad74097d8fd3481d5dbc06a59
> 

For the series:

Reviewed-By: Denis Kenzior <denkenz@gmail.com>

Regards,
-Denis
