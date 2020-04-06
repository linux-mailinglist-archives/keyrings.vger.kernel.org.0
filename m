Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 38E9319EFA6
	for <lists+keyrings@lfdr.de>; Mon,  6 Apr 2020 06:20:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725787AbgDFEUV (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Mon, 6 Apr 2020 00:20:21 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:43544 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725768AbgDFEUV (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Mon, 6 Apr 2020 00:20:21 -0400
Received: by mail-pl1-f195.google.com with SMTP id v23so5401607ply.10
        for <keyrings@vger.kernel.org>; Sun, 05 Apr 2020 21:20:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:in-reply-to:message-id:references
         :user-agent:mime-version;
        bh=/HcoQgZiE9Pv1rBqK3LLTaPK3g2aKD5HOOnSnhG2gxw=;
        b=ZDsfwluEmMK067gw+2Je0s0vfQ/XUsMaIRb9LDK9nvdEf14r3PGX9eLKtSlUEjmocE
         0ytImzDDo08wtYIVUCRhhJ8vMavngxXSZWLHgHfkpDdnxMt6tkS3xlXDcsQuSkMvKeDz
         1RxRTdhFXv3fYadf9MWoeGNHhkyJFAxB2yRyfXE7bZ0uz+G8WrH/yvm+pT8wEMiqAPxO
         r8SHij9QSvJMHT2L0hxirj24S1Fgyr364zW32utrka1wOA+0X6KKx/nXajpRwMo2Y5MZ
         ifRS2EbVjGtO3K+rkH8HAc8e8Hij2eNV7D0r1hbbvUNAvWQarM10kNMvLv04XWGUKgFr
         0MRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
         :references:user-agent:mime-version;
        bh=/HcoQgZiE9Pv1rBqK3LLTaPK3g2aKD5HOOnSnhG2gxw=;
        b=iz9SBea/DdsRrm149kwN5/pZCV2KYnARAp4xolyjYmC0288KkklfEzBBV1ZnU9fkvA
         EPLZCaheqGCNd/3/ziZDAOkAKZqKHZ3SdB4qMW72XuLhI7njEM8CuxXPTajlI9vGzKXo
         EASDGzLsm/WR/upYtQc9H0Kq0pstEeiq6rQQh4ELWSPXdvNacmQK7OV/6zYzbeciGFK+
         m4aU1aKY7GjRKyCj0Lm9f35PEP756LQjVVN57lkc1/f5OeBWExGfeQi6lk2QNtJeuxzX
         3VpNpkmpA58INHadMqi0Axxue2tjh3MbDa0IZ+4IiCfjl8HerTOjjZJ8isyLpFC+gjWM
         dz9w==
X-Gm-Message-State: AGi0PubhW4P9zSXFbUTp8C5bBPNRy5xRpKTeX8qSaldmdhdh01MwDedu
        VUiEy7yw5JeCTH+j+1kL9bd0Hw==
X-Google-Smtp-Source: APiQypL+DURskNXslDx34UEjspJ3/iPYy2jfCqgiYyc9DYTgtIKJNU3ptIh+yrVdsV9Wg8Ttv2kR6Q==
X-Received: by 2002:a17:90a:a484:: with SMTP id z4mr24579608pjp.77.1586146819733;
        Sun, 05 Apr 2020 21:20:19 -0700 (PDT)
Received: from [2620:15c:17:3:3a5:23a7:5e32:4598] ([2620:15c:17:3:3a5:23a7:5e32:4598])
        by smtp.gmail.com with ESMTPSA id 198sm10616957pfa.87.2020.04.05.21.20.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2020 21:20:19 -0700 (PDT)
Date:   Sun, 5 Apr 2020 21:20:18 -0700 (PDT)
From:   David Rientjes <rientjes@google.com>
X-X-Sender: rientjes@chino.kir.corp.google.com
To:     Waiman Long <longman@redhat.com>
cc:     Andrew Morton <akpm@linux-foundation.org>,
        David Howells <dhowells@redhat.com>,
        Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
        James Morris <jmorris@namei.org>,
        "Serge E. Hallyn" <serge@hallyn.com>, linux-mm@kvack.org,
        keyrings@vger.kernel.org, linux-kernel@vger.kernel.org,
        Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH] mm: Add kvfree_sensitive() for freeing sensitive data
 objects
In-Reply-To: <20200406023700.1367-1-longman@redhat.com>
Message-ID: <alpine.DEB.2.21.2004052119530.243304@chino.kir.corp.google.com>
References: <20200406023700.1367-1-longman@redhat.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Sun, 5 Apr 2020, Waiman Long wrote:

> For kvmalloc'ed data object that contains sensitive information like
> cryptographic key, we need to make sure that the buffer is always
> cleared before freeing it. Using memset() alone for buffer clearing may
> not provide certainty as the compiler may compile it away. To be sure,
> the special memzero_explicit() has to be used.
> 
> This patch introduces a new kvfree_sensitive() for freeing those
> sensitive data objects allocated by kvmalloc(). The relevnat places
> where kvfree_sensitive() can be used are modified to use it.
> 
> Fixes: 4f0882491a14 ("KEYS: Avoid false positive ENOMEM error on key read")
> Suggested-by: Linus Torvalds <torvalds@linux-foundation.org>
> Signed-off-by: Waiman Long <longman@redhat.com>
> ---
>  include/linux/mm.h       | 17 +++++++++++++++++
>  security/keys/internal.h | 11 -----------
>  security/keys/keyctl.c   | 16 +++++-----------
>  3 files changed, 22 insertions(+), 22 deletions(-)
> 
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index 7dd5c4ccbf85..c26f279f1956 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -758,6 +758,23 @@ static inline void *kvcalloc(size_t n, size_t size, gfp_t flags)
>  
>  extern void kvfree(const void *addr);
>  
> +/**
> + * kvfree_sensitive - free a data object containing sensitive information
> + * @addr - address of the data object to be freed
> + * @len  - length of the data object
> + *
> + * Use the special memzero_explicit() function to clear the content of a
> + * kvmalloc'ed object containing sensitive data to make sure that the
> + * compiler won't optimize out the data clearing.
> + */
> +static inline void kvfree_sensitive(const void *addr, size_t len)
> +{
> +	if (addr) {

Shouldn't this be if (unlikely(ZERO_OR_NULL_PTR(addr))?

> +		memzero_explicit((void *)addr, len);
> +		kvfree(addr);
> +	}
> +}
> +
>  static inline int compound_mapcount(struct page *page)
>  {
>  	VM_BUG_ON_PAGE(!PageCompound(page), page);
> diff --git a/security/keys/internal.h b/security/keys/internal.h
> index 6d0ca48ae9a5..153d35c20d3d 100644
> --- a/security/keys/internal.h
> +++ b/security/keys/internal.h
> @@ -350,15 +350,4 @@ static inline void key_check(const struct key *key)
>  #define key_check(key) do {} while(0)
>  
>  #endif
> -
> -/*
> - * Helper function to clear and free a kvmalloc'ed memory object.
> - */
> -static inline void __kvzfree(const void *addr, size_t len)
> -{
> -	if (addr) {
> -		memset((void *)addr, 0, len);
> -		kvfree(addr);
> -	}
> -}
>  #endif /* _INTERNAL_H */
> diff --git a/security/keys/keyctl.c b/security/keys/keyctl.c
> index 5e01192e222a..edde63a63007 100644
> --- a/security/keys/keyctl.c
> +++ b/security/keys/keyctl.c
> @@ -142,10 +142,7 @@ SYSCALL_DEFINE5(add_key, const char __user *, _type,
>  
>  	key_ref_put(keyring_ref);
>   error3:
> -	if (payload) {
> -		memzero_explicit(payload, plen);
> -		kvfree(payload);
> -	}
> +	kvfree_sensitive(payload, plen);
>   error2:
>  	kfree(description);
>   error:
> @@ -360,7 +357,7 @@ long keyctl_update_key(key_serial_t id,
>  
>  	key_ref_put(key_ref);
>  error2:
> -	__kvzfree(payload, plen);
> +	kvfree_sensitive(payload, plen);
>  error:
>  	return ret;
>  }
> @@ -914,7 +911,7 @@ long keyctl_read_key(key_serial_t keyid, char __user *buffer, size_t buflen)
>  		 */
>  		if (ret > key_data_len) {
>  			if (unlikely(key_data))
> -				__kvzfree(key_data, key_data_len);
> +				kvfree_sensitive(key_data, key_data_len);
>  			key_data_len = ret;
>  			continue;	/* Allocate buffer */
>  		}
> @@ -923,7 +920,7 @@ long keyctl_read_key(key_serial_t keyid, char __user *buffer, size_t buflen)
>  			ret = -EFAULT;
>  		break;
>  	}
> -	__kvzfree(key_data, key_data_len);
> +	kvfree_sensitive(key_data, key_data_len);
>  
>  key_put_out:
>  	key_put(key);
> @@ -1225,10 +1222,7 @@ long keyctl_instantiate_key_common(key_serial_t id,
>  		keyctl_change_reqkey_auth(NULL);
>  
>  error2:
> -	if (payload) {
> -		memzero_explicit(payload, plen);
> -		kvfree(payload);
> -	}
> +	kvfree_sensitive(payload, plen);
>  error:
>  	return ret;
>  }
> -- 
> 2.18.1
> 
> 
> 
