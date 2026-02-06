Return-Path: <keyrings+bounces-4022-lists+keyrings=lfdr.de@vger.kernel.org>
Delivered-To: lists+keyrings@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YHn3FbnthWlvIQQAu9opvQ
	(envelope-from <keyrings+bounces-4022-lists+keyrings=lfdr.de@vger.kernel.org>)
	for <lists+keyrings@lfdr.de>; Fri, 06 Feb 2026 14:33:45 +0100
X-Original-To: lists+keyrings@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A5485FE29C
	for <lists+keyrings@lfdr.de>; Fri, 06 Feb 2026 14:33:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 509DA301DBB7
	for <lists+keyrings@lfdr.de>; Fri,  6 Feb 2026 13:33:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDC9136EA91;
	Fri,  6 Feb 2026 13:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MGsqa6rf"
X-Original-To: keyrings@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B6BE3EBF0D
	for <keyrings@vger.kernel.org>; Fri,  6 Feb 2026 13:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770384822; cv=none; b=XAQnALAvwqoOGZbM4AcAUCX6dt3b8DyyDxFML39xK1xxdjdOd/rjVRPtze06K/Lx6a326rfJKB9NPU939pe8W5aYI6wy8vU8ClafQFW4vn7k3Lmjj7hzxLF6od3f2Q/xmGxthbdRKVL5ZvWm6vgurob4JSma5TnsB3lY63I4LL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770384822; c=relaxed/simple;
	bh=HcehPSlopdgQojZ7EQaumhfR5EFZxPZlRXdbXMpqorU=;
	h=From:To:cc:Subject:MIME-Version:Content-Type:Date:Message-ID; b=Cp42dO9LJEQtOhnFOh9Gt1eiadMcvh+1+G6iVVyjb2EJSSsHanSgr+6+DZJFxOs052KnnWwz7566UsjYrT56dwTYHC4MMWQsTWrS3vx3tkPVOG42j7llRpwmrDZHDngxWQLDbHZ6xqsCJMQ61Ufr+IAp6+uXkNA888KaQrQOQzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MGsqa6rf; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1770384821;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ZIZOCzqYxJiIRhnu2OUABj+ULNYXYuEc+snEBZA8w1U=;
	b=MGsqa6rf5bbTQkqg04A9ca+Ym7KH6rFW3z8a05sgoTsas4yGWn+mYCWn/yMSSOzza9qceJ
	5BF7h9YyfKnaUcOaqVd4yb0IYNtu6jVjz0j2GvqsXQz05LtI/rL1fhAdmFrydhzMPdf9+M
	kgtC2RF3lnAHYJC93MfqBVEJNGmowpU=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-621-gTW-smkLMLGhd854M3Plfw-1; Fri,
 06 Feb 2026 08:33:36 -0500
X-MC-Unique: gTW-smkLMLGhd854M3Plfw-1
X-Mimecast-MFC-AGG-ID: gTW-smkLMLGhd854M3Plfw_1770384814
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 968F41800639;
	Fri,  6 Feb 2026 13:33:33 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.44.33.164])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id AE448180057F;
	Fri,  6 Feb 2026 13:33:27 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
cc: dhowells@redhat.com, Lukas Wunner <lukas@wunner.de>,
    Ignat Korchagin <ignat@cloudflare.com>,
    Jarkko Sakkinen <jarkko@kernel.org>,
    Herbert Xu <herbert@gondor.apana.org.au>,
    Eric Biggers <ebiggers@kernel.org>,
    Luis Chamberlain <mcgrof@kernel.org>,
    Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@kernel.org>,
    Sami Tolvanen <samitolvanen@google.com>,
    "Jason A . Donenfeld" <Jason@zx2c4.com>,
    Ard Biesheuvel <ardb@kernel.org>,
    Stephan Mueller <smueller@chronox.de>, linux-crypto@vger.kernel.org,
    keyrings@vger.kernel.org, linux-modules@vger.kernel.org,
    linux-kernel@vger.kernel.org
Subject: [GIT PULL] x509, pkcs7: Add support for ML-DSA signatures
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <2977831.1770384806.1@warthog.procyon.org.uk>
Content-Transfer-Encoding: quoted-printable
Date: Fri, 06 Feb 2026 13:33:26 +0000
Message-ID: <2977832.1770384806@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-4022-lists,keyrings=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	DKIM_TRACE(0.00)[redhat.com:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dhowells@redhat.com,keyrings@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[keyrings];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,warthog.procyon.org.uk:mid]
X-Rspamd-Queue-Id: A5485FE29C
X-Rspamd-Action: no action

Hi Linus,

Could you pull this patchset in the upcoming merge window please?  It adds
support for ML-DSA signatures in X.509 certificates and PKCS#7/CMS
messages, thereby allowing this algorithm to be used for signing modules,
kexec'able binaries, wifi regulatory data, etc..

This requires OpenSSL-3.5 at a minimum and preferably OpenSSL-4 (so that i=
t
can avoid the use of CMS signedAttrs - but that version is not cut yet).
certs/Kconfig does a check to hide the signing options if OpenSSL does not
list the algorithm as being available.

Note that this is dependent on Eric Bigger's libcrypto (for the core ML-DS=
A
implementation) and would need to be pulled after that.

Note also that this has a conflict with the modules tree which has a patch
to unconditionally use the OpenSSL CMS_* API to generate signatures in
scripts/sign-file.c and to remove fallback use of the PKCS7_* API.  I've
added an illustrative merge at the top of my keys-pqc branch for reference
purposes.

The patches were last posted here:

	https://lore.kernel.org/r/20260202170216.2467036-1-dhowells@redhat.com/

Thanks,
David
---
The following changes since commit 959a634ebcda02e0add101024a5793323d66cda=
5:

  lib/crypto: mldsa: Add FIPS cryptographic algorithm self-test (2026-01-1=
2 11:07:50 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git tags=
/keys-next-20260206

for you to fetch changes up to 965e9a2cf23b066d8bdeb690dff9cd7089c5f667:

  pkcs7: Change a pr_warn() to pr_warn_once() (2026-02-05 15:44:00 +0000)

----------------------------------------------------------------
keys: Support for ML-DSA module signing

----------------------------------------------------------------
David Howells (8):
      crypto: Add ML-DSA crypto_sig support
      x509: Separately calculate sha256 for blacklist
      pkcs7, x509: Rename ->digest to ->m
      pkcs7: Allow the signing algo to do whatever digestion it wants itse=
lf
      pkcs7, x509: Add ML-DSA support
      modsign: Enable ML-DSA module signing
      pkcs7: Allow authenticatedAttributes for ML-DSA
      pkcs7: Change a pr_warn() to pr_warn_once()

 Documentation/admin-guide/module-signing.rst |  16 ++-
 certs/Kconfig                                |  40 ++++++
 certs/Makefile                               |   3 +
 crypto/Kconfig                               |   9 ++
 crypto/Makefile                              |   2 +
 crypto/asymmetric_keys/Kconfig               |  11 ++
 crypto/asymmetric_keys/asymmetric_type.c     |   4 +-
 crypto/asymmetric_keys/pkcs7_parser.c        |  36 ++++-
 crypto/asymmetric_keys/pkcs7_parser.h        |   3 +
 crypto/asymmetric_keys/pkcs7_verify.c        |  78 +++++++----
 crypto/asymmetric_keys/public_key.c          |  13 +-
 crypto/asymmetric_keys/signature.c           |   3 +-
 crypto/asymmetric_keys/x509_cert_parser.c    |  27 +++-
 crypto/asymmetric_keys/x509_parser.h         |   2 +
 crypto/asymmetric_keys/x509_public_key.c     |  42 ++++--
 crypto/mldsa.c                               | 201 ++++++++++++++++++++++=
+++++
 include/crypto/public_key.h                  |   6 +-
 include/linux/oid_registry.h                 |   5 +
 scripts/sign-file.c                          |  39 ++++--
 security/integrity/digsig_asymmetric.c       |   4 +-
 20 files changed, 473 insertions(+), 71 deletions(-)
 create mode 100644 crypto/mldsa.c


