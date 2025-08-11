Return-Path: <keyrings+bounces-2958-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 51063B1FD55
	for <lists+keyrings@lfdr.de>; Mon, 11 Aug 2025 02:39:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 01C713B8153
	for <lists+keyrings@lfdr.de>; Mon, 11 Aug 2025 00:39:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2414B4315A;
	Mon, 11 Aug 2025 00:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k0W5BXEq"
X-Original-To: keyrings@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E37F29408
	for <keyrings@vger.kernel.org>; Mon, 11 Aug 2025 00:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754872749; cv=none; b=pxhR2+VTb6j2OAWc08B/wTtlKWgcGoUt8l0mOKhdJhlAHoBYzfzhbYT6SbWJvw5+k1yAWiHVG2zysu+kbu5sgIBi/W5tF0PYRAmzMgf9JtrBhoST+bbTojy0qoZDwW88y0JNtuJsU1YgW7xRLjDq/80Xhq8R+lY5ylFzGZuxvs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754872749; c=relaxed/simple;
	bh=GknIAQIQa12XVruwTzYdieJPurixGsD+nvUMw6JISPM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X9syarrMjbN7YpLorxpNf0rvFpy8AK57NLeyeMKJwrmG7TlgdAFcvwcbHWhjmYI7V5cSxbEYDycruPEIeziUqPtnnMvga9UPLPJeBCRSovhDymrsI2cTY83e+3yn3eFXwPy3AjTAhjFEgSfXxbaAUDqGz7ZMrb0tmztpVZI2aPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k0W5BXEq; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-32f1aaf0d60so34042861fa.1
        for <keyrings@vger.kernel.org>; Sun, 10 Aug 2025 17:39:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754872746; x=1755477546; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GknIAQIQa12XVruwTzYdieJPurixGsD+nvUMw6JISPM=;
        b=k0W5BXEqQBfMZoDfhrR9BmJj6itQbHi/m7nFLfIWs1mzfTuNk1yu/4hwsKXEw03MmJ
         oRXcTt3TQYEBbHxZIX0rTXnBiRsAJfL8xl8u4WXUjhWeTSj30aVhq5h6+md/rQBde31u
         87XW6kfWSNafio65+3ezFgqR4fRJ4r2jSbuAl87G339qtzUmCmw5Ho6m2hKIxvJtu5Ts
         rkr1tFmyykU2VBDFYvZAw2y7VboDwAtMg3qT3c7UUtwluQpmrvL347WXPRofZqggotIY
         Js+8ftEkTMWgI6WPj/cTMexbE8FDb6Ny7kT84DzVLocmSZrxE83vMOU3xFSxl31ampMw
         lIsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754872746; x=1755477546;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GknIAQIQa12XVruwTzYdieJPurixGsD+nvUMw6JISPM=;
        b=PwGPJ8q7+u4QXy5iW3YxpQbbNTyCMBbTUC3sPDSlJS0rQipTCCHEiASuNb5gcoqkrW
         +2kFZMpL03onBlDjYRXjMulqWLMLOR6SXh9i10USvioRF4pkkpX0V1nWIHS27xDBJwDB
         cjOSwE2sILZtuESR0Q2ImtE44dggI5vNa6NoFr7Td0BdOE+KkOp27MFhGGjCwa68oyxk
         z7DN3sNgDCq/vVn2BtBnhBzEXhZUxUKQ9TWy5VXetjH3AaB8jP1fzgmsSmAID5Un5WJF
         81m9742itcm7QR+XgTT2FWW7zp2C64cU0wK3NlS91vkSlXaI7pgsNFLPP/JLU8XQisQI
         ekNQ==
X-Gm-Message-State: AOJu0YwM2JLk7R2e1KZCkkFWh7o1Q/Lt/3P4KElyKU2K56eZIO5WwO9N
	gO0jzBZjYL0qaIDL8IirvNOZO7yljp9+i5aWqWh19TiMAY9PaMqowu9T+BuKFcM2LwhwA14EDis
	bHLl67xrKnHhpZnQ8k46GNDt85GcufT9xrn+f
X-Gm-Gg: ASbGncvN/hoiTCKCCN+EBaBH84sI5NJqMmuu2QOxYe7tu8v7mVnfctrzEcLxB/3Uuuw
	028h5t5OXAr6fuI/YWGE44DEPEvNyV3xHwUElvb2TT9PXa3la7FmbeRluB1wRGWyojvRluAjWzd
	TybRizfYnOukZ66ZEbIc1Gibwu3k/foaMrpgH+ehgSIMRRsKLLThYFfhTEuU3aGeZw9W+jFjZ22
	HVlAw==
X-Google-Smtp-Source: AGHT+IF/V/XsIHm4zuDruWQPyDWCZRpiadX+QRl0e2gTzfXKDQ/x9m584XJip/88IsAsWO2IqXARgCUlM3lUZVLU/4A=
X-Received: by 2002:a2e:a592:0:b0:332:1de5:c51a with SMTP id
 38308e7fff4ca-333a225b5dfmr28332331fa.36.1754872745520; Sun, 10 Aug 2025
 17:39:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250810224041.3025756-1-mattst88@gmail.com>
In-Reply-To: <20250810224041.3025756-1-mattst88@gmail.com>
From: Matt Turner <mattst88@gmail.com>
Date: Sun, 10 Aug 2025 20:38:54 -0400
X-Gm-Features: Ac12FXza3w4Mjd3JFSDUyhUJtWYjxq4hZ9gaQoKXt11RoP3oscdyx6XZ1DNbR28
Message-ID: <CAEdQ38Fq6pzShcBWE=rymx_7FkW+irTQjqc4DfUNCubrGxirVA@mail.gmail.com>
Subject: Re: [PATCH] test: Handle EDQUOT in act_keyctl_test_limits
To: David Howells <dhowells@redhat.com>
Cc: keyrings@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 10, 2025 at 6:41=E2=80=AFPM Matt Turner <mattst88@gmail.com> wr=
ote:
>
> This matches the behavior in `act_keyctl_test_limits2` and avoids a test
> failure [1] on some platforms:
>
> ```
> TEST SIZE 192._._._._._._
> 197 desc wrong error: Disk quota exceeded
> ._
> 198 desc wrong error: Disk quota exceeded
> ._
> 199 desc wrong error: Disk quota exceeded
> ._
> 200 desc wrong error: Disk quota exceeded
> ```
>
> [1] https://bugs.gentoo.org/789837#c9

I should have actually linked to https://bugs.gentoo.org/938132 as
well or instead.

