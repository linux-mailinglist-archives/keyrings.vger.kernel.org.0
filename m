Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF79D3B8915
	for <lists+keyrings@lfdr.de>; Wed, 30 Jun 2021 21:17:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233552AbhF3TU2 (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 30 Jun 2021 15:20:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233400AbhF3TU2 (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 30 Jun 2021 15:20:28 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C598CC0617A8
        for <keyrings@vger.kernel.org>; Wed, 30 Jun 2021 12:17:58 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id q4so4757818ljp.13
        for <keyrings@vger.kernel.org>; Wed, 30 Jun 2021 12:17:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4T+GID+oMnIZlCqDCJF0ldXeQDAkPgspY/ySOTASFzI=;
        b=OsGeYpUKTFPyN5n360XNZX8s/aqdMHN9tQztcumkZMUEG0EKEgHA2J/bHBhbdu8wiR
         ClWnoPCQmYWxP2n/dlnN1fE0QB/HOvPEfl0TYUAdfEux0/vvSPpQzzuxcD9wpjOUwDnm
         ODKvHI15ym8cJPnCdDXTIIdO883VCyNE7rJaA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4T+GID+oMnIZlCqDCJF0ldXeQDAkPgspY/ySOTASFzI=;
        b=iBeafuqVu68C9IcUPXonYGPMTBCG/7tsbfyePhgQE56oZRYbp2bdl1G6535jBAlFl5
         +8OvlTcn1PhD5kxoLDsOjOgvyI6oGaORXC8lVKUDHhogGiOO9rEIQNnatzb6YD8TzInw
         4HijQIlMF2YN0p69iJAV8slOZQ663WzB09qR0hbu5U3mqYhgN9zzM2rPhrlpwTUD9+5v
         qG8taZoRXPiD4Ih1zgy6KH88DJ45bGuCtIBUPd8ocRQyJ7QVVL1dT7Rh7xuGxJyBS2gP
         DHo6ExEq6fUkVp9knA/oymgceSEsR3XVW5lPhU2v9yIrZH2iYsS3CL+IFyEmkElPZIuR
         rIiQ==
X-Gm-Message-State: AOAM533Fc/D+iAp7DGZaiNviAGBSdxnsAMQ3lV7YhWPgnIe6KDuinFB0
        AU1ZY2220T/N7Qe42KRzzsWDtlhX5UPZjyMuALI=
X-Google-Smtp-Source: ABdhPJztfhDfe6AWt0DvZIqw59I4HVls4gxXpAujHW236DcAaaIVrPALM33wwGjmCsYnenaPTnJ3JQ==
X-Received: by 2002:a05:651c:a08:: with SMTP id k8mr8857657ljq.391.1625080676692;
        Wed, 30 Jun 2021 12:17:56 -0700 (PDT)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com. [209.85.167.53])
        by smtp.gmail.com with ESMTPSA id d11sm1371519ljl.89.2021.06.30.12.17.55
        for <keyrings@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Jun 2021 12:17:56 -0700 (PDT)
Received: by mail-lf1-f53.google.com with SMTP id w19so7117989lfk.5
        for <keyrings@vger.kernel.org>; Wed, 30 Jun 2021 12:17:55 -0700 (PDT)
X-Received: by 2002:a19:7d04:: with SMTP id y4mr27583898lfc.201.1625080675538;
 Wed, 30 Jun 2021 12:17:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210629213421.60320-1-stefanb@linux.vnet.ibm.com> <20210629213421.60320-2-stefanb@linux.vnet.ibm.com>
In-Reply-To: <20210629213421.60320-2-stefanb@linux.vnet.ibm.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Wed, 30 Jun 2021 12:17:38 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgVZ6PUJ6Q=vqnhSkHnE2Rvr72xPFjoRU4=HHn-Rqxu4w@mail.gmail.com>
Message-ID: <CAHk-=wgVZ6PUJ6Q=vqnhSkHnE2Rvr72xPFjoRU4=HHn-Rqxu4w@mail.gmail.com>
Subject: Re: [PATCH v8 1/2] certs: Trigger creation of RSA module signing key
 if it's not an RSA key
To:     Stefan Berger <stefanb@linux.vnet.ibm.com>
Cc:     Jessica Yu <jeyu@kernel.org>, keyrings@vger.kernel.org,
        David Howells <dhowells@redhat.com>,
        David Woodhouse <dwmw2@infradead.org>,
        Mimi Zohar <zohar@linux.ibm.com>,
        Jarkko Sakkinen <jarkko@kernel.org>,
        Nayna Jain <nayna@linux.ibm.com>,
        linux-integrity <linux-integrity@vger.kernel.org>,
        LSM List <linux-security-module@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Stefan Berger <stefanb@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Tue, Jun 29, 2021 at 2:34 PM Stefan Berger
<stefanb@linux.vnet.ibm.com> wrote:
>
> Address a kbuild issue where a developer created an ECDSA key for signing
> kernel modules and then builds an older version of the kernel, when bi-
> secting the kernel for example, that does not support ECDSA keys.

Thanks, these two don't confuse me any more.

                Linus
