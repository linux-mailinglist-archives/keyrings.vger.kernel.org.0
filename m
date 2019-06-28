Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 143985927F
	for <lists+keyrings@lfdr.de>; Fri, 28 Jun 2019 06:20:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726725AbfF1EUA (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Fri, 28 Jun 2019 00:20:00 -0400
Received: from helcar.hmeau.com ([216.24.177.18]:55980 "EHLO deadmen.hmeau.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725770AbfF1EUA (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Fri, 28 Jun 2019 00:20:00 -0400
Received: from gondobar.mordor.me.apana.org.au ([192.168.128.4] helo=gondobar)
        by deadmen.hmeau.com with esmtps (Exim 4.89 #2 (Debian))
        id 1hgiMZ-0004xR-NQ; Fri, 28 Jun 2019 12:19:51 +0800
Received: from herbert by gondobar with local (Exim 4.89)
        (envelope-from <herbert@gondor.apana.org.au>)
        id 1hgiMW-00026O-LU; Fri, 28 Jun 2019 12:19:48 +0800
Date:   Fri, 28 Jun 2019 12:19:48 +0800
From:   Herbert Xu <herbert@gondor.apana.org.au>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     David Howells <dhowells@redhat.com>,
        "David S. Miller" <davem@davemloft.net>,
        Marcel Holtmann <marcel@holtmann.org>,
        Denis Kenzior <denkenz@gmail.com>,
        James Morris <james.morris@microsoft.com>,
        keyrings@vger.kernel.org, linux-crypto@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] crypto: asymmetric_keys - select CRYPTO_HASH where needed
Message-ID: <20190628041948.b3nxdepx4gvoauh3@gondor.apana.org.au>
References: <20190618121400.4016776-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190618121400.4016776-1-arnd@arndb.de>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Tue, Jun 18, 2019 at 02:13:47PM +0200, Arnd Bergmann wrote:
> Build testing with some core crypto options disabled revealed
> a few modules that are missing CRYPTO_HASH:
> 
> crypto/asymmetric_keys/x509_public_key.o: In function `x509_get_sig_params':
> x509_public_key.c:(.text+0x4c7): undefined reference to `crypto_alloc_shash'
> x509_public_key.c:(.text+0x5e5): undefined reference to `crypto_shash_digest'
> crypto/asymmetric_keys/pkcs7_verify.o: In function `pkcs7_digest.isra.0':
> pkcs7_verify.c:(.text+0xab): undefined reference to `crypto_alloc_shash'
> pkcs7_verify.c:(.text+0x1b2): undefined reference to `crypto_shash_digest'
> pkcs7_verify.c:(.text+0x3c1): undefined reference to `crypto_shash_update'
> pkcs7_verify.c:(.text+0x411): undefined reference to `crypto_shash_finup'
> 
> This normally doesn't show up in randconfig tests because there is
> a large number of other options that select CRYPTO_HASH.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  crypto/asymmetric_keys/Kconfig | 3 +++
>  1 file changed, 3 insertions(+)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
