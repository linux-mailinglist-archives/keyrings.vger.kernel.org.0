Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6FE1532CB72
	for <lists+keyrings@lfdr.de>; Thu,  4 Mar 2021 05:40:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232920AbhCDEjE (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 3 Mar 2021 23:39:04 -0500
Received: from mail.kernel.org ([198.145.29.99]:58214 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233601AbhCDEjD (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Wed, 3 Mar 2021 23:39:03 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8EB1B64EF6;
        Thu,  4 Mar 2021 04:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614832703;
        bh=VhpGH1pQ0eQ+uq0bM0wtZiGMW7Rptxx0e6s1vM9/0qM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=CSSeT0hqSoxoii1c6CWl404vTG3F40T9e+YWoeF/KMqazNy3OKpA4n3mSoRZecYLq
         P6PetNJ97safnk5tJj5WhFQ9xElCoPQZRhhESfRB1qUHcmghajaQ/Ci52P0DrsV2vv
         WIkqGQrxidGH28/xs32h8OD1l0EUV6xTiS5olaZk9SU3urIXzBuYH8WIJYJT4i/8m1
         /BlFencs5Hj0wc5oCaeaLvYh/l4RNc7qkee5Khp0oNqwazeWw++lr0jSBBSUoZsr7w
         F+aeU4UE3K2LKvZmoBqmeP6VSLxioZPtuQc5HtM+d13TeIjhsO63CFrKObQfapfccb
         YVaFrqnO8kdaw==
Date:   Thu, 4 Mar 2021 06:38:02 +0200
From:   Jarkko Sakkinen <jarkko@kernel.org>
To:     Eric Snowberg <eric.snowberg@oracle.com>
Cc:     rdunlap@infradead.org, dhowells@redhat.com, dwmw2@infradead.org,
        keyrings@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] certs: Fix wrong kconfig option used for
 x509_revocation_list
Message-ID: <YEBkKlxZOgUxtQEm@kernel.org>
References: <20210303034418.106762-1-eric.snowberg@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210303034418.106762-1-eric.snowberg@oracle.com>
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Tue, Mar 02, 2021 at 10:44:18PM -0500, Eric Snowberg wrote:
> This fixes a build issue when x509_revocation_list is not defined.

"Fix a"

Let's stick to the imperative form in commit messages.

> 
> $ make ARCH=x86_64 O=build64 all
> 
>  EXTRACT_CERTS   ../
> At main.c:154:
> - SSL error:0909006C:PEM routines:get_name:no start line: crypto/pem/pem_lib.c:745
> extract-cert: ../: Is a directory
> make[2]: [../certs/Makefile:119: certs/x509_revocation_list] Error 1 (ignored)
> 
> When the new CONFIG_SYSTEM_REVOCATION_LIST was added [1], it was not carried
> into the code for preloading the revocation certificates [2].  Change from
> using the original CONFIG_SYSTEM_BLACKLIST_KEYRING  to the new
> CONFIG_SYSTEM_REVOCATION_LIST.
> 
> [1] https://lore.kernel.org/keyrings/EDA280F9-F72D-4181-93C7-CDBE95976FF7@oracle.com/T/#m562c1b27bf402190e7bb573ad20eff5b6310d08f
> [2] https://lore.kernel.org/keyrings/EDA280F9-F72D-4181-93C7-CDBE95976FF7@oracle.com/T/#m07e258bf019ccbac23820fad5192ceffa74fc6ab
> 
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> Signed-off-by: Eric Snowberg <eric.snowberg@oracle.com>
> ---
>  certs/Makefile    | 7 +++++--
>  certs/blacklist.c | 4 ++++
>  2 files changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/certs/Makefile b/certs/Makefile
> index e3f4926fd21e..3bc43c88a6d2 100644
> --- a/certs/Makefile
> +++ b/certs/Makefile
> @@ -4,7 +4,10 @@
>  #
>  
>  obj-$(CONFIG_SYSTEM_TRUSTED_KEYRING) += system_keyring.o system_certificates.o common.o
> -obj-$(CONFIG_SYSTEM_BLACKLIST_KEYRING) += blacklist.o revocation_certificates.o common.o
> +obj-$(CONFIG_SYSTEM_BLACKLIST_KEYRING) += blacklist.o common.o
> +ifeq ($(CONFIG_SYSTEM_REVOCATION_LIST),y)
> +obj-$(CONFIG_SYSTEM_BLACKLIST_KEYRING) += revocation_certificates.o
> +endif
>  ifneq ($(CONFIG_SYSTEM_BLACKLIST_HASH_LIST),"")
>  obj-$(CONFIG_SYSTEM_BLACKLIST_KEYRING) += blacklist_hashes.o
>  else
> @@ -105,7 +108,7 @@ $(obj)/signing_key.x509: scripts/extract-cert $(X509_DEP) FORCE
>  	$(call if_changed,extract_certs,$(MODULE_SIG_KEY_SRCPREFIX)$(CONFIG_MODULE_SIG_KEY))
>  endif # CONFIG_MODULE_SIG
>  
> -ifeq ($(CONFIG_SYSTEM_BLACKLIST_KEYRING),y)
> +ifeq ($(CONFIG_SYSTEM_REVOCATION_LIST),y)
>  
>  $(eval $(call config_filename,SYSTEM_REVOCATION_KEYS))
>  
> diff --git a/certs/blacklist.c b/certs/blacklist.c
> index 723b19c96256..c9a435b15af4 100644
> --- a/certs/blacklist.c
> +++ b/certs/blacklist.c
> @@ -21,8 +21,10 @@
>  
>  static struct key *blacklist_keyring;
>  
> +#ifdef CONFIG_SYSTEM_REVOCATION_LIST
>  extern __initconst const u8 revocation_certificate_list[];
>  extern __initconst const unsigned long revocation_certificate_list_size;
> +#endif
>  
>  /*
>   * The description must be a type prefix, a colon and then an even number of
> @@ -225,6 +227,7 @@ static int __init blacklist_init(void)
>   */
>  device_initcall(blacklist_init);
>  
> +#ifdef CONFIG_SYSTEM_REVOCATION_LIST
>  /*
>   * Load the compiled-in list of revocation X.509 certificates.
>   */
> @@ -237,3 +240,4 @@ static __init int load_revocation_certificate_list(void)
>  				     blacklist_keyring);
>  }
>  late_initcall(load_revocation_certificate_list);
> +#endif
> -- 
> 2.18.4
> 
> 

Code change looks good.

/Jarkko
