Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5957D291FCD
	for <lists+keyrings@lfdr.de>; Sun, 18 Oct 2020 22:25:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727464AbgJRUZ3 (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Sun, 18 Oct 2020 16:25:29 -0400
Received: from mail.kernel.org ([198.145.29.99]:56110 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726422AbgJRUZ3 (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Sun, 18 Oct 2020 16:25:29 -0400
Received: from localhost (83-245-197-237.elisa-laajakaista.fi [83.245.197.237])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D9C0C22269;
        Sun, 18 Oct 2020 20:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603052728;
        bh=Dze6LNzD3UHLop9G1pwa2x8sh0NZKVh5h/EpVwZ8fnU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=JZBrnBAvhaf57oiquWvKS0JaiWhSWXWGC/ndR0fwCPzI4IVYDq32LHGSbj+cgbCsX
         yg1sGicoWhDL3c2ZtvkmXMkkq5emGJ8tEsvnX1JzK/3y6VPu8V89u2Q4+sIye/DQU8
         35PZrPU4MvfewtxhcKA+f04j3SpA4+sM0p8f12DA=
Date:   Sun, 18 Oct 2020 23:25:26 +0300
From:   Jarkko Sakkinen <jarkko@kernel.org>
To:     Andrew Zaborowski <andrew.zaborowski@intel.com>
Cc:     keyrings@vger.kernel.org, dhowells@redhat.com
Subject: Re: [RESEND][PATCH] keys: Update comment for
 restrict_link_by_key_or_keyring_chain
Message-ID: <20201018202526.GB574776@kapsi.fi>
References: <20201013133939.1182462-1-andrew.zaborowski@intel.com>
 <20201013133939.1182462-2-andrew.zaborowski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201013133939.1182462-2-andrew.zaborowski@intel.com>
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Tue, Oct 13, 2020 at 03:39:39PM +0200, Andrew Zaborowski wrote:
> Add the bit of information that makes
> restrict_link_by_key_or_keyring_chain different from
> restrict_link_by_key_or_keyring to the inline docs comment.
> 
> Signed-off-by: Andrew Zaborowski <andrew.zaborowski@intel.com>


Acked-by: Jarkko Sakkinen <jarkko@kernel.org>

> ---
>  crypto/asymmetric_keys/restrict.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/crypto/asymmetric_keys/restrict.c b/crypto/asymmetric_keys/restrict.c
> index 77ebebada29..84cefe3b358 100644
> --- a/crypto/asymmetric_keys/restrict.c
> +++ b/crypto/asymmetric_keys/restrict.c
> @@ -244,9 +244,10 @@ int restrict_link_by_key_or_keyring(struct key *dest_keyring,
>   * @payload: The payload of the new key.
>   * @trusted: A key or ring of keys that can be used to vouch for the new cert.
>   *
> - * Check the new certificate only against the key or keys passed in the data
> - * parameter. If one of those is the signing key and validates the new
> - * certificate, then mark the new certificate as being ok to link.
> + * Check the new certificate against the key or keys passed in the data
> + * parameter and against the keys already linked to the destination keyring. If
> + * one of those is the signing key and validates the new certificate, then mark
> + * the new certificate as being ok to link.
>   *
>   * Returns 0 if the new certificate was accepted, -ENOKEY if we
>   * couldn't find a matching parent certificate in the trusted list,
> -- 
> 2.20.1
> 
> 

/Jarkko
