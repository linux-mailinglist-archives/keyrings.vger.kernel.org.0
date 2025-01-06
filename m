Return-Path: <keyrings+bounces-2340-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CB15EA01E4A
	for <lists+keyrings@lfdr.de>; Mon,  6 Jan 2025 04:41:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ADBA81628FA
	for <lists+keyrings@lfdr.de>; Mon,  6 Jan 2025 03:41:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 185C018A93E;
	Mon,  6 Jan 2025 03:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="IaFudVQo"
X-Original-To: keyrings@vger.kernel.org
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AEB117E0
	for <keyrings@vger.kernel.org>; Mon,  6 Jan 2025 03:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736134864; cv=none; b=axuo0e+Kmw00ACHLK6Yv4khXcXuoDjCBb1HAhuayi6KFCCHp+22iBwTSysmeU88E2mNyDYUoS8jnAcLhrerOPgQvX2lHgSVbjZgqUg/DXShoik4pEshZyXKn0ekZba3NU+QHHb+rt1kvXvNVfy9HlaRCcLN3x29a3eH5OvB12Ys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736134864; c=relaxed/simple;
	bh=8DUGcNzptq1qMBNMQD/ZKivSEc24A77W165dn0Ba4IU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OLJaxXp8Mxn2BjOBmd54MJ4wLxq76BoAFFcachVOg328OKGbgoaxfSG9zfRUvyJkPGsqf0EGBhb8gVqL4Da4C+mrURZp9Z/rmRI0eoDjsF4/dR64/GZcuG9G8WbgskYyKKfbsQwvkgZ0izLUMFDbuAQXwNMQj/VFObcxOLJN6aM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=IaFudVQo; arc=none smtp.client-ip=209.85.219.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-e5390ed85a1so18620598276.1
        for <keyrings@vger.kernel.org>; Sun, 05 Jan 2025 19:41:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1736134861; x=1736739661; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6t4+KmeeCy/tpHdFuGwkBi9hlofz3W6ub54t1sWW4xg=;
        b=IaFudVQomY0CGTZMZZ/QWrq6Sxqdqpm8GxZBVG+GIAiBifgYOd9fPWagXG2CXSdfas
         3lnuAQL6fToxzerwOnK1TRsR+WNAKOyHlqcSnd2+TUwJWRhG0aemZlXxHTm4d3fPcOQU
         tdPG9Wyxv/XD/cshVQI2noPBDU4p/jsM5oWw3w/bdsi2mKZoo3KRywnTt4Oz+za+wRg/
         f0dQL0CFKMpgocwyckUtuXrACgIinI6++o8nVlL4U3XyXoiE5tAigHQdslEyGXctJ88g
         kfAdZdjpvGI72RTTzJ6QPza6imRyPS43OAiqvDM9BKxVTaIuXFrCvE5QjlqXozXyGw3I
         QUag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736134861; x=1736739661;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6t4+KmeeCy/tpHdFuGwkBi9hlofz3W6ub54t1sWW4xg=;
        b=nyXSjWiQ5sM5ghZvrnnrTfH7rLbFJS9P1TJ2Ouf6icMbSdG0jYaLyv2hGUdEM5lFTF
         0ANFj1YHWohloIRUxcIcxaZh9aEqlACQ3Xms4aQjSKHAdkIdNSUows5s67PwdD5lYHV3
         +oQYoC0UkdMRRIKpJb4CjPFuHBhs9gpYouRgHnM937KgJfWTM+/yGLlug/Wv52j9nRZu
         zXEfH4Tyl89HQ2WwftkI7i0yXfvXqv7O0RAyBYcxYLIA1oL238VvgVk1v/qYj1igtUcS
         qW6+WS/Q9Cqvj91wywFyqcVsAt6hbM+7cQWHVzHu2jrrMUJ8Omh/J/PuUMcCuw26bV63
         QFfQ==
X-Forwarded-Encrypted: i=1; AJvYcCWY4qZNn/+nWGVfJwQuNL4KzkPKDIjJHSHnJ/KUWR1DnCRHDqsA5QENU31rEGIPN705gCmiqLXMJw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyoB4dOFgPUeq752SRLB5KvlB3/DkAM597Mn/Kodam5JDpr7Iu9
	82MmMjmh7aVOk54E5f06ercXjTOeCVYEDixnLGHV1cw7rrSuV6p0pAI4p+MJbaQiCryYCcc0lsg
	HqIZY9QbdcE7qzNOiG+XBlOMqeCEMA6Cb5+YT
X-Gm-Gg: ASbGncup0+junQ4P9S24O1Hn+xCqrLzhj/Jrefmrpz7P8jZgCJtnyxeYBJ9LLqlKX5v
	0Zo0cAs1z1tMt9Jk+k42Msv5GcE/Oj2LXd6nn
X-Google-Smtp-Source: AGHT+IGV5iWI1X9jzlMyykT81bJsVn3tu5hbb0dX48snfbYwM4zQ6K8WfYhBMKhfP8y7t6HQ8jUgFUo/mnKTQ27HptU=
X-Received: by 2002:a05:690c:62c6:b0:6ef:59ef:f194 with SMTP id
 00721157ae682-6f3f80de678mr365800587b3.4.1736134861363; Sun, 05 Jan 2025
 19:41:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241017155516.2582369-1-eric.snowberg@oracle.com>
 <c490397315c2704e9ef65c8ad3fefedb239f1997.camel@linux.ibm.com>
 <72F52F71-C7F3-402D-8441-3D636A093FE8@oracle.com> <CAHC9VhRHEw5c+drC=aX4xTqWoQJJZ+qkJ7aHUT5dcu+Q5f7BqA@mail.gmail.com>
In-Reply-To: <CAHC9VhRHEw5c+drC=aX4xTqWoQJJZ+qkJ7aHUT5dcu+Q5f7BqA@mail.gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Sun, 5 Jan 2025 22:40:50 -0500
Message-ID: <CAHC9VhSJpnaAK1efgs1Uk0Tr3CaDNR1LiDU-t_yDKDQG6J-74Q@mail.gmail.com>
Subject: Re: [RFC PATCH v3 00/13] Clavis LSM
To: Eric Snowberg <eric.snowberg@oracle.com>
Cc: Mimi Zohar <zohar@linux.ibm.com>, 
	"open list:SECURITY SUBSYSTEM" <linux-security-module@vger.kernel.org>, David Howells <dhowells@redhat.com>, 
	David Woodhouse <dwmw2@infradead.org>, 
	"herbert@gondor.apana.org.au" <herbert@gondor.apana.org.au>, "davem@davemloft.net" <davem@davemloft.net>, 
	Ard Biesheuvel <ardb@kernel.org>, Jarkko Sakkinen <jarkko@kernel.org>, James Morris <jmorris@namei.org>, 
	"Serge E. Hallyn" <serge@hallyn.com>, Roberto Sassu <roberto.sassu@huawei.com>, 
	Dmitry Kasatkin <dmitry.kasatkin@gmail.com>, =?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>, 
	"casey@schaufler-ca.com" <casey@schaufler-ca.com>, Stefan Berger <stefanb@linux.ibm.com>, 
	"ebiggers@kernel.org" <ebiggers@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, 
	open list <linux-kernel@vger.kernel.org>, 
	"keyrings@vger.kernel.org" <keyrings@vger.kernel.org>, 
	"linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>, 
	"linux-efi@vger.kernel.org" <linux-efi@vger.kernel.org>, 
	"linux-integrity@vger.kernel.org" <linux-integrity@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 3, 2025 at 11:48=E2=80=AFPM Paul Moore <paul@paul-moore.com> wr=
ote:
>
> Regardless, back to Clavis ... reading quickly through the cover
> letter again, I do somewhat wonder if this isn't better integrated
> into the keyring proper; have you talked to both David and Jarkko
> about this?

I realize I should probably expand on my thinking a bit, especially
since my comment a while regarding LSMs dedicated to enforcing access
control on keys is what was given as a reason for making Clavis a LSM.

I still stand by my comment from over a year ago that I see no reason
why we couldn't support a LSM that enforces access controls on
keyrings/keys.  What gives me pause with the Clavis LSM is that so
much of Clavis is resident in the keyrings themselves, e.g. Clavis
policy ACLs and authorization keys, that it really feels like it
should be part of the keys subsystem and not a LSM.  Yes, existing
LSMs do have LSM specific data that resides outside of the LSM and in
an object's subsystem, but that is usually limited to security
identifiers and similar things, not the LSM's security policy.

That's my current thinking, and why I asked about locating Clavis in
the keys subsystem directly (although I still think better keyring
granularity and a shift towards usage based keyrings is the better
option).  If David and Jarkko are opposed to integrating Clavis into
the keys subsystem we can consider this as a LSM, I'm just not sure
it's the best first option.  Does that make sense?

--=20
paul-moore.com

