Return-Path: <keyrings+bounces-2843-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A1826ADB7C3
	for <lists+keyrings@lfdr.de>; Mon, 16 Jun 2025 19:27:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 138143AC779
	for <lists+keyrings@lfdr.de>; Mon, 16 Jun 2025 17:27:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B082288C1B;
	Mon, 16 Jun 2025 17:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Jy7zZHdR"
X-Original-To: keyrings@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFEE61F8676
	for <keyrings@vger.kernel.org>; Mon, 16 Jun 2025 17:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750094850; cv=none; b=fK/x773nRciZyrpRtOeSd8aqDW0/mYlf6jpeabkLp1vqXaGj8C0ZM1mIjxvgpes9sZyRRz/OMIDJJNhqqXQ2NBlJTdW9Eb8K2tA5BL3/lYENJXHMvSdv9haRkayAOH90scGIXoj0qTRDRNhwor6ycMqld2aEXlOKDBnULqcDKt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750094850; c=relaxed/simple;
	bh=w0PWzJYGZyUO7NaF3hKUPKQCpIVIVkYsajHq504Hcsk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jdkvDKIzbUkjgt6tDezcYMxLmv1mpQNw4laeMHDfMYinXoneZ2jw50lHPSJIh0pChpGh8uMlwluVLgXTwiGXDR9u0Slj/ITEf6ZQvdKEPcI0i3O1wj+N8vzwQzIRaQG14RYRdjGLe1Z7fF6g4RCGtpExGgDzistBfrUDYGJiefU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Jy7zZHdR; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750094847;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7AAtsmpqEB0sDxRTXjGqemaYQ70O61wfZxdM4h7t6Ns=;
	b=Jy7zZHdRnZbn88t46eEei7+oysXmMn/qdHtpBncj1aytO0bk5G/XnaMxq0HRCafiay4qrE
	c67U6T/v7/QlBL83pDKhTsoYVzL6EsXi50cuEh1zbEksAeiLS5vwo0qqXFjSZLjhDjLej4
	lI221UIVbuJwl54mvzs19rTuKdM/vIg=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-269-wQw2h-KlPZKuDdZrM6K6Dw-1; Mon, 16 Jun 2025 13:27:26 -0400
X-MC-Unique: wQw2h-KlPZKuDdZrM6K6Dw-1
X-Mimecast-MFC-AGG-ID: wQw2h-KlPZKuDdZrM6K6Dw_1750094846
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6fafc5092daso106460326d6.1
        for <keyrings@vger.kernel.org>; Mon, 16 Jun 2025 10:27:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750094846; x=1750699646;
        h=mime-version:user-agent:content-transfer-encoding:organization
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7AAtsmpqEB0sDxRTXjGqemaYQ70O61wfZxdM4h7t6Ns=;
        b=ukmTC2QR6Xfu2CcrpYoannKzR0zeFIFOtRbUU5k4Em3N/+/K2NIBUNmMvjwV7G0o51
         UvtcaJXJ1HwAhfdxyeXVUNNUSf+tFLKvKQrxZJD9VQRBTT1hKDvy7tYUxxV+/8pb+bfo
         hHYgBc3IFexFGGjDerUiU5cTx4hZK22ZRc7lpBEIvMT6Y/omGz22tj1MCzjSvRMqA7qh
         Eege+XqQd0z5fW9VrO0GW3JktrcGumBjFOiGVMeYYX3PqW8b2MA40xpwNHnZk6eDiLsh
         JHeC1Y6M84mVIlgy7qwlmlcRIPZEUTsop+x7mWLKZO6qIrgPzQHOLbjJvcljR/VfQgjH
         pzWw==
X-Forwarded-Encrypted: i=1; AJvYcCUveSGLOp3gQJHLVv97iVP6qmckoytRXkvpQ8Efn8eJylKJBvIvVVjoOQGFS6dyMOVXULUUsZWwOg==@vger.kernel.org
X-Gm-Message-State: AOJu0YysBJUe7223hbXCchzUJzPdLQJcrdmIEAJQlrOwVk8N5AwVcl01
	6RffRa2eybAPMFW1iEZgH+uH6rucu20g8ozbyQHXl4SCG+nxdSKnl7Uqi1hoy3xj3LwOGkmM3J0
	9/CfCblHcGHBKhTsNUkFWjZ/vadAwXXzXWJWa4BqB8eP7DNyl39hEsrc2svbX
X-Gm-Gg: ASbGncv5znfGQhPQzNY2OAdgRR61No1Nx97MVMm73pvlfllZsxkmZwcwt8Di4Odu1Tf
	u0NXeq4R9gWI1FDckSrJUSuAHx41MDt2+STbFTpL95XwlyASxJ34hibC0tKpFaZRhCo74JmrRBX
	qdJK9pLAlUBZCYJ4CNJfbNRH4dkn7iTmKGUxmkveSMYSC4BbfGeeauXd9mG5u2t+8sYINN7x73F
	iG0LBZaHvPB6i1m7bhni1fDB0MUsPXQvoij0ynQmsJ78onEjCeo8cYWa+koKYTY59+o6y4C6Gt2
	WWAk9pwNvRzJpkc+
X-Received: by 2002:a05:6214:21cb:b0:6e6:5b8e:7604 with SMTP id 6a1803df08f44-6fb46dd8a7bmr172783996d6.12.1750094845979;
        Mon, 16 Jun 2025 10:27:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG+VT874VaDjh9XjdWEtRP/Wjh2i/oUst+fM3UXJE4MF1bffqfULCVs+zkhlO/eICr0H8d4GA==
X-Received: by 2002:a05:6214:21cb:b0:6e6:5b8e:7604 with SMTP id 6a1803df08f44-6fb46dd8a7bmr172783546d6.12.1750094845593;
        Mon, 16 Jun 2025 10:27:25 -0700 (PDT)
Received: from m8.users.ipa.redhat.com ([2603:7000:9400:fe80::baf])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fb35c6c54fsm53397876d6.98.2025.06.16.10.27.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 10:27:25 -0700 (PDT)
Message-ID: <3d650cc9ff07462e5c55cc3d9c0da72a3f2c5df2.camel@redhat.com>
Subject: Re: Module signing and post-quantum crypto public key algorithms
From: Simo Sorce <simo@redhat.com>
To: James Bottomley <James.Bottomley@HansenPartnership.com>, Ignat Korchagin
	 <ignat@cloudflare.com>, David Howells <dhowells@redhat.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>, Stephan Mueller
	 <smueller@chronox.de>, torvalds@linux-foundation.org, Paul Moore
	 <paul@paul-moore.com>, Lukas Wunner <lukas@wunner.de>, Clemens Lang
	 <cllang@redhat.com>, David Bohannon <dbohanno@redhat.com>, Roberto Sassu
	 <roberto.sassu@huawei.com>, keyrings@vger.kernel.org, 
	linux-crypto@vger.kernel.org, linux-security-module@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Mon, 16 Jun 2025 13:27:24 -0400
In-Reply-To: <69775877d04b8ee9f072adfd2c595187997e59fb.camel@HansenPartnership.com>
References: <501216.1749826470@warthog.procyon.org.uk>
		 <CALrw=nGkM9V12y7dB8y84UHKnroregUwiLBrtn5Xyf3k4pREsg@mail.gmail.com>
		 <de070353cc7ef2cd6ad68f899f3244917030c39b.camel@redhat.com>
		 <3081793dc1d846dccef07984520fc544f709ca84.camel@HansenPartnership.com>
		 <7ad6d5f61d6cd602241966476252599800c6a304.camel@redhat.com>
	 <69775877d04b8ee9f072adfd2c595187997e59fb.camel@HansenPartnership.com>
Organization: Red Hat
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1 (3.56.1-1.fc42) 
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mon, 2025-06-16 at 11:14 -0400, James Bottomley wrote:
> The main worry everyone has is that while it is believed that there's
> not a quantum short cut over classical for lattice algorithms, they
> haven't been studied long enough to believe there's no classical short
> cut to breaking the encryption.  The only real algorithms we're sure
> about are the hash based ones, so perhaps we should start with XMSS/LMS
> before leaping to ML-.  Particularly for kernel uses like modules, the
> finite signatures problem shouldn't be that limiting.

The only case where you can use LMS/XMSS in software is if you perform
exclusively verification, or if you perform a small number of
signatures and then immediately destroy the private key.

LMS/and XMSS absolutely cannot be used as software algorithms to
generate signatures while keeping a key around because ensuring the
status is never reused is fundamentally impossible in software. And a
single reuse in LMS/XMSS means complete breakdown of the crypto-system.

Due to the above in general implementing LMS/XMSS signature generation
in software is a *very bad idea*(TM) because people do not understand
how it can be used safely, and I would seriously discourage it.

The next option in this line of thought is SLH-DSA (which I would favor
if not for the following).

The problems with SLH-DSA are that it has rather large signatures and
is the slowest of all the algorithms and that CNSA 2.0 does not list
SLH-DSA as approved :-(

> > > Current estimates say Shor's algorithm in "reasonable[1]" time
> > > requires around a million qubits to break RSA2048, so we're still
> > > several orders of magnitude off that.
> >=20
> > Note that you are citing sources that identify needed physical qbits
> > for error correction, but what IBM publishes is a roadmap for *error
> > corrected* logical qbits. If they can pull that off that computer
> > will already be way too uncomfortably close (you need 2n+3 error
> > corrected logical qbits to break RSA).
>=20
> The roadmap is based on a linear presumption of physical to logical
> qbit scaling.  Since quantum error effects are usually exponential in
> nature that seems optimistic ... but, hey, we should know in a couple
> of years.

To be honest it does not really matter, either we'll have a workable
quantum computer or not, if we do we do, and the scaling will be rapid
enough that the difference in required bits won't really matter. I find
it very unlikely that we'll find ourselves in a situation where we'll
have a QC that can efficiently performer the Grover's algorithm with
enough bits, and yet implementing Shor's one is too hard and will take
a decade or more to reach.

> >  so it is not really a concern, even with the smallest key sizes the
> > search space is still 2^64 ... so it makes little sense to spend a
> > lot of engineering time to find all places where doubling key size
> > break things and then do a micro-migration to that. It is better to
> > focus the scarce resources on the long term.
>=20
> Well the CNSA 2.0 doc you cite above hedges and does a 1.5x security
> bit increase, so even following it we can't do P-256, 25519 or RSA2048
> we have to move to at least P-384 and X448 (even though it allows
> RSA3072, I don't think we should be supporting that).  So if we're
> going to have to increase key size anyway, we may as well up it to 256
> bits of security.
>=20
> So even if you believe quantum is slightly more imminent than the
> Kazakh Gerbil invasion, we should still begin with the key size
> increase.

What I believe is that we should not worry about Grover, because if we
get a workable Grover implementation that works we'll get Shor's too
which breaks clsssic algorithms entirely. Therefore we better move to
PQ algorithms and not spend time on a "small transition".

Of course we can decide to hedge *all bets* and move to a composed
signature (both a classic and a PQ one), in which case I would suggest
looking into signatures that use ML-DSA-87 + Ed448 or ML-DSA-87 + P-521
,ideally disjoint, with a kernel policy that can decide which (or both)
needs to be valid/checked so that the policy can be changed quickly via
configuration if any of the signature is broken.

This will allow for fears of Lattice not being vetted enough to be
managed as well as increasing the strength of the classic option, while
maintaining key and signature sizes manageable.

--=20
Simo Sorce
Distinguished Engineer
RHEL Crypto Team
Red Hat, Inc


