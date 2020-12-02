Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 710992CC2AE
	for <lists+keyrings@lfdr.de>; Wed,  2 Dec 2020 17:49:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730539AbgLBQql (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 2 Dec 2020 11:46:41 -0500
Received: from mail.kernel.org ([198.145.29.99]:54682 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727482AbgLBQql (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Wed, 2 Dec 2020 11:46:41 -0500
Date:   Wed, 2 Dec 2020 18:45:55 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606927560;
        bh=HBQUrBJNfwRg2yHu0b4ZcpXr6c4a+OuQTBBpnIFiJq8=;
        h=From:To:Cc:Subject:References:In-Reply-To:From;
        b=qXdema/igdFVbALff1Vrxhi7nQqf/Itr6RgdmvPLhAEI/7zvW+kVUhLgXDQ1Lvdge
         yNw8H0XXAUogitBz/pRqOCXUfBxbMTvcQ7MGsUM/pREPWq3woqj5ve/I7+FRC6Unvb
         JYWFsScfnHmxyCWmuThUTmQE3zyU/0gA2RYw2kpc=
From:   Jarkko Sakkinen <jarkko@kernel.org>
To:     Joe Perches <joe@perches.com>
Cc:     trix@redhat.com, dhowells@redhat.com, keyrings@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] keys: remove trailing semicolon in macro definition
Message-ID: <20201202164555.GB91162@kernel.org>
References: <20201127191543.2854306-1-trix@redhat.com>
 <20201129044514.GH39488@kernel.org>
 <d9e5515497f5215294cf79bec973155d0132f25e.camel@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d9e5515497f5215294cf79bec973155d0132f25e.camel@perches.com>
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Sat, Nov 28, 2020 at 09:30:44PM -0800, Joe Perches wrote:
> On Sun, 2020-11-29 at 06:45 +0200, Jarkko Sakkinen wrote:
> > On Fri, Nov 27, 2020 at 11:15:43AM -0800, trix@redhat.com wrote:
> > > From: Tom Rix <trix@redhat.com>
> > > 
> > > The macro use will already have a semicolon.
> > > 
> > > Signed-off-by: Tom Rix <trix@redhat.com>
> > 
> > I'm in-between whether this is worth of merging. The commit message
> > does not help with that decision too much.
> 
> It seems worthy of merging to me modulo whatver improvement is desired in
> the commit message.
> 
> There are 3 existing uses of request_key_net.  All have a trailing semicolon.
> There is 1 existing use of request_key_net_rcu.  It has a trailing semicolon.
> 
> No object change should occur.

OK, makes sense.

Acked-by: Jarkko Sakkinen <jarkko@kernel.org>

/Jarkko
