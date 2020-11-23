Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD8C62C18FD
	for <lists+keyrings@lfdr.de>; Mon, 23 Nov 2020 23:59:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733308AbgKWWyN (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Mon, 23 Nov 2020 17:54:13 -0500
Received: from mail.kernel.org ([198.145.29.99]:51918 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730934AbgKWWyM (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Mon, 23 Nov 2020 17:54:12 -0500
Received: from kernel.org (83-245-197-237.elisa-laajakaista.fi [83.245.197.237])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B681C206D8;
        Mon, 23 Nov 2020 22:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606172047;
        bh=+BBk3iGC+2qwwaaHgNAESYMgTGbDRHe2BLTFvkhPgJs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=c60T0I6eeXT5yKk4DzJfhe8iWPUazZw8AvrvYXspVuviyDYwM53Uysi+mFwsKsGt6
         5JX3MPZCrapPTBIR+FHqQFJZMCBBkgOenCc1ytNKvkMlu/bo7LN27vg4AEnVzqcRJQ
         4J7vn8jUr4Iqri/LZ1v4xdXNMQhsXSe3wT9x8904=
Date:   Tue, 24 Nov 2020 00:54:02 +0200
From:   Jarkko Sakkinen <jarkko@kernel.org>
To:     "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc:     David Howells <dhowells@redhat.com>,
        James Morris <jmorris@namei.org>,
        "Serge E. Hallyn" <serge@hallyn.com>, keyrings@vger.kernel.org,
        linux-security-module@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH 052/141] security: keys: Fix fall-through warnings for
 Clang
Message-ID: <20201123225402.GB19839@kernel.org>
References: <cover.1605896059.git.gustavoars@kernel.org>
 <412e11590b667712c03c1e4d4c7573fda3a4b1cb.1605896059.git.gustavoars@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <412e11590b667712c03c1e4d4c7573fda3a4b1cb.1605896059.git.gustavoars@kernel.org>
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Fri, Nov 20, 2020 at 12:32:20PM -0600, Gustavo A. R. Silva wrote:
> In preparation to enable -Wimplicit-fallthrough for Clang, fix a warning
> by explicitly adding a break statement instead of letting the code fall
> through to the next case.
> 
> Link: https://github.com/KSPP/linux/issues/115
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
> ---
>  security/keys/process_keys.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/security/keys/process_keys.c b/security/keys/process_keys.c
> index 1fe8b934f656..e3d79a7b6db6 100644
> --- a/security/keys/process_keys.c
> +++ b/security/keys/process_keys.c
> @@ -783,6 +783,7 @@ key_ref_t lookup_user_key(key_serial_t id, unsigned long lflags,
>  				if (need_perm != KEY_AUTHTOKEN_OVERRIDE &&
>  				    need_perm != KEY_DEFER_PERM_CHECK)
>  					goto invalid_key;
> +				break;
>  			case 0:
>  				break;
>  			}
> -- 
> 2.27.0
> 
> 


Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>

/Jarkko
