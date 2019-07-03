Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A4AF75E2BB
	for <lists+keyrings@lfdr.de>; Wed,  3 Jul 2019 13:20:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726434AbfGCLUd (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 3 Jul 2019 07:20:33 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:49681 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726255AbfGCLUd (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 3 Jul 2019 07:20:33 -0400
Received: from [192.168.1.110] ([95.114.150.241]) by mrelayeu.kundenserver.de
 (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MZT2u-1i4C9m0VOg-00WaCW; Wed, 03 Jul 2019 13:20:24 +0200
Subject: Re: [PATCH v3] scripts: use pkg-config to locate libcrypto
To:     Rolf Eike Beer <eb@emlix.com>,
        David Woodhouse <dwmw2@infradead.org>
Cc:     Linux Kernel Developers List <linux-kernel@vger.kernel.org>,
        David Howells <dhowells@redhat.com>, keyrings@vger.kernel.org
References: <20538915.Wj2CyUsUYa@devpool35> <1811702.YVQuMqyDZo@devpool35>
From:   "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Organization: metux IT consult
Message-ID: <1c808a33-e16c-f57d-64a1-9c96d75464b7@metux.net>
Date:   Wed, 3 Jul 2019 13:20:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <1811702.YVQuMqyDZo@devpool35>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:XpmHLm5YSGWdBXGxgAdS8ZULSSVWT/9khEsExHBi/rXLjzIXdmh
 Tul2G7C/zl5gYjeyTZbhO74Fv8BMd26Z6Ty/zCz5R50j4h2lYXhX2jvML/gJpeBRQOsBybt
 7fm6ktJLTvjdf64C9uS6GTfLknlXkw75sMWx+Cg7WqtAcerjRo04YoiPD4UUa0B7JZBB1nh
 tuIZJmXm3VbJIqSVjHEEw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:R6Zxm/iqhHM=:C6+pZmwkJ9FoMSdxQwUA3i
 +K5xEvc/G1BLwc4P9wbwZKwc4Phct5feRsZkTJoGotjW78FuaaHDHIn3+vZ5O08MZZReCOoZr
 pjxgpLfkvDGopbWC3M9o+0+uDy2PL1h28Mig/JQXTpIRLECmO9VjlvIxD6iuKrEHWgazV/a/i
 ntp4s/x1qnQdDHJvPRv6R1Mz6VWbladb9t3ml4f76Bk1sRVW+2MUKksYXMbKqMGGt75EbGsX8
 b9Uyr/vjKp50h9A6vKaX0xPLu8qd5elVlXSvs8ydTtTf1DseE9lBvVe6C7OD7ILLgpxOXflAF
 OjKrPS7SDsqlxCWjEHaKSe9LJPE1CxJZC+FbTQaH/DKR7hiAT0srfnwldmpdIsBeMNAYdjV2P
 kMgY4RwKSPcccDYrM5SmDeS1y/Fz9MZiBz6dODAfNrIWFig61EJJSynfXFlhaiIIsBVvwNWe+
 LK4M2y/PkM+9ksjMxO+pTdiZhEGOw7YY89EE3Be9Y533WyrsC2OBSUuqKOZBY13nkesovEkei
 020YWotoak/M0RgUGr0rXSpBIMW+hEKqqEyM2ytWlo3S3wRwtUkIN1vt0kZY2KAHH+le9/va9
 NA53CkNU6goEPG1nWY2d2wBcZh5Mj+Pv3J7WR0Gx4aIwCte2/NhUevPouZvyCujZITXexipG9
 5B9yspG7wbERStulJl6f5QLSq/UfoE8t6OgFaJwvIj2FXEwEZL28fHP37XATxMHmKZvvKc62J
 rMKZnhfaf/r3nLGjxHWI94UjiYK3Y2p7gfHtF3zttFmNznth+qUepetamio=
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On 03.07.19 11:57, Rolf Eike Beer wrote:
>> From 71e19be4247fbaa2540dfb321e2b148234680a13 Mon Sep 17 00:00:00 2001
>> From: Rolf Eike Beer <eb@emlix.com>
>> Date: Thu, 22 Nov 2018 16:40:49 +0100
>> Subject: [PATCH] scripts: use pkg-config to locate libcrypto
>>
>> Otherwise build fails if the headers are not in the default location. While
>> at it also ask pkg-config for the libs, with fallback to the existing
>> value.
> 
> Ping?

Maybe repost ?

In general i think it's a good idea to use pkg-config.

Actually, I'd prefer exclusively using pkg-config instead of hardcoded
pathes - it's a wonderful central knob for doing those kind of site-
specific customizations.


--mtx

-- 
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
