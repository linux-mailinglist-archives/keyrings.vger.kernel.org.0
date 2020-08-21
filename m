Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D8C024DAB0
	for <lists+keyrings@lfdr.de>; Fri, 21 Aug 2020 18:24:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728603AbgHUQYh (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Fri, 21 Aug 2020 12:24:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728469AbgHUQVg (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Fri, 21 Aug 2020 12:21:36 -0400
Received: from mail-vk1-xa42.google.com (mail-vk1-xa42.google.com [IPv6:2607:f8b0:4864:20::a42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1713BC061755
        for <keyrings@vger.kernel.org>; Fri, 21 Aug 2020 09:21:36 -0700 (PDT)
Received: by mail-vk1-xa42.google.com with SMTP id 186so535953vkx.4
        for <keyrings@vger.kernel.org>; Fri, 21 Aug 2020 09:21:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=iGVeXcDNIvRh8qe1/2584zUekwk8kU52P/kL+vHcf2k=;
        b=ji/pjQgi0VxnFeZYwxWaAiU3Vrdf06GkDeZC3JB6loVzhqamPN5JMsYieQFYBj+3Hs
         RRMOMqC+TMGPyGgOCEATA58h94MWiPeiQ9FnjYMnyoQUWXUYZPf695EN+xYx3AByv4VK
         FbbkbmdO6zYhfUZA/5SYL+2bQZsgrKE4dMatvE5VFheBFxOflx+OiHVhpv+3/vD9FM5d
         lz6M9HKQF2YAr5n36Fpm8ms16IEdEad2ElYT/2l9s1tqeLOLwdRl92zVYYaRl+nuXuSV
         nneuRiGvNTnJeyahLdH3sk2yW+WvyrX/bwp/cV6cPZPjf4cqujMn2b3IYW44kLPCnFsl
         61uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=iGVeXcDNIvRh8qe1/2584zUekwk8kU52P/kL+vHcf2k=;
        b=c5WVMlfihauuzN7+rMn3OJg0Zt8iz3B4GewYsrcwMHJLDo7AhBYVW4X+G/LXnDe5m5
         OldJqeY8Axb3HSbwYAjfbg3nIhtIzCX++0LepRZywcAGH2LiykSWeWHJfvXtSLFkY+Hi
         rElJmC9bcS21YHAO7UJDqFqPn1mkrIUIq0vxRIzNC7W7rBV+2XrUmg8crOPhA4f5b7nw
         y/wfMP6LMBM92pdD5INBWOoTgfxWG6h4dR7NvAOB0AC4HhblIk/rrgvyTGfP67q1WNeL
         WX7OFyDD5ZZe+5f60XOcxaPXAeoOZXjqls4Jr3Av/w/kklbZg2FN/X3Hv+ax7bbWq1md
         Jdkg==
X-Gm-Message-State: AOAM531MKf6hZDpBw4IbuCFcORNI/3on1yJkPGxvW3jU7UdOqoj04TbJ
        we1/5af0Rb5eZMlX4rbgOznQzhAv66gyvbw8IMgbYg==
X-Google-Smtp-Source: ABdhPJxiNdxtxxUKYT6rb+L9FRF6H2nEkJ4ZpJqNK6OBdBlc8q4YCCspNRYmFOTVAEB0DjVNW5ZROnJK1ZJOdt8kd9k=
X-Received: by 2002:a1f:2fc1:: with SMTP id v184mr2425414vkv.42.1598026893599;
 Fri, 21 Aug 2020 09:21:33 -0700 (PDT)
MIME-Version: 1.0
References: <20200820091612.692383444@linuxfoundation.org> <CA+G9fYtebf78TH-XpqArunHc1L6s9mHdLEbpY1EY9tSyDjp=sg@mail.gmail.com>
 <20200821111535.GC2222852@kroah.com>
In-Reply-To: <20200821111535.GC2222852@kroah.com>
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Fri, 21 Aug 2020 21:51:22 +0530
Message-ID: <CA+G9fYvc2tqXf7ownJ=HMsVz+uuigqZJXJmjMSWCzO_-ODk1fQ@mail.gmail.com>
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

On Fri, 21 Aug 2020 at 16:45, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Thu, Aug 20, 2020 at 08:57:57PM +0530, Naresh Kamboju wrote:
> > On Thu, 20 Aug 2020 at 14:55, Greg Kroah-Hartman
> > <gregkh@linuxfoundation.org> wrote:
> > >
> > > This is the start of the stable review cycle for the 5.8.3 release.
> > > There are 232 patches in this series, all will be posted as a respons=
e
> > > to this one.  If anyone has any issues with these being applied, plea=
se
> > > let me know.
> > >
> > > Responses should be made by Sat, 22 Aug 2020 09:15:09 +0000.
> > > Anything received after that time might be too late.
> > >
> > > The whole patch series can be found in one patch at:
> > >         https://www.kernel.org/pub/linux/kernel/v5.x/stable-review/pa=
tch-5.8.3-rc1.gz
> > > or in the git tree and branch at:
> > >         git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-st=
able-rc.git linux-5.8.y
> > > and the diffstat can be found below.
> > >
> > > thanks,
> > >
> > > greg k-h
> >
> > > Herbert Xu <herbert@gondor.apana.org.au>
> > >     crypto: af_alg - Fix regression on empty requests
> >
> > Results from Linaro=E2=80=99s test farm.
> > Regressions detected.
> >
> >   ltp-crypto-tests:
> >     * af_alg02
> >   ltp-cve-tests:
> >     * cve-2017-17805
> >
> > af_alg02.c:52: BROK: Timed out while reading from request socket.
> > We are running the LTP 20200515 tag released test suite.
> >  https://github.com/linux-test-project/ltp/blob/master/testcases/kernel=
/crypto/af_alg02.c
>
> Looks like the crypto tests are now fixed :)
>
> Anyway, thanks for testing all of these and letting me know.

Apart from the reported LTP crypto test case problem all other results
look good to me.

Results from Linaro=E2=80=99s test farm.
No regressions on arm64, arm, x86_64, and i386.

Summary
------------------------------------------------------------------------

kernel: 5.8.3
git repo: https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stab=
le-rc.git
git branch: linux-5.8.y
git commit: a1101e94767e2d5da5bcbee12573d96a1c8be5bb
git describe: v5.8.3
Test details: https://qa-reports.linaro.org/lkft/linux-stable-rc-5.8-oe/bui=
ld/v5.8.3

No regressions (compared to build v5.8.2)

No fixes (compared to build v5.8.2)

Ran 30256 total tests in the following environments and test suites.

Environments
--------------
- dragonboard-410c
- hi6220-hikey
- i386
- juno-r2
- juno-r2-compat
- juno-r2-kasan
- nxp-ls2088
- qemu_arm
- qemu_arm64
- qemu_i386
- qemu_x86_64
- x15
- x86
- x86-kasan

Test Suites
-----------
* build
* linux-log-parser
* ltp-commands-tests
* ltp-containers-tests
* ltp-dio-tests
* ltp-fs-tests
* ltp-io-tests
* ltp-math-tests
* ltp-tracing-tests
* ltp-cve-tests
* ltp-fcntl-locktests-tests
* ltp-filecaps-tests
* ltp-fs_bind-tests
* ltp-fs_perms_simple-tests
* ltp-fsx-tests
* ltp-nptl-tests
* ltp-pty-tests
* ltp-securebits-tests
* ltp-syscalls-tests
* v4l2-compliance
* libhugetlbfs
* ltp-cap_bounds-tests
* ltp-controllers-tests
* ltp-cpuhotplug-tests
* ltp-crypto-tests
* ltp-hugetlb-tests
* ltp-ipc-tests
* ltp-mm-tests
* ltp-open-posix-tests
* ltp-sched-tests
* network-basic-tests
* igt-gpu-tools

--=20
Linaro LKFT
https://lkft.linaro.org
