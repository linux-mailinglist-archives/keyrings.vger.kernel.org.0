Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA8FE29FF68
	for <lists+keyrings@lfdr.de>; Fri, 30 Oct 2020 09:08:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725875AbgJ3IIW (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Fri, 30 Oct 2020 04:08:22 -0400
Received: from mail.kernel.org ([198.145.29.99]:38084 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725355AbgJ3IIW (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Fri, 30 Oct 2020 04:08:22 -0400
Received: from kernel.org (83-245-197-237.elisa-laajakaista.fi [83.245.197.237])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7E7CF22228;
        Fri, 30 Oct 2020 08:08:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604045301;
        bh=acxrTQkHAJd6J4NM+xeR/HLxVVlvpm5kFDDF2TgWGBg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=tVJmbi1QFNYykyvuUOJpOGNO0icuPGIQpKRAE+G/AldhJTYHKNiIMlUaO7oet5qOl
         qeLV4wSNAV+13ID3Ak5mMGiaXivvt8xn8UtvCiXabOQzc6LZDVpeSn1HTDyOIwtqxW
         ydGux+as4ScLi0mix+qUKMhtS/4xgwUCSoxc3Uc8=
Date:   Fri, 30 Oct 2020 10:08:15 +0200
From:   Jarkko Sakkinen <jarkko@kernel.org>
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     David Howells <dhowells@redhat.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, keyrings@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
        Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [RESEND PATCH] KEYS: asymmetric: Fix kerneldoc
Message-ID: <20201030080815.GA51616@kernel.org>
References: <20201029154830.26997-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201029154830.26997-1-krzk@kernel.org>
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Thu, Oct 29, 2020 at 04:48:30PM +0100, Krzysztof Kozlowski wrote:
> Fix W=1 compile warnings (invalid kerneldoc):
> 
>     crypto/asymmetric_keys/asymmetric_type.c:160: warning: Function parameter or member 'kid1' not described in 'asymmetric_key_id_same'
>     crypto/asymmetric_keys/asymmetric_type.c:160: warning: Function parameter or member 'kid2' not described in 'asymmetric_key_id_same'
>     crypto/asymmetric_keys/asymmetric_type.c:160: warning: Excess function parameter 'kid_1' description in 'asymmetric_key_id_same'
>     crypto/asymmetric_keys/asymmetric_type.c:160: warning: Excess function parameter 'kid_2' description in 'asymmetric_key_id_same'
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> Acked-by: Randy Dunlap <rdunlap@infradead.org>
> ---

Reviewed-by: Jarkko Sakkinen <jarkko.sakkinen@iki.fi>

>  crypto/asymmetric_keys/asymmetric_type.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/crypto/asymmetric_keys/asymmetric_type.c b/crypto/asymmetric_keys/asymmetric_type.c
> index 33e77d846caa..ad8af3d70ac0 100644
> --- a/crypto/asymmetric_keys/asymmetric_type.c
> +++ b/crypto/asymmetric_keys/asymmetric_type.c
> @@ -152,7 +152,8 @@ EXPORT_SYMBOL_GPL(asymmetric_key_generate_id);
>  
>  /**
>   * asymmetric_key_id_same - Return true if two asymmetric keys IDs are the same.
> - * @kid_1, @kid_2: The key IDs to compare
> + * @kid1: The key ID to compare
> + * @kid2: The key ID to compare
>   */
>  bool asymmetric_key_id_same(const struct asymmetric_key_id *kid1,
>  			    const struct asymmetric_key_id *kid2)
> @@ -168,7 +169,8 @@ EXPORT_SYMBOL_GPL(asymmetric_key_id_same);
>  /**
>   * asymmetric_key_id_partial - Return true if two asymmetric keys IDs
>   * partially match
> - * @kid_1, @kid_2: The key IDs to compare
> + * @kid1: The key ID to compare
> + * @kid2: The key ID to compare
>   */
>  bool asymmetric_key_id_partial(const struct asymmetric_key_id *kid1,
>  			       const struct asymmetric_key_id *kid2)
> -- 
> 2.25.1
> 
> 

/Jarkko
