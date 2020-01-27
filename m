Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9A6D014A204
	for <lists+keyrings@lfdr.de>; Mon, 27 Jan 2020 11:33:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729644AbgA0Kd1 (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Mon, 27 Jan 2020 05:33:27 -0500
Received: from sonic311-13.consmr.mail.bf2.yahoo.com ([74.6.131.123]:45219
        "EHLO sonic311-13.consmr.mail.bf2.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729099AbgA0Kd1 (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Mon, 27 Jan 2020 05:33:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1580121205; bh=TjXrohIsHoWIuPyqTzmuPB/o0Uh/BG9Th3bmRNsLDqg=; h=Date:From:Reply-To:Subject:References:From:Subject; b=iniX66PKZhq7uyx0+IXWMkpLy0nBtzsEtJIQ3z0W6pYrpntVor7HPjR7P3c2frUjCjCWdFUDLAIy8VcTN7/uZmMkOsaIm7Df/dgKllpQQAmzinI1Hd8nRC5RwY9Px6LkRpHob29lq3L9OEe2ZsRQ/6mkcCzGObuN2fvu3zyNiuOgp8bE6WaY/DOcmSz6fnGA5MPgbGx5mCALzRIlwfZlCcOGN1hlj+15Kpq9GCq3ju3uDRwxG6b5l9GecNu/ZkeERF1a1lS4srYr4Hlz80iUuR6ept+5ZjsuJSRF4j0zgRsoBFsfJa0y4zy7ARspsP7ssbTYz6E7E9K2/wOmvRAQVQ==
X-YMail-OSG: SWROHZQVM1lzl1F9VRLY9uVp79s9sAFwp_qcVvpk0Wca.MQwECwX98SkGc2wWKJ
 8mES9Z8lx2Bjunc2Kmu40TmuSaGjSmZEc1RScPghAfMXpD2e9RtEdM70DgBLHNzrjDTVBp8dFkMY
 EltDUfMUsYt2QWWx46ZLdkG4Xk_YxMxIgyb284EVeBZ3pBzxuOp5pK6.CYOE5416SvNTxQfXUjo2
 i2J1g_BriP.y.WkWyoWop_99Z1PUcSSFE_z1zE2ZZwkim54xSVOl7m0gMz_benN91sF_ND5yTXEP
 yJtV0AjhyAu91XS1QjdeOL27M6yKrs43mmEptYNl8cKGxYapfJDgDZtaRUYslGPERaSeMXitp9pD
 DMsWen2dYgleqVnQ9iN3DRey7g39iLy6gDJZtGzDhuxpVxzfqcVROzaLkF4XBe5PgvqXeADC5lWV
 fjwCGDBCzd1zgBQ9P5KIsrU0PlcwvuuBuUrRDDbLHhOL3Fww8OtgJzn_0LyeXlXtJIW6Wa.vsIaj
 mvzzlTkGP7XgCiiXmqeI1IWHJiZPlFXciHE9ATRL.Y_bR1donkkyhdDRCTUhxYEaIwdJ_uD3h0M4
 zkjaQk8rtoFMS0qNdfZdSg8nj.Xe1i2uNOGqYuW_e9dpaxFHu.sjDqgqeJi.R3_vOuHjiXWLy9t0
 v0FcqfuttWwmpJ10sc2lCYGiKJFePY1F4gIxUor_dF0RT8irhMXsZ2zivd9Qf_me5mX0qCsq9pMe
 fans9NfQe.tWZBAkAT9vWVSzOezKSUfQihEj1ZHdjegxXsyG3laR1LkM4d_DkukHtWIkp7MRZQIL
 iiujxwO6nZaT2EVkA2G1qjdO8WrVYRyLCjxcDVTIbL2ALz8w_QFhX3Jo6u30tt9mN9Esa5gL6znL
 WbU92acxTjIaUzqBc5pQEWjIijJCK8AJt3JNPwI_lEijnVVFNaQ9FkElNRwhD3k1fTIgGt5PLsBt
 _RvrZ5_DPWugQN1fSHr8LfPrzWczGW4FwGJ7sqvkMCq.PHHVEM1ni8FGVnB_oxGIAmW2sFreBAJl
 .9a9.MDUJmZBqn4KnqZgJSi.qJ0bQ4csq.YmDyDK4R0kk1_1PAnzQTVMgBxnXcx4KbvfCMqfLoaa
 EPUS_wC1VUTAS0tMHrE9SJWS1AH22Ud9H3xR4Gbhtnl2sXyi82dSwK9s0sFGrP6H1Mt775SLIAfM
 5QZvGJZ_2nsKF29wuJMwUVXy8kuAPG8KzxLNvmgv8zI8iQMFj6NAn8QlgehTod44b3Fj1aW0OFTT
 C4ZWvzk2AxXVdZOTFORXubzRjkVPCCZicAbq6li9f0x1Wt7VgVvKOI37EsUl1yhCS4wxSOv7aJ2y
 mJJgXlnTJ1m8rV3feppTQ2P2Nv3xGdj0B0.ZUGeUO
Received: from sonic.gate.mail.ne1.yahoo.com by sonic311.consmr.mail.bf2.yahoo.com with HTTP; Mon, 27 Jan 2020 10:33:25 +0000
Date:   Mon, 27 Jan 2020 10:33:24 +0000 (UTC)
From:   "Mr.Mohamed Musa" <mrmohamedmusa739@gmail.com>
Reply-To: mohamedmusa1962@gmail.com
Message-ID: <1100205264.11858531.1580121204462@mail.yahoo.com>
Subject: REPLY ME IMMEDIATELY
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
References: <1100205264.11858531.1580121204462.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.14873 YMailNodin Mozilla/5.0 (Windows NT 6.1; rv:72.0) Gecko/20100101 Firefox/72.0
To:     unlisted-recipients:; (no To-header on input)
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org



Assalamu alaikum

My name is Mr. Mohamed Musa, I am a staff working with the African Development Bank here in Ouagadougou,Burkina Faso.

I want you to help me in receiving the sum of Twenty Seven Million Two Hundred thousand Dollars ($27,200,000) into your Bank Account. This fund was deposited in the bank here by a foreign customer who died accidentally alongside with his entire family members many years ago.

Nobody had asked for this fund till now please contact me through my private email address: (mohamedmusa1962@gmail.com) for more details.

Mr. Mohamed Musa.
