Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 64EB366606
	for <lists+keyrings@lfdr.de>; Fri, 12 Jul 2019 07:13:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725987AbfGLFNv (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Fri, 12 Jul 2019 01:13:51 -0400
Received: from mail-lf1-f43.google.com ([209.85.167.43]:42264 "EHLO
        mail-lf1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725951AbfGLFNv (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Fri, 12 Jul 2019 01:13:51 -0400
Received: by mail-lf1-f43.google.com with SMTP id s19so5566041lfb.9
        for <keyrings@vger.kernel.org>; Thu, 11 Jul 2019 22:13:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=h1l+yKMs5eoMYO2qnNQH2xVuYFvFDBbrlUII08j6+mA=;
        b=nYyYj4Td71VI953FAnyXurziweSCfNklLpK/20JzdgHfGVOtnzeWSnTD3QpkBj1m1j
         0+XmP7aKHmB2tFrjhco2B+BLfXxMvapsbXEtTS75L9D50cT/Q2k5mi6/ZGUMADNYJ6M9
         /wuGf83vcQk9fw1Hq2K8CgfhpnTk+MjsURGJYWwESfgUrX+cFxD0RX8+iLv9l+U1x+Ru
         +2L7b1HpO0WufLCNfWtO6u0yVL2VhFfuXVTpsxpQBt1N2FTYYnoKgiYAm9CTf7lQSH+D
         7//dX24mOdjvvoS0Rie7FLIkW9l4pAywDy0IClhfcvZNIxXxJhwrw4/kcgHqvDlhqhCu
         WXTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=h1l+yKMs5eoMYO2qnNQH2xVuYFvFDBbrlUII08j6+mA=;
        b=MU1TqOGYgehVozBTtuGom7Qi3l7yWWZtsLu9N/mnuSk4aaqr40hKpwyb6Q9q/3dWAx
         RB/NMrFUc+wNmb+XH5O6qs9xlSvgsJNriBN/kY8bI+iXidlhQJswvy8p56P5EdREOY5f
         UU9hH1DFEbWZ7/08yzIdGsOQf4Y5CQ6ADZWTDI0ge/x7mgLFtdrWOpDnFeam2bwjC4rB
         J5JlNRObE3Ys0h75qUvbOZM2vjDjVrRZy1+WohI9C7p4vsWm7fTI8+RyFJR7A/1sAZCS
         MTpCGIx7n2s7Ia1cGSQAr72XcjkolRNiGc7w9Afp/EYbygmDtIJub1EY6ti5x6IqOF2z
         6vAw==
X-Gm-Message-State: APjAAAWnziHa4YNLq5ITWMoxexGL4JmPknVMr9NSJLIKQED0kK6VsEMb
        p2KdStF5k5XhHoz5G5Q+vfUQmKf/EnHuZK/ghz0ywA==
X-Google-Smtp-Source: APXvYqyfBXA9XmXbGZHqcWD0t0USlZpN+WDbCnrmpXLdBk+4LqbchAml/Mo4CSWEgwoiXHjQ8mHI9xNYcHbD44LAJNo=
X-Received: by 2002:a19:c7ca:: with SMTP id x193mr3592234lff.151.1562908429171;
 Thu, 11 Jul 2019 22:13:49 -0700 (PDT)
MIME-Version: 1.0
References: <1562337154-26376-1-git-send-email-sumit.garg@linaro.org> <20190711192215.5w3fzdjwsebgoesh@linux.intel.com>
In-Reply-To: <20190711192215.5w3fzdjwsebgoesh@linux.intel.com>
From:   Sumit Garg <sumit.garg@linaro.org>
Date:   Fri, 12 Jul 2019 10:43:38 +0530
Message-ID: <CAFA6WYMOyKo2vXY8bO448ikmdGioK3s5JMZLz6c2y8ObPm4zHw@mail.gmail.com>
Subject: Re: [RFC/RFT] KEYS: trusted: Add generic trusted keys framework
To:     Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Cc:     keyrings@vger.kernel.org, linux-integrity@vger.kernel.org,
        "open list:HARDWARE RANDOM NUMBER GENERATOR CORE" 
        <linux-crypto@vger.kernel.org>,
        linux-security-module@vger.kernel.org, dhowells@redhat.com,
        Herbert Xu <herbert@gondor.apana.org.au>, davem@davemloft.net,
        jejb@linux.ibm.com, Mimi Zohar <zohar@linux.ibm.com>,
        jmorris@namei.org, serge@hallyn.com,
        Casey Schaufler <casey@schaufler-ca.com>,
        Ard Biesheuvel <ard.biesheuvel@linaro.org>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        tee-dev@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Fri, 12 Jul 2019 at 00:52, Jarkko Sakkinen
<jarkko.sakkinen@linux.intel.com> wrote:
>
> On Fri, Jul 05, 2019 at 08:02:34PM +0530, Sumit Garg wrote:
> > Current trusted keys framework is tightly coupled to use TPM device as
> > an underlying implementation which makes it difficult for implementations
> > like Trusted Execution Environment (TEE) etc. to provide trusked keys
> > support in case platform doesn't posses a TPM device.
> >
> > So this patch tries to add generic trusted keys framework where underlying
> > implemtations like TPM, TEE etc. could be easily plugged-in.
> >
> > Suggested-by: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
>
> 1. Needs to be somehow dissected into digestable/reviewable pieces.

Sure, will try to split this patch in next version.

> 2. As a precursory step probably would make sense to move all
>    existing trusted keys code into one subsystem first.

Okay.

-Sumit

>
> /Jarkko
