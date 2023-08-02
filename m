Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9C5E676C74F
	for <lists+keyrings@lfdr.de>; Wed,  2 Aug 2023 09:46:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233558AbjHBHqJ (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 2 Aug 2023 03:46:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233079AbjHBHph (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 2 Aug 2023 03:45:37 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BD1C1BF0;
        Wed,  2 Aug 2023 00:43:12 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id C62D66185C;
        Wed,  2 Aug 2023 07:43:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82271C433CA;
        Wed,  2 Aug 2023 07:43:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690962191;
        bh=uliLFqbyfAo8ZWX8SKLjPrgv/IXg23iwEndg0QZY4NE=;
        h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
        b=BBV4dJjCqOVG5TcNj0S/19UTgWEwPQmIUTarzCPUbgVhaALhKERTC0cYDc+r0xaLy
         IC4n2ymPEsesVEKYK78KfLCJozVt4XNCYvASWYdZCVcini0GY8qVDbpvaM7OsYRxC+
         7v90t9YDyV0EBdFkYNKUyOXKRQWqG1JL3APDJe5Dmk6QoOZIg91zohVYlz+6pSfuuJ
         Dkn94uDQTaBMdy1ThqVrpM0XR23HKdY8vsQWXYfFRInEWGE5VJYcu4jEQYYoOSu5bZ
         3BLFiuTdiZm5cE//ujN+IimL0uisdPWLnV4zUfwjdXKkujOVvc/CnLBuN0TVkKrRNd
         8xgimMD7NETWA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Wed, 02 Aug 2023 10:43:06 +0300
Message-Id: <CUHW2GFPQ5KC.3SOJM5AMOZ9T0@suppilovahvero>
Cc:     <fsverity@lists.linux.dev>, <keyrings@vger.kernel.org>,
        "Victor Hsieh" <victorhsieh@google.com>, <stable@vger.kernel.org>
Subject: Re: [PATCH v2] fsverity: skip PKCS#7 parser when keyring is empty
From:   "Jarkko Sakkinen" <jarkko@kernel.org>
To:     "Eric Biggers" <ebiggers@kernel.org>
X-Mailer: aerc 0.14.0
References: <20230802041503.11530-1-ebiggers@kernel.org>
 <CUHRWHU485NB.19OIDMLF4WY5G@suppilovahvero>
 <20230802043158.GC1543@sol.localdomain>
In-Reply-To: <20230802043158.GC1543@sol.localdomain>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Wed Aug 2, 2023 at 7:31 AM EEST, Eric Biggers wrote:
> On Wed, Aug 02, 2023 at 07:27:15AM +0300, Jarkko Sakkinen wrote:
> > On Wed Aug 2, 2023 at 7:15 AM EEST, Eric Biggers wrote:
> > > From: Eric Biggers <ebiggers@google.com>
> > >
> > > If an fsverity builtin signature is given for a file but the
> > > ".fs-verity" keyring is empty, there's no real reason to run the PKCS=
#7
> > > parser.  Skip this to avoid the PKCS#7 attack surface when builtin
> > > signature support is configured into the kernel but is not being used=
.
> > >
> > > This is a hardening improvement, not a fix per se, but I've added
> > > Fixes and Cc stable to get it out to more users.
> > >
> > > Fixes: 432434c9f8e1 ("fs-verity: support builtin file signatures")
> > > Cc: stable@vger.kernel.org
> > > Acked-by: Jarkko Sakkinen <jarkko@kernel.org>
> > > Signed-off-by: Eric Biggers <ebiggers@google.com>
> > > ---
> > >
> > > v2: check keyring and return early before allocating formatted digest
> > >
> > >  fs/verity/signature.c | 15 +++++++++++++++
> > >  1 file changed, 15 insertions(+)
> > >
> > > diff --git a/fs/verity/signature.c b/fs/verity/signature.c
> > > index b95acae64eac6..8f474702aa249 100644
> > > --- a/fs/verity/signature.c
> > > +++ b/fs/verity/signature.c
> > > @@ -62,6 +62,21 @@ int fsverity_verify_signature(const struct fsverit=
y_info *vi,
> > >  		return 0;
> > >  	}
> > > =20
> > > +	if (fsverity_keyring->keys.nr_leaves_on_tree =3D=3D 0) {
> > > +		/*
> > > +		 * The ".fs-verity" keyring is empty, due to builtin signatures
> > > +		 * being supported by the kernel but not actually being used.
> > > +		 * In this case, verify_pkcs7_signature() would always return an
> > > +		 * error, usually ENOKEY.  It could also be EBADMSG if the
> > > +		 * PKCS#7 is malformed, but that isn't very important to
> > > +		 * distinguish.  So, just skip to ENOKEY to avoid the attack
> > > +		 * surface of the PKCS#7 parser, which would otherwise be
> > > +		 * reachable by any task able to execute FS_IOC_ENABLE_VERITY.
> > > +		 */
> > > +		fsverity_err(inode, "fs-verity keyring is empty");
> > > +		return -ENOKEY;
> > > +	}
> > > +
> > >  	d =3D kzalloc(sizeof(*d) + hash_alg->digest_size, GFP_KERNEL);
> > >  	if (!d)
> > >  		return -ENOMEM;
> > >
> > > base-commit: 456ae5fe9b448f44ebe98b391a3bae9c75df465e
> > > --=20
> > > 2.41.0
> >=20
> > Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>
> >=20
> > applied
> >=20
> > BR, Jarkko
>
> Hi Jarkko, thanks for the review!
>
> I actually intended to take this through the fsverity tree.  Is that okay=
?
>
> BTW, we could actually make this change to verify_pkcs7_signature() itsel=
f.
> I wasn't sure it would be appropriate for all callers, though.  Any thoug=
hts?

It is OK for me. I just wanted make sure that I don't get yelled let's
say month from now, why I haven't picked it already. That's why the
"more eager" approach :-)

I'll drop it from my master branch today.

BR, Jarkko
