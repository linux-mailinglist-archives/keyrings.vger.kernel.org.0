Return-Path: <keyrings+bounces-3329-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 712FEC4F774
	for <lists+keyrings@lfdr.de>; Tue, 11 Nov 2025 19:39:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 24ADF3BD7F1
	for <lists+keyrings@lfdr.de>; Tue, 11 Nov 2025 18:38:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B340284672;
	Tue, 11 Nov 2025 18:38:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Lklcwhcz"
X-Original-To: keyrings@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 717C22857C7
	for <keyrings@vger.kernel.org>; Tue, 11 Nov 2025 18:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762886326; cv=none; b=tcwZV2phwGcEv8NAJcnO5lI51kRWhMx/mk8kGqBfM/O+MFD5xUFRutUrcUBqEcXrW0FsyINEu1ozDnbc0Zxymv6ZXTmIEkqfDzZFPv/MZgjJ8KhCNbe8gl20hBsLBkh+n+cW9F91boVzkbeRYzt6MO3k6pT6dEU3JYAgv+btYyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762886326; c=relaxed/simple;
	bh=m6sTk8T64878pdyCXjz95N9hZFFiTrac4lxnmwKPPls=;
	h=From:In-Reply-To:References:To:Cc:Subject:MIME-Version:
	 Content-Type:Date:Message-ID; b=LKvWSBW74s+0Zho7ZbmCN6wOjxY1y+lZx3GtkiB8IRmf52w5JvksdPNKHab4iFJDqWDkTd5J0CuehVC9jNkQgQ82CUOPadCkcpE9ooSRKObxQQJpl36/PeU1Yg+yndDyZ0UplwfiFla4P1AK8Lysye4UGxgNkUZpihDO86UtbzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Lklcwhcz; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1762886324;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Q9enfXg+0ycV2tTaXeBLF9cpw7nkyL9VYMhWpucnN4M=;
	b=LklcwhczCIZRrX9d8eZK2Hd0uOcXNz8TUmzmjBKrn82mMgeaIK2JwM6jgZgVxvTsdHZBFI
	t8kl4VM2H7WU2k/EqnLpBjLq2Btw3RDfk8XURWkbyzUgx2OJtV+aXo1vKnRiz1tIVw8FLV
	0WMTvNyNHabx9A+bJE8yuuZZ2L1Uywc=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-595-I4RIVNJmPAOiKKq4B-z5CQ-1; Tue,
 11 Nov 2025 13:38:41 -0500
X-MC-Unique: I4RIVNJmPAOiKKq4B-z5CQ-1
X-Mimecast-MFC-AGG-ID: I4RIVNJmPAOiKKq4B-z5CQ_1762886319
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A41CF1955DD9;
	Tue, 11 Nov 2025 18:38:38 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.42.28.87])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 8CD4F1800361;
	Tue, 11 Nov 2025 18:38:33 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <1ce413b202ca7c008e077a6f1cfa88f94a3a7cbd.camel@redhat.com>
References: <1ce413b202ca7c008e077a6f1cfa88f94a3a7cbd.camel@redhat.com> <IA4PR84MB4011FE5ABA934DEF08F1A263ABC3A@IA4PR84MB4011.NAMPRD84.PROD.OUTLOOK.COM> <501216.1749826470@warthog.procyon.org.uk> <CALrw=nGkM9V12y7dB8y84UHKnroregUwiLBrtn5Xyf3k4pREsg@mail.gmail.com> <de070353cc7ef2cd6ad68f899f3244917030c39b.camel@redhat.com> <3081793dc1d846dccef07984520fc544f709ca84.camel@HansenPartnership.com> <7ad6d5f61d6cd602241966476252599800c6a304.camel@redhat.com> <69775877d04b8ee9f072adfd2c595187997e59fb.camel@HansenPartnership.com> <3d650cc9ff07462e5c55cc3d9c0da72a3f2c5df2.camel@redhat.com> <534145.1762588015@warthog.procyon.org.uk> <IA4PR84MB4011485C0EFFFF9F2820A1BFABC1A@IA4PR84MB4011.NAMPRD84.PROD.OUTLOOK.COM>
To: Simo Sorce <simo@redhat.com>
Cc: dhowells@redhat.com, "Elliott, Robert (Servers)" <elliott@hpe.com>,
    James Bottomley <James.Bottomley@HansenPartnership.com>,
    Ignat Korchagin <ignat@cloudflare.com>,
    Herbert Xu <herbert@gondor.apana.org.au>,
    Stephan Mueller <smueller@chronox.de>,
    "torvalds@linux-foundation.org" <torvalds@linux-foundation.org>,
    Paul Moore <paul@paul-moore.com>, Lukas Wunner <lukas@wunner.de>,
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
Content-ID: <990171.1762886312.1@warthog.procyon.org.uk>
Date: Tue, 11 Nov 2025 18:38:32 +0000
Message-ID: <990172.1762886312@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

Simo Sorce <simo@redhat.com> wrote:

> If a defect in a signing algorithm is found you can simply distribute a
> new kernel with modules resigned with a different algorithm.

Probably more "have to" than "can".  The cert providing the composite key for
both would have to be invalidated to stop it from being used - and invalidated
by having it added to the UEFI dbx table.

David


