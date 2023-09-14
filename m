Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 70C357A01C1
	for <lists+keyrings@lfdr.de>; Thu, 14 Sep 2023 12:34:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237293AbjINKeJ (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 14 Sep 2023 06:34:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237290AbjINKeI (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 14 Sep 2023 06:34:08 -0400
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7556B1BEB;
        Thu, 14 Sep 2023 03:34:04 -0700 (PDT)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
        by smtp-out2.suse.de (Postfix) with ESMTP id 083171F854;
        Thu, 14 Sep 2023 10:34:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1694687643; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=fnfPmNtqKsvG7dCcr+XCTSyVIUc/H8QoYYVZgMuRg0o=;
        b=U2JitcWcgj0eXzLT+JBmc2Cxb1QMzIKNcw/Dn0Ez3gyE6BRsX4fLId+GZNdYv+fCu3DtQn
        7XHFNNWuV4eABQEXznhVaYVNc6otruFOd+yhPpnuhgOm7i4appyjgCO4Q/Fr+RixUkAH0c
        ZBD22AVrqvieKd08zBfE5zGoKXFyRb0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1694687643;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=fnfPmNtqKsvG7dCcr+XCTSyVIUc/H8QoYYVZgMuRg0o=;
        b=S7Vh8jgldkYpZbrl7QdDL5V5NPP/o3otjaLQFo/qPXXRpJcfkUHNUY7AQNn/w5yn9HlKot
        aeBhRJR06C7vgBDQ==
Received: from kitsune.suse.cz (kitsune.suse.cz [10.100.12.127])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by relay2.suse.de (Postfix) with ESMTPS id 2FB0F2C142;
        Thu, 14 Sep 2023 10:34:01 +0000 (UTC)
Date:   Thu, 14 Sep 2023 12:34:00 +0200
From:   Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To:     Michael Ellerman <mpe@ellerman.id.au>
Cc:     Nathan Chancellor <nathan@kernel.org>, gjoyce@linux.vnet.ibm.com,
        axboe@kernel.dk, nayna@linux.ibm.com, linux-block@vger.kernel.org,
        jarkko@kernel.org, keyrings@vger.kernel.org,
        jonathan.derrick@linux.dev, brking@linux.vnet.ibm.com,
        akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v7 3/3 RESEND] powerpc/pseries: PLPKS SED Opal keystore
 support
Message-ID: <20230914103400.GX8826@kitsune.suse.cz>
References: <20230908153056.3503975-1-gjoyce@linux.vnet.ibm.com>
 <20230908153056.3503975-4-gjoyce@linux.vnet.ibm.com>
 <20230913185951.GA3643621@dev-arch.thelio-3990X>
 <877cot8k9f.fsf@mail.lhotse>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <877cot8k9f.fsf@mail.lhotse>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Hello,

On Thu, Sep 14, 2023 at 02:13:32PM +1000, Michael Ellerman wrote:
> Nathan Chancellor <nathan@kernel.org> writes:
> > Hi Greg,
> >
> > On Fri, Sep 08, 2023 at 10:30:56AM -0500, gjoyce@linux.vnet.ibm.com wrote:
> >> From: Greg Joyce <gjoyce@linux.vnet.ibm.com>
> >>
> >> Define operations for SED Opal to read/write keys
> >> from POWER LPAR Platform KeyStore(PLPKS). This allows
> >> non-volatile storage of SED Opal keys.
> >>
> >> Signed-off-by: Greg Joyce <gjoyce@linux.vnet.ibm.com>
> >> Reviewed-by: Jonathan Derrick <jonathan.derrick@linux.dev>
> >> Reviewed-by: Hannes Reinecke <hare@suse.de>
> >
> > After this change in -next as commit 9f2c7411ada9 ("powerpc/pseries:
> > PLPKS SED Opal keystore support"), I see the following crash when
> > booting some distribution configurations, such as OpenSUSE's [1] (the
> > rootfs is available at [2] if necessary):
> 
> Thanks for testing Nathan.
> 
> The code needs to check plpks_is_available() somewhere, before calling
> the plpks routines.

would this fixup do it?

I don't really see any other place to plug the check with the current
code structure.

Thanks

Michal

diff --git a/arch/powerpc/platforms/pseries/plpks_sed_ops.c b/arch/powerpc/platforms/pseries/plpks_sed_ops.c
index c1d08075e850..f8038d998eae 100644
--- a/arch/powerpc/platforms/pseries/plpks_sed_ops.c
+++ b/arch/powerpc/platforms/pseries/plpks_sed_ops.c
@@ -64,6 +64,9 @@ int sed_read_key(char *keyname, char *key, u_int *keylen)
 	int ret;
 	u_int len;
 
+	if (!plpks_is_available())
+		return -ENODEV;
+
 	plpks_init_var(&var, keyname);
 	var.data = (u8 *)&data;
 	var.datalen = sizeof(data);
@@ -89,6 +92,9 @@ int sed_write_key(char *keyname, char *key, u_int keylen)
 	struct plpks_sed_object_data data;
 	struct plpks_var_name vname;
 
+	if (!plpks_is_available())
+		return -ENODEV;
+
 	plpks_init_var(&var, keyname);
 
 	var.datalen = sizeof(struct plpks_sed_object_data);
-- 
2.41.0

