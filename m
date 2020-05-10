Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3DCC41CCE27
	for <lists+keyrings@lfdr.de>; Sun, 10 May 2020 23:17:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729128AbgEJVRk (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Sun, 10 May 2020 17:17:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:50554 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726955AbgEJVRk (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Sun, 10 May 2020 17:17:40 -0400
Received: from sol.localdomain (c-107-3-166-239.hsd1.ca.comcast.net [107.3.166.239])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A762720731;
        Sun, 10 May 2020 21:17:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589145459;
        bh=jDSgHIjSdcfbYEeaUJK6949KQKrnH33OZMXTagwol1U=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=vXemduiy0JPU9WekcwJ5wX3mMkCUeEHrZUwXA70apj+RBQrmHlTmKH50aZ3Dqfcl0
         zgpQ7miVlv71rVkLP1LZ1XFtZj6wPaDkpSXInRXzOU2vpjrvaPcfPS3aM4nzj67yKC
         0DtwvWZ2jfiD5hM+GfpMJc4uC5E28I0Mxh0UBkE4=
Date:   Sun, 10 May 2020 14:17:38 -0700
From:   Eric Biggers <ebiggers@kernel.org>
To:     "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc:     dhowells@redhat.com, keyrings@vger.kernel.org,
        Andy Lutomirski <luto@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        kernel-hardening@lists.openwall.com
Subject: Re: [PATCH v2] security/keys: rewrite big_key crypto to use Zinc
Message-ID: <20200510211738.GA52708@sol.localdomain>
References: <CAHmME9rvp4JrER0RPp=VgYwYL87jntwW8vWNANzubH3Ah_8Oow@mail.gmail.com>
 <20200502001942.626523-1-Jason@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200502001942.626523-1-Jason@zx2c4.com>
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Fri, May 01, 2020 at 06:19:42PM -0600, Jason A. Donenfeld wrote:
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
> Cc: Eric Biggers <ebiggers@kernel.org>
> Cc: kernel-hardening@lists.openwall.com
> Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>

You can add:

	Reviewed-by: Eric Biggers <ebiggers@google.com>

But, a couple minor suggestions:

The commit message should say "lib/crypto", not Zinc.  Nothing in the source
tree actually says Zinc, so it will confuse people who haven't read all the
previous discussions.

>  		/* read file to kernel and decrypt */
> -		ret = kernel_read(file, buf->virt, enclen, &pos);
> +		ret = kernel_read(file, buf, enclen, &pos);
>  		if (ret >= 0 && ret != enclen) {
>  			ret = -EIO;
>  			goto err_fput;
> +		} else if (ret < 0) {
> +			goto err_fput;
>  		}

It would make sense to write this as the following, to make it consistent with
how the return value of kernel_write() is checked in big_key_preparse():

		ret = kernel_read(file, buf, enclen, &pos);
		if (ret != enclen) {
			if (ret >= 0)
				ret = -ENOMEM;
			goto err_fput;
		}

- Eric
