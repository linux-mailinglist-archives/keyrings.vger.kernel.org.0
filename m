Return-Path: <keyrings+bounces-1913-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 036FD959BE9
	for <lists+keyrings@lfdr.de>; Wed, 21 Aug 2024 14:36:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AC7B01F215AD
	for <lists+keyrings@lfdr.de>; Wed, 21 Aug 2024 12:36:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AF9C166F04;
	Wed, 21 Aug 2024 12:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KDwgSiWE"
X-Original-To: keyrings@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11FEB1D12E1
	for <keyrings@vger.kernel.org>; Wed, 21 Aug 2024 12:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724243789; cv=none; b=ZQQBdXq4Mg5p053JNlRr5NsiEEEyio8JWHltW/5CXm5zM0BA74Xdx3P/qMMtjHgc4vkAGJlcsvmlfhcZGcsOsiGEQPRmMUY2khsWob21pT21PjuZQmQD73A0mxSD14p7yAeNTuv7bv/bw/ueZRA0HGaAl/jn0UJ3pQ0rmVotRXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724243789; c=relaxed/simple;
	bh=iPAgneh8d06fCeRW00UqhEOvyxYtOrl8jJrAAPmiQfQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dHCtUYrc8b50RPmSsQQyhSGNXY6mjf0cB3Xk4ru6IuNN3z4myyM4xxrfLqtgZyGGAOQNHzPUiEn74BXwXKNaepNzjMPSoMzjEEb1qmKdDhBESZKPaN8BwJNUpkXzi5NEuzRX0rbdReUCOcf5pWWax9d1fOD/dnTxoFjNOBSLGp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KDwgSiWE; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1724243787;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=vG/ZDsrU8oiDjbsJ4bObMRa3sGVEeffwvXpjidw8y40=;
	b=KDwgSiWEWL287zMtBs3Wrg7HrOXlYn+bMxCvh5srVOpwjKRIbG3pXOjVO8R17jpp0h3yB2
	ND5BtmpDHoiXDz+tqmXSBLl0MlULiX9vE4qAckdsTii18XpmUeJJ6E0sSxjWTSHXe2HzFv
	YoWt1BeK5ev7seBjdRch0sLM3XuBbBI=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-84-ZgwmLf_7Mhm2TVGlkD_0WA-1; Wed,
 21 Aug 2024 08:36:25 -0400
X-MC-Unique: ZgwmLf_7Mhm2TVGlkD_0WA-1
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 793C81955D54;
	Wed, 21 Aug 2024 12:36:24 +0000 (UTC)
Received: from warthog.procyon.org.uk.com (unknown [10.42.28.30])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id CC6F519560A3;
	Wed, 21 Aug 2024 12:36:22 +0000 (UTC)
From: David Howells <dhowells@redhat.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: David Howells <dhowells@redhat.com>,
	keyrings@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/7] keys: Add tracepoints
Date: Wed, 21 Aug 2024 13:36:08 +0100
Message-ID: <20240821123616.60401-1-dhowells@redhat.com>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

Hi Jarkko,

Here's a patch to add some tracepoints to keyrings to make it easier to
debug what's going on, plus a bunch of preliminary patches to move things
about a bit to make that easier.

The patches can also be found here:

	https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git/log/?h=keys-next

Thanks,
David

David Howells (7):
  keys: Out of line key_is_dead() so it can have tracepoints added in
  keys: Extract struct key_user to its own header for tracing purposes
  keys: Move key_get() out of line so a tracepoint can be added
  keys: Add a key_ref_get() wrapper
  keys: Use key_get() instead of __key_get()
  keys: Provide a key_try_get() function and use it
  keys: Add tracepoints for the keyrings facility

 Documentation/security/keys/core.rst |   1 -
 crypto/asymmetric_keys/restrict.c    |   6 +-
 include/keys/key_user.h              |  35 +++
 include/linux/key.h                  |  16 +-
 include/trace/events/key.h           | 401 +++++++++++++++++++++++++++
 security/keys/gc.c                   |   4 +
 security/keys/internal.h             |  41 +--
 security/keys/key.c                  |  70 ++++-
 security/keys/keyctl.c               |   2 +
 security/keys/keyring.c              |  45 ++-
 security/keys/process_keys.c         |  15 +-
 11 files changed, 566 insertions(+), 70 deletions(-)
 create mode 100644 include/keys/key_user.h
 create mode 100644 include/trace/events/key.h


