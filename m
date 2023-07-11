Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6E96674FA21
	for <lists+keyrings@lfdr.de>; Tue, 11 Jul 2023 23:51:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231737AbjGKVvv (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 11 Jul 2023 17:51:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231431AbjGKVvu (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Tue, 11 Jul 2023 17:51:50 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C7AD10C7;
        Tue, 11 Jul 2023 14:51:50 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id D3FDB6162C;
        Tue, 11 Jul 2023 21:51:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAD49C433C8;
        Tue, 11 Jul 2023 21:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1689112309;
        bh=IBl7aehCSnCPoVnNRSfjfv1AkBfMdFKSR8grRojSvhs=;
        h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
        b=k+GaiHNmLhw6p19hf4A6c/wO5Pev+akQat8HZC//H+GoPx/qqZ/X8r+b9WZhw0/q2
         l7CkrYQ6TrCZ9debibXW/grJ2uS6MiOvb1F18Pq5ynAerGFhEH3PY5/IKtLdm6X+YX
         v0Xt3wjyZrreIVTVL9J8VJvv9/Sx2QV4HIJxp4gjEn0RSsSebZdLJq7KENEICeMeuQ
         1jQD/1UKlLWe8iMoa15ldIalb8THdV3P3+baNjyYf4eTq0j2A57nhPjaC54lhLhwaI
         NscETzyEgQaAHp4E9UOw9NSyv0T4bd4GtKeaE369k+2KW6WwnxxS/zkDX+SMDInLxn
         vLI5xo4DbLg/w==
Message-ID: <93959358dc48d45b98aa598feae7307fa32c00d0.camel@kernel.org>
Subject: Re: [PATCH] KEYS: asymmetric: Fix error codes
From:   Jarkko Sakkinen <jarkko@kernel.org>
To:     Dan Carpenter <dan.carpenter@linaro.org>,
        Herbert Xu <herbert@gondor.apana.org.au>
Cc:     David Howells <dhowells@redhat.com>,
        "David S. Miller" <davem@davemloft.net>, keyrings@vger.kernel.org,
        linux-crypto@vger.kernel.org, kernel-janitors@vger.kernel.org
Date:   Wed, 12 Jul 2023 00:51:45 +0300
In-Reply-To: <15340a35-2400-43dd-9f50-fcbcb3c4986d@kadam.mountain>
References: <c5e34c6a-da1e-4585-98c4-14701b0e093e@moroto.mountain>
         <CTYVE0G0D53P.Y8A7V3C9BW9O@suppilovahvero>
         <CTYVFFFI0SE9.2QXXQPRJW3AA3@suppilovahvero>
         <15340a35-2400-43dd-9f50-fcbcb3c4986d@kadam.mountain>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Tue, 2023-07-11 at 11:40 +0300, Dan Carpenter wrote:
> On Tue, Jul 11, 2023 at 02:12:22AM +0300, Jarkko Sakkinen wrote:
> > > > Fixes: 63ba4d67594a ("KEYS: asymmetric: Use new crypto interface wi=
thout scatterlists")
>=20
> [ snip ]
>=20
> > >=20
> > > I'll pick this as I'm late with 6.5 PR.
> > >=20
> > > Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>
> >=20
> > Causes merge conflicts with my tree:
> >=20
> > https://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git/
>=20
> Your master branch doesn't include the "Use new crypto interface" commit
> so it doesn't have the bug.
>=20
> (I'm just testing against linux-next and I don't know how the crypto
> trees work).
>=20
> regards,
> dan carpenter

It is unfortunately based on Linus' tree :-/

BR, Jarkko

