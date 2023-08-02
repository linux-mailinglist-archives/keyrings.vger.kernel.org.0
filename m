Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C66C576C2FF
	for <lists+keyrings@lfdr.de>; Wed,  2 Aug 2023 04:36:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229933AbjHBCgB (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 1 Aug 2023 22:36:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230454AbjHBCf7 (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Tue, 1 Aug 2023 22:35:59 -0400
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E0E2E4E
        for <keyrings@vger.kernel.org>; Tue,  1 Aug 2023 19:35:59 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.west.internal (Postfix) with ESMTP id 9FC423200754;
        Tue,  1 Aug 2023 22:35:55 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Tue, 01 Aug 2023 22:35:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=benboeckel.net;
         h=cc:cc:content-type:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to; s=fm2; t=1690943755; x=
        1691030155; bh=iypeiCHUTlHS640tn5dlLjVdUoFBX+Kqq2ygC4ljHew=; b=T
        eky8YlAmtwuf77/VR8Y0PqlJPxmoezPhYXwIHvPEZ+K+6H3/ss3GFlNdKRo97fTw
        lo2FNRFR+lqSiBcVov3kBDB81mI4G7XPyBBwfTZuA2mvAjaw210sYOD+WEapmp9f
        6J3giL2BwmwX1UOuucZCjEcBVodp3izn5jTFR+z0SnIAA48+HGku1WFsdKQ6mAIh
        4CQ7Ch2nvq28ClrvIc+kfKREFf1f3HaoaK/4URI91aRQzUsHvsI3yv0B2gEtxEDq
        p4YX9jalsYNX3ZXWa+6QXL/zwTZ3x0Zlh4s4nyucWEMCDBjhdeYk6bA35duMbwoy
        9gXI6tzf6cqGQjEZejs/Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:content-type:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; t=1690943755; x=1691030155; bh=iypeiCHUTlHS6
        40tn5dlLjVdUoFBX+Kqq2ygC4ljHew=; b=qHPIA2ld91I1sCyhu0sFM9+r3jumZ
        9kkqKn8gikH5GbAKx0aSatuISJ4H+/7P4OoiVw3rbw+n2vhVRPrfHDaaVtQfN97+
        nR+Zv519k+srmC5HGlMRu6NfemBwY8BWsvEY08OPmOpCLX2qvDhRgcvHYD05tQPp
        RWQ9CB0kYGlWT7iI2I/FSRg1uphHmHDxntpsq1BJKI0WL0zqn+WEC5zUu2n5Hoy6
        xk/Q3gjo8P4RVI7n4v92ipKJvo4P2DmfVBzewukTU0+mdNHctObDekEw3I5FQtXO
        kAtAYWPOCfxy7LWi5Z1+KvKGcmzt8zdml8Igqj0I7UD65yXkUd0qa4JvQ==
X-ME-Sender: <xms:CsHJZDsL1w7TlZOjkPf5EoGQrb1pAHzCoiGykzgZK3glRtrKQqtsIQ>
    <xme:CsHJZEfmAFLhBwIU06agKhQfWlow8nUV7MCUPiQPCDNbpt4kXFx4WxXqVILuZbYRF
    oEUBMRPTYibjCj5Nqo>
X-ME-Received: <xmr:CsHJZGwuGozGlwaIpD1zLNDPuaUJg4LqH00zgZpfAwJXRik6QiB3HOyXttNjmQOMLSa3bXTiSCBjDWZZB-oq0skDjW_OqxuYsINL>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrjeejgdehlecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfhfgggtuggjfgesthdtredttderjeenucfhrhhomhepuegvnhcu
    uehovggtkhgvlhcuoehmvgessggvnhgsohgvtghkvghlrdhnvghtqeenucggtffrrghtth
    gvrhhnpeetgfevgfffhfevleethfeftedtfefgleetfeehtefgjeefgfefiefgueetvdff
    feenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
    enucfrrghrrghmpehmrghilhhfrhhomhepmhgvsegsvghnsghovggtkhgvlhdrnhgvth
X-ME-Proxy: <xmx:CsHJZCM4TuXs-ofe2keByqCAV7inEalrBQ_dEpdBUg8bC3uWZ0G27A>
    <xmx:CsHJZD8dRT-AvGBDadwjgev0_H9YAWaa-XmFIR3v17SLFQvYyoWPnA>
    <xmx:CsHJZCWqriG0TdXOj9toUvEApE1VeiUd1cIFyWOgFPHiog5uqVwMLw>
    <xmx:C8HJZFLz-CzP6OPxTlflE6NiU91qfq0HPZ0uYkQIIVjo8utAGDLLmQ>
Feedback-ID: iffc1478b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 1 Aug 2023 22:35:54 -0400 (EDT)
Date:   Tue, 1 Aug 2023 22:35:53 -0400
From:   Ben Boeckel <me@benboeckel.net>
To:     GUO Zihua <guozihua@huawei.com>
Cc:     dhowells@redhat.com, jarkko@kernel.org, keyrings@vger.kernel.org
Subject: Re: [PATCH] key: Make key_sysctls static
Message-ID: <ZMnBCW7vlvvic/N7@farprobe>
References: <20230802021542.13473-1-guozihua@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230802021542.13473-1-guozihua@huawei.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Wed, Aug 02, 2023 at 10:15:42 +0800, GUO Zihua wrote:
> key_sysctls is not used outside the file. Make it static
> 
> Signed-off-by: GUO Zihua <guozihua@huawei.com>

Previously submitted:

    https://lore.kernel.org/keyrings/20230611113210.182652-1-trix@redhat.com/T/#u

--Ben
