Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 77D8433483B
	for <lists+keyrings@lfdr.de>; Wed, 10 Mar 2021 20:44:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233181AbhCJToG (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 10 Mar 2021 14:44:06 -0500
Received: from mail.kernel.org ([198.145.29.99]:50674 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232806AbhCJTny (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Wed, 10 Mar 2021 14:43:54 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1FB7F64F3D;
        Wed, 10 Mar 2021 19:43:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615405434;
        bh=ubvLUY7+JfTguf2TCs5/s1VFffPz+sfkHrcfPRu9w38=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=c5TwV7Y3CQnWQJQDwVpA1UHGL7nmpxmR7vUvGfly+UXgI3gxs2nyFS/y7UA/ZPprQ
         sP/DDEVeSdeceOy3rd9ppXtVOlkhtKKDYZYL5F4tkj6UR683Lpw+CVUh8Iq6TfdkTk
         fU5XjIEBxC94WILvFhcHnYG+f/yFx2RomtY7RJMUqwkTWxnKgP3UQM3PT/o6k2r//T
         9DiDs6gBPRhruoOt7C8F1N417zwSbCIdy7iBt45xlC7WHfCCVuPgv/7AP9YPEFUaOk
         zYPyXX4sh1+PQMpuzggQeBfsDVn91yUjzq21M0GT0Zb0xjMu+sc1a6wIlzcorYPRf3
         NKOwm8k/dAS/w==
Date:   Wed, 10 Mar 2021 21:43:30 +0200
From:   Jarkko Sakkinen <jarkko@kernel.org>
To:     Eric Snowberg <eric.snowberg@oracle.com>
Cc:     rdunlap@infradead.org, dhowells@redhat.com, nathan@kernel.org,
        dwmw2@infradead.org, keyrings@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] certs: Fix wrong kconfig option used for
 x509_revocation_list
Message-ID: <YEkhYtQD68Qy/gcA@kernel.org>
References: <20210304175030.184131-1-eric.snowberg@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210304175030.184131-1-eric.snowberg@oracle.com>
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Thu, Mar 04, 2021 at 12:50:30PM -0500, Eric Snowberg wrote:
> Fix a build issue when x509_revocation_list is not defined.
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

Got my first ever chance to try out b4:

$ b4 am 20210304175030.184131-1-eric.snowberg@oracle.com
Looking up https://lore.kernel.org/r/20210304175030.184131-1-eric.snowberg%40oracle.com
Grabbing thread from lore.kernel.org/keyrings
Analyzing 5 messages in the thread
---
Writing ./v2_20210304_eric_snowberg_certs_fix_wrong_kconfig_option_used_for_x509_revocation_list.mbx
  ✓ [PATCH v2] certs: Fix wrong kconfig option used for x509_revocation_list
    + Tested-by: Nathan Chancellor <nathan@kernel.org> (✓ DKIM/kernel.org)
  ---
  ✓ Attestation-by: DKIM/oracle.com (From: eric.snowberg@oracle.com)
---
Total patches: 1
---
 Link: https://lore.kernel.org/r/20210304175030.184131-1-eric.snowberg@oracle.com
 Base: not found
       git am ./v2_20210304_eric_snowberg_certs_fix_wrong_kconfig_option_used_for_x509_revocation_list.mbx

Wondering tho, what "Base: not found" means?

> ---
> v2 changes:
>   Use the new config option for extract-cert
>   Use the new config option when building revocation_certificates.o
> ---
>  certs/Makefile    | 5 +++--
>  certs/blacklist.c | 4 ++++
>  scripts/Makefile  | 2 +-
>  3 files changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/certs/Makefile b/certs/Makefile
> index e3f4926fd21e..b6db52ebf0be 100644
> --- a/certs/Makefile
> +++ b/certs/Makefile
> @@ -4,7 +4,8 @@
>  #
>  
>  obj-$(CONFIG_SYSTEM_TRUSTED_KEYRING) += system_keyring.o system_certificates.o common.o
> -obj-$(CONFIG_SYSTEM_BLACKLIST_KEYRING) += blacklist.o revocation_certificates.o common.o
> +obj-$(CONFIG_SYSTEM_BLACKLIST_KEYRING) += blacklist.o common.o
> +obj-$(CONFIG_SYSTEM_REVOCATION_LIST) += revocation_certificates.o
>  ifneq ($(CONFIG_SYSTEM_BLACKLIST_HASH_LIST),"")
>  obj-$(CONFIG_SYSTEM_BLACKLIST_KEYRING) += blacklist_hashes.o
>  else
> @@ -105,7 +106,7 @@ $(obj)/signing_key.x509: scripts/extract-cert $(X509_DEP) FORCE
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
> diff --git a/scripts/Makefile b/scripts/Makefile
> index 983b785f13cb..bd0718f7c493 100644
> --- a/scripts/Makefile
> +++ b/scripts/Makefile
> @@ -11,7 +11,7 @@ hostprogs-always-$(CONFIG_ASN1)				+= asn1_compiler
>  hostprogs-always-$(CONFIG_MODULE_SIG_FORMAT)		+= sign-file
>  hostprogs-always-$(CONFIG_SYSTEM_TRUSTED_KEYRING)	+= extract-cert
>  hostprogs-always-$(CONFIG_SYSTEM_EXTRA_CERTIFICATE)	+= insert-sys-cert
> - hostprogs-always-$(CONFIG_SYSTEM_BLACKLIST_KEYRING)	+= extract-cert
> +hostprogs-always-$(CONFIG_SYSTEM_REVOCATION_LIST)	+= extract-cert
>  
>  HOSTCFLAGS_sorttable.o = -I$(srctree)/tools/include
>  HOSTCFLAGS_asn1_compiler.o = -I$(srctree)/include
> -- 
> 2.18.4
> 
> 
The patch does not apply:

$ git am -3 v2_20210304_eric_snowberg_certs_fix_wrong_kconfig_option_used_for_x509_revocation_list.mbx
Applying: certs: Fix wrong kconfig option used for x509_revocation_list
error: sha1 information is lacking or useless (certs/Makefile).
error: could not build fake ancestor
Patch failed at 0001 certs: Fix wrong kconfig option used for x509_revocation_list
hint: Use 'git am --show-current-patch=diff' to see the failed patch
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".

/Jarkko
