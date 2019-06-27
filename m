Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2D14A587D3
	for <lists+keyrings@lfdr.de>; Thu, 27 Jun 2019 18:59:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726595AbfF0Q72 (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 27 Jun 2019 12:59:28 -0400
Received: from mail-vs1-f68.google.com ([209.85.217.68]:41757 "EHLO
        mail-vs1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726315AbfF0Q72 (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 27 Jun 2019 12:59:28 -0400
Received: by mail-vs1-f68.google.com with SMTP id 2so2102479vso.8
        for <keyrings@vger.kernel.org>; Thu, 27 Jun 2019 09:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=R6PfiPGrZXaoLYBH8qUdQLafji4tpsMpaVo6jISbyds=;
        b=gVSZ36U8GrUlTQhAb8XGhwh31+LzHkStW5Kxkxsq/nHGr9u3VesU58KWQk55AkPdSE
         XBg8U/vJyA0zyD+3jDcs7/OCb1lIfRO/Vwmn5/0D2/kgvNhE33w4cCrj3/iUaAWfSUs0
         vg4YHioydGodt4sQdIkBEDc6bqmLYlOUMQXI1BmNE2mgO0sTl2cZSvyvryQf4Pd5ZibH
         D+1ZFzXLu4PUn7gDOPJmxf5XiRbEusE8jI6Vbhz+NIk/KuDgz0KiPxo2IW9OJ26TSfFi
         aio9nZsXtLW9aaS8E9YtDR97O4UVXl3vRvZYtHWlv3MhLdO7MgMiobIC4B/3MUPtGH1X
         X8Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=R6PfiPGrZXaoLYBH8qUdQLafji4tpsMpaVo6jISbyds=;
        b=eRl+eLE+lJ0NkZNc7IM3/lzhBOL/y7upv62KX0ZInP6ABbDsbfgighVxtg00xoXnFy
         sC8Y4G6pqZqPP9g1mfa9AmMhVbEOkH+CWzDLxt8UFqSGrviAMgBDUXnqJ6rLZk9o7sgH
         J6fFEei9uuqE74udBSR8zTSTynCoAK55lfofOSUM9OqYNSorAjb2nm6R8kEVoRaYjfZL
         yXv5JsEIRM5SglsQnvzxTsG3z+yEGBToCtKTKD4Nr4YO6YIRE94JHxvQV4axMv6vBWgg
         +aVxhtzoRl5Zs3FMr0tki/u+7DgLvQpgG5LvFT83TIpkqUGIVll+SYu1QnMbuj2hW/sh
         OAKg==
X-Gm-Message-State: APjAAAXvYajoBob1cKgG0nymzFP6Dq8GPcOzybUYpTtvCxcyp2stWvw9
        ADk6tSGytxWh9kroon9UR3JKeXn6C0GR6PGMCIfW/bXB
X-Google-Smtp-Source: APXvYqzO9YUQ2Mmz6DMe72Od4nHRglGx7zgDLNh+/6i5Gs+6cVxsxaDitQuNvoh5XY4gDvPC0M63k9k05+TR2ghRIRU=
X-Received: by 2002:a67:ee5b:: with SMTP id g27mr3492913vsp.165.1561654767115;
 Thu, 27 Jun 2019 09:59:27 -0700 (PDT)
MIME-Version: 1.0
From:   CrazyT <crazyt2019+lml@gmail.com>
Date:   Thu, 27 Jun 2019 18:59:13 +0200
Message-ID: <CACnrVGfhkpsSWbCai4+5WEOhRukEr7JWDUnFdM-5D+FUyov+nQ@mail.gmail.com>
Subject: Problem with the kernels trusted module on "inactive" TPM
To:     keyrings@vger.kernel.org
Cc:     roberto.sassu@huawei.com
Content-Type: text/plain; charset="UTF-8"
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Hi,


some people (including me) have problems with the "trusted" kernel module.
As a result to this also the ecryptfs-module won't load.
(https://bugs.archlinux.org/task/62678)
If you use an "inactive" TPM module, the "trusted" module won't load anymore.
The command modprobe just responds with "Bad address".
The strace-command shows that init_module fails with EFAULT.
I believe the reason for this is that the trusted-module handles
inactive modules the same as active modules.
This results in an error.

For example:
https://github.com/torvalds/linux/commit/0b6cf6b97b7ef1fa3c7fefab0cac897a1c4a3400#diff-c01228e6d386afb29df6aac17d9dd7abR1251

My guess is that init_digests(); returns EFAULT in that case.
The " if (!chip)" check above probably needs to check if the chip is "inactive".

"inactive" = still visible to the system, but not functional.
It seems to be the default bios-setting for TPM on thinkpad.
(btw.: i have no clue why anybody would need something like that)

Sadly i have no idea how you would check for an inactive chip,else i
would have send a patch instead.
But I hope the info i wrote is enough to get it fixed by somebody.


Greetings,

CrazyT
