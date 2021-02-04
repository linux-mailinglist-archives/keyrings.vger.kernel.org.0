Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4484930F57C
	for <lists+keyrings@lfdr.de>; Thu,  4 Feb 2021 15:57:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236978AbhBDOz0 (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 4 Feb 2021 09:55:26 -0500
Received: from mail.kernel.org ([198.145.29.99]:45476 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236960AbhBDOyu (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Thu, 4 Feb 2021 09:54:50 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 222AB64F4D;
        Thu,  4 Feb 2021 14:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612450449;
        bh=F8e5Tfs+0+dMxhX3r0RE96VAf6DE6tlY4KDDXyE/GLY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ORPNu+5bXFexfQJ92eaq58Qp6ZZuITVcdddmQtQnyEO3kb8O6mxS5SEs0WqmccRih
         uF1ruXcFkZMK4rHDyGZZFdTjGFg72XTN4brEobXlD1Ujy/MeFcD3riwtMWrefFFCpC
         wRq9bO/ic6vRKFMEHfgtlgOI0xRKais6VtaXD4P2EyGGNpoT6qU/0un7xhAWVdq9gr
         gbLT/tW21jm9O46UwWBqxNy6NITZD0D9/isSckjsG7F1eXoloL3+1MXqgOSh2BO+zQ
         zLTtWHRP4wLBIrR8cOV7bTwc9LW9e6EuwjpfWNbWAr9vCkxOF+L941iQ8oi4yY4F3Z
         nNPb4Y+08sCUg==
Date:   Thu, 4 Feb 2021 16:54:01 +0200
From:   Jarkko Sakkinen <jarkko@kernel.org>
To:     Eric Snowberg <eric.snowberg@oracle.com>
Cc:     dhowells@redhat.com, dwmw2@infradead.org, keyrings@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] certs: include prototype for load_certificate_list
Message-ID: <YBwKicD1tRcDWZ17@kernel.org>
References: <20210204033208.1389901-1-eric.snowberg@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210204033208.1389901-1-eric.snowberg@oracle.com>
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Wed, Feb 03, 2021 at 10:32:08PM -0500, Eric Snowberg wrote:
> The build test robot reports the following when building
> with -Wmissing-prototypes
> 
>   int load_certificate_list(const u8 cert_list[],
>       ^
>   certs/common.c:6:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
>   int load_certificate_list(const u8 cert_list[],
>   ^
>  static
>   1 warning generated.
> 
> Fix the warning by including the header file.
> 
> Signed-off-by: Eric Snowberg <eric.snowberg@oracle.com>
> Reported-by: kernel test robot <lkp@intel.com>


Acked-by: Jarkko Sakkinen <jarkko@kernel.org>

BTW, should the bot have reported-by tagged?

/Jarkko

> ---
>  certs/common.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/certs/common.c b/certs/common.c
> index 83800f51a1a1..16a220887a53 100644
> --- a/certs/common.c
> +++ b/certs/common.c
> @@ -2,6 +2,7 @@
>  
>  #include <linux/kernel.h>
>  #include <linux/key.h>
> +#include "common.h"
>  
>  int load_certificate_list(const u8 cert_list[],
>  			  const unsigned long list_size,
> -- 
> 2.18.4
> 
> 
