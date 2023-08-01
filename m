Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DEB9976BD02
	for <lists+keyrings@lfdr.de>; Tue,  1 Aug 2023 20:53:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229746AbjHASxw (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 1 Aug 2023 14:53:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229690AbjHASxw (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Tue, 1 Aug 2023 14:53:52 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12A59FF;
        Tue,  1 Aug 2023 11:53:51 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A42A361694;
        Tue,  1 Aug 2023 18:53:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6D6DC433C7;
        Tue,  1 Aug 2023 18:53:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690916030;
        bh=6zOLPCS72gmJFXlHaooAjRFMkSKhQVfBRJ8FIz5BjQs=;
        h=Date:To:Cc:Subject:From:References:In-Reply-To:From;
        b=Ca3WQYX+pX+wPq9kUL+s3+DzalW+RL3Sm1au+IVAhbxqW1yrTeM+l0pgF4R4EfYQK
         ufERbQjsOKpI34RbqqbK86azss7Z0WilP8Aszu+1jdcKU648vSlooDXMsptiZ1kgnw
         Zy8MD+nACOdsKqqOqgy2ezv0z6rL+XdCIVI825vTBr1jIpCtaKHMHz86WYYSMtR0AT
         0Lf40jBsFpAGMXpF6W4Xxkss59XNsWzYkfAo6pTmfN9bubFUKBDE+Ne3Jh1Jwsg2DT
         eDe8F+9FypbiTR3IdztsJ/XFSlhGA53IwxhpdrrO+The5iB2TgIqm3NkfT8BSI3zPR
         wz89GYtjxXtFg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Tue, 01 Aug 2023 21:53:46 +0300
Message-Id: <CUHFPELPS4E8.3SLQHDV1V8JWK@suppilovahvero>
To:     "Eric Biggers" <ebiggers@kernel.org>, <fsverity@lists.linux.dev>
Cc:     <keyrings@vger.kernel.org>,
        "Victor Hsieh" <victorhsieh@google.com>, <stable@vger.kernel.org>
Subject: Re: [PATCH] fsverity: skip PKCS#7 parser when keyring is empty
From:   "Jarkko Sakkinen" <jarkko@kernel.org>
X-Mailer: aerc 0.14.0
References: <20230801050714.28974-1-ebiggers@kernel.org>
In-Reply-To: <20230801050714.28974-1-ebiggers@kernel.org>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Tue Aug 1, 2023 at 8:07 AM EEST, Eric Biggers wrote:
> From: Eric Biggers <ebiggers@google.com>
>
> If an fsverity builtin signature is given for a file but the
> ".fs-verity" keyring is empty, there's no real reason to run the PKCS#7
> parser.  Skip this to avoid the PKCS#7 attack surface when builtin
> signature support is configured into the kernel but is not being used.
>
> This is a hardening improvement, not a fix per se, but I've added
> Fixes and Cc stable to get it out to more users.
>
> Fixes: 432434c9f8e1 ("fs-verity: support builtin file signatures")
> Cc: stable@vger.kernel.org
> Signed-off-by: Eric Biggers <ebiggers@google.com>
> ---
>  fs/verity/signature.c | 24 ++++++++++++++++++++----
>  1 file changed, 20 insertions(+), 4 deletions(-)
>
> diff --git a/fs/verity/signature.c b/fs/verity/signature.c
> index b95acae64eac6..f6668d92d8151 100644
> --- a/fs/verity/signature.c
> +++ b/fs/verity/signature.c
> @@ -70,10 +70,26 @@ int fsverity_verify_signature(const struct fsverity_i=
nfo *vi,
>  	d->digest_size =3D cpu_to_le16(hash_alg->digest_size);
>  	memcpy(d->digest, vi->file_digest, hash_alg->digest_size);
> =20
> -	err =3D verify_pkcs7_signature(d, sizeof(*d) + hash_alg->digest_size,
> -				     signature, sig_size, fsverity_keyring,
> -				     VERIFYING_UNSPECIFIED_SIGNATURE,
> -				     NULL, NULL);
> +	if (fsverity_keyring->keys.nr_leaves_on_tree =3D=3D 0) {
> +		/*
> +		 * The ".fs-verity" keyring is empty, due to builtin signatures
> +		 * being supported by the kernel but not actually being used.
> +		 * In this case, verify_pkcs7_signature() would always return an
> +		 * error, usually ENOKEY.  It could also be EBADMSG if the
> +		 * PKCS#7 is malformed, but that isn't very important to
> +		 * distinguish.  So, just skip to ENOKEY to avoid the attack
> +		 * surface of the PKCS#7 parser, which would otherwise be
> +		 * reachable by any task able to execute FS_IOC_ENABLE_VERITY.
> +		 */
> +		err =3D -ENOKEY;
> +	} else {
> +		err =3D verify_pkcs7_signature(d,
> +					     sizeof(*d) + hash_alg->digest_size,
> +					     signature, sig_size,
> +					     fsverity_keyring,
> +					     VERIFYING_UNSPECIFIED_SIGNATURE,
> +					     NULL, NULL);
> +	}
>  	kfree(d);
> =20
>  	if (err) {
>
> base-commit: 456ae5fe9b448f44ebe98b391a3bae9c75df465e
> --=20
> 2.41.0

Acked-by: Jarkko Sakkinen <jarkko@kernel.org>

BR, Jarkko
