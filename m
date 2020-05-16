Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 945B61D5D2C
	for <lists+keyrings@lfdr.de>; Sat, 16 May 2020 02:23:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726290AbgEPAXl (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Fri, 15 May 2020 20:23:41 -0400
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:50263 "EHLO
        wout5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726247AbgEPAXl (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Fri, 15 May 2020 20:23:41 -0400
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
        by mailout.west.internal (Postfix) with ESMTP id 8F4967EB;
        Fri, 15 May 2020 20:23:40 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute7.internal (MEProxy); Fri, 15 May 2020 20:23:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=benboeckel.net;
         h=from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=fm1; bh=DHX2SqCVdflBOPJLzxBLj0R9fI
        OnOu/JyUXRocYPfcI=; b=h1KBlMh11N+fmtlJwkbOcLSBheVA+63UWVpZyVWntB
        qey1BxgyDUuxegAPf5SEFKjg9Uru2FAfsr6vDan/uYYh2PsHIrjEWzIt8mwaYn+y
        hlZTFOq8oIfQuST5MtXDvIcEXAEiKPDJbkPLaQCVIno6sFkzbpOx5qqWCHCkoDu2
        rbmV84Hsuw652x8YeXzllyvj4ZsqhTMpXcmIRrN+xuFV7UgGFdq2ubSizjFcNt7O
        D5SzQb6H6mkr04p3/yw7ZH6pNpXWBoYVCwTltBxGgCu8Jxc4XjbyReGTR7x6A3AH
        wM16JRSOx+ypuYPwJ2RIzc4AubqpJLTOs74PajGM2W0A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=DHX2SqCVdflBOPJLz
        xBLj0R9fIOnOu/JyUXRocYPfcI=; b=xwi214DbjpGGaNczDkU3cFd3cU3YJ75Hc
        t5g+7V3edLamJDgZse4az7At/b039d6R7CR4ZRVrPW50gp/bd9gC7gkmEy849RVK
        dc3qHAV85P0+hqjN/GlIAzpRRjLUE4BAOYKyBTQ9i0SPiDPTx0+itQlY4t8zX2GF
        cNJ7a2ZZyCSy6G8krmbiZrsQqrEuUVcUx0Hl0zIdDfsrFROw+asFaS7T5n6U1Ndq
        XJK0bTO0xo9VTdVnmT0DqoB39rkL/bfgD8cR1F+or/6XktSL83irFeUCRFL1GxFF
        Yi20VSheQeRST3MOrEsODXLnK7/wos3i5GqhVYZ7gQrEcs2qxn9eA==
X-ME-Sender: <xms:izK_XpsuqPKx0u0bM0JAzjRy6LMKpp-FCllH0kd_opsf8k0ReFfUYg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrleelgddvlecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffoggfgsedtkeertdertd
    dtnecuhfhrohhmpeeuvghnuceuohgvtghkvghluceomhgvsegsvghnsghovggtkhgvlhdr
    nhgvtheqnecuggftrfgrthhtvghrnheptdetvdegvdetudegieekjeefteeukeefhfeuue
    fgkeehgeejueffgeefffeggfeunecukfhppeeiledrvddtgedrudeikedrvdeffeenucev
    lhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmvgessggvnh
    gsohgvtghkvghlrdhnvght
X-ME-Proxy: <xmx:izK_Xic2VRSudL7p9TPSNNm9HRu0SVWqQ9EHroly0IwD7-KsUPRL7g>
    <xmx:izK_XsxwQ-wwhnXSqUOxrR5hY-OAmRfckGWuIY4ezysMgpqy09spvw>
    <xmx:izK_XgO7AVltGYy93eLYHgUtC_vtzzhY_0ywqiEV2QKYzFxSi2HPlw>
    <xmx:jDK_XuJmBQhulBCFqP8fIkviW6D2zo8lxoMWLMCMcuOESEL5DD0PPA>
Received: from localhost (cpe-69-204-168-233.nycap.res.rr.com [69.204.168.233])
        by mail.messagingengine.com (Postfix) with ESMTPA id 9F74D306635A;
        Fri, 15 May 2020 20:23:39 -0400 (EDT)
From:   Ben Boeckel <me@benboeckel.net>
To:     keyrings@vger.kernel.org
Cc:     Ben Boeckel <mathstuf@gmail.com>, dhowells@redhat.com
Subject: [PATCH 0/1] Fix mention of comma-separated pkey query strings
Date:   Fri, 15 May 2020 20:23:33 -0400
Message-Id: <20200516002334.2025760-1-list.lkml.keyrings@me.benboeckel.net>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

From: Ben Boeckel <mathstuf@gmail.com>

I'm not sure where this comes from, but the code in the library and the
kernel only supports space- and tab-separated parameters.

Ben Boeckel (1):
  man: the info strings are actually space or tab separated

 man/keyctl_pkey_encrypt.3 | 4 ++--
 man/keyctl_pkey_query.3   | 2 +-
 man/keyctl_pkey_sign.3    | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)


base-commit: 704802463dd1fd74000132d4325300c718a4b474
-- 
2.25.4

