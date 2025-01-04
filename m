Return-Path: <keyrings+bounces-2336-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 77290A0124D
	for <lists+keyrings@lfdr.de>; Sat,  4 Jan 2025 05:48:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A817D3A3901
	for <lists+keyrings@lfdr.de>; Sat,  4 Jan 2025 04:48:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5A9A13C8F3;
	Sat,  4 Jan 2025 04:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="Bg35BtrZ"
X-Original-To: keyrings@vger.kernel.org
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F322F3A8D0
	for <keyrings@vger.kernel.org>; Sat,  4 Jan 2025 04:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735966130; cv=none; b=duV5pBttbdy3Txa6MloR1Em4U8bv5b6zC8/3efMCrkk5y84tme6aEocOBG6YqPYrxNGvNKjZN/PjT8M/Q/LD5NUpTUmRrpp+23IswvgJTIuXk9InBb5vvuVFYH4p4AjJ9wOkRNGGWm1B5CKZ59P2M7rXsRGtadoLmv0/m5d1agc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735966130; c=relaxed/simple;
	bh=A0s2YuACES6mN6TZFiv4N7G7rES2pmBqDGCXNSeyq7w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CJZux9vAwUv+W7o+DFbGpDKVn8xDUnufcsTMctbB8FI6VOglZwoDXrjOiMaGA2eQ0ZuWsYxWFMBNp345FtNQFLM/EFUyZUe2/xfWF668YX+eLqmHFPZs302hHOkC/U4BMKL33p16egO8DqSg8EIbOyx0eMfEkJojUyKEtLjqaD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=Bg35BtrZ; arc=none smtp.client-ip=209.85.219.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-e460717039fso16418945276.0
        for <keyrings@vger.kernel.org>; Fri, 03 Jan 2025 20:48:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1735966128; x=1736570928; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LnP5GGCllDyCZL0yygmBRlrRMIsnWX12av0h5HGIO6s=;
        b=Bg35BtrZiuJaoZNovuHpcWdmklFwDccz0FsJtLf4vMvucVDTPz8MGrlYtm2UEvbelk
         HCc7KTdL1uHnjP8ft//YE7SjdfZ/fz1ZX7s8ZUEsTMF8BHZMJIFQRXwqUe8rcfXaasq3
         gSMYhhCojgDRnp47pRGoGD/tIsAZLyO8Yag4hm1Bo0W+YxwxtA2AFb3AONVHSwC9iwyI
         oYeEX/ZRcy0K7gWlchbYB5TqycN+Olu2gQmLoct05vk/lC1Y3p6vCv5Ck6dONxvycb5M
         IWQtMpkq5KO5mgSbZnF5U/YrZF8lg8n8Ev0IMleIYWdzcI6TQrOlgORgFxVSIFmJl0JV
         TYEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735966128; x=1736570928;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LnP5GGCllDyCZL0yygmBRlrRMIsnWX12av0h5HGIO6s=;
        b=vUjiDhpcjLmnuDfH96XFuKTCpGNXJZ53cMa0g/EqVpCWBDSCsRaStdeeMarZEk8LpJ
         NIoBxFKNVeI3MHdjilwJbqg7eOWHDwkJ5d3Ud/D5+l9UitTjj3f7jQFzHHZJW/8HMXgz
         O5wRXgCuJdnkdesZliebpUVhCr8vrhJ36tFT35LVa+We+JduVGGZm3I0/6esgH2euC+H
         NMuXH2jpePLgxbafyrfLcqT2OJYcMHdSVHYEBET2HaheMZK1m6JONL4k4ux8qW7cnIHT
         ANaDLYpub1IKLb9823E3s8lweTNVd094NG9RTmAQBu9uu9/d+dMRVnEx2TBODkxQuCOp
         9DjQ==
X-Forwarded-Encrypted: i=1; AJvYcCVh6KL2c/isEN7qN1W43yCJ0NzdczAE3TmExNNSD1MzbXCUijMfl0M/xYnaHP4vb4ATB9BsXPjN+A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7E9BbwuJDW7Afs1uDPW8otndQt6HhZ/LHSmJYahuBH7U98dH0
	wAQWz58P5hBMJsO/4h0he44F3X/KVY2IhuxQDlTmnLWrjukCIVwxwurCFW2A8yyC7jmUHQK4xgo
	dUsLS0pu2/kO01vQ1hEvN8ayb6yw4/wiPXB7c
X-Gm-Gg: ASbGncvYt6qSyRvPBf82kwFz6QXWoE0aGgH108WLjfWNPScyQ22YWffwbE+eW1cIUuO
	2wXlWPJ6+gQHlp3+fI+YPDNO1uujXoRn2TIJ8
X-Google-Smtp-Source: AGHT+IEL+4JFcHvCubvCZz/BZBs/n/SCUkFCpUxerc6R9k/w1c/UFGB0K2dl2RQP5eYGYDWQQb7MKzYrVM5fND2eMjs=
X-Received: by 2002:a05:690c:690b:b0:6ef:7036:3b57 with SMTP id
 00721157ae682-6f3f821a2camr379894657b3.28.1735966127992; Fri, 03 Jan 2025
 20:48:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241017155516.2582369-1-eric.snowberg@oracle.com>
 <c490397315c2704e9ef65c8ad3fefedb239f1997.camel@linux.ibm.com> <72F52F71-C7F3-402D-8441-3D636A093FE8@oracle.com>
In-Reply-To: <72F52F71-C7F3-402D-8441-3D636A093FE8@oracle.com>
From: Paul Moore <paul@paul-moore.com>
Date: Fri, 3 Jan 2025 23:48:37 -0500
Message-ID: <CAHC9VhRHEw5c+drC=aX4xTqWoQJJZ+qkJ7aHUT5dcu+Q5f7BqA@mail.gmail.com>
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

On Fri, Jan 3, 2025 at 6:14=E2=80=AFPM Eric Snowberg <eric.snowberg@oracle.=
com> wrote:
> > On Dec 23, 2024, at 5:09=E2=80=AFAM, Mimi Zohar <zohar@linux.ibm.com> w=
rote:

...

> > My main concern is not with Clavis per-se, but that the LSM
> > infrastructure allows configuring all the LSMs, but enabling at build t=
ime and
> > modifying at runtime a subset of them.  Without Clavis enabled, nothing=
 changes
> > - any key on the system trusted keyrings remains usable for any purpose=
.  With
> > the current LSM design, the end user security threat model cannot be gu=
aranteed.
>
> I went in the direction of creating a new LSM based on this discussion [1=
].
> I was hoping to get some feedback from Paul, since I believe I have
> addressed the guidelines for a new LSM.  Currently, the Clavis LSM only
> adds a single LSM hook.  To address your concern, maybe Clavis shouldn't
> be a LSM?  Possibly it could live in the keyring code on its own.

My turn to apologize for a very late reply, you've been very patient
and I appreciate that.

With respect to Mimi's concerns about disabling Clavis, or any LSM for
that matter, at runtime, doing so requires the ability to modify the
kernel's command line.  I would argue that if a user can manipulate
the kernel command line there are more serious issues that need to be
dealt with first.  Any user who is seriously concerned about the state
of their system should have some mechanism in place to ensure that the
kernel command line is not subject to tampering; thankfully there are
efforts underway to help bring tamper resistant command lines to a
larger audience (the UKI work).

I can't remember if anyone has ever brought this up on-list, and if so
what objections there may have been, but I've always wondered if the
real problem is simply that we use a handful of keyrings for far too
many things inside the kernel.  What terrible things would need to be
overcome if we created additional keyrings based on usage, e.g.
".modulesigning", and used these task specific keyrings instead of the
existing source/trust oriented keyrings?  I imagine we would likely
need some mechanism to link a key from the existing source/trust
keyrings, e.g. ".machine", to a task specific keyring, e.g.
".modulesigning", but I can't imagine that would be too difficult.

Regardless, back to Clavis ... reading quickly through the cover
letter again, I do somewhat wonder if this isn't better integrated
into the keyring proper; have you talked to both David and Jarkko
about this?  Were they supportive of the idea, but simply felt it was
better as an LSM?  I see Jarkko has reviewed and commented on a number
of the patches, so I'll take that as an implicit acceptance of the
concept, but have you heard anything from David?

--=20
paul-moore.com

