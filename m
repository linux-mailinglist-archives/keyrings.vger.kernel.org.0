Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C124729F1B0
	for <lists+keyrings@lfdr.de>; Thu, 29 Oct 2020 17:38:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726159AbgJ2Qia (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 29 Oct 2020 12:38:30 -0400
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:52781 "EHLO
        out4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726031AbgJ2Qi3 (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 29 Oct 2020 12:38:29 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
        by mailout.nyi.internal (Postfix) with ESMTP id 855285C01B4;
        Thu, 29 Oct 2020 12:38:28 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Thu, 29 Oct 2020 12:38:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=benboeckel.net;
         h=date:from:to:cc:subject:message-id:reply-to:references
        :mime-version:content-type:in-reply-to; s=fm3; bh=WeFBWp8TJ6gRua
        VlONA6iPNjZugA10MJaziAYROlApQ=; b=V31mvf0kGO4lzD99bNgTNFN6EM7BI/
        0CbcDwpDtpSjCWL2hT7thdF7U6sn+zbaLcD5ZI1/YKXTYp7rdXC3656cbKy0+Y4y
        WrOl125Ynx+ErQuy9ZP/rKbzKryTBqETw5OphiNfm/aMIHqaF+j1QMZ7N4uMjikO
        zEs/riNyfKrnRmKrEbItfwa5dTrL6Moqf/2nUbh8CvshgfD+xsgICsQ3K43AZe9D
        PUzL+JZBIEdBvBTkiyPFSHWV/c2i5AKOzfwJGzMSKBeCCbLZLV3DgO5+k+g+ZmZM
        v5mbhM6ebI4aNCN1CjQChmSLEzNYwcqmT66GvHJGwGAhSAC0pnnlYgeQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:reply-to:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm1; bh=WeFBWp8TJ6gRuaVlONA6iPNjZugA10MJaziAYROlApQ=; b=UPkjabfU
        /K3bSVYkFMIjzUzpBDIHlvoHQINkbjvmT8fI6CpzbZjhY9ZZjywpbavO7DYcPuj8
        kGpfKIs7USOl3RwNkmHEUy+6j/u5Y7wqflIEln8QOLKSqSwIaO5zz+lFCnUUSDzZ
        LWiPV0wpRE5SdEl5oyzQOT3csGYrxJmNdNb5NwpUixYnYpBbLIeyn9eBQs02IIEc
        Lu0NJb8zFc6NCebYLL1CFtbG8darTUwIMFZHDdM7IuWMGOkPeppwDO0nNdGpQt3n
        tq9//0Tvcp57UQDY+xZDu+Xat+8kpOXdw9BeK8zd8RpyDgCh9LAQGrHwxDIbnpQ+
        UuGZMJdZtNEsEQ==
X-ME-Sender: <xms:A_CaXzESGj6ViI1DGcDP-KzoQULy9YLP_tqvNGi_q9W9qzm-r7cShw>
    <xme:A_CaXwXhk2jjG8eBcw04LVU_3tBWLCvifql5BO2kxI-2nWysdB5DVJLfjpnzy8XIE
    dTT8JrOOFO164WB71U>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrleefgdeltdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkrhhfgggtuggjfgesthdtredttderjeenucfhrhhomhepuegvnhcu
    uehovggtkhgvlhcuoehmvgessggvnhgsohgvtghkvghlrdhnvghtqeenucggtffrrghtth
    gvrhhnpeejtddvffehtefgkedtheevgfeileegfeehjedvhedtudeiteegtdeftdelvedv
    ffenucfkphepvdegrdduieelrddvtddrvdehheenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpehmvgessggvnhgsohgvtghkvghlrdhnvght
X-ME-Proxy: <xmx:A_CaX1KlHSEbqFlfn80IhSTetlv8ukaVh5G9AQnk-3c6iV6kAsIg6g>
    <xmx:A_CaXxF8ooQIrXeH1INYMDlopJISWq-FROf7NU03dFOpg4M5lfNCfQ>
    <xmx:A_CaX5Xdlc4jiDlS7XDPzy7NOOWwxIYaS3_vTF8pVt_Xbtr47BTnsA>
    <xmx:BPCaX3cANz3I74hxM85d_IUGP3Ef6grgm53WAwvoOYMIuShL-FeRRQ>
Received: from localhost (unknown [24.169.20.255])
        by mail.messagingengine.com (Postfix) with ESMTPA id 6C4BF306468C;
        Thu, 29 Oct 2020 12:38:27 -0400 (EDT)
Date:   Thu, 29 Oct 2020 12:38:26 -0400
From:   Ben Boeckel <me@benboeckel.net>
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     David Howells <dhowells@redhat.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, keyrings@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
        Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [RESEND PATCH] KEYS: asymmetric: Fix kerneldoc
Message-ID: <20201029163826.GA379425@erythro.dev.benboeckel.internal>
Reply-To: me@benboeckel.net
References: <20201029154830.26997-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201029154830.26997-1-krzk@kernel.org>
User-Agent: Mutt/1.14.6 (2020-07-11)
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Thu, Oct 29, 2020 at 16:48:30 +0100, Krzysztof Kozlowski wrote:
> Fix W=1 compile warnings (invalid kerneldoc):
> 
>     crypto/asymmetric_keys/asymmetric_type.c:160: warning: Function parameter or member 'kid1' not described in 'asymmetric_key_id_same'
>     crypto/asymmetric_keys/asymmetric_type.c:160: warning: Function parameter or member 'kid2' not described in 'asymmetric_key_id_same'
>     crypto/asymmetric_keys/asymmetric_type.c:160: warning: Excess function parameter 'kid_1' description in 'asymmetric_key_id_same'
>     crypto/asymmetric_keys/asymmetric_type.c:160: warning: Excess function parameter 'kid_2' description in 'asymmetric_key_id_same'
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> Acked-by: Randy Dunlap <rdunlap@infradead.org>

Reviewed-by: Ben Boeckel <mathstuf@gmail.com>

--Ben
