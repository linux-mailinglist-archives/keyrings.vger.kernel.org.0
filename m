Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A3BAC1C211D
	for <lists+keyrings@lfdr.de>; Sat,  2 May 2020 01:09:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726318AbgEAXJQ (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Fri, 1 May 2020 19:09:16 -0400
Received: from mail.kernel.org ([198.145.29.99]:56282 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726045AbgEAXJP (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Fri, 1 May 2020 19:09:15 -0400
Received: from sol.localdomain (c-107-3-166-239.hsd1.ca.comcast.net [107.3.166.239])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A5C89208DB;
        Fri,  1 May 2020 23:09:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1588374554;
        bh=rKN9EDVmXwn6takeqycZAn+iqfP/Fn3tjtdzjzy8GbQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jgkKa20r7/fHkDNLCHyCSdAjcrAkaceeB1q1vetTljZaUzXtmFilQ+Nnt61QjIue0
         bKJrEME1vDq48Z51WRRfi91SvVk/fObnz0+rlYvBZ2C15p76I2fvKP0pLecbiFy2cJ
         h8UUMKpm37OHM/Dr8yPtDwww/SI7lTOtbRpQuit8=
Date:   Fri, 1 May 2020 16:09:13 -0700
From:   Eric Biggers <ebiggers@kernel.org>
To:     "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc:     dhowells@redhat.com, keyrings@vger.kernel.org,
        Andy Lutomirski <luto@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        kernel-hardening@lists.openwall.com
Subject: Re: [PATCH] security/keys: rewrite big_key crypto to use Zinc
Message-ID: <20200501230913.GB915@sol.localdomain>
References: <20200501222357.543312-1-Jason@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200501222357.543312-1-Jason@zx2c4.com>
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Fri, May 01, 2020 at 04:23:57PM -0600, Jason A. Donenfeld wrote:
> A while back, I noticed that the crypto and crypto API usage in big_keys
> were entirely broken in multiple ways, so I rewrote it. Now, I'm
> rewriting it again, but this time using Zinc's ChaCha20Poly1305
> function. This makes the file considerably more simple; the diffstat
> alone should justify this commit. It also should be faster, since it no
> longer requires a mutex around the "aead api object" (nor allocations),
> allowing us to encrypt multiple items in parallel. We also benefit from
> being able to pass any type of pointer, so we can get rid of the
> ridiculously complex custom page allocator that big_key really doesn't
> need.
> 
> Cc: David Howells <dhowells@redhat.com>
> Cc: Andy Lutomirski <luto@kernel.org>
> Cc: Greg KH <gregkh@linuxfoundation.org>
> Cc: Linus Torvalds <torvalds@linux-foundation.org>
> Cc: kernel-hardening@lists.openwall.com
> Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
> ---
> I finally got around to updating this patch from the mailing list posts
> back in 2017-2018, using the library interface that we eventually merged
> in 2019. I haven't retested this for functionality, but nothing much has
> changed, so I suspect things should still be good to go.
> 
>  security/keys/Kconfig   |   4 +-
>  security/keys/big_key.c | 230 +++++-----------------------------------
>  2 files changed, 28 insertions(+), 206 deletions(-)
> 
> diff --git a/security/keys/Kconfig b/security/keys/Kconfig
> index 47c041563d41..5aa442490d52 100644
> --- a/security/keys/Kconfig
> +++ b/security/keys/Kconfig
> @@ -60,9 +60,7 @@ config BIG_KEYS
>  	bool "Large payload keys"
>  	depends on KEYS
>  	depends on TMPFS
> -	select CRYPTO
> -	select CRYPTO_AES
> -	select CRYPTO_GCM
> +	select CRYPTO_LIB_CHACHA20POLY1305
>  	help
>  	  This option provides support for holding large keys within the kernel
>  	  (for example Kerberos ticket caches).  The data may be stored out to

The 'select CRYPTO' is actually still needed because CRYPTO_LIB_CHACHA20POLY1305
is under the CRYPTO menuconfig:

make allnoconfig
cat >> .config << EOF
CONFIG_SHMEM=y
CONFIG_TMPFS=y
CONFIG_KEYS=y
CONFIG_BIG_KEYS=y
EOF
make olddefconfig

WARNING: unmet direct dependencies detected for CRYPTO_LIB_CHACHA20POLY1305
  Depends on [n]: CRYPTO [=n] && (CRYPTO_ARCH_HAVE_LIB_CHACHA [=n] || !CRYPTO_ARCH_HAVE_LIB_CHACHA [=n]) && (CRYPTO_ARCH_HAVE_LIB_POLY1305 [=n] || !CRYPTO_ARCH_HAVE_LIB_POLY1305 [=n])
  Selected by [y]:
  - BIG_KEYS [=y] && KEYS [=y] && TMPFS [=y]


Maybe the 'source "lib/crypto/Kconfig"' in crypto/Kconfig should be moved to
lib/Kconfig so that it's under "Library routines" and the crypto library options
can be selected without the full CRYPTO framework?

But lib/crypto/libchacha.c uses crypto_xor_cpy(), and
lib/crypto/chacha20poly1305.c uses crypto_memneq().  So those functions would
first need to be pulled into lib/crypto/ too.

> @@ -265,7 +121,7 @@ int big_key_preparse(struct key_preparsed_payload *prep)
>  		*path = file->f_path;
>  		path_get(path);
>  		fput(file);
> -		big_key_free_buffer(buf);
> +		kvfree(buf);
>  	} else {
>  		/* Just store the data in a buffer */
>  		void *data = kmalloc(datalen, GFP_KERNEL);
> @@ -283,7 +139,7 @@ int big_key_preparse(struct key_preparsed_payload *prep)
>  err_enckey:
>  	kzfree(enckey);
>  error:
> -	big_key_free_buffer(buf);
> +	kvfree(buf);
>  	return ret;
>  }

There should be a 'memzero_explicit(buf, enclen);' before the above two calls to
kvfree().

Or even better these should use kvfree_sensitive(), but that hasn't been merged
yet.  It was under discussion last month:
https://lkml.kernel.org/lkml/20200407200318.11711-1-longman@redhat.com/

>  
> -		ret = big_key_crypt(BIG_KEY_DEC, buf, enclen, enckey);
> -		if (ret)
> +		ret = chacha20poly1305_decrypt(buf, buf, enclen, NULL, 0, 0,
> +					       enckey) ? 0 : -EINVAL;
> +		if (unlikely(ret))
>  			goto err_fput;

-EINVAL is often unclear, since everyone uses it for everything.  How about
using -EBADMSG, which is what was used before via crypto_aead_decrypt()?

>  
>  		ret = datalen;
>  
>  		/* copy out decrypted data */
> -		memcpy(buffer, buf->virt, datalen);
> +		memcpy(buffer, buf, datalen);
>  
>  err_fput:
>  		fput(file);
>  error:
> -		big_key_free_buffer(buf);
> +		kvfree(buf);

Likewise, the buffer should be zeroed before freeing here.

- Eric
