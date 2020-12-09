Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E0B12D49D0
	for <lists+keyrings@lfdr.de>; Wed,  9 Dec 2020 20:09:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387579AbgLITIM (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 9 Dec 2020 14:08:12 -0500
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:58843 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1733296AbgLITIM (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 9 Dec 2020 14:08:12 -0500
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
        by mailout.nyi.internal (Postfix) with ESMTP id 0C1375C00F9;
        Wed,  9 Dec 2020 14:07:26 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Wed, 09 Dec 2020 14:07:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=benboeckel.net;
         h=date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm3; bh=1snqE7Ftfxop2fQ2t5zP5kMfY4U
        OOZ/fUjqKfQxRkxk=; b=is2QQ14JuNoHaJ1w1fSoa1FgWLtiSJc9bUa8U0Udm7g
        0G77gEzTh2QCkwCOKnhhHPS2Ifzu99SrT9J+L9f2SHtGv1n8D/WYNWjBszYP3abM
        VZTRsSsbNPvKZR2hqhc7YMQXbsHAA16Je52h0LyspjX7z+K6BbKR0KbmLDLrdzLZ
        kxDoDYrdPvIP+zJRn0KeWXXJ74PjkrS3T8wp3PzjXIRhHFuEf+Y6KgM8oecZ3cYG
        K/6EB2/KOxeEVNXKkguRix3njAmRUg5AQBe//PwHvIuM39EM3nD95Nx0XnKHa3Ma
        fD1u/diyAhyRjKKeXGhTosR28FsvUcDSS06wJzaIrmA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=1snqE7
        Ftfxop2fQ2t5zP5kMfY4UOOZ/fUjqKfQxRkxk=; b=A1Lw2Wc6L55RAmE3chrRiv
        /KDFxiLkRgL7iyuvMR1937uj66TeO5dDuBxIEols6o5bIpo+f53b0pUrNfVx4jzP
        1fijL9GAGKVzwJDZT1Vvnl7bNGRYLzWHi96B4D5ZIr+w5xh4AM+yhjOcWNwbETzB
        6KzIVRNoQKDQPVm+BexYHfOntgRHwknCUbysNn08ScWJJLROtIJ14dY4bq4Al9sv
        lmxNbu+Kr6Jadvmx53dKHRBTJ0wAdCmCcQLVZh+zjBA8ZO6mYt4TUuDPi48d+o7n
        +jaVcyoUZgqe1q3ot/aUcEnS19TnFPjm22Rt8FvjtKBnoFq3acLeThTTlP9GAkJQ
        ==
X-ME-Sender: <xms:bSDRX3gRKjuFCSQ0Ii54rJtDiz1YpJ2FoYc8XAZr1Au93aSAH6wWmg>
    <xme:bSDRX0BcMW_gHXfmJ7_Nu_zMlitSc0o6MY-zWtzzfLA-Ifn6hPqFupoAxwe_4x4XM
    LjXVXJBTmEUZno93ic>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudejkedguddvvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvuffkfhggtggujggfsehttdertddtreejnecuhfhrohhmpeeuvghn
    uceuohgvtghkvghluceomhgvsegsvghnsghovggtkhgvlhdrnhgvtheqnecuggftrfgrth
    htvghrnhepvefftdettefgtddtkeeufeegtddttdeuueegkeegteffueetffejudeihefh
    kedtnecukfhppedvgedrudeiledrvddtrddvheehnecuvehluhhsthgvrhfuihiivgeptd
    enucfrrghrrghmpehmrghilhhfrhhomhepmhgvsegsvghnsghovggtkhgvlhdrnhgvth
X-ME-Proxy: <xmx:bSDRX3EfRjNdxBrBZrzb7Y3GYlzgarGzQFKuUq97e4SBiAsiaHy-0Q>
    <xmx:bSDRX0RVKhTl6-WWgZpJy4-JKUX764WmBC2b6qFBxBPvzF60sVPUVA>
    <xmx:bSDRX0wqlW3Lt75oRkL3geVLmLfv9-KfEmIB8Qq3BAD_YNWF2tFEQA>
    <xmx:biDRX_-0RtOHy9dLqEW7RXyOmJxOyKpcUQBYRXCY9qWrzWnl9io5Rg>
Received: from localhost (unknown [24.169.20.255])
        by mail.messagingengine.com (Postfix) with ESMTPA id 5AF591080059;
        Wed,  9 Dec 2020 14:07:25 -0500 (EST)
Date:   Wed, 9 Dec 2020 14:07:24 -0500
From:   Ben Boeckel <me@benboeckel.net>
To:     David Howells <dhowells@redhat.com>
Cc:     Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
        Tom Rix <trix@redhat.com>, keyrings@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 07/18] KEYS: remove redundant memset
Message-ID: <20201209190724.GA1448831@erythro>
References: <160751606428.1238376.14935502103503420781.stgit@warthog.procyon.org.uk>
 <160751611918.1238376.7060458630378643472.stgit@warthog.procyon.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <160751611918.1238376.7060458630378643472.stgit@warthog.procyon.org.uk>
User-Agent: Mutt/1.14.6 (2020-07-11)
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Wed, Dec 09, 2020 at 12:15:19 +0000, David Howells wrote:
> From: Tom Rix <trix@redhat.com>
> 
> Reviewing use of memset in keyctrl_pkey.c

Typo: `keyctl_pkey.c`

--Ben
