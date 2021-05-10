Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A88C378DC8
	for <lists+keyrings@lfdr.de>; Mon, 10 May 2021 15:47:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241707AbhEJMxR (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Mon, 10 May 2021 08:53:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349555AbhEJMto (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Mon, 10 May 2021 08:49:44 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9EAE0C0611EE;
        Mon, 10 May 2021 05:41:48 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id t4so24356168ejo.0;
        Mon, 10 May 2021 05:41:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=rPnjj7CcDT7Ek5LVYSpFT50vZUaAaBcOH5bltoGapPU=;
        b=CiZDfhVL3JV3m6t6D4g5Uqhp1EPHsM9BxmpkK61WAUKNTXpyhV9F9eumP93Cf3JxTq
         0RdnVauyd0ECPpIgfQ6R0HryOpHX22rh5Mz1yaBizVnzg/EuHEzSa+4cCAedClMwVNLK
         ZxdAGzYSiv3BLLi+RRmP0atYiFayG2FxCm3rNuUQufGwWZ5WeIUg6jRmS14cnmj8mIX0
         ostU1vsRE3jo+VSNS1+AIIPrg/l6j/bVgIh+e3C4fc1dkpkhGdaM+OXuymzsaVeWuKXh
         12LdBtxHEP42Yz55Nxr2SMIzqRBcbbsDymJ5tv34AslUvz5Y1+nHAYs6w5aojhk3WaA8
         MPvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=rPnjj7CcDT7Ek5LVYSpFT50vZUaAaBcOH5bltoGapPU=;
        b=Swp9ybG+NZr/QCaBHtIlJREZ1D2yolD1lliWaO8cV4EZ+MSWsxIbHb0FDUneLT9k0/
         TxZqEq09TVypn4ajAhJ8JyUE7WEt9XHm4dxPrj6KlH4+TH2/TkqvPdFkETmIccqbKlTa
         yLsWwLTkxa7pI1friTeuGJyFK9yEb6d+rtYnVdRX4Nwrpi3iSLAVp41rBISmK5rFvwcd
         CVcWzNoqCiFA4Vd1roxok1pqv2w+hrZGqUP71B+9f4/bV2GWgwwYXpJoSm60VoQXrfJS
         wRpPynumNQA4GS4oYxftaY6K1+FIuK/pvJSgDw1GnGMIVPk7sPvU1SFPhftrqQ2l5Cx4
         0I9A==
X-Gm-Message-State: AOAM532SGhwKhO0je6HbtAd1t7gNZAbAU3375IjAS5sYg1UUMVpU0WS8
        1j/F35OTYCKrKSKEAm6Ppes=
X-Google-Smtp-Source: ABdhPJzK0+r8dgR2IDmFPLK8afHqKCX3W+D5qXcQhruMZDZJjTKcyr3IJKISP1z+pSvNqk5nZLbbOw==
X-Received: by 2002:a17:906:2bd0:: with SMTP id n16mr25552395ejg.110.1620650507431;
        Mon, 10 May 2021 05:41:47 -0700 (PDT)
Received: from gmail.com (0526E777.dsl.pool.telekom.hu. [5.38.231.119])
        by smtp.gmail.com with ESMTPSA id h11sm11208696eds.15.2021.05.10.05.41.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 May 2021 05:41:46 -0700 (PDT)
Sender: Ingo Molnar <mingo.kernel.org@gmail.com>
Date:   Mon, 10 May 2021 14:41:45 +0200
From:   Ingo Molnar <mingo@kernel.org>
To:     David Howells <dhowells@redhat.com>
Cc:     Valdis =?utf-8?Q?Kl=C4=93tnieks?= <valdis.kletnieks@vt.edu>,
        David Woodhouse <dwmw2@infradead.org>,
        keyrings@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: 'make O=' indigestion with module signing
Message-ID: <YJkqCZmTMRLUh+vf@gmail.com>
References: <134696.1615510534@turing-police>
 <109018.1615463088@turing-police>
 <91190.1615444370@turing-police>
 <972381.1615459754@warthog.procyon.org.uk>
 <1486567.1615464259@warthog.procyon.org.uk>
 <2026575.1615539696@warthog.procyon.org.uk>
 <20210509151112.GA839293@gmail.com>
 <20210509151556.GA842014@gmail.com>
 <20210509161914.GB839293@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210509161914.GB839293@gmail.com>
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org


* Ingo Molnar <mingo@kernel.org> wrote:

> 
> * Ingo Molnar <mingo@kernel.org> wrote:
> 
> > Correction - there appears to be something else going on, but the
> > error messages are similar:
> > 
> >   At main.c:291:
> >   - SSL error:02001002:system library:fopen:No such file or directory: ../crypto/bio/bss_file.c:69
> >   - SSL error:2006D080:BIO routines:BIO_new_file:no such file: ../crypto/bio/bss_file.c:76
> >   sign-file: debian/linux-image/lib/modules/5.12.0-custom/kernel/arch/x86/crypto/aegis128-aesni.ko: No such file or directory
> >   At main.c:291:
> > 
> > The error messages look pretty obscure to me. :-/
> 
> I didn't find any stray build files left in the tree, so 'make mrproper'
> is innocent I believe.
> 
> I ended up with the config tweak below to get the kernel package to build,
> which is not an ideal solution. :-/
> 
> Let me know if you'd like me to send you the .config and/or any diagnostic
> messages or other details.

Update: I now have a config that builds & boots fine, and I've done a 
.config bisection to figure out which config option combination breaks the 
build, which turned out to be the new MODULE_COMPRESS options:

--- .config.good.002	2021-05-10 14:34:48.932206255 +0200
+++ .config.bad.002	2021-05-10 14:40:48.587450742 +0200
@@ -899,8 +899,8 @@ CONFIG_MODULE_SIG_ALL=y
 # CONFIG_MODULE_SIG_SHA384 is not set
 CONFIG_MODULE_SIG_SHA512=y
 CONFIG_MODULE_SIG_HASH="sha512"
-CONFIG_MODULE_COMPRESS_NONE=y
-# CONFIG_MODULE_COMPRESS_GZIP is not set
+# CONFIG_MODULE_COMPRESS_NONE is not set
+CONFIG_MODULE_COMPRESS_GZIP=y
 # CONFIG_MODULE_COMPRESS_XZ is not set
 # CONFIG_MODULE_COMPRESS_ZSTD is not set
 # CONFIG_MODULE_ALLOW_MISSING_NAMESPACE_IMPORTS is not set

Setting it to gzip triggered this build bug.

Thanks,

	Ingo
