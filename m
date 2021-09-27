Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC3C3419FCD
	for <lists+keyrings@lfdr.de>; Mon, 27 Sep 2021 22:08:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236839AbhI0UKU (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Mon, 27 Sep 2021 16:10:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236833AbhI0UKT (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Mon, 27 Sep 2021 16:10:19 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35D7AC061740
        for <keyrings@vger.kernel.org>; Mon, 27 Sep 2021 13:08:41 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id t8so54054524wrq.4
        for <keyrings@vger.kernel.org>; Mon, 27 Sep 2021 13:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rammhold-de.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=8OFukCSNsOqIkW6SWnwpDKuo/92QdnVzoodLvdMZQ1s=;
        b=F7h1wVBRwn/HWEG43TcL5JNhRFRAwjMac81f0d4v9ms7SidGU8VtzSyURz1zQAKrFg
         tdjSG/Uj006dC589FB7In1GxoYBm1NWRWxmlNWugFXmej04thXob5cEoukZv1ZGDQGwJ
         nABGmmLTt3hmpbXiL7GKqkjDqJ0IVnPHRqTVpVpehnPZo+wSRZ3Xsj9Rz+LM9u/OPDgN
         uoNt8ek3gr5b91ZbbveHSuXKANiGVhzwfmORuSeK9tvxVOQnqtCaqLz5/cgAzr1f+aj6
         h1i4PwNqIFPg4iNpk65AuAyKBSYTeiRpcrsuLIMsI2LDP23siIyc7HiMw0e9UcYVX1sP
         W6BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=8OFukCSNsOqIkW6SWnwpDKuo/92QdnVzoodLvdMZQ1s=;
        b=Zu0XlYEFWqoJDxK9dvf/PO6+GwbC4m9Bn25QFJSsaCMc2vvh/YBRNRqyBTcGQ7yb/8
         XmWGd/p2Sy2xTc5clkcF039pmojQOAtZc0JrRTnrocHBYDtKlWayDuNSZmEAjfxz3460
         uAtdwLwj39NunMC2HdkQ5sH5WuSqc7J2cZPwOGLaW1XyKZXx3XPM9cC3IuzkPCwaU5gJ
         qB/lpShlc4SPdmJu19a5E7Gtkt+B9pYQk15zivLqeql+8mN44HEadWWFzAjAQXHolk/B
         BG4Uge29tkQ671siCcFQzq0aNxK/0NKIuyadA4Cv8LirWjQ1x0BS/Zj/fqqZxpHg3G3u
         sxDw==
X-Gm-Message-State: AOAM530TXwn+CLuBS/IV7ix25JONCsRvOuw/mQw/Y0gJqF5tTKEHUUAP
        ngw2qEXUZtogQXHypBFhMFD12Q==
X-Google-Smtp-Source: ABdhPJzMbrnIoHvW2UzmzCwpMNQLKia0ly0WBKk1dzjdgLSz+tX7SF3zljMJ/K39ANmOM3PeaIJt4A==
X-Received: by 2002:adf:e101:: with SMTP id t1mr2003768wrz.395.1632773319706;
        Mon, 27 Sep 2021 13:08:39 -0700 (PDT)
Received: from localhost ([2a00:e67:5c9:a:6d7b:fc0:e9e9:7254])
        by smtp.gmail.com with ESMTPSA id n14sm465252wmc.38.2021.09.27.13.08.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Sep 2021 13:08:39 -0700 (PDT)
Date:   Mon, 27 Sep 2021 22:08:35 +0200
From:   Andreas Rammhold <andreas@rammhold.de>
To:     Mimi Zohar <zohar@linux.ibm.com>
Cc:     Andreas Rammhold <andreas@rammhold.de>,
        Ahmad Fatoum <a.fatoum@pengutronix.de>,
        James Bottomley <jejb@linux.ibm.com>,
        Jarkko Sakkinen <jarkko@kernel.org>,
        David Howells <dhowells@redhat.com>,
        James Morris <jmorris@namei.org>,
        "Serge E. Hallyn" <serge@hallyn.com>,
        Sumit Garg <sumit.garg@linaro.org>,
        linux-integrity@vger.kernel.org, keyrings@vger.kernel.org,
        linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] KEYS: trusted: Fix trusted key backends when building
 as module
Message-ID: <20210927200835.wvazk73cek3t5tkf@wrt>
References: <20210730012822.3460913-1-andreas@rammhold.de>
 <0d42a11a-0117-49a9-d2c9-bc6cc405235d@pengutronix.de>
 <20210927085104.vq42feghtaqiv6ni@wrt>
 <856359f263575f01d0ce2fcf8f042321f750b38c.camel@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <856359f263575f01d0ce2fcf8f042321f750b38c.camel@linux.ibm.com>
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On 07:27 27.09.21, Mimi Zohar wrote:
> On Mon, 2021-09-27 at 10:51 +0200, Andreas Rammhold wrote:
> > On 09:47 13.09.21, Ahmad Fatoum wrote:
> > > Dear trusted key maintainers,
> > > 
> > > On 30.07.21 03:28, Andreas Rammhold wrote:
> > > > Before this commit the kernel could end up with no trusted key sources
> > > > even though both of the currently supported backends (TPM and TEE) were
> > > > compiled as modules. This manifested in the trusted key type not being
> > > > registered at all.
> > > > 
> > > > When checking if a CONFIG_… preprocessor variable is defined we only
> > > > test for the builtin (=y) case and not the module (=m) case. By using
> > > > the IS_REACHABLE() macro we do test for both cases.
> > > > 
> > > > Fixes: 5d0682be3189 ("KEYS: trusted: Add generic trusted keys framework")
> > > > Signed-off-by: Andreas Rammhold <andreas@rammhold.de>
> > > > Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>
> > > Does anyone intend to pick this up?
> > 
> > Did this end up in any tree by now? I am wondering if I should resend
> > the patch instead. Perhaps it was just overlooked?
> 
> For EVM environments only using trusted and encrypted keys, not file
> signatures, the trusted key is needed to decrypt the "master" key in
> order to verify kernel modules.

So what you are saying is that right now (before this patch & after this
patch) you could compile a kernel that wouldn't be able to load any
modules when the trusted keychain part is built as module?


Andi
