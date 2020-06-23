Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CAC25205829
	for <lists+keyrings@lfdr.de>; Tue, 23 Jun 2020 19:02:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732526AbgFWRCT (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 23 Jun 2020 13:02:19 -0400
Received: from mail.kernel.org ([198.145.29.99]:37084 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728916AbgFWRCT (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Tue, 23 Jun 2020 13:02:19 -0400
Received: from gmail.com (unknown [104.132.1.76])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 64B1A206EB;
        Tue, 23 Jun 2020 17:02:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1592931738;
        bh=lyjF5JCMRLkYfJgb+nOoi8e9pbWAuyRNl9vIReX7pT4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=wnSPXYVfbyX9CmJZGaMbnvuqnseTjcR/2VLVOrOsSiykjRDpg7yS4p10BPbMNJ5H/
         1vQQyG7aPCqvBU5TCqzOBk+czJvnU83rKvnp9S5VcUSmzMoyGe22Akxn77qHm7Oji0
         nNFApQc1NRvwSoeFRqGXilnnJZ6QHjaOuqN3QhRA=
Date:   Tue, 23 Jun 2020 10:02:17 -0700
From:   Eric Biggers <ebiggers@kernel.org>
To:     Herbert Xu <herbert@gondor.apana.org.au>
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
Message-ID: <20200623170217.GB150582@gmail.com>
References: <CA+G9fYvHFs5Yx8TnT6VavtfjMN8QLPuXg6us-dXVJqUUt68adA@mail.gmail.com>
 <20200622224920.GA4332@42.do-not-panic.com>
 <CA+G9fYsXDZUspc5OyfqrGZn=k=2uRiGzWY_aPePK2C_kZ+dYGQ@mail.gmail.com>
 <20200623064056.GA8121@gondor.apana.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200623064056.GA8121@gondor.apana.org.au>
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Tue, Jun 23, 2020 at 04:40:56PM +1000, Herbert Xu wrote:
> On Tue, Jun 23, 2020 at 11:53:43AM +0530, Naresh Kamboju wrote:
> >
> > Thanks for the investigation.
> > After reverting, two test cases got PASS out of four reported failure cases.
> >  ltp-crypto-tests:
> >      * af_alg02 - still failing - Hung and time out
> >      * af_alg05 - still failing - Hung and time out
> >   ltp-syscalls-tests:
> >      * keyctl07 - PASS
> >      * request_key03 - PASS
> > 
> > Please suggest the way to debug / fix the af_alg02 and af_alg05 failures.
> 
> Did you clear the MSG_MORE flag in the final send(2) call before
> you call recv(2)?
> 

The source code for the two failing AF_ALG tests is here:

https://github.com/linux-test-project/ltp/blob/master/testcases/kernel/crypto/af_alg02.c
https://github.com/linux-test-project/ltp/blob/master/testcases/kernel/crypto/af_alg05.c

They use read() and write(), not send() and recv().

af_alg02 uses read() to read from a "salsa20" request socket without writing
anything to it.  It is expected that this returns 0, i.e. that behaves like
encrypting an empty message.

af_alg05 uses write() to write 15 bytes to a "cbc(aes-generic)" request socket,
then read() to read 15 bytes.  It is expected that this fails with EINVAL, since
the length is not aligned to the AES block size (16 bytes).

- Eric
