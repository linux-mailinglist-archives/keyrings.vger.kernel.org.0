Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41B632662DC
	for <lists+keyrings@lfdr.de>; Fri, 11 Sep 2020 18:04:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726552AbgIKQEY (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Fri, 11 Sep 2020 12:04:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726581AbgIKQEA (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Fri, 11 Sep 2020 12:04:00 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63709C061786;
        Fri, 11 Sep 2020 09:03:59 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id z1so12009591wrt.3;
        Fri, 11 Sep 2020 09:03:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=zzRQvfKArjpMYifjjLB/ZP7UYx4wso8d7CogRKl5GNs=;
        b=A/Dsud1tEMFu9ESXmFg7Sat9UOZwMs71bx+TzARmQ1t6LaMdVYXeyXYzgHrag44iRV
         C6Ba6BMxrTV86plmUg0vQ/j7qj0TCZ1BFbKt4lovgMlFVofQLT8XdUhzgHLkwSoXCDPJ
         82RO2SOYQ9+Sb6yu8+k/5WrDTsTOlUFDfdw8d7SxXkFiRtrDix5VgYSGcyuPiWLlpITM
         LYKEL5hh3IsaBBxMS7GZjLBZvzEAU0/8Wx7CrUk3vugOc/MC3hFO2bp9TsL97rV867zJ
         v4KK8KGH9koOroEJcZ7mDGRnfMJ0hg6g7C6J1p4FAD9kHYXK0vvTpXpuRvAcvAUBuarg
         qkFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=zzRQvfKArjpMYifjjLB/ZP7UYx4wso8d7CogRKl5GNs=;
        b=PcfCYecSWKNWexEJcIjNS2PvCHpxcup+TiXGczExue/xSD2LA6oT48y54wZ4HW1zdx
         wBSxoX9fPInhOTbP9X+ARr6gOUfjShknqUKtd+F17RGM3K/H0ReEwPlxPnLU4dzZI5Sr
         y9KHIgoDVIW1fOwtVMXripdrnptdKj4ryxdoHuwLI+GGnOlQWGPoEcZTd92WCUxse3HP
         y9VXsCte4SHEBRFWAGlQBq4odL4snyeOH2DxtnGsveJntthMu08jfYAkF3dYNAhcN/ux
         NcHWsPRD3GMjEFC5jrLT8rakJxI8NU/1x6SpX8oWnjI/c6EEwOIumROPEgmCkx/1Fwhl
         E3nA==
X-Gm-Message-State: AOAM531lM9rlicf0yNPO4y5Ps5cQXwSPFSo952qNJHUBGRuKpU8y+x9h
        fiXVhtHLXTyI4I40BglE/0Q=
X-Google-Smtp-Source: ABdhPJytTV6oOkpGbP65fAKCDJ2WNPvgZaHu0VUIB8cQVQeJOnkdwNtxK5FGjIS1LtgFe6dY9IGBOA==
X-Received: by 2002:adf:f78c:: with SMTP id q12mr2802110wrp.6.1599840237207;
        Fri, 11 Sep 2020 09:03:57 -0700 (PDT)
Received: from lenovo-laptop (cpc83661-brig20-2-0-cust443.3-3.cable.virginm.net. [82.28.105.188])
        by smtp.gmail.com with ESMTPSA id v17sm5805186wrc.23.2020.09.11.09.03.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2020 09:03:56 -0700 (PDT)
From:   Alex Dewar <alex.dewar90@gmail.com>
X-Google-Original-From: Alex Dewar <alex.dewar@gmx.co.uk>
Date:   Fri, 11 Sep 2020 17:03:54 +0100
To:     Alex Dewar <alex.dewar90@gmail.com>
Cc:     James Bottomley <James.Bottomley@hansenpartnership.com>,
        David Howells <dhowells@redhat.com>,
        Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
        James Morris <jmorris@namei.org>,
        "Serge E. Hallyn" <serge@hallyn.com>, keyrings@vger.kernel.org,
        linux-security-module@vger.kernel.org
Subject: Re: [PATCH] security: keys: Use kvfree_sensitive in a few places
Message-ID: <20200911160354.72w6s2qu32hxrsp3@lenovo-laptop>
References: <20200911114400.82207-1-alex.dewar90@gmail.com>
 <1599836664.4041.21.camel@HansenPartnership.com>
 <20200911160009.n2drvcjpzrsloxcj@lenovo-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200911160009.n2drvcjpzrsloxcj@lenovo-laptop>
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Fri, Sep 11, 2020 at 05:00:09PM +0100, Alex Dewar wrote:
> On Fri, Sep 11, 2020 at 08:04:24AM -0700, James Bottomley wrote:
> > On Fri, 2020-09-11 at 12:44 +0100, Alex Dewar wrote:
> > > In big_key.c, there are a few places where memzero_explicit + kvfree
> > > is used. It is better to use kvfree_sensitive instead, which is more
> > > readable and also prevents the compiler from eliding the call to
> > > memzero_explicit. Fix this.
> > 
> > That last bit is untrue: the compiler can't elide memzero_explicit ...
> > that's why it has the explicit suffix.
> > 
> > The original problem was a lot of people do memset(.., 0, ..); kfree()
> > which the compiler can elide if it understands the memory is going out
> > of scope.  Or the even more problematic memset(..., 0, ...) on a stack
> > variable before it goes out of scope.
> > 
> > We can argue about readability but there's no secret leak here.
> 
> Ahh, my mistake. Thanks for the explanation.
> 
> I'll send a v2 with an updated commit message. I think it would still
> make sense to use kfree_sensitive here as on next-20200911 this is the
> last use of kzfree in the tree and it would be nice to excise it
> altogether.

Ignore this! I thought we were talking about a different patch :-/

I'll send a respin with a better commit message anyways.

Cheers :-)

> 
> Best,
> Alex
> 
> > 
> > James
> > 
