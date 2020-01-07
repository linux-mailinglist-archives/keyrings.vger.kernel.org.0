Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C9026133412
	for <lists+keyrings@lfdr.de>; Tue,  7 Jan 2020 22:24:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727402AbgAGVXe (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 7 Jan 2020 16:23:34 -0500
Received: from bedivere.hansenpartnership.com ([66.63.167.143]:51488 "EHLO
        bedivere.hansenpartnership.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728521AbgAGVBR (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Tue, 7 Jan 2020 16:01:17 -0500
Received: from localhost (localhost [127.0.0.1])
        by bedivere.hansenpartnership.com (Postfix) with ESMTP id 5F18A8EE105;
        Tue,  7 Jan 2020 13:01:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=hansenpartnership.com;
        s=20151216; t=1578430876;
        bh=5nkpePHUcSUhoPkX858UIhz0z07V7G0lUgNBG3ZeUKE=;
        h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
        b=dJP4nyfSqEMdbel5HbM1+ys5w61xBuazOrWII0ss4Jjqy5OHi5dsbTf88scjxZ1MW
         ++vUvHuuRwZZMdW999ecyDAebpSRrrSbWjbHL/C6wEhZTuWt2Y0YOJuqaut0CUiotI
         xXf9zLynZpT4Y/NdswGb79UiN7KJBPXG6W8SBLf0=
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
        by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id vgHvvARI9W0c; Tue,  7 Jan 2020 13:01:16 -0800 (PST)
Received: from jarvis.lan (unknown [50.35.76.230])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id 7EE488EE0F8;
        Tue,  7 Jan 2020 13:01:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=hansenpartnership.com;
        s=20151216; t=1578430876;
        bh=5nkpePHUcSUhoPkX858UIhz0z07V7G0lUgNBG3ZeUKE=;
        h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
        b=dJP4nyfSqEMdbel5HbM1+ys5w61xBuazOrWII0ss4Jjqy5OHi5dsbTf88scjxZ1MW
         ++vUvHuuRwZZMdW999ecyDAebpSRrrSbWjbHL/C6wEhZTuWt2Y0YOJuqaut0CUiotI
         xXf9zLynZpT4Y/NdswGb79UiN7KJBPXG6W8SBLf0=
Message-ID: <1578430874.4288.2.camel@HansenPartnership.com>
Subject: Re: [PATCH] ima: make ASYMMETRIC_PUBLIC_KEY_SUBTYPE 'bool'
From:   James Bottomley <James.Bottomley@HansenPartnership.com>
To:     Arnd Bergmann <arnd@arndb.de>, David Howells <dhowells@redhat.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Lakshmi Ramasubramanian <nramas@linux.microsoft.com>,
        Mimi Zohar <zohar@linux.ibm.com>
Cc:     keyrings@vger.kernel.org, linux-crypto@vger.kernel.org,
        linux-kernel@vger.kernel.org
Date:   Tue, 07 Jan 2020 13:01:14 -0800
In-Reply-To: <20200107203041.843060-1-arnd@arndb.de>
References: <20200107203041.843060-1-arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Tue, 2020-01-07 at 21:30 +0100, Arnd Bergmann wrote:
> The asymmetric key subtype is only used by the key subsystem that
> cannot itself be a loadable module, so when
> ASYMMETRIC_PUBLIC_KEY_SUBTYPE is set to =m, it just does not get
> used. It also produces a compile-time
> warning:
> 
> WARNING: modpost: missing MODULE_LICENSE() in
> security/integrity/ima/ima_asymmetric_keys.o
> 
> Make this a 'bool' symbol to avoid both problems.
> 
> Fixes: 88e70da170e8 ("IMA: Define an IMA hook to measure keys")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  crypto/asymmetric_keys/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/crypto/asymmetric_keys/Kconfig
> b/crypto/asymmetric_keys/Kconfig
> index 1f1f004dc757..f2846293e4d5 100644
> --- a/crypto/asymmetric_keys/Kconfig
> +++ b/crypto/asymmetric_keys/Kconfig
> @@ -11,7 +11,7 @@ menuconfig ASYMMETRIC_KEY_TYPE
>  if ASYMMETRIC_KEY_TYPE
>  
>  config ASYMMETRIC_PUBLIC_KEY_SUBTYPE
> -	tristate "Asymmetric public-key crypto algorithm subtype"
> +	bool "Asymmetric public-key crypto algorithm subtype"

I believe the crypto guys do like stuff to be modular.

However, we've already implemented this solution:

https://lore.kernel.org/linux-integrity/20200107194350.3782-2-nramas@linux.microsoft.com/

To solve the problem via an intermediate boolean config variable.

James

