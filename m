Return-Path: <keyrings+bounces-3311-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 32532C428EB
	for <lists+keyrings@lfdr.de>; Sat, 08 Nov 2025 08:47:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C87AB188DA82
	for <lists+keyrings@lfdr.de>; Sat,  8 Nov 2025 07:47:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6778B269B1C;
	Sat,  8 Nov 2025 07:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="D4z1Ks93"
X-Original-To: keyrings@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE73923AB9D
	for <keyrings@vger.kernel.org>; Sat,  8 Nov 2025 07:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762588033; cv=none; b=FGNMKUwcDR9jO5MlYYqqxtBAR8aiIi6a2k6iw5uIvspw5Fmdo2X5e+TVFM4S5DxyrcXbdY2DwyvKcOaZ8fK1hEvCOEtDwqVg2m7orCAgs6Xqg730UxxbkIcoCugKSDawfPekYAHIBcxVoD25bHZiKqsCd7G+o5oO0+GziASRTJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762588033; c=relaxed/simple;
	bh=vjl5287hLRl4njUWMlv0qb8EzZ29/CVnyQo9ZCMLklI=;
	h=From:In-Reply-To:References:To:Cc:Subject:MIME-Version:
	 Content-Type:Date:Message-ID; b=sXxeBQITUc879e0M98VVU1af0tdIZETBtbo/ckAwDWAPp+MLuAUEck6L/T91mSNOO83AgHH0tOsiM5Vl/W6kkcFmVbhw4gA15/WG3zEUh0rp6ejke90IUsmol83+48GORzcPwSfLiCKd7gyqg8eD8rs33IulYTUaJatXGjMGrg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=D4z1Ks93; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1762588030;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LuKEqEw6DZ48I+qyPJwUdxthKmamUkZDEAoTdVuzEGw=;
	b=D4z1Ks93euXabM4VupX7X6f3kyHfPGuSd8PnFcgrS84f8DbCKtE3+RAtdhrbifdxWdp+nv
	X91vEFmwdHKjs8wZEqrkvoviL3w5ixiNyiUtSvOKYyrYucm2tNja8AZhWkfx57JKPUT4go
	fqH2xguFZcCIWi6nB9iwmqm6xguudnE=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-672-c5kGRIReN4S2LGPD9BPeHQ-1; Sat,
 08 Nov 2025 02:47:06 -0500
X-MC-Unique: c5kGRIReN4S2LGPD9BPeHQ-1
X-Mimecast-MFC-AGG-ID: c5kGRIReN4S2LGPD9BPeHQ_1762588024
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 486751800650;
	Sat,  8 Nov 2025 07:47:03 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.42.28.6])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 99900180087C;
	Sat,  8 Nov 2025 07:46:56 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <IA4PR84MB4011FE5ABA934DEF08F1A263ABC3A@IA4PR84MB4011.NAMPRD84.PROD.OUTLOOK.COM>
References: <IA4PR84MB4011FE5ABA934DEF08F1A263ABC3A@IA4PR84MB4011.NAMPRD84.PROD.OUTLOOK.COM> <501216.1749826470@warthog.procyon.org.uk> <CALrw=nGkM9V12y7dB8y84UHKnroregUwiLBrtn5Xyf3k4pREsg@mail.gmail.com> <de070353cc7ef2cd6ad68f899f3244917030c39b.camel@redhat.com> <3081793dc1d846dccef07984520fc544f709ca84.camel@HansenPartnership.com> <7ad6d5f61d6cd602241966476252599800c6a304.camel@redhat.com> <69775877d04b8ee9f072adfd2c595187997e59fb.camel@HansenPartnership.com> <3d650cc9ff07462e5c55cc3d9c0da72a3f2c5df2.camel@redhat.com>
To: "Elliott, Robert (Servers)" <elliott@hpe.com>
Cc: dhowells@redhat.com, Simo Sorce <simo@redhat.com>,
    James Bottomley <James.Bottomley@HansenPartnership.com>,
    Ignat Korchagin <ignat@cloudflare.com>,
    Herbert Xu <herbert@gondor.apana.org.au>,
    Stephan Mueller <smueller@chronox.de>,
    "torvalds@linux-foundation.org" <torvalds@linux-foundation.org>,
    Paul Moore <paul@paul-moore.com>, "Lukas
 Wunner" <lukas@wunner.de>,
    Clemens Lang <cllang@redhat.com>,
    David Bohannon <dbohanno@redhat.com>,
    Roberto Sassu <roberto.sassu@huawei.com>,
    "keyrings@vger.kernel.org" <keyrings@vger.kernel.org>,
    "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
    "linux-security-module@vger.kernel.org" <linux-security-module@vger.kernel.org>,
    "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: Module signing and post-quantum crypto public key algorithms
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <534144.1762588015.1@warthog.procyon.org.uk>
Date: Sat, 08 Nov 2025 07:46:55 +0000
Message-ID: <534145.1762588015@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

Elliott, Robert (Servers) <elliott@hpe.com> wrote:

> The traditional signature would use whatever algorithm is used today.
> Legacy verifiers would only check that.

Would there be any legacy verifiers?  Kernel modules are generally tied to the
kernel version for which they were compiled.  Granted there are things like
the wifi regulatory stuff that are also signed.

But note also, PKCS#7 supports multiple independent signatures in a single
object.  The kernel will handle this already.  At least one signature must be
verifiable and none must be blacklisted.

I assume that the main aim of using a composite algorithm is to share the
result of the content hash - but in this case only the authenticatedAttributes
are going to be hashed for the signature, and that's relatively small.

David


