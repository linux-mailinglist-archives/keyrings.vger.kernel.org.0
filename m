Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9EEAA74E211
	for <lists+keyrings@lfdr.de>; Tue, 11 Jul 2023 01:12:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229887AbjGJXMa (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Mon, 10 Jul 2023 19:12:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229563AbjGJXM2 (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Mon, 10 Jul 2023 19:12:28 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E76A9E;
        Mon, 10 Jul 2023 16:12:28 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A62186125D;
        Mon, 10 Jul 2023 23:12:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 387CFC433C7;
        Mon, 10 Jul 2023 23:12:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1689030747;
        bh=TqDfGgNHSTTzI5sd0eAtZM0sWcjxBlg0CVLYm4iFf8U=;
        h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
        b=KVcFMhMlF7PPgmu6JP1s/kT9fttyTEXt6rjASIAMXAB0uv7Q2O8L3BlOPwLQZt08Z
         eMntK1q8Zssq5d53SdZGt9hjNS4mqw41J3SN3lu5I4J7BIQj11JhmznRpqDnKg+8Q+
         O6HoTRG66BGUqKX5NQjTGZXlSrB7SMZ/xVoK8ksqLwzmAeieErncopvDrmbFst/dMH
         yy+erZ0aPH8hVq23t9MIXoc9MMQ6G3mAvWe0rmy+3RMvbGYnlf6dGMA2Zad9iRDjqL
         Ga2jLJlVC16bnvdksVH1CiSDrg9L9qCF+TH2J42FJgmZMZj3F6jzrf301XtVBajH5w
         qwEvwRiwmOQMw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Tue, 11 Jul 2023 02:12:22 +0300
Message-Id: <CTYVFFFI0SE9.2QXXQPRJW3AA3@suppilovahvero>
Cc:     "David Howells" <dhowells@redhat.com>,
        "David S. Miller" <davem@davemloft.net>,
        <keyrings@vger.kernel.org>, <linux-crypto@vger.kernel.org>,
        <kernel-janitors@vger.kernel.org>
Subject: Re: [PATCH] KEYS: asymmetric: Fix error codes
From:   "Jarkko Sakkinen" <jarkko@kernel.org>
To:     "Jarkko Sakkinen" <jarkko@kernel.org>,
        "Dan Carpenter" <dan.carpenter@linaro.org>,
        "Herbert Xu" <herbert@gondor.apana.org.au>
X-Mailer: aerc 0.14.0
References: <c5e34c6a-da1e-4585-98c4-14701b0e093e@moroto.mountain>
 <CTYVE0G0D53P.Y8A7V3C9BW9O@suppilovahvero>
In-Reply-To: <CTYVE0G0D53P.Y8A7V3C9BW9O@suppilovahvero>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Tue Jul 11, 2023 at 2:10 AM EEST, Jarkko Sakkinen wrote:
> On Mon Jul 3, 2023 at 5:18 PM EEST, Dan Carpenter wrote:
> > These error paths should return the appropriate error codes instead of
> > returning success.
> >
> > Fixes: 63ba4d67594a ("KEYS: asymmetric: Use new crypto interface withou=
t scatterlists")
> > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > ---
> >  crypto/asymmetric_keys/public_key.c | 20 +++++++++++++++-----
> >  1 file changed, 15 insertions(+), 5 deletions(-)
> >
> > diff --git a/crypto/asymmetric_keys/public_key.c b/crypto/asymmetric_ke=
ys/public_key.c
> > index e787598cb3f7..773e159dbbcb 100644
> > --- a/crypto/asymmetric_keys/public_key.c
> > +++ b/crypto/asymmetric_keys/public_key.c
> > @@ -185,8 +185,10 @@ static int software_key_query(const struct kernel_=
pkey_params *params,
> > =20
> >  	if (issig) {
> >  		sig =3D crypto_alloc_sig(alg_name, 0, 0);
> > -		if (IS_ERR(sig))
> > +		if (IS_ERR(sig)) {
> > +			ret =3D PTR_ERR(sig);
> >  			goto error_free_key;
> > +		}
> > =20
> >  		if (pkey->key_is_private)
> >  			ret =3D crypto_sig_set_privkey(sig, key, pkey->keylen);
> > @@ -208,8 +210,10 @@ static int software_key_query(const struct kernel_=
pkey_params *params,
> >  		}
> >  	} else {
> >  		tfm =3D crypto_alloc_akcipher(alg_name, 0, 0);
> > -		if (IS_ERR(tfm))
> > +		if (IS_ERR(tfm)) {
> > +			ret =3D PTR_ERR(tfm);
> >  			goto error_free_key;
> > +		}
> > =20
> >  		if (pkey->key_is_private)
> >  			ret =3D crypto_akcipher_set_priv_key(tfm, key, pkey->keylen);
> > @@ -300,8 +304,10 @@ static int software_key_eds_op(struct kernel_pkey_=
params *params,
> > =20
> >  	if (issig) {
> >  		sig =3D crypto_alloc_sig(alg_name, 0, 0);
> > -		if (IS_ERR(sig))
> > +		if (IS_ERR(sig)) {
> > +			ret =3D PTR_ERR(sig);
> >  			goto error_free_key;
> > +		}
> > =20
> >  		if (pkey->key_is_private)
> >  			ret =3D crypto_sig_set_privkey(sig, key, pkey->keylen);
> > @@ -313,8 +319,10 @@ static int software_key_eds_op(struct kernel_pkey_=
params *params,
> >  		ksz =3D crypto_sig_maxsize(sig);
> >  	} else {
> >  		tfm =3D crypto_alloc_akcipher(alg_name, 0, 0);
> > -		if (IS_ERR(tfm))
> > +		if (IS_ERR(tfm)) {
> > +			ret =3D PTR_ERR(tfm);
> >  			goto error_free_key;
> > +		}
> > =20
> >  		if (pkey->key_is_private)
> >  			ret =3D crypto_akcipher_set_priv_key(tfm, key, pkey->keylen);
> > @@ -411,8 +419,10 @@ int public_key_verify_signature(const struct publi=
c_key *pkey,
> > =20
> >  	key =3D kmalloc(pkey->keylen + sizeof(u32) * 2 + pkey->paramlen,
> >  		      GFP_KERNEL);
> > -	if (!key)
> > +	if (!key) {
> > +		ret =3D -ENOMEM;
> >  		goto error_free_tfm;
> > +	}
> > =20
> >  	memcpy(key, pkey->key, pkey->keylen);
> >  	ptr =3D key + pkey->keylen;
> > --=20
> > 2.39.2
>
> I'll pick this as I'm late with 6.5 PR.
>
> Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>

Causes merge conflicts with my tree:

https://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git/

BR, Jarkko
