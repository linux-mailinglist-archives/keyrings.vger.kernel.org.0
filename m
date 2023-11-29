Return-Path: <keyrings+bounces-178-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D27667FD088
	for <lists+keyrings@lfdr.de>; Wed, 29 Nov 2023 09:19:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1051F1C2092B
	for <lists+keyrings@lfdr.de>; Wed, 29 Nov 2023 08:19:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6469B11724;
	Wed, 29 Nov 2023 08:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iLyQ+KVR"
X-Original-To: keyrings@vger.kernel.org
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 668FC1735;
	Wed, 29 Nov 2023 00:19:24 -0800 (PST)
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1cfc2bcffc7so26117455ad.1;
        Wed, 29 Nov 2023 00:19:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701245964; x=1701850764; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pitQD+gW5dzBAjSz8pHlIhLJL8YzOCm583XKc/zjIKE=;
        b=iLyQ+KVRM9VTloiu9AfhrVbVZPaV/ZByzozTri2/QEh66YuXYeIomCGC/b+/38SrZg
         DxTOwu7XoCpX7b6S7tbgsbt+gcbEFTIA4f03MIm/jW9ENCS2zW0XILhVIoZPeOGt3yhb
         rpGA/XNrg+Sk9iGOe1pvL9i3Cp9CndfNGfw1LTrH7Uli7i2NyMZzC6sFEAAowt5E1Ib8
         CJtcFxPQaAcToN81mNWUkXMNzoBhXz/RG8hq9wlGpTdcVgxoQOcHLOQxMunYKpNmU5+6
         0FU/Gz10h0FbTRE609AS2NZGefmKT6k8SP9BHJ1c9GfwpF2NOgG0OEp4DpvK0YoMHXK0
         aIyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701245964; x=1701850764;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pitQD+gW5dzBAjSz8pHlIhLJL8YzOCm583XKc/zjIKE=;
        b=JhyWNZxLUd3LLGEuNUmDMvVcBsGItxZcxumv3kpXEGthNyW0NJhJ28MmJPKOlMDWSa
         2RQLN3SViRRGRdRC1Bh8oljE8RlESvuOdBPkAD4fd5310YzfDl1/1AcqrJEZswjOUOWw
         y3VciuRMEuzBxae8zI3Au1RbFx3/OBT9oKJ4PTjzgp5mVJ2TcJQIkx33OJzmEuPe4pqK
         Q7P7qweCWpw7ALgRJlyThkp+8Ikg645t3sIFUCaItlPsNDp5kivsMebFxi/Is3654ypo
         PjymTp94tpDrcqKEvGfqUOCrVWioV/Mn9ziMtOfzhDudUNvOY5kP541dQTYD3mDQB5h3
         nbXw==
X-Gm-Message-State: AOJu0YxOxC3xrE6BAs1G2hwv5kZgJvccRY0ansib0Qma3vYQSuNLrrhO
	3qlGrZA3N0eTSxJz5UCdWTo=
X-Google-Smtp-Source: AGHT+IHnwCpZL6ALoY5W5b8E7P3Bbp+sX02k5cXjC692O8hzZh0gkO3k4cS7ftIWftUNaMVcH9dodQ==
X-Received: by 2002:a17:902:dac7:b0:1cf:c397:8f09 with SMTP id q7-20020a170902dac700b001cfc3978f09mr13907496plx.55.1701245963796;
        Wed, 29 Nov 2023 00:19:23 -0800 (PST)
Received: from localhost.localdomain ([154.85.51.139])
        by smtp.gmail.com with ESMTPSA id x10-20020a170902ea8a00b001cfcd2fb7b0sm5470932plb.285.2023.11.29.00.19.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Nov 2023 00:19:23 -0800 (PST)
From: Yusong Gao <a869920004@gmail.com>
To: jarkko@kernel.org,
	davem@davemloft.net,
	dhowells@redhat.com,
	dwmw2@infradead.org,
	juergh@proton.me,
	zohar@linux.ibm.com,
	herbert@gondor.apana.org.au,
	lists@sapience.com,
	dimitri.ledkov@canonical.com,
	a869920004@gmail.com
Cc: keyrings@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org
Subject: Re: [PATCH v5] sign-file: Fix incorrect return values check
Date: Wed, 29 Nov 2023 08:19:06 +0000
Message-Id: <20231129081906.504149-1-a869920004@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231129080033.12c4efe3@smeagol>
References: <20231129080033.12c4efe3@smeagol>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit



On Wed, Nov 29, 2023 at 3:00 PM Juerg Haefliger <juergh@proton.me>
wrote:
>
> On Mon, 27 Nov 2023 03:34:56 +0000
> "Yusong Gao" <a869920004@gmail.com> wrote:
>
> > There are some wrong return values check in sign-file when call
> > OpenSSL
> > API. The ERR() check cond is wrong because of the program only check
> > the
> > return value is < 0 which ignored the return val is 0. For example:
> > 1. CMS_final() return 1 for success or 0 for failure.
> > 2. i2d_CMS_bio_stream() returns 1 for success or 0 for failure.
> > 3. i2d_TYPEbio() return 1 for success and 0 for failure.
> > 4. BIO_free() return 1 for success and 0 for failure.
> >
> > Link: https://www.openssl.org/docs/manmaster/man3/
> > Fixes: e5a2e3c84782 ("scripts/sign-file.c: Add support for signing
> > with a raw signature")
> > Signed-off-by: Yusong Gao <a869920004@gmail.com>
> > ---
> > V1, V2: Clarify the description of git message.
> > V3: Removed redundant empty line.
> > V4: Change to more strict check mode.
> > ---
> >  scripts/sign-file.c | 12 ++++++------
> >  1 file changed, 6 insertions(+), 6 deletions(-)
> >
> > diff --git a/scripts/sign-file.c b/scripts/sign-file.c
> > index 598ef5465f82..3edb156ae52c 100644
> > --- a/scripts/sign-file.c
> > +++ b/scripts/sign-file.c
> > @@ -322,7 +322,7 @@ int main(int argc, char **argv)
> >                                    CMS_NOSMIMECAP | use_keyid |
> >                                    use_signed_attrs),
> >                   "CMS_add1_signer");
> > -             ERR(CMS_final(cms, bm, NULL, CMS_NOCERTS | CMS_BINARY)
> > < 0,
> > +             ERR(CMS_final(cms, bm, NULL, CMS_NOCERTS | CMS_BINARY)
> > != 1,
> >                   "CMS_final");
> >
> >  #else
> > @@ -341,10 +341,10 @@ int main(int argc, char **argv)
> >                       b = BIO_new_file(sig_file_name, "wb");
> >                       ERR(!b, "%s", sig_file_name);
> >  #ifndef USE_PKCS7
> > -                     ERR(i2d_CMS_bio_stream(b, cms, NULL, 0) < 0,
> > +                     ERR(i2d_CMS_bio_stream(b, cms, NULL, 0) != 1,
> >                           "%s", sig_file_name);
> >  #else
> > -                     ERR(i2d_PKCS7_bio(b, pkcs7) < 0,
> > +                     ERR(i2d_PKCS7_bio(b, pkcs7) != 1,
> >                           "%s", sig_file_name);
> >  #endif
> >                       BIO_free(b);
> > @@ -374,9 +374,9 @@ int main(int argc, char **argv)
> >
> >       if (!raw_sig) {
> >  #ifndef USE_PKCS7
> > -             ERR(i2d_CMS_bio_stream(bd, cms, NULL, 0) < 0, "%s",
> > dest_name);
> > +             ERR(i2d_CMS_bio_stream(bd, cms, NULL, 0) != 1, "%s",
> > dest_name);
> >  #else
> > -             ERR(i2d_PKCS7_bio(bd, pkcs7) < 0, "%s", dest_name);
> > +             ERR(i2d_PKCS7_bio(bd, pkcs7) != 1, "%s", dest_name);
> >  #endif
> >       } else {
> >               BIO *b;
> > @@ -396,7 +396,7 @@ int main(int argc, char **argv)
> >       ERR(BIO_write(bd, &sig_info, sizeof(sig_info)) < 0, "%s",
> >       dest_name);
> >       ERR(BIO_write(bd, magic_number, sizeof(magic_number) - 1) < 0,
> >       "%s", dest_name);
> >
> > -     ERR(BIO_free(bd) < 0, "%s", dest_name);
> > +     ERR(BIO_free(bd) != 1, "%s", dest_name);
> >
> >       /* Finally, if we're signing in place, replace the original.
> >       */
> >       if (replace_orig)
> > --
> > 2.34.1
> >
>
> Nit: v5 in the email subject should be v4.

Yeah, thanks for point out, I get it. 

>
> Reviewed-by: Juerg Haefliger <juerg.haefliger@canonical.com>
>


BR, Yusong Gao

