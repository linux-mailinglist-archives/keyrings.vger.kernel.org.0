Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 08F9C48F8F0
	for <lists+keyrings@lfdr.de>; Sat, 15 Jan 2022 20:04:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233488AbiAOTEe (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Sat, 15 Jan 2022 14:04:34 -0500
Received: from dfw.source.kernel.org ([139.178.84.217]:54522 "EHLO
        dfw.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233506AbiAOTEe (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Sat, 15 Jan 2022 14:04:34 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 38EE360F2A;
        Sat, 15 Jan 2022 19:04:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12B48C36AE5;
        Sat, 15 Jan 2022 19:04:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1642273473;
        bh=TZg2N1x1Ln01sVZJ+jXwAsLn/i9D6xXm9QcEnnqKtCM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=gkPRKZ1/h207CG5aeKYkb+JS7fOzYh4o2cU29mvJ5DrZiz3DMT6zq4x4ub02Bw4FV
         QXMoPf8PD4zmCc0kkB334sN4AJ96rhIMgT2oZ7GQgK0zFe0+KJuKwy0BTsYWH7CLyE
         Ygh9TEOAy+acISfNB68qgM0A16LUkcQ/2kvxRAxz0ScCGR0daC/c9YCaa4Q01Ciyct
         w3S50GjjUKCKc+MHBgkk/p8HZ7rhXe8h98kbgP9KYJjWEypc/8gysSE1Lz5zHPBpJI
         LVPeJlI/JoCkzZeQbV+K0mqC2uX6tdts7klQ+d2BDfxUk2OsW0pPc8twa2cly/ZGXJ
         DdNQr4mZrXr+g==
Date:   Sat, 15 Jan 2022 21:04:21 +0200
From:   Jarkko Sakkinen <jarkko@kernel.org>
To:     Eric Biggers <ebiggers@kernel.org>
Cc:     keyrings@vger.kernel.org, David Howells <dhowells@redhat.com>,
        linux-crypto@vger.kernel.org
Subject: Re: [PATCH 1/4] KEYS: x509: clearly distinguish between key and
 signature algorithms
Message-ID: <YeMatZyz64yvUg0R@iki.fi>
References: <20220114002920.103858-1-ebiggers@kernel.org>
 <20220114002920.103858-2-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220114002920.103858-2-ebiggers@kernel.org>
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Thu, Jan 13, 2022 at 04:29:17PM -0800, Eric Biggers wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> An X.509 certificate has two, potentially different public key
> algorithms: the one used by the certificate's key, and the one that was
> used to sign the certificate.  Some of the naming made it unclear which
> algorithm was meant.  Rename things appropriately:
> 
>     - x509_note_pkey_algo() => x509_note_sig_algo()
>     - algo_oid => sig_algo
> 
> Signed-off-by: Eric Biggers <ebiggers@google.com>

Acked-by: Jarkko Sakkinen <jarkko@kernel.org>

BR, Jarkko
