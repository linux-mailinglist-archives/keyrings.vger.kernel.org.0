Return-Path: <keyrings+bounces-1199-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AF4BE8C4B28
	for <lists+keyrings@lfdr.de>; Tue, 14 May 2024 04:18:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 68253284A7A
	for <lists+keyrings@lfdr.de>; Tue, 14 May 2024 02:18:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 336A06FBE;
	Tue, 14 May 2024 02:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="acChmHXv"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04ADE1C36;
	Tue, 14 May 2024 02:18:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715653109; cv=none; b=KvOcP8bqOB4qafvFSul5mLAjf9qkwLFlJSrJ84EEUbZOE5FlttqK5bvq7sNwxHaYV4G38dTzc87+fdnb7z+1BlQ90AfSAz8kouuxEZ5wye4NcU8hMFZyAdn2/0U+R7jakUfU14hxS/UVjccWdwr+SYkZTF/bs61aMyzHaWAA2RU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715653109; c=relaxed/simple;
	bh=deNbv7svzdjItTDnYRdObkPUrJEVJwJFdAxldaKHwvs=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To; b=jwi/f3e7CCWjGIdnLQEYwcGzdGc9ArZxHlwfgr0UpIt/dvPS6F1/g6Nk5rWvixippuTpGalri7GTFiV5RlSuKoUk2qatXMw6JWZ3JyebwFogmagXX84+UKc42agiPXvF1O1xf3/1uBjEQ4HReadZehWf/1rK2gaau8NQm5HV14s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=acChmHXv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AB62C113CC;
	Tue, 14 May 2024 02:18:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715653108;
	bh=deNbv7svzdjItTDnYRdObkPUrJEVJwJFdAxldaKHwvs=;
	h=Date:Cc:Subject:From:To:From;
	b=acChmHXvcf3KdpaQR/sEaYP4EHGmldW5XsqdF6ZyOkvq8GdJz0lIE0PLeONPQ94VR
	 y1vs4f5xQg6IdsNtL4BSt8WS+MbKqxYR7i9dq1dpMylfgKI53MZIivFX5C8bv1M7RB
	 xaqO/JkeKfnJrXM62NSk4/KX22CJP1/Ttdo4/5ylELkb5wtHw69OSx2MS5NR6fSqFt
	 HuIFms0VFGBo6TPPjAyIw1jFb2INQOw3jKTwa9pO7PP8HkX2w0LWOJZQa8L/Xf6joG
	 AVrCjZhsppPJks40SZKcuq27WW8/miMjVbESZtZWgGG9mPjknRBybXLSLbYQKf4JE0
	 Bz9iv6K75uKNQ==
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 14 May 2024 05:18:25 +0300
Message-Id: <D1909NYKXM11.3VLXHOO4NA7RA@kernel.org>
Cc: "David Howells" <dhowells@redhat.com>, "Herbert Xu"
 <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>,
 <keyrings@vger.kernel.org>, <linux-crypto@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: [GIT PULL] ASYMMETRIC KEYS: asymmetric-keys-next-6.10-rc1
From: "Jarkko Sakkinen" <jarkko@kernel.org>
To: "Linus Torvalds" <torvalds@linux-foundation.org>
X-Mailer: aerc 0.17.0

The following changes since commit f4e8d80292859809ea135e9f4c43bae47e4f58bc=
:

  Merge tag 'vfs-6.10.rw' of git://git.kernel.org/pub/scm/linux/kernel/git/=
vfs/vfs (2024-05-13 12:23:17 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git tags=
/asymmetric-keys-next-6.10-rc1

for you to fetch changes up to 747ae81883d21595b162cc40523a982024700fed:

  certs: Add ECDSA signature verification self-test (2024-05-14 05:01:04 +0=
300)

----------------------------------------------------------------
Hi,

Adds a self-test testing PCKS#7 signed data against ECDSA key and
couple of bug fixes for missing deps.

BR, Jarkko

----------------------------------------------------------------
Eric Biggers (2):
      KEYS: asymmetric: Add missing dependency on CRYPTO_SIG
      KEYS: asymmetric: Add missing dependencies of FIPS_SIGNATURE_SELFTEST

Joachim Vandersmissen (2):
      certs: Move RSA self-test data to separate file
      certs: Add ECDSA signature verification self-test

 crypto/asymmetric_keys/Kconfig          |  17 +++
 crypto/asymmetric_keys/Makefile         |   2 +
 crypto/asymmetric_keys/selftest.c       | 219 +++++-----------------------=
----
 crypto/asymmetric_keys/selftest.h       |  22 ++++
 crypto/asymmetric_keys/selftest_ecdsa.c |  88 +++++++++++++
 crypto/asymmetric_keys/selftest_rsa.c   | 171 +++++++++++++++++++++++++
 6 files changed, 330 insertions(+), 189 deletions(-)
 create mode 100644 crypto/asymmetric_keys/selftest.h
 create mode 100644 crypto/asymmetric_keys/selftest_ecdsa.c
 create mode 100644 crypto/asymmetric_keys/selftest_rsa.c

