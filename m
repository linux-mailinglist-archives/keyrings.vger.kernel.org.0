Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62A52377788
	for <lists+keyrings@lfdr.de>; Sun,  9 May 2021 18:19:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229815AbhEIQUW (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Sun, 9 May 2021 12:20:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229675AbhEIQUW (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Sun, 9 May 2021 12:20:22 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1983C061573;
        Sun,  9 May 2021 09:19:18 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id g14so15918462edy.6;
        Sun, 09 May 2021 09:19:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=DO5zOhliRnBqxM33iMyfdyDpj+YfVYcGobHK6sCAbck=;
        b=jH1aCNgdimaE/ftmf59J0k25Wp+5ldYJcgVWEASelAo4kw2rsrf4LNEetjvxUnwEmj
         DVdjp/gX3REnGP3TT64893sYCurxVwkHm5FAinZv2wc8tiOuZFKfPuZFzzDpBfNxIYzH
         XDkATEg1EFLw/Bi1rnUEPy52P3VLAI+njai1I8G/S7J+VRBLyzCQfFcgfN2/6xI1RO2m
         4ofe5ScEMdYUrVAd24uoIFXgLKTZgkkypFtG60QPNR6JlTfqCx4n69VKH6pmgy5sSh5V
         teFIlXsnwyHd+urzFEQ1/1g0GdN2Ao8QnczzShGWjt6ZPBMPfANSphXoa7WJIXVsuPj9
         07lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=DO5zOhliRnBqxM33iMyfdyDpj+YfVYcGobHK6sCAbck=;
        b=OTtfFuAWKU6MHPNNST8/yYd77Egy3oJqnE+rCNsG1Maah3t6bwbtHZTyBsrAhaEDEb
         jdPaaae4d3umIXoqbITP3V4U4WxjUdi4i26TV9LnYKs9LcHlM6QfEKcv7LiIvifq+Pcv
         Ftm0WuO/eekRo1RjFX2DiRIJBOdxp7oOPCc+woQkSTh306bAkxDeZGUP5RueIwW8Ph5m
         BBwnaIPq8Sr9NGQaVwaTJzE5FOgQU9OVvIjGRELZprLsY4AhpDt90juFbeKnFPPYyrZC
         9qYDXkP6n2WIn/v6MBP5Jb+MmGdFyFl8jWH3P1wChRMXDXSLc+JioXbiSPHLErJvReqn
         7QSw==
X-Gm-Message-State: AOAM5332xWDkWXOSR0Y5r4lj6cjzXyB8Twl3hi7ghIuURoJ6bpuQoGti
        OhFrog2+DaHKT/T1m0cU3Iw=
X-Google-Smtp-Source: ABdhPJzIMRzJ5t0YFk3VzbCAOTLHIvvzaKZF4miCRQhE+HrtaEEJ+wBMh8+JcJWcFD10u6K+F+AX0g==
X-Received: by 2002:a05:6402:16db:: with SMTP id r27mr23673341edx.375.1620577156694;
        Sun, 09 May 2021 09:19:16 -0700 (PDT)
Received: from gmail.com (0526E777.dsl.pool.telekom.hu. [5.38.231.119])
        by smtp.gmail.com with ESMTPSA id j1sm7082457ejv.40.2021.05.09.09.19.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 May 2021 09:19:16 -0700 (PDT)
Sender: Ingo Molnar <mingo.kernel.org@gmail.com>
Date:   Sun, 9 May 2021 18:19:14 +0200
From:   Ingo Molnar <mingo@kernel.org>
To:     David Howells <dhowells@redhat.com>
Cc:     Valdis =?utf-8?Q?Kl=C4=93tnieks?= <valdis.kletnieks@vt.edu>,
        David Woodhouse <dwmw2@infradead.org>,
        keyrings@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: 'make O=' indigestion with module signing
Message-ID: <20210509161914.GB839293@gmail.com>
References: <134696.1615510534@turing-police>
 <109018.1615463088@turing-police>
 <91190.1615444370@turing-police>
 <972381.1615459754@warthog.procyon.org.uk>
 <1486567.1615464259@warthog.procyon.org.uk>
 <2026575.1615539696@warthog.procyon.org.uk>
 <20210509151112.GA839293@gmail.com>
 <20210509151556.GA842014@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210509151556.GA842014@gmail.com>
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org


* Ingo Molnar <mingo@kernel.org> wrote:

> Correction - there appears to be something else going on, but the
> error messages are similar:
> 
>   At main.c:291:
>   - SSL error:02001002:system library:fopen:No such file or directory: ../crypto/bio/bss_file.c:69
>   - SSL error:2006D080:BIO routines:BIO_new_file:no such file: ../crypto/bio/bss_file.c:76
>   sign-file: debian/linux-image/lib/modules/5.12.0-custom/kernel/arch/x86/crypto/aegis128-aesni.ko: No such file or directory
>   At main.c:291:
> 
> The error messages look pretty obscure to me. :-/

I didn't find any stray build files left in the tree, so 'make mrproper'
is innocent I believe.

I ended up with the config tweak below to get the kernel package to build,
which is not an ideal solution. :-/

Let me know if you'd like me to send you the .config and/or any diagnostic
messages or other details.

Thanks,

	Ingo

diff --git a/.config.kepler.ubuntu b/.config.kepler.ubuntu
index 01347a220e54..846a956fcdbd 100644
--- a/.config.kepler.ubuntu
+++ b/.config.kepler.ubuntu
@@ -880,9 +880,8 @@ CONFIG_MODULE_UNLOAD=y
 # CONFIG_MODULE_FORCE_UNLOAD is not set
 # CONFIG_MODVERSIONS is not set
 CONFIG_MODULE_SRCVERSION_ALL=y
-CONFIG_MODULE_SIG=y
-# CONFIG_MODULE_SIG_FORCE is not set
-CONFIG_MODULE_SIG_ALL=y
+# CONFIG_MODULE_SIG is not set
+# CONFIG_MODULE_SIG_ALL is not set
 # CONFIG_MODULE_SIG_SHA1 is not set
 # CONFIG_MODULE_SIG_SHA224 is not set
 # CONFIG_MODULE_SIG_SHA256 is not set
@@ -10177,11 +10176,7 @@ CONFIG_SECURITY_APPARMOR_HASH_DEFAULT=y
 # CONFIG_SECURITY_LOADPIN is not set
 CONFIG_SECURITY_YAMA=y
 CONFIG_SECURITY_SAFESETID=y
-CONFIG_SECURITY_LOCKDOWN_LSM=y
-CONFIG_SECURITY_LOCKDOWN_LSM_EARLY=y
-CONFIG_LOCK_DOWN_KERNEL_FORCE_NONE=y
-# CONFIG_LOCK_DOWN_KERNEL_FORCE_INTEGRITY is not set
-# CONFIG_LOCK_DOWN_KERNEL_FORCE_CONFIDENTIALITY is not set
+# CONFIG_SECURITY_LOCKDOWN_LSM is not set
 # CONFIG_SECURITY_LANDLOCK is not set
 CONFIG_INTEGRITY=y
 CONFIG_INTEGRITY_SIGNATURE=y

