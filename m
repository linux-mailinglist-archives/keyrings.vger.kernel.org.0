Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8D12876C42D
	for <lists+keyrings@lfdr.de>; Wed,  2 Aug 2023 06:32:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231404AbjHBEcI (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 2 Aug 2023 00:32:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231966AbjHBEcC (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 2 Aug 2023 00:32:02 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EE821704;
        Tue,  1 Aug 2023 21:32:01 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id C12DE617A5;
        Wed,  2 Aug 2023 04:32:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05C28C433C7;
        Wed,  2 Aug 2023 04:31:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690950720;
        bh=ngbKRZT01JTMEr5K6drEfFRYN2kVcGA0KIjyhWX1woQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Q9eAue4PzirxE+1hN+dRfnmlQD7KlMmrE5W0etZnSGXAkJLpZCUojOR/MR+Qa2Q7E
         QE1IuXxWKgLtQUQO5eEWvEzBevFVtwF1QHYCe1sdzKtyBt/IYoLa1EcNc1L7NS33Su
         rYvABBBqxuVtmLvyDwC1bmdlgFiwpyjGUP8r/DYmOrmLZrWHT9MfsBykhn7FWq04YD
         oUjt4FCO2fKIG0t8qGR8bRyPy28lD/026wYBNZivkBXEzXGwECMuXf2aS6dCuovhLg
         Rxy9+3r7mM3vXfkh1fAu3cDVSsO9ViJG82hUoujsC5O19vdG1C62cBmbP9h1g58r3N
         LFKOimtBmX+Iw==
Date:   Tue, 1 Aug 2023 21:31:58 -0700
From:   Eric Biggers <ebiggers@kernel.org>
To:     Jarkko Sakkinen <jarkko@kernel.org>
Cc:     fsverity@lists.linux.dev, keyrings@vger.kernel.org,
        Victor Hsieh <victorhsieh@google.com>, stable@vger.kernel.org
Subject: Re: [PATCH v2] fsverity: skip PKCS#7 parser when keyring is empty
Message-ID: <20230802043158.GC1543@sol.localdomain>
References: <20230802041503.11530-1-ebiggers@kernel.org>
 <CUHRWHU485NB.19OIDMLF4WY5G@suppilovahvero>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CUHRWHU485NB.19OIDMLF4WY5G@suppilovahvero>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Wed, Aug 02, 2023 at 07:27:15AM +0300, Jarkko Sakkinen wrote:
> On Wed Aug 2, 2023 at 7:15 AM EEST, Eric Biggers wrote:
> > From: Eric Biggers <ebiggers@google.com>
> >
> > If an fsverity builtin signature is given for a file but the
> > ".fs-verity" keyring is empty, there's no real reason to run the PKCS#7
> > parser.  Skip this to avoid the PKCS#7 attack surface when builtin
> > signature support is configured into the kernel but is not being used.
> >
> > This is a hardening improvement, not a fix per se, but I've added
> > Fixes and Cc stable to get it out to more users.
> >
> > Fixes: 432434c9f8e1 ("fs-verity: support builtin file signatures")
> > Cc: stable@vger.kernel.org
> > Acked-by: Jarkko Sakkinen <jarkko@kernel.org>
> > Signed-off-by: Eric Biggers <ebiggers@google.com>
> > ---
> >
> > v2: check keyring and return early before allocating formatted digest
> >
> >  fs/verity/signature.c | 15 +++++++++++++++
> >  1 file changed, 15 insertions(+)
> >
> > diff --git a/fs/verity/signature.c b/fs/verity/signature.c
> > index b95acae64eac6..8f474702aa249 100644
> > --- a/fs/verity/signature.c
> > +++ b/fs/verity/signature.c
> > @@ -62,6 +62,21 @@ int fsverity_verify_signature(const struct fsverity_info *vi,
> >  		return 0;
> >  	}
> >  
> > +	if (fsverity_keyring->keys.nr_leaves_on_tree == 0) {
> > +		/*
> > +		 * The ".fs-verity" keyring is empty, due to builtin signatures
> > +		 * being supported by the kernel but not actually being used.
> > +		 * In this case, verify_pkcs7_signature() would always return an
> > +		 * error, usually ENOKEY.  It could also be EBADMSG if the
> > +		 * PKCS#7 is malformed, but that isn't very important to
> > +		 * distinguish.  So, just skip to ENOKEY to avoid the attack
> > +		 * surface of the PKCS#7 parser, which would otherwise be
> > +		 * reachable by any task able to execute FS_IOC_ENABLE_VERITY.
> > +		 */
> > +		fsverity_err(inode, "fs-verity keyring is empty");
> > +		return -ENOKEY;
> > +	}
> > +
> >  	d = kzalloc(sizeof(*d) + hash_alg->digest_size, GFP_KERNEL);
> >  	if (!d)
> >  		return -ENOMEM;
> >
> > base-commit: 456ae5fe9b448f44ebe98b391a3bae9c75df465e
> > -- 
> > 2.41.0
> 
> Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>
> 
> applied
> 
> BR, Jarkko

Hi Jarkko, thanks for the review!

I actually intended to take this through the fsverity tree.  Is that okay?

BTW, we could actually make this change to verify_pkcs7_signature() itself.
I wasn't sure it would be appropriate for all callers, though.  Any thoughts?

- Eric
