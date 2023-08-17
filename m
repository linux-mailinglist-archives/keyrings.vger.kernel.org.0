Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6C23C77F044
	for <lists+keyrings@lfdr.de>; Thu, 17 Aug 2023 07:43:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348091AbjHQFms (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 17 Aug 2023 01:42:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348110AbjHQFmp (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 17 Aug 2023 01:42:45 -0400
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 650892102;
        Wed, 16 Aug 2023 22:42:44 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id EB659210EF;
        Thu, 17 Aug 2023 05:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1692250962; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=liRF8HJWfr2GCPGrsQuJHQ0WUAD5uk+6soFRjC17E/A=;
        b=VdfJycnq3vD0MBj15s7gh2HIQtk8tvyt0EyAQi/1WW6hWHDdR1tir0/tfJJXtFOmEpeAZ5
        qt+xlq9+XMiyastiUmLjjHgaF07F604Uq/BlaG0ks3uU0ZANSqumbC1Mnnsb+Hfqn4QSy6
        LG99zJjxf5R021ZDe0+ZLCd+lb295zw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1692250962;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=liRF8HJWfr2GCPGrsQuJHQ0WUAD5uk+6soFRjC17E/A=;
        b=KNikNAR7yCIMQTMxMqvLZOTwm5ArDlW/C0BZmyZq694kNm2Yy0Rh0c4KCnhVg8UpEoZ+Fr
        sOY69/aGfheLHdCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9623313909;
        Thu, 17 Aug 2023 05:42:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id 9VzyIVKz3WQmCAAAMHmgww
        (envelope-from <hare@suse.de>); Thu, 17 Aug 2023 05:42:42 +0000
Message-ID: <997311ee-a63b-75ea-dedc-78ed2f90b322@suse.de>
Date:   Thu, 17 Aug 2023 07:42:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v7 1/3 RESEND] block:sed-opal: SED Opal keystore
Content-Language: en-US
To:     gjoyce@linux.vnet.ibm.com, linux-block@vger.kernel.org
Cc:     linuxppc-dev@lists.ozlabs.org, jonathan.derrick@linux.dev,
        brking@linux.vnet.ibm.com, msuchanek@suse.de, mpe@ellerman.id.au,
        nayna@linux.ibm.com, axboe@kernel.dk, akpm@linux-foundation.org,
        keyrings@vger.kernel.org, okozina@redhat.com, dkeefe@redhat.com
References: <20230721211949.3437598-1-gjoyce@linux.vnet.ibm.com>
 <20230721211949.3437598-2-gjoyce@linux.vnet.ibm.com>
From:   Hannes Reinecke <hare@suse.de>
In-Reply-To: <20230721211949.3437598-2-gjoyce@linux.vnet.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-5.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On 7/21/23 23:19, gjoyce@linux.vnet.ibm.com wrote:
> From: Greg Joyce <gjoyce@linux.vnet.ibm.com>
> 
> Add read and write functions that allow SED Opal keys to stored
> in a permanent keystore.
> 
Probably state that these are dummy functions only.

> Signed-off-by: Greg Joyce <gjoyce@linux.vnet.ibm.com>
> Reviewed-by: Jonathan Derrick <jonathan.derrick@linux.dev>
> ---
>   block/Makefile               |  2 +-
>   block/sed-opal-key.c         | 24 ++++++++++++++++++++++++
>   include/linux/sed-opal-key.h | 15 +++++++++++++++
>   3 files changed, 40 insertions(+), 1 deletion(-)
>   create mode 100644 block/sed-opal-key.c
>   create mode 100644 include/linux/sed-opal-key.h
> 
> diff --git a/block/Makefile b/block/Makefile
> index 46ada9dc8bbf..ea07d80402a6 100644
> --- a/block/Makefile
> +++ b/block/Makefile
> @@ -34,7 +34,7 @@ obj-$(CONFIG_BLK_DEV_ZONED)	+= blk-zoned.o
>   obj-$(CONFIG_BLK_WBT)		+= blk-wbt.o
>   obj-$(CONFIG_BLK_DEBUG_FS)	+= blk-mq-debugfs.o
>   obj-$(CONFIG_BLK_DEBUG_FS_ZONED)+= blk-mq-debugfs-zoned.o
> -obj-$(CONFIG_BLK_SED_OPAL)	+= sed-opal.o
> +obj-$(CONFIG_BLK_SED_OPAL)	+= sed-opal.o sed-opal-key.o
>   obj-$(CONFIG_BLK_PM)		+= blk-pm.o
>   obj-$(CONFIG_BLK_INLINE_ENCRYPTION)	+= blk-crypto.o blk-crypto-profile.o \
>   					   blk-crypto-sysfs.o
> diff --git a/block/sed-opal-key.c b/block/sed-opal-key.c
> new file mode 100644
> index 000000000000..16f380164c44
> --- /dev/null
> +++ b/block/sed-opal-key.c
> @@ -0,0 +1,24 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * SED key operations.
> + *
> + * Copyright (C) 2022 IBM Corporation
> + *
> + * These are the accessor functions (read/write) for SED Opal
> + * keys. Specific keystores can provide overrides.
> + *
> + */
> +
> +#include <linux/kernel.h>
> +#include <linux/errno.h>
> +#include <linux/sed-opal-key.h>
> +
> +int __weak sed_read_key(char *keyname, char *key, u_int *keylen)
> +{
> +	return -EOPNOTSUPP;
> +}
> +
> +int __weak sed_write_key(char *keyname, char *key, u_int keylen)
> +{
> +	return -EOPNOTSUPP;
> +}

Hmm. We do have security/keys, which is using a 'struct key' for
their operations.
Why don't you leverage that structure?

Cheers,

Hannes
-- 
Dr. Hannes Reinecke                Kernel Storage Architect
hare@suse.de                              +49 911 74053 688
SUSE Software Solutions GmbH, Maxfeldstr. 5, 90409 Nürnberg
HRB 36809 (AG Nürnberg), Geschäftsführer: Ivo Totev, Andrew
Myers, Andrew McDonald, Martje Boudien Moerman

