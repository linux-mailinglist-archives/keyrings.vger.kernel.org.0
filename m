Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DEB9631F694
	for <lists+keyrings@lfdr.de>; Fri, 19 Feb 2021 10:32:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229908AbhBSJc0 (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Fri, 19 Feb 2021 04:32:26 -0500
Received: from mail.kernel.org ([198.145.29.99]:41020 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229876AbhBSJcY (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Fri, 19 Feb 2021 04:32:24 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 82C2F614A7;
        Fri, 19 Feb 2021 09:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1613727104;
        bh=KfoE8Rmr0IxukoOBwdP3XRkzUvE+piUGHia/TAIvQQ8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=swphxQbtR9Y0Rl0V0RCrJIvbKHNdokDcF72NLenq5m2D9iZtOKVzGwyZbjyFjkMPy
         5AzD09jb+mwBvkT593FL+clJavNscNeB4Pe+e5WH3uI6WEmCyQOqTmCDcC27RNXk36
         hGkYGj/MiYuWlwSnDCgpaGp0xh09OYAFFH8EJtjIicaPBBnHJie6Y5FF9S18Z9W4n3
         aFfyKYX09FQXMANuFXZrcweO46RcuzTvmJYyOW6r/MtMXm4Z/QRlMJfTqtrhld2d+9
         zcr4sj6fAb3f/oCK/j36pgIwBmQ1j4GYIJkUqAl4ybQbNiHzhwBHWBMDCaKyufH5Xq
         axYo17sLNskdA==
Date:   Fri, 19 Feb 2021 11:31:29 +0200
From:   Jarkko Sakkinen <jarkko@kernel.org>
To:     David Howells <dhowells@redhat.com>
Cc:     =?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@linux.microsoft.com>,
        Mimi Zohar <zohar@linux.vnet.ibm.com>,
        David Woodhouse <dwmw2@infradead.org>,
        keyrings@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 17/18] certs: Fix blacklist flag type confusion
Message-ID: <YC+FcZaurTMWDeNm@kernel.org>
References: <160751619550.1238376.2380930476046994051.stgit@warthog.procyon.org.uk>
 <160751606428.1238376.14935502103503420781.stgit@warthog.procyon.org.uk>
 <2031808.1613665474@warthog.procyon.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2031808.1613665474@warthog.procyon.org.uk>
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Thu, Feb 18, 2021 at 04:24:34PM +0000, David Howells wrote:
> 
> Hi Mickaël, Jarkko,
> 
> Can I transfer your acks from:
> 
> 	https://lore.kernel.org/lkml/20210121155513.539519-5-mic@digikod.net/
> 
> to here?
> 
> David

Yes, thanks.

/Jarkko
