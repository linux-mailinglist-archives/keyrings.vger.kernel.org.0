Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 42B1A3F0EA6
	for <lists+keyrings@lfdr.de>; Thu, 19 Aug 2021 01:35:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234867AbhHRXfx (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 18 Aug 2021 19:35:53 -0400
Received: from helcar.hmeau.com ([216.24.177.18]:53344 "EHLO deadmen.hmeau.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234794AbhHRXfv (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Wed, 18 Aug 2021 19:35:51 -0400
Received: from gondobar.mordor.me.apana.org.au ([192.168.128.4] helo=gondobar)
        by deadmen.hmeau.com with esmtp (Exim 4.92 #5 (Debian))
        id 1mGV5P-0003eP-8C; Thu, 19 Aug 2021 07:35:07 +0800
Received: from herbert by gondobar with local (Exim 4.92)
        (envelope-from <herbert@gondor.apana.org.au>)
        id 1mGV5M-00060d-Le; Thu, 19 Aug 2021 07:35:04 +0800
Date:   Thu, 19 Aug 2021 07:35:04 +0800
From:   Herbert Xu <herbert@gondor.apana.org.au>
To:     Jarkko Sakkinen <jarkko.sakkinen@iki.fi>
Cc:     zhenwei pi <pizhenwei@bytedance.com>, dhowells@redhat.com,
        davem@davemloft.net, keyrings@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: PING: [PATCH] crypto: public_key: fix overflow during implicit
 conversion
Message-ID: <20210818233504.GA23076@gondor.apana.org.au>
References: <20210810063954.628244-1-pizhenwei@bytedance.com>
 <4dcd4254-030b-4489-d5d3-e320eb2953e7@bytedance.com>
 <74aef8a2f2331358371a87931e632287dad9af59.camel@iki.fi>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <74aef8a2f2331358371a87931e632287dad9af59.camel@iki.fi>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Wed, Aug 18, 2021 at 03:33:32PM +0300, Jarkko Sakkinen wrote:
> On Wed, 2021-08-18 at 16:33 +0800, zhenwei pi wrote:
> > PING
> 
> Please, do not top-post.
> 
> You are lacking Herbert Xu:

I think he already cc'ed me but this patch really belongs to David
Howells' tree.

Thanks,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
