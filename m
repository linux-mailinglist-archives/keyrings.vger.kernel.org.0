Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5871249F395
	for <lists+keyrings@lfdr.de>; Fri, 28 Jan 2022 07:26:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346443AbiA1G0x (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Fri, 28 Jan 2022 01:26:53 -0500
Received: from helcar.hmeau.com ([216.24.177.18]:60612 "EHLO fornost.hmeau.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S242551AbiA1G0w (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Fri, 28 Jan 2022 01:26:52 -0500
Received: from gwarestrin.arnor.me.apana.org.au ([192.168.103.7])
        by fornost.hmeau.com with smtp (Exim 4.92 #5 (Debian))
        id 1nDKif-0001Bn-RF; Fri, 28 Jan 2022 17:26:50 +1100
Received: by gwarestrin.arnor.me.apana.org.au (sSMTP sendmail emulation); Fri, 28 Jan 2022 17:26:49 +1100
Date:   Fri, 28 Jan 2022 17:26:49 +1100
From:   Herbert Xu <herbert@gondor.apana.org.au>
To:     Eric Biggers <ebiggers@kernel.org>
Cc:     linux-crypto@vger.kernel.org, keyrings@vger.kernel.org,
        Vitaly Chikunov <vt@altlinux.org>,
        Denis Kenzior <denkenz@gmail.com>
Subject: Re: [PATCH v2 0/5] crypto: rsa-pkcs1pad fixes
Message-ID: <YfOMqSlJhNhpDa6S@gondor.apana.org.au>
References: <20220119001306.85355-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220119001306.85355-1-ebiggers@kernel.org>
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Tue, Jan 18, 2022 at 04:13:01PM -0800, Eric Biggers wrote:
> This series fixes some bugs in rsa-pkcs1pad.
> 
> Changed v1 => v2:
>    - Added patch "crypto: rsa-pkcs1pad - only allow with rsa"
>      (previously was a standalone patch)
>    - Added patch "crypto: rsa-pkcs1pad - restore signature length check"
> 
> Eric Biggers (5):
>   crypto: rsa-pkcs1pad - only allow with rsa
>   crypto: rsa-pkcs1pad - correctly get hash from source scatterlist
>   crypto: rsa-pkcs1pad - restore signature length check
>   crypto: rsa-pkcs1pad - fix buffer overread in
>     pkcs1pad_verify_complete()
>   crypto: rsa-pkcs1pad - use clearer variable names
> 
>  crypto/rsa-pkcs1pad.c | 38 +++++++++++++++++++++++---------------
>  1 file changed, 23 insertions(+), 15 deletions(-)

All applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
