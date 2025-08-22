Return-Path: <keyrings+bounces-2969-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D7C7DB31BC3
	for <lists+keyrings@lfdr.de>; Fri, 22 Aug 2025 16:35:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8B1E4B24871
	for <lists+keyrings@lfdr.de>; Fri, 22 Aug 2025 14:28:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22C693054DE;
	Fri, 22 Aug 2025 14:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RrTR3sPG"
X-Original-To: keyrings@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F79F308F0A
	for <keyrings@vger.kernel.org>; Fri, 22 Aug 2025 14:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755872545; cv=none; b=uXEA8Grx7v9kKFfTojiTKHOiqbyMlGWuksyG8ZgsZEeduXuWxHkY6RmBAWj9hnXmIuJPFtavniqQODYXBSAJGWeENH5Q1FPzGVYRzJBJFFJwqtQEVW2hiMjuqWTwrtLT5kSr2dOyKfEnEdV+ceY52JH6tmW80KYkaRGp0cPU+zU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755872545; c=relaxed/simple;
	bh=8ZVMFePCcmuvKN3zUl4JuagXydzmkex1k4x6NVYwros=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lwTRfinCvk2DQ9josEY50sHnAnYtPSipW/7MAAwk/LMTSBC7X1btpi7ZOG+YbKTQB3OfA2ygNjuMVsXRqFjMm+cbR/qF25EUgzT+7e0lNsKlvelSObPtCbBfqM1TryJPXO0r+n0B85wQ0cR0pQJLG5dEjyqx/tbUgxu8JRNXZZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RrTR3sPG; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755872542;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=cpjy/pUDUNyfo8e4gHCFPQR08+f7DODSHaC7gYdHggk=;
	b=RrTR3sPGqxFDUtLmO3MGNIhMa5KiKj9jZ3C4rWVPUpzU97cbUY3UaqXOyjCWnRg2B/5Os9
	PL9kGApFIeM1yPZmdI6KPfzk896+GLrr1cogqJCfP6cYwEKKBBzoVVtqd05sMavrnfdMNu
	695Oa1UuAS+ZXQ6+JN2pDLpLfkr2Gpg=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-361-MU3CQMfCMDOBfvOCF8rLKg-1; Fri,
 22 Aug 2025 10:22:20 -0400
X-MC-Unique: MU3CQMfCMDOBfvOCF8rLKg-1
X-Mimecast-MFC-AGG-ID: MU3CQMfCMDOBfvOCF8rLKg_1755872540
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id DB967195608E;
	Fri, 22 Aug 2025 14:22:19 +0000 (UTC)
Received: from warthog.procyon.org.com (unknown [10.42.28.132])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 9AF1A30001A1;
	Fri, 22 Aug 2025 14:22:18 +0000 (UTC)
From: David Howells <dhowells@redhat.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: David Howells <dhowells@redhat.com>,
	keyrings@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/7] keyutils: Add some fixes and updates
Date: Fri, 22 Aug 2025 15:22:07 +0100
Message-ID: <20250822142215.2475014-1-dhowells@redhat.com>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

Hi Jarkko,

Here are some patches that I'm proposing to add to keyutils:

 (1) Fix a couple of potential signed overflows in the library.

 (2) In request-key, fix the mishandling of the last line of the
     request-key.conf file if it doesn't have a newline at the end.

 (3) In the tests, hide the endianness of raw binary content (such as
     keyring content) by using od to byteswap it appropriately rather than
     trying to do this manually.

 (4) In the tests, add skips for unsupported features.

 (5) In request-key, add help text if "--help" is given or no parameters
     are given.

 (6) Add a simpler way to do configuration testing:

	request-key --check [-lnv] type desc [info] [op]

 (7) Add support for multiwildcard matching in request-key.conf.  This can
     be tested with:

	request-key --match [-v] pattern datum [datum...]

Apologies, some of these should have been committed a while ago.

David

David Howells (7):
  lib: Fix a couple of potential signed oveflows
  request-key: Fix mishandling of last line of config file
  test: Hide endianness
  tests: Add skips for testing of unsupported features
  request-key: Add help text
  request-key: Add a simpler debug test
  request-key: Support the promised multiwildcard matching

 keyutils.c                                |   5 +
 man/request-key.8                         |  85 +++-
 request-key.c                             | 504 ++++++++++++++++------
 tests/features/limits/runtest.sh          |   6 +
 tests/hex2bin.pl                          |  21 +
 tests/keyctl/id/bad-args/runtest.sh       |   6 +
 tests/keyctl/id/noargs/runtest.sh         |   6 +
 tests/keyctl/id/valid/runtest.sh          |   6 +
 tests/keyctl/move/bad-args/runtest.sh     |   6 +
 tests/keyctl/move/noargs/runtest.sh       |   6 +
 tests/keyctl/move/recursion/runtest.sh    |   6 +
 tests/keyctl/move/valid/runtest.sh        |   6 +
 tests/keyctl/reading/valid/runtest.sh     |   9 +-
 tests/keyctl/session/valid2/runtest.sh    |   6 +
 tests/keyctl/supports/bad-args/runtest.sh |   6 +
 tests/keyctl/supports/valid/runtest.sh    |   6 +
 tests/prepare.inc.sh                      |  23 +-
 tests/toolbox.inc.sh                      |  69 ++-
 18 files changed, 619 insertions(+), 163 deletions(-)
 create mode 100644 tests/hex2bin.pl


