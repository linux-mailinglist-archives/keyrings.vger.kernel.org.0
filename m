Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84E29419118
	for <lists+keyrings@lfdr.de>; Mon, 27 Sep 2021 10:51:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233499AbhI0IxD (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Mon, 27 Sep 2021 04:53:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233403AbhI0IxC (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Mon, 27 Sep 2021 04:53:02 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4DFE3C061575
        for <keyrings@vger.kernel.org>; Mon, 27 Sep 2021 01:51:23 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id dj4so66326548edb.5
        for <keyrings@vger.kernel.org>; Mon, 27 Sep 2021 01:51:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rammhold-de.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=vpiI5pj2Ftv2EK8BLb2NkBV+XKtwEHr6p/9jAqbGbAE=;
        b=BhkSvc+zNkulAdU66B6+X3PLa6HTc7zTdIZ7CKNvaupwXco2ce3J1ojxFID/7Avvkh
         vKV7Lz9TZZzOIcWGJuAukVWFdUKSHRmCT3np3zdY1ZBbv0sVjr96CwPggmpFw7VmdXON
         sklUqge3izjUabowL5z/oxI0ot81qap1t4eJaodiGkQoSjjEv3IJjpNDuSqMM6wx2FJj
         E1gBvz+oQ2DE86AidE5KJcGWKHarVm4zQUhDS2y0WpBY0ly2VN/7d6fYscJ/HiwFV9xl
         eZ0fpHR6SvqVFFTjkFuf0J3o0ardaYbzmKiBhX0OWTYjcOzeHlqylWK4ScUTazBiL+m7
         eAHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=vpiI5pj2Ftv2EK8BLb2NkBV+XKtwEHr6p/9jAqbGbAE=;
        b=IX3i9JHRT1cSMQoS5qe/gqds3L5kfdfpkIsXhNH1LEcQgryHZaDmc46fJ69wX16J91
         I/JuUVWpTCxGklQ7nuNCzspc3QkUB/dL98kQa9TYjAW4vC1+D0bVPZ4qGrhB85ieaz0T
         jvDRYtA/mvInj/DX/szneXlEqkZN5PMzJCyJzYsDf9gpmEtcaJS1cOebUDYNeDrzI/My
         S/P4wUGxZgYpKmdR+MkG4b/MQHbDah8djf037iWK/5SlS06tldW0QhSdN8rcsWs+v82Z
         0jACigT8HCY0Dn18XqGWEOivv4KKUtRAXf6RcTidHPorFyRCHZ4VT4IcyWQFgUTPSyJI
         J8fA==
X-Gm-Message-State: AOAM531+8qtv2vqDQOpHsYf9ZpmjqP8ZA+uYuo1wQ1pbUci0zAmiHhUh
        bXCTqGvFxHeurZTuANo4BkvJ/g==
X-Google-Smtp-Source: ABdhPJyGrcZoq7BRymoATY3WZexa99+brf/ZH5Kkqlnjq0KM2/GBXtUm597ruB9k9urrT5xeVjJXVA==
X-Received: by 2002:a17:906:2505:: with SMTP id i5mr25674695ejb.450.1632732681907;
        Mon, 27 Sep 2021 01:51:21 -0700 (PDT)
Received: from localhost ([2a00:e67:5c9:a:6d7b:fc0:e9e9:7254])
        by smtp.gmail.com with ESMTPSA id m22sm10262359edq.71.2021.09.27.01.51.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Sep 2021 01:51:20 -0700 (PDT)
Date:   Mon, 27 Sep 2021 10:51:04 +0200
From:   Andreas Rammhold <andreas@rammhold.de>
To:     Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc:     Andreas Rammhold <andreas@rammhold.de>,
        James Bottomley <jejb@linux.ibm.com>,
        Jarkko Sakkinen <jarkko@kernel.org>,
        Mimi Zohar <zohar@linux.ibm.com>,
        David Howells <dhowells@redhat.com>,
        James Morris <jmorris@namei.org>,
        "Serge E. Hallyn" <serge@hallyn.com>,
        Sumit Garg <sumit.garg@linaro.org>,
        linux-integrity@vger.kernel.org, keyrings@vger.kernel.org,
        linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] KEYS: trusted: Fix trusted key backends when building
 as module
Message-ID: <20210927085104.vq42feghtaqiv6ni@wrt>
References: <20210730012822.3460913-1-andreas@rammhold.de>
 <0d42a11a-0117-49a9-d2c9-bc6cc405235d@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0d42a11a-0117-49a9-d2c9-bc6cc405235d@pengutronix.de>
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On 09:47 13.09.21, Ahmad Fatoum wrote:
> Dear trusted key maintainers,
> 
> On 30.07.21 03:28, Andreas Rammhold wrote:
> > Before this commit the kernel could end up with no trusted key sources
> > even though both of the currently supported backends (TPM and TEE) were
> > compiled as modules. This manifested in the trusted key type not being
> > registered at all.
> > 
> > When checking if a CONFIG_… preprocessor variable is defined we only
> > test for the builtin (=y) case and not the module (=m) case. By using
> > the IS_REACHABLE() macro we do test for both cases.
> > 
> > Fixes: 5d0682be3189 ("KEYS: trusted: Add generic trusted keys framework")
> > Signed-off-by: Andreas Rammhold <andreas@rammhold.de>
> > Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>
> Does anyone intend to pick this up?

Did this end up in any tree by now? I am wondering if I should resend
the patch instead. Perhaps it was just overlooked?


Andi
