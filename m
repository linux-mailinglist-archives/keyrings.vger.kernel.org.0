Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07839386C30
	for <lists+keyrings@lfdr.de>; Mon, 17 May 2021 23:21:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238110AbhEQVWY (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Mon, 17 May 2021 17:22:24 -0400
Received: from mail.kernel.org ([198.145.29.99]:56206 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238105AbhEQVWY (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Mon, 17 May 2021 17:22:24 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 83A236112D;
        Mon, 17 May 2021 21:21:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621286467;
        bh=URmIpDDQIGn2A7CVqzs/dLemqPYxxhpSYwLsuOsJA7k=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Nh3e2vFHItalLhFjDy7daRTZUUnvs1ou6llCIUsC+X0NQGPX5wWGkcldiB1ZwMX3/
         TbKMwO0s73FZIivai/ljCfoOOqSCiUYl9CDXfz2P+sP9G222cak/oPNinTcT5cNxs7
         +Tlc3c6hbV0c1qQRV1r0sWqcFlQVTLsda4L/BwiPZYEaeVMPEs7SaMbnEbgKRl3cYG
         LvcyQLXrdXKXfqe+ju08vy15+BJMZNaaGqPAT+ffsHH8n/vSEX2lt45Sf+/mHUvABw
         mt9m0gcQB4eAtE1DHtBeoWTiG/2tydALR35RoyhhYvNq1qlPs45ptYLn6x7Sk5FNAu
         Yxcq8FXL4KsNA==
Date:   Mon, 17 May 2021 14:21:06 -0700
From:   Eric Biggers <ebiggers@kernel.org>
To:     =?utf-8?B?aGVyYmVydGhibGko5p2O5byY5Y2aKQ==?= 
        <herberthbli@tencent.com>
Cc:     Hongbo Li <herbert.tencent@gmail.com>,
        "keyrings@vger.kernel.org" <keyrings@vger.kernel.org>,
        "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
        "herbert@gondor.apana.org.au" <herbert@gondor.apana.org.au>,
        "dhowells@redhat.com" <dhowells@redhat.com>,
        "jarkko@kernel.org" <jarkko@kernel.org>,
        "tianjia.zhang@linux.alibaba.com" <tianjia.zhang@linux.alibaba.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 0/7] crypto: add eddsa support for x509(Internet mail)
Message-ID: <YKLeQjjFL88nABqP@gmail.com>
References: <1620828254-25545-1-git-send-email-herbert.tencent@gmail.com>
 <YJwodhUpsdBbknLo@gmail.com>
 <dade7666956c41718ce00e681156533e@tencent.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <dade7666956c41718ce00e681156533e@tencent.com>
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Thu, May 13, 2021 at 02:44:07PM +0000, herberthbli(李弘博) wrote:
> 在 2021/5/13 3:12, Eric Biggers 写道:
> 
> On Wed, May 12, 2021 at 10:04:07PM +0800, Hongbo Li wrote:
> 
> 
> From: Hongbo Li <herberthbli@tencent.com><mailto:herberthbli@tencent.com>
> 
> This series of patches add support for x509 cert signed by eddsa,
> which is described in RFC8032 [1], currently ed25519 only.
> 
> 
> 
> It would be helpful to explain how this is related to the kernel's existing
> Curve25519 support.
> 
> - Eric
> 
> 
> Curve25519 is an elliptic curve used for key agreement(ECDH). It is a Montgomery curve.
> 
> Edwards25519 is a twisted Edwards curve and birationally equivalent to Curve25519, the
> birational maps are described in rfc7748 section 4.1.
> https://datatracker.ietf.org/doc/html/rfc7748#section-4.1
> 
> 
> Ed25519 is a Digital Signature Algorithm over Edwards25519.
> 

Sure, but what does that mean in terms of code.  Can you reuse any of the code,
and if not why not?  I *think* the answer is no, but this is a common point of
confusion, so it would be helpful to properly explain this...

- Eric
