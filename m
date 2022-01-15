Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1AA6D48F8FA
	for <lists+keyrings@lfdr.de>; Sat, 15 Jan 2022 20:13:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230283AbiAOTNJ (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Sat, 15 Jan 2022 14:13:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230216AbiAOTNI (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Sat, 15 Jan 2022 14:13:08 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73B93C061574;
        Sat, 15 Jan 2022 11:13:08 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id D460B60F16;
        Sat, 15 Jan 2022 19:13:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8A91C36AE5;
        Sat, 15 Jan 2022 19:13:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1642273986;
        bh=T/ZtfDdwhlix+gqIBlRRkyZAs9d7s4+MO19Hc1eKY2Y=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jc+QopZKyCEtAU+9e5V88kPmc7UhTnx007ZlgZ+BWOO4kAHcxAr8EFrpM29iW71Ga
         3S06V89ZOd/NxhHn80ULj1ZfCxXEaZp95XVVbuAELnmM3USuTb5FcQ/bIrGyssNEYU
         +mE5J/ly0elzmfV1SAaZS8/7UOAkI1aQsGWY+DZr4J5xinIDBWeLUtbEoH96UiGBiO
         eWTCMsbcT6Xx+Eg6FT2+r8x30kZmpbGzmV9wEMiGnMLBNh6HhCGwcGDjhLbQY4I+IB
         Z3+3cC6ELDA/hYao1svgLaVNfEp56X5WBf3FlYuEvvFIv+3nJsRbAlD+VSnlbUsLfz
         D+Q0ixbp3Nvag==
Date:   Sat, 15 Jan 2022 21:12:53 +0200
From:   Jarkko Sakkinen <jarkko@kernel.org>
To:     Eric Biggers <ebiggers@kernel.org>
Cc:     keyrings@vger.kernel.org, David Howells <dhowells@redhat.com>,
        Denis Kenzior <denkenz@gmail.com>,
        Marcel Holtmann <marcel@holtmann.org>,
        James Morris <james.morris@microsoft.com>,
        linux-crypto@vger.kernel.org
Subject: Re: [PATCH 2/3] KEYS: asym_tpm: fix incorrect comment
Message-ID: <YeMctWTFlQJcElV6@iki.fi>
References: <20220113235440.90439-1-ebiggers@kernel.org>
 <20220113235440.90439-3-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220113235440.90439-3-ebiggers@kernel.org>
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Thu, Jan 13, 2022 at 03:54:39PM -0800, Eric Biggers wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> tpm_key_create() doesn't actually load the key into the TPM.  Fix the
> comment to describe what the function does.
> 
> Signed-off-by: Eric Biggers <ebiggers@google.com>

Acked-by: Jarkko Sakkinen <jarkko@kernel.org>

This asym_tpm has not been properly reviewed as far as I can tell.

For starters, I do not get who needed new TPM 1.x features in 2018...
It's long after SHA1 was declared as insecure and world was mostly
settled with TPM2.

BR, Jarkko
