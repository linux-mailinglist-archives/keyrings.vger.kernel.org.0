Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B4EA53F12AF
	for <lists+keyrings@lfdr.de>; Thu, 19 Aug 2021 07:18:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229782AbhHSFSl (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 19 Aug 2021 01:18:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:54548 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229451AbhHSFSk (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Thu, 19 Aug 2021 01:18:40 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id AFD9761107;
        Thu, 19 Aug 2021 05:18:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1629350285;
        bh=eUe4iHnO0QHSuRxWzei4ahFKR+9XbVenRz1m8RYT/Po=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=YAxEpkeMOOlK+qVLQkf/bw0q39y8+yKlOzTlwmF4dZ2BQaF03yq0t3lgO29d3NuRx
         ta/DGg9tUOjujlyFjUNE01uxBdwjAW4i8n/J1xy9MbM8/B7RKksI4tDPvtu+h9nDLz
         w+OA6QaSSNRwHlbdyozyguXwQWd1efrSBoqwj7xv+8Hd0IrCtKom2MOAHEpXMGcH2c
         Bxa0kP0F9ZWvMRj0e3EIGlpoyk6YskjrZc2etlbIgq5CR7yJ+N8DnAhOiKeCeF9ntH
         Tlcz3wnrI5eTZwmYFVW/i2vOZugfWZfNnxb631vcykVm3Bqtgj4nCyfiDhONSMXxDZ
         KX3j8igFhCS1g==
Date:   Wed, 18 Aug 2021 22:18:03 -0700
From:   Eric Biggers <ebiggers@kernel.org>
To:     Andrew Bartlett <abartlet@samba.org>
Cc:     Jeremy Allison <jra@samba.org>, Steve French <smfrench@gmail.com>,
        linux-cifs <linux-cifs@vger.kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        samba-technical <samba-technical@lists.samba.org>,
        David Howells <dhowells@redhat.com>,
        Steve French <sfrench@samba.org>, keyrings@vger.kernel.org,
        Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
        Ard Biesheuvel <ardb@kernel.org>,
        Denis Kenzior <denkenz@gmail.com>
Subject: Re: [PATCH 0/2] crypto: remove MD4 generic shash
Message-ID: <YR3pi9HEbhknJdl6@sol.localdomain>
References: <20210818144617.110061-1-ardb@kernel.org>
 <946591db-36aa-23db-a5c4-808546eab762@gmail.com>
 <CAMj1kXEjHojAZ0_DPkogHAbmS6XAOFN3t8-4VB0+zN8ruTPVCg@mail.gmail.com>
 <24606605-71ae-f918-b71a-480be7d68e43@gmail.com>
 <CAH2r5muhHnrAbu-yX3h1VPjW+2CUyUtSCzyoOs7MXw=fE7HA_Q@mail.gmail.com>
 <YR2E2FZNdMj2xl+0@jeremy-acer>
 <d08c99b8550cc48fe04cc9f4cd5eca0532f5733d.camel@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d08c99b8550cc48fe04cc9f4cd5eca0532f5733d.camel@samba.org>
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Thu, Aug 19, 2021 at 03:49:14PM +1200, Andrew Bartlett wrote:
> I know neither MD4 nor HMAC-MD5 is not flavour of the month any more,
> with good reason, but we would not want to go with way of NFSv4 which
> is, as I understand it, full Kerberos or bust (so folks choose no
> protection).

I'm not sure you understand how embarrassing it is to still be using these
algorithms.  MD4 has been broken for over 25 years, and better algorithms have
been recommended for 29 years.  Similarly MD5 has been broken for 16 years and
better algorithms have been recommended for 25 years (though granted, HMAC-MD5
is more secure than plain MD5 when properly used).  Meanwhile SHA-2 is 20 years
old and is still considered secure.  So this isn't something that changes every
month -- we're talking about no one bothering to do anything in 30 years.

Of course, if cryptography isn't actually applicable to the use case, then
cryptography shouldn't be used at all.

- Eric
