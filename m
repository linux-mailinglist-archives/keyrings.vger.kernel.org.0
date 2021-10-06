Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84B37424515
	for <lists+keyrings@lfdr.de>; Wed,  6 Oct 2021 19:45:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231175AbhJFRrK (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 6 Oct 2021 13:47:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238855AbhJFRrI (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 6 Oct 2021 13:47:08 -0400
Received: from bombadil.infradead.org (unknown [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F02E0C061760;
        Wed,  6 Oct 2021 10:45:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description;
        bh=PatXNQxmOQjxiHWrwXkktLjgcdiJPD6/YOk4tIq1Pzg=; b=ErhstRH0tSja37HpQ938k4tHME
        frSD9VW21xctow2D+Tz5myTEOXImYHO5AtqjzpVZsfRExChy0v3uE0nAwhlAnN0yAmi4QyqBlQtlH
        XdHzYwhnR81Xgia1hVQqBc8eHNdfb3FgdoXW2/dbxPdNSRN5aSBLhxR/SI1bRjeo6cUmFcFVPRFjm
        iaxibuzoaaHNtola1xFZ7j2d40G6f7u4XKQwstpVrQKsFBxVxXbeyronRqM1DAOxQM8t5sts2rIWu
        al0n1ZBaG5EbiGAVXyc90b/AIB0jsXbBy3sWuXzb+KVc5k7o6sXonTEQ04985+B2tGPxWiMfej0GP
        vEA5pJuQ==;
Received: from [2601:1c0:6280:3f0::aa0b]
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1mYAya-00FF3J-1b; Wed, 06 Oct 2021 17:45:08 +0000
Subject: Re: [PATCH] crypto : asymmetric_keys: Fix function description to
 match prototype
To:     Colin King <colin.king@canonical.com>,
        David Howells <dhowells@redhat.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S . Miller" <davem@davemloft.net>, keyrings@vger.kernel.org,
        linux-crypto@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20211006172350.1025091-1-colin.king@canonical.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <6f1f6221-6628-5445-cfa9-ae4d7557d33b@infradead.org>
Date:   Wed, 6 Oct 2021 10:45:07 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211006172350.1025091-1-colin.king@canonical.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On 10/6/21 10:23 AM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The function arguments in the description does not match the prototype.
> Fix this by renaming trust_keys to trusted_keys.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>   crypto/asymmetric_keys/verify_pefile.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/crypto/asymmetric_keys/verify_pefile.c b/crypto/asymmetric_keys/verify_pefile.c
> index 7553ab18db89..148cad70fe79 100644
> --- a/crypto/asymmetric_keys/verify_pefile.c
> +++ b/crypto/asymmetric_keys/verify_pefile.c
> @@ -387,7 +387,7 @@ static int pefile_digest_pe(const void *pebuf, unsigned int pelen,
>    * verify_pefile_signature - Verify the signature on a PE binary image
>    * @pebuf: Buffer containing the PE binary image
>    * @pelen: Length of the binary image
> - * @trust_keys: Signing certificate(s) to use as starting points
> + * @trusted_keys: Signing certificate(s) to use as starting points
>    * @usage: The use to which the key is being put.
>    *
>    * Validate that the certificate chain inside the PKCS#7 message inside the PE
> 

or this one (which I have sent 2x):
https://lore.kernel.org/all/20211004001731.26240-1-rdunlap@infradead.org/

-- 
~Randy
