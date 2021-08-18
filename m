Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 24DA13F03C5
	for <lists+keyrings@lfdr.de>; Wed, 18 Aug 2021 14:33:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234948AbhHRMeK (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 18 Aug 2021 08:34:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231476AbhHRMeK (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 18 Aug 2021 08:34:10 -0400
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [IPv6:2a0b:5c81:1c1::37])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D632C061764;
        Wed, 18 Aug 2021 05:33:35 -0700 (PDT)
Received: from localhost (83-245-197-237.elisa-laajakaista.fi [83.245.197.237])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: jarkko.sakkinen)
        by lahtoruutu.iki.fi (Postfix) with ESMTPSA id B21AA1B00238;
        Wed, 18 Aug 2021 15:33:32 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
        t=1629290012;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=cLVLGnLYbCvUxyjdE3YudMRN+BuWkjlytgtQCUVJ3/Q=;
        b=PHeWSyMkmBjd/SVZ9EcBMZq42C8aGCQ2Ydgo5RF7HDcQ+Jdg1c6MOyT65HSXs7BdwWL5LK
        ++RCbJpBMJbsyrWle8YjtTDsR8BybIB/2xtiEfgxv96ojpil9NYyEB5TCdU1f4Gi7qya/Z
        l4YLaenIRmRKyZsdwiat37XpJEwG70YNN/hS3p5/yd9mAHe/S1cg82lMibiE+2SHUcfuOc
        ehQtoMUxc++a1YlrJ3EVXggEEL5pT83hvKX47vsYXLNQvFwtpcIUAk1B+nZIwjlgvDr1mO
        MF/mmYTjbf9w1vQbdOU6GVRaPNlmSCC4glxDbLxMAbpRl1IRgGqcGVNuwEbcIQ==
Message-ID: <74aef8a2f2331358371a87931e632287dad9af59.camel@iki.fi>
Subject: Re: PING: [PATCH] crypto: public_key: fix overflow during implicit
 conversion
From:   Jarkko Sakkinen <jarkko.sakkinen@iki.fi>
To:     zhenwei pi <pizhenwei@bytedance.com>, dhowells@redhat.com,
        herbert@gondor.apana.org.au, davem@davemloft.net
Cc:     keyrings@vger.kernel.org, linux-crypto@vger.kernel.org,
        linux-kernel@vger.kernel.org
Date:   Wed, 18 Aug 2021 15:33:32 +0300
In-Reply-To: <4dcd4254-030b-4489-d5d3-e320eb2953e7@bytedance.com>
References: <20210810063954.628244-1-pizhenwei@bytedance.com>
         <4dcd4254-030b-4489-d5d3-e320eb2953e7@bytedance.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=jarkko.sakkinen smtp.mailfrom=jarkko.sakkinen@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=lahtoruutu; t=1629290012;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=cLVLGnLYbCvUxyjdE3YudMRN+BuWkjlytgtQCUVJ3/Q=;
        b=grv2vkdR0EpG4OfPYubwO229q/DyJCWRDh9cd+OCjcn/ptveqhLWD9j+3zfY1lHXDrJ3/s
        UtaZnSvllDpmEc+Olw+ppBm0IRClvyFIdtRZdL0+MMfF3ZvSyyMnuIQvrCPlJolm/t3O21
        sXqQTfliki/yaFRL7xAIP7PVX79OEURmWTfU2539LEko1k/5/K1r/DMHbv1gXS8YwKDtYG
        w7S5L7rg03SA7Ir3C+zQLfue0Sn9whIudy1nA3I5nsDgchURtl+Yr0wbKt5r0XsldgmZfW
        2Xtba2OMuvVLg5Nj5e9PwmbZyLU5j530q5R4Tn6AuOHbgcu/+zqZd0auGHbJEQ==
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1629290012; a=rsa-sha256;
        cv=none;
        b=F1EfquNjAXv5npQm9R1f9/7JjcJRWKpQaPwx2AKs1bbRHPsmBesk6ZaQeAAHLdYrCyhfiz
        1QzC6Du0YPJnBQt2REbrE1QTg+cA9dpgGf0idgVQxXp8VD4//pHJVf8pSN/pkVZtV5OiuY
        lZ2XoQxdsXROlLv+Ucllu03St5+0bko9PZ9GhxZhBF07kD84h/+VhyCeAP8Itnmag9x8ho
        ywm3iMvMNmBNYpgKSHeaSTny+M3eNYA9WtAj5LL5yZ/b92SgSBNctNnDv7/ZyCrw+DP5fi
        TpU/rmnIPfvm+k0RG79aDb9/z0EJgkO4JhIvNr1tb9KMY05gQu+uv9Ey5tVFiQ==
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Wed, 2021-08-18 at 16:33 +0800, zhenwei pi wrote:
> PING

Please, do not top-post.

You are lacking Herbert Xu:

$ scripts/get_maintainer.pl crypto/asymmetric_keys/public_key.c=20
David Howells <dhowells@redhat.com> (maintainer:ASYMMETRIC KEYS)
Herbert Xu <herbert@gondor.apana.org.au> (maintainer:CRYPTO API)
"David S. Miller" <davem@davemloft.net> (maintainer:CRYPTO API)
keyrings@vger.kernel.org (open list:ASYMMETRIC KEYS)
linux-crypto@vger.kernel.org (open list:CRYPTO API)
linux-kernel@vger.kernel.org (open list)

> On 8/10/21 2:39 PM, zhenwei pi wrote:
> > Hit kernel warning like this, it can be reproduced by verifying 256
> > bytes datafile by keyctl command.
> >=20
> >   WARNING: CPU: 5 PID: 344556 at crypto/rsa-pkcs1pad.c:540
> > pkcs1pad_verify+0x160/0x190
> >   ...
> >   Call Trace:
> >    public_key_verify_signature+0x282/0x380
> >    ? software_key_query+0x12d/0x180
> >    ? keyctl_pkey_params_get+0xd6/0x130
> >    asymmetric_key_verify_signature+0x66/0x80
> >    keyctl_pkey_verify+0xa5/0x100
> >    do_syscall_64+0x35/0xb0
> >    entry_SYSCALL_64_after_hwframe+0x44/0xae
> >=20
> > '.digest_size(u8) =3D params->in_len(u32)' leads overflow of an u8

Where is this statement?

> > value,
> > so use u32 instead of u8 of digest. And reorder struct
> > public_key_signature, it could save 8 bytes on a 64 bit machine.
                                                     ~~~~~
                                                     64-bit
                                                    =20
What do you mean by "could"? Does it, or does it
not?                                                                  =20
                                       				=09
	  							=09
								=09
	=09

> >=20
> > Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>

Nit: "Firstname Lastname" (first letters capitalized)

> > ---
> >   include/crypto/public_key.h | 4 ++--
> >   1 file changed, 2 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/include/crypto/public_key.h
> > b/include/crypto/public_key.h
> > index 47accec68cb0..f603325c0c30 100644
> > --- a/include/crypto/public_key.h
> > +++ b/include/crypto/public_key.h
> > @@ -38,9 +38,9 @@ extern void public_key_free(struct public_key
> > *key);
> >   struct public_key_signature {
> >   	struct asymmetric_key_id *auth_ids[2];
> >   	u8 *s;			/* Signature */
> > -	u32 s_size;		/* Number of bytes in signature */
> >   	u8 *digest;
> > -	u8 digest_size;		/* Number of bytes in digest */
> > +	u32 s_size;		/* Number of bytes in signature */
> > +	u32 digest_size;	/* Number of bytes in digest */
> >   	const char *pkey_algo;
> >   	const char *hash_algo;
> >   	const char *encoding;
> >=20

/Jarkko
