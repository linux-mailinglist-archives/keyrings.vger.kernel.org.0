Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 781C5579370
	for <lists+keyrings@lfdr.de>; Tue, 19 Jul 2022 08:49:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231158AbiGSGtR (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 19 Jul 2022 02:49:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237080AbiGSGtO (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Tue, 19 Jul 2022 02:49:14 -0400
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FB4C2B188;
        Mon, 18 Jul 2022 23:49:08 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 115E4336A3;
        Tue, 19 Jul 2022 06:49:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1658213347; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=aI5hSd3aPqVjrxDxXDtNYXynhrAAxknGQEg4S3098UE=;
        b=uEuI0vCH/Pr5EYsbyZ6uECvtxJEPS63jdAYuAM3Z1+nu7Xyi8z+NI+BE8fpEYsKzHq+RFI
        4G9JqceyC82VVPvdAJjITpkVxTBxYr+xLGeQO4/b3Ymh+6hW01tE8/x2Iv7JWZpAJS/4jK
        CBObQvqcPzjhoZOb2bTGoA5+ZyB9MGs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1658213347;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=aI5hSd3aPqVjrxDxXDtNYXynhrAAxknGQEg4S3098UE=;
        b=lAG77sIqd4/GdM4a+V130Oc+qQEMekmBWaSXEozHUEKrKCjcTlK2jdW+lUrx0/Siu40Sgh
        awZ2o3M+y0yIuMAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D797113A72;
        Tue, 19 Jul 2022 06:49:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id kby9M+JT1mJWHQAAMHmgww
        (envelope-from <hare@suse.de>); Tue, 19 Jul 2022 06:49:06 +0000
Message-ID: <019d93cd-2033-2fa7-9532-2baa226d817f@suse.de>
Date:   Tue, 19 Jul 2022 08:49:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 3/4] block: sed-opal: keyring support for SED Opal keys
Content-Language: en-US
To:     gjoyce@linux.vnet.ibm.com, linux-block@vger.kernel.org
Cc:     keyrings@vger.kernel.org, dhowells@redhat.com, jarkko@kernel.org,
        jonathan.derrick@linux.dev, brking@linux.vnet.ibm.com,
        greg@gilhooley.com, gjoyce@ibm.com
References: <20220718210156.1535955-1-gjoyce@linux.vnet.ibm.com>
 <20220718210156.1535955-4-gjoyce@linux.vnet.ibm.com>
From:   Hannes Reinecke <hare@suse.de>
In-Reply-To: <20220718210156.1535955-4-gjoyce@linux.vnet.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On 7/18/22 23:01, gjoyce@linux.vnet.ibm.com wrote:
> From: Greg Joyce <gjoyce@linux.vnet.ibm.com>
> 
> Extend the SED block driver so it can alternatively
> obtain a key from a sed-opal kernel keyring. The SED
> ioctls will indicate the source of the key, either
> directly in the ioctl data or from the keyring.
> 
> This allows the use of SED commands in scripts such as
> udev scripts so that drives may be automatically unlocked
> as they become available.
> 
> Signed-off-by: Greg Joyce <gjoyce@linux.vnet.ibm.com>
> Reported-by: kernel test robot <lkp@intel.com>
> ---
>   block/Kconfig                 |   1 +
>   block/sed-opal.c              | 198 +++++++++++++++++++++++++++++++++-
>   include/linux/sed-opal.h      |   3 +
>   include/uapi/linux/sed-opal.h |   8 +-
>   4 files changed, 206 insertions(+), 4 deletions(-)
> 
> diff --git a/block/Kconfig b/block/Kconfig
> index 50b17e260fa2..f65169e9356b 100644
> --- a/block/Kconfig
> +++ b/block/Kconfig
> @@ -182,6 +182,7 @@ config BLK_DEBUG_FS_ZONED
>   
>   config BLK_SED_OPAL
>   	bool "Logic for interfacing with Opal enabled SEDs"
> +	depends on KEYS
>   	help
>   	Builds Logic for interfacing with Opal enabled controllers.
>   	Enabling this option enables users to setup/unlock/lock
> diff --git a/block/sed-opal.c b/block/sed-opal.c
> index feba36e54ae0..4cfc3458cba5 100644
> --- a/block/sed-opal.c
> +++ b/block/sed-opal.c
> @@ -20,6 +20,10 @@
>   #include <linux/sed-opal.h>
>   #include <linux/string.h>
>   #include <linux/kdev_t.h>
> +#include <linux/key.h>
> +#include <linux/key-type.h>
> +#include <linux/arch_vars.h>
> +#include <keys/user-type.h>
>   
>   #include "opal_proto.h"
>   
> @@ -29,6 +33,8 @@
>   /* Number of bytes needed by cmd_finalize. */
>   #define CMD_FINALIZE_BYTES_NEEDED 7
>   
> +static struct key *sed_opal_keyring;
> +
>   struct opal_step {
>   	int (*fn)(struct opal_dev *dev, void *data);
>   	void *data;
> @@ -266,6 +272,107 @@ static void print_buffer(const u8 *ptr, u32 length)
>   #endif
>   }
>   
> +/*
> + * Allocate/update a SED Opal key and add it to the SED Opal keyring.
> + */
> +static int update_sed_opal_key(const char *desc, u_char *key_data, int keylen)
> +{
> +	int ret;
> +	struct key *key;
> +
> +	if (!sed_opal_keyring)
> +		return -ENOKEY;
> +
> +	key = key_alloc(&key_type_user, desc, GLOBAL_ROOT_UID, GLOBAL_ROOT_GID,
> +			current_cred(),
> +			KEY_USR_VIEW | KEY_USR_SEARCH | KEY_USR_WRITE,
> +			0,
> +			NULL);
> +	if (IS_ERR(key))
> +		return PTR_ERR(key);
> +
> +	ret = key_instantiate_and_link(key, key_data, keylen,
> +				       sed_opal_keyring, NULL);
> +	key_put(key);
> +

Maybe you should consider 'key_create_or_update() here, as it combines 
both operations.
Also the 'key_instantiate_and_link()' operation will always insert the 
key, so you might end up with key duplicates.

Cheers,

Hannes

