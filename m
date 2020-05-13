Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B77171D21F2
	for <lists+keyrings@lfdr.de>; Thu, 14 May 2020 00:23:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731325AbgEMWXR (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 13 May 2020 18:23:17 -0400
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:52091 "EHLO
        out4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731120AbgEMWXQ (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 13 May 2020 18:23:16 -0400
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
        by mailout.nyi.internal (Postfix) with ESMTP id 99E8B5C01A5;
        Wed, 13 May 2020 18:23:15 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute7.internal (MEProxy); Wed, 13 May 2020 18:23:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=benboeckel.net;
         h=from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=fm1; bh=vf4n1+nLT53Hj910EtvWlZIgop
        kqH8M15zckwsTbDA4=; b=mDzcmcAFWKarewl2eS6zdOjiV7m1wjGymcL/Ve/Nv/
        xidXI9CMXt6kDNQhGlASQ1ZEr1+/IpvSINaxU3fiuSVCFHFzQ21YxQ7gEI5UC0yZ
        V6ZXD8+7Unfl+bN0UldQlS4chpt2b37OVBPPwoVwlNSrSLxm7hxSebNWJlWurSf4
        A4Om5M9+e5j/XldGlcbM1gNBsjHwDHEYaLe7S9RiPXZ1W7mltKi9BkpYKDmj2yTg
        q07jroDA/Hv0GiN2v4/y5Hnu16s8JqIazwNxATIAyo3LlnVXgJJ7ZaoZlywtMPt5
        psgW4/cu2Cv3WM1GusgfRaylqiEyQoVbFnszOfN0WOCQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=vf4n1+nLT53Hj910E
        tvWlZIgopkqH8M15zckwsTbDA4=; b=Tckla9H7GnkxdbL7mLmS/d/pSWJo7DlU9
        aZ4ZWCNlttiGqiaXlmFf84RXhhFYWS4YeO/i2sf7pe8pTAR7aw6jhD3XpiSFBUQR
        5fILEHKMQt48b11Qpso+SgblrNQp9ML3iWFYP/ixTz8cREHwypuvDc/Jmu6WGIbu
        M65KVJxiyH3ExLm5GfUkazD9LJb1w/hph03A/Cv2SC9ivx0yFiNmEmDrfkDiex0C
        kikZJIGCqU5PZyPLqk5VarcDeu9xnZTDZUP3ji6O6OG8RYQpY1IQhITyY+zIUs9d
        QlWTHW0rNexG2vgR1tPzBwD5dMIfDBXsdXfcMgfIJ/JPg9b5ojGXA==
X-ME-Sender: <xms:U3O8XlTsYxwuw6XkChxGarPP9KspxLngqGqRR1bqL2LRfR-3nzU7hA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrleehgddtlecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffoggfgsedtkeertdertd
    dtnecuhfhrohhmpeeuvghnuceuohgvtghkvghluceomhgvsegsvghnsghovggtkhgvlhdr
    nhgvtheqnecuggftrfgrthhtvghrnheptdetvdegvdetudegieekjeefteeukeefhfeuue
    fgkeehgeejueffgeefffeggfeunecukfhppeeiledrvddtgedrudeikedrvdeffeenucev
    lhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmvgessggvnh
    gsohgvtghkvghlrdhnvght
X-ME-Proxy: <xmx:U3O8XuwzRdq-ec7Fo8aytRrFxNwzyR0Yy2u-anTLjnCKwJxmmZoTeg>
    <xmx:U3O8Xq17DZmQImsssJJcIvUDMDcBq6_s32aBVHhz0U_ZtvK2lvHQiQ>
    <xmx:U3O8XtCCOpbAN3R4UJEv5yn7nseOWg0eASHgXTTLGFWHCilvzsBAdw>
    <xmx:U3O8Xkd4C6Oixm5YeH8gFz95ZkJSM5efd-pXGcQ6XHy3KuxWOStI2w>
Received: from localhost (cpe-69-204-168-233.nycap.res.rr.com [69.204.168.233])
        by mail.messagingengine.com (Postfix) with ESMTPA id 16E953065E6A;
        Wed, 13 May 2020 18:23:15 -0400 (EDT)
From:   Ben Boeckel <me@benboeckel.net>
To:     keyrings@vger.kernel.org
Cc:     Ben Boeckel <mathstuf@gmail.com>, dhowells@redhat.com
Subject: [PATCH 0/1] Clarify keyctl_set_reqkey_keyring(3) return value
Date:   Wed, 13 May 2020 18:23:05 -0400
Message-Id: <20200513222306.870160-1-list.lkml.keyrings@me.benboeckel.net>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

From: Ben Boeckel <mathstuf@gmail.com>

Minor documentation fixup I noticed.

I'm still in the process of migrating emails for various usages hence
the email From mismatch here (I've migrated my list subscription, but
not my general contribution email).

Ben Boeckel (1):
  man: clarify that keyctl_set_reqkey_keyring(3) returns the old default

 man/keyctl_set_reqkey_keyring.3 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)


base-commit: 704802463dd1fd74000132d4325300c718a4b474
-- 
2.25.4

