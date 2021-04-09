Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E101E35A0D3
	for <lists+keyrings@lfdr.de>; Fri,  9 Apr 2021 16:16:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233019AbhDIOQQ (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Fri, 9 Apr 2021 10:16:16 -0400
Received: from new1-smtp.messagingengine.com ([66.111.4.221]:35311 "EHLO
        new1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231402AbhDIOQN (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Fri, 9 Apr 2021 10:16:13 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
        by mailnew.nyi.internal (Postfix) with ESMTP id B6ED9580825;
        Fri,  9 Apr 2021 10:15:57 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Fri, 09 Apr 2021 10:15:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=benboeckel.net;
         h=date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm1; bh=VTWVSPSXMxU3eqkzvycOyKEaZ8j
        Pje2Egd37ULlw91I=; b=LJ1tXVR4CleGK91S0PFuJ8ctXbzH7y/xja8CQhsEVMq
        Wffr1Pe+r9B0Jnl1UnGkY8nVY1In/udfnCXOdIC8Fys5zvk3f9Fo4VpdBHgyEzEL
        eV6bCllI/g8KQIEBSUgmSi4hsFRq+wjyWVgsoO80cDlJAWacWDq0CPNdtjG0nY1f
        BzWl5v3dOSi8qzxwiDh/dvh1oo5b3rFyDmt5AuacEOIfm8YqCb+QlEftK75i3jE+
        5DEEWiGFnWhYLtSAWmb7W5HosiACKUbMWkJ5GmMjmAO4ePdrO2xz8zkvbESlY/ZL
        jdvwX88fyOzQ2rsd/bm0FAzFdCPwMd7hT++xd71gc8w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=VTWVSP
        SXMxU3eqkzvycOyKEaZ8jPje2Egd37ULlw91I=; b=TbKTg0vOgFGapSkoVphX+4
        pV2XiuC8fzuWO5DP3ZbMMtI+4lc8CyIOz7+6K4Gfoy75XBffrO/C+CihQBFrK8MK
        lSDNZRKhhFM4AMyE8JXOL9uoOVcx0x7a0p4+aUB5zSm0T1b77K9f5/BGGYVmp+b4
        eAuYTeiXOxJ55/xQ/3Hk4rP9E1/oDCXNgMvHtKWfFOw4TBC1WxixDr1ANs9DL62f
        2DpwZJDGpakH/WbTvYBNviwwrxE8kfokIkCWQ4aLjaq3LWLPoDabsFPopmTwbExj
        A5C2soiKWje1t3BUd5+HaslTC2ghIbVkBnHn5DooHmpxt0KwrcjmvD370ecKRumA
        ==
X-ME-Sender: <xms:mmFwYJfKtY1f3QEXyBLJgi1138bfBGZaHN4HNvLIgrnX4UHJaEIllA>
    <xme:mmFwYHMIlaeWCXJJ1zpD5ut53Hobrf7jFNYTce4VDkrXnIviplGdJReigZYg0HkR7
    PVFGZkYnk1lw1yAiaw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudekuddgjeeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjfgesthdtredttderjeenucfhrhhomhepuegvnhcu
    uehovggtkhgvlhcuoehmvgessggvnhgsohgvtghkvghlrdhnvghtqeenucggtffrrghtth
    gvrhhnpeevffdtteetgfdttdekueefgedttddtueeugeekgeetffeuteffjeduieehhfek
    tdenucfkphepjeefrddutddurdefvddrvddtudenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpehmvgessggvnhgsohgvtghkvghlrdhnvght
X-ME-Proxy: <xmx:mmFwYChDcLuA3lygQQZIkYmoGXDsVmMq55NMGNl_Ej6_5jwtm-1emQ>
    <xmx:mmFwYC_05Yh3-4QXzLnLA4ewN8tCMGeG3bbsU1CPzIZ0bz4ztLsc-w>
    <xmx:mmFwYFv24vyjs-K4bUgcgG-XPytfAb1AigpyDIIhVXE0zT1N7oyYaA>
    <xmx:nWFwYGnVL03gKX_b-I-tKklTB7H9c3BTJq34K9Pc7eFP4JyWIVQSug>
Received: from localhost (c-73-101-32-201.hsd1.pa.comcast.net [73.101.32.201])
        by mail.messagingengine.com (Postfix) with ESMTPA id 873911080067;
        Fri,  9 Apr 2021 10:15:54 -0400 (EDT)
Date:   Fri, 9 Apr 2021 10:15:48 -0400
From:   Ben Boeckel <me@benboeckel.net>
To:     Varad Gautam <varad.gautam@suse.com>
Cc:     linux-crypto@vger.kernel.org, dhowells@redhat.com,
        herbert@gondor.apana.org.au, davem@davemloft.net, vt@altlinux.org,
        tianjia.zhang@linux.alibaba.com, keyrings@vger.kernel.org,
        linux-kernel@vger.kernel.org, jarkko@kernel.org,
        James Morris <jmorris@namei.org>,
        "Serge E. Hallyn" <serge@hallyn.com>,
        "open list:SECURITY SUBSYSTEM" 
        <linux-security-module@vger.kernel.org>
Subject: Re: [PATCH v2 18/18] keyctl_pkey: Add pkey parameters slen and
 mgfhash for PSS
Message-ID: <YHBhlNsMTrOq0POE@erythro>
References: <20210408141516.11369-1-varad.gautam@suse.com>
 <20210408141516.11369-19-varad.gautam@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210408141516.11369-19-varad.gautam@suse.com>
User-Agent: Mutt/2.0.5 (2021-01-21)
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Thu, Apr 08, 2021 at 16:15:16 +0200, Varad Gautam wrote:
> keyctl pkey_* operations accept enc and hash parameters at present.
> RSASSA-PSS signatures also require passing in the signature salt
> length and the mgf hash function.
> 
> Add parameters:
> - 'slen' to feed in salt length of a PSS signature.
> - 'mgfhash' to feed in the hash function used for MGF.

Could `Documentation/security/keys/core.rst` be updated to mention these
new parameters? Statements on what values are allowed would be
appreciated as well (e.g., that `saltlen` (a far better name IMO) is
unsigned 32-bits and where valid algorithm names could be found as
well).

Thanks,

--Ben
