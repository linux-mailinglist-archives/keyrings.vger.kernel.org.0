Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 74A242D49E4
	for <lists+keyrings@lfdr.de>; Wed,  9 Dec 2020 20:15:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728488AbgLITN3 (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 9 Dec 2020 14:13:29 -0500
Received: from new4-smtp.messagingengine.com ([66.111.4.230]:46315 "EHLO
        new4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1732900AbgLITNS (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 9 Dec 2020 14:13:18 -0500
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
        by mailnew.nyi.internal (Postfix) with ESMTP id 15DB0580233;
        Wed,  9 Dec 2020 14:12:09 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Wed, 09 Dec 2020 14:12:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=benboeckel.net;
         h=date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm3; bh=xqge9GL++YyfKHKH4XONW7ozJfi
        dwx7PvG5HtEjyOe0=; b=m3gY3WLVBfZGq/irJNiytLeMlzk/M5NTAAR/FH5jqHr
        /0SmipuGZSJkkQHLZy03t4wdKQvKtNeyujVLs3QQvKg6JLC/JC0a4gxkEUkHjs/Y
        6D28H4EaRr2kgLZg6QDgPG1GbppiuyflIO60t5BbxiK/X8UBOA/Y/utQsYwo1wtJ
        Uh6IVwdCDmCplnnZi2RYkaZZdVHvDiCzM9vgsik+LUr8tl89CYu6l37DLHwPsktL
        o+UB6Wp5njGfoUq7L/dB7O8Z+etIcobJUMMMBQX8yvNJJ7vFhPuM6PUORuTqjA4g
        bs1GVO/iitBXudSv17VToLBGbG+ClYFILvVkN2z71BA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=xqge9G
        L++YyfKHKH4XONW7ozJfidwx7PvG5HtEjyOe0=; b=ft6xD5Jxyu6vQl4RKJVLj6
        JjuBWCO35p679lel5YZypf0d3CtLZ+mofFE6diDitfM4SIMkMmFL/S7pjyDaLBd0
        FXRc5mXE8TbnacwOXp0V3eNzaEiZ8iley6vbY+XNGup1dzyU4XZuoEFbHnik06h7
        oLjFf2pXRaFhCOAlgLGuQ4UN79LKgLzyx2k+Akqm0kiVvN+yGalW9Y9iMNwfKusB
        FcaoX5E8ePqrDtY9yVUbSY+zJT/IBVBeKN5Pw0jAupaAm3oEWuj+ffPZSVQmwp4Y
        CPzH0vzicO6eyFiXK3c+P9oINGZ2cNv1Zd7alLZV1r9ZRUjggyH8LhmRRhZtPBrA
        ==
X-ME-Sender: <xms:hCHRX66wOUyGK3PYwc_CEMwTAwRa3uQT0kiIgZHjHC1DLGz8t2w8Mg>
    <xme:hCHRXz6qqlU5fATQNBifjZZ39A4oKbEqYwrL3zJb1wJaLpcZD3AJz8dxOExZHru6i
    miQsrAYtmxxRnrhOp8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudejkedguddvfecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvuffkfhggtggujggfsehttdertddtreejnecuhfhrohhmpeeuvghn
    uceuohgvtghkvghluceomhgvsegsvghnsghovggtkhgvlhdrnhgvtheqnecuggftrfgrth
    htvghrnhepudffjeegieefudelveekueffkeffjeeiledvgfeiffekkeeihedvveejledt
    tddtnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepvdegrdduieelrddvtd
    drvdehheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhm
    pehmvgessggvnhgsohgvtghkvghlrdhnvght
X-ME-Proxy: <xmx:hCHRX5eIJntLG4IlKcBofqVmsx_lVi7N7qKKRe4dfnqeBDeIZUicpw>
    <xmx:hCHRX3I-NzDLPiJ_DoGzTobgwfd_YWlR25la3yv4MNdyvl8c5C25jw>
    <xmx:hCHRX-LG-9KAiEVWQ-Vh0exrJZqz9or-NauN9V41178F7D0uOAXq8w>
    <xmx:iSHRX2DloI69yDVccwBkLxgeeTdCTFaaRs4phr7s_Un6Q6v7to5v-w>
Received: from localhost (unknown [24.169.20.255])
        by mail.messagingengine.com (Postfix) with ESMTPA id 622931080066;
        Wed,  9 Dec 2020 14:12:04 -0500 (EST)
Date:   Wed, 9 Dec 2020 14:12:04 -0500
From:   Ben Boeckel <me@benboeckel.net>
To:     David Howells <dhowells@redhat.com>
Cc:     Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
        "Alexander A. Klimov" <grandmaster@al2klimov.de>,
        Petko Manolov <petkan@mip-labs.com>,
        "Serge E. Hallyn" <serge@hallyn.com>, linux-kernel@vger.kernel.org,
        YueHaibing <yuehaibing@huawei.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Jann Horn <jannh@google.com>, linux-crypto@vger.kernel.org,
        Jarkko Sakkinen <jarkko@kernel.org>,
        Ben Boeckel <mathstuf@gmail.com>, keyrings@vger.kernel.org,
        Gabriel Krisman Bertazi <krisman@collabora.com>,
        linux-security-module@vger.kernel.org,
        Randy Dunlap <rdunlap@infradead.org>,
        Mimi Zohar <zohar@linux.vnet.ibm.com>,
        Tom Rix <trix@redhat.com>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Alex Shi <alex.shi@linux.alibaba.com>,
        Jarkko Sakkinen <jarkko.sakkinen@iki.fi>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        James Morris <jmorris@namei.org>,
        Denis Efremov <efremov@linux.com>,
        =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@linux.microsoft.com>,
        David Woodhouse <dwmw2@infradead.org>,
        "David S. Miller" <davem@davemloft.net>,
        Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
Subject: Re: [PATCH 00/18] keys: Miscellaneous fixes
Message-ID: <20201209191204.GB1448831@erythro>
References: <160751606428.1238376.14935502103503420781.stgit@warthog.procyon.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <160751606428.1238376.14935502103503420781.stgit@warthog.procyon.org.uk>
User-Agent: Mutt/1.14.6 (2020-07-11)
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Wed, Dec 09, 2020 at 12:14:24 +0000, David Howells wrote:
> I've extended my collection of minor keyrings fixes for the next merge
> window.  Anything else I should add (or anything I should drop)?
> 
> The patches can be found on the following branch:
> 
> 	https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git/log/?h=keys-fixes

1-16 LGTM (modulo the typo in patch 7's commit message). 17 and 18 are
outside my knowledge right now.

Reviewed-by: Ben Boeckel <mathstuf@gmail.com>

--Ben
