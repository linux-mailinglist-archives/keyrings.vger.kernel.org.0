Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2394554B2E2
	for <lists+keyrings@lfdr.de>; Tue, 14 Jun 2022 16:16:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238758AbiFNOPq (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 14 Jun 2022 10:15:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242945AbiFNOPl (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Tue, 14 Jun 2022 10:15:41 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 41BC033EBD
        for <keyrings@vger.kernel.org>; Tue, 14 Jun 2022 07:15:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1655216136;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=JctC2m2+QZN18u2MNb2HvFmHLpXv366LEOSyUu6TasQ=;
        b=M3GXrptyuKRUdJpRU/N1NFU9WXWxWYIoL32WYZNkB/sN6L684XYKxytcjZ72TtaL0ha2Qn
        LJHZp5p4eFzpkQH2RJ6DDFtRcBAkTHE9T6FqiyoNexhNShHL0cbbeqRkWBcRFdbsbk4oQr
        UXagOpYHSDkl0IGJuRQHIohdg4SmDEM=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-349-ELXoaGM_NGuE17KO3Z-ipQ-1; Tue, 14 Jun 2022 10:15:34 -0400
X-MC-Unique: ELXoaGM_NGuE17KO3Z-ipQ-1
Received: by mail-qt1-f199.google.com with SMTP id u24-20020a05622a199800b0030500f8e1bcso6651308qtc.16
        for <keyrings@vger.kernel.org>; Tue, 14 Jun 2022 07:15:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:organization:content-transfer-encoding:user-agent
         :mime-version;
        bh=JctC2m2+QZN18u2MNb2HvFmHLpXv366LEOSyUu6TasQ=;
        b=xBpGYHDS4OoFyxfOMI82enLKf7jeJiWt3raWUIL+xUHx4YTvX8K6yXUvKzKwcvKKOj
         dLw6vMCDT5R+FMK5ecsTNDgRW+tPFPY7J1UHniqKsCTPeUa1xP9nIvwrlFFXblyJMmpt
         5+945kGLd6JtUn9+5RbCkoY5NVshq6SENCfSaQ8/6szimIFCORLUnEiQ0qVrHT+VlUjk
         0ighpxfuRlJrUjlU8pKS5B6QIqAtGL/t9wsjZreCHrKTEzjKSlQ7BXfV6H1oA15RMOOS
         /hVICUPq5mqtiVC2KBED5Cuf79/UjXfYZYjWgmbjRs1LA2mtuXDaWb4Osm+BwHuygjp/
         mUrA==
X-Gm-Message-State: AJIora8P8bRQE+M4XGdSFQmyC5L3j/f0tEIFdnwovd2CWC3WAVqU/ofm
        E6eKWrDj2QvmiPNPQBoV2ox8YykZ06ERCRBcs6yjBPR6zqd6KXNYdtkuNXOm+NILFQRlQfKwfpw
        DF2pWbNBubVQTiN+/6dw=
X-Received: by 2002:ad4:5c4a:0:b0:464:5920:7c1a with SMTP id a10-20020ad45c4a000000b0046459207c1amr3579676qva.58.1655216133913;
        Tue, 14 Jun 2022 07:15:33 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sUmVYfieNEUEGblxVDH6VoXBlZfAPSf7IbUAfA0HBAtNoDeIhDejnqioeqYTK2ssE5LXtTUg==
X-Received: by 2002:ad4:5c4a:0:b0:464:5920:7c1a with SMTP id a10-20020ad45c4a000000b0046459207c1amr3579632qva.58.1655216133401;
        Tue, 14 Jun 2022 07:15:33 -0700 (PDT)
Received: from m8.users.ipa.redhat.com ([93.56.163.49])
        by smtp.gmail.com with ESMTPSA id h20-20020a05620a245400b006a32bf19502sm9394754qkn.60.2022.06.14.07.15.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jun 2022 07:15:32 -0700 (PDT)
Message-ID: <831c7380f7d89fd8fb3a3043cf3b3d01001ae0be.camel@redhat.com>
Subject: Re: [PATCH 0/2] certs: Add FIPS self-test for signature verification
From:   Simo Sorce <simo@redhat.com>
To:     David Howells <dhowells@redhat.com>,
        Herbert Xu <herbert@gondor.apana.org.au>
Cc:     Jarkko Sakkinen <jarkko@kernel.org>, keyrings@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org
Date:   Tue, 14 Jun 2022 10:15:24 -0400
In-Reply-To: <165515741424.1554877.9363755381201121213.stgit@warthog.procyon.org.uk>
References: <165515741424.1554877.9363755381201121213.stgit@warthog.procyon.org.uk>
Organization: Red Hat
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.2 (3.44.2-1.fc36) 
MIME-Version: 1.0
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Mon, 2022-06-13 at 22:56 +0100, David Howells wrote:
> Hi Herbert,
>=20
> If you could look over this pair of patches?  The second patch adds a sim=
ple
> selftest to allow the signature verification code so that it can be FIPS
> compliant.  The first moves load_certificate_list() to the asymmetric key=
 code
> to make this easier and renames it.
>=20
> I generated the test data myself, but I'm open to using some standard tes=
t
> data if you know of some; we don't want too much, however, as it's
> incompressible.  Also, it has avoid blacklist checks on the keys it is us=
ing,
> lest the UEFI blacklist cause the selftest to fail.
>=20
> The patches can be found on the following branch:
>=20
> 	https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git/lo=
g/?h=3Dkeys-fixes
>=20
> David
> ---
> David Howells (2):
>       certs: Move load_certificate_list() to be with the asymmetric keys =
code
>       certs: Add FIPS selftests
>=20
>=20
>  certs/Makefile                           |   4 +-
>  certs/blacklist.c                        |   8 +-
>  certs/common.c                           |  57 ------
>  certs/common.h                           |   9 -
>  certs/system_keyring.c                   |   6 +-
>  crypto/asymmetric_keys/Kconfig           |  10 +
>  crypto/asymmetric_keys/Makefile          |   2 +
>  crypto/asymmetric_keys/selftest.c        | 224 +++++++++++++++++++++++
>  crypto/asymmetric_keys/x509_loader.c     |  57 ++++++
>  crypto/asymmetric_keys/x509_parser.h     |   9 +
>  crypto/asymmetric_keys/x509_public_key.c |   8 +-
>  include/keys/asymmetric-type.h           |   3 +
>  12 files changed, 321 insertions(+), 76 deletions(-)
>  delete mode 100644 certs/common.c
>  delete mode 100644 certs/common.h
>  create mode 100644 crypto/asymmetric_keys/selftest.c
>  create mode 100644 crypto/asymmetric_keys/x509_loader.c
>=20
>=20

Reviewed-by: Simo Sorce <simo@redhat.com>

--=20
Simo Sorce
RHEL Crypto Team
Red Hat, Inc



