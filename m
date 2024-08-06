Return-Path: <keyrings+bounces-1868-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D7A1F9498FF
	for <lists+keyrings@lfdr.de>; Tue,  6 Aug 2024 22:27:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 881011F231DD
	for <lists+keyrings@lfdr.de>; Tue,  6 Aug 2024 20:27:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74A58155C83;
	Tue,  6 Aug 2024 20:27:06 +0000 (UTC)
X-Original-To: keyrings@vger.kernel.org
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AF9440875;
	Tue,  6 Aug 2024 20:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722976026; cv=none; b=XF+dVwdxUzF2qk+fRVdzetpw4TkOQM/YiGrc99pz99gHVWmKfc8RMT/tQharZbc0q8DcplpYIZrN/x6lRNCqr7980q6y9lUuTzzh9hpXlYj1ldzCpCwg29TWjFtEtSC2XkOy6Mk3o/BrMvLYx/nzEtJVWMTv0eo8FUfCsSjSQFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722976026; c=relaxed/simple;
	bh=LIGzCfRqqebdBfRcltouWmCzar9jPj1JAuYvgrKDy8o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Lg9DwHgRdUD6yXMrhd41iB5hfRyGZvAbcNXng5Gd6KzeYfkCqB0tXi474E2uh2OPB1sda5IPK++QBB7P4oXXpN5dOMmre/y0SZxpQcXTYL7hQmCeIniR2MFagVtbCAxv28dRfG8FBd1PphnHw8Udv9ybtGn3iQhWbJeeY5tSnfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-6b6199ef089so5410716d6.3;
        Tue, 06 Aug 2024 13:27:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722976023; x=1723580823;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uwZfXOJPvxoJ+u8XhJj/J9BXgf+sA8551y3aceuGSSs=;
        b=GGAtxaaPLuotBay4HlgT9B2JQuEQUihdvmgVMdc5kZzl8hJve8eIxpgRqaFZCwJxHX
         mUSeQ0BIXkZ+RBbjsCLDs4O9KK7XR4bgOU/+Uc4mSsQlCX6M7EB+4IhUIgYKYHCwz0/O
         c4Us4sUmTUfhR7yUjRtI4gbougt48AGDybxYNoErntO2IN525i4eG7zfAwWGS3wRDNvx
         CPsnH261S2QxCRg2W7XxAJB7WZuUBUlHMo2B+YpZeALi9mKWn5UeW+9LeA/oL6Uj2F+k
         XUMZ7J92eMPqqpm6QOABjiBoAk0x6gBDbhtHLzRvOHAYBQa+GFXi9y2pTw1zKtR5FHZ8
         A7+A==
X-Forwarded-Encrypted: i=1; AJvYcCWKH00slN6kx45iWdZp5dJUEOdAhxx8l2kgPqR7yTuuX1r59RmP0aMIKvxJ23qFasFBU+MBaqUVXP/fmJnLGcUXo7oo1jvheB4=
X-Gm-Message-State: AOJu0Yzuj1P3MDPiNTWn8mij06rzPJUuruOBH9ANVl2IsFcFq3qLMaHv
	wDEIk5J9WVBc2sb4PZ2YxRnu5CGHc+mma6ly5AxDGNtG1181Y1kO
X-Google-Smtp-Source: AGHT+IFWJRP53ZGQcILmesp11SkYwtkCw7B+T56HRmkDeDIKC0nI9Xt3v62mr8pYg6yxuQDhfxg0lA==
X-Received: by 2002:a05:6214:5546:b0:6b9:9151:d8c1 with SMTP id 6a1803df08f44-6bb9830fbb1mr191513846d6.11.1722976023490;
        Tue, 06 Aug 2024 13:27:03 -0700 (PDT)
Received: from skuld-framework.localnet ([32.221.37.233])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6bb9c83d039sm50000056d6.75.2024.08.06.13.27.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Aug 2024 13:27:03 -0700 (PDT)
From: Neal Gompa <neal@gompa.dev>
To: David Howells <dhowells@redhat.com>, dwmw2@infradead.org, zxu@redhat.com,
 keyrings@vger.kernel.org, Jan Stancek <jstancek@redhat.com>
Cc: linux-kernel@vger.kernel.org, Jan Stancek <jstancek@redhat.com>,
 Asahi Linux <asahi@lists.linux.dev>, Hector Martin <marcan@marcan.st>,
 Janne Grunau <j@jannau.net>
Subject:
 Re: [PATCH 0/3] sign-file,extract-cert: switch to PROVIDER API for OpenSSL >=
 3.0
Date: Tue, 06 Aug 2024 16:27:02 -0400
Message-ID: <27899413.1r3eYUQgxm@skuld-framework>
In-Reply-To: <cover.1720728319.git.jstancek@redhat.com>
References: <cover.1720728319.git.jstancek@redhat.com>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

On Friday, July 12, 2024 3:11:13=E2=80=AFAM EDT Jan Stancek wrote:
> The ENGINE interface has its limitations and it has been superseded
> by the PROVIDER API, it is deprecated in OpenSSL version 3.0.
> Some distros have started removing it from header files.
>=20
> Update sign-file and extract-cert to use PROVIDER API for OpenSSL Major >=
=3D
> 3.
>=20
> Tested on F39 with openssl-3.1.1, pkcs11-provider-0.5-2,
> openssl-pkcs11-0.4.12-4 and softhsm-2.6.1-5 by using same key/cert as PEM
> and PKCS11 and comparing that the result is identical.
>=20
> Jan Stancek (3):
>   sign-file,extract-cert: move common SSL helper functions to a header
>   sign-file,extract-cert: avoid using deprecated ERR_get_error_line()
>   sign-file,extract-cert: use pkcs11 provider for OPENSSL MAJOR >=3D 3
>=20
>  MAINTAINERS          |   1 +
>  certs/Makefile       |   2 +-
>  certs/extract-cert.c | 138 +++++++++++++++++++++++--------------------
>  scripts/sign-file.c  | 134 +++++++++++++++++++++--------------------
>  scripts/ssl-common.h |  32 ++++++++++
>  5 files changed, 178 insertions(+), 129 deletions(-)
>  create mode 100644 scripts/ssl-common.h

The code looks fairly reasonable to me and behaves as expected.

I have been actively using this patch set for several weeks now across=20
linux-6.9.y and now linux-6.10.y with good success.

It is in use in production for Fedora Asahi Linux kernels with good success=
=2E=20
Thanks for the fixes. :)

Reviewed-by: Neal Gompa <neal@gompa.dev>

=2D-=20
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!



