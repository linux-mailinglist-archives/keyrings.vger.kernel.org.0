Return-Path: <keyrings+bounces-156-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 45D697F97BE
	for <lists+keyrings@lfdr.de>; Mon, 27 Nov 2023 03:57:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 779601C20756
	for <lists+keyrings@lfdr.de>; Mon, 27 Nov 2023 02:57:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A34A51C31;
	Mon, 27 Nov 2023 02:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XqvzYjPT"
X-Original-To: keyrings@vger.kernel.org
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08DC510F;
	Sun, 26 Nov 2023 18:57:52 -0800 (PST)
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-6cb4d366248so2962728b3a.0;
        Sun, 26 Nov 2023 18:57:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701053871; x=1701658671; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PIDMPJ5Fz4DSb8xJE1SSIT1+JsijvA/aO2DeFjbapII=;
        b=XqvzYjPTlWZz1YBNBMA+WhbW2tmLPMJgCrV1742jkjVeWS06xoIYrXxF8JjAzytfHM
         05f/qrvJGFhfBf7Ro9+oYhRlz0q6Q3xiX/a900BK4g2vnMQ9w+ysHVRr4D+eZXjs9Kj8
         G7Zttlc5jpy+TKTeNUcbLSNm+7BzWcVsPMm+RZBvVN8yRbTkI2gEJ5x4OH7pytbX+6+g
         Hl4uW3rBFU8utRTEBRc/FE0y4eKbFPxtf1LfrgPmpHntsnIuI09+SPWRAgb4fqLC42DG
         AyjTe7zA8dFoRuYU7GZcXPf0/FoL4IoWciZQ+uf6iYtyKID2eipaXpLJSxIAEmkt/Rb+
         ketA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701053871; x=1701658671;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PIDMPJ5Fz4DSb8xJE1SSIT1+JsijvA/aO2DeFjbapII=;
        b=VX3Fz+4g5Cs6v1chmRE62t1usNGkJ5qXdEz/43PVKyxY3Zb+NBOPL0k0h5/BOXpZ2f
         KKY6MSKu9GlgF9ru+fgoZ6+9GdLvLa7JnXmP/NN0PqQTr9R+xCPbhU2vDcEyY4xqajGx
         G16+t7HKRmUWsO1JOiPVEjXLW/ORI59WH06Vj7N4usM3r50KiHMMOFIO+CUUsDnV7kES
         Y76GrvoxT+r1/UqB5+eDwLvD+Hrquxnju5IPInX1Zv4TD6Zr45yTxhzmHwnTVlfm3eOA
         8Hth9GmapVyNXFIF8HPTJ4WDKJdhaZsI6Z9GqVtfVmb35NX06jMn5OzdkSvfHRJegnkN
         dLjQ==
X-Gm-Message-State: AOJu0YzqSC83L7HENmiSpVU38JAV+9KTpYSQBmuxDZCE1DclGhI1PfEB
	1IftgnifmT7HnokIymULLv0=
X-Google-Smtp-Source: AGHT+IEn47Qx2wTUei4IUoMowwNOsXuHXcrEJ7H2BpGeaNVRCAc0h2eRoGUH2QuOPWJnmV/dbHUDFA==
X-Received: by 2002:a05:6a00:2e08:b0:6be:5367:2131 with SMTP id fc8-20020a056a002e0800b006be53672131mr9925508pfb.24.1701053871459;
        Sun, 26 Nov 2023 18:57:51 -0800 (PST)
Received: from localhost.localdomain ([154.85.51.139])
        by smtp.gmail.com with ESMTPSA id x71-20020a63864a000000b0057412d84d25sm6783651pgd.4.2023.11.26.18.57.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Nov 2023 18:57:51 -0800 (PST)
From: Yusong Gao <a869920004@gmail.com>
To: juergh@proton.me,
	jarkko@kernel.org
Cc: a869920004@gmail.com,
	davem@davemloft.net,
	dhowells@redhat.com,
	dimitri.ledkov@canonical.com,
	dwmw2@infradead.org,
	herbert@gondor.apana.org.au,
	keyrings@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lists@sapience.com,
	zohar@linux.ibm.com
Subject: [PATCH v3] sign-file: Fix incorrect return values check
Date: Mon, 27 Nov 2023 02:57:37 +0000
Message-Id: <20231127025737.451718-1-a869920004@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231122082050.7eeea7bd@smeagol>
References: <20231122082050.7eeea7bd@smeagol>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 22, 2023 at 3:21 PM Juerg Haefliger <juergh@proton.me>=0D
wrote:=0D
>=0D
> On Tue, 21 Nov 2023 03:40:44 +0000=0D
> "Yusong Gao" <a869920004@gmail.com> wrote:=0D
>=0D
> > There are some wrong return values check in sign-file when call=0D
> > OpenSSL=0D
> > API. The ERR() check cond is wrong because of the program only check=0D
> > the=0D
> > return value is < 0 instead of <=3D 0. For example:=0D
> > 1. CMS_final() return 1 for success or 0 for failure.=0D
> > 2. i2d_CMS_bio_stream() returns 1 for success or 0 for failure.=0D
> > 3. i2d_TYPEbio() return 1 for success and 0 for failure.=0D
> > 4. BIO_free() return 1 for success and 0 for failure.=0D
>=0D
> Good catch! In this case I'd probably be more strict and check for '!=3D=
=0D
> 1'.=0D
> See below.=0D
>=0D
> ...Juerg=0D
>=0D
>=0D
> > Link: https://www.openssl.org/docs/manmaster/man3/=0D
> > Fixes: e5a2e3c84782 ("scripts/sign-file.c: Add support for signing=0D
> > with a raw signature")=0D
> >=0D
> > Signed-off-by: Yusong Gao <a869920004@gmail.com>=0D
> > ---=0D
> > V1, V2: Clarify the description of git message.=0D
> > ---=0D
> > =C2=A0scripts/sign-file.c | 12 ++++++------=0D
> > =C2=A01 file changed, 6 insertions(+), 6 deletions(-)=0D
> >=0D
> > diff --git a/scripts/sign-file.c b/scripts/sign-file.c=0D
> > index 598ef5465f82..dcebbcd6bebd 100644=0D
> > --- a/scripts/sign-file.c=0D
> > +++ b/scripts/sign-file.c=0D
> > @@ -322,7 +322,7 @@ int main(int argc, char **argv)=0D
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0CMS_NOSMIMECAP | use=
_keyid |=0D
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0use_signed_attrs),=0D
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "CMS_add=
1_signer");=0D
> > - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ERR(CMS_final(cms, bm, NULL=
, CMS_NOCERTS | CMS_BINARY)=0D
> > < 0,=0D
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ERR(CMS_final(cms, bm, NULL=
, CMS_NOCERTS | CMS_BINARY)=0D
> > <=3D 0,=0D
>=0D
> ERR(CMS_final(cms, bm, NULL, CMS_NOCERTS | CMS_BINARY) !=3D 1,=0D
>=0D
>=0D
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "CMS_fin=
al");=0D
> >=0D
> > =C2=A0#else=0D
> > @@ -341,10 +341,10 @@ int main(int argc, char **argv)=0D
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 b =3D BIO_new_file(sig_file_name, "wb");=0D
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 ERR(!b, "%s", sig_file_name);=0D
> > =C2=A0#ifndef USE_PKCS7=0D
> > - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 ERR(i2d_CMS_bio_stream(b, cms, NULL, 0) < 0,=0D
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 ERR(i2d_CMS_bio_stream(b, cms, NULL, 0) <=3D 0,=0D
>=0D
> ERR(i2d_CMS_bio_stream(b, cms, NULL, 0) !=3D 1,=0D
>=0D
>=0D
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 "%s", sig_file_name);=0D
> > =C2=A0#else=0D
> > - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 ERR(i2d_PKCS7_bio(b, pkcs7) < 0,=0D
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 ERR(i2d_PKCS7_bio(b, pkcs7) <=3D 0,=0D
>=0D
> ERR(i2d_PKCS7_bio(b, pkcs7) !=3D 1,=0D
>=0D
>=0D
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 "%s", sig_file_name);=0D
> > =C2=A0#endif=0D
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 BIO_free(b);=0D
> > @@ -374,9 +374,9 @@ int main(int argc, char **argv)=0D
> >=0D
> > =C2=A0 =C2=A0 =C2=A0 if (!raw_sig) {=0D
> > =C2=A0#ifndef USE_PKCS7=0D
> > - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ERR(i2d_CMS_bio_stream(bd, =
cms, NULL, 0) < 0, "%s",=0D
> > dest_name);=0D
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ERR(i2d_CMS_bio_stream(bd, =
cms, NULL, 0) <=3D 0, "%s",=0D
> > dest_name);=0D
>=0D
>=0D
> ERR(i2d_CMS_bio_stream(bd, cms, NULL, 0) !=3D 1, "%s", dest_name);=0D
>=0D
>=0D
> > =C2=A0#else=0D
> > - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ERR(i2d_PKCS7_bio(bd, pkcs7=
) < 0, "%s", dest_name);=0D
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ERR(i2d_PKCS7_bio(bd, pkcs7=
) <=3D 0, "%s", dest_name);=0D
>=0D
> ERR(i2d_PKCS7_bio(bd, pkcs7) !=3D 1, "%s", dest_name);=0D
>=0D
>=0D
> > =C2=A0#endif=0D
> > =C2=A0 =C2=A0 =C2=A0 } else {=0D
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 BIO *b;=0D
> > @@ -396,7 +396,7 @@ int main(int argc, char **argv)=0D
> > =C2=A0 =C2=A0 =C2=A0 ERR(BIO_write(bd, &sig_info, sizeof(sig_info)) < 0=
, "%s",=0D
> > dest_name);=0D
> > =C2=A0 =C2=A0 =C2=A0 ERR(BIO_write(bd, magic_number, sizeof(magic_numbe=
r) - 1) < 0,=0D
> > "%s", dest_name);=0D
> >=0D
> > - =C2=A0 =C2=A0 ERR(BIO_free(bd) < 0, "%s", dest_name);=0D
> > + =C2=A0 =C2=A0 ERR(BIO_free(bd) <=3D 0, "%s", dest_name);=0D
>=0D
> ERR(BIO_free(bd) !=3D 1, "%s", dest_name);=0D
>=0D
>=0D
> >=0D
> > =C2=A0 =C2=A0 =C2=A0 /* Finally, if we're signing in place, replace the=
 original.=0D
> > */=0D
> > =C2=A0 =C2=A0 =C2=A0 if (replace_orig)=0D
> > --=0D
> > 2.34.1=0D
> >=0D
>=0D
=0D
Agreed. Will do.=0D
Thanks for your review.=0D
=0D
=0D
BR, Yusong Gao=0D

