Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A95DF37EE03
	for <lists+keyrings@lfdr.de>; Thu, 13 May 2021 00:55:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239822AbhELU7F (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 12 May 2021 16:59:05 -0400
Received: from mail.kernel.org ([198.145.29.99]:47434 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S245050AbhELTNB (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Wed, 12 May 2021 15:13:01 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 10BA461006;
        Wed, 12 May 2021 19:11:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620846712;
        bh=OYsxcWeekp828YfaCh6Kfwv4L7JFwCxqEclFG+gGImw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Zb8nC3BGHB7KoLaqDOaGd0M4MgbZtU7l5kTlibUSbQFSm1s6psyqjbtYosNJsCs6B
         bUUC5BD85e1dMlyN6iO3/bTS3ADWueizqBewFLX2/PUQZ6UNjVS+40EZbsv/oqhXXb
         6Bc5y3ZyaZrEG9a2IabLtmBsUtbuKLMcZ8Xla3p8KDdRVX2F9GmORBwgL8dousszWP
         WM6X7U0bKsW7RUuObNlTBBlc/VEyaOSSYcPUXsNIh85p5JsolKEKIS+AsLXY6+9xXu
         fyzTITve5J91gt1wd0szCe0OQs7nHZudw7EZifRdmyXihpjcxaPjcSqjLfefUy701O
         v5NMyS2N1plLA==
Date:   Wed, 12 May 2021 12:11:50 -0700
From:   Eric Biggers <ebiggers@kernel.org>
To:     Hongbo Li <herbert.tencent@gmail.com>
Cc:     keyrings@vger.kernel.org, linux-crypto@vger.kernel.org,
        herbert@gondor.apana.org.au, dhowells@redhat.com,
        jarkko@kernel.org, tianjia.zhang@linux.alibaba.com,
        herberthbli@tencent.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/7] crypto: add eddsa support for x509
Message-ID: <YJwodhUpsdBbknLo@gmail.com>
References: <1620828254-25545-1-git-send-email-herbert.tencent@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1620828254-25545-1-git-send-email-herbert.tencent@gmail.com>
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Wed, May 12, 2021 at 10:04:07PM +0800, Hongbo Li wrote:
> From: Hongbo Li <herberthbli@tencent.com>
> 
> This series of patches add support for x509 cert signed by eddsa,
> which is described in RFC8032 [1], currently ed25519 only.

It would be helpful to explain how this is related to the kernel's existing
Curve25519 support.

- Eric
