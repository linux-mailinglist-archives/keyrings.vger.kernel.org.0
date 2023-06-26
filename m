Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C2BBB73DB50
	for <lists+keyrings@lfdr.de>; Mon, 26 Jun 2023 11:24:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230076AbjFZJYp (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Mon, 26 Jun 2023 05:24:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229981AbjFZJYE (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Mon, 26 Jun 2023 05:24:04 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B03314202;
        Mon, 26 Jun 2023 02:21:35 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A324A60DBD;
        Mon, 26 Jun 2023 09:21:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DF80C43391;
        Mon, 26 Jun 2023 09:21:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1687771294;
        bh=+nEnClHLi5syrDJOAErMhcML5ks4Z+HxTWODSfJO4SE=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=mzTX390ltb01R0YtE44Eb1ZBb87LDjlicG2FkBE+ZWBpYphVP8JC+htTowMFnlxoq
         ttMrMTLLf7WKczewBVMSSOm0uhXYGOcKQhCq63dNwDILkWjqrIjJJp7IvBozf4wcFC
         lTxoOTV2vucODx1UGgD+qnJc23bzwLVr/6uSr9/RETO8IBr8cI0aEmz4bMMhlP6oAj
         val6Ms4+XvUVMHeLTrcZSKrx2Sp249rSA90YbaAS+NhSUFXZeWasnboULwtaLO9aed
         kKAMGWiH+wP1C0m1imA8B0GBUByedKL8joPtJp3ozZ11M+keM7TrfCPZqRsaISMU0m
         HYor0LB41shlA==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-4f973035d60so3583766e87.3;
        Mon, 26 Jun 2023 02:21:33 -0700 (PDT)
X-Gm-Message-State: AC+VfDywcJQvq6xZo3jZxX9nYrMpFMSbRGW8iYYZIE9qdhLpdbafZ0MB
        IuLIozncTRLoOlEet3UwRbGR83/KVoszZYZrjNw=
X-Google-Smtp-Source: ACHHUZ784bmwKJ3+WOB8IrVZyIthVpj4ZzNW2t4anRlSP/HgDlhwyYMX9kFIRLZ3RJvJng0jkBDf5qoxf1VGq995Qss=
X-Received: by 2002:a05:6512:20cf:b0:4fb:774f:9a84 with SMTP id
 u15-20020a05651220cf00b004fb774f9a84mr631299lfr.13.1687771291975; Mon, 26 Jun
 2023 02:21:31 -0700 (PDT)
MIME-Version: 1.0
References: <ZIg4b8kAeW7x/oM1@gondor.apana.org.au> <570802.1686660808@warthog.procyon.org.uk>
 <ZIrnPcPj9Zbq51jK@gondor.apana.org.au>
In-Reply-To: <ZIrnPcPj9Zbq51jK@gondor.apana.org.au>
From:   Ard Biesheuvel <ardb@kernel.org>
Date:   Mon, 26 Jun 2023 11:21:20 +0200
X-Gmail-Original-Message-ID: <CAMj1kXHcDrL5YexGjwvHHY0UE1ES-KG=68ZJr7U=Ub5gzbaePg@mail.gmail.com>
Message-ID: <CAMj1kXHcDrL5YexGjwvHHY0UE1ES-KG=68ZJr7U=Ub5gzbaePg@mail.gmail.com>
Subject: Re: [v2 PATCH 0/5] crypto: Add akcipher interface without SGs
To:     Herbert Xu <herbert@gondor.apana.org.au>
Cc:     David Howells <dhowells@redhat.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Roberto Sassu <roberto.sassu@huaweicloud.com>,
        Eric Biggers <ebiggers@kernel.org>,
        Stefan Berger <stefanb@linux.ibm.com>,
        Mimi Zohar <zohar@linux.ibm.com>, dmitry.kasatkin@gmail.com,
        Jarkko Sakkinen <jarkko@kernel.org>, keyrings@vger.kernel.org,
        Linux Crypto Mailing List <linux-crypto@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Thu, 15 Jun 2023 at 12:26, Herbert Xu <herbert@gondor.apana.org.au> wrote:
>
> v2 changes:
>
> - Rename dsa to sig.
> - Add braces around else clause.
>
> The crypto akcipher interface has exactly one user, the keyring
> subsystem.  That user only deals with kernel pointers, not SG lists.
> Therefore the use of SG lists in the akcipher interface is
> completely pointless.
>
> As there is only one user, changing it isn't that hard.  This
> patch series is a first step in that direction.  It introduces
> a new interface for encryption and decryption without SG lists:
>
> int crypto_akcipher_sync_encrypt(struct crypto_akcipher *tfm,
>                                  const void *src, unsigned int slen,
>                                  void *dst, unsigned int dlen);
>
> int crypto_akcipher_sync_decrypt(struct crypto_akcipher *tfm,
>                                  const void *src, unsigned int slen,
>                                  void *dst, unsigned int dlen);
>
> I've decided to split out signing and verification because most
> (all but one) of our signature algorithms do not support encryption
> or decryption.  These can now be accessed through the sig interface:
>
> int crypto_sig_sign(struct crypto_sig *tfm,
>                     const void *src, unsigned int slen,
>                     void *dst, unsigned int dlen);
>
> int crypto_sig_verify(struct crypto_sig *tfm,
>                       const void *src, unsigned int slen,
>                       const void *digest, unsigned int dlen);
>
> The keyring system has been converted to this interface.
>

This looks like a worthwhile improvement to me.

As I asked before, could we do the same for the acomp API? The only
existing user blocks on the completion, and the vast majority of
implementations is software only.
