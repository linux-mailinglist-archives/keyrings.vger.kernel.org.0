Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D57B365A0E
	for <lists+keyrings@lfdr.de>; Tue, 20 Apr 2021 15:28:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232558AbhDTN1m (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 20 Apr 2021 09:27:42 -0400
Received: from new1-smtp.messagingengine.com ([66.111.4.221]:40301 "EHLO
        new1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231422AbhDTN1l (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Tue, 20 Apr 2021 09:27:41 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
        by mailnew.nyi.internal (Postfix) with ESMTP id B835C580BEA;
        Tue, 20 Apr 2021 09:27:09 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Tue, 20 Apr 2021 09:27:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=benboeckel.net;
         h=date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm1; bh=lf7gZahL/CrZJJ2BAIN/GfdWHpC
        6k25LB28HnVyHJ24=; b=aHQfJNIfJMDDuMBwwETqMm4922gp0e/0stzqSx4sZ3a
        IW/AXnYDor/sb7PJZUeLsh0hk1r/KweQzQ+ApWidEl+B3/Xmha+0W9pAo9u1j+cg
        dcRhxdR7YWlBSEX4JReNIwAI516wHYAWR5Ptl8CoLF+DgteWFNHYYqbf1wRwZJR1
        dUG0RK8IDki0UdgtLOZR99rVu+bzoeAJZwshtHU9RcSALBJhzwAjbBG7o0sDg69s
        f4NfTgmKsHEz+qBwSOH1MlMnUfhI9/p1dL1vspP0rszctc5Gppw3Ee6FlZ4S9+On
        PHQjr/SvyCSoVw6MMIe+zrwu6/Q2BYX3ziLcLDbTqoA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=lf7gZa
        hL/CrZJJ2BAIN/GfdWHpC6k25LB28HnVyHJ24=; b=XmAEdqb6EucLwKqbzKynCg
        cg9Q9fwpCfia6QU3+NiczikPeGSoWr46j/b5WIsQKYxhx33RwgUVGNEI+mymmuaA
        U33jD/mzsYdjEsAyNn0TzKoloP9+EKd/qSpIgmkq8863ose7rOvSWv/fia1RbHRi
        5C0LDhxC8k4xjQkBQBv71wv7I67qy/eWAtI74XDsDjJF/xG7G7O9B1uWca56F8Ku
        hWUfMgCouZhK/N1ZXZOR8XfQBRp8frBVILhsIpYvxvLStykD8I9cdEz7OOyq8sDo
        Yz+eTLx2TnihH9ciCy6jHkMs/YKaFr4e+YHOgINrNUEgw8jxMILco0nJcIMmVMaA
        ==
X-ME-Sender: <xms:qtZ-YAVw4ljvfvo2dUZjFRnIVyR3mpKTUBNuF687kA0Iut8KEXVmpA>
    <xme:qtZ-YEixH0wxP7D6QplvBF7C3e9meCxIUB_c67TigAll-66DLMRmGHfUeyQ4LVxaM
    oOZ2-guyatM76ZiJnQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvddtiedgieeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjfgesthdtredttderjeenucfhrhhomhepuegvnhcu
    uehovggtkhgvlhcuoehmvgessggvnhgsohgvtghkvghlrdhnvghtqeenucggtffrrghtth
    gvrhhnpeevffdtteetgfdttdekueefgedttddtueeugeekgeetffeuteffjeduieehhfek
    tdenucfkphepvdegrdduieelrddvtddrvdehheenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpehmvgessggvnhgsohgvtghkvghlrdhnvght
X-ME-Proxy: <xmx:qtZ-YBQhSmKY4hV3Pap0xsiUJFtijExxgBD_z2uCW9SJepXlYK0r1w>
    <xmx:qtZ-YHH6YgtJ1Ijsz_FRSmUETK39ukNGUbYIcuUiqLatxoXh9BdYJw>
    <xmx:qtZ-YJkxUbN7oyPxjrX-m6JjFAK1ExOYhLg7SFsA8dVspAGs9-6TPA>
    <xmx:rdZ-YITUwajNWGhgAXvAupjvtkXNSARTHax81wgO1ND1A0-YQjeMfQ>
Received: from localhost (unknown [24.169.20.255])
        by mail.messagingengine.com (Postfix) with ESMTPA id C81FB240057;
        Tue, 20 Apr 2021 09:27:06 -0400 (EDT)
Date:   Tue, 20 Apr 2021 09:27:05 -0400
From:   Ben Boeckel <me@benboeckel.net>
To:     Varad Gautam <varad.gautam@suse.com>
Cc:     linux-crypto@vger.kernel.org, dhowells@redhat.com,
        herbert@gondor.apana.org.au, davem@davemloft.net, vt@altlinux.org,
        tianjia.zhang@linux.alibaba.com, keyrings@vger.kernel.org,
        linux-kernel@vger.kernel.org, jarkko@kernel.org,
        Jonathan Corbet <corbet@lwn.net>,
        James Morris <jmorris@namei.org>,
        "Serge E. Hallyn" <serge@hallyn.com>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        "open list:SECURITY SUBSYSTEM" 
        <linux-security-module@vger.kernel.org>
Subject: Re: [PATCH v3 18/18] keyctl_pkey: Add pkey parameters saltlen and
 mgfhash for PSS
Message-ID: <YH7WqfjNo33vI0VM@erythro>
References: <20210420114124.9684-1-varad.gautam@suse.com>
 <20210420114124.9684-19-varad.gautam@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210420114124.9684-19-varad.gautam@suse.com>
User-Agent: Mutt/2.0.5 (2021-01-21)
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Tue, Apr 20, 2021 at 13:41:23 +0200, Varad Gautam wrote:
> keyctl pkey_* operations accept enc and hash parameters at present.
> RSASSA-PSS signatures also require passing in the signature salt
> length and the mgf hash function.
> 
> Add parameters:
> - 'saltlen' to feed in salt length of a PSS signature.
> - 'mgfhash' to feed in the hash function used for MGF.
> 
> Signed-off-by: Varad Gautam <varad.gautam@suse.com>
> CC: Jarkko Sakkinen <jarkko@kernel.org>
> CC: Ben Boeckel <me@benboeckel.net>
> ---
> v3: Rename slen to saltlen, update Documentation/security/keys/core.rst.
> 
>  Documentation/security/keys/core.rst     | 14 +++++++++++++-
>  crypto/asymmetric_keys/asymmetric_type.c |  2 ++
>  include/linux/keyctl.h                   |  2 ++
>  security/keys/keyctl_pkey.c              | 13 +++++++++++++
>  4 files changed, 30 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/security/keys/core.rst b/Documentation/security/keys/core.rst
> index b3ed5c581034c..4bd774c56899e 100644
> --- a/Documentation/security/keys/core.rst
> +++ b/Documentation/security/keys/core.rst
> @@ -1022,6 +1022,15 @@ The keyctl syscall functions are:
>  			which hash function was used, the hash function can be
>  			specified with this, eg. "hash=sha256".
>  
> +	``mgfhash=<algo>`` In case of "RSASSA-PSS" ("enc=pss"), this specifies
> +			the hash function used with the Mask Generation Function
> +			to generate a signature, eg. "mgfhash=sha256". Supported
> +			hashes are: sha1, sha224, sha256, sha384, and sha512.
> +
> +	``saltlen=<salt_length>`` In case of "RSASSA-PSS" ("enc=pss"), this
> +			specifies the salt length as a u16, used to generate a
                                                ^

This feels like it is missing a comma at the designated location (after
`length` if the whitespace gets mangled).

> +			signature. Eg. "saltlen=32".
> +
>       The ``__spare[]`` space in the parameter block must be set to 0.  This is
>       intended, amongst other things, to allow the passing of passphrases
>       required to unlock a key.
> @@ -1700,6 +1709,8 @@ The structure has a number of fields, some of which are mandatory:
>  			__u32	in2_len;
>  		};
>  		enum kernel_pkey_operation op : 8;
> +		__u16		salt_len;
> +		const char	*mgf_hash_algo;
>  	};
>  
>       This includes the key to be used; a string indicating the encoding to use
> @@ -1707,7 +1718,8 @@ The structure has a number of fields, some of which are mandatory:
>       RSASSA-PKCS1-v1.5 or RSAES-PKCS1-v1.5 encoding or "raw" if no encoding);
>       the name of the hash algorithm used to generate the data for a signature
>       (if appropriate); the sizes of the input and output (or second input)
> -     buffers; and the ID of the operation to be performed.
> +     buffers; the ID of the operation to be performed; salt length to be used
> +     in case of RSASSA-PSS; and hash algorithm used with MGF for RSASSA-PSS.
>  
>       For a given operation ID, the input and output buffers are used as
>       follows::

Thanks for the docs, they look good to me overall. Other than the comma:

    Acked-by: Ben Boeckel <mathstuf@gmail.com>

--Ben
