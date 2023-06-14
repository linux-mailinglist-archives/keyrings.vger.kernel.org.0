Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6FC4772FA2F
	for <lists+keyrings@lfdr.de>; Wed, 14 Jun 2023 12:12:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235734AbjFNKMy (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 14 Jun 2023 06:12:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234949AbjFNKMx (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 14 Jun 2023 06:12:53 -0400
Received: from 167-179-156-38.a7b39c.syd.nbn.aussiebb.net (167-179-156-38.a7b39c.syd.nbn.aussiebb.net [167.179.156.38])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 215C3E5;
        Wed, 14 Jun 2023 03:12:52 -0700 (PDT)
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
        by formenos.hmeau.com with smtp (Exim 4.94.2 #2 (Debian))
        id 1q9NUO-002pFU-DZ; Wed, 14 Jun 2023 18:12:33 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Wed, 14 Jun 2023 18:12:32 +0800
Date:   Wed, 14 Jun 2023 18:12:32 +0800
From:   Herbert Xu <herbert@gondor.apana.org.au>
To:     David Howells <dhowells@redhat.com>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Roberto Sassu <roberto.sassu@huaweicloud.com>,
        Eric Biggers <ebiggers@kernel.org>,
        Stefan Berger <stefanb@linux.ibm.com>,
        Mimi Zohar <zohar@linux.ibm.com>, dmitry.kasatkin@gmail.com,
        Jarkko Sakkinen <jarkko@kernel.org>,
        Ard Biesheuvel <ardb@kernel.org>, keyrings@vger.kernel.org,
        Linux Crypto Mailing List <linux-crypto@vger.kernel.org>
Subject: Re: [PATCH 4/5] KEYS: asymmetric: Move sm2 code into x509_public_key
Message-ID: <ZImSkCrn8Xgiy72w@gondor.apana.org.au>
References: <E1q90Tf-002LR5-F7@formenos.hmeau.com>
 <ZIg4b8kAeW7x/oM1@gondor.apana.org.au>
 <570724.1686660603@warthog.procyon.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <570724.1686660603@warthog.procyon.org.uk>
X-Spam-Status: No, score=2.7 required=5.0 tests=BAYES_00,HELO_DYNAMIC_IPADDR2,
        PDS_RDNS_DYNAMIC_FP,RDNS_DYNAMIC,SPF_HELO_NONE,SPF_PASS,TVD_RCVD_IP,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Tue, Jun 13, 2023 at 01:50:03PM +0100, David Howells wrote:
> Herbert Xu <herbert@gondor.apana.org.au> wrote:
> 
> > +#include <crypto/hash.h>
> > +#include <crypto/sm2.h>
> > +#include <keys/asymmetric-parser.h>
> > +#include <keys/asymmetric-subtype.h>
> > +#include <keys/system_keyring.h>
> >  #include <linux/module.h>
> >  #include <linux/kernel.h>
> >  #include <linux/slab.h>
> > -#include <keys/asymmetric-subtype.h>
> > -#include <keys/asymmetric-parser.h>
> > -#include <keys/system_keyring.h>
> > -#include <crypto/hash.h>
> > +#include <linux/string.h>
> 
> Why rearrage the order?  Why not leave the linux/ headers first?  Then the
> keys/ and then the crypto/.

The standard under the crypto directory is that header files are
sorted alphabetically.

> > +	if (strcmp(cert->pub->pkey_algo, "sm2") == 0) {
> > +		ret = strcmp(sig->hash_algo, "sm3") != 0 ? -EINVAL :
> > +		      crypto_shash_init(desc) ?:
> > +		      sm2_compute_z_digest(desc, cert->pub->key,
> > +					   cert->pub->keylen, sig->digest) ?:
> > +		      crypto_shash_init(desc) ?:
> > +		      crypto_shash_update(desc, sig->digest,
> > +					  sig->digest_size) ?:
> > +		      crypto_shash_finup(desc, cert->tbs, cert->tbs_size,
> > +					 sig->digest);
> 
> Ewww...  That's really quite hard to comprehend at a glance. :-)
> 
> Should sm2_compute_z_digest() be something accessible through the crypto hooks
> rather than being called directly?

Yes that would be lovely but I don't have anything concrete to
offer as this is the only algorithm that requires it.

> 
> > +	} else
> 
> "} else {" please.

OK.

Thanks,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
