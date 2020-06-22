Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 219342036CB
	for <lists+keyrings@lfdr.de>; Mon, 22 Jun 2020 14:30:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728178AbgFVMak (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Mon, 22 Jun 2020 08:30:40 -0400
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:47411 "EHLO
        wout5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728080AbgFVMak (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Mon, 22 Jun 2020 08:30:40 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.west.internal (Postfix) with ESMTP id EEB091676;
        Mon, 22 Jun 2020 08:30:38 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Mon, 22 Jun 2020 08:30:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm1; bh=xOI9u0LWHGPl9FZ2KHhcepP4QHd
        Yw3NT26puPkB0Ep0=; b=RduVDhuvh3sA6ZR+4fdF52GWgvu5TFPXvYi3+EZJQ/F
        VzJb4Jg0yARDjzXNXI1QPtPzvvOl6yU45pQUES3W/EVYk83laYzuWA0554ebyQu6
        miC/1TD78I9f0crAVqK2olDrXAaGT4NgYiJoWxw9EtSkmxW3fk7AxbsAUVtSOGuy
        RIPlzVUDr8T1KUqQBrwA5OZw4uEij4yeB+pnVJ4YGlkBdLVAejtYRfOl55slX9Ig
        1jdX5ypb/0HWgVOfUaqjQrkW6SMYnoJm/QNx/NxIjL+vUgTwI+wR6jG6ea/bPuMV
        DTpr+qEFXsKyHx3MvIlIe7nULsVtmDUDNBZ1jT8bWEw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=xOI9u0
        LWHGPl9FZ2KHhcepP4QHdYw3NT26puPkB0Ep0=; b=M6jA0m1zaJhqSYL4QcIlSG
        fA15E3A1YUEExUUtIRpO+ZsuWVAHkbzSb7AmaIqwNZdLFcpDAcsGEV4puSBijq7H
        /KycaXkaZqn0OEODNeFsGzgFUb6Nd87T9KE5D44QDklESg0hQoM3nptk1BdY7Dn6
        3zJp6oJGm8b+hT3ph19JuhN1k/7Ltp1ZQPbvuQFpLK/i2uhRGEg9Hs8IWW/DkR4+
        V3Q9NOWZOhgf3eH7DMIOPDMpLhnZlwI3ZkIAcaC2njsK474cc6THMMr+0p6CcL0+
        EcfmhAqQAriNM+0clYDvfIEq0rEFLu6B6cKCSVKOO2/9eW6k7hMnG6dWCej5zI9Q
        ==
X-ME-Sender: <xms:baTwXitaLZc6F1JASJJYB3QWPYBWEYy8PY9OoADKFjCGP-uP0jGTsw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrudekvddgheegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefirhgvghcu
    mffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucggtffrrghtthgvrhhnpeeuleeltd
    ehkeeltefhleduuddvhfffuedvffduveegheekgeeiffevheegfeetgfenucffohhmrghi
    nhepkhgvrhhnvghlrdhorhhgnecukfhppeekfedrkeeirdekledruddtjeenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvgheskhhrohgr
    hhdrtghomh
X-ME-Proxy: <xmx:baTwXnci7M5uf4cYxyRKJ2botZLdgZK30gQCPJkmwoWkmON6dR6-tA>
    <xmx:baTwXtzulTBLcupr--ofz-Hl2oI0pzd-7T6HuFZu4jjKF_QU9fBlpA>
    <xmx:baTwXtPHI6SQRf0mkHjGwwS7ZBiOIIAiZvsTzcCV_2kYuRCkzaeUew>
    <xmx:bqTwXpbUn_-ZBhiDL7CCT34PRuZwWbogQSoDjkyxi_-06xj0nqyLVw>
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        by mail.messagingengine.com (Postfix) with ESMTPA id A77B7306733C;
        Mon, 22 Jun 2020 08:30:37 -0400 (EDT)
Date:   Mon, 22 Jun 2020 14:30:28 +0200
From:   Greg KH <greg@kroah.com>
To:     Alexey Krasikov <alex-krasikov@yandex-team.ru>
Cc:     Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
        dhowells@redhat.com, keyrings@vger.kernel.org, security@kernel.org,
        yc-core@yandex-team.ru, alexey_krasikov@mail.ru
Subject: Re: [RFC PATCH 0/1] security/keys: remove possessor verify after key
Message-ID: <20200622123028.GA3502713@kroah.com>
References: <20200529060040.29604-1-alex-krasikov@yandex-team.ru>
 <20200601173427.GA26455@linux.intel.com>
 <bd56baa2-9c8d-a0dd-419d-a3123a1f0fba@yandex-team.ru>
 <20200615170043.GA5416@linux.intel.com>
 <c3f47d1c-90a6-aa37-6692-d26202fa92d2@yandex-team.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c3f47d1c-90a6-aa37-6692-d26202fa92d2@yandex-team.ru>
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Mon, Jun 22, 2020 at 12:04:29PM +0300, Alexey Krasikov wrote:
> On 6/15/20 8:00 PM, Jarkko Sakkinen wrote:
> > On Tue, Jun 02, 2020 at 01:30:52PM +0300, Alexey Krasikov wrote:
> > > On Mon, June 1, 2020 at 08:34PM +300, Jarkko Sakkinen wrote:
> > > > On Fri, May 29, 2020 at 09:00:39AM +0300, Alexey Krasikov wrote:
> > > > > $ KEYID=$(keyctl add user john smith @u)
> > > > > $ keyctl describe $KEYID
> > > > > 5927639: alswrv-----v------------  1000  1000 user: john
> > > > > $ keyctl setperm $KEYID 0x3d000000
> > > > > $ keyctl describe $KEYID
> > > > > 5927639: alsw-v-----v------------  1000  1000 user: john
> > > > > $ keyctl print $KEYID
> > > > > smith
> > > > A keyring default permissions are 0x3f3f0000.
> > > > A key default permissions are 0x3f010000.
> > > > 
> > > > Because of this:
> > > > 
> > > > $ KEYID=$(keyctl add user john smith @u)
> > > > $ keyctl setperm $KEYID 0x3d000000
> > > > keyctl_setperm: Permission denied
> > > > 
> > > > Are you sure that your example is correct?
> > > > 
> > > > /Jarkko
> > > Yes, this example works correctly.
> > > 
> > > Why do you think, that the current keyring and key rights
> > > 
> > > shoukd not allow this to be done?
> > I'm just saying that I cannot figure out your point in the cover letter.
> > It contains random dumps of keyctl output.
> > 
> > Maybe a better idea would be to write a test script that demonstrates
> > the issue?
> > 
> > /Jarkko
> 
> + alexey_krasikov@mail.ru
> 
> Possible you may not be able to reproduce the problem because you have a
> different version of Linux.
> 
> I get to reproduce the problem on two systems:
> 
> Linux 4.14.74-28+yc11.91
> 
> and
> 
> Linux ubuntu 4.15.0-106-generic

Both of those are distro-specific kernels, can you reproduce this on
5.8-rc2 or 5.7 as released from kernel.org?

thanks,

greg k-h
