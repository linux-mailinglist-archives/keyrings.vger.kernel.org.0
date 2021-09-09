Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E89D4059B0
	for <lists+keyrings@lfdr.de>; Thu,  9 Sep 2021 16:51:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236715AbhIIOwM (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 9 Sep 2021 10:52:12 -0400
Received: from smtp.usa.ultra.group ([52.243.161.112]:44252 "EHLO
        smtp.usa.ultra.group" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S236606AbhIIOwM (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 9 Sep 2021 10:52:12 -0400
Received: from AMERUSHC4VPEX01.us.ultra.group (AMERUSHC4VPEX01.us.ultra.group [10.22.7.10])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by smtp.usa.ultra.group (MTA) with ESMTPS id 4H524j30s1z5RY4
        for <keyrings@vger.kernel.org>; Thu,  9 Sep 2021 10:51:01 -0400 (EDT)
Received: from AMERUSHC4VPEX01.us.ultra.group (10.22.7.10) by
 AMERUSHC4VPEX01.us.ultra.group (10.22.7.10) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Thu, 9 Sep 2021 10:51:00 -0400
Received: from AMERUSHC4VPEX01.us.ultra.group ([fe80::4944:fcbb:d19d:4a8a]) by
 AMERUSHC4VPEX01.us.ultra.group ([fe80::4944:fcbb:d19d:4a8a%4]) with mapi id
 15.01.2242.010; Thu, 9 Sep 2021 10:51:00 -0400
From:   Mike Murphy <Mike.Murphy@ultra-3eti.com>
To:     "keyrings@vger.kernel.org" <keyrings@vger.kernel.org>
Subject: key.c line 144
Thread-Topic: key.c line 144
Thread-Index: AdeliipmoD3rUPLXQsaqqIaMeSY6fg==
Date:   Thu, 9 Sep 2021 14:51:00 +0000
Message-ID: <ef82efdc8861448c924312804ae1ef92@ultra-3eti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.22.8.11]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
x-msw-jemd-newsletter: false
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ultra-3eti.com; s=dkim1;
        t=1631199062; bh=har2PgHCoqdT81BoVU8np/jQ2ngLt8g4w8Ce4w3GFbM=;
        h=From:To:Subject:Thread-Topic:Thread-Index:Date:Message-ID:
         Accept-Language:Content-Language:Content-Type:
         Content-Transfer-Encoding:MIME-Version;
        b=HY+0BuEPVDeD/ceA8UsrtaQ2mc1SeBgKkkEgzjxd5Qn7QEn9Ghsd8FFHodVqNgka+
         wkEh8igdP58joBIrMP2CnbYlTDxn0yscShfDEoNYexy8gEyYPj4bQ953HibcSdYrDi
         Kmmq48KMsny8pCfthKlr9HbBBme98gRjSnXkd14V//W41lNjwMxR6tOcpOkkJSqyDA
         Eq1kQWxHU8EpWy68qloQ4Gy6zoi2+geriAgC8UCgwy2lnTp6ALtSyIs8XUDQn9RPGF
         mM8QWHRTspPs8iTJL3de4a5Id1Ye2ZFkX2bGK/gNoAIBarnZbjb6+qkscXoIZlQ0wm
         /hmt8Fh9Yc68w==
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Maintainer,

Current mainline (5.14), source file:
security/keys/key.c

line 144:

key->serial >>=3D 1; /* negative numbers are not permitted */

where serial is int32_t.   >> 1 is not converting negative to positive. It =
is making a smaller negative value.=20

Regards,
Mike M.

This e-mail is from Ultra Electronics Defense, Inc. (or a subsidiary of).  =
This message and any attachment may contain confidential, privileged or oth=
erwise protected information. If you are not the intended recipient, please=
 do not use, copy, forward or disclose the contents of this message or any =
attachment. Instead, please delete this message and any attachment from you=
r system immediately.  All communications may be subject to interception or=
 monitoring for operational and/or security purposes. Please rely on your o=
wn virus checking as the sender cannot accept any liability for any damage =
arising from any bug or virus infection.
