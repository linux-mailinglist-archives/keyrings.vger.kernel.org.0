Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2072C24C230
	for <lists+keyrings@lfdr.de>; Thu, 20 Aug 2020 17:28:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726852AbgHTP2P (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 20 Aug 2020 11:28:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728251AbgHTP2K (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 20 Aug 2020 11:28:10 -0400
Received: from mail-vs1-xe42.google.com (mail-vs1-xe42.google.com [IPv6:2607:f8b0:4864:20::e42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52A18C061386
        for <keyrings@vger.kernel.org>; Thu, 20 Aug 2020 08:28:10 -0700 (PDT)
Received: by mail-vs1-xe42.google.com with SMTP id j188so1288161vsd.2
        for <keyrings@vger.kernel.org>; Thu, 20 Aug 2020 08:28:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=uYPF26fOsnSxq0X3BeFPOk0SUrFLHUyRFGGzgVJXfq8=;
        b=yL9tqtIiWrwVP/vk+PNTbPQudFqQ/Nku03VDHttP1IrTMx970xW8h0wDtHQ7KNfK+I
         SWrGQnvnwuRocjuXw6z77wNdi8Nvhd5I+47g+pDfhaHGkxBrHs04+0q9VRPmUi9bTZlD
         CyuWwq4cV7pUsyLb2cOjDle8eG+aggRgOAFAwDs0D6Ae1uZ927VlLwHo6AXcdIyZePh4
         js71qeG+n+b7/7Iy3nieGkp+iWW2pfeTaKbyCK8OA2Kn/JfDUMbsjTIKuFqRsGkM8i0J
         MEXNsxeYZg2U1hetwLztffdgRucy6cAy8re+dFL3IgCy2CgB5p/DZOVQRHd3lgEY8iS1
         WySg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=uYPF26fOsnSxq0X3BeFPOk0SUrFLHUyRFGGzgVJXfq8=;
        b=mdj5O9lA0ErmClUEOxpuc8+Y3Ut4Fx/n9HgvfIe6XZka01mGKKOLa7glIqyrmQCkCx
         pyJHg70FAuEtmOulMIwVmvCIvH4+SXVYnSYnqTxn4rkDg2uOAaf7Yo5c3yhNXG2c6Awq
         jV77NzTqUTHN4/ofmpWxgEJ3LwGjXyKH0nHR+pzYqFgXQDOe/pBnEh8WchuEzkzhbudR
         90idmivyqPINGjICgmpOcYJevBQWWz3xzPjcs+JkUQM65xf83ACSmXJsObmhobeB8XAR
         V4y3NHrOvMbsXG6vP53te3ZzsruHfeKvaxfTrzRvVWIWT8+nRYRTz9ZhWxZ3VZxYRi6W
         J+ag==
X-Gm-Message-State: AOAM532IqppEf8WPoPQQ/G73/sJ07EdqOlqqJe/f/+VQp49DugVKdLlZ
        Nw2p8JJ9ZE9ex0z4GrFPP9NZn+N/YUSBJ/QLuQwWXA==
X-Google-Smtp-Source: ABdhPJw3x/JjWeGkqsHzLhjFeoMAMLmCjvIghKiFM19pnVR2pzadjfWz1sl+deP5Pc9dZd8e9wEdeR0iwIOlz36At6A=
X-Received: by 2002:a67:e45:: with SMTP id 66mr2349582vso.191.1597937289189;
 Thu, 20 Aug 2020 08:28:09 -0700 (PDT)
MIME-Version: 1.0
References: <20200820091612.692383444@linuxfoundation.org>
In-Reply-To: <20200820091612.692383444@linuxfoundation.org>
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Thu, 20 Aug 2020 20:57:57 +0530
Message-ID: <CA+G9fYtebf78TH-XpqArunHc1L6s9mHdLEbpY1EY9tSyDjp=sg@mail.gmail.com>
Subject: Re: [PATCH 5.8 000/232] 5.8.3-rc1 review
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     open list <linux-kernel@vger.kernel.org>,
        Shuah Khan <shuah@kernel.org>, patches@kernelci.org,
        lkft-triage@lists.linaro.org,
        Ben Hutchings <ben.hutchings@codethink.co.uk>,
        linux- stable <stable@vger.kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        LTP List <ltp@lists.linux.it>,
        linux-security-module@vger.kernel.org, keyrings@vger.kernel.org,
        Eric Biggers <ebiggers@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Thu, 20 Aug 2020 at 14:55, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> This is the start of the stable review cycle for the 5.8.3 release.
> There are 232 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
>
> Responses should be made by Sat, 22 Aug 2020 09:15:09 +0000.
> Anything received after that time might be too late.
>
> The whole patch series can be found in one patch at:
>         https://www.kernel.org/pub/linux/kernel/v5.x/stable-review/patch-=
5.8.3-rc1.gz
> or in the git tree and branch at:
>         git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable=
-rc.git linux-5.8.y
> and the diffstat can be found below.
>
> thanks,
>
> greg k-h

> Herbert Xu <herbert@gondor.apana.org.au>
>     crypto: af_alg - Fix regression on empty requests

Results from Linaro=E2=80=99s test farm.
Regressions detected.

  ltp-crypto-tests:
    * af_alg02
  ltp-cve-tests:
    * cve-2017-17805

af_alg02.c:52: BROK: Timed out while reading from request socket.
We are running the LTP 20200515 tag released test suite.
 https://github.com/linux-test-project/ltp/blob/master/testcases/kernel/cry=
pto/af_alg02.c

Summary
------------------------------------------------------------------------

kernel: 5.8.3-rc1
git repo: https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stab=
le-rc.git
git branch: linux-5.8.y
git commit: 201fff807310ce10485bcff294d47be95f3769eb
git describe: v5.8.2-233-g201fff807310
Test details: https://qa-reports.linaro.org/lkft/linux-stable-rc-5.8-oe/bui=
ld/v5.8.2-233-g201fff807310

Regressions (compared to build v5.8.2)
------------------------------------------------------------------------

x15:
  ltp-crypto-tests:
    * af_alg02

  ltp-cve-tests:
    * cve-2017-17805


--=20
Linaro LKFT
https://lkft.linaro.org
