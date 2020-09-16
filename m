Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BFC0026C6D8
	for <lists+keyrings@lfdr.de>; Wed, 16 Sep 2020 20:06:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727646AbgIPSGD (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 16 Sep 2020 14:06:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727757AbgIPSEq (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 16 Sep 2020 14:04:46 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B35DC061788
        for <keyrings@vger.kernel.org>; Wed, 16 Sep 2020 11:04:46 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id y6so3610405plt.9
        for <keyrings@vger.kernel.org>; Wed, 16 Sep 2020 11:04:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rZ2gqOCFqYdMmC6UEOtaB1iVFCf6huan47rtv+YEmwg=;
        b=bZvY9lcAwz29N9ZjRJWDi3ILGVB1fthN2tRt3EFZn7mEKxafFFPiN3Q80gmFsQaVS9
         /xyjMBbwQek4Mjj4kOqJgZSGo1BLQyaiUwPLpLECuQmqH3iGY05GmxTTTj5bbuec9JXn
         jQa4JOGe5f+Rt98ypsaJuSWoYOPIGwKowtbbR79Yig69hDgSKDms5eYyaIKWTEefXEIo
         zLsI3sSUz+cxOL9EwuS5S68U77wMc2xIQNy/Ap3mpEGqUUGlkgpiKfFMlS7+4wGbGSqR
         W47uchZFQcaxmqTAWtrJFTR3DJ1DY58JtzkWKbxVWWLgnbu3W6y+ltgb7f7PiF0iXKr7
         AHSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rZ2gqOCFqYdMmC6UEOtaB1iVFCf6huan47rtv+YEmwg=;
        b=U6mJpVNk95gahCCAmHQ/dXhiFCuduMw34HgBiaJnDhmPgxNkIvNPoZwNu+43ftfx1x
         Lz7LFVi1j5wmzlwutf6jDO95be2hUx9jUgCLKY4kDeIsGYQzHM1rmFusKYRVCt3gG5dp
         CFsqn0XSGSZBcGKnT7qVsq4Bo1uvcU3MtCZXnVpdEukFLmqJ3P9OvLy1eUbXg4XfORLy
         hrrje8ViW42zj4lMjR/d5rR/eYGWHH9Nd3t2XyaTsh6FXZbgOv1d3RouWRIWWVxl4SZh
         ezYfZiu4JtNac5vdAlzxX5cZ/lkSJkqMwMD70X2nTjwRcWI3ADrAxpN/3TE2AiOMRTNI
         csnw==
X-Gm-Message-State: AOAM531yDMylqKkqViyXAYz+CrVWk5FyMlLtQe9Uw9jzKVEwcJuFNCcP
        jo6CSrGlJsrPchYDXidpN3KgctT9g1wK9EJzwW4mjw==
X-Google-Smtp-Source: ABdhPJxo1LabKkVKMZxDCfTnDT7hqtFxkOSLdGgsiVq2jj2W0SydWxc8G1PAzeIia9qWNIwq1VpZO4fM6yZHtc2yjzw=
X-Received: by 2002:a17:902:7295:b029:d1:e3bd:48cc with SMTP id
 d21-20020a1709027295b02900d1e3bd48ccmr8828151pll.10.1600279485421; Wed, 16
 Sep 2020 11:04:45 -0700 (PDT)
MIME-Version: 1.0
References: <20200912172643.9063-5-James.Bottomley@HansenPartnership.com>
 <202009131413.8dt8QEc8%lkp@intel.com> <1600016571.7833.9.camel@HansenPartnership.com>
 <20200915091140.GC3612@linux.intel.com> <CAKwvOdnDJKPJ__sVKX2HmLUWyNPo=b0ccLvyBLyWoFfC0EFkiA@mail.gmail.com>
 <20200916162707.GF21026@linux.intel.com>
In-Reply-To: <20200916162707.GF21026@linux.intel.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Wed, 16 Sep 2020 11:04:33 -0700
Message-ID: <CAKwvOdnM66H2CNwsscgvALsb=gdiV9UDLQuqrKzdbmCr5S1McA@mail.gmail.com>
Subject: Re: [PATCH v11 4/5] security: keys: trusted: use ASN.1 TPM2 key
 format for the blobs
To:     Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Cc:     James Bottomley <James.Bottomley@hansenpartnership.com>,
        kernel test robot <lkp@intel.com>,
        linux-integrity@vger.kernel.org, kbuild-all@lists.01.org,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Mimi Zohar <zohar@linux.ibm.com>,
        David Woodhouse <dwmw2@infradead.org>,
        keyrings@vger.kernel.org, David Howells <dhowells@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Wed, Sep 16, 2020 at 9:27 AM Jarkko Sakkinen
<jarkko.sakkinen@linux.intel.com> wrote:
>
> The compiler that you use in your example is unfortunately not
> preincluded to my Ubuntu installation...

$ sudo apt install gcc-arm-linux-gnueabihf binutils-arm-linux-gnueabihf
-- 
Thanks,
~Nick Desaulniers
