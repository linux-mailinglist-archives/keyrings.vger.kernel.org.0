Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0DCBD2068FB
	for <lists+keyrings@lfdr.de>; Wed, 24 Jun 2020 02:23:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387769AbgFXAXw (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 23 Jun 2020 20:23:52 -0400
Received: from helcar.hmeau.com ([216.24.177.18]:47142 "EHLO fornost.hmeau.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387764AbgFXAXv (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Tue, 23 Jun 2020 20:23:51 -0400
Received: from gwarestrin.arnor.me.apana.org.au ([192.168.0.7])
        by fornost.hmeau.com with smtp (Exim 4.92 #5 (Debian))
        id 1jntCR-0007XQ-Sx; Wed, 24 Jun 2020 10:23:36 +1000
Received: by gwarestrin.arnor.me.apana.org.au (sSMTP sendmail emulation); Wed, 24 Jun 2020 10:23:35 +1000
Date:   Wed, 24 Jun 2020 10:23:35 +1000
From:   Herbert Xu <herbert@gondor.apana.org.au>
To:     Eric Biggers <ebiggers@kernel.org>
Cc:     Naresh Kamboju <naresh.kamboju@linaro.org>,
        Luis Chamberlain <mcgrof@kernel.org>,
        LTP List <ltp@lists.linux.it>,
        open list <linux-kernel@vger.kernel.org>,
        linux-security-module@vger.kernel.org, keyrings@vger.kernel.org,
        lkft-triage@lists.linaro.org, linux-crypto@vger.kernel.org,
        Jan Stancek <jstancek@redhat.com>, chrubis <chrubis@suse.cz>,
        "Serge E. Hallyn" <serge@hallyn.com>,
        James Morris <jmorris@namei.org>,
        Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
        David Howells <dhowells@redhat.com>,
        "David S. Miller" <davem@davemloft.net>
Subject: Re: LTP: crypto: af_alg02 regression on linux-next 20200621 tag
Message-ID: <20200624002335.GC12716@gondor.apana.org.au>
References: <CA+G9fYvHFs5Yx8TnT6VavtfjMN8QLPuXg6us-dXVJqUUt68adA@mail.gmail.com>
 <20200622224920.GA4332@42.do-not-panic.com>
 <CA+G9fYsXDZUspc5OyfqrGZn=k=2uRiGzWY_aPePK2C_kZ+dYGQ@mail.gmail.com>
 <20200623064056.GA8121@gondor.apana.org.au>
 <20200623170217.GB150582@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200623170217.GB150582@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Tue, Jun 23, 2020 at 10:02:17AM -0700, Eric Biggers wrote:
>
> The source code for the two failing AF_ALG tests is here:
> 
> https://github.com/linux-test-project/ltp/blob/master/testcases/kernel/crypto/af_alg02.c
> https://github.com/linux-test-project/ltp/blob/master/testcases/kernel/crypto/af_alg05.c
> 
> They use read() and write(), not send() and recv().
> 
> af_alg02 uses read() to read from a "salsa20" request socket without writing
> anything to it.  It is expected that this returns 0, i.e. that behaves like
> encrypting an empty message.
> 
> af_alg05 uses write() to write 15 bytes to a "cbc(aes-generic)" request socket,
> then read() to read 15 bytes.  It is expected that this fails with EINVAL, since
> the length is not aligned to the AES block size (16 bytes).

Thanks.  Sounds like it's my introduction of the init variable that
broke this.  Let me investigate.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
