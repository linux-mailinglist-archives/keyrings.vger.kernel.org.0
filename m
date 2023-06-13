Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C128772E35B
	for <lists+keyrings@lfdr.de>; Tue, 13 Jun 2023 14:51:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234648AbjFMMvE (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 13 Jun 2023 08:51:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242460AbjFMMvA (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Tue, 13 Jun 2023 08:51:00 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52E2BE4
        for <keyrings@vger.kernel.org>; Tue, 13 Jun 2023 05:50:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1686660614;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=20Lf5295TWtm62Iju1bXn1VBh8WPuMBDvoGA4YjEjKU=;
        b=DYBHyYktIo5DFZNltQ2Th0AoiSwRrCLMjnDuZ9ZJM0Rumw735pqm4PRSj2xoyswUvfnSkl
        rmh221X90KlS8FjA1a7uTIOW98zjo4GrYCG4Rvdpah6qFvFUER1bxDY/nJhAC0jQYNgzxT
        mNlci8hRVOgzTad6UUamTngapDCN0ow=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-529-fwNeCGTiPHqfbGFZQwuqag-1; Tue, 13 Jun 2023 08:50:11 -0400
X-MC-Unique: fwNeCGTiPHqfbGFZQwuqag-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BB21985A5A8;
        Tue, 13 Jun 2023 12:50:10 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.42.28.67])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 93B5E1121318;
        Tue, 13 Jun 2023 12:50:06 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
        Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
        Kingdom.
        Registered in England and Wales under Company Registration No. 3798903
From:   David Howells <dhowells@redhat.com>
In-Reply-To: <E1q90Tf-002LR5-F7@formenos.hmeau.com>
References: <E1q90Tf-002LR5-F7@formenos.hmeau.com> <ZIg4b8kAeW7x/oM1@gondor.apana.org.au>
To:     "Herbert Xu" <herbert@gondor.apana.org.au>
Cc:     dhowells@redhat.com,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Roberto Sassu <roberto.sassu@huaweicloud.com>,
        Eric Biggers <ebiggers@kernel.org>,
        Stefan Berger <stefanb@linux.ibm.com>,
        Mimi Zohar <zohar@linux.ibm.com>, dmitry.kasatkin@gmail.com,
        Jarkko Sakkinen <jarkko@kernel.org>,
        Ard Biesheuvel <ardb@kernel.org>, keyrings@vger.kernel.org,
        Linux Crypto Mailing List <linux-crypto@vger.kernel.org>
Subject: Re: [PATCH 4/5] KEYS: asymmetric: Move sm2 code into x509_public_key
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <570723.1686660603.1@warthog.procyon.org.uk>
Date:   Tue, 13 Jun 2023 13:50:03 +0100
Message-ID: <570724.1686660603@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Herbert Xu <herbert@gondor.apana.org.au> wrote:

> +#include <crypto/hash.h>
> +#include <crypto/sm2.h>
> +#include <keys/asymmetric-parser.h>
> +#include <keys/asymmetric-subtype.h>
> +#include <keys/system_keyring.h>
>  #include <linux/module.h>
>  #include <linux/kernel.h>
>  #include <linux/slab.h>
> -#include <keys/asymmetric-subtype.h>
> -#include <keys/asymmetric-parser.h>
> -#include <keys/system_keyring.h>
> -#include <crypto/hash.h>
> +#include <linux/string.h>

Why rearrage the order?  Why not leave the linux/ headers first?  Then the
keys/ and then the crypto/.

> +	if (strcmp(cert->pub->pkey_algo, "sm2") == 0) {
> +		ret = strcmp(sig->hash_algo, "sm3") != 0 ? -EINVAL :
> +		      crypto_shash_init(desc) ?:
> +		      sm2_compute_z_digest(desc, cert->pub->key,
> +					   cert->pub->keylen, sig->digest) ?:
> +		      crypto_shash_init(desc) ?:
> +		      crypto_shash_update(desc, sig->digest,
> +					  sig->digest_size) ?:
> +		      crypto_shash_finup(desc, cert->tbs, cert->tbs_size,
> +					 sig->digest);

Ewww...  That's really quite hard to comprehend at a glance. :-)

Should sm2_compute_z_digest() be something accessible through the crypto hooks
rather than being called directly?

> +	} else

"} else {" please.

> +		ret = crypto_shash_digest(desc, cert->tbs, cert->tbs_size,
> +					  sig->digest);
> +

David

