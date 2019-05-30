Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A55B12FC31
	for <lists+keyrings@lfdr.de>; Thu, 30 May 2019 15:23:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726469AbfE3NWy (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 30 May 2019 09:22:54 -0400
Received: from helcar.hmeau.com ([216.24.177.18]:37842 "EHLO deadmen.hmeau.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726320AbfE3NWy (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Thu, 30 May 2019 09:22:54 -0400
Received: from gondobar.mordor.me.apana.org.au ([192.168.128.4] helo=gondobar)
        by deadmen.hmeau.com with esmtps (Exim 4.89 #2 (Debian))
        id 1hWL1A-000584-MK; Thu, 30 May 2019 21:22:52 +0800
Received: from herbert by gondobar with local (Exim 4.89)
        (envelope-from <herbert@gondor.apana.org.au>)
        id 1hWL18-0003W9-AH; Thu, 30 May 2019 21:22:50 +0800
Date:   Thu, 30 May 2019 21:22:50 +0800
From:   Herbert Xu <herbert@gondor.apana.org.au>
To:     Ondrej Mosnacek <omosnace@redhat.com>
Cc:     linux-crypto@vger.kernel.org, keyrings@vger.kernel.org,
        David Howells <dhowells@redhat.com>,
        Stephan Mueller <smueller@chronox.de>,
        Milan Broz <gmazyland@gmail.com>,
        Ondrej Kozina <okozina@redhat.com>,
        Daniel Zatovic <dzatovic@redhat.com>
Subject: Re: [PATCH] crypto: af_alg - implement keyring support
Message-ID: <20190530132250.gsbpj3ay4ah4ojw2@gondor.apana.org.au>
References: <20190521100034.9651-1-omosnace@redhat.com>
 <20190530071400.jpadh2fjjaqzyw6m@gondor.apana.org.au>
 <CAFqZXNt0NP090oKtF3Zsq4bvvZ7peH8YNBa-9hiqk_AAXgc0kQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFqZXNt0NP090oKtF3Zsq4bvvZ7peH8YNBa-9hiqk_AAXgc0kQ@mail.gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Thu, May 30, 2019 at 01:35:06PM +0200, Ondrej Mosnacek wrote:
>
> Because libkcapi already assumes these values [1] and has code that
> uses them. Reserving will allow existing builds of libkcapi to work
> correctly once the functionality actually lands in the kernel (if that
> ever happens). Of course, it is libkcapi's fault to assume values for
> these symbols (in released code) before they are commited in the
> kernel, but it seemed easier to just add them along with this patch
> rather than creating a confusing situation.
> 
> [1] https://github.com/smuellerDD/libkcapi/blob/master/lib/internal.h#L54

OK but please just leave a gap (or a comment) rather than actually
adding these reserved symbols to the kernel.

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
