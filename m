Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EA4FE77F04A
	for <lists+keyrings@lfdr.de>; Thu, 17 Aug 2023 07:45:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234847AbjHQFo6 (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 17 Aug 2023 01:44:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348161AbjHQFoq (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 17 Aug 2023 01:44:46 -0400
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F11D1990;
        Wed, 16 Aug 2023 22:44:45 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 2AC5821878;
        Thu, 17 Aug 2023 05:44:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1692251084; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=tUKGMJHxXThW+3CxRiXsATA8bvSBSHPOFoANBWJuN9Q=;
        b=UCvGdQzsBZEbkjNeDAja+z1ZA2aDEyTKpJoDKTgvVV7+2v+0Q2YXlmfOD/mHBP3aFJVz4x
        qHWlXUTwUYr3T+O7VcPzga9ChATa9skJVhC6CmkIoj2ZytmW/g28p/HJvWGBrSOKSE1D7H
        Pn2Rz5ZLK1cud5CJTPi88DCKt19t9wg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1692251084;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=tUKGMJHxXThW+3CxRiXsATA8bvSBSHPOFoANBWJuN9Q=;
        b=AJujbMB8qI8cURpl8NQ6c7h3lvshK7hrYGPcQRYO/mvY0UMMbQ2shaIebCgcKynLJ4MKHN
        O5tAdKjtmYlgWqCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C809E13909;
        Thu, 17 Aug 2023 05:44:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id ibzoL8uz3WTnCAAAMHmgww
        (envelope-from <hare@suse.de>); Thu, 17 Aug 2023 05:44:43 +0000
Message-ID: <0b2c4f7e-5fca-5a32-a169-f01624c0d03a@suse.de>
Date:   Thu, 17 Aug 2023 07:44:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v7 2/3 RESEND] block: sed-opal: keystore access for SED
 Opal keys
Content-Language: en-US
To:     gjoyce@linux.vnet.ibm.com, linux-block@vger.kernel.org
Cc:     linuxppc-dev@lists.ozlabs.org, jonathan.derrick@linux.dev,
        brking@linux.vnet.ibm.com, msuchanek@suse.de, mpe@ellerman.id.au,
        nayna@linux.ibm.com, axboe@kernel.dk, akpm@linux-foundation.org,
        keyrings@vger.kernel.org, okozina@redhat.com, dkeefe@redhat.com
References: <20230721211949.3437598-1-gjoyce@linux.vnet.ibm.com>
 <20230721211949.3437598-3-gjoyce@linux.vnet.ibm.com>
From:   Hannes Reinecke <hare@suse.de>
In-Reply-To: <20230721211949.3437598-3-gjoyce@linux.vnet.ibm.com>
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
> Allow for permanent SED authentication keys by
> reading/writing to the SED Opal non-volatile keystore.
> 
> Signed-off-by: Greg Joyce <gjoyce@linux.vnet.ibm.com>
> Reviewed-by: Jonathan Derrick <jonathan.derrick@linux.dev>
> ---
>   block/sed-opal.c | 18 ++++++++++++++++--
>   1 file changed, 16 insertions(+), 2 deletions(-)
> 
> diff --git a/block/sed-opal.c b/block/sed-opal.c
> index 6d7f25d1711b..fa23a6a60485 100644
> --- a/block/sed-opal.c
> +++ b/block/sed-opal.c
> @@ -18,6 +18,7 @@
>   #include <linux/uaccess.h>
>   #include <uapi/linux/sed-opal.h>
>   #include <linux/sed-opal.h>
> +#include <linux/sed-opal-key.h>
>   #include <linux/string.h>
>   #include <linux/kdev_t.h>
>   #include <linux/key.h>
> @@ -3019,7 +3020,13 @@ static int opal_set_new_pw(struct opal_dev *dev, struct opal_new_pw *opal_pw)
>   	if (ret)
>   		return ret;
>   
> -	/* update keyring with new password */
> +	/* update keyring and key store with new password */
> +	ret = sed_write_key(OPAL_AUTH_KEY,
> +			    opal_pw->new_user_pw.opal_key.key,
> +			    opal_pw->new_user_pw.opal_key.key_len);
> +	if (ret != -EOPNOTSUPP)
> +		pr_warn("error updating SED key: %d\n", ret);
> +
>   	ret = update_sed_opal_key(OPAL_AUTH_KEY,
>   				  opal_pw->new_user_pw.opal_key.key,
>   				  opal_pw->new_user_pw.opal_key.key_len);
> @@ -3292,6 +3299,8 @@ EXPORT_SYMBOL_GPL(sed_ioctl);
>   static int __init sed_opal_init(void)
>   {
>   	struct key *kr;
> +	char init_sed_key[OPAL_KEY_MAX];
> +	int keylen = OPAL_KEY_MAX - 1;
>   
>   	kr = keyring_alloc(".sed_opal",
>   			   GLOBAL_ROOT_UID, GLOBAL_ROOT_GID, current_cred(),
> @@ -3304,6 +3313,11 @@ static int __init sed_opal_init(void)
>   
>   	sed_opal_keyring = kr;
>   
> -	return 0;
> +	if (sed_read_key(OPAL_AUTH_KEY, init_sed_key, &keylen) < 0) {
> +		memset(init_sed_key, '\0', sizeof(init_sed_key));
> +		keylen = OPAL_KEY_MAX - 1;
> +	}
> +
> +	return update_sed_opal_key(OPAL_AUTH_KEY, init_sed_key, keylen);
>   }
>   late_initcall(sed_opal_init);

See the previous patch for comments about 'struct key'.

Cheers,

Hannes
-- 
Dr. Hannes Reinecke                Kernel Storage Architect
hare@suse.de                              +49 911 74053 688
SUSE Software Solutions GmbH, Maxfeldstr. 5, 90409 Nürnberg
HRB 36809 (AG Nürnberg), Geschäftsführer: Ivo Totev, Andrew
Myers, Andrew McDonald, Martje Boudien Moerman

