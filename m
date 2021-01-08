Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 420DD2EEA71
	for <lists+keyrings@lfdr.de>; Fri,  8 Jan 2021 01:34:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729480AbhAHAc0 (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 7 Jan 2021 19:32:26 -0500
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:33491 "EHLO
        out5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729406AbhAHAc0 (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 7 Jan 2021 19:32:26 -0500
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
        by mailout.nyi.internal (Postfix) with ESMTP id 7DD015C0238;
        Thu,  7 Jan 2021 19:31:40 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Thu, 07 Jan 2021 19:31:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=benboeckel.net;
         h=date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm3; bh=nfWvfYQDoqQotE2wDsq3+Z7Q4Rs
        5JEQ3R0Us1TVe4Fc=; b=T0sNAXRq+qOAipF+9ZvDvlIF/E1zDPtD0jrxdVjRXYv
        A349zDYuETIV8edQ8CxCChxks6XDGY9OtpLHA/Ukc8f5HFGNsqVsCgIPrXyL9Rva
        Ug3ZTgJCfcApq/ZlQB3URpHSEgWF+NsCtlo1W/MIMSlDoKjcOkw15r6hBDPu5N+7
        tDwxTySh2zYrj9x+EF3RTrNntc7ccDMf8YPtmRDDzTA9l8y/I5xCkWf8nZgmccEx
        r7Gbxjpvp902qz/WEbZjNn3RS2oQvJHb2gXS+9qbemWUw20l3JFdwS997NCvkzfI
        fhqrMlUlzOA3xzpkCA0dLWGoEOk2ueAhM0/8VLO575Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=nfWvfY
        QDoqQotE2wDsq3+Z7Q4Rs5JEQ3R0Us1TVe4Fc=; b=StRyfmOIria0n11So8M7Ne
        /mJnzqFrUxMVsOyWiOoDrJwikQrcFY8yepfp9SJS3cF1AKK8GWWIP2hsYlK6ap5S
        c/vn/DY36d1lfUZBPdrglz9fG2MgJJ8lBQrOLSa+wK3cV50y1Xn5itSRii+d76HF
        F+HOpZWt8FK2Br3qZU3buj6B86MeQiTIUftpet3c+M6Y70vXm/Hal7uEAP/pQCe2
        3pcStq2s0o0VNrarvyUe3OT6BiAHN12pJu4wqWWN4VZu/62wa/naoJPgkVdHCWBS
        5w8KkMMao8jDpOAAb7r6Ln3OxbYp02ZTz9/3xe4S5Xw0WKusYSNCJxMRDwoSI0cA
        ==
X-ME-Sender: <xms:7Kf3X3jn0ouyhaEHk2BULgEbAmLtC9kCtz5md6F4jsHHf6jWyLeHtQ>
    <xme:7Kf3X0B6WL9He-ut7u_lUfykrJ718PO2otBJdwp3N2I0qowfE-rreLfV7Dh-yJ50b
    uPIrNz6yzgcN4pLwxc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrvdegfedghedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjfgesthdtredttderjeenucfhrhhomhepuegvnhcu
    uehovggtkhgvlhcuoehmvgessggvnhgsohgvtghkvghlrdhnvghtqeenucggtffrrghtth
    gvrhhnpeevffdtteetgfdttdekueefgedttddtueeugeekgeetffeuteffjeduieehhfek
    tdenucfkphepvdegrdduieelrddvtddrvdehheenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpehmvgessggvnhgsohgvtghkvghlrdhnvght
X-ME-Proxy: <xmx:7Kf3X3Hl4SCGBmOx69ldDivRrV5TnGlI_0ZDw8PNHVh6s1-vbTtz4g>
    <xmx:7Kf3X0SjYbuXGWNInWsJ3qMmj_tXxiva7GCYQ-S-u1yFImkpmwPCwQ>
    <xmx:7Kf3X0xgNTj8fB8uLTnlxzqob1-cVBMbuD2VBXS5aAlUcvAqSbBkIg>
    <xmx:7Kf3X6bfQQvd0rmAN2CJIrBB-bSpOacMx8B2EtNKvigPoE9aXxddwQ>
Received: from localhost (unknown [24.169.20.255])
        by mail.messagingengine.com (Postfix) with ESMTPA id 28B2924005D;
        Thu,  7 Jan 2021 19:31:40 -0500 (EST)
Date:   Thu, 7 Jan 2021 19:31:38 -0500
From:   Ben Boeckel <me@benboeckel.net>
To:     Alison Schofield <alison.schofield@intel.com>
Cc:     keyrings@vger.kernel.org, Dan Williams <dan.j.williams@intel.com>
Subject: Re: Request_key from KMIP appliance
Message-ID: <20210108003138.GB575130@erythro>
References: <20210107213710.GA11415@alison-desk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210107213710.GA11415@alison-desk>
User-Agent: Mutt/1.14.6 (2020-07-11)
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Thu, Jan 07, 2021 at 13:37:10 -0800, Alison Schofield wrote:
> I'm looking into using an external key server to store the encrypted blobs
> of kernel encrypted keys. Today they are stored in the rootfs, but we'd
> like to address the need to store the keys in an external KMIP appliance,
> separate from the platform where deployed.
> 
> Any leads, thoughts, experience with the Linux Kernel Key Service
> requesting keys from an external Key Server such as this?

See the `request-key.conf(5)` manpage. I don't have experience with
actual usage or deployment though, so others might have more input.

--Ben
