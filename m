Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 401DB386C3F
	for <lists+keyrings@lfdr.de>; Mon, 17 May 2021 23:29:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235783AbhEQVaY (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Mon, 17 May 2021 17:30:24 -0400
Received: from mail.kernel.org ([198.145.29.99]:58882 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232924AbhEQVaY (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Mon, 17 May 2021 17:30:24 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 52F2D61073;
        Mon, 17 May 2021 21:29:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621286947;
        bh=OU9/VfZMdMInAEGX3f/s3AgTaKgR+SF8dKtKFZ+4nas=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=atLkbBVCocEOaDYktiSuoIp4tf/VL/Gq73zcMgIlcVRBIN1ZJEXPh/KCaJlN1Gvld
         vxp7kBni32bRXnzOUvwb5J2TRTCW3ThanH09vx1vOdv26+n7RdytG9mjgS1XN9SAgd
         sE8P5lPFUlkBemhENFMN3z6VOXTr/yBR2iOf1S4bqjrVNkRD/itzZslRNZ6pRSiqFT
         5+cx3C6Lq8aMRDmP6zfTuw8RlcS9M3ayJYuIusORjX/CJB6grX1KBQPc9WAeJ75VTj
         tMJEb1VWthc4VfiWkVvOMwquTwPE2bjQoZ4ZYwwVV16E+gbkuKyS8oPLFdkjUKzdtn
         bC4h6lOAjXzsw==
Date:   Mon, 17 May 2021 14:29:05 -0700
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
Subject: Re: [PATCH 2/7] lib/mpi: use kcalloc in mpi_resize(Internet mail)
Message-ID: <YKLgIbI583asXCAc@gmail.com>
References: <1620828254-25545-1-git-send-email-herbert.tencent@gmail.com>
 <1620828254-25545-3-git-send-email-herbert.tencent@gmail.com>
 <YJwnjMQcdKD3Fn25@gmail.com>
 <c12435701edb4f419b71bfa23be780db@tencent.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c12435701edb4f419b71bfa23be780db@tencent.com>
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Thu, May 13, 2021 at 02:49:03PM +0000, herberthbli(李弘博) wrote:
> 在 2021/5/13 3:08, Eric Biggers 写道:
> 
> On Wed, May 12, 2021 at 10:04:09PM +0800, Hongbo Li wrote:
> 
> 
> From: Hongbo Li <herberthbli@tencent.com><mailto:herberthbli@tencent.com>
> 
> We should set the additional space to 0 in mpi_resize().
> So use kcalloc() instead of kmalloc_array().
> 
> Signed-off-by: Hongbo Li <herberthbli@tencent.com><mailto:herberthbli@tencent.com>
> 
> 
> 
> Is this fixing something, and if so what?
> 
> - Eric
> 
> 
> 
> In lib/mpi/ec.c:
> 
> /****************
>  * Resize the array of A to NLIMBS. the additional space is cleared
>  * (set to 0) [done by m_realloc()]
>  */
> int mpi_resize(MPI a, unsigned nlimbs)
> 
> Like the comment of kernel's mpi_resize(), the additional space need to set to 0,
> but when a->d is not NULL, it does not set.
> 
> The kernel's mpi lib is from libgcrypt, the mpi resize in libgcrypt is _gcry_mpi_resize()
> which set the additional space to 0.
> 
> This issue will cause add_points_edwards() get a wrong result, and lead to a failed
> eddsa verification.
> 

That sounds like it's fixing an existing bug, regardless of the ed25519 support.
If that's indeed the case, what is the impact of that bug, and what commit is it
fixing?  Please explain in the commit message and not just email.

- Eric
