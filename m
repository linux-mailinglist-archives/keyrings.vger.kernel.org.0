Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4BAAA2F4F5E
	for <lists+keyrings@lfdr.de>; Wed, 13 Jan 2021 17:02:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726709AbhAMQA4 (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 13 Jan 2021 11:00:56 -0500
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:43745 "EHLO
        out3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726693AbhAMQAz (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 13 Jan 2021 11:00:55 -0500
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.nyi.internal (Postfix) with ESMTP id 9B2445C017C;
        Wed, 13 Jan 2021 11:00:09 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Wed, 13 Jan 2021 11:00:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=benboeckel.net;
         h=date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm3; bh=WkkiuigdyQyNcR5yEmbXWwTKyNU
        Y3+vv16S1l+0Mtcc=; b=Ih1L9IwVJAG+qsrVV3ju6alR0tOa3YMsoN03oO9AU8V
        UVFqo7ORINtMkDRRa9inHQG0MKKuT9+NyCv4VUiFqFZ5cxEXzhQupOnvqse75Fta
        jH1Q05jsdFoJAQ4jftaQPluOo6JUVah4+BipUvq+t8TuGFPt+zrPoTCt64DoAMB7
        YE0NKrEPnEG+qQFmjJGX9ZnXIgcMORHlm69mdR6JAPDiwt0wv85J/DapDX3E0Spm
        k4tBZmlKXqvI7K1D0CPCuZC9jjBPAU8QcwTWZxsqH35ui3xxiAkRRRwN1W2YmQAQ
        PU7/wM/HK2WG7EAb4MYh0+buPFK5HP3d4Ljx0AY5gVw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=Wkkiui
        gdyQyNcR5yEmbXWwTKyNUY3+vv16S1l+0Mtcc=; b=Thc6cq2wJftTQ9usmSXH1q
        EfYJuxlyk3CeuulCL7WIlz0GPEEE32Y2k9s/q3ZSXvjinjJuwm0QZVChemQiTA06
        iwQsqXgd+qb70pEnghcT9C0fm51GeWspVY0/uSUNcczV2zUWm08gj5o5YCGxesfs
        ICgl9RMWkdNApMoi5f8+5bPJHNwh3LMjsNLKDY96kCxEOljRO2Oq7mXSEuXu+erB
        OqvVrsUTQ26RxuSNMzVM5SIzR3S1Qg9yYZm1eBC7KO1FxRP3i075TJp8j53ur6M4
        sxEjJ2EYEJX6dhN+iTXbCWZU6j4ga5NZK7R1a9CfIQIS57891aO07HW4M8OyELBA
        ==
X-ME-Sender: <xms:CRn_X1fcxoTBKRGGu4ETDCgkVB-LCZpBTgQ4u0IjfLw7DClCsOG1eA>
    <xme:CRn_XxAJ9p08xFGFm_JrleNDEdOjbMZDcOyIsbxQ_-yPygd2J7lWAqfMxYJw_Utts
    ewV2xukjqOgzOm1Uqc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedukedrtdefgdekvdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujggfsehttdertddtreejnecuhfhrohhmpeeuvghnuceu
    ohgvtghkvghluceomhgvsegsvghnsghovggtkhgvlhdrnhgvtheqnecuggftrfgrthhtvg
    hrnhepvefftdettefgtddtkeeufeegtddttdeuueegkeegteffueetffejudeihefhkedt
    necukfhppedvgedrudeiledrvddtrddvheehnecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepmhgvsegsvghnsghovggtkhgvlhdrnhgvth
X-ME-Proxy: <xmx:CRn_X49x5zUfETr5_RAIz5G9rXLOwcRyRAnQTLw2IBRik8go9bpNOQ>
    <xmx:CRn_X8Ih_ONPgW7TtkRRrFndwv-eI-C6ZUNWAYYCRuStL9ZS2y5avg>
    <xmx:CRn_Xxi_cXtz1oyQfYamjM4Bzg0R8rFbHnxgfkh1z9uviFmjj2XlQA>
    <xmx:CRn_X7U6Kn7Qo8di7bKeoaat_oFKuefh0tL3DHsOF7A9lSuCFPZRRA>
Received: from localhost (unknown [24.169.20.255])
        by mail.messagingengine.com (Postfix) with ESMTPA id B8F3424006E;
        Wed, 13 Jan 2021 11:00:08 -0500 (EST)
Date:   Wed, 13 Jan 2021 11:00:07 -0500
From:   Ben Boeckel <me@benboeckel.net>
To:     Rolf Eike Beer <eb@emlix.com>
Cc:     David Woodhouse <dwmw2@infradead.org>,
        Linux Kernel Developers List <linux-kernel@vger.kernel.org>,
        David Howells <dhowells@redhat.com>, keyrings@vger.kernel.org,
        linux-kbuild@vger.kernel.org
Subject: Re: [PATCH v5] scripts: use pkg-config to locate libcrypto
Message-ID: <20210113160007.GB3081990@erythro>
References: <20538915.Wj2CyUsUYa@devpool35>
 <2278760.8Yd83Mgoko@devpool35>
 <3394639.6NgGvCfkNl@devpool47>
 <20210113155757.GA3081990@erythro>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210113155757.GA3081990@erythro>
User-Agent: Mutt/1.14.6 (2020-07-11)
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Wed, Jan 13, 2021 at 10:57:58 -0500, Ben Boeckel wrote:
> > Cc: stable@vger.kernel.org # 5.6.x
> 
> Note that keyutils is not in the kernel, so I don't know how useful this
> is.

Scratch that; I remember a similar patch for keyutils; this is for the
kernel.

--Ben
