Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8BE8642450A
	for <lists+keyrings@lfdr.de>; Wed,  6 Oct 2021 19:42:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239630AbhJFRoa (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 6 Oct 2021 13:44:30 -0400
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:38909 "EHLO
        out3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S239592AbhJFRne (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 6 Oct 2021 13:43:34 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailout.nyi.internal (Postfix) with ESMTP id 509905C02D5;
        Wed,  6 Oct 2021 13:41:40 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Wed, 06 Oct 2021 13:41:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=benboeckel.net;
         h=date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm3; bh=B6xWX/HPA7qmLqQfhnZa5DC/rvu
        bRmsOYtvzs98jPQ4=; b=L0BKwOc/tpyqm1qr1+H6St1SdWnZVB9IP4g8q6Y84qO
        EQ55ZIEwqLVUIrAcJLKJ4vMc0vBdOOEGn4JQ9u5VfdGTmeJu/w8vEiN5Q9nDk/8i
        QETqoX/p/PNRXL0Mi+k/HsukVYLXDkqKb7ZDZjM7eF9lX1b3vhnsUyXH+cUSq/MA
        eo32YpUw+bZ0egj0rH722YYfnKDl1rM8PlGAIbXLj/kL5jOIovTgb9H62yP78MhW
        KjNtYQF11Xj6jVkq5ve6MwNfK17ERPqQ/wcnpTpTtUswwzUsKl9wytTj9hzpH/FF
        0kbJe5/eQC2Lpu14uY4NqBlgXZ13YlTspGxUHA+H5qw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=B6xWX/
        HPA7qmLqQfhnZa5DC/rvubRmsOYtvzs98jPQ4=; b=c6M64nB5Kiuc794NiPxomo
        Qs47be7wmUBoF++Q7EOpUUBQ0oHlzD0VqEbSVQkA+UUTKQM83gLfR9h85o433Dmm
        wP2Zeqh/JCdznsx6nNkMVPgzSsvqtvAmvVNGdWiheDWI4tUBSfajJAVz6XgIV7+M
        IWsjQfbGYM+Yls7RHpdZZxBSBxVDcLP4Rjm3ZlezAS0tXitDVgfw+aUFH1lHTOnc
        KG5WtPqASuq9kpvOecXa04JASMfwu1GnEqQw+72Wcg+dhIp4ij8NWjXb2prWO2c4
        A9GoTM4QpGDgPJkjVmAEKtNFvdg3osyc4LiQLVC3JsK3oBzbfpwKcja+R7FbWgCw
        ==
X-ME-Sender: <xms:099dYR0dbVQErfaJpiZeX-kudrqG5K1fJ9kdRxuEJfUdNTI3sET_Rw>
    <xme:099dYYGPTz-k-zwkrKfGYHHWqaTwAiwv_tN85iayAXML-WODqNZHgvWDKM2V_0Rpb
    g9wi5x4GQp-LvffnBg>
X-ME-Received: <xmr:099dYR5YGpBImKoVjF1liux9ufiFVG9iZwwTPbnH1ao10837eSRlkdMIxYY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudeliedguddufecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvuffkfhggtggujggfsehttdertddtreejnecuhfhrohhmpeeuvghn
    uceuohgvtghkvghluceomhgvsegsvghnsghovggtkhgvlhdrnhgvtheqnecuggftrfgrth
    htvghrnhepvefftdettefgtddtkeeufeegtddttdeuueegkeegteffueetffejudeihefh
    kedtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
    gvsegsvghnsghovggtkhgvlhdrnhgvth
X-ME-Proxy: <xmx:099dYe3k7YqA-AdY0mCY16Nyr3hRqHDFVERUCH2m2C6BwRuWDGArhw>
    <xmx:099dYUErt6_yARxolgdvDYuAc1_wyZYLCHPww1N9GSNCtdfP6NQg7g>
    <xmx:099dYf9srCDJwzrNUYjRo37uODpHzDDIcJtBmPWqrkQwpxv46Ju7oA>
    <xmx:1N9dYf37LwuyEZNqc1ut80QDNQig96xBiG0ewGdayfQI4p6nOI8oQg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 6 Oct 2021 13:41:39 -0400 (EDT)
Date:   Wed, 6 Oct 2021 13:41:38 -0400
From:   Ben Boeckel <me@benboeckel.net>
To:     Colin King <colin.king@canonical.com>
Cc:     David Howells <dhowells@redhat.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S . Miller" <davem@davemloft.net>, keyrings@vger.kernel.org,
        linux-crypto@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH] crypto : asymmetric_keys: Fix function description to
 match prototype
Message-ID: <YV3f0gTu/epdCX/E@erythro.dev.benboeckel.internal>
References: <20211006172350.1025091-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20211006172350.1025091-1-colin.king@canonical.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Wed, Oct 06, 2021 at 18:23:50 +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The function arguments in the description does not match the prototype.
> Fix this by renaming trust_keys to trusted_keys.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  crypto/asymmetric_keys/verify_pefile.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/crypto/asymmetric_keys/verify_pefile.c b/crypto/asymmetric_keys/verify_pefile.c
> index 7553ab18db89..148cad70fe79 100644
> --- a/crypto/asymmetric_keys/verify_pefile.c
> +++ b/crypto/asymmetric_keys/verify_pefile.c
> @@ -387,7 +387,7 @@ static int pefile_digest_pe(const void *pebuf, unsigned int pelen,
>   * verify_pefile_signature - Verify the signature on a PE binary image
>   * @pebuf: Buffer containing the PE binary image
>   * @pelen: Length of the binary image
> - * @trust_keys: Signing certificate(s) to use as starting points
> + * @trusted_keys: Signing certificate(s) to use as starting points
>   * @usage: The use to which the key is being put.
>   *
>   * Validate that the certificate chain inside the PKCS#7 message inside the PE

FYI, this was submitted earlier this week with Message-Id:

    20211004001731.26240-1-rdunlap@infradead.org

which also fixes the `Return:` notation for the return value docs.

--Ben
