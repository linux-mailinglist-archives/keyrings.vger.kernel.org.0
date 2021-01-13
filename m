Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D0DB2F4F54
	for <lists+keyrings@lfdr.de>; Wed, 13 Jan 2021 16:59:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726812AbhAMP7G (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 13 Jan 2021 10:59:06 -0500
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:58947 "EHLO
        out3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726238AbhAMP7F (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 13 Jan 2021 10:59:05 -0500
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
        by mailout.nyi.internal (Postfix) with ESMTP id D01B75C0069;
        Wed, 13 Jan 2021 10:57:59 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Wed, 13 Jan 2021 10:57:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=benboeckel.net;
         h=date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm3; bh=6PB1tXFd2dtUi8aal28nQaiReMQ
        TWfsLz2xfa+zelHI=; b=W48ZSPKAdBblf+pSvLPXC3kK78QVEhR8YsIRHSwE6r/
        i7xl81J1mpTwezmeCMwVUMSN5dgfWlebgacFdAL8laNJP/CSDaVoFT+0uh0GsJ1w
        CMvDjAOpnswWvQm+SiTfIHQQk1XbuEjHoTjFldE1JAH/e+hxLBoJ5UpMQb0G1lp/
        TVAx5uXNaUDwJUTqGV2aRy8qTlq8GDoVycuF0dChezRMenVmMpIiOnrQYhwfdAX9
        Wgn4DXCFW4AqJOUbPjPeZh+71BW0junYcLAx5goKRiYUEVjsWoMB49mkOZUqJm0o
        Z/874QtP4m6e3go7vtZWo9RAjv+DlmXi+sZvwEUWnFg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=6PB1tX
        Fd2dtUi8aal28nQaiReMQTWfsLz2xfa+zelHI=; b=a/QPPv+AVkIm4Q9djYBpze
        AnO0xec6su/2n288R5x3xO7hbzyV5zPJRnFiPSFt2TjN5PegSdXCF1+i1B4soXM+
        SUZFZye805llsrIfunhkaSn81uIHBaCYY+f36kljJVHB+gjiodhF9TqsaNByd6Nb
        zxIJRb9kFtH6NELjMAEkw0KvC7yY/VwjW9JHmvn3qyCDCZIFR0mfmkKhg4sSAzns
        bGbaX/oV2A+Lxm6G/MXvPEu4swqJYrIhoETy8MhWHuAnj8OerVFzixE5a36u3/4p
        NlmdsTDZ0uAJzik/RYgXw9c3qDI4pjB4nk5oS7ypcJaRiGJw8NrrD0YO1tXJwOuQ
        ==
X-ME-Sender: <xms:hhj_X6DtfWAabW9spaY31_EBiFLX9ONINuY7Db4u9XA-YHS8ENglkA>
    <xme:hhj_X0gJklCh99jsmhRwIj9XnOBDJCVbjhfvNSGwsdGc6JF2734YUsX65t3nM6kBC
    j4itIGxL2eg6p6g_A8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedukedrtdefgdekvdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujggfsehttdertddtreejnecuhfhrohhmpeeuvghnuceu
    ohgvtghkvghluceomhgvsegsvghnsghovggtkhgvlhdrnhgvtheqnecuggftrfgrthhtvg
    hrnhepvefftdettefgtddtkeeufeegtddttdeuueegkeegteffueetffejudeihefhkedt
    necukfhppedvgedrudeiledrvddtrddvheehnecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepmhgvsegsvghnsghovggtkhgvlhdrnhgvth
X-ME-Proxy: <xmx:hhj_X9n7RHhcsd5WfWnn2NeE13jyveIDi6XJs_gY8jHm1g2ELGP79g>
    <xmx:hhj_X4ydk86SlzKHwkdn-tf-EaGJNElmwFpcm5dlsj8pIoOiRXpIcA>
    <xmx:hhj_X_SguXWYoK2SYFEoavRcyrs1X1ISByi1AQPVH5mMQ2sYVdJr_g>
    <xmx:hxj_X5fSotFp7-JCIVEOR5rIZJkbMEzgwQ5foknoK1PCaum_mv0Bxw>
Received: from localhost (unknown [24.169.20.255])
        by mail.messagingengine.com (Postfix) with ESMTPA id 9313124005D;
        Wed, 13 Jan 2021 10:57:58 -0500 (EST)
Date:   Wed, 13 Jan 2021 10:57:57 -0500
From:   Ben Boeckel <me@benboeckel.net>
To:     Rolf Eike Beer <eb@emlix.com>
Cc:     David Woodhouse <dwmw2@infradead.org>,
        Linux Kernel Developers List <linux-kernel@vger.kernel.org>,
        David Howells <dhowells@redhat.com>, keyrings@vger.kernel.org,
        linux-kbuild@vger.kernel.org
Subject: Re: [PATCH v5] scripts: use pkg-config to locate libcrypto
Message-ID: <20210113155757.GA3081990@erythro>
References: <20538915.Wj2CyUsUYa@devpool35>
 <2278760.8Yd83Mgoko@devpool35>
 <3394639.6NgGvCfkNl@devpool47>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <3394639.6NgGvCfkNl@devpool47>
User-Agent: Mutt/1.14.6 (2020-07-11)
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Wed, Jan 13, 2021 at 13:49:12 +0100, Rolf Eike Beer wrote:
> Otherwise build fails if the headers are not in the default location. While at
> it also ask pkg-config for the libs, with fallback to the existing value.
> 
> Signed-off-by: Rolf Eike Beer <eb@emlix.com>

Reviewed-by: Ben Boeckel <mathstuf@gmail.com>

> Cc: stable@vger.kernel.org # 5.6.x

Note that keyutils is not in the kernel, so I don't know how useful this
is.

--Ben
