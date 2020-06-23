Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C5016204A10
	for <lists+keyrings@lfdr.de>; Tue, 23 Jun 2020 08:41:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731116AbgFWGlc (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 23 Jun 2020 02:41:32 -0400
Received: from helcar.hmeau.com ([216.24.177.18]:45028 "EHLO fornost.hmeau.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730540AbgFWGlb (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Tue, 23 Jun 2020 02:41:31 -0400
Received: from gwarestrin.arnor.me.apana.org.au ([192.168.0.7])
        by fornost.hmeau.com with smtp (Exim 4.92 #5 (Debian))
        id 1jncc4-0003im-6c; Tue, 23 Jun 2020 16:40:57 +1000
Received: by gwarestrin.arnor.me.apana.org.au (sSMTP sendmail emulation); Tue, 23 Jun 2020 16:40:56 +1000
Date:   Tue, 23 Jun 2020 16:40:56 +1000
From:   Herbert Xu <herbert@gondor.apana.org.au>
To:     Naresh Kamboju <naresh.kamboju@linaro.org>
Cc:     Luis Chamberlain <mcgrof@kernel.org>,
        LTP List <ltp@lists.linux.it>,
        open list <linux-kernel@vger.kernel.org>,
        linux-security-module@vger.kernel.org, keyrings@vger.kernel.org,
        lkft-triage@lists.linaro.org, linux-crypto@vger.kernel.org,
        Jan Stancek <jstancek@redhat.com>, chrubis <chrubis@suse.cz>,
        "Serge E. Hallyn" <serge@hallyn.com>,
        James Morris <jmorris@namei.org>,
        Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
        David Howells <dhowells@redhat.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Biggers <ebiggers@google.com>
Subject: Re: LTP: crypto: af_alg02 regression on linux-next 20200621 tag
Message-ID: <20200623064056.GA8121@gondor.apana.org.au>
References: <CA+G9fYvHFs5Yx8TnT6VavtfjMN8QLPuXg6us-dXVJqUUt68adA@mail.gmail.com>
 <20200622224920.GA4332@42.do-not-panic.com>
 <CA+G9fYsXDZUspc5OyfqrGZn=k=2uRiGzWY_aPePK2C_kZ+dYGQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+G9fYsXDZUspc5OyfqrGZn=k=2uRiGzWY_aPePK2C_kZ+dYGQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Tue, Jun 23, 2020 at 11:53:43AM +0530, Naresh Kamboju wrote:
>
> Thanks for the investigation.
> After reverting, two test cases got PASS out of four reported failure cases.
>  ltp-crypto-tests:
>      * af_alg02 - still failing - Hung and time out
>      * af_alg05 - still failing - Hung and time out
>   ltp-syscalls-tests:
>      * keyctl07 - PASS
>      * request_key03 - PASS
> 
> Please suggest the way to debug / fix the af_alg02 and af_alg05 failures.

Did you clear the MSG_MORE flag in the final send(2) call before
you call recv(2)?

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
