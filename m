Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C6EF32C359
	for <lists+keyrings@lfdr.de>; Thu,  4 Mar 2021 01:07:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236777AbhCCX74 (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 3 Mar 2021 18:59:56 -0500
Received: from mail.kernel.org ([198.145.29.99]:55217 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235729AbhCCSWG (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Wed, 3 Mar 2021 13:22:06 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4469C60295;
        Wed,  3 Mar 2021 18:11:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614795086;
        bh=JFreicAS3kHza1sZEPHAWrMrSGHusltAns/J69KXcT8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=maGIUbKpXP7ECKXOzOoIXooEr2OWZSa407UoqMLlrH4Rsqix9sEqdUEnGsXpRMEdM
         eYkeAVL22TkW9jJRyilv9irGH8rf1hU5iP2NVfhgELSgDR0mm4a+mCZMH40PyGZgTQ
         hx5UROe9Bl6+xIJWCH5dKkZ41GrNICAP3g/GqxllbrjiN600/4dlzK8Mj9OWpGhOKG
         +6eyk+zNmKaRezour52JuUKQLqljOfnR95cgRNwq14lzpsta1b5qF8dlrbg/ZhikrR
         +UnJ5mxcyCTDFUtK6j5FlzZCm9+Wcv5YA0Y6aYV2JL6TJfCuXMPs7zcy3pVr8avgxG
         UiNOzlZCAU7rw==
Date:   Wed, 3 Mar 2021 11:11:21 -0700
From:   Nathan Chancellor <nathan@kernel.org>
To:     David Howells <dhowells@redhat.com>
Cc:     Eric Snowberg <eric.snowberg@oracle.com>,
        Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
        Jarkko Sakkinen <jarkko@kernel.org>,
        =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>,
        keyrings@vger.kernel.org, linux-security-module@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] certs: Add ability to preload revocation certs
Message-ID: <20210303181121.ii7ofii65lh337ln@archlinux-ax161>
References: <161428671215.677100.6372209948022011988.stgit@warthog.procyon.org.uk>
 <161428673564.677100.4112098280028451629.stgit@warthog.procyon.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <161428673564.677100.4112098280028451629.stgit@warthog.procyon.org.uk>
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Thu, Feb 25, 2021 at 08:58:55PM +0000, David Howells wrote:
> From: Eric Snowberg <eric.snowberg@oracle.com>
> 
> Add a new Kconfig option called SYSTEM_REVOCATION_KEYS. If set,
> this option should be the filename of a PEM-formated file containing
> X.509 certificates to be included in the default blacklist keyring.
> 
> [DH: Changed this to make the new Kconfig option depend on the option to
> enable the facility.]
> 
> Signed-off-by: Eric Snowberg <eric.snowberg@oracle.com>
> Acked-by: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
> Signed-off-by: David Howells <dhowells@redhat.com>
> Link: https://lore.kernel.org/r/20200930201508.35113-3-eric.snowberg@oracle.com/
> Link: https://lore.kernel.org/r/20210122181054.32635-4-eric.snowberg@oracle.com/ # v5
> ---
> 
>  certs/Kconfig                   |    8 ++++++++
>  certs/Makefile                  |   18 ++++++++++++++++--
>  certs/blacklist.c               |   17 +++++++++++++++++
>  certs/revocation_certificates.S |   21 +++++++++++++++++++++
>  scripts/Makefile                |    1 +
>  5 files changed, 63 insertions(+), 2 deletions(-)
>  create mode 100644 certs/revocation_certificates.S
> 
> diff --git a/certs/Kconfig b/certs/Kconfig
> index 76e469b56a77..ab88d2a7f3c7 100644
> --- a/certs/Kconfig
> +++ b/certs/Kconfig
> @@ -92,4 +92,12 @@ config SYSTEM_REVOCATION_LIST
>  	  blacklist keyring and implements a hook whereby a PKCS#7 message can
>  	  be checked to see if it matches such a certificate.
>  
> +config SYSTEM_REVOCATION_KEYS
> +	string "X.509 certificates to be preloaded into the system blacklist keyring"
> +	depends on SYSTEM_REVOCATION_LIST
> +	help
> +	  If set, this option should be the filename of a PEM-formatted file
> +	  containing X.509 certificates to be included in the default blacklist
> +	  keyring.
> +
>  endmenu
> diff --git a/certs/Makefile b/certs/Makefile
> index f4b90bad8690..e3f4926fd21e 100644
> --- a/certs/Makefile
> +++ b/certs/Makefile
> @@ -4,7 +4,7 @@
>  #
>  
>  obj-$(CONFIG_SYSTEM_TRUSTED_KEYRING) += system_keyring.o system_certificates.o common.o
> -obj-$(CONFIG_SYSTEM_BLACKLIST_KEYRING) += blacklist.o
> +obj-$(CONFIG_SYSTEM_BLACKLIST_KEYRING) += blacklist.o revocation_certificates.o common.o
>  ifneq ($(CONFIG_SYSTEM_BLACKLIST_HASH_LIST),"")
>  obj-$(CONFIG_SYSTEM_BLACKLIST_KEYRING) += blacklist_hashes.o
>  else
> @@ -29,7 +29,7 @@ $(obj)/x509_certificate_list: scripts/extract-cert $(SYSTEM_TRUSTED_KEYS_SRCPREF
>  	$(call if_changed,extract_certs,$(SYSTEM_TRUSTED_KEYS_SRCPREFIX)$(CONFIG_SYSTEM_TRUSTED_KEYS))
>  endif # CONFIG_SYSTEM_TRUSTED_KEYRING
>  
> -clean-files := x509_certificate_list .x509.list
> +clean-files := x509_certificate_list .x509.list x509_revocation_list
>  
>  ifeq ($(CONFIG_MODULE_SIG),y)
>  ###############################################################################
> @@ -104,3 +104,17 @@ targets += signing_key.x509
>  $(obj)/signing_key.x509: scripts/extract-cert $(X509_DEP) FORCE
>  	$(call if_changed,extract_certs,$(MODULE_SIG_KEY_SRCPREFIX)$(CONFIG_MODULE_SIG_KEY))
>  endif # CONFIG_MODULE_SIG
> +
> +ifeq ($(CONFIG_SYSTEM_BLACKLIST_KEYRING),y)
> +
> +$(eval $(call config_filename,SYSTEM_REVOCATION_KEYS))
> +
> +$(obj)/revocation_certificates.o: $(obj)/x509_revocation_list
> +
> +quiet_cmd_extract_certs  = EXTRACT_CERTS   $(patsubst "%",%,$(2))
> +      cmd_extract_certs  = scripts/extract-cert $(2) $@
> +
> +targets += x509_revocation_list
> +$(obj)/x509_revocation_list: scripts/extract-cert $(SYSTEM_REVOCATION_KEYS_SRCPREFIX)$(SYSTEM_REVOCATION_KEYS_FILENAME) FORCE
> +	$(call if_changed,extract_certs,$(SYSTEM_REVOCATION_KEYS_SRCPREFIX)$(CONFIG_SYSTEM_REVOCATION_KEYS))
> +endif
> diff --git a/certs/blacklist.c b/certs/blacklist.c
> index 2b8644123d5f..723b19c96256 100644
> --- a/certs/blacklist.c
> +++ b/certs/blacklist.c
> @@ -17,9 +17,13 @@
>  #include <linux/uidgid.h>
>  #include <keys/system_keyring.h>
>  #include "blacklist.h"
> +#include "common.h"
>  
>  static struct key *blacklist_keyring;
>  
> +extern __initconst const u8 revocation_certificate_list[];
> +extern __initconst const unsigned long revocation_certificate_list_size;
> +
>  /*
>   * The description must be a type prefix, a colon and then an even number of
>   * hex digits.  The hash is kept in the description.
> @@ -220,3 +224,16 @@ static int __init blacklist_init(void)
>   * Must be initialised before we try and load the keys into the keyring.
>   */
>  device_initcall(blacklist_init);
> +
> +/*
> + * Load the compiled-in list of revocation X.509 certificates.
> + */
> +static __init int load_revocation_certificate_list(void)
> +{
> +	if (revocation_certificate_list_size)
> +		pr_notice("Loading compiled-in revocation X.509 certificates\n");
> +
> +	return load_certificate_list(revocation_certificate_list, revocation_certificate_list_size,
> +				     blacklist_keyring);
> +}
> +late_initcall(load_revocation_certificate_list);
> diff --git a/certs/revocation_certificates.S b/certs/revocation_certificates.S
> new file mode 100644
> index 000000000000..f21aae8a8f0e
> --- /dev/null
> +++ b/certs/revocation_certificates.S
> @@ -0,0 +1,21 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#include <linux/export.h>
> +#include <linux/init.h>
> +
> +	__INITRODATA
> +
> +	.align 8
> +	.globl revocation_certificate_list
> +revocation_certificate_list:
> +__revocation_list_start:
> +	.incbin "certs/x509_revocation_list"
> +__revocation_list_end:
> +
> +	.align 8
> +	.globl revocation_certificate_list_size
> +revocation_certificate_list_size:
> +#ifdef CONFIG_64BIT
> +	.quad __revocation_list_end - __revocation_list_start
> +#else
> +	.long __revocation_list_end - __revocation_list_start
> +#endif
> diff --git a/scripts/Makefile b/scripts/Makefile
> index b5418ec587fb..983b785f13cb 100644
> --- a/scripts/Makefile
> +++ b/scripts/Makefile
> @@ -11,6 +11,7 @@ hostprogs-always-$(CONFIG_ASN1)				+= asn1_compiler
>  hostprogs-always-$(CONFIG_MODULE_SIG_FORMAT)		+= sign-file
>  hostprogs-always-$(CONFIG_SYSTEM_TRUSTED_KEYRING)	+= extract-cert
>  hostprogs-always-$(CONFIG_SYSTEM_EXTRA_CERTIFICATE)	+= insert-sys-cert
> + hostprogs-always-$(CONFIG_SYSTEM_BLACKLIST_KEYRING)	+= extract-cert
>  
>  HOSTCFLAGS_sorttable.o = -I$(srctree)/tools/include
>  HOSTCFLAGS_asn1_compiler.o = -I$(srctree)/include
> 
> 

This patch is broken when CONFIG_SYSTEM_BLACKLIST_KEYRING is set but
CONFIG_SYSTEM_REVOCATION_LIST is unset, meaning that
CONFIG_SYSTEM_REVOCATION_KEYS is not defined at all. This is very easy
to reproduce with x86_64_defconfig.

$ make -skj"$(nproc)" O=build/x86_64 defconfig

$ scripts/config --file build/x86_64/.config -e SYSTEM_BLACKLIST_KEYRING

$ make -skj"$(nproc)" O=build/x86_64 olddefconfig certs/
At main.c:154:
- SSL error:0909006C:PEM routines:get_name:no start line: crypto/pem/pem_lib.c:745
extract-cert: /home/nathan/cbl/src/linux-next/: Is a directory
make[3]: *** [/home/nathan/cbl/src/linux-next/certs/Makefile:119: certs/x509_revocation_list] Error 1
...

This happens with every single distribution configuration that I test.

Cheers,
Nathan
