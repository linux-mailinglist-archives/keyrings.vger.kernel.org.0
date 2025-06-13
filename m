Return-Path: <keyrings+bounces-2829-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BA711AD9049
	for <lists+keyrings@lfdr.de>; Fri, 13 Jun 2025 16:55:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9F1B47B0AD7
	for <lists+keyrings@lfdr.de>; Fri, 13 Jun 2025 14:54:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07BF21C7005;
	Fri, 13 Jun 2025 14:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MvV9Ims+"
X-Original-To: keyrings@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1731E1A76AE
	for <keyrings@vger.kernel.org>; Fri, 13 Jun 2025 14:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749826486; cv=none; b=aItHx45zTleepfAvmlBolm2azwSaa7MFymn/1lVpXodOTlLVSUu2otvOw/ijoTewE91WtT6pqFuSIJdXYFysNoRwWdN5Cyt5JmI17kQ9/xxdaj6XjoBRkEaNQPW6++qP3FCQ+ribLtQo1Uiry90c0Mokol1yF6r8xopxTnZ+F4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749826486; c=relaxed/simple;
	bh=LLeEIarksbDR+ruAO6Ua1Prx+jcWWce/HEzaa3B8Jro=;
	h=From:To:cc:Subject:MIME-Version:Content-Type:Date:Message-ID; b=b7HmRdsZJ0pZCbfInFJS3cZnQt7+uq8ra3y5L3ZHd32lJAhMi8aGQ/LFQX9Y5AITjHe6ehaD94v2YFgefBYQTBBMmaBiJPOofmldJoS84/M90P2RlVOccVWGx3sbQ6jhNwl/zp2R027QFVNI2B/TydX28030kgHmUGxkxhPtPPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MvV9Ims+; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749826481;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=9So26a++MHUdK9v3881Z330reK+K0iJs2Fhpuw5P5s0=;
	b=MvV9Ims+zjK9hjm3I0mikHdm+xnNzyY/DUd8qYhK7ItQTcQ6VQrL/pZVB9MvZjZsCB8jYn
	AVEtNyjvIQKg5rpzzhlGf2kkbRq96UMKhT6MNEsLRq25EOspXZM53J2vsXc7/G4R/VKslu
	RUgTSXdZLnQ9FvoSA6vsFbiYJiU/YbM=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-446--al5Mx2MNJW6W7t9IKXaOg-1; Fri,
 13 Jun 2025 10:54:38 -0400
X-MC-Unique: -al5Mx2MNJW6W7t9IKXaOg-1
X-Mimecast-MFC-AGG-ID: -al5Mx2MNJW6W7t9IKXaOg_1749826477
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 298081956080;
	Fri, 13 Jun 2025 14:54:36 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.42.28.18])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id DF932195E340;
	Fri, 13 Jun 2025 14:54:31 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
    Stephan Mueller <smueller@chronox.de>, Simo Sorce <simo@redhat.com>,
    torvalds@linux-foundation.org, Paul Moore <paul@paul-moore.com>
cc: dhowells@redhat.com, Lukas Wunner <lukas@wunner.de>,
    Ignat Korchagin <ignat@cloudflare.com>,
    Clemens Lang <cllang@redhat.com>,
    David Bohannon <dbohanno@redhat.com>,
    Roberto Sassu <roberto.sassu@huawei.com>, keyrings@vger.kernel.org,
    linux-crypto@vger.kernel.org, linux-security-module@vger.kernel.org,
    linux-kernel@vger.kernel.org
Subject: Module signing and post-quantum crypto public key algorithms
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <501215.1749826470.1@warthog.procyon.org.uk>
Date: Fri, 13 Jun 2025 15:54:30 +0100
Message-ID: <501216.1749826470@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15

Hi,

So we need to do something about the impending quantum-related obsolescence of
the RSA signatures that we use for module signing, kexec, BPF signing, IMA and
a bunch of other things.

From my point of view, the simplest way would be to implement key verification
in the kernel for one (or more) of the available post-quantum algorithms (of
which there are at least three), driving this with appropriate changes to the
X.509 certificate to indicate that's what we want to use.

The good news is that Stephan Mueller has an implemementation that includes
kernel bits that we can use, or, at least, adapt:

	https://github.com/smuellerDD/leancrypto/

Note that we only need the signature verification bits.  One question, though:
he's done it as a standalone "leancrypto" module, not integrated into crypto/,
but should it be integrated into crypto/ or is the standalone fine?

The not so good news, as I understand it, though, is that the X.509 bits are
not yet standardised.


However!  Not everyone agrees with this.  An alternative proposal would rather
get the signature verification code out of the kernel entirely.  Simo Sorce's
proposal, for example, AIUI, is to compile all the hashes we need into the
kernel at build time, possibly with a hashed hash list to be loaded later to
reduce the amount of uncompressible code in the kernel.  If signatures are
needed at all, then this should be offloaded to a userspace program (which
would also have to be hashed and marked unptraceable and I think unswappable)
to do the checking.

I don't think we can dispense with signature checking entirely, though: we
need it for third party module loading, quick single-module driver updates and
all the non-module checking stuff.  If it were to be done in userspace, this
might entail an upcall for each signature we want to check - either that, or
the kernel has to run a server process that it can delegate checking to.

It's also been suggested that PQ algorithms are really slow.  For kernel
modules that might not matter too much as we may well not load more than 200
or so during boot - but there are other users that may get used more
frequently (IMA, for example).


Now, there's also a possible hybrid approach, if I understand Roberto Sassu's
proposal correctly, whereby it caches bundles of hashes obtained from, say,
the hashes included in an RPM.  These bundles of hashes can be checked by
signature generated by the package signing process.  This would reduce the PQ
overhead to checking a bundle and would also make IMA's measuring easier as
the hashes can be added in the right order, rather than being dependent on the
order that the binaries are used.

David


