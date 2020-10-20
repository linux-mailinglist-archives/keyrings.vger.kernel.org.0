Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE73C293D87
	for <lists+keyrings@lfdr.de>; Tue, 20 Oct 2020 15:42:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407608AbgJTNmM (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 20 Oct 2020 09:42:12 -0400
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:34851 "EHLO
        out3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2407531AbgJTNmL (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Tue, 20 Oct 2020 09:42:11 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.nyi.internal (Postfix) with ESMTP id 578845C013A;
        Tue, 20 Oct 2020 09:42:10 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Tue, 20 Oct 2020 09:42:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=benboeckel.net;
         h=date:from:to:cc:subject:message-id:reply-to:references
        :mime-version:content-type:in-reply-to; s=fm3; bh=ZMa3Hsq3K6k+WS
        uLm783S+v1/oervsBHxqi7iGWY/I4=; b=Uv/im2nZoer0hdGfr5/1zto0w7WIeF
        0yZmxErjYDCKJevCcTc7WbpCpOMzz2BuqkVCoDlotinUlkni5oMlIyCcWWkNWLcs
        liOKshgrPNrXFF0VZ3NTBHcJDBGtVxIOeKDFp3KMBZsFOb4i5Nj83Cqw7+fimAmm
        vXxSmMWTyy+d2eWGxoXhK0pcpaHtsbGMK9kodpVOhC2QMZ5YJpH8I8LNmw3J3e6N
        GVimvV2htCCqFOlMNIrT8B0PSBcH9WZZFZWMEYJK1jmjpBD/KraM6eNQERza0YV/
        f0Lti5JcXMRyG+eZmvyBtZJYOWuU9fXKQA3Q7qnJNJEqwsl7WNaNNxIQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:reply-to:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm1; bh=ZMa3Hsq3K6k+WSuLm783S+v1/oervsBHxqi7iGWY/I4=; b=DdH/db0e
        ebewXcjVeVdw5hVlDo77I9TI1AY3bvbST2t0qrfOM+nd9PdyMWNLXBJ6p4G8DfaQ
        WuFLLXAvLD1uFNmdPAfRLgF+I+R+vGpea0THoD/H4E5BsXHxOId9ix3x5T/DJheJ
        2fxBtTZdvt+YHcf6OrKCxvv/TmdW5qOLhrzFO5CwJRap1faX8ANKtb1LixuNbceC
        RBseVze5FxCtMHKl285sTq46BhSioNK11jC3DCh6uwlkSbTfTmknwyph5DwulLAU
        eD7YandfKstBR+53JoYDot4mlcV3mb+XLN2LwLeDSPL4nhWx+Az8UqZ0+UbrNnFg
        LcDzOrzS+cZ3Gg==
X-ME-Sender: <xms:MemOXx91CV1zACq219WOPG7C9hXBzrgk1ooCYZ4oTlGxwrHUshvQ3Q>
    <xme:MemOX1vUyj5AM2he_kA6MO2nBvlEDbwi4bqSZClrSDcfwfAID35DYa94bTvUMY5XK
    ZMHi9fmT-pljX584AU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrjeefgdeiiecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkrhhfgggtuggjfgesthdtredttderjeenucfhrhhomhepuegvnhcu
    uehovggtkhgvlhcuoehmvgessggvnhgsohgvtghkvghlrdhnvghtqeenucggtffrrghtth
    gvrhhnpeejtddvffehtefgkedtheevgfeileegfeehjedvhedtudeiteegtdeftdelvedv
    ffenucfkphepvdegrdduieelrddvtddrvdehheenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpehmvgessggvnhgsohgvtghkvghlrdhnvght
X-ME-Proxy: <xmx:MemOX_CEapx_CgKEyP8UMfda87_RgGDsLPhyCHvh-siyrsxjprEQKA>
    <xmx:MemOX1em7T5_lI2PnXoeeNW58u5aziQQg0eqYj7O8B9LxGDoWzFSZw>
    <xmx:MemOX2PBGVWfFF0nwdTwUAhbcJCAPYFAe_GUqil_YzcXtWy4jeIfTw>
    <xmx:MumOX933Qoe5fpH4IFCmYtqROWjVDCN2FuK4bfNX9XwPeDaxvPREpw>
Received: from localhost (unknown [24.169.20.255])
        by mail.messagingengine.com (Postfix) with ESMTPA id 495C53064680;
        Tue, 20 Oct 2020 09:42:09 -0400 (EDT)
Date:   Tue, 20 Oct 2020 09:42:08 -0400
From:   Ben Boeckel <me@benboeckel.net>
To:     "Lee, Chun-Yi" <joeyli.kernel@gmail.com>
Cc:     David Howells <dhowells@redhat.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S . Miller" <davem@davemloft.net>, keyrings@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
        "Lee, Chun-Yi" <jlee@suse.com>
Subject: Re: [RFC PATCH 2/2] PKCS#7: Check codeSigning EKU for kernel module
 and kexec pe verification
Message-ID: <20201020134208.GA297878@erythro.dev.benboeckel.internal>
Reply-To: list.lkml.keyrings@me.benboeckel.net
References: <20201020065001.13836-1-jlee@suse.com>
 <20201020065001.13836-3-jlee@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201020065001.13836-3-jlee@suse.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Tue, Oct 20, 2020 at 14:50:01 +0800, Lee, Chun-Yi wrote:
> +config CHECK_CODESIGN_EKU
> +	bool "Check codeSigning extended key usage"
> +	depends on PKCS7_MESSAGE_PARSER=y
> +	depends on SYSTEM_DATA_VERIFICATION
> +	help
> +	  This option provides support for checking the codeSigning extended
> +	  key usage extension when verifying the signature in PKCS#7. It
> +	  affects kernel module verification and kexec PE binary verification
> +	  now.

Is the "now" necessary? Isn't it implied by the option's existence?

--Ben
