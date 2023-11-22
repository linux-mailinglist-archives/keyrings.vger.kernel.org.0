Return-Path: <keyrings+bounces-139-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A7CC7F3C42
	for <lists+keyrings@lfdr.de>; Wed, 22 Nov 2023 04:19:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2FB7F2829F1
	for <lists+keyrings@lfdr.de>; Wed, 22 Nov 2023 03:19:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD8D279CD;
	Wed, 22 Nov 2023 03:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BIM+tqe+"
X-Original-To: keyrings@vger.kernel.org
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com [IPv6:2607:f8b0:4864:20::236])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1EBB7197;
	Tue, 21 Nov 2023 19:19:37 -0800 (PST)
Received: by mail-oi1-x236.google.com with SMTP id 5614622812f47-3b83ed78a91so78214b6e.1;
        Tue, 21 Nov 2023 19:19:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700623176; x=1701227976; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oZthJMGfCS+t++KAyM3OFBV+JciPWTD6mKsYdbXbAj8=;
        b=BIM+tqe+Wxqs42wSfA7ywUs6ZEc0+TQlmGxao0aQHca4GRMSj3THVI4YkAug/iOsOx
         ROFu51zWs6k1chmLZ2CFW+ANkWEOrdFx05VrTRy0UAS7hwoXrab6gTT7tCSEqhMgqtEW
         khW97gqFX1nLz8D3LG9GsT/4gyp2tAQzj6K3hRk6r2+ZqyDPs0fEQKvFe1k+MBy2OpoH
         6q7bBS9QNIoWrEi6sZ3RawkHJy92ttsNgZsStYKAmvOhmZg7HEvlr4imDz0xvz0wZ4Fd
         M410LfAxBS/zmiLYeh9swVPIhdN6P3Vw2S9g6Dn7PPat6KCbugzNv3mUbTe3Gyt70TV3
         J4Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700623176; x=1701227976;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oZthJMGfCS+t++KAyM3OFBV+JciPWTD6mKsYdbXbAj8=;
        b=QaTp3Ufg1EAPidiOdz9BiO/XUIdr+kP4+je6r47/1nYexSEoWj6aRU+u8avZMbKW6D
         0bmZB2mQbgIFQZbu53JUxvzkYz6IbBjdx7Ao9w0LrTA3tSkSuYsVbKGUOa0B7APv2QIP
         BDjaLM8TU+7dpah9ljrPGejGEGolOKx9HuU7B89hEs5uOO2lpUFcofWnzo9C5N5Ss8V5
         70Osecz3VQ+B7w82DMHUDPYxC4CNVXS28t1+U4pL3OW/u/6UgAd+wbBZ/wCd/fbb2iLB
         UTwi+du8WTFF6AVXlXInLwfhNsAtcoq4rWwAdRRNG0zfcy8oQkc+AC67BtJT9FQNl+C9
         CHnA==
X-Gm-Message-State: AOJu0Yw1rVzlI/2BkxEPEFk5jsTDiJb9k9rXdAi1fbS7BLhH2yWpGCzI
	quTYTUW16UNKoXEO/MPKZ3k=
X-Google-Smtp-Source: AGHT+IFYA4hSz8EVLgGy8ah/AjEueYvSMrt7OkUBu+2WIlUWZtV2nDcCj+xOUaoOP/53CCOC9UCIYg==
X-Received: by 2002:a05:6808:b05:b0:3b5:9583:dc80 with SMTP id s5-20020a0568080b0500b003b59583dc80mr1360282oij.30.1700623176140;
        Tue, 21 Nov 2023 19:19:36 -0800 (PST)
Received: from localhost.localdomain ([156.240.117.4])
        by smtp.gmail.com with ESMTPSA id g11-20020a056a00078b00b006cbb51b9974sm3516185pfu.173.2023.11.21.19.19.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Nov 2023 19:19:35 -0800 (PST)
From: Yusong Gao <a869920004@gmail.com>
To: jarkko@kernel.org
Cc: a869920004@gmail.com,
	davem@davemloft.net,
	dhowells@redhat.com,
	dimitri.ledkov@canonical.com,
	dwmw2@infradead.org,
	herbert@gondor.apana.org.au,
	juergh@proton.me,
	keyrings@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lists@sapience.com,
	zohar@linux.ibm.com
Subject: [PATCH v3] sign-file: Fix incorrect return values check
Date: Wed, 22 Nov 2023 03:19:22 +0000
Message-Id: <20231122031922.40983-1-a869920004@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <89f0dbe3a390dd2d49b09c0ff75a142aa44793fd.camel@kernel.org>
References: <89f0dbe3a390dd2d49b09c0ff75a142aa44793fd.camel@kernel.org>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 22, 2023 at 4:54 AM Jarkko Sakkinen <jarkko@kernel.org>=0D
wrote:=0D
>=0D
> On Tue, 2023-11-21 at 03:40 +0000, Yusong Gao wrote:=0D
> > There are some wrong return values check in sign-file when call=0D
> > OpenSSL=0D
> > API. The ERR() check cond is wrong because of the program only check=0D
> > the=0D
> > return value is < 0 instead of <=3D 0. For example:=0D
> > 1. CMS_final() return 1 for success or 0 for failure.=0D
> > 2. i2d_CMS_bio_stream() returns 1 for success or 0 for failure.=0D
> > 3. i2d_TYPEbio() return 1 for success and 0 for failure.=0D
> > 4. BIO_free() return 1 for success and 0 for failure.=0D
> >=0D
> > Link: https://www.openssl.org/docs/manmaster/man3/=0D
> > Fixes: e5a2e3c84782 ("scripts/sign-file.c: Add support for signing=0D
> > with a raw signature")=0D
> >=0D
>=0D
> No empty line here.=0D
>=0D
> > Signed-off-by: Yusong Gao <a869920004@gmail.com>=0D
> > ---=0D
> > V1, V2: Clarify the description of git message.=0D
> > ---=0D
> >  scripts/sign-file.c | 12 ++++++------=0D
> >  1 file changed, 6 insertions(+), 6 deletions(-)=0D
> >=0D
> > diff --git a/scripts/sign-file.c b/scripts/sign-file.c=0D
> > index 598ef5465f82..dcebbcd6bebd 100644=0D
> > --- a/scripts/sign-file.c=0D
> > +++ b/scripts/sign-file.c=0D
> > @@ -322,7 +322,7 @@ int main(int argc, char **argv)=0D
> >                                    CMS_NOSMIMECAP | use_keyid |=0D
> >                                    use_signed_attrs),=0D
> >                   "CMS_add1_signer");=0D
> > -             ERR(CMS_final(cms, bm, NULL, CMS_NOCERTS |=0D
> > CMS_BINARY) < 0,=0D
> > +             ERR(CMS_final(cms, bm, NULL, CMS_NOCERTS |=0D
> > CMS_BINARY) <=3D 0,=0D
> >                   "CMS_final");=0D
> >  =0D
> >  #else=0D
> > @@ -341,10 +341,10 @@ int main(int argc, char **argv)=0D
> >                       b =3D BIO_new_file(sig_file_name, "wb");=0D
> >                       ERR(!b, "%s", sig_file_name);=0D
> >  #ifndef USE_PKCS7=0D
> > -                     ERR(i2d_CMS_bio_stream(b, cms, NULL, 0) < 0,=0D
> > +                     ERR(i2d_CMS_bio_stream(b, cms, NULL, 0) <=3D=0D
> > 0,=0D
> >                           "%s", sig_file_name);=0D
> >  #else=0D
> > -                     ERR(i2d_PKCS7_bio(b, pkcs7) < 0,=0D
> > +                     ERR(i2d_PKCS7_bio(b, pkcs7) <=3D 0,=0D
> >                           "%s", sig_file_name);=0D
> >  #endif=0D
> >                       BIO_free(b);=0D
> > @@ -374,9 +374,9 @@ int main(int argc, char **argv)=0D
> >  =0D
> >       if (!raw_sig) {=0D
> >  #ifndef USE_PKCS7=0D
> > -             ERR(i2d_CMS_bio_stream(bd, cms, NULL, 0) < 0, "%s",=0D
> > dest_name);=0D
> > +             ERR(i2d_CMS_bio_stream(bd, cms, NULL, 0) <=3D 0, "%s",=0D
> > dest_name);=0D
> >  #else=0D
> > -             ERR(i2d_PKCS7_bio(bd, pkcs7) < 0, "%s", dest_name);=0D
> > +             ERR(i2d_PKCS7_bio(bd, pkcs7) <=3D 0, "%s", dest_name);=0D
> >  #endif=0D
> >       } else {=0D
> >               BIO *b;=0D
> > @@ -396,7 +396,7 @@ int main(int argc, char **argv)=0D
> >       ERR(BIO_write(bd, &sig_info, sizeof(sig_info)) < 0, "%s",=0D
> > dest_name);=0D
> >       ERR(BIO_write(bd, magic_number, sizeof(magic_number) - 1) <=0D
> > 0, "%s", dest_name);=0D
> >  =0D
> > -     ERR(BIO_free(bd) < 0, "%s", dest_name);=0D
> > +     ERR(BIO_free(bd) <=3D 0, "%s", dest_name);=0D
> >  =0D
> >       /* Finally, if we're signing in place, replace the original.=0D
> > */=0D
> >       if (replace_orig)=0D
>=0D
>=0D
> BR, Jarkko=0D
=0D
Thanks.=0D
=0D
BR, Yusong Gao=0D

