Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0F5E409F5F
	for <lists+keyrings@lfdr.de>; Mon, 13 Sep 2021 23:50:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235288AbhIMVwJ (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Mon, 13 Sep 2021 17:52:09 -0400
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:44811 "EHLO
        out3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234843AbhIMVwI (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Mon, 13 Sep 2021 17:52:08 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.nyi.internal (Postfix) with ESMTP id 0A0F95C0044;
        Mon, 13 Sep 2021 17:50:51 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Mon, 13 Sep 2021 17:50:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=benboeckel.net;
         h=date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm2; bh=UYEYCU8gqZJ2bReAEG8Lc2ZtHMz
        5oEfxw9rs1WIx1xw=; b=VP9mKyJhUraSRCRhHaLIehB316yoCR+ET7luKSzqnfK
        ok0DSi1FGJqjQ126RHOLNp4thOFs38Rde4s9MppneGs8mxhti22vf8hK0z+XnAQr
        NErr6REq2IlzFpVdnHeql5svU0O4xCV1webKxiqMPO6ToKEvOlr/8EpFUECT8Eqy
        pX+zDMQ2rio8znEPuxoG1pqqFwb5268mnSnfF38B1CUKmLHiesSo+eqlwJoJ+ela
        cCrA03x/RE55Cn6mc+DqqopYI4zMnUo7aPeWkN7MyylBcBZD9KFqjb/3OhSfrgrI
        Q2Cv5ooO1v9qnZ22IH9FEvfJX4L95f3g1SqMvhilZQQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=UYEYCU
        8gqZJ2bReAEG8Lc2ZtHMz5oEfxw9rs1WIx1xw=; b=i0BSZwCYsj4pQXXnls0Z/d
        PsYkhidUjMb5m36lbYIXzcpsYq0i+zc2TlUCjd62na090E+z7PXsUs1IkTdoGPJ/
        xmzpmACUup4HJMFxD0k5NPRKs5dp7WoMriT64TXddBDcgH4QaC1MWIxirN1Bv5P5
        UtAJp9wtRen1V+Qb4T2peSKhFnezpBL1/ychtLG23EU+6blq9Kd17GKu+Uz8zlr6
        thM0nU/AYHRvzG+xmhcdmL4jLe2Zwdqi2AfNAIaTK/Osm6RW2u7Vv07WtjBm4iPT
        YXa3s50UZwWEm02SM5MESH4Zhd0EgS6XvMgEj6/nskGKXTURighplI1h3PSl6URg
        ==
X-ME-Sender: <xms:usc_YdDfIwOBh8xbst4FD5vOdBXtNEmoMjMj-yXggKy_zyC00eqXJQ>
    <xme:usc_YbhHEY3ToAuTReChHcZz0e9nCJ8iCFIQ4UwUgRatjWrUX1ckA8iuls96RI08I
    HmVPFnlpbRS-53RDrE>
X-ME-Received: <xmr:usc_YYkxyzvNsizPqhXOjLIS9SLI_jQ2n2I8fSn21or7-VZnzrYsqvYIpZ2Wwzv369PNEcs_gagQVEkaJQgLp1RVXw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudegkedgtddvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjfgesthdtredttderjeenucfhrhhomhepuegvnhcu
    uehovggtkhgvlhcuoehmvgessggvnhgsohgvtghkvghlrdhnvghtqeenucggtffrrghtth
    gvrhhnpeevffdtteetgfdttdekueefgedttddtueeugeekgeetffeuteffjeduieehhfek
    tdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmvg
    essggvnhgsohgvtghkvghlrdhnvght
X-ME-Proxy: <xmx:usc_YXyZNMFgvzeJHI-tIpyKKpqnv51T4DLqd2cvxLXNRV63sSRuPw>
    <xmx:usc_YSSG3sfrt_IKpst9N0R6KIgEfhChl1_6hlHnKIRsfKowhPW4nw>
    <xmx:usc_YaYRWmgCRpmgQAJ2IS4vi7GsaLxqvUFAV9GILDZdhalkY6D4nA>
    <xmx:u8c_Yb6WD1G2VFP_6RontxuCf_6cFG-ZmigWY-HxmnYshHITD19VQQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 13 Sep 2021 17:50:50 -0400 (EDT)
Date:   Mon, 13 Sep 2021 17:50:49 -0400
From:   Ben Boeckel <me@benboeckel.net>
To:     Mike Murphy <Mike.Murphy@ultra-3eti.com>
Cc:     "keyrings@vger.kernel.org" <keyrings@vger.kernel.org>
Subject: Re: key.c line 144
Message-ID: <YT/HuUjlsSfQdRl9@erythro.lan>
References: <ef82efdc8861448c924312804ae1ef92@ultra-3eti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ef82efdc8861448c924312804ae1ef92@ultra-3eti.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Thu, Sep 09, 2021 at 14:51:00 +0000, Mike Murphy wrote:
> Current mainline (5.14), source file:
> security/keys/key.c
> 
> line 144:
> 
> key->serial >>= 1; /* negative numbers are not permitted */
> 
> where serial is int32_t.   >> 1 is not converting negative to
> positive. It is making a smaller negative value. 

Sure, but the loop will go around again if it is `< 3` anyways. I guess
it is really doing useless work in that case and should just be
completely removed.

--Ben
