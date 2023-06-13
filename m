Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0615572DDD8
	for <lists+keyrings@lfdr.de>; Tue, 13 Jun 2023 11:36:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239396AbjFMJg2 (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 13 Jun 2023 05:36:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241756AbjFMJgS (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Tue, 13 Jun 2023 05:36:18 -0400
Received: from 167-179-156-38.a7b39c.syd.nbn.aussiebb.net (167-179-156-38.a7b39c.syd.nbn.aussiebb.net [167.179.156.38])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 075691BD3;
        Tue, 13 Jun 2023 02:36:03 -0700 (PDT)
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
        by formenos.hmeau.com with smtp (Exim 4.94.2 #2 (Debian))
        id 1q90RD-002LN1-Ro; Tue, 13 Jun 2023 17:35:44 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Tue, 13 Jun 2023 17:35:43 +0800
Date:   Tue, 13 Jun 2023 17:35:43 +0800
From:   Herbert Xu <herbert@gondor.apana.org.au>
To:     Linus Torvalds <torvalds@linux-foundation.org>,
        Roberto Sassu <roberto.sassu@huaweicloud.com>,
        David Howells <dhowells@redhat.com>,
        Eric Biggers <ebiggers@kernel.org>,
        Stefan Berger <stefanb@linux.ibm.com>,
        Mimi Zohar <zohar@linux.ibm.com>, dmitry.kasatkin@gmail.com,
        Jarkko Sakkinen <jarkko@kernel.org>,
        Ard Biesheuvel <ardb@kernel.org>, keyrings@vger.kernel.org,
        Linux Crypto Mailing List <linux-crypto@vger.kernel.org>
Subject: [PATCH 0/5] crypto: Add akcipher interface without SGs
Message-ID: <ZIg4b8kAeW7x/oM1@gondor.apana.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

The crypto akcipher interface has exactly one user, the keyring
subsystem.  That user only deals with kernel pointers, not SG lists.
Therefore the use of SG lists in the akcipher interface is
completely pointless.

As there is only one user, changing it isn't that hard.  This
patch series is a first step in that direction.  It introduces
a new interface for encryption and decryption without SG lists:

int crypto_akcipher_sync_encrypt(struct crypto_akcipher *tfm,
				 const void *src, unsigned int slen,
				 void *dst, unsigned int dlen);

int crypto_akcipher_sync_decrypt(struct crypto_akcipher *tfm,
				 const void *src, unsigned int slen,
				 void *dst, unsigned int dlen);

I've decided to split out signing and verification because most
(all but one) of our signature algorithms do not support encryption
or decryption.  These can now be accessed through the dsa interface:

int crypto_dsa_sign(struct crypto_dsa *tfm,
		    const void *src, unsigned int slen,
		    void *dst, unsigned int dlen);

int crypto_dsa_verify(struct crypto_dsa *tfm,
		      const void *src, unsigned int slen,
		      const void *digest, unsigned int dlen);

The keyring system has been converted to this interface.

The next step would be to convert the code within the Crypto API so
that SG lists are not used at all on the software path.  This
would eliminate the unnecessary copying that currently happens.

Thanks,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
