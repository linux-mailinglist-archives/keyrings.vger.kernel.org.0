Return-Path: <keyrings+bounces-2997-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BE8AB55E96
	for <lists+keyrings@lfdr.de>; Sat, 13 Sep 2025 07:37:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C86E1A05DEE
	for <lists+keyrings@lfdr.de>; Sat, 13 Sep 2025 05:37:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC5D11E7C18;
	Sat, 13 Sep 2025 05:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ICTMjNwa"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A71953A1C9
	for <keyrings@vger.kernel.org>; Sat, 13 Sep 2025 05:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757741857; cv=none; b=L9rGs1E3DXU8KsDLx1cdaSyyOqi5dQElIJk/38c799mdCMigm35mTIxajpzrc+bp/RJO4CvoO6cEp/S3MHIyrA9uMN7nt5swTElwdaISIcKLxx6gvzjvbfMTnJwDNB38iwehJ6ffYEXpMFip1ndrCrIgc7cQRKBokW5EId+rHOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757741857; c=relaxed/simple;
	bh=IYW4ukJmhiyh831FAgDpMQ9/FYW2MvRC6jd5DAlHV3I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WBLg+EGVn2jqwhh0WKskc+yYUCOOxGMgVFNcybEip06TG4b/u/WJtZMp1zgPU1H6y/HuH7d9SAtc/0gJrhbJuuzIcaMIrw+MGluN2u1YWBSa0KxkqFl13vz/Y0JySnhj2PwQIGwtgg5dKYR/IqRjKnROn3eDI8uOdD6ldmWFL9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ICTMjNwa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46877C4CEF8
	for <keyrings@vger.kernel.org>; Sat, 13 Sep 2025 05:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757741857;
	bh=IYW4ukJmhiyh831FAgDpMQ9/FYW2MvRC6jd5DAlHV3I=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ICTMjNwaoFdmOObo7GlgwXNqhYKniuUC9bbBP9/n6NYQ8wVbilxwNCPDPoZYZaSwQ
	 upXKsmrkCS1yDxFO7hHtCRlEMUfj5Zt9k8NLYSsZGx2GcdJkmM4VCvgYR6yNmCwKpj
	 ov2hsNQOFhGBFDIfQ3M3Wd2INX4+WC8VeHb7E0EcNcEY0U6m+i94yFXrxaGFw/aJZK
	 2ujtX+x3wajikgjawbNGnM6lmjCv3/FDLRXSVqjF+vaBZODRahsMg+C7gkyYTtyzjQ
	 w0FCTIxXMkE/6/Fk4TungT7rH1ovvmCqVklUV4xT9N7tt6ZpLwwyI4qTt9NLu5ficP
	 lQYKcCDCV2DJg==
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-b54b301d621so986495a12.0
        for <keyrings@vger.kernel.org>; Fri, 12 Sep 2025 22:37:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWS1Wr9NaoGYgu3NbAl0WFeEcdDKHD5+yhn5r48NFnMa4LOw6/Zkq2QMfY+koCz37BHyMY8jq9TUA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxG5AVrY58oOOuxn4m9zOB0rZTOWz3tzUAdQUb4PLaYnDLbY0mY
	EQcktaRMroJeV+8oQ70TZZBff3YEBzVgAeyuWG5yUDcwdVqp3NWvr+DYMvHCOVb23X4/jp/BjOz
	90rju0FO4l9lMOM6krdeUeIeN5egdfow=
X-Google-Smtp-Source: AGHT+IFHY4Za2HmzCLAoexGOZiMMxEVVOftmHmyAfiUrR/8e/oxJhcIRenCpLvzQcWsYVfuHvpcqlV1W7fV347nauNk=
X-Received: by 2002:a17:902:d2c2:b0:248:96af:51e with SMTP id
 d9443c01a7336-25d27d20531mr73419255ad.45.1757741856891; Fri, 12 Sep 2025
 22:37:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250911225356.2678-1-wufan@kernel.org> <aMQcnoETIt4t4Tqz@wunner.de>
 <CAKtyLkExV9dqMWa5j9O5n8oTHXh8McwVbjjCm6L9L=eFsH3HNw@mail.gmail.com> <aMT1O9PPhLHT-MZJ@wunner.de>
In-Reply-To: <aMT1O9PPhLHT-MZJ@wunner.de>
From: Fan Wu <wufan@kernel.org>
Date: Fri, 12 Sep 2025 22:37:24 -0700
X-Gmail-Original-Message-ID: <CAKtyLkGYfnBnAandEOsTDVHt7oL8LXCWq6+7zEndZ-eQRGAtag@mail.gmail.com>
X-Gm-Features: Ac12FXwk8fbqM4fNnwWg52qWyD447ZBoP6OtwY5KkW_meTUA6qmnn4Zowkv66Rk
Message-ID: <CAKtyLkGYfnBnAandEOsTDVHt7oL8LXCWq6+7zEndZ-eQRGAtag@mail.gmail.com>
Subject: Re: [PATCH] KEYS: X.509: Fix Basic Constraints CA flag parsing
To: Lukas Wunner <lukas@wunner.de>
Cc: Fan Wu <wufan@kernel.org>, dhowells@redhat.com, ignat@cloudflare.com, 
	herbert@gondor.apana.org.au, davem@davemloft.net, jarkko@kernel.org, 
	zohar@linux.ibm.com, eric.snowberg@oracle.com, keyrings@vger.kernel.org, 
	linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 12, 2025 at 9:38=E2=80=AFPM Lukas Wunner <lukas@wunner.de> wrot=
e:
>
> On Fri, Sep 12, 2025 at 02:14:49PM -0700, Fan Wu wrote:
> > On Fri, Sep 12, 2025 at 6:14 AM Lukas Wunner <lukas@wunner.de> wrote:
> > > On Thu, Sep 11, 2025 at 10:53:56PM +0000, wufan@kernel.org wrote:
> > > > +++ b/crypto/asymmetric_keys/x509_cert_parser.c
> > > > @@ -623,7 +625,7 @@ int x509_process_extension(void *context, size_=
t hdrlen,
> > > >               if (v[0] !=3D (ASN1_CONS_BIT | ASN1_SEQ))
> > > >                       return -EBADMSG;
> > > >               if (vlen < 2)
> > > >                       return -EBADMSG;
> > > >               if (v[1] !=3D vlen - 2)
> > > >                       return -EBADMSG;
> > > > -             if (vlen >=3D 4 && v[1] !=3D 0 && v[2] =3D=3D ASN1_BO=
OL && v[3] =3D=3D 1)
> > > > +             if (vlen >=3D 5 && v[1] !=3D 0 && v[2] =3D=3D ASN1_BO=
OL && v[3] =3D=3D 1 && v[4] !=3D 0)
> > > >                       ctx->cert->pub->key_eflags |=3D 1 << KEY_EFLA=
G_CA;
> > > >               return 0;
> > > >       }
> > >
> > > Your patch is correct, however the conditions ...
> > >
> > >   vlen >=3D 5 && v[1] !=3D 0 && v[2] =3D=3D ASN1_BOOL && v[3] =3D=3D =
1
> > >
> > > ... all check well-formedness of the BasicConstraints object,
> > > so it seems if any of those checks fails, -EBADMSG should be returned=
.
> > >
> > > The check "if (vlen < 2)" could be changed to "if (vlen < 5)" because
> > > 5 bytes seems to be the minimum size of a well-formed BasicConstraint=
s
> > > object.  Then the "vlen >=3D 5" and "v[1] !=3D 0" checks can be dropp=
ed.
> >
> > Actually, we need to be careful here. OpenSSL produces
> > BasicConstraints with CA:FALSE as just an empty SEQUENCE:
> >
> > 06 03 55 1d 13 | 01 01 ff | 04 02 | 30 00
> > [----OID------] [critical] [OCTET] [empty SEQ]
>
> I see, thanks for the explanation.
>
> This behavior of OpenSSL doesn't seem spec-compliant, or is it?
> RFC 5280 sec 4.2.1.9 says the pathLenConstraint is optional,
> but the cA boolean is not optional.  Is there a rule that booleans
> need not be rendered if they are false?
>
> BTW, I note that X.690 sec 11.1 says that for DER encoding,
> all bits of a "true" boolean must be set, hence the 0xff value.
> But I'm fine with your more permissive approach which checks for
> a non-zero value, hence also allows BER encoding per X.690 sec 8.2.2.
>
> Thanks!
>
> Lukas

I double-checked RFC 5280 and X.690 after your comment. I found RFC
5280 section 4.1 explicitly requires X.509 certificates to use DER
encoding, so my original patch allowing any non-zero value was
incorrect. I'll update the patch to check specifically for 0xFF and
return -EBADMSG for any other value.

For OpenSSL's empty SEQUENCE, X.690 section 11.5 states: "The encoding
of a set value or sequence value shall not include an encoding for any
component value which is equal to its default value." Since RFC 5280
defines BasicConstraints with "cA BOOLEAN DEFAULT FALSE", the field
must be omitted when false under DER encoding. So OpenSSL's behavior
is correct.

Thanks for catching the boolean encoding issue.

-Fan

