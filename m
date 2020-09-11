Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C86DA2662FB
	for <lists+keyrings@lfdr.de>; Fri, 11 Sep 2020 18:08:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726409AbgIKQIZ (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Fri, 11 Sep 2020 12:08:25 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:45562 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726170AbgIKQFW (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Fri, 11 Sep 2020 12:05:22 -0400
Received: by mail-lf1-f67.google.com with SMTP id z17so6348094lfi.12;
        Fri, 11 Sep 2020 09:05:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:reply-to:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=PHtNbi2pIZBDNdSuWFaCN2VJR0IT2sOp254gfd+fMPs=;
        b=HCtUdRynMZGqCuuzpOp69WQGkHfwwt6UpyxFxaociQtSXG5AFj8OF+38NSx/LarZDc
         5l8SKw7eGqmRVl831U8zPu3zD0TyOkvBlnSYWcZVFwLVPzNJNNzvMXqTRB0gObb1/9C1
         ZvcbPt2NI0YTxbyHL/D0CeTqCUme/6RG5W6biPeA0Hg6J0ur4QAXten1FvEmHkIdMs37
         eP+RwtK2tDT+Gb+9d5uK4ceY20vX4wU4eqR2OmVwEbvCt2fSDjOnR7qN2lCQLdtVS1fK
         e+eVvP1Ys9Vq9vzebsSH0rlC0GlPlLQbL0TJ6rw/Y5U0yQstxveKlnNI4nrcMrNAkJlE
         Mldw==
X-Gm-Message-State: AOAM530eo0FQWmp1c8gC+gplbi3xOQs+KAXhWMyP7wLGpqzljLNe12Wk
        Dh9AWKM60WE+UZaL0Nied4lK4EugUHE=
X-Google-Smtp-Source: ABdhPJwmaU62krb9om0DdodSBGz4tiHCRU/llixf7hE3Q4t4SPd0rpsgl4juLOWR++Y/Cu/n3QrAfg==
X-Received: by 2002:a19:8087:: with SMTP id b129mr539764lfd.471.1599840317946;
        Fri, 11 Sep 2020 09:05:17 -0700 (PDT)
Received: from [10.68.32.147] (broadband-37-110-38-130.ip.moscow.rt.ru. [37.110.38.130])
        by smtp.gmail.com with ESMTPSA id w4sm572357ljm.50.2020.09.11.09.05.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2020 09:05:17 -0700 (PDT)
Subject: Re: [PATCH] security: keys: Use kvfree_sensitive in a few places
To:     Alex Dewar <alex.dewar90@gmail.com>
Cc:     David Howells <dhowells@redhat.com>,
        Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
        James Morris <jmorris@namei.org>,
        "Serge E. Hallyn" <serge@hallyn.com>, keyrings@vger.kernel.org,
        linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200911114400.82207-1-alex.dewar90@gmail.com>
Reply-To: efremov@linux.com
From:   Denis Efremov <efremov@linux.com>
Autocrypt: addr=efremov@linux.com; keydata=
 mQINBFsJUXwBEADDnzbOGE/X5ZdHqpK/kNmR7AY39b/rR+2Wm/VbQHV+jpGk8ZL07iOWnVe1
 ZInSp3Ze+scB4ZK+y48z0YDvKUU3L85Nb31UASB2bgWIV+8tmW4kV8a2PosqIc4wp4/Qa2A/
 Ip6q+bWurxOOjyJkfzt51p6Th4FTUsuoxINKRMjHrs/0y5oEc7Wt/1qk2ljmnSocg3fMxo8+
 y6IxmXt5tYvt+FfBqx/1XwXuOSd0WOku+/jscYmBPwyrLdk/pMSnnld6a2Fp1zxWIKz+4VJm
 QEIlCTe5SO3h5sozpXeWS916VwwCuf8oov6706yC4MlmAqsQpBdoihQEA7zgh+pk10sCvviX
 FYM4gIcoMkKRex/NSqmeh3VmvQunEv6P+hNMKnIlZ2eJGQpz/ezwqNtV/przO95FSMOQxvQY
 11TbyNxudW4FBx6K3fzKjw5dY2PrAUGfHbpI3wtVUNxSjcE6iaJHWUA+8R6FLnTXyEObRzTS
 fAjfiqcta+iLPdGGkYtmW1muy/v0juldH9uLfD9OfYODsWia2Ve79RB9cHSgRv4nZcGhQmP2
 wFpLqskh+qlibhAAqT3RQLRsGabiTjzUkdzO1gaNlwufwqMXjZNkLYu1KpTNUegx3MNEi2p9
 CmmDxWMBSMFofgrcy8PJ0jUnn9vWmtn3gz10FgTgqC7B3UvARQARAQABtCFEZW5pcyBFZnJl
 bW92IDxlZnJlbW92QGxpbnV4LmNvbT6JAlcEEwEIAEECGwMFCwkIBwIGFQoJCAsCBBYCAwEC
 HgECF4ACGQEWIQR2VAM2ApQN8ZIP5AO1IpWwM1AwHwUCXsQtuwUJB31DPwAKCRC1IpWwM1Aw
 H3dQD/9E/hFd2yPwWA5cJ5jmBeQt4lBi5wUXd2+9Y0mBIn40F17Xrjebo+D8E5y6S/wqfImW
 nSDYaMfIIljdjmUUanR9R7Cxd/Z548Qaa4F1AtB4XN3W1L49q21h942iu0yxSLZtq9ayeja6
 flCB7a+gKjHMWFDB4nRi4gEJvZN897wdJp2tAtUfErXvvxR2/ymKsIf5L0FZBnIaGpqRbfgG
 Slu2RSpCkvxqlLaYGeYwGODs0QR7X2i70QGeEzznN1w1MGKLOFYw6lLeO8WPi05fHzpm5pK6
 mTKkpZ53YsRfWL/HY3kLZPWm1cfAxa/rKvlhom+2V8cO4UoLYOzZLNW9HCFnNxo7zHoJ1shR
 gYcCq8XgiJBF6jfM2RZYkOAJd6E3mVUxctosNq6av3NOdsp1Au0CYdQ6Whi13azZ81pDlJQu
 Hdb0ZpDzysJKhORsf0Hr0PSlYKOdHuhl8fXKYOGQxpYrWpOnjrlEORl7NHILknXDfd8mccnf
 4boKIZP7FbqSLw1RSaeoCnqH4/b+ntsIGvY3oJjzbQVq7iEpIhIoQLxeklFl1xvJAOuSQwII
 I9S0MsOm1uoT/mwq+wCYux4wQhALxSote/EcoUxK7DIW9ra4fCCo0bzaX7XJ+dJXBWb0Ixxm
 yLl39M+7gnhvZyU+wkTYERp1qBe9ngjd0QTZNVi7MbkCDQRbCVF8ARAA3ITFo8OvvzQJT2cY
 nPR718Npm+UL6uckm0Jr0IAFdstRZ3ZLW/R9e24nfF3A8Qga3VxJdhdEOzZKBbl1nadZ9kKU
 nq87te0eBJu+EbcuMv6+njT4CBdwCzJnBZ7ApFpvM8CxIUyFAvaz4EZZxkfEpxaPAivR1Sa2
 2x7OMWH/78laB6KsPgwxV7fir45VjQEyJZ5ac5ydG9xndFmb76upD7HhV7fnygwf/uIPOzNZ
 YVElGVnqTBqisFRWg9w3Bqvqb/W6prJsoh7F0/THzCzp6PwbAnXDedN388RIuHtXJ+wTsPA0
 oL0H4jQ+4XuAWvghD/+RXJI5wcsAHx7QkDcbTddrhhGdGcd06qbXe2hNVgdCtaoAgpCEetW8
 /a8H+lEBBD4/iD2La39sfE+dt100cKgUP9MukDvOF2fT6GimdQ8TeEd1+RjYyG9SEJpVIxj6
 H3CyGjFwtIwodfediU/ygmYfKXJIDmVpVQi598apSoWYT/ltv+NXTALjyNIVvh5cLRz8YxoF
 sFI2VpZ5PMrr1qo+DB1AbH00b0l2W7HGetSH8gcgpc7q3kCObmDSa3aTGTkawNHzbceEJrL6
 mRD6GbjU4GPD06/dTRIhQatKgE4ekv5wnxBK6v9CVKViqpn7vIxiTI9/VtTKndzdnKE6C72+
 jTwSYVa1vMxJABtOSg8AEQEAAYkCPAQYAQgAJgIbDBYhBHZUAzYClA3xkg/kA7UilbAzUDAf
 BQJexC4MBQkHfUOQAAoJELUilbAzUDAfPYoQAJdBGd9WZIid10FCoI30QXA82SHmxWe0Xy7h
 r4bbZobDPc7GbTHeDIYmUF24jI15NZ/Xy9ADAL0TpEg3fNVad2eslhCwiQViWfKOGOLLMe7v
 zod9dwxYdGXnNRlW+YOCdFNVPMvPDr08zgzXaZ2+QJjp44HSyzxgONmHAroFcqCFUlfAqUDO
 T30gV5bQ8BHqvfWyEhJT+CS3JJyP8BmmSgPa0Adlp6Do+pRsOO1YNNO78SYABhMi3fEa7X37
 WxL31TrNCPnIauTgZtf/KCFQJpKaakC3ffEkPhyTjEl7oOE9xccNjccZraadi+2uHV0ULA1m
 ycHhb817A03n1I00QwLf2wOkckdqTqRbFFI/ik69hF9hemK/BmAHpShI+z1JsYT9cSs8D7wb
 aF/jQVy4URensgAPkgXsRiboqOj/rTz9F5mpd/gPU/IOUPFEMoo4TInt/+dEVECHioU3RRrW
 EahrGMfRngbdp/mKs9aBR56ECMfFFUPyI3VJsNbgpcIJjV/0N+JdJKQpJ/4uQ2zNm0wH/RU8
 CRJvEwtKemX6fp/zLI36Gvz8zJIjSBIEqCb7vdgvWarksrhmi6/Jay5zRZ03+k6YwiqgX8t7
 ANwvYa1h1dQ36OiTqm1cIxRCGl4wrypOVGx3OjCar7sBLD+NkwO4RaqFvdv0xuuy4x01VnOF
Message-ID: <f97076d2-de8a-4600-ee81-4cf4fcdc3ec1@linux.com>
Date:   Fri, 11 Sep 2020 19:05:16 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200911114400.82207-1-alex.dewar90@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Hi,

same patch

https://lkml.org/lkml/2020/8/27/168

Thanks,
Denis

On 9/11/20 2:44 PM, Alex Dewar wrote:
> In big_key.c, there are a few places where memzero_explicit + kvfree is
> used. It is better to use kvfree_sensitive instead, which is more
> readable and also prevents the compiler from eliding the call to
> memzero_explicit. Fix this.
> 
> Signed-off-by: Alex Dewar <alex.dewar90@gmail.com>
> ---
>  security/keys/big_key.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
> 
> diff --git a/security/keys/big_key.c b/security/keys/big_key.c
> index 691347dea3c1..d17e5f09eeb8 100644
> --- a/security/keys/big_key.c
> +++ b/security/keys/big_key.c
> @@ -121,8 +121,7 @@ int big_key_preparse(struct key_preparsed_payload *prep)
>  		*path = file->f_path;
>  		path_get(path);
>  		fput(file);
> -		memzero_explicit(buf, enclen);
> -		kvfree(buf);
> +		kvfree_sensitive(buf, enclen);
>  	} else {
>  		/* Just store the data in a buffer */
>  		void *data = kmalloc(datalen, GFP_KERNEL);
> @@ -140,8 +139,7 @@ int big_key_preparse(struct key_preparsed_payload *prep)
>  err_enckey:
>  	kfree_sensitive(enckey);
>  error:
> -	memzero_explicit(buf, enclen);
> -	kvfree(buf);
> +	kvfree_sensitive(buf, enclen);
>  	return ret;
>  }
>  
> @@ -273,8 +271,7 @@ long big_key_read(const struct key *key, char *buffer, size_t buflen)
>  err_fput:
>  		fput(file);
>  error:
> -		memzero_explicit(buf, enclen);
> -		kvfree(buf);
> +		kvfree_sensitive(buf, enclen);
>  	} else {
>  		ret = datalen;
>  		memcpy(buffer, key->payload.data[big_key_data], datalen);
> 
