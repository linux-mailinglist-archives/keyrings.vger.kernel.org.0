Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E346D176DEC
	for <lists+keyrings@lfdr.de>; Tue,  3 Mar 2020 05:17:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726942AbgCCERe (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Mon, 2 Mar 2020 23:17:34 -0500
Received: from mail.kernel.org ([198.145.29.99]:35224 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726910AbgCCERe (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Mon, 2 Mar 2020 23:17:34 -0500
Received: from sol.localdomain (c-107-3-166-239.hsd1.ca.comcast.net [107.3.166.239])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id ADC04206D7;
        Tue,  3 Mar 2020 04:17:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1583209053;
        bh=aY3/wvqBGQxainNhvaDwWcTtGEJ04tCf6VG5Xi9bFIw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=WSOrubstAHVX9B8JHde/ibFvbzq/kYu0pPMmurmJq3qGPfHuI/h2l46G373KwAFKB
         2cwU+x4bPG+hlubJ9mZOs8ERLpazcjRYq/00WVclyK9T/Ztv4ADzTLpF1lQSoLTssg
         KBGuK7o8WrfnfD0Kas4nq+ALOIodG2gk8j3oiOKs=
Date:   Mon, 2 Mar 2020 20:17:32 -0800
From:   Eric Biggers <ebiggers@kernel.org>
To:     Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Cc:     jarkko.sakkinen@linux.intel.com, keyrings@vger.kernel.org
Subject: Re: [PATCH v3] KEYS: reaching the keys quotas correctly
Message-ID: <20200303041732.GA14653@sol.localdomain>
References: <20200228033009.GA932@sol.localdomain>
 <1582864911-30823-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1582864911-30823-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Fri, Feb 28, 2020 at 12:41:51PM +0800, Yang Xu wrote:
>
> Subject: Re: [PATCH v3] KEYS: reaching the keys quotas correctly

The subject should be in imperative tense, like
"KEYS: reach the keys quotas correctly"

> Currently, when we add a new user key, the calltrace as below:
> 
> add_key()
>   key_create_or_update()
>     key_alloc()
>     __key_instantiate_and_link
>       generic_key_instantiate
>         key_payload_reserve
>           ......
> 
> Since commit a08bf91ce28e ("KEYS: allow reaching the keys quotas exactly"),
> we can reach max bytes/keys in key_alloc, but we forget to remove this
> limit when we reserver space for payload in key_payload_reserve. So we
> can only reach max keys but not max bytes when having delta between plen
> and type->def_datalen. Remove this limit when instantiating the key, so we
> can keep consistent with key_alloc.
> 
> Also, fix the similar problem in keyctl_chown_key().
> 
> Fixes: 0b77f5bfb45c ("keys: make the keyring quotas controllable through /proc/sys")
> Fixes: a08bf91ce28e ("KEYS: allow reaching the keys quotas exactly")
> Cc: Eric Biggers <ebiggers@google.com>
> Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>

Otherwise this looks fine.  Thanks!

Reviewed-by: Eric Biggers <ebiggers@google.com>

- Eric
