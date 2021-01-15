Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D97F42F7572
	for <lists+keyrings@lfdr.de>; Fri, 15 Jan 2021 10:31:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728088AbhAOJaL (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Fri, 15 Jan 2021 04:30:11 -0500
Received: from mail.kernel.org ([198.145.29.99]:43756 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726652AbhAOJaK (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Fri, 15 Jan 2021 04:30:10 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id D6A6C23434;
        Fri, 15 Jan 2021 09:29:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610702969;
        bh=8oqCOeTz5MWClPIhzCfPDaS0DPiQ1tc0ianLVceW8XQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Mt5nTRUoabozTWajO7+d/QeM0clUfMOO07jn4YgP7bFs8URn8dnb+6BULLMTKuKEN
         gN846qUI3xpnHL3gCtoBbR3JvyRp8VrJJinBuojOHjLSsxOsAnvjQ1okZEPTDP1dI9
         VO2NEOqtu394bEQ9DfkhCDgfZ6nHHTjg8EunmbVIASfIZWO1R/VbsnpLFYsTIDvgf2
         zai9OqWlzbm02j3wzIBTgEiLeTHkH2C0Awucs19FApb0VLJkoyM2s8/JQClIVKBXAV
         PTWU/DdZW0uXQy1vty7bsn/Ia/3T1PCn2Nls9hCHAbPXORXphPss5OAyEYpZk+osWa
         OKxSolvFsSegw==
Date:   Fri, 15 Jan 2021 11:29:25 +0200
From:   Jarkko Sakkinen <jarkko@kernel.org>
To:     Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc:     Andrew Zaborowski <andrew.zaborowski@intel.com>,
        David Howells <dhowells@redhat.com>, keyrings@vger.kernel.org
Subject: Re: [PATCH] keys: X.509 public key issuer lookup without AKID
Message-ID: <YAFgddgUO6MmYKx3@kernel.org>
References: <20210113142340.1963770-1-andrew.zaborowski@intel.com>
 <X/+5GkmrxN5WwTjL@kernel.org>
 <20210114161834.aog7ai7zxfs7awuv@chatter.i7.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210114161834.aog7ai7zxfs7awuv@chatter.i7.local>
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Thu, Jan 14, 2021 at 11:18:34AM -0500, Konstantin Ryabitsev wrote:
> On Thu, Jan 14, 2021 at 05:23:06AM +0200, Jarkko Sakkinen wrote:
> > David, Konstantin, any ideas why the patchwork is jammed, and how
> > to get it up and running again.
> > 
> > https://patchwork.kernel.org/project/keyrings/list/
> 
> Ah, sorry about that -- it got messed up during migration last month. The
> good news is that it's easy to backfill, so you should have all the missing
> patches there now.
> 
> > I mainly would like to have it working because of git-pw, which is
> > really nice tool for applying patches for testing.
> 
> Try b4, too. :)
> 
> -K

Thanks! Works now as expected.

/Jarkko
